# Copyright (C) 2021 Paranoid Android
# SPDX-License-Identifier: Apache-2.0

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_p.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/a40/device.mk)

# Inherit some common PA stuff.
$(call inherit-product, vendor/pa/config/common_full_phone.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := a40
PRODUCT_NAME := pa_a40
PRODUCT_MODEL := a40
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := samsung

PRODUCT_GMS_CLIENTID_BASE := android-samsung

# BUILD_FINGERPRINT := "samsung/m20ltedd/m20lte:10/QP1A.190711.020/M205FDDU5CTF2:user/release-keys"

# PRODUCT_BUILD_PROP_OVERRIDES += \
        PRODUCT_NAME=m20ltedd \
        PRIVATE_BUILD_DESC="m20ltedd-user 10 QP1A.190711.020 M205FDDS6CTH4 release-keys"