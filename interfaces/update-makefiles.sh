#!/bin/bash

source $ANDROID_BUILD_TOP/system/tools/hidl/update-makefiles-helper.sh

do_makefiles_update \
  "vendor.lineage:vendor/pa/interfaces" \
  "android.hardware:hardware/interfaces" \
  "android.hidl:system/libhidl/transport"
