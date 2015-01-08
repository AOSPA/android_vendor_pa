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

# Add PA bootanimation based on device resolution
ifneq ($(filter pa_mako pa_grouper pa_tilapia,$(TARGET_PRODUCT)),)
    PRODUCT_COPY_FILES += \
        vendor/pa/prebuilt/bootanimation/1280x720.zip:system/media/bootanimation.zip
endif
ifeq ($(filter pa_hammerhead pa_shamu,$(TARGET_PRODUCT)),)
    PRODUCT_COPY_FILES += \
        vendor/pa/prebuilt/bootanimation/1920x1080.zip:system/media/bootanimation.zip
endif
ifneq ($(filter pa_deb pa_flo pa_flounder,$(TARGET_PRODUCT)),)
    PRODUCT_COPY_FILES += \
        vendor/pa/prebuilt/bootanimation/1920x1200.zip:system/media/bootanimation.zip
endif
ifeq (pa_manta,$(TARGET_PRODUCT))
    PRODUCT_COPY_FILES += \
        vendor/pa/prebuilt/bootanimation/2560x1600.zip:system/media/bootanimation.zip
endif
