# Copyright (C) 2014 ParanoidAndroid Project
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

# Check for target product

ifeq (pa_taoshan,$(TARGET_PRODUCT))

# OVERLAY_TARGET adds overlay asset source
OVERLAY_TARGET := pa_hdpi

PREFS_FROM_SOURCE ?= false

# Inherit telephony common stuff
$(call inherit-product, vendor/pa/configs/telephony.mk)

# Include AOSPA common configuration
include vendor/pa/main.mk

# Inherit device configuration
$(call inherit-product, device/sony/taoshan/cm.mk)

# Override AOSP build properties
PRODUCT_NAME := pa_taoshan
PRODUCT_DEVICE := taoshan
PRODUCT_BRAND := sony
PRODUCT_MANUFACTURER := Sony
PRODUCT_MODEL := C2105
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=C2105_1272-2267 BUILD_FINGERPRINT="Sony/C2105_1272-2267/C2105:4.2.2/15.3.A.1.14/Android.1014:user/release-keys" \
PRIVATE_BUILD_DESC="C2105-user 4.2.2 JDQ39 Android.1014 test-keys"

endif
