TARGET_COMPILE_WITH_MSM_KERNEL := true

# Architecture
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64

# Compiler
TARGET_KERNEL_CROSS_COMPILE_PREFIX := $(shell pwd)/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin/aarch64-linux-android-
KERNEL_LLVM_SUPPORT := true

ifeq ($(BOARD_KERNEL_SEPARATED_DTBO),true)
    BOARD_PREBUILT_DTBOIMAGE ?= $(TARGET_OUT_INTERMEDIATES)/DTBO_OBJ/arch/$(TARGET_KERNEL_ARCH)/boot/dtbo.img
endif
