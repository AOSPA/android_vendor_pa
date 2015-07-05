# Compile the kernel inline
# AndroidKernel.mk required in kernel sources

# Original Author Jameson Williams jameson.h.williams@intel.com
# Modified for pa

ifneq ($(filter pa_hammerhead,$(TARGET_PRODUCT)),)
  KERNEL_DIR := kernel/lge/hammerhead
  KERNEL_BINARY_IMAGE := zImage-dtb
  KERNEL_DEFCONFIG := pa_hammerhead_defconfig
endif

ifdef KERNEL_DIR
  include $(KERNEL_DIR)/AndroidKernel.mk
endif

# cp will do.
.PHONY: $(PRODUCT_OUT)/kernel
$(PRODUCT_OUT)/kernel: $(TARGET_PREBUILT_KERNEL)
	cp $(TARGET_PREBUILT_KERNEL) $(PRODUCT_OUT)/kernel
