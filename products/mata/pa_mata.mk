# Check for target product
ifeq (pa_mata,$(TARGET_PRODUCT))

# inherit from device
include device/essential/mata/aosp_mata.mk

# PA platform includes
include vendor/pa/config/common_full_phone.mk

# CAF includes
include device/qcom/common/common.mk
include vendor/qcom/common/av/qti-av.mk
include vendor/qcom/common/bt/qti-bt.mk
include vendor/qcom/common/perf/qti-perf.mk

# Only exclude normal sepolicy so we can opt into legacy
TARGET_EXCLUDE_QCOM_SEPOLICY := true

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

endif
