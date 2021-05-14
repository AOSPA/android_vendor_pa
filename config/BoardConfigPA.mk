# Kernel
include vendor/pa/config/BoardConfigKernel.mk

# QCOM flags
#ifeq ($(call is-vendor-board-platform,QCOM),true)
#include device/qcom/common/BoardConfigQcom.mk
#endif

# SEPolicy
BOARD_PLAT_PRIVATE_SEPOLICY_DIR += \
    vendor/pa/sepolicy/private

BOARD_PLAT_PUBLIC_SEPOLICY_DIR += \
    vendor/pa/sepolicy/public

BOARD_VENDOR_SEPOLICY_DIRS += \
    vendor/pa/sepolicy/vendor

# Soong
include vendor/pa/config/BoardConfigSoong.mk