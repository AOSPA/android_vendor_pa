# Kernel
include vendor/pa/config/BoardConfigKernel.mk

# QCOM flags
ifeq ($(call is-vendor-board-platform,QCOM),true)
include vendor/pa/config/BoardConfigQcom.mk
endif

# Soong
include vendor/pa/config/BoardConfigSoong.mk

# Treble
# Create a flag for vendorless builds
ifeq ($(TARGET_COPY_OUT_VENDOR), vendor)
ifeq ($(BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE),)
TARGET_IS_VENDORLESS := true
endif
endif
# Enable ALLOW_MISSING_DEPENDENCIES on Vendorless Builds
ifeq ($(TARGET_IS_VENDORLESS),true)
  ALLOW_MISSING_DEPENDENCIES := true
endif
