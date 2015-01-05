#
# This policy configuration will be used by all products that
# inherit from vendor
#

BOARD_SEPOLICY_DIRS += \
    vendor/pa/sepolicy

BOARD_SEPOLICY_UNION += \
    file.te \
    file_contexts \
    service_contexts \
    system.te \
    app.te \
    bootanim.te \
    zygote.te
