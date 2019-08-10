/*
 * Copyright (C) 2019 The Paranoid Android Project
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
 * limitations under the License
 */

package com.pa.support.utils;

import android.content.ContentResolver;
import android.graphics.Color;
import android.provider.Settings;
import android.text.TextUtils;

import static android.provider.Settings.Secure.CURRENT_SYSTEM_THEME;

public class PAUtils {
    public static final String TAG = "PAUtils";

    public static boolean isUsingDarkTheme(ContentResolver contentResolver) {
        return Settings.Secure.getInt(contentResolver, CURRENT_SYSTEM_THEME,
                0) == Settings.Secure.CURRENT_SYSTEM_THEME_DARK;
    }

    public static boolean isUsingBlackTheme(ContentResolver contentResolver) {
        return Settings.Secure.getInt(contentResolver, CURRENT_SYSTEM_THEME,
                0) == Settings.Secure.CURRENT_SYSTEM_THEME_BLACK;
    }

    public static boolean isUsingLightTheme(ContentResolver contentResolver) {
        return Settings.Secure.getInt(contentResolver, CURRENT_SYSTEM_THEME,
                0) == Settings.Secure.CURRENT_SYSTEM_THEME_LIGHT;
    }

    public static int parseColor(String color) {
        if (!TextUtils.isEmpty(color) && !color.contains("#")) {
            StringBuilder sb = new StringBuilder();
            sb.append("#");
            sb.append(color);
            color = sb.toString();
        }
        return Color.parseColor(color);
    }
}
