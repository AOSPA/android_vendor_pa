/*
 * Copyright (C) 2016 The CyanogenMod project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.pa.support.preference;

import android.content.Context;
import android.provider.Settings;
import android.support.v7.preference.ListPreference;
import android.util.AttributeSet;

public class SecureSettingListPreference extends ListPreference {
    public SecureSettingListPreference(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
    }

    public SecureSettingListPreference(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    @Override
    protected boolean persistString(String value) {
        if (shouldPersist()) {
            if (value == getPersistedString(null)) {
                // It's already there, so the same as persisting
                return true;
            }
            Settings.Secure.putString(getContext().getContentResolver(), getKey(), value);
            return true;
        }
        return false;
    }

    @Override
    protected String getPersistedString(String defaultReturnValue) {
        if (!shouldPersist()) {
            return defaultReturnValue;
        }
        String value = Settings.Secure.getString(getContext().getContentResolver(), getKey());
        return value == null ? defaultReturnValue : value;
    }

    @Override
    protected boolean isPersisted() {
        return Settings.Secure.getString(getContext().getContentResolver(), getKey()) != null;
    }

    public int getIntValue(int defValue) {
        return getValue() == null ? defValue : Integer.valueOf(getValue());
    }
}
