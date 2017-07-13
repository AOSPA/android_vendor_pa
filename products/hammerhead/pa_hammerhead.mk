# Copyright (C) 2016-2017 Paranoid Android
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

ifeq (pa_hammerhead,$(TARGET_PRODUCT))

# We have our own sepolicy
TARGET_EXCLUDE_QCOM_SEPOLICY := true

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Include ParanoidAndroid BootAnimation
TARGET_BOOT_ANIMATION_RES := 1080

# Generic CAF packages
include device/qcom/common/common.mk

# Inherit AOSP device configuration
$(call inherit-product, device/lge/hammerhead/hammerhead.mk)

# Override AOSP build properties
PRODUCT_NAME := pa_hammerhead
PRODUCT_DEVICE := hammerhead
PRODUCT_BRAND := google
PRODUCT_MODEL := Nexus 5
PRODUCT_MANUFACTURER := LGE
PRODUCT_RESTRICT_VENDOR_FILES := false

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=hammerhead \
    BUILD_FINGERPRINT=google/hammerhead/hammerhead:6.0.1/M4B30Z/3437181:user/release-keys \
    PRIVATE_BUILD_DESC="hammerhead-user 6.0.1 M4B30Z 3437181 release-keys"

# Paranoid Android platform
include vendor/pa/main.mk

endif
