ifeq (pa_p3100,$(TARGET_PRODUCT))
# Build paprefs from sources
PREFS_FROM_SOURCE ?= false

# Inherit telephony common stuff
$(call inherit-product, vendor/pa/configs/telephony.mk)

# Include AOSPA common configuration
include vendor/pa/main.mk

# Inherit AOSP device configuration
$(call inherit-product, device/samsung/p3100/full_p3100.mk)

# Override AOSP build properties
PRODUCT_NAME := pa_p3100
PRODUCT_BRAND := samsung
PRODUCT_MODEL := GT-P3100
PRODUCT_MANUFACTURER := samsung

#Set build fingerprint / ID / Prduct Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=espressorfxx \
    TARGET_DEVICE=espressorf \
    BUILD_FINGERPRINT="samsung/espressorfxx/espressorf:4.2.2/JDQ39/P3100XWDNA1:user/release-keys" \
    PRIVATE_BUILD_DESC="espressorfxx-user 4.2.2 JDQ39 P3100XWDNA1 release-keys"
    
PRODUCT_RELEASE_NAME := GT-P3100
endif
