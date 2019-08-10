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

package com.pa.support.colorpicker;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.RippleDrawable;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.SystemProperties;
import android.support.v7.preference.PreferenceViewHolder;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.util.Log;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.ImageView;
import android.widget.TextView;

import com.pa.support.R;
import com.pa.support.utils.PAUtils;

import java.util.Arrays;

public class ColorPickerPreference extends CustomDialogPreference {
    private static final String TAG = "ColorPickerPreference";
    private static final boolean DEBUG = true;
    private static final String KEY_CUSTOM_ACCENT_COLOR = "persist.sys.theme.accentcolor";
    private static final String KEY_LIGHT_INDEX = "persist.sys.theme.light.index";
    private static final String KEY_DARK_INDEX = "persist.sys.theme.dark.index";

    private String mColor;
    private Context mContext;
    private CustomColorClickListener mCustomColorClickListener;
    private String mDefaultColor;
    private String[] mDefaultColors;
    private ImageView mImageView;
    private TextView mMessage;
    private CharSequence mMessageText;
    private String[] mPalette;
    private int[] mPaletteNamesResIds;
    private String mTmpColor;
    private boolean mUseColorLabelAsSummary;
    private View[] mViews;
    private boolean mVisibility;
    private int mRippleEffectColor;
    private int mDisabledCellColor;

    public interface CustomColorClickListener {
        void onCustomColorClick();
    }

    private static class SavedState extends BaseSavedState {
        public static final Creator<SavedState> CREATOR = new Creator<SavedState>() {
            public SavedState createFromParcel(Parcel in) {
                return new SavedState(in);
            }

            public SavedState[] newArray(int size) {
                return new SavedState[size];
            }
        };
        String tmpColor;

