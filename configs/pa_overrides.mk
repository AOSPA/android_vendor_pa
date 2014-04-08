# Copyright (C) 2013 ParanoidAndroid Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# PA packages
PRODUCT_PACKAGES += \
    Busybox \
    Lightbulb

# Extra packages
PRODUCT_PACKAGES += \
    BluetoothExt \
    CellBroadcastReceiver

# Screen Recorder
PRODUCT_PACKAGES += \
    ScreenRecorder \
    libscreenrecorder

# Source or prebuilt PA-prefs logic
#ifneq ($(PREFS_FROM_SOURCE),true)
#    PRODUCT_COPY_FILES += \
#        vendor/pa/prebuilt/apk/ParanoidPreferences.apk:system/app/ParanoidPreferences.apk
#else
#    # Build paprefs from sources
#    PRODUCT_PACKAGES += \
#        ParanoidPreferences
#endif

# Include ParanoidOTA
ifneq ($(NO_OTA_BUILD),true)
    PRODUCT_PACKAGES += \
        ParanoidOTA
endif

# Extra properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.pa.device=$(DEVICE)

# Allow override of system DUN
# 2 = not set, 0 = DUN not required, 1 = DUN required
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.dun.override=0
