# Copyright (C) 2014 ParanoidAndroid Project
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

# Check for target product
ifeq (pa_flounder,$(TARGET_PRODUCT))

# Include ParanoidAndroid common configuration
include vendor/pa/main.mk

# Inherit AOSP device configuration
$(call inherit-product, device/htc/flounder/full_flounder.mk)

# Override AOSP build properties
PRODUCT_NAME := pa_flounder
PRODUCT_BRAND := google
PRODUCT_MODEL := Nexus 9
PRODUCT_MANUFACTURER := HTC
PRODUCT_BUILD_PROP_OVERRIDES += \
	PRODUCT_NAME=flounder \
	BUILD_FINGERPRINT="google/volantis/flounder:6.0.1/MMB29R/2482564:user/release-keys" \
	PRIVATE_BUILD_DESC="volantis-user 6.0.1 MMB29R 2482564 release-keys" \

endif
