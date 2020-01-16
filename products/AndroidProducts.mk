# Copyright (C) 2016-2019 Paranoid Android
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


# CAF
PRODUCT_MAKEFILES += \
    $(LOCAL_DIR)/beryllium/pa_beryllium.mk \
    $(LOCAL_DIR)/cepheus/pa_cepheus.mk \
    $(LOCAL_DIR)/davinci/pa_davinci.mk \
    $(LOCAL_DIR)/dipper/pa_dipper.mk \
    $(LOCAL_DIR)/gemini/pa_gemini.mk \
    $(LOCAL_DIR)/onc/pa_onc.mk \
    $(LOCAL_DIR)/oneplus3/pa_oneplus3.mk \
    $(LOCAL_DIR)/oneplus6/pa_oneplus6.mk \
    $(LOCAL_DIR)/oneplus7pro/pa_oneplus7pro.mk \
    $(LOCAL_DIR)/polaris/pa_polaris.mk \
    $(LOCAL_DIR)/sagit/pa_sagit.mk \

# SONY OpenDevices
# Loire 8956
PRODUCT_MAKEFILES += \
    $(LOCAL_DIR)/kugo/pa_kugo.mk \
    $(LOCAL_DIR)/suzu/pa_suzu.mk

# Tone 8996
PRODUCT_MAKEFILES += \
    $(LOCAL_DIR)/dora/pa_dora.mk \
    $(LOCAL_DIR)/kagura/pa_kagura.mk \
    $(LOCAL_DIR)/keyaki/pa_keyaki.mk

# Lunch targets
COMMON_LUNCH_CHOICES += \
    pa_beryllium-userdebug \
    pa_cepheus-userdebug \
    pa_davinci-userdebug \
    pa_dipper-userdebug \
    pa_dora-userdebug \
    pa_gemini-userdebug \
    pa_kagura-userdebug \
    pa_keyaki-userdebug \
    pa_kugo-userdebug \
    pa_onc-userdebug \
    pa_oneplus3-userdebug \
    pa_oneplus6-userdebug \
    pa_oneplus7pro-userdebug \
    pa_polaris-userdebug \
    pa_sagit-userdebug \
    pa_suzu-userdebug
