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

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ComposeShader;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.Point;
import android.graphics.PorterDuff.Mode;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.Shader.TileMode;
import android.support.v4.view.ViewCompat;
import android.util.AttributeSet;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;

import com.pa.support.R;

public class ColorPickerView extends View {
    private static final boolean DEBUG = false;
    private static final boolean RESTRICT_MODE = false;
    private static final String TAG = "ColorPickerView";
    private RectF mDrawingRect;
    private float mHue;
    private Paint mHueIndicatorPaint;
    private float mHueIndicatorWidth;
    private float mHueInidcatorOffset;
    private Paint mHuePaint;
    private float mHuePanelHeight;
    private RectF mHueRect;
    private Shader mHueShader;
    private RectF mHueTouchRect;
    private float mIndicatorBlurRadius;
    private float mIndicatorBorderWidth;
    private int mIndicatorColor;
    private float mIndicatorCornerRadius;
    private OnColorChangedListener mListener;
    private float mMarginLeft;
    private float mMarginTop;
    private float mMinHeight;
    private float mMinWidth;
    private float mPadding;
    private float mPanelSpacing;
    private float mPanelWidth;
    private Paint mSVIndicatorPaint;
    private float mSVIndicatorWidth;
    private float mSVPanelHeight;
    private float mSat;
    private Paint mSatValPaint;
    private RectF mSatValRect;
    private RectF mSatValTouchRect;
    private Point mTouchPoint;
    private float mVal;
    private Shader mValShader;

    public interface OnColorChangedListener {
        void onColorChanged(int i);
    }

    public ColorPickerView(Context context) {
        this(context, null);
    }

    public ColorPickerView(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public ColorPickerView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        mTouchPoint = null;
        mHue = 360.0f;
        mSat = 0.0f;
        mVal = 0.0f;
        init();
    }

    private void init() {
        Resources res = getResources();
        mPadding = (mHueIndicatorWidth / 2.0f) + mIndicatorBorderWidth;
        mPanelWidth = res.getDimension(R.dimen.panel_view_width);
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("panel width 375dp:");
        sb.append(mPanelWidth);
        Log.d(str, sb.toString());
        String str2 = TAG;
        StringBuilder sb2 = new StringBuilder();
        sb2.append("device width pixels:");
        sb2.append(getResources().getDisplayMetrics().widthPixels);
        Log.d(str2, sb2.toString());
        mPanelSpacing = res.getDimension(R.dimen.panel_spacing);
        mMarginTop = res.getDimension(R.dimen.margin_top2);
        mMarginLeft = res.getDimension(R.dimen.margin_left2);
        mHuePanelHeight = res.getDimension(R.dimen.hue_panel_height);
        mSVPanelHeight = res.getDimension(R.dimen.sat_val_panel_height);
        mMinWidth = mPanelWidth;
        mMinHeight = mHuePanelHeight + mSVPanelHeight + mPanelSpacing;
        mIndicatorCornerRadius = res.getDimension(R.dimen.indicator_corner_radius);
        mIndicatorBlurRadius = res.getDimension(R.dimen.indicator_shadow_radius);
        mIndicatorBorderWidth = res.getDimension(R.dimen.indicator_border_width);
        mIndicatorColor = res.getColor(R.color.indicator_border_color);
        mHueIndicatorWidth = res.getDimension(R.dimen.hue_indicator_width);
        mHueInidcatorOffset = res.getDimension(R.dimen.hue_indicator_offset);
        mSVIndicatorWidth = res.getDimension(R.dimen.sat_val_indicator_width);
        initPaintTools();
        setFocusable(true);
        setFocusableInTouchMode(true);
    }

    private void initPaintTools() {
        mSatValPaint = new Paint();
        mHuePaint = new Paint();
        mHueIndicatorPaint = new Paint();
        mHueIndicatorPaint.setColor(mIndicatorColor);
        mHueIndicatorPaint.setStyle(Style.STROKE);
        mHueIndicatorPaint.setStrokeWidth(mIndicatorBorderWidth);
        mHueIndicatorPaint.setAntiAlias(true);
        mHueIndicatorPaint.setShadowLayer(mIndicatorBlurRadius, 0.0f, 0.0f, Color.GRAY);
        mSVIndicatorPaint = new Paint();
        mSVIndicatorPaint.setStyle(Style.STROKE);
        mSVIndicatorPaint.setColor(mIndicatorColor);
        mSVIndicatorPaint.setStrokeWidth(mIndicatorBorderWidth);
        mSVIndicatorPaint.setAntiAlias(true);
        mSVIndicatorPaint.setShadowLayer(mIndicatorBlurRadius, 0.0f, 0.0f, Color.GRAY);
    }

