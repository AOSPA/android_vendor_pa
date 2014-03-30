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


# Add PA bootanimation based on xxhdpi xhdpi hdpi tvdpi resolution


# PA XXHDPI Devices
ifneq ($(filter pa_d800 pa_d801 pa_d802 pa_d803 pa_dlx pa_hlte pa_i9500 pa_jflte pa_ls980 pa_m7 pa_odin pa_vs980 pa_yuga,$(TARGET_PRODUCT)),)
    PRODUCT_COPY_FILES += \
        vendor/pa/prebuilt/bootanimation/1920x1080.zip:system/media/bootanimation.zip
endif

# PA XHDPI Devices
ifneq ($(filter pa_enrc2b pa_meliusltexx pa_evita pa_moto_msm8960 pa_moto_msm8960dt pa_d2lte pa_gee pa_geeb pa_hercules pa_i605 pa_i9300 pa_l900 pa_n7000 pa_n7100 pa_p880 pa_skyrocket pa_togari pa_v500,$(TARGET_PRODUCT)),)
    PRODUCT_COPY_FILES += \
        vendor/pa/prebuilt/bootanimation/1280x720.zip:system/media/bootanimation.zip
endif

# PA HDPI Devices
ifneq ($(filter pa_a510 pa_a700 pa_galaxysmtd pa_i9100,$(TARGET_PRODUCT)),)
    PRODUCT_COPY_FILES += \
        vendor/pa/prebuilt/bootanimation/800x480.zip:system/media/bootanimation.zip
endif

# PA TVDPI Devices
ifneq ($(filter pa_n5110 pa_n5100,$(TARGET_PRODUCT)),)
    PRODUCT_COPY_FILES += \
        vendor/pa/prebuilt/bootanimation/1920x1200.zip:system/media/bootanimation.zip
endif
