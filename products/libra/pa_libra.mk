ifeq (pa_libra,$(TARGET_PRODUCT))


 # Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# Inherit 64-bit configs
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
 
# Inherit device configuration
$(call inherit-product, device/xiaomi/libra/device.mk)

## Device identifier. This must come after all inclusions
PRODUCT_NAME := pa_libra
PRODUCT_DEVICE := libra

BOARD_VENDOR := Xiaomi
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Mi-4c
PRODUCT_MANUFACTURER := Xiaomi
TARGET_VENDOR := Xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
     PRODUCT_NAME="libra" \
     BUILD_FINGERPRINT="Xiaomi/libra/libra:7.0/NRD90M/V8.5.1.0.NXKCNED:user/release-keys" \
     PRIVATE_BUILD_DESC="libra-user 7.0 NRD90M V8.5.1.0.NXKCNED release-keys"


TARGET_OTA_ASSERT_DEVICE := libra
PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

# Generic CAF packages
include device/qcom/common/common.mk

# Paranoid Android platform
include vendor/pa/main.mk
endif
