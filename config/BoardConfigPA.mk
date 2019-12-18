# Kernel
include vendor/pa/config/BoardConfigKernel.mk

# QCOM flags
ifeq ($(call is-vendor-board-platform,QCOM),true)
include vendor/pa/config/BoardConfigQcom.mk
endif

# Soong
include vendor/pa/config/BoardConfigSoong.mk

ifneq ($(TARGET_USES_PREBUILT_CAMERA_SERVICE), true)
PRODUCT_SOONG_NAMESPACES += \
    frameworks/av/camera/cameraserver \
    frameworks/av/services/camera/libcameraservice
endif
