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
ifeq (pa_seagull,$(TARGET_PRODUCT))

# Include ParanoidAndroid common configuration
include vendor/pa/main.mk

# Inherit AOSP device configuration
$(call inherit-product, device/sony/seagull/aosp_d5103.mk)

# Sony uses mkqcdtbootimg
BOARD_CUSTOM_BOOTIMG := true

# Override AOSP build properties
PRODUCT_NAME := pa_seagull
PRODUCT_MODEL := Xperia T3 (AOSPA)

# Keep these values synchronised with the firmware versions used by
# AOSP blobs. Do NOT update blobs (and therefore these values) from
# a new factory image. Sony has provided AOSP specific blobs to use
# with AOSP; blobs from a factory image will NOT work.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=D5503 \
                                BUILD_FINGERPRINT="Sony/D5103/D5103:4.4.2/18.1.A.1.21/6vt_bw:user/release-keys" \
                                PRIVATE_BUILD_DESC="D5103-user 4.4.2 18.1.A.1.21 6vt_bw release-keys"

endif
