# Copyright (C) 2021 Paranoid Android
# SPDX-License-Identifier: MIT

ifeq (aospa_oneplus9,$(TARGET_PRODUCT))

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Inherit from the custom device configuration.
$(call inherit-product, device/oneplus/oneplus9/device.mk)

# Inherit from the AOSPA configuration.
$(call inherit-product, vendor/aospa/target/aospa-product.mk)

TARGET_BOOT_ANIMATION_RES := 1440

PRODUCT_BRAND := OnePlus
PRODUCT_DEVICE := oneplus9
PRODUCT_MANUFACTURER := OnePlus
PRODUCT_MODEL := OnePlus 9
PRODUCT_NAME := pa_oneplus9

PRODUCT_GMS_CLIENTID_BASE := android-oneplus

# Override device name for Play Store.
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_DEVICE=OnePlus9

endif
