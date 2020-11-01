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

# Platform names
KONA := kona #SM8250
LITO := lito #SM7250
MSMNILE := msmnile #SM8150
MSMSTEPPE := sm6150
TRINKET := trinket #SM6125
ATOLL := atoll #SM6250
BENGAL := bengal # SM6115

B_FAMILY := msm8226 msm8610 msm8974 apq8084
B64_FAMILY := msm8992 msm8994
BR_FAMILY := msm8909 msm8916 msm8952 msm8976
UM_3_18_FAMILY := msm8937 msm8953 msm8996
UM_4_4_FAMILY := msm8998 sdm660
UM_4_9_FAMILY := sdm845 sdm710
UM_4_14_FAMILY := $(MSMNILE) $(MSMSTEPPE) $(TRINKET) $(ATOLL)
UM_4_19_FAMILY := $(KONA) $(LITO) $(BENGAL)
UM_PLATFORMS := $(UM_3_18_FAMILY) $(UM_4_4_FAMILY) $(UM_4_9_FAMILY) $(UM_4_14_FAMILY) $(UM_4_19_FAMILY)

#List of targets that use video hw
MSM_VIDC_TARGET_LIST := $(B_FAMILY) $(B64_FAMILY) $(BR_FAMILY) $(UM_3_18_FAMILY) $(UM_4_4_FAMILY) $(UM_4_9_FAMILY) $(UM_4_14_FAMILY) $(UM_4_19_FAMILY)

#List of targets that use master side content protection
MASTER_SIDE_CP_TARGET_LIST := msm8996 $(UM_3_18_FAMILY) $(UM_4_4_FAMILY) $(UM_4_9_FAMILY) $(UM_4_14_FAMILY) $(UM_4_19_FAMILY)

# AV
BOARD_USES_ADRENO := true
TARGET_USES_AOSP_FOR_AUDIO ?= false
TARGET_USES_QCOM_MM_AUDIO := true
TARGET_USES_ION := true

# Enable Media Extensions for HAL1 on Legacy Devices
ifneq ($(filter $(B_FAMILY) $(B64_FAMILY) $(BR_FAMILY) $(UM_3_18_FAMILY) $(UM_4_4_FAMILY),$(TARGET_BOARD_PLATFORM)),)
  TARGET_USES_MEDIA_EXTENSIONS := true
endif

# For pre-UM display and gps HAL
ifneq ($(filter $(B_FAMILY) $(B64_FAMILY) $(BR_FAMILY),$(TARGET_BOARD_PLATFORM)),)
  TARGET_USES_QCOM_BSP := true
endif

# SEPolicy
ifneq ($(TARGET_EXCLUDE_QCOM_SEPOLICY),true)
ifneq ($(BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE),)
include device/qcom/sepolicy_vndr/SEPolicy.mk
else
include device/qcom/sepolicy/SEPolicy.mk
endif
endif # Exclude QCOM SEPolicy
