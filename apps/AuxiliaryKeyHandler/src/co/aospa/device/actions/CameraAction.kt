/*
 * Copyright 2020, Paranoid Android
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

package co.aospa.device.actions

import android.app.StatusBarManager
import android.content.Context
import android.os.PowerManager
import android.os.SystemClock

import com.android.server.LocalServices
import com.android.server.statusbar.StatusBarManagerInternal

import co.aospa.device.extensions.systemService

class CameraAction(private val context: Context) : AuxiliaryAction(context) {

    private val powerManager: PowerManager = context.systemService()
    private val statusBarManager = LocalServices.getService(StatusBarManagerInternal::class.java)

    override fun invoke(isHeld: Boolean) {
        synchronized(this) {
            powerManager.wakeUp(
                SystemClock.uptimeMillis(),
                PowerManager.WAKE_REASON_CAMERA_LAUNCH,
                null
            )
        }

        statusBarManager.onCameraLaunchGestureDetected(StatusBarManager.CAMERA_LAUNCH_SOURCE_POWER_DOUBLE_TAP)
    }
}
