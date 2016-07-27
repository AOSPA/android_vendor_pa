# Copyright (C) 2016 - The Paranoid Android Project
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
    $(LOCAL_DIR)/bacon/pa_bacon.mk \
    $(LOCAL_DIR)/oneplus2/pa_oneplus2.mk \
    $(LOCAL_DIR)/oneplus3/pa_oneplus3.mk \
    $(LOCAL_DIR)/onyx/pa_onyx.mk \
    $(LOCAL_DIR)/robin/pa_robin.mk

# Samsung Exynos
PRODUCT_MAKEFILES += $(LOCAL_DIR)/gts210ltexx/pa_gts210ltexx.mk

# LG G Platform
PRODUCT_MAKEFILES += \
    $(LOCAL_DIR)/d800/pa_d800.mk \
    $(LOCAL_DIR)/d801/pa_d801.mk \
    $(LOCAL_DIR)/d802/pa_d802.mk \
    $(LOCAL_DIR)/d850/pa_d850.mk \
    $(LOCAL_DIR)/d851/pa_d851.mk \
    $(LOCAL_DIR)/d852/pa_d852.mk \
    $(LOCAL_DIR)/d855/pa_d855.mk \
    $(LOCAL_DIR)/ls980/pa_ls980.mk \
    $(LOCAL_DIR)/ls990/pa_ls990.mk \
    $(LOCAL_DIR)/vs980/pa_vs980.mk \
    $(LOCAL_DIR)/vs985/pa_vs985.mk
