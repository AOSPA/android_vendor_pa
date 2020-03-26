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

# Paranoid Android packages
ifneq ($(TARGET_USES_AOSP_CAMERA),true)
PRODUCT_PACKAGES += ParanoidCamera
endif
PRODUCT_PACKAGES += \
    SoundRecorder \
    WallpaperPicker \
    LatinIME \
    LiveWallpapers \
    LiveWallpapersPicker \
    Longshot \
    ParanoidPapers \
    ParanoidQuickStep \
    ThemePicker \
    #ParanoidHub

ifeq ($(TARGET_DISABLES_GAPPS), true)
PRODUCT_PACKAGES += \
    ChromePublic \
    MarkupGoogle \
    MatchmakerPrebuilt
endif

# Paranoid Android Overlays
PRODUCT_PACKAGES += \
    pa-overlays \
    ParanoidOverlayStub

# Snapdragon apps
PRODUCT_PACKAGES += \
    SnapdragonGallery

# Abstruct
PRODUCT_PACKAGES += Abstruct

# Retro Music Player
PRODUCT_PACKAGES += RetroMusicPlayer

# CAF packages
# TCP Connection Management
PRODUCT_PACKAGES += tcmiface
PRODUCT_BOOT_JARS += tcmiface

# Bluetooth Audio (A2DP)
PRODUCT_PACKAGES += libbthost_if

# MSIM manual provisioning
PRODUCT_PACKAGES += telephony-ext
PRODUCT_BOOT_JARS += telephony-ext

# Extra tools in PA
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

# Filesystems tools
PRODUCT_PACKAGES += \
    fsck.exfat \
    fsck.ntfs \
    mke2fs \
    mkfs.exfat \
    mkfs.ntfs \
    mount.ntfs

# Openssh
PRODUCT_PACKAGES += \
    scp \
    sftp \
    ssh \
    sshd \
    sshd_config \
    ssh-keygen \
    start-ssh

# rsync
PRODUCT_PACKAGES += \
    rsync
