/*
 * Copyright (C) 2016-2017 Paranoid Android
 *
 */

package com.qti.server.power;

public final class SubSystemShutdown {
    private static final String TAG = "SubSystemShutdown";

    static {

        try {
            // Call into the Qualcomm SubSystemShutdown Library
            System.loadLibrary(TAG);
        } catch (UnsatisfiedLinkError e) {
            System.err.println("Failed to load Qualcomm SubSystemShutdown library\n" + e);
        }

    }
    public static native int shutdown();
}