    @Override
    public void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        int widthMode = MeasureSpec.getMode(widthMeasureSpec);
        int mode = MeasureSpec.getMode(heightMeasureSpec);
        setMeasuredDimension(
                isUnspecified(widthMode) ? (int) mMinWidth : MeasureSpec.getSize(widthMeasureSpec),
                isUnspecified(widthMode) ? (int) mMinHeight : MeasureSpec.getSize(heightMeasureSpec));
    }

    private static boolean isUnspecified(int mode) {
        return (mode == MeasureSpec.EXACTLY || mode == Integer.MIN_VALUE) ? false : true;
    }

    @Override
    public void onDraw(Canvas canvas) {
        if (mDrawingRect.width() > 0.0f && mDrawingRect.height() > 0.0f) {
            drawSatValPanel(canvas);
            drawHuePanel(canvas);
        }
    }

    private void drawSatValPanel(Canvas canvas) {
        mSatValPaint.setShader(generateSVShader());
        canvas.drawRect(mSatValRect, mSatValPaint);
        Point p = satValToPoint(mSat, mVal);
        RectF rect = new RectF();
        float halfWidth = mSVIndicatorWidth / 2.0f;
        rect.left = ((float) p.x) - halfWidth;
        rect.right = ((float) p.x) + halfWidth;
        rect.top = ((float) p.y) - halfWidth;
        rect.bottom = ((float) p.y) + halfWidth;
        canvas.drawRoundRect(rect, mIndicatorCornerRadius, mIndicatorCornerRadius, mSVIndicatorPaint);
    }

    private ComposeShader generateRestrictedSVShader() {
        if (mValShader == null) {
            LinearGradient linearGradient = new LinearGradient(
                    mSatValRect.left, mSatValRect.top, mSatValRect.left, mSatValRect.bottom,
                    -1, -11184811, TileMode.CLAMP);
            mValShader = linearGradient;
        }
        LinearGradient linearGradient2 = new LinearGradient(
                mSatValRect.left, mSatValRect.top, mSatValRect.right, mSatValRect.top,
                -5592406, Color.HSVToColor(new float[]{mHue, 1.0f, 1.0f}), TileMode.CLAMP);
        return new ComposeShader(mValShader, linearGradient2, Mode.MULTIPLY);
    }

    private ComposeShader generateSVShader() {
        if (mValShader == null) {
            LinearGradient linearGradient = new LinearGradient(mSatValRect.left, mSatValRect.top,
                    mSatValRect.left, mSatValRect.bottom, -1, ViewCompat.MEASURED_STATE_MASK,
                    TileMode.CLAMP);
            mValShader = linearGradient;
        }
        LinearGradient linearGradient2 = new LinearGradient(mSatValRect.left, mSatValRect.top,
                mSatValRect.right, mSatValRect.top, -1,
                Color.HSVToColor(new float[]{mHue, 1.0f, 1.0f}), TileMode.CLAMP);
        return new ComposeShader(mValShader, linearGradient2, Mode.MULTIPLY);
    }

    private void drawHuePanel(Canvas canvas) {
        RectF rect = mHueRect;
        if (mHueShader == null) {
            int[] hue = new int[361];
            int count = 0;
            int i = 0;
            while (i <= hue.length - 1) {
                hue[count] = Color.HSVToColor(new float[]{(float) i, 1.0f, 1.0f});
                i++;
                count++;
            }
            LinearGradient linearGradient = new LinearGradient(rect.left, rect.top,
                    rect.right, rect.top, hue, null, TileMode.CLAMP);
            mHueShader = linearGradient;
            mHuePaint.setShader(mHueShader);
        }
        canvas.drawRect(rect, mHuePaint);
        float halfHueIndicatorWidth = mHueIndicatorWidth / 2.0f;
        Point p = hueToPoint(mHue);
        RectF r = new RectF();
        r.left = ((float) p.x) - halfHueIndicatorWidth;
        r.right = ((float) p.x) + halfHueIndicatorWidth;
        r.top = rect.top - mHueInidcatorOffset;
        r.bottom = rect.bottom + mHueInidcatorOffset;
        canvas.drawRoundRect(r, mIndicatorCornerRadius, mIndicatorCornerRadius, mHueIndicatorPaint);
    }

    private Point hueToPoint(float hue) {
        RectF rect = mHueRect;
        float width = rect.width();
        Point p = new Point();
        p.y = (int) rect.top;
        p.x = (int) (rect.left + ((hue * width) / 360.0f));
        return p;
    }

    private Point satValToPoint(float sat, float val) {
        float height = mSatValRect.height();
        float width = mSatValRect.width();
        Point p = new Point();
        p.x = (int) ((sat * width) + mSatValRect.left);
        p.y = (int) (((1.0f - val) * height) + mSatValRect.top);
        return p;
    }

    private float[] pointToSatValRestrictedMode(float x, float y) {
        float x2;
        float y2;
        RectF rect = mSatValRect;
        float[] result = new float[2];
        float width = rect.width();
        float height = rect.height();
        if (x < rect.left) {
            x2 = 0.0f;
        } else if (x > rect.right) {
            x2 = width;
        } else {
            x2 = x - rect.left;
        }
        if (y < rect.top) {
            y2 = 0.0f;
        } else if (y > rect.bottom) {
            y2 = height;
        } else {
            y2 = y - rect.top;
        }
        result[0] = (1.0f / width) * x2;
        result[1] = 1.0f - ((1.0f / height) * y2);
        return result;
    }

    private float[] pointToSatVal(float x, float y) {
        float x2;
        float y2;
        RectF rect = mSatValRect;
        float[] result = new float[2];
        float width = rect.width();
        float height = rect.height();
        if (x < rect.left) {
            x2 = 0.0f;
        } else if (x > rect.right) {
            x2 = width;
        } else {
            x2 = x - rect.left;
        }
        if (y < rect.top) {
            y2 = 0.0f;
        } else if (y > rect.bottom) {
            y2 = height;
        } else {
            y2 = y - rect.top;
        }
        result[0] = (1.0f / width) * x2;
        result[1] = 1.0f - ((1.0f / height) * y2);
        return result;
    }

    private float pointToHue(float x) {
        float x2;
        RectF rect = mHueRect;
        float width = rect.width();
        if (x < rect.left) {
            x2 = 0.0f;
        } else if (x > rect.right) {
            x2 = width;
        } else {
            x2 = x - rect.left;
        }
        return (360.0f * x2) / width;
    }

    @Override
    public boolean onTouchEvent(MotionEvent event) {
        boolean isUpdated = false;
        switch (event.getAction()) {
            case 0:
                mTouchPoint = new Point((int) event.getX(), (int) event.getY());
                isUpdated = updateIndicatorIfNeeded(event);
                break;
            case 1:
                mTouchPoint = null;
                isUpdated = updateIndicatorIfNeeded(event);
                break;
            case 2:
                isUpdated = updateIndicatorIfNeeded(event);
                break;
        }
        if (!isUpdated) {
            return super.onTouchEvent(event);
        }
        if (mListener != null) {
            mListener.onColorChanged(Color.HSVToColor(new float[]{mHue, mSat, mVal}));
        }
        invalidate();
        return true;
    }

    private boolean updateIndicatorIfNeeded(MotionEvent event) {
        if (mTouchPoint == null) {
            return false;
        }
        boolean update = false;
        int startX = mTouchPoint.x;
        int startY = mTouchPoint.y;
        if (mHueTouchRect.contains((float) startX, (float) startY)) {
            mHue = pointToHue(event.getX());
            update = true;
        } else if (mSatValTouchRect.contains((float) startX, (float) startY)) {
            float[] result = pointToSatVal(event.getX(), event.getY());
            mSat = result[0];
            mVal = result[1];
            update = true;
        }
        return update;
    }

    @Override
    public void onSizeChanged(int w, int h, int oldw, int oldh) {
        super.onSizeChanged(w, h, oldw, oldh);
        mDrawingRect = new RectF();
        mDrawingRect.left = mPadding + ((float) getPaddingLeft());
        mDrawingRect.right = (((float) w) - mPadding) - ((float) getPaddingRight());
        mDrawingRect.top = mPadding + ((float) getPaddingTop());
        mDrawingRect.bottom = (((float) h) - mPadding) - ((float) getPaddingBottom());
        setupSatValRect();
        setupHueRect();
    }

    private void setupSatValRect() {
        RectF dRect = mDrawingRect;
        mSatValRect = new RectF(dRect.left,
                dRect.top + mHuePanelHeight + mMarginTop + mPanelSpacing, dRect.right,
                dRect.bottom - mMarginTop);
        mSatValTouchRect = new RectF();
        mSatValTouchRect.left = mSatValRect.left - (mSVIndicatorWidth / 2.0f);
        mSatValTouchRect.right = mSatValRect.right + (mSVIndicatorWidth / 2.0f);
        mSatValTouchRect.top = mSatValRect.top - (mSVIndicatorWidth / 4.0f);
        mSatValTouchRect.bottom = mSatValRect.bottom + (mSVIndicatorWidth / 4.0f);
    }

    private void setupHueRect() {
        RectF dRect = mDrawingRect;
        float left = dRect.left;
        float top = dRect.top;
        mHueRect = new RectF(left, top, dRect.right, mHuePanelHeight + top);
        mHueTouchRect = new RectF();
        mHueTouchRect.left = mHueRect.left - (mHueIndicatorWidth / 2.0f);
        mHueTouchRect.right = mHueRect.right + (mHueIndicatorWidth / 2.0f);
        mHueTouchRect.top = mHueRect.top - (mHueIndicatorWidth / 2.0f);
        mHueTouchRect.bottom = mHueRect.bottom + (mHueIndicatorWidth / 2.0f);
    }

    public void setOnColorChangedListener(OnColorChangedListener listener) {
        mListener = listener;
        mListener.onColorChanged(Color.HSVToColor(new float[]{mHue, mSat, mVal}));
    }

    public int getColor() {
        return Color.HSVToColor(new float[]{mHue, mSat, mVal});
    }

    public void setColor(int color) {
        setColor(color, false);
    }

    public void setColor(int color, boolean callback) {
        float[] hsv = new float[3];
        Color.colorToHSV(color, hsv);
        mHue = hsv[0];
        mSat = hsv[1];
        mVal = hsv[2];
        if (callback && mListener != null) {
            mListener.onColorChanged(Color.HSVToColor(new float[]{mHue, mSat, mVal}));
        }
        invalidate();
    }
}
