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

package co.aospa.device.ui.fragment

import android.content.pm.PackageManager
import android.os.Bundle
import android.os.UserHandle.USER_CURRENT
import android.provider.Settings

import androidx.preference.Preference
import androidx.preference.PreferenceFragmentCompat
import androidx.preference.PreferenceScreen

import co.aospa.device.R
import co.aospa.device.ui.widget.RadioButtonPreference
import co.aospa.framework.device.actions.AuxiliaryKeyHandlerActions


class AuxiliaryKeySettingsFragment : PreferenceFragmentCompat(), Preference.OnPreferenceClickListener {

    private val radioPrefs = mutableListOf<RadioButtonPreference>()

    override fun onCreatePreferences(savedInstanceState: Bundle?, rootKey: String?) {
        addRadioPreferences()
        preferenceScreen = createPreferences()
    }

    private fun createPreferences(): PreferenceScreen {
        return preferenceManager.createPreferenceScreen(activity).apply {
            radioPrefs.map(this::addPreference)
            update()
        }
    }

    private fun createRadioPreference(title: CharSequence, summary: CharSequence?, key: String) =
        RadioButtonPreference(requireContext()).apply {
            this.title = title
            this.summary = summary
            this.key = key
            onPreferenceClickListener = this@AuxiliaryKeySettingsFragment
        }

    override fun onPreferenceClick(pref: Preference): Boolean {
        setDefaultKey(pref.key)
        update()

        return false
    }

    private fun hasFlash(): Boolean =
        requireContext().packageManager.hasSystemFeature(PackageManager.FEATURE_CAMERA_FLASH)

    private fun addRadioPreferences() {
        val context = requireContext()
        radioPrefs += createRadioPreference(
            context.getText(R.string.aux_button_ringer_title),
            context.getText(R.string.aux_button_ringer_summary),
            KEY_AUX_RINGER
        )
        radioPrefs += createRadioPreference(
            context.getText(R.string.aux_button_dnd_title),
            context.getText(R.string.aux_button_dnd_summary),
            KEY_AUX_DND
        )
        radioPrefs += createRadioPreference(
            context.getText(R.string.aux_button_assist_title),
            context.getText(R.string.aux_button_assist_summary),
            KEY_AUX_ASSIST
        )
        if (hasFlash()) radioPrefs += createRadioPreference(
            context.getText(R.string.aux_button_torch_title),
            context.getText(R.string.aux_button_torch_summary),
            KEY_AUX_TORCH
        )
        radioPrefs += createRadioPreference(
            context.getText(R.string.aux_button_camera_title),
            context.getText(R.string.aux_button_camera_summary),
            KEY_AUX_CAMERA
        )
        radioPrefs += createRadioPreference(
            context.getText(R.string.aux_button_none_title),
            null,
            KEY_AUX_NONE
        )
    }

    private fun setDefaultKey(key: String) {
        val setting = when (key) {
            KEY_AUX_ASSIST -> AuxiliaryKeyHandlerActions.ACTION_ASSIST
            KEY_AUX_CAMERA -> AuxiliaryKeyHandlerActions.ACTION_CAMERA
            KEY_AUX_TORCH -> AuxiliaryKeyHandlerActions.ACTION_TORCH
            KEY_AUX_DND -> AuxiliaryKeyHandlerActions.ACTION_DND
            KEY_AUX_RINGER -> AuxiliaryKeyHandlerActions.ACTION_RINGER
            else -> -1
        }

        Settings.System.putIntForUser(
            requireContext().contentResolver,
            Settings.System.AUX_BUTTON,
            setting,
            USER_CURRENT
        )
    }

    private fun getDefaultKey(): String {
        val setting = try {
            Settings.System.getIntForUser(
                requireContext().contentResolver,
                Settings.System.AUX_BUTTON,
                USER_CURRENT
            )
        } catch (e: Exception) {
            -1
        }

        return when (setting) {
            AuxiliaryKeyHandlerActions.ACTION_ASSIST -> KEY_AUX_ASSIST
            AuxiliaryKeyHandlerActions.ACTION_CAMERA -> KEY_AUX_CAMERA
            AuxiliaryKeyHandlerActions.ACTION_TORCH -> KEY_AUX_TORCH
            AuxiliaryKeyHandlerActions.ACTION_DND -> KEY_AUX_DND
            AuxiliaryKeyHandlerActions.ACTION_RINGER -> KEY_AUX_RINGER
            else -> KEY_AUX_NONE
        }
    }

    private fun update() {
        for (radioPref in radioPrefs) {
            val checked = getDefaultKey() == radioPref.key
            if (radioPref.isChecked != checked) radioPref.isChecked = checked
        }
    }

    companion object {
        private const val KEY_AUX_NONE = "aux_none"
        private const val KEY_AUX_ASSIST = "aux_assist"
        private const val KEY_AUX_CAMERA = "aux_camera"
        private const val KEY_AUX_TORCH = "aux_torch"
        private const val KEY_AUX_DND = "aux_dnd"
        private const val KEY_AUX_RINGER = "aux_ringer"
    }
}