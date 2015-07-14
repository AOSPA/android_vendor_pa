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
ifeq (pa_sirius,$(TARGET_PRODUCT))

# Include ParanoidAndroid common configuration
include vendor/pa/main.mk

# Inherit AOSP device configuration
$(call inherit-product, device/sony/sirius/aosp_d6503.mk)

# Sony uses mkqcdtbootimg
BOARD_CUSTOM_BOOTIMG := true

# Override AOSP build properties
PRODUCT_NAME := pa_sirius
PRODUCT_MODEL := Xperia Z2 (AOSPA)

# Keep these values synchronised with the firmware versions used by
# AOSP blobs. Do NOT update blobs (and therefore these values) from
# a new factory image. Sony has provided AOSP specific blobs to use
# with AOSP; blobs from a factory image will NOT work.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=D6503 \
                                BUILD_FINGERPRINT="Sony/D6503/D6503:5.0.2/23.1.A.1.28/151083418:user/release-keys" \
                                PRIVATE_BUILD_DESC="D6503-user 5.0.2 23.1.A.1.28 151083418 release-keys"

endif
