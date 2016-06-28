# Copyright (C) 2016 - The ParanoidAndroid Project
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
ifeq (pa_d802,$(TARGET_PRODUCT))

# Inherit the new AOSP telephony configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Include ParanoidAndroid common configuration
TARGET_BOOT_ANIMATION_RES := 1080
include vendor/pa/main.mk

# Inherit device configuration
$(call inherit-product, device/lge/d802/d802.mk)

# Override build properties
PRODUCT_DEVICE := d802
PRODUCT_NAME := pa_d802
PRODUCT_BRAND := LGE
PRODUCT_MODEL := LG-D802
PRODUCT_MANUFACTURER := LGE
PRODUCT_BUILD_PROP_OVERRIDES += \
	BUILD_FINGERPRINT=lge/g2_open_com/g2:5.0.2/LRX22G/151061918340a:user/release-keys \
	PRIVATE_BUILD_DESC="g2_open_com-user 5.0.2 LRX22G 151061918340a release-keys"

endif
