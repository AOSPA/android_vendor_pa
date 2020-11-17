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

import android.content.Context
import android.media.AudioManager
import android.os.Vibrator
import android.os.VibrationEffect

import co.aospa.device.extensions.systemService

class RingerAction(private val context: Context) : AuxiliaryAction(context) {

    private val audioManager: AudioManager = context.systemService()

    override fun invoke(isHeld: Boolean) {
        return when (audioManager.ringerModeInternal) {
            AudioManager.RINGER_MODE_NORMAL -> {
                doHapticFeedback(VibrationEffect.EFFECT_DOUBLE_CLICK)
                audioManager.setRingerModeInternal(AudioManager.RINGER_MODE_VIBRATE)
            }
            AudioManager.RINGER_MODE_VIBRATE -> {
                doHapticFeedback(VibrationEffect.EFFECT_THUD)
                audioManager.setRingerModeInternal(AudioManager.RINGER_MODE_SILENT)
            }
            AudioManager.RINGER_MODE_SILENT -> {
                doHapticFeedback(VibrationEffect.EFFECT_POP)
                audioManager.setRingerModeInternal(AudioManager.RINGER_MODE_NORMAL)
            }
            else -> Unit
        }
    }
}
