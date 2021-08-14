# Copyright (C) 2021 Paranoid Android
# SPDX-License-Identifier: MIT

# Check for target product
ifeq (aospa_laurel_sprout,$(TARGET_PRODUCT))

# Inherit framework first
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_p.mk)

# Inherit from Laurel_sprout device
$(call inherit-product, device/xiaomi/laurel_sprout/device.mk)

# Inherit from the AOSPA configuration.
$(call inherit-product, vendor/aospa/target/aospa-product.mk)

# Device identifier
PRODUCT_NAME := aospa_laurel_sprout
PRODUCT_DEVICE := laurel_sprout
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Mi A3
PRODUCT_MANUFACTURER := Xiaomi

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi
TARGET_VENDOR_PRODUCT_NAME := laurel_sprout

# Bootanimation
TARGET_BOOT_ANIMATION_RES := 720

endif
