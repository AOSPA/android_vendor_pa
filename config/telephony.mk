# Sensitive Phone Numbers list
PRODUCT_COPY_FILES += \
    vendor/pa/prebuilt/etc/sensitive_pn.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sensitive_pn.xml

# World APN list
PRODUCT_COPY_FILES += vendor/pa/prebuilt/etc/apns-conf.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/apns-conf.xml

# Telephony packages
PRODUCT_PACKAGES += \
    Stk \
    CellBroadcastReceiver

# Default ringtone
PRODUCT_PRODUCT_PROPERTIES += \
    ro.config.ringtone=Leaps_and_bounds.ogg

# Tethering - allow without requiring a provisioning app
# (for devices that check this)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    net.tethering.noprovisioning=true

# IMS
PRODUCT_PACKAGES += \
    ims-ext-common \
    ims_ext_common.xml

# HIDL Wrapper
PRODUCT_PACKAGES += \
    qti-telephony-hidl-wrapper \
    qti_telephony_hidl_wrapper.xml

# MSIM manual provisioning
PRODUCT_PACKAGES += telephony-ext
PRODUCT_BOOT_JARS += telephony-ext

# TCP Connection Management
PRODUCT_PACKAGES += tcmiface
PRODUCT_BOOT_JARS += tcmiface

# QTI Telephony Utils
PRODUCT_PACKAGES += \
    qti-telephony-utils \
    qti_telephony_utils.xml
