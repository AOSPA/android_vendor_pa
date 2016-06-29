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
ifeq (pa_eagle,$(TARGET_PRODUCT))

# Include ParanoidAndroid common configuration
include vendor/pa/main.mk

include vendor/twrp-sony/products/yukon/eagle/eagle.mk

# Inherit AOSP device configuration
$(call inherit-product, device/sony/eagle/aosp_d2303.mk)
$(call inherit-product, device/sony/common/common_pa.mk)
include device/sony/common/CommonConfigPa.mk

# Override AOSP build properties
PRODUCT_NAME := pa_eagle
PRODUCT_MODEL := Xperia M2 (AOSPA)

# Keep these values synchronised with the firmware versions used by
# AOSP blobs. Do NOT update blobs (and therefore these values) from
# a new factory image. Sony has provided AOSP specific blobs to use
# with AOSP; blobs from a factory image will NOT work.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=D2303 \
                                BUILD_FINGERPRINT="Sony/D2303/D2303:4.4.4/18.3.1.C.0.21/2n9_bg:user/release-keys" \
                                PRIVATE_BUILD_DESC="D2303-user 18.3.1.C.0.21 2n9_bg release-keys"

endif
