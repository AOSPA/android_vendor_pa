# Copyright (C) 2020 Paranoid Android
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

# Abstruct
PRODUCT_PACKAGES += Abstruct

# AOSP Packages
PRODUCT_PACKAGES += \
    SoundRecorder \
    WallpaperPicker \
    LatinIME \
    LiveWallpapers \
    LiveWallpapersPicker \
    ThemePicker

# Bluetooth Audio (A2DP)
PRODUCT_PACKAGES += libbthost_if

# Charger mode images
PRODUCT_PACKAGES += \
    charger_res_images

ifneq ($(TARGET_USES_AOSP_CHARGER),true)
PRODUCT_PACKAGES += \
    product_charger_res_images
endif

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.manager@1.0 \
    android.hidl.base@1.0.vendor \
    android.hidl.manager@1.0.vendor

# Neural Network
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full-rtti

# Paranoid Packages
ifneq ($(TARGET_USES_AOSP_CAMERA),true)
PRODUCT_PACKAGES += ParanoidCamera
endif

PRODUCT_PACKAGES += \
    Longshot \
    ParanoidPapers \
    ParanoidQuickStep \

ifneq ($(filter RELEASE BETA,$(PA_BUILDTYPE)),)
    PRODUCT_PACKAGES += \
    ParanoidHub
endif

TARGET_ENABLE_FACE_SENSE := true
PRODUCT_PACKAGES += \
    ParanoidFaceSense
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.face.sense_service=$(TARGET_ENABLE_FACE_SENSE)

ifeq ($(TARGET_DISABLES_GAPPS), true)
PRODUCT_PACKAGES += \
    ChromeModernPublic \
    MarkupGoogle \
    MatchmakerPrebuilt
endif

# Paranoid Android Overlays
PRODUCT_PACKAGES += \
    pa-overlays \
    ParanoidOverlayStub

# QTI VNDK Framework Detect
PRODUCT_PACKAGES += \
    libvndfwk_detect_jni.qti \
    libqti_vndfwk_detect \
    libvndfwk_detect_jni.qti.vendor \
    libqti_vndfwk_detect.vendor

# Retro Music Player
PRODUCT_PACKAGES += RetroMusicPlayer

# Snapdragon Apps
PRODUCT_PACKAGES += \
    SnapdragonGallery

# Tools - FS
PRODUCT_PACKAGES += \
    fsck.exfat \
    fsck.ntfs \
    mke2fs \
    mkfs.exfat \
    mkfs.ntfs \
    mount.ntfs

# Tools - Misc
PRODUCT_PACKAGES += \
    7z \
    awk \
    bash \
    bzip2 \
    curl \
    getcap \
    htop \
    lib7z \
    libsepol \
    nano \
    pigz \
    powertop \
    setcap \
    unrar \
    unzip \
    vim \
    wget \
    zip

# Tools - openssh
PRODUCT_PACKAGES += \
    scp \
    sftp \
    ssh \
    sshd \
    sshd_config \
    ssh-keygen \
    start-ssh

# Tools - rsync
PRODUCT_PACKAGES += \
    rsync
