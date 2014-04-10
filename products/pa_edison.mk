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
ifeq (pa_edison,$(TARGET_PRODUCT))

# OVERLAY_TARGET adds overlay asset source
OVERLAY_TARGET := pa_xhdpi

# Build paprefs from source
PREFS_FROM_SOURCE := false

# Inherit telephony common stuff
$(call inherit-product, vendor/pa/configs/telephony.mk)

# Include AOSPA common configuration
include vendor/pa/main.mk

# Inherit device configuration
$(call inherit-product, device/motorola/edison/full_edison.mk)

# Override AOSP build properties
PRODUCT_NAME := pa_edison
PRODUCT_BRAND := Motorola
PRODUCT_DEVICE := edison
PRODUCT_MODEL := MB865
PRODUCT_MANUFACTURER := Motorola
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=MB865_att TARGET_DEVICE=edison BUILD_FINGERPRINT="motorola/MB865_att/edison:4.0.4/6.7.2-226-EDICS-10/67.21.125:user/release-keys" PRIVATE_BUILD_DESC="edison-user 4.0.4 6.7.2-226-EDICS-10 67.21.125 release-keys"

endif
