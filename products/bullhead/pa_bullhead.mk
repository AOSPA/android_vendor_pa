# Copyright 2016 ParanoidAndroid Project
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

ifeq (pa_bullhead,$(TARGET_PRODUCT))

# Use the full CAF BSP
TARGET_USES_AOSP := false

# We have our own power HAL
TARGET_USES_DEVICE_SPECIFIC_POWERHAL := true

# CAF media
#TARGET_USES_MEDIA_EXTENSIONS := true

$(call inherit-product, device/lge/bullhead/aosp_bullhead.mk)

# Generic CAF packages
include device/qcom/common/common.mk

# Generic CAF audio config
$(call inherit-product, hardware/qcom/audio/configs/msm8992/msm8992.mk)

# CAF display addons
PRODUCT_PACKAGES += \
    copybit.msm8992

# MSM8992 HAL settings
PRODUCT_PROPERTY_OVERRIDES += \
    debug.composition.type=c2d \
    debug.sf.hw=1 \
    persist.debug.wfd.enable=1 \
    persist.demo.hdmirotationlock=false \
    persist.hwc.enable_vds=1 \
    persist.hwc.mdpcomp.enable=true \
    persist.hwc.ptor.enable=true \
    persist.mdpcomp.4k2kSplit=1 \
    persist.mdpcomp_perfhint=50 \
    persist.metadata_dynfps.disable=true \
    persist.sys.wfd.virtual=0

# CAF camcorder
PRODUCT_PROPERTY_OVERRIDES += \
    vidc.enc.dcvs.extra-buff-count=2 \
    media.camera.ts.monotonic=0

# ROI (region of interest) is miscalculated right now
PRODUCT_PROPERTY_OVERRIDES += \
    persist.mdp.partialUpdate=false

# Get the defaults going.
TARGET_BOOT_ANIMATION_RES := 1080

# Paranoid Android platform
include vendor/pa/main.mk

# Override AOSP defaults that we want changed.
PRODUCT_NAME := pa_bullhead
PRODUCT_DEVICE := bullhead
PRODUCT_BRAND := google
PRODUCT_MODEL := Nexus 5X
PRODUCT_MANUFACTURER := LGE
PRODUCT_RESTRICT_VENDOR_FILES := false
PRODUCT_BUILD_PROP_OVERRIDES += \
	PRODUCT_NAME=bullhead \
	BUILD_FINGERPRINT=google/bullhead/bullhead:7.0/NBD90W/3239497:user/release-keys \
        PRIVATE_BUILD_DESC="bullhead-user 7.0 NBD90W 3239497 release-keys"

endif
