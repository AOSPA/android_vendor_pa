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

LOCAL_PATH := vendor/pa/overlay

include $(CLEAR_VARS)

LOCAL_MODULE := AOSPAOverlays
LOCAL_REQUIRED_MODULES := \
    AccentColorDodgerBlueOverlay \
    AccentColorHadalZoneOverlay \
    AccentColorLostInForestOverlay \
    AccentColorPixelBlueOverlay \
    AccentColorPurpleHeatOverlay \
    AccentColorRedOverlay \
    AccentColorRoseOverlay \
    AccentColorScooterOverlay \
    AccentColorSlateOverlay \
    AccentColorSuperNovaOverlay \
    AccentColorTealOverlay \
    AccentColorTorchRedOverlay \
    AOSPABluetoothOverlay \
    AOSPAContactsProviderOverlay \
    AOSPAFrameworksOverlay \
    AOSPAOverlayStub \
    AOSPASettingsOverlay \
    AOSPASettingsProviderOverlay \
    AOSPASystemUIOverlay \
    AOSPATelephonyOverlay \
    AOSPAThemePickerOverlay \
    FontGoogleSansOverlay \
    FontSlateForOnePlusOverlay \
    ParanoidDozeOverlay \
    ParanoidHubOverlay \
    ParanoidLauncherOverlay

include $(BUILD_PHONY_PACKAGE)

include $(call first-makefiles-under,$(LOCAL_PATH))
