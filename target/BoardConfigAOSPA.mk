# Copyright (C) 2021 Paranoid Android
# SPDX-License-Identifier: MIT

# Kernel
include vendor/aospa/target/BoardConfigKernel.mk

# Qualcomm board
include device/qcom/common/BoardConfigQcom.mk

# SEPolicy
BOARD_PLAT_PRIVATE_SEPOLICY_DIR += \
    vendor/aospa/sepolicy/private

BOARD_PLAT_PUBLIC_SEPOLICY_DIR += \
    vendor/aospa/sepolicy/public

BOARD_VENDOR_SEPOLICY_DIRS += \
    vendor/aospa/sepolicy/vendor

# Soong
include vendor/aospa/target/BoardConfigSoong.mk
