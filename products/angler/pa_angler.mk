# Copyright 2016-2017 Paranoid Android
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

ifeq (pa_angler,$(TARGET_PRODUCT))

# We have our own power HAL
TARGET_USES_DEVICE_SPECIFIC_POWERHAL := true

# Use AOSP Camera Application
TARGET_USES_AOSP_CAMERA := true

AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS := true
AUDIO_FEATURE_ENABLED_DSM_FEEDBACK := true

$(call inherit-product, device/huawei/angler/aosp_angler.mk)

# Generic CAF packages
include device/qcom/common/common.mk

# CAF display addons
PRODUCT_PACKAGES += \
    copybit.msm8994

# MSM8994 Display HAL settings
PRODUCT_PROPERTY_OVERRIDES += \
    debug.composition.type=c2d \
    debug.sf.hw=1 \
    persist.debug.wfd.enable=1 \
    persist.demo.hdmirotationlock=false \
    persist.hwc.enable_vds=1 \
    persist.hwc.mdpcomp.enable=true \
    persist.hwc.ptor.enable=true \
    persist.mdpcomp.4k2kSplit=1 \
    persist.hwc.mdpcomp.maxpermixer=5 \
    persist.mdpcomp_perfhint=50 \
    persist.metadata_dynfps.disable=true \
    persist.sys.wfd.virtual=0

# ROI (region of interest) is miscalculated right now
PRODUCT_PROPERTY_OVERRIDES += \
    persist.mdp.partialUpdate=false

# Get the defaults going.
TARGET_BOOT_ANIMATION_RES := 1440

# Paranoid Android platform
include vendor/pa/main.mk

# Override AOSP defaults that we want changed.
PRODUCT_NAME := pa_angler
PRODUCT_DEVICE := angler
PRODUCT_BRAND := google
PRODUCT_MODEL := Nexus 6P
PRODUCT_MANUFACTURER := Huawei
PRODUCT_RESTRICT_VENDOR_FILES := false
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=angler \
    BUILD_FINGERPRINT=google/angler/angler:7.1.2/N2G48B/4073501:user/release-keys \
    PRIVATE_BUILD_DESC="angler-user 7.1.2 N2G48B 4073501 release-keys"

endif
