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

package co.aospa.device.content.provider

import android.content.ContentProvider
import android.content.ContentValues
import android.database.Cursor
import android.net.Uri
import android.os.Bundle
import android.os.UserHandle.USER_CURRENT
import android.provider.Settings

import co.aospa.device.R
import co.aospa.framework.device.actions.AuxiliaryKeyHandlerActions

class AuxiliaryKeyHandlerProvider : ContentProvider() {
    override fun call(method: String, arg: String?, extras: Bundle?): Bundle {
        val bundle = Bundle()
        val context = requireContext()
        val setting = try {
            Settings.System.getIntForUser(
                context.contentResolver,
                Settings.System.AUX_BUTTON,
                USER_CURRENT
            )
        } catch (e: Exception) {
            -1
        }

        when (method) {
            LABEL -> bundle.putString("com.android.settings.summary", when (setting) {
                AuxiliaryKeyHandlerActions.ACTION_ASSIST -> context.getText(R.string.aux_button_assist_title)
                AuxiliaryKeyHandlerActions.ACTION_CAMERA -> context.getText(R.string.aux_button_camera_title)
                AuxiliaryKeyHandlerActions.ACTION_TORCH -> context.getText(R.string.aux_button_torch_title)
                AuxiliaryKeyHandlerActions.ACTION_DND -> context.getText(R.string.aux_button_dnd_title)
                AuxiliaryKeyHandlerActions.ACTION_RINGER -> context.getText(R.string.aux_button_ringer_title)
                else -> context.getText(R.string.aux_button_none_title)
            }.toString())
        }

        return bundle
    }

    override fun onCreate(): Boolean = true
    override fun query(
        uri: Uri,
        projection: Array<out String>?,
        selection: String?,
        selectionArgs: Array<out String>?,
        sortOrder: String?
    ): Cursor =
        throw UnsupportedOperationException()
    override fun getType(uri: Uri): String =
        throw UnsupportedOperationException()
    override fun insert(uri: Uri, values: ContentValues?): Uri =
        throw UnsupportedOperationException()
    override fun delete(uri: Uri, selection: String?, selectionArgs: Array<out String>?): Int =
        throw UnsupportedOperationException()
    override fun update(uri: Uri, values: ContentValues?, selection: String?, selectionArgs: Array<out String>?): Int =
        throw UnsupportedOperationException()

    companion object {
        private const val LABEL = "label"
    }
}
