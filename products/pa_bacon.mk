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
ifeq (pa_bacon,$(TARGET_PRODUCT))

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Include ParanoidAndroid common configuration
include vendor/pa/main.mk

# Inherit device configuration
$(call inherit-product, device/oneplus/bacon/bacon.mk)

# Override AOSP build properties
PRODUCT_NAME := pa_bacon
PRODUCT_DEVICE := bacon
PRODUCT_BRAND := OnePlus
PRODUCT_MODEL := A0001
PRODUCT_MANUFACTURER := OnePlus

PRODUCT_GMS_CLIENTID_BASE := android-oneplus

PRODUCT_BUILD_PROP_OVERRIDES += \
	PRODUCT_NAME=bacon \
	TARGET_DEVICE=A0001 \
        BUILD_FINGERPRINT=oneplus/bacon/A0001:5.1.1/LMY48B/YOG4PAS1N0:user/release-keys \
        PRIVATE_BUILD_DESC="bacon-user 5.1.1 LMY48B YOG4PAS1N0 release-keys"

endif
