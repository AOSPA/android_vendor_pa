/*
 * Copyright (c) 2016 Paranoid Android
 *
 */

package co.aospa.power;

public final class SubSystemShutdown
{
  private static final String TAG = "SubSystemShutdown";
  
  static
  {
    // Call into the Qualcomm SubSystemShutdown Library
    System.loadLibrary("SubSystemShutdown");
  }
  
  public static native int shutdown();
}