        public SavedState(Parcel source) {
            super(source);
            try {
                tmpColor = source.readString();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        public SavedState(Parcelable superState) {
            super(superState);
        }

        @Override
        public void writeToParcel(Parcel dest, int flags) {
            super.writeToParcel(dest, flags);
            dest.writeString(tmpColor);
        }
    }

    private String toRGBString(int color) {
        Resources res = mContext.getResources();
        return "#" + res.getString(color).substring(3);
    }

    public ColorPickerPreference(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        if (DEBUG) Log.v(TAG, "Inside constructor");
        mDefaultColor = "";
        mVisibility = false;
        setLayoutResource(R.layout.colorpicker_preference);
        mContext = context;
        mDefaultColors = new String[]{
                toRGBString(R.color.primary_default_light),
                toRGBString(R.color.primary_default_dark)
        };
        //setNeutralButtonText(R.string.color_picker_default);
        setNegativeButtonText(R.string.cancel);
        setPositiveButtonText(R.string.ok);
        setDialogLayoutResource(R.layout.preference_dialog_colorpicker);
        if (getSummary() == null) {
            mUseColorLabelAsSummary = true;
        } else {
            mUseColorLabelAsSummary = false;
        }
        updateSummary();
    }

    public ColorPickerPreference(Context context, AttributeSet attrs, int defStyleAttr) {
        this(context, attrs, defStyleAttr, 0);
    }

    public ColorPickerPreference(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public ColorPickerPreference(Context context) {
        this(context, null);
    }

    @Override
    public void onBindViewHolder(PreferenceViewHolder view) {
        String showColor;
        super.onBindViewHolder(view);
        if (DEBUG) Log.v(TAG, "Inside onBindViewHolder");
        view.setDividerAllowedBelow(false);
        view.setDividerAllowedAbove(false);
        mImageView = (ImageView) view.findViewById(R.id.secondary_icon);
        if (mImageView != null) {
            Drawable drawable = mImageView.getDrawable();
            if (mColor == null || TextUtils.isEmpty(mColor)) {
                showColor = mDefaultColor;
            } else {
                showColor = mColor;
            }
            if (!TextUtils.isEmpty(showColor)) {
                mImageView.setImageTintList(ColorStateList.valueOf(PAUtils.parseColor(showColor)));
            }
            if (mVisibility) {
                mImageView.setVisibility(View.VISIBLE);
            }
        }
    }

    public void setImageViewVisibility() {
        mVisibility = true;
    }

    public void setMessage(CharSequence message) {
        mMessage.setText(message);
    }

    public void setMessage(int messageResId) {
        mMessage.setText(getContext().getString(messageResId));
    }

    public void setMessageText(CharSequence message) {
        mMessageText = message;
    }

    public void setMessageText(int messageResId) {
        mMessageText = getContext().getString(messageResId);
    }

    public void init() {
        if (DEBUG) Log.v(TAG, "Inside init()");
        mColor = SystemProperties.get(KEY_CUSTOM_ACCENT_COLOR);
        if (!TextUtils.isEmpty(mColor))
            mColor = "#" + mColor;
        mTmpColor = mColor;
        updateSummary();
        setSelection(mTmpColor, 0);
    }

    public void setColor(String color) {
        if (DEBUG) Log.v(TAG, "Inside setColor");
        String showColor;
        mColor = color;
        updateSummary();
        if (callChangeListener(mColor)) {
            onSetColor(mColor);
        }
        if (mImageView != null) {
            Drawable drawable = mImageView.getDrawable();
            if (mColor == null || TextUtils.isEmpty(mColor)) {
                showColor = mDefaultColor;
            } else {
                showColor = color;
            }
            mImageView.setImageTintList(ColorStateList.valueOf(PAUtils.parseColor(showColor)));
        }
        persistString(color);
    }

    public String getColor() {
        return mColor != null ? mColor : getPersistedString(getDefaultColor());
    }

    public void setDefaultColor(String color) {
        mDefaultColor = color;
    }

    public String getDefaultColor() {
        return mDefaultColor;
    }

    public void setColorPalette(String[] colors, int[] colorStringResIds) {
        mPalette = colors;
        mPaletteNamesResIds = colorStringResIds;
    }

    public void setColorPalette(String[] colors) {
        mPalette = colors;
    }

    public RippleDrawable createRippleDrawable(String color) {
        return new RippleDrawable(
                new ColorStateList(new int[][]{new int[0]}, new int[]{mRippleEffectColor}),
                new ColorDrawable(TextUtils.isEmpty(color)
                        ? mDisabledCellColor : PAUtils.parseColor(color)), null);
    }

    public void setSelection(String color, int visibility) {
        if (DEBUG) Log.v(TAG, "Inside setSelection");
        if (color != null) {
            int index = mPalette == null ? -1 : Arrays.asList(mPalette).indexOf(color);
            if (index == -1) {
                if (PAUtils.isUsingLightTheme(mContext.getContentResolver())) {
                    index = SystemProperties.getInt(KEY_LIGHT_INDEX, 0);
                } else if (PAUtils.isUsingBlackTheme(mContext.getContentResolver())
                        || PAUtils.isUsingDarkTheme(mContext.getContentResolver())) {
                    index = SystemProperties.getInt(KEY_DARK_INDEX, 0);
                }
            }
            int[] ids = {R.id.check_0, R.id.check_1, R.id.check_2, R.id.check_3, R.id.check_4,
                    R.id.check_5, R.id.check_6, R.id.check_7, R.id.check_8, R.id.check_9,
                    R.id.check_10, R.id.check_11};
            if (index >= 0) {
                mViews[index].findViewById(ids[index]).setVisibility(visibility);
                if (PAUtils.isUsingLightTheme(mContext.getContentResolver()))
                    SystemProperties.set(KEY_LIGHT_INDEX, String.valueOf(index));
                else if (PAUtils.isUsingBlackTheme(mContext.getContentResolver())
                        || PAUtils.isUsingDarkTheme(mContext.getContentResolver()))
                    SystemProperties.set(KEY_DARK_INDEX, String.valueOf(index));
            } else {
                mViews[ids.length - 1].findViewById(ids[ids.length - 1]).setVisibility(View.GONE);
            }
        }
    }

    public void onSetColor(String color) {
    }

    public void onSetColorPalette(String[] colors) {
    }

    @Override
    public void setEnabled(boolean enabled) {
        super.setEnabled(enabled);
    }

    @Override
    public void onBindDialogView(View view) {
        super.onBindDialogView(view);
        if (DEBUG) Log.v(TAG, "Inside onBindDialogView");
        onSetColorPalette(mPalette);
        updateSummary();
        int paletteLength = mPalette.length;
        if (paletteLength != 0 && paletteLength <= 4) {
            view.findViewById(R.id.colors_row_2).setVisibility(View.GONE);
        }
        int[] ids = {R.id.color_0, R.id.color_1, R.id.color_2, R.id.color_3, R.id.color_4,
                R.id.color_5, R.id.color_6, R.id.color_7, R.id.color_8, R.id.color_9,
                R.id.color_10, R.id.color_11};
        mViews = new View[mPalette.length];
        for (int i = 0; i < mPalette.length; i++) {
            mViews[i] = view.findViewById(ids[i]);
            if (i == 11) {
                int index;
                if (PAUtils.isUsingLightTheme(mContext.getContentResolver())) {
                    index = SystemProperties.getInt(KEY_LIGHT_INDEX, 0);
                } else {
                    index = SystemProperties.getInt(KEY_DARK_INDEX, 0);
                }
                String customColor = "";
                if (index == 11) {
                    customColor = SystemProperties.get(KEY_CUSTOM_ACCENT_COLOR);
                }
                if (!TextUtils.isEmpty(customColor)) {
                    customColor = "#" + customColor;
                    mViews[i].setBackground(createRippleDrawable(customColor));
                } else {
                    mViews[i].setBackgroundResource(R.drawable.custom_color_default_bg);
                }
            } else {
                mViews[i].setBackground(createRippleDrawable(mPalette[i]));
            }
            mViews[i].setTag(Integer.valueOf(i));
            mViews[i].setOnClickListener(paletteLength > 0 ? new OnClickListener() {
                @Override
                public void onClick(View v) {
                    int index = ((Integer) v.getTag()).intValue();
                    if (!mPalette[index].equals(mTmpColor) || index == 11) {
                        setSelection(mTmpColor, View.GONE);
                        setTmpColor(mPalette[index]);
                    }
                    if (index == 11 && mCustomColorClickListener != null) {
                        mCustomColorClickListener.onCustomColorClick();
                    }
                }
            } : null);
        }
        mMessage = view.findViewById(R.id.message);
        if (mMessageText != null) {
            setMessage(mMessageText);
        } else {
            setMessage(R.string.color_picker_message_default);
        }
        init();
    }

    public void setCustomBgColor(String bgColor) {
        if (mViews != null && mViews.length >= 12) {
            View customView = mViews[11];
            if (!TextUtils.isEmpty(bgColor) && !bgColor.contains("#")) {
                StringBuilder sb = new StringBuilder();
                sb.append("#");
                sb.append(bgColor);
                bgColor = sb.toString();
            }
            if (customView != null) {
                customView.setBackground(createRippleDrawable(bgColor));
            }
        }
    }

    @Override
    public void onDialogClosed(int whichButton) {
        super.onDialogClosed(whichButton);
        if (DEBUG) Log.v(TAG, "Inside onDialogClosed");
        boolean equal = false;
        boolean positiveResult = whichButton == -1;
        boolean negativeResult = whichButton == -2;
        boolean defaultResult = whichButton == -3;
        if (positiveResult) {
            String lastColor = SystemProperties.get(KEY_CUSTOM_ACCENT_COLOR);
            if (!TextUtils.isEmpty(lastColor))
                lastColor = "#" + lastColor;
            if (TextUtils.isEmpty(lastColor) || ((lastColor != null && !lastColor.equals(mTmpColor))
                    || (lastColor != null && !lastColor.equals(mColor)))) {
                equal = true;
            }
            if (equal) {
                setColor(mTmpColor);
            }
        } else if (negativeResult) {
            mColor = SystemProperties.get(KEY_CUSTOM_ACCENT_COLOR);
            if (!TextUtils.isEmpty(mColor))
                mColor = "#" + mColor;
            updateSummary();
        } else if (defaultResult) {
            if ((mColor == null && mDefaultColor == null)
                    || (mColor != null && mColor.equals(mDefaultColor))) {
                equal = true;
            }
            if (!equal) {
                setColor(mDefaultColor);
            }
        }
    }

    @Override
    public void onSetInitialValue(boolean restoreValue, Object defaultValue) {
        setColor(restoreValue ? getPersistedString(mDefaultColor) : (String) defaultValue);
    }

    @Override
    public Parcelable onSaveInstanceState() {
        Parcelable superState = super.onSaveInstanceState();
        if (mTmpColor == null) {
            return superState;
        }
        SavedState myState = new SavedState(superState);
        myState.tmpColor = mTmpColor;
        return myState;
    }

    @Override
    public void onRestoreInstanceState(Parcelable state) {
        if (state == null || !state.getClass().equals(SavedState.class)) {
            super.onRestoreInstanceState(state);
            return;
        }
        SavedState myState = (SavedState) state;
        super.onRestoreInstanceState(myState.getSuperState());
        if (!myState.tmpColor.equals(mTmpColor) && mViews != null) {
            setSelection(mTmpColor, 8);
            setTmpColor(myState.tmpColor);
        }
    }

    public void setTmpColor(String color) {
        mTmpColor = color;
        setSelection(mTmpColor, 0);
    }

    private void updateSummary() {
        if (DEBUG) Log.v(TAG, "Inside updateSummary");
        if (mUseColorLabelAsSummary || (mPaletteNamesResIds != null && mPaletteNamesResIds.length >= 0)) {
            int index = mPalette == null ? -1 : Arrays.asList(mPalette).indexOf(mColor);
            if (index == -1) {
                if (PAUtils.isUsingLightTheme(mContext.getContentResolver())) {
                    index = SystemProperties.getInt(KEY_LIGHT_INDEX, 0);
                } else if (PAUtils.isUsingBlackTheme(mContext.getContentResolver())
                        || PAUtils.isUsingDarkTheme(mContext.getContentResolver())) {
                    index = SystemProperties.getInt(KEY_DARK_INDEX, 0);
                }
            }
            if (mPaletteNamesResIds != null && index >= 0 && index < mPaletteNamesResIds.length) {
                setSummary(getContext().getString(mPaletteNamesResIds[index]));
            } else if (mColor != null && !mColor.equals(mDefaultColor) && !TextUtils.isEmpty(mColor)
                    && !isDefaultColor()) {
                setSummary(getContext().getString(R.string.color_picker_unknown_label));
            }
        }
    }

    private boolean isDefaultColor() {
        for (String equals : mDefaultColors) {
            if (equals.equals(mColor)) {
                return true;
            }
        }
        return false;
    }

    public void setCustomColorClickListener(CustomColorClickListener listener) {
        mCustomColorClickListener = listener;
    }
}
