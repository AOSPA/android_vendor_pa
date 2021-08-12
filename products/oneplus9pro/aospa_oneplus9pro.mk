# Copyright (C) 2021 Paranoid Android
# SPDX-License-Identifier: MIT

ifeq (aospa_oneplus9pro,$(TARGET_PRODUCT))

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Inherit from the device configuration.
$(call inherit-product, device/oneplus/oneplus9pro/device.mk)

# Inherit from the AOSPA configuration.
$(call inherit-product, vendor/aospa/target/aospa-product.mk)

TARGET_BOOT_ANIMATION_RES := 1440

PRODUCT_BRAND := OnePlus
PRODUCT_DEVICE := oneplus9pro
PRODUCT_MANUFACTURER := OnePlus
PRODUCT_MODEL := OnePlus 9 Pro
PRODUCT_NAME := aospa_oneplus9pro

# Override device name for Play Store.
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_DEVICE=OnePlus9Pro

PRODUCT_GMS_CLIENTID_BASE := android-oneplus

endif
