/*
 * Copyright (C) 2019 Paranoid Android Project
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

import android.app.AlertDialog.Builder;
import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.DialogInterface.OnDismissListener;
import android.content.res.TypedArray;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.support.v7.preference.Preference;
import android.util.AttributeSet;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;

import com.pa.support.R;

public abstract class CustomDialogPreference extends Preference
        implements OnClickListener, OnDismissListener {
    private static final String TAG = "CustomDialogPreference";
    private static final boolean DEBUG = true;

    private Builder mBuilder;
    private Dialog mDialog;
    private int mDialogLayoutResId;
    private CharSequence mNegativeButtonText;
    private CharSequence mNeutralButtonText;
    private CharSequence mPositiveButtonText;
    private int mWhichButtonClicked;

    private static class SavedState extends BaseSavedState {
        Bundle dialogBundle;
        boolean isDialogShowing;

        public SavedState(Parcel source) {
            super(source);
            isDialogShowing = source.readInt() == 1;
            dialogBundle = source.readBundle(CustomDialogPreference.class.getClassLoader());
        }

        @Override
        public void writeToParcel(Parcel dest, int flags) {
            super.writeToParcel(dest, flags);
            dest.writeInt(isDialogShowing ? 1 : 0);
            dest.writeBundle(dialogBundle);
        }

        public SavedState(Parcelable superState) {
            super(superState);
        }

        public static final Parcelable.Creator<SavedState> CREATOR =
                new Parcelable.Creator<SavedState>() {
                    @Override
                    public SavedState createFromParcel(Parcel in) {
                        return new SavedState(in);
                    }

                    @Override
                    public SavedState[] newArray(int size) {
                        return new SavedState[size];
                    }
                };
    }

    public CustomDialogPreference(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        if (DEBUG) Log.v(TAG, "Inside constructor 1");
        TypedArray a = context.obtainStyledAttributes(
                attrs, R.styleable.DialogPreference, defStyleAttr, defStyleRes);
        mPositiveButtonText = a.getString(R.styleable.DialogPreference_positiveButtonText);
        mNegativeButtonText = a.getString(R.styleable.DialogPreference_negativeButtonText);
        mDialogLayoutResId = a.getResourceId(R.styleable.DialogPreference_dialogLayout, mDialogLayoutResId);
        a.recycle();
    }

    public CustomDialogPreference(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
    }

    public CustomDialogPreference(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public CustomDialogPreference(Context context) {
        super(context);
    }

    public void setPositiveButtonText(CharSequence positiveButtonText) {
        mPositiveButtonText = positiveButtonText;
    }

    public void setPositiveButtonText(int positiveButtonTextResId) {
        setPositiveButtonText((CharSequence) getContext().getString(positiveButtonTextResId));
    }

    public CharSequence getPositiveButtonText() {
        return mPositiveButtonText;
    }

    public void setNegativeButtonText(CharSequence negativeButtonText) {
        mNegativeButtonText = negativeButtonText;
    }

    public void setNegativeButtonText(int negativeButtonTextResId) {
        setNegativeButtonText((CharSequence) getContext().getString(negativeButtonTextResId));
    }

    public CharSequence getNegativeButtonText() {
        return mNegativeButtonText;
    }

    public void setNeutralButtonText(CharSequence neutralButtonText) {
        mNeutralButtonText = neutralButtonText;
    }

    public void setNeutralButtonText(int neutralButtonTextResId) {
        setNeutralButtonText((CharSequence) getContext().getString(neutralButtonTextResId));
    }

    public CharSequence getNeutralButtonText() {
        return mNeutralButtonText;
    }

    public void setDialogLayoutResource(int dialogLayoutResId) {
        mDialogLayoutResId = dialogLayoutResId;
    }

    public int getDialogLayoutResource() {
        return mDialogLayoutResId;
    }

    public void onPrepareDialogBuilder(Builder builder) {
    }

    @Override
    protected void onClick() {
        if (mDialog == null || !mDialog.isShowing()) {
            showDialog(null);
        }
    }

    protected void showDialog(Bundle state) {
        if (DEBUG) Log.v(TAG, "Inside showDialog");
        Context context = getContext();
        mWhichButtonClicked = DialogInterface.BUTTON_NEGATIVE;
        mBuilder = new Builder(context);
        if (mPositiveButtonText != null) {
            mBuilder.setPositiveButton(mPositiveButtonText, this);
        }
        if (mNegativeButtonText != null) {
            mBuilder.setNegativeButton(mNegativeButtonText, this);
        }
        if (mNeutralButtonText != null) {
            mBuilder.setNeutralButton(mNeutralButtonText, this);
        }
        View contentView = onCreateDialogView();
        if (contentView != null) {
            onBindDialogView(contentView);
            mBuilder.setView(contentView);
        }
        onPrepareDialogBuilder(mBuilder);
        Dialog dialog = mBuilder.create();
        mDialog = dialog;
        if (state != null) {
            dialog.onRestoreInstanceState(state);
        }
        dialog.setOnDismissListener(this);
        dialog.show();
    }

    protected View onCreateDialogView() {
        if (mDialogLayoutResId == 0) {
            return null;
        }
        return LayoutInflater.from(mBuilder.getContext()).inflate(mDialogLayoutResId, null);
    }

    public void onBindDialogView(View view) {
    }

    public void onClick(DialogInterface dialog, int which) {
        mWhichButtonClicked = which;
    }

    public void onDismiss(DialogInterface dialog) {
        mDialog = null;
        onDialogClosed(mWhichButtonClicked);
    }

    public void onDialogClosed(int whichButton) {
    }

    public Dialog getDialog() {
        return mDialog;
    }

    public void onActivityDestroy() {
        if (mDialog != null && mDialog.isShowing()) {
            mDialog.dismiss();
        }
    }

    @Override
    protected Parcelable onSaveInstanceState() {
        final Parcelable superState = super.onSaveInstanceState();
        if (mDialog == null || !mDialog.isShowing()) {
            return superState;
        }
        final SavedState myState = new SavedState(superState);
        myState.isDialogShowing = true;
        myState.dialogBundle = mDialog.onSaveInstanceState();
        return myState;
    }

    @Override
    protected void onRestoreInstanceState(Parcelable state) {
        if (state == null || !state.getClass().equals(SavedState.class)) {
            // Didn't save state for us in onSaveInstanceState
            super.onRestoreInstanceState(state);
            return;
        }

        SavedState myState = (SavedState) state;
        super.onRestoreInstanceState(myState.getSuperState());
        if (myState.isDialogShowing) {
            showDialog(myState.dialogBundle);
        }
    }
}
