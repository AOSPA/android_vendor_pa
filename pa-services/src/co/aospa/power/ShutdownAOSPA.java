/*
 * Copyright (C) 2016-2019 Paranoid Android
 *
 */

package co.aospa.power;

import com.qti.server.power.SubSystemShutdown;

import android.util.Log;

public final class ShutdownAOSPA {
    private static final String TAG = "AOSPAShutdown";

    public void rebootOrShutdown(boolean reboot, String reason) {
        Log.i(TAG, "Qualcomm reboot/shutdown");
        if (SubSystemShutdown.shutdown() != 0) {
            Log.e(TAG, "Failed to shutdown modem.");
        } else {
            Log.i(TAG, "Modem shutdown successful.");
        }
    }
}