/*
 * Copyright (C) 2020 Paranoid Android
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package co.aospa.device.utils

import android.content.Context
import android.content.pm.PackageManager
import android.hardware.camera2.CameraCharacteristics
import android.hardware.camera2.CameraManager

import co.aospa.device.extensions.systemService

class FlashUtils(private val context: Context) : CameraManager.TorchCallback() {

    private var isOn = false
    private var isAvailable = false
    private var camera: String? = null

    private val cameraManager: CameraManager = context.systemService()

    init {
        if (hasFlash()) {
            cameraManager.registerTorchCallback(this, null)
            val ids = cameraManager.getCameraIdList()

            for (id in ids) {
                val c = cameraManager.getCameraCharacteristics(id)
                val flashAvailable = c.get(CameraCharacteristics.FLASH_INFO_AVAILABLE)
                val lensFacing = c.get(CameraCharacteristics.LENS_FACING)

                if (
                    flashAvailable == true &&
                    lensFacing == CameraCharacteristics.LENS_FACING_BACK
                ) {
                    camera = id
                    break
                }
            }
        }
    }

    fun toggleFlash() {
        if (isAvailable && camera != null) synchronized(this) {
            try {
                isOn = !isOn
                cameraManager.setTorchMode(camera, isOn)
            } catch (e: Exception) { /* no-op */ }
        }
    }

    fun hasFlash(): Boolean = context.packageManager.hasSystemFeature(PackageManager.FEATURE_CAMERA_FLASH)

    override fun onTorchModeUnavailable(cameraId: String) {
        if (camera == cameraId) {
            isAvailable = false
            isOn = false
        }
    }

    override fun onTorchModeChanged(cameraId: String, enabled: Boolean) {
        if (camera == cameraId) {
            isAvailable = true
            isOn = enabled
        }
    }
}
