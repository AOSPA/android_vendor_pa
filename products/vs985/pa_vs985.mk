# Check for target product
ifeq (pa_vs985,$(TARGET_PRODUCT))

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Include ParanoidAndroid common configuration
TARGET_BOOT_ANIMATION_RES := 1440
include vendor/pa/main.mk

$(call inherit-product, device/lge/vs985/full_vs985.mk)

# Device identifier. This must come after all inclusions
PRODUCT_NAME := pa_vs985
PRODUCT_DEVICE := vs985
PRODUCT_BRAND := LGE
PRODUCT_MODEL := LG-VS985
PRODUCT_MANUFACTURER := lge

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_DEVICE="g3" \
    PRODUCT_NAME="g3_vzw_us" \
    BUILD_FINGERPRINT="lge/g3_vzw/g3:6.0/MRA58K/160141503d43c:user/release-keys" \
    PRIVATE_BUILD_DESC="g3_vzw-user 6.0 MRA58K 160141503d43c release-keys"

PRODUCT_GMS_CLIENTID_BASE := android-verizon

endif
