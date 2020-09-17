# QCOM flags
ifeq ($(call is-vendor-board-platform,QCOM),true)
include vendor/pa/config/BoardConfigQcom.mk
endif

# SEPolicy
BOARD_PLAT_PRIVATE_SEPOLICY_DIR += \
    vendor/pa/sepolicy/private
