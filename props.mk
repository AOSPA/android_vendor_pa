# Copyright (C) 2013-2019 Paranoid Android
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

ifeq ($(PA_VERSION_APPEND_TIME_OF_DAY),true)
PA_ZIP := $(call lc,$(PA_VERSION_FLAVOR))-$(PA_VERSION_CODE)-$(call lc,$(PA_BUILD_VARIANT))-$(shell date -u +%Y%m%d_%H%M%S)
else
PA_ZIP := $(call lc,$(PA_VERSION_FLAVOR))-$(PA_VERSION_CODE)-$(call lc,$(PA_BUILD_VARIANT))-$(shell date -u +%Y%m%d)
endif

# Include versioning information
export PA_VERSION := $(PA_VERSION_FLAVOR) $(PA_VERSION_CODE) $(PA_BUILD_VARIANT)
export ROM_VERSION := $(PA_ZIP)
ADDITIONAL_BUILD_PROPERTIES += \
    ro.modversion=$(ROM_VERSION) \
    ro.pa.version=$(PA_VERSION)

# Override undesired Google defaults
ADDITIONAL_BUILD_PROPERTIES += \
    keyguard.no_require_sim=true \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.com.google.clientidbase=android-google \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.setupwizard.require_network=any \
    ro.setupwizard.mode=OPTIONAL \
    ro.opa.eligible_device=true

# Override old AOSP default sounds with newer Google stock ones
ADDITIONAL_BUILD_PROPERTIES += \
    ro.config.alarm_alert=Bright_morning.ogg \
    ro.config.notification_sound=End_note.ogg \
    ro.config.ringtone=Leaps_and_bounds.ogg

# Allow tethering without provisioning app
ADDITIONAL_BUILD_PROPERTIES += net.tethering.noprovisioning=true

