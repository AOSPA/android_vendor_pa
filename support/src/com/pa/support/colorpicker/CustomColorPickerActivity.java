/*
 * Copyright (C) 2019 Paranoid Android
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

import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.os.Bundle;
import android.text.Editable;
import android.text.Selection;
import android.text.Spannable;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuItem;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnTouchListener;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.SeekBar;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;

import com.pa.support.R;
import com.pa.support.utils.PAUtils;

import java.util.regex.Pattern;

public class CustomColorPickerActivity extends BaseActivity
        implements OnClickListener, ColorPickerView.OnColorChangedListener {
    private static final int SAVE_NEMU = 0;
    private static final String TAG = "CustomColorPickerActivity";
    private View mColor;
    public EditText mColorEditView;
    public EditText mColorText;
    public String mCurrentColor;
    private String mCurrentTempColor;
    public AlertDialog mEditColorDialog;
    public ColorPickerView mPickerView;
    private ImageView mPreviewAutoBrightness;
    private SeekBar mPreviewSeekBar;
    private Switch mPreviewSwitch;
    private TextView mPreviewText;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.color_picker_layout);
        mPreviewText = findViewById(R.id.custom_color_preview);
        mPreviewSwitch = findViewById(R.id.custom_color_preview_switch);
        mPreviewSwitch.setChecked(true);
        mPreviewSeekBar = findViewById(R.id.custom_color_preview_seekbar);
        mPreviewSeekBar.setProgress(50);
        mPreviewSeekBar.setOnTouchListener(new OnTouchListener() {
            public boolean onTouch(View v, MotionEvent event) {
                return true;
            }
        });
        mPreviewAutoBrightness = findViewById(R.id.custom_color_preview_brightness);
        mColorText = findViewById(R.id.color_edit_view);
        mColorText.requestFocus();
        mColorText.setOnClickListener(this);
        mPickerView = findViewById(R.id.color_picker_view);
        mPickerView.setOnColorChangedListener(this);
        Intent intent = getIntent();
        if (intent != null) {
            mCurrentColor = intent.getStringExtra("current_color");
            mCurrentTempColor = intent.getStringExtra("current_color");
            if (!TextUtils.isEmpty(mCurrentColor)) {
                mPickerView.setColor(PAUtils.parseColor(mCurrentColor));
            } else {
                mCurrentColor = "#FF0000";
                mCurrentTempColor = "#FF0000";
                mPickerView.setColor(PAUtils.parseColor("#FF0000"));
            }
            mColorText.setText(mCurrentColor);
            refreshUI(PAUtils.parseColor(mCurrentColor), mCurrentColor);
        }
    }

    public void refreshUI(int color, String colorStr) {
        mPreviewText.setTextColor(PAUtils.parseColor(colorStr));
        mPreviewSwitch.getTrackDrawable().setTintList(ColorStateList.valueOf(PAUtils.parseColor(colorStr)));
        mPreviewSwitch.getThumbDrawable().setTintList(ColorStateList.valueOf(PAUtils.parseColor(colorStr)));
        mPreviewSeekBar.getThumb().setTintList(ColorStateList.valueOf(PAUtils.parseColor(colorStr)));
        mPreviewSeekBar.getBackground().setTintList(ColorStateList.valueOf(PAUtils.parseColor(colorStr)));
        mPreviewSeekBar.getProgressDrawable().setTintList(ColorStateList.valueOf(PAUtils.parseColor(colorStr)));
        mPreviewAutoBrightness.setImageTintList(ColorStateList.valueOf(PAUtils.parseColor(colorStr)));
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        addOptionsMenuItems(menu);
        return super.onCreateOptionsMenu(menu);
    }

    public void addOptionsMenuItems(Menu menu) {
        menu.add(0, 0, 0, R.string.wifi_menu_configure)
                .setIcon(R.drawable.ic_check_black_24px).setShowAsAction(1);
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        int itemId = item.getItemId();
        if (itemId == 0) {
            Intent intent = new Intent();
            intent.putExtra("current_temp_color", mCurrentColor);
            setResult(RESULT_OK, intent);
            finish();
            return true;
        } else if (itemId != android.R.id.home) {
            return super.onOptionsItemSelected(item);
        } else {
            onBackPressed();
            return true;
        }
    }

    @Override
    public void onBackPressed() {
        Intent intent = new Intent();
        intent.putExtra("current_temp_color", mCurrentTempColor);
        setResult(RESULT_OK, intent);
        finish();
    }

    public void onColorChanged(int color) {
        StringBuffer argb = new StringBuffer("#");
        argb.append(Integer.toHexString(Color.red(color)));
        argb.append(Integer.toHexString(Color.green(color)));
        argb.append(Integer.toHexString(Color.blue(color)));
        EditText editText = mColorText;
        StringBuilder sb = new StringBuilder();
        sb.append("#");
        sb.append(convertToRGB(color));
        editText.setText(sb.toString());
        StringBuilder sb2 = new StringBuilder();
        sb2.append("#");
        sb2.append(convertToRGB(color));
        mCurrentColor = sb2.toString();
        refreshUI(color, mCurrentColor);
    }

    private String convertToRGB(int color) {
        String red = Integer.toHexString(Color.red(color));
        String green = Integer.toHexString(Color.green(color));
        String blue = Integer.toHexString(Color.blue(color));
        if (red.length() == 1) {
            StringBuilder sb = new StringBuilder();
            sb.append("0");
            sb.append(red);
            red = sb.toString();
        }
        if (green.length() == 1) {
            StringBuilder sb2 = new StringBuilder();
            sb2.append("0");
            sb2.append(green);
            green = sb2.toString();
        }
        if (blue.length() == 1) {
            StringBuilder sb3 = new StringBuilder();
            sb3.append("0");
            sb3.append(blue);
            blue = sb3.toString();
        }
        StringBuilder sb4 = new StringBuilder();
        sb4.append(red);
        sb4.append(green);
        sb4.append(blue);
        return sb4.toString();
    }

    public static int convertToColorInt(String argb) throws IllegalArgumentException {
        if (!argb.startsWith("#")) {
            StringBuilder sb = new StringBuilder();
            sb.append("#");
            sb.append(argb);
            argb = sb.toString();
        }
        return PAUtils.parseColor(argb);
    }

    public void onClick(View v) {
        if (v.getId() == R.id.color_edit_view) {
            showColorEditDialog();
        }
    }

    public boolean isColorCodeValid(String color) {
        return Pattern.compile("^#([0-9a-fA-F]{6})").matcher(color).matches();
    }

    public void setEditTextAtLastLocation(EditText editText) {
        Editable text = editText.getText();
        if (text instanceof Spannable) {
            Selection.setSelection(text, text.length());
        }
    }

    public void showColorEditDialog() {
        Log.v(TAG, "Inside showColorEditDialog");
        View editView = LayoutInflater.from(this).inflate(R.layout.colorhex_edit_dialog, null);
        mColorEditView = editView.findViewById(R.id.color_hex_edit);
        mColorEditView.requestFocus();
        mColorEditView.setText(mCurrentColor);
        if (!TextUtils.isEmpty(mCurrentColor)) {
            mColorEditView.setSelection(mCurrentColor.length());
        }
        mColorEditView.addTextChangedListener(new TextWatcher() {
            public void onTextChanged(CharSequence s, int start, int before, int count) {
                Editable mEditable = CustomColorPickerActivity.this.mColorEditView.getText();
                if (mEditable != null && mEditable.length() == 0) {
                    CustomColorPickerActivity.this.mColorEditView.setText("#");
                    setEditTextAtLastLocation(CustomColorPickerActivity.this.mColorEditView);
                }
            }

            public void beforeTextChanged(CharSequence s, int start, int count, int after) {
            }

            public void afterTextChanged(Editable s) {
            }
        });
        mEditColorDialog = new Builder(this).setTitle(R.string.custom_color_value_edit)
                .setView(editView).setCancelable(true)
                .setPositiveButton(R.string.ok, null)
                .setNegativeButton(R.string.cancel, new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialog, int which) {
                dialog.dismiss();
            }
        }).create();
        mEditColorDialog.show();
        mEditColorDialog.getButton(-1).setOnClickListener(new OnClickListener() {
            public void onClick(View v) {
                String colorText = CustomColorPickerActivity.this.mColorEditView.getText().toString();
                if (!isColorCodeValid(colorText)) {
                    Toast.makeText(CustomColorPickerActivity.this,
                            R.string.custom_color_value_invalid, Toast.LENGTH_SHORT).show();
                    return;
                }
                mCurrentColor = colorText;
                mPickerView.setColor(convertToColorInt(colorText));
                mColorText.setText(colorText);
                refreshUI(0, colorText);
                mEditColorDialog.dismiss();
            }
        });
    }
}
