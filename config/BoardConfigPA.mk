# Kernel
include vendor/pa/config/BoardConfigKernel.mk

# SEPolicy
ifeq ($(BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE),)
TARGET_USES_PREBUILT_VENDOR_SEPOLICY ?= true
endif

BOARD_PLAT_PUBLIC_SEPOLICY_DIR += \
    vendor/pa/sepolicy/common/public

BOARD_PLAT_PRIVATE_SEPOLICY_DIR += \
    vendor/pa/sepolicy/common/private

ifeq ($(TARGET_USES_PREBUILT_VENDOR_SEPOLICY), true)
BOARD_PLAT_PRIVATE_SEPOLICY_DIR += \
    vendor/pa/sepolicy/common/dynamic \
    vendor/pa/sepolicy/common/system-only
else
BOARD_VENDOR_SEPOLICY_DIRS += \
    vendor/pa/sepolicy/common/dynamic \
    vendor/pa/sepolicy/common/vendor
endif

# QCOM flags
ifeq ($(call is-vendor-board-platform,QCOM),true)
include vendor/pa/config/BoardConfigQcom.mk
endif

# Soong
include vendor/pa/config/BoardConfigSoong.mk
