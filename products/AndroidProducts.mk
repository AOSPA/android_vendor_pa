# Copyright (C) 2021 Paranoid Android
# SPDX-License-Identifier: MIT

# Product Makefiles
PRODUCT_MAKEFILES += \
    $(LOCAL_DIR)/laurel_sprout/aospa_laurel_sprout.mk \
    $(LOCAL_DIR)/oneplus9/aospa_oneplus9.mk \
    $(LOCAL_DIR)/oneplus9pro/aospa_oneplus9pro.mk

# Lunch targets
COMMON_LUNCH_CHOICES += \
    aospa_laurel_sprout-userdebug \
    aospa_oneplus9-userdebug \
    aospa_oneplus9pro-userdebug
