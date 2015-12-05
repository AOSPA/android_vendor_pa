# Copyright 2015 ParanoidAndroid Project
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

ifeq (pa_mako,$(TARGET_PRODUCT))

# Get the defaults going.
include vendor/pa/main.mk
$(call inherit-product, device/lge/mako/full_mako.mk)

# Override AOSP defaults that we want changed.
PRODUCT_NAME := pa_mako
PRODUCT_DEVICE := mako
PRODUCT_BRAND := Google
PRODUCT_MODEL := Nexus 4
PRODUCT_MANUFACTURER := LGE
PRODUCT_RESTRICT_VENDOR_FILES := false
PRODUCT_BUILD_PROP_OVERRIDES += \
	PRODUCT_NAME=occam \
	BUILD_FINGERPRINT="google/occam/mako:5.1.1/LMY48T/2237560:user/release-keys" \
	PRIVATE_BUILD_DESC="occam-user 5.1.1 LMY48T 2237560 release-keys"

endif
