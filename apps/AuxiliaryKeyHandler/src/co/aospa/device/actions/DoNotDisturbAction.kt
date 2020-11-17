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

package co.aospa.device.actions

import android.app.NotificationManager
import android.content.Context
import android.os.VibrationEffect
import android.provider.Settings

import co.aospa.device.extensions.systemService

class DoNotDisturbAction(private val context: Context) : AuxiliaryAction(context) {

    private val notificationManager: NotificationManager = context.systemService()

    override fun invoke(isHeld: Boolean) {
        val doNotDisturb = Settings.Global.getInt(context.contentResolver, Settings.Global.ZEN_MODE, -1)

        when (doNotDisturb) {
            Settings.Global.ZEN_MODE_OFF -> notificationManager.setZenMode(
                if (isHeld) Settings.Global.ZEN_MODE_NO_INTERRUPTIONS
                else Settings.Global.ZEN_MODE_IMPORTANT_INTERRUPTIONS,
                null,
                null
            )
            else -> {
                notificationManager.setZenMode(
                    Settings.Global.ZEN_MODE_OFF,
                    null,
                    null
                )
                doHapticFeedback(VibrationEffect.EFFECT_POP)
            }
        }
    }
}
