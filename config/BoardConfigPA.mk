# Kernel
include vendor/pa/config/BoardConfigKernel.mk

# QCOM flags
ifeq ($(call is-vendor-board-platform,QCOM),true)
include vendor/pa/config/BoardConfigQcom.mk
endif

# Soong
include vendor/pa/config/BoardConfigSoong.mk
