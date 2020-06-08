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

# QTI Telephony Utils
PRODUCT_PACKAGES += \
    qti-telephony-utils \
    qti_telephony_utils.xml

# QTI VNDK Framework Detect
PRODUCT_PACKAGES += \
    libvndfwk_detect_jni.qti \
    libqti_vndfwk_detect \
    libvndfwk_detect_jni.qti.vendor \
    libqti_vndfwk_detect.vendor
