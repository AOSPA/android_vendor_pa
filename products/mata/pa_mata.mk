# Check for target product
ifeq (pa_mata,$(TARGET_PRODUCT))

# inherit from device
include device/essential/mata/aosp_mata.mk

# CAF includes
include device/qcom/common/common.mk
include vendor/qcom/common/qti-vendor.mk

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

# PA platform includes
include vendor/pa/main.mk

endif
