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
import android.os.Vibrator
import android.os.VibrationEffect

import co.aospa.device.extensions.systemService

abstract class AuxiliaryAction(context: Context) {

    private val vibrator: Vibrator = context.systemService()

    abstract fun invoke(isHeld: Boolean = false)

    fun doHapticFeedback(effect: Int) {
        if (vibrator.hasVibrator()) vibrator.vibrate(VibrationEffect.get(effect))
    }
}
