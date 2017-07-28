# Copyright 2016-2017 Paranoid Android
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

ifeq (pa_bullhead,$(TARGET_PRODUCT))

TARGET_ENABLE_QC_AV_ENHANCEMENTS := true

TARGET_USES_MEDIA_EXTENSIONS := true

TARGET_DISABLE_DASH := false

# We have our own power HAL
TARGET_USES_DEVICE_SPECIFIC_POWERHAL := true

# Use AOSP Camera Application
TARGET_USES_AOSP_CAMERA := true

# We have our own sepolicy
TARGET_EXCLUDE_QCOM_SEPOLICY := true

$(call inherit-product, device/lge/bullhead/aosp_bullhead.mk)

# Generic CAF packages
include device/qcom/common/common.mk

# Get the defaults going.
TARGET_BOOT_ANIMATION_RES := 1080

# Disable QC partial update
PRODUCT_PROPERTY_OVERRIDES += \
    persist.mdp.partialUpdate=false

# Override AOSP defaults that we want changed.
PRODUCT_NAME := pa_bullhead
PRODUCT_DEVICE := bullhead
PRODUCT_BRAND := google
PRODUCT_MODEL := Nexus 5X
PRODUCT_MANUFACTURER := LGE
PRODUCT_RESTRICT_VENDOR_FILES := false
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=bullhead \
    BUILD_FINGERPRINT=google/bullhead/bullhead:7.1.2/N2G47Z/4045513:user/release-keys \
    PRIVATE_BUILD_DESC="bullhead-user 7.1.2 N2G47Z 4045513 release-keys"

# Paranoid Android platform
include vendor/pa/main.mk

endif
