# Check for target product
ifeq (pa_mata,$(TARGET_PRODUCT))

# inherit from device
include device/essential/mata/aosp_mata.mk

# CAF includes
include device/qcom/common/common.mk

# PA decls
TARGET_BOOT_ANIMATION_RES := 1440
DISABLE_EAP_PROXY := true

# Device identifiers
PRODUCT_DEVICE := mata
PRODUCT_NAME := pa_mata
PRODUCT_BRAND := essential
PRODUCT_MODEL := PH-1
PRODUCT_MANUFACTURER := Essential Products
PRODUCT_RELEASE_NAME := mata

PRODUCT_BUILD_PROP_OVERRIDES += \
        PRODUCT_NAME=mata \
        PRIVATE_BUILD_DESC="mata-user 9 PPR1.181005.099 413 release-keys"

BUILD_FINGERPRINT := essential/mata/mata:9/PPR1.181005.099/413:user/release-keys

# PA platform includes
include vendor/pa/main.mk

endif
