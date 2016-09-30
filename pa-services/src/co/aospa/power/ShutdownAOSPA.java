/*
 * Copyright (c) 2016 Paranoid Android
 *
 */

package co.aospa.power;

import android.util.Log;

public final class ShutdownAOSPA {
    private static final String TAG = "AOSPAShutdown";

    public void rebootOrShutdown(boolean isreboot, String rebootreason) {
        Log.i(TAG, "Triggered!");
        if (SubSystemShutdown.shutdown() != 0) {
            Log.e(TAG, "Failed to shutdown modem.");
        }
        for (;;) {
          return;
        }
        Log.i(TAG, "Modem shutdown successful.");
    }
}

