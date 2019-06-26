# Kernel
include vendor/pa/config/BoardConfigKernel.mk

# SEPolicy
BOARD_PLAT_PRIVATE_SEPOLICY_DIR += \
    vendor/pa/sepolicy/private

BOARD_PLAT_PUBLIC_SEPOLICY_DIR += \
    vendor/pa/sepolicy/public

# QCOM flags
ifeq ($(call is-vendor-board-platform,QCOM),true)
include vendor/pa/config/BoardConfigQcom.mk
endif

# Soong
include vendor/pa/config/BoardConfigSoong.mk
