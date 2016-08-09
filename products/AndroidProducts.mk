# Copyright (C) 2016 ParanoidAndroid Project
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
ifeq (pa_robin,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/robin/pa_robin.mk
endif

# Samsung Exynos
ifeq (pa_gts210ltexx,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/gts210ltexx/pa_gts210ltexx.mk
endif

# LG G Platform
ifeq (pa_d802,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/d802/pa_d802.mk
endif
ifeq (pa_d850,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/d850/pa_d850.mk
endif
ifeq (pa_d851,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/d851/pa_d851.mk
endif
ifeq (pa_d852,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/d852/pa_d852.mk
endif
ifeq (pa_d855,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/d855/pa_d855.mk
endif
ifeq (pa_ls990,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/ls990/pa_ls990.mk
endif
ifeq (pa_vs985,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/vs985/pa_vs985.mk
endif

