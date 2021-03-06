# Copyright (C) 2016-2020 Paranoid Android
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


# Product Makefiles
PRODUCT_MAKEFILES += \
    $(LOCAL_DIR)/angler/pa_angler.mk \
    $(LOCAL_DIR)/beryllium/pa_beryllium.mk \
    $(LOCAL_DIR)/cepheus/pa_cepheus.mk \
    $(LOCAL_DIR)/chiron/pa_chiron.mk \
    $(LOCAL_DIR)/davinci/pa_davinci.mk \
    $(LOCAL_DIR)/dipper/pa_dipper.mk \
    $(LOCAL_DIR)/equuleus/pa_equuleus.mk \
    $(LOCAL_DIR)/ginkgo/pa_ginkgo.mk \
    $(LOCAL_DIR)/jasmine_sprout/pa_jasmine_sprout.mk \
    $(LOCAL_DIR)/laurel_sprout/pa_laurel_sprout.mk \
    $(LOCAL_DIR)/mata/pa_mata.mk \
    $(LOCAL_DIR)/mini5g/pa_mini5g.mk \
    $(LOCAL_DIR)/oneplus5/pa_oneplus5.mk \
    $(LOCAL_DIR)/oneplus6/pa_oneplus6.mk \
    $(LOCAL_DIR)/oneplus7/pa_oneplus7.mk \
    $(LOCAL_DIR)/oneplus7pro/pa_oneplus7pro.mk \
    $(LOCAL_DIR)/oneplus7t/pa_oneplus7t.mk \
    $(LOCAL_DIR)/oneplus7tpro/pa_oneplus7tpro.mk \
    $(LOCAL_DIR)/oneplus8/pa_oneplus8.mk \
    $(LOCAL_DIR)/oneplus8pro/pa_oneplus8pro.mk \
    $(LOCAL_DIR)/oneplus8t/pa_oneplus8t.mk \
    $(LOCAL_DIR)/polaris/pa_polaris.mk \
    $(LOCAL_DIR)/raphael/pa_raphael.mk \
    $(LOCAL_DIR)/sagit/pa_sagit.mk \
    $(LOCAL_DIR)/surya/pa_surya.mk \
    $(LOCAL_DIR)/wayne/pa_wayne.mk \
    $(LOCAL_DIR)/X00TD/pa_X00TD.mk

# Lunch targets
COMMON_LUNCH_CHOICES += \
    pa_angler-userdebug \
    pa_beryllium-userdebug \
    pa_cepheus-userdebug \
    pa_chiron-userdebug \
    pa_davinci-userdebug \
    pa_dipper-userdebug \
    pa_equuleus-userdebug \
    pa_ginkgo-userdebug \
    pa_jasmine_sprout-userdebug \
    pa_laurel_sprout-userdebug \
    pa_mata-userdebug \
    pa_mini5g-userdebug \
    pa_oneplus6-userdebug \
    pa_oneplus7-userdebug \
    pa_oneplus7pro-userdebug \
    pa_oneplus7t-userdebug \
    pa_oneplus7tpro-userdebug \
    pa_oneplus8-userdebug \
    pa_oneplus8pro-userdebug \
    pa_oneplus8t-userdebug \
    pa_polaris-userdebug \
    pa_raphael-userdebug \
    pa_sagit-userdebug \
    pa_surya-userdebug \
    pa_wayne-userdebug \
    pa_X00TD-userdebug
