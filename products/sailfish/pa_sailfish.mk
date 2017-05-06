# Copyright 2016 ParanoidAndroid Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

ifeq (pa_sailfish,$(TARGET_PRODUCT))

# We have our own power HAL
TARGET_USES_DEVICE_SPECIFIC_POWERHAL := true

$(call inherit-product, device/google/sailfish/aosp_sailfish.mk)

# Generic CAF packages
include device/qcom/common/common.mk

# CAF display addons
PRODUCT_PACKAGES += \
    copybit.msm8996

# Get the defaults going.
TARGET_BOOT_ANIMATION_RES := 1440

# Paranoid Android platform
include vendor/pa/main.mk

# Override AOSP defaults that we want changed.
PRODUCT_NAME := pa_sailfish
PRODUCT_DEVICE := sailfish
PRODUCT_BRAND := google
PRODUCT_MODEL := Pixel
PRODUCT_MANUFACTURER := Google
PRODUCT_RESTRICT_VENDOR_FILES := false
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=marlin \
    BUILD_FINGERPRINT=google/marlin/marlin:7.1.2/N2G47O/3852959:user/release-keys \
    PRIVATE_BUILD_DESC="marlin-user 7.1.2 N2G47O 3852959 release-keys"
endif
