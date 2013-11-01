# Copyright (C) 2013 ParanoidAndroid Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Include overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/$VENDOR/overlay/common
PRODUCT_PACKAGE_OVERLAYS += vendor/$VENDOR/overlay/$(TARGET_PRODUCT)

# Include release tool
TARGET_CUSTOM_RELEASETOOL := source vendor/$VENDOR/tools/squisher

# Copy custom ramdisk
PRODUCT_COPY_FILES += \
    VENDOR/$VENDOR/prebuilt/common/etc/init.$VENDOR.rc:root/init.$VENDOR.rc

# init.d script support
PRODUCT_COPY_FILES += \
    VENDOR/$VENDOR/prebuilt/common/bin/sysinit:system/bin/sysinit 

# userinit support
PRODUCT_COPY_FILES += \
    VENDOR/$VENDOR/prebuilt/common/etc/init.d/90userinit:system/etc/init.d/90userinit

# Gapps backup script
PRODUCT_COPY_FILES += \
    VENDOR/$VENDOR/prebuilt/common/bin/backuptool.sh:system/bin/backuptool.sh \
    VENDOR/$VENDOR/prebuilt/common/bin/backuptool.functions:system/bin/backuptool.functions \
    VENDOR/$VENDOR/prebuilt/common/bin/50-backupScript.sh:system/addon.d/50-backupScript.sh



