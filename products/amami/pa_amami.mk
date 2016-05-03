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
ifeq (pa_amami,$(TARGET_PRODUCT))

# Include ParanoidAndroid common configuration
include vendor/pa/main.mk
TARGET_BOOT_ANIMATION_RES := 720

include vendor/twrp-sony/products/rhine/amami/amami.mk

# Inherit AOSP device configuration
$(call inherit-product, device/sony/amami/aosp_d5503.mk)

# Sony uses mkqcdtbootimg
BOARD_CUSTOM_BOOTIMG := true

# Override AOSP build properties
PRODUCT_NAME := pa_amami
PRODUCT_MODEL := Xperia Z1 Compact (AOSPA)

# Keep these values synchronised with the firmware versions used by
# AOSP blobs. Do NOT update blobs (and therefore these values) from
# a new factory image. Sony has provided AOSP specific blobs to use
# with AOSP; blobs from a factory image will NOT work.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=D5503 \
                                BUILD_FINGERPRINT="Sony/D5503/D5503:5.0.2/14.5.A.0.270/3750474323:user/release-keys" \
                                PRIVATE_BUILD_DESC="D5503-user 5.0.2 14.5.A.0.270 3750474323 release-keys"

endif
