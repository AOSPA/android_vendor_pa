#
# This policy configuration will be used by all products that
# inherit from vendor
#

BOARD_SEPOLICY_DIRS += \
    vendor/pa/sepolicy

BOARD_SEPOLICY_UNION += \
    app.te \
    bootanim.te \
    drmserver.te \
    file.te \
    file_contexts \
    mediaserver.te \
    seapp_contexts \
    service_contexts \
    system.te \
    zygote.te
