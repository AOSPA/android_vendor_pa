# Copyright (C) 2015 ParanoidAndroid Project
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
ifeq (pa_togari,$(TARGET_PRODUCT))

# Include ParanoidAndroid common configuration
include vendor/pa/main.mk
TARGET_BOOT_ANIMATION_RES := 1080

include vendor/twrp-sony/products/rhine/togari/togari.mk

# Inherit AOSP device configuration
$(call inherit-product, device/sony/togari/aosp_c6833.mk)
$(call inherit-product, device/sony/common/common_pa.mk)
include device/sony/common/CommonConfigPa.mk

# Override AOSP build properties
PRODUCT_NAME := pa_togari
PRODUCT_MODEL := Xperia Z Ultra (AOSPA)

# Keep these values synchronised with the firmware versions used by
# AOSP blobs. Do NOT update blobs (and therefore these values) from
# a new factory image. Sony has provided AOSP specific blobs to use
# with AOSP; blobs from a factory image will NOT work.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=C6833 \
                                BUILD_FINGERPRINT="Sony/C6833/C6833:4.3/14.2.A.0.290/eng.hudsonslave:user/release-keys" \
                                PRIVATE_BUILD_DESC="C6833-user 4.3 RHINE-1.1-131125-1201 eng.hudsonslave test-keys"

endif
