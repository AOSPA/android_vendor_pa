/*
 * Copyright (c) 2016 Paranoid Android
 *
 */

package co.aospa.power;

public final class SubSystemShutdown {
    private static final String TAG = "SubSystemShutdown";

    static {

    try {
        // Call into the Qualcomm SubSystemShutdown Library
        System.loadLibrary("SubSystemShutdown");
    } catch (UnsatisfiedLinkError e) {
      System.err.println("Failed to load Qualcomm SubSystemShutdown library\n" + e);
    }

    }
    public static native int shutdown();
}

