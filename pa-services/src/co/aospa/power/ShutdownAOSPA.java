/*
 * Copyright (C) 2017 Paranoid Android
 *
 */

package co.aospa.power;

import android.util.Log;

public final class ShutdownAOSPA {
    private static final String TAG = "AOSPAShutdown";

    public void rebootOrShutdown(boolean isreboot, String rebootreason) {
        Log.i(TAG, "Triggered!");
        try {
            if (com.qti.server.power.SubSystemShutdown.shutdown() != 0) {
                Log.e(TAG, "Failed to shutdown modem.");
            } else {
                Log.i(TAG, "Modem shutdown successful.");
            }
        } catch (Exception e) {
            Log.w(TAG, "Couldn't execute modem shutdown. Skipping...");
        }
    }
}
