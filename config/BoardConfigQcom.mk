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

# AV
BOARD_USES_ADRENO := true
TARGET_USES_AOSP_FOR_AUDIO ?= false
TARGET_USES_QCOM_MM_AUDIO := true
TARGET_USES_ION := true

# Enable Media Extensions for HAL1 on Legacy Devices
ifeq ($(call is-board-platform-in-list, apq8084 msm8226 msm8909 msm8916 msm8937 msm8952 msm8953 msm8960 msm8974 msm8976 msm8992 msm8994 msm8996 msm8998 sdm660),true)
  TARGET_USES_MEDIA_EXTENSIONS := true
endif

# For pre-UM display and gps HAL
ifeq ($(call is-board-platform-in-list, apq8084 msm8226 msm8610 msm8974 msm8992 msm8994 msm8909 msm8916 msm8952 msm8976),true)
  TARGET_USES_QCOM_BSP := true
endif

# Power
# Disable Binderized Power HAL by default for legacy targets.
# Devices can still opt in by setting TARGET_USES_NON_LEGACY_POWERHAL in BoardConfig.mk.
# Conversely, recent chips, such as sm8150 with an old vendor can opt out.
ifneq ($(TARGET_PROVIDES_POWERHAL),true)
ifneq ($(call is-board-platform-in-list, apq8084 msm8226 msm8909 msm8916 msm8937 msm8952 msm8953 msm8960 msm8974 msm8976 msm8992 msm8994 msm8996 msm8998 sdm660 sdm710 sdm845 trinket),true)
TARGET_USES_NON_LEGACY_POWERHAL ?= true
endif
endif

# SEPolicy
# Boards can opt-out of QCOM sepolicy
ifneq ($(TARGET_EXCLUDE_QCOM_SEPOLICY),true)

# Allow boards to use a different sepolicy
ifeq ($(filter true,$(TARGET_USES_QCOM_LEGACY_PRE_UM_SEPOLICY) $(TARGET_USES_QCOM_LEGACY_UM_SEPOLICY) $(TARGET_USES_QCOM_LEGACY_SEPOLICY) $(TARGET_USES_QCOM_LATEST_SEPOLICY)),)

    ifeq ($(call is-board-platform-in-list, apq8084 msm8226 msm8909 msm8916 msm8952 msm8960 msm8974 msm8976 msm8992 msm8994),true)
        # Use QCOM legacy pre-UM SEPolicy by default for legacy pre-UM boards
        TARGET_USES_QCOM_LEGACY_PRE_UM_SEPOLICY ?= true
        SELINUX_IGNORE_NEVERALLOWS_ON_USER ?= true
    else ifeq ($(call is-board-platform-in-list, msm8937 msm8953 msm8996 msm8998 sdm660),true)
        # Use QCOM legacy UM SEPolicy by default for legacy UM boards
        TARGET_USES_QCOM_LEGACY_UM_SEPOLICY ?= true
    else ifeq ($(call is-board-platform-in-list, sdm845 sdm710),true)
        # Use QCOM legacy SEPolicy by default for legacy boards
        TARGET_USES_QCOM_LEGACY_SEPOLICY ?= true
    else
        # Use QCOM latest SEPolicy by default for latest boards
        TARGET_USES_QCOM_LATEST_SEPOLICY ?= true
    endif

endif # Allow boards to use a different sepolicy

# Enable latest sepolicy for legacy boards
ifeq ($(TARGET_USES_QCOM_LEGACY_SEPOLICY),true)
    # Use QCOM latest SEPolicy by default for latest boards
    TARGET_USES_QCOM_LATEST_SEPOLICY ?= true
endif

ifeq (,$(filter msm8226 msm8610 msm8974 msm8909 msm8916 msm8952 msm8992 msm8994 msm8937 msm8953 msm8996 msm8998 sdm660 sdm710 sdm845, $(TARGET_BOARD_PLATFORM)))
BOARD_SEPOLICY_M4DEFS += \
    qdisplay_service=vendor_qdisplay_service \
    sysfs_graphics=vendor_sysfs_graphics \
    hal_keymaster_qti_exec=vendor_hal_keymaster_qti_exec \
    persist_block_device=vendor_persist_block_device \
    display_vendor_data_file=vendor_display_vendor_data_file \
    hal_perf_default=vendor_hal_perf_default \
    sysfs_battery_supply=vendor_sysfs_battery_supply \
    sysfs_usb_supply=vendor_sysfs_usb_supply
endif

ifneq ($(BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE),)
include device/qcom/sepolicy_vndr/SEPolicy.mk
else
TARGET_USES_PREBUILT_VENDOR_SEPOLICY ?= true
include device/qcom/sepolicy/SEPolicy.mk
endif

BOARD_PLAT_PRIVATE_SEPOLICY_DIR += \
    vendor/pa/sepolicy/qcom/private

ifeq ($(TARGET_USES_PREBUILT_VENDOR_SEPOLICY), true)
BOARD_PLAT_PRIVATE_SEPOLICY_DIR += \
    vendor/pa/sepolicy/qcom/dynamic \
    vendor/pa/sepolicy/qcom/system-only
else
BOARD_VENDOR_SEPOLICY_DIRS += \
    vendor/pa/sepolicy/qcom/dynamic \
    vendor/pa/sepolicy/qcom/vendor
endif

endif # Exclude QCOM SEPolicy
