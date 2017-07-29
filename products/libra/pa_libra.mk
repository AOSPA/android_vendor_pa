ifeq (pa_libra,$(TARGET_PRODUCT))

## Device identifier. This must come after all inclusions
PRODUCT_NAME := pa_libra
include device/xiaomi/libra/libra.mk 

# Generic CAF packages
include device/qcom/common/common.mk

# Paranoid Android platform
include vendor/pa/main.mk
endif
