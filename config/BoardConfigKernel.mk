TARGET_COMPILE_WITH_MSM_KERNEL := true

# Architecture
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64

# Compiler
TARGET_KERNEL_CROSS_COMPILE_PREFIX := $(shell pwd)/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin/aarch64-linux-android-
KERNEL_LLVM_SUPPORT := true

# Defining BOARD_PREBUILT_DTBOIMAGE here as AndroidBoardCommon.mk
# is included before build/core/Makefile, where it is required to
# set the dependencies on prebuilt_dtbo.img based on definition of
# BOARD_PREBUILT_DTBOIMAGE
ifneq ($(strip $(BOARD_KERNEL_SEPARATED_DTBO)),)
BOARD_PREBUILT_DTBOIMAGE := $(PRODUCT_OUT)/prebuilt_dtbo.img
endif
