# Copyright (C) 2015 ParanoidAndroid Project
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

# Nexus
PRODUCT_MAKEFILES += $(LOCAL_DIR)/bullhead/pa_bullhead.mk \
                                          $(LOCAL_DIR)/angler/pa_angler.mk \
                                          $(LOCAL_DIR)/deb/pa_deb.mk \
                                          $(LOCAL_DIR)/flo/pa_flo.mk \
                                          $(LOCAL_DIR)/flounder/pa_flounder.mk \
                                          $(LOCAL_DIR)/hammerhead/pa_hammerhead.mk \
                                          $(LOCAL_DIR)/manta/pa_manta.mk \
                                          $(LOCAL_DIR)/shamu/pa_shamu.mk \
                                          $(LOCAL_DIR)/dragon/pa_dragon.mk
# Sony Yukon platform
PRODUCT_MAKEFILES += $(LOCAL_DIR)/flamingo/pa_flamingo.mk \
                                          $(LOCAL_DIR)/eagle/pa_eagle.mk \
                                          $(LOCAL_DIR)/tianchi/pa_tianchi.mk \
                                          $(LOCAL_DIR)/seagull/pa_seagull.mk

# Sony Rhine platform
PRODUCT_MAKEFILES += $(LOCAL_DIR)/honami/pa_honami.mk \
                                          $(LOCAL_DIR)/amami/pa_amami.mk \
                                          $(LOCAL_DIR)/togari/pa_togari.mk

# Sony Shinano platform
PRODUCT_MAKEFILES += $(LOCAL_DIR)/aries/pa_aries.mk \
                                          $(LOCAL_DIR)/sirius/pa_sirius.mk \
                                          $(LOCAL_DIR)/castor/pa_castor.mk \
                                          $(LOCAL_DIR)/castor_windy/pa_castor_windy.mk \
                                          $(LOCAL_DIR)/leo/pa_leo.mk \
                                          $(LOCAL_DIR)/scorpion/pa_scorpion.mk \
                                          $(LOCAL_DIR)/scorpion_windy/pa_scorpion_windy.mk

# Sony Kitakami platform
PRODUCT_MAKEFILES += $(LOCAL_DIR)/ivy/pa_ivy.mk \
                                          $(LOCAL_DIR)/karin/pa_karin.mk \
                                          $(LOCAL_DIR)/karin_windy/pa_karin_windy.mk \
                                          $(LOCAL_DIR)/sumire/pa_sumire.mk \
                                          $(LOCAL_DIR)/suzuran/pa_suzuran.mk \
                                          $(LOCAL_DIR)/satsuki/pa_satsuki.mk
