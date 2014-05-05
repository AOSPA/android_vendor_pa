# Copyright (C) 2012 ParanoidAndroid Project
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

ifeq (pa_p3110,$(TARGET_PRODUCT))
# Build paprefs from sources
PREFS_FROM_SOURCE ?= false

# Include AOSPA common configuration
include vendor/pa/main.mk

# Inherit AOSP device configuration
$(call inherit-product, device/samsung/p3110/full_p3110.mk)

# Override AOSP build properties
PRODUCT_NAME := pa_p3110
PRODUCT_BRAND := samsung
PRODUCT_MODEL := GT-P3110
PRODUCT_MANUFACTURER := samsung
#Set build fingerprint / ID / Prduct Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=espressowifixx \
    TARGET_DEVICE=espressowifi \
    BUILD_FINGERPRINT="samsung/espressowifixx/espressowifi:4.2.2/JDQ39/P3110XXDMH1:user/release-keys" \
    PRIVATE_BUILD_DESC="espressowifixx-user 4.2.2 JDQ39 P3110XXDMH1 release-keys"

PRODUCT_RELEASE_NAME := GT-P3110
endif
