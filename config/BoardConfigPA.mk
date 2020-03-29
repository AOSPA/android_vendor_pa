# Kernel
include vendor/pa/config/BoardConfigKernel.mk

# Soong
include vendor/pa/config/BoardConfigSoong.mk

# QCOM flags
ifeq ($(call is-vendor-board-platform,QCOM),true)
include device/qcom/common/BoardConfigQcom.mk
endif
