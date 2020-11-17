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

package co.aospa.device

import android.content.Context
import android.database.ContentObserver
import android.os.Handler
import android.os.Looper
import android.os.SystemProperties
import android.os.UserHandle.USER_CURRENT
import android.os.Vibrator
import android.os.VibrationEffect
import android.provider.Settings
import android.view.KeyEvent

import com.android.internal.os.DeviceKeyHandler

import co.aospa.device.R
import co.aospa.device.actions.AuxiliaryActionType
import co.aospa.device.extensions.systemService

class AuxiliaryKeyHandler(private val context: Context) : DeviceKeyHandler {

    private val resources = context.packageManager.getResourcesForApplication("co.aospa.device")
    private val vibrator: Vibrator = context.systemService()

    private val auxKeyCode = resources.getInteger(R.integer.config_auxiliaryButtonKey)
    private val auxiliaryActionType = AuxiliaryActionType(context)

    private var isDeviceBooted = false
    private var isHeld = false
    private var selectedAction = getSelectedAction()

    init {
        val setting = Settings.System.getUriFor(Settings.System.AUX_BUTTON)
        val observer = object : ContentObserver(Handler(Looper.getMainLooper())) {
            override fun onChange(selfChange: Boolean) {
                selectedAction = getSelectedAction()
            }

            override fun deliverSelfNotifications(): Boolean = true
        }

        context.contentResolver.registerContentObserver(setting, false, observer)
    }

    override fun handleKeyEvent(event: KeyEvent): KeyEvent? {
        if (!isDeviceBooted) {
            isDeviceBooted = SystemProperties.getBoolean("sys.boot_completed", false)
            return event
        }

        if (event.repeatCount > 0 && !isHeld) {
            doHapticFeedback(VibrationEffect.EFFECT_POP)
            isHeld = true
        }

        if (event.action != KeyEvent.ACTION_UP) return event

        return when (event.scanCode) {
            auxKeyCode -> {
                auxiliaryActionType.getAction(selectedAction)?.invoke(isHeld)
                isHeld = false
                null
            }
            else -> {
                isHeld = false
                event
            }
        }
    }

    private fun doHapticFeedback(effect: Int) {
        if (vibrator.hasVibrator()) vibrator.vibrate(VibrationEffect.get(effect))
    }

    private fun getSelectedAction(): Int = Settings.System.getIntForUser(
        context.contentResolver,
        Settings.System.AUX_BUTTON,
        USER_CURRENT
    )
}
