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
ifeq (pa_bullhead,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/bullhead/pa_bullhead.mk
endif
ifeq (pa_angler,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/angler/pa_angler.mk
endif
ifeq (pa_deb,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/deb/pa_deb.mk
endif
ifeq (pa_flo,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/flo/pa_flo.mk
endif
ifeq (pa_flounder,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/flounder/pa_flounder.mk
endif
ifeq (pa_grouper,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/grouper/pa_grouper.mk
endif
ifeq (pa_hammerhead,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/hammerhead/pa_hammerhead.mk
endif
ifeq (pa_mako,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/mako/pa_mako.mk
endif
ifeq (pa_manta,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/manta/pa_manta.mk
endif
ifeq (pa_shamu,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/shamu/pa_shamu.mk
endif
ifeq (pa_tilapia,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/tilapia/pa_tilapia.mk
endif

# Sony Yukon platform
ifeq (pa_flamingo,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/flamingo/pa_flamingo.mk
endif
ifeq (pa_eagle,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/eagle/pa_eagle.mk
endif
ifeq (pa_tianchi,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/tianchi/pa_tianchi.mk
endif
ifeq (pa_seagull,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/seagull/pa_seagull.mk
endif

# Sony Rhine platform
ifeq (pa_honami,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/honami/pa_honami.mk
endif
ifeq (pa_amami,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/amami/pa_amami.mk
endif
ifeq (pa_togari,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/togari/pa_togari.mk
endif

# Sony Shinano platform
ifeq (pa_amami,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/amami/pa_amami.mk
endif
ifeq (pa_sirius,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/sirius/pa_sirius.mk
endif
ifeq (pa_castor,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/castor/pa_castor.mk
endif
ifeq (pa_castor_windy,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/castor_windy/pa_castor_windy.mk
endif

# Sony Kitakami platform
ifeq (pa_ivy,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/ivy/pa_ivy.mk
endif
ifeq (pa_karin,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/karin/pa_karin.mk
endif
ifeq (pa_karin_windy,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/karin_windy/pa_karin_windy.mk
endif

# CAF
ifeq (pa_bacon,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/bacon/pa_bacon.mk
endif
ifeq (pa_oneplus2,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/oneplus2/pa_oneplus2.mk
endif
ifeq (pa_oneplus3,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/oneplus3/pa_oneplus3.mk
endif
ifeq (pa_onyx,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/onyx/pa_onyx.mk
endif
ifeq (pa_r7plus,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/r7plus/pa_r7plus.mk
endif
ifeq (pa_trltexx,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/trltexx/pa_trltexx.mk
endif
ifeq (pa_titan,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/titan/pa_titan.mk
endif

# Samsung Exynos
ifeq (pa_gts210ltexx,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/gts210ltexx/pa_gts210ltexx.mk
endif

# LG G Platform
ifeq (pa_vs985,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/vs985/pa_vs985.mk
endif
