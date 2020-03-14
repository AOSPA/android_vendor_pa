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

# Check for target product
ifeq (pa_hltetmo,$(TARGET_PRODUCT))

# Inherit Device Configuration
$(call inherit-product, device/samsung/hltetmo/full_hltetmo.mk)

# Inherit common PA configuration
$(call inherit-product, vendor/pa/config/common_full_phone.mk)
$(call inherit-product, device/qcom/common/common.mk)

PRODUCT_DEVICE := hltetmo
PRODUCT_NAME := pa_hltetmo

endif
