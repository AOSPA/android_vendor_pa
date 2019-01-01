# Copyright (C) 2020 Paranoid Android
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

# Ensure Essential PH-1 is the target product.
ifeq (pa_mata,$(TARGET_PRODUCT))

# Inherit some common aosp stuff.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_n_mr1.mk)
# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Vendor blobs
$(call inherit-product-if-exists, vendor/essential/mata/mata-vendor.mk)

# Device
$(call inherit-product, device/essential/mata/device.mk)

# Inherit from the PA configuration.
$(call inherit-product, vendor/pa/config/common_full_phone.mk)

# Include the common CAF configurations.
$(call inherit-product, device/qcom/common/common.mk)
$(call inherit-product, vendor/qcom/common/av/qti-av.mk)
$(call inherit-product, vendor/qcom/common/perf/qti-perf.mk)

# Recovery FStab
TARGET_RECOVERY_FSTAB := device/essential/mata/rootdir/etc/fstab.mata

# PA declarations.
TARGET_BOOT_ANIMATION_RES := 1440

# Device identifiers.
PRODUCT_DEVICE := mata
PRODUCT_NAME := pa_mata
PRODUCT_BRAND := Essential
PRODUCT_MODEL := PH-1
PRODUCT_MANUFACTURER := Essential Products
PRODUCT_RELEASE_NAME := mata

PRODUCT_BUILD_PROP_OVERRIDES += \
        PRODUCT_NAME=mata \
        PRIVATE_BUILD_DESC="mata-user 10 QQ1A.200105.007 515 release-keys"

BUILD_FINGERPRINT := essential/mata/mata:10/QQ1A.200105.007/515:user/release-keys

PRODUCT_ACTIONABLE_COMPATIBLE_PROPERTY_DISABLE := true
PRODUCT_COMPATIBLE_PROPERTY_OVERRIDE := true

PRODUCT_CHARACTERISTICS := nosdcard

endif
