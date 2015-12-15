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
ifeq (pa_angler,$(TARGET_PRODUCT))

# Include ParanoidAndroid common configuration
include vendor/pa/main.mk

# Inherit AOSP device configuration
$(call inherit-product, device/huawei/angler/aosp_angler.mk)

# Override AOSP build properties
PRODUCT_NAME := pa_angler
PRODUCT_BRAND := google
PRODUCT_MODEL := Nexus 6P
PRODUCT_MANUFACTURER := huawei
PRODUCT_BUILD_PROP_OVERRIDES += \
	PRODUCT_NAME=angler \
	BUILD_FINGERPRINT=google/angler/angler:6.0.1/MMB29M/2431559:user/release-keys \
	PRIVATE_BUILD_DESC="angler-user 6.0.1 MMB29M 2431559 release-keys"

endif
