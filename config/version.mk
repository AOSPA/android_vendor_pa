#
# Copyright (C) 2019 Paranoid Android
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
#

#
# Handle various build version information.
#
# Guarantees that the following are defined:
#     PA_VERSION_FLAVOR
#     PA_VERSION_CODE
#     PA_BUILD_VARIANT
#

ifndef PA_VERSION_FLAVOR
  # This is the global pa version flavor that determines the focal point
  # behind our releases. This is bundled alongside the $(PA_VERSION_CODE)
  # and only changes per major Android releases.
  PA_VERSION_FLAVOR := Quartz
endif

ifndef PA_VERSION_CODE
  # The version code is the upgradable portion during the cycle of
  # every major Android release. Each version code upgrade indicates
  # our own major release during each lifecycle.
  PA_VERSION_CODE := 5
endif

# Determines the variant of the build.
# DEV: Unofficial builds given to the general population, created by
# non PA developers.
# ALPHA: Public/Private builds for testing purposes
# BETA: Public builds for testing purposes
# Public releases will not include a TAG
ifndef PA_BUILDTYPE
  PA_BUILD_VARIANT := DEV
else
  ifeq ($(PA_BUILDTYPE), ALPHA)
    PA_BUILD_VARIANT := Alpha
  else ifeq ($(PA_BUILDTYPE), BETA)
    PA_BUILD_VARIANT := Beta
  else ifeq ($(PA_BUILDTYPE), RELEASE)
    PA_BUILD_VARIANT := Release
  endif
endif

# Append date to pa zip name
ifeq ($(PA_VERSION_APPEND_TIME_OF_DAY),true)
  BUILD_DATE := $(shell date -u +%Y%m%d_%H%M%S)
else
  BUILD_DATE := $(shell date -u +%Y%m%d)
endif

ifneq ($(filter Release,$(PA_BUILD_VARIANT)),)
  PA_VERSION := $(shell echo $(PA_VERSION_FLAVOR) | tr A-Z a-z)-$(PA_VERSION_CODE)-$(PA_BUILD)-$(BUILD_DATE)
else ifneq ($(filter Alpha Beta,$(PA_BUILD_VARIANT)),)
  PA_VERSION := $(shell echo $(PA_VERSION_FLAVOR) | tr A-Z a-z)-$(shell echo $(PA_BUILD_VARIANT) | tr A-Z a-z)-$(PA_VERSION_CODE)-$(PA_BUILD)-$(BUILD_DATE)
else
  PA_VERSION := $(shell echo $(PA_VERSION_FLAVOR) | tr A-Z a-z)-$(PA_VERSION_CODE)-$(PA_BUILD)-$(BUILD_DATE)-$(shell echo $(PA_BUILD_VARIANT) | tr A-Z a-z)
endif

# Paranoid Android System Version
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.pa.version=$(PA_VERSION)

# Paranoid Android Platform Display Version
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.pa.version.flavor=$(PA_VERSION_FLAVOR) \
    ro.pa.version.code=$(PA_VERSION_CODE) \
    ro.pa.build.variant=$(PA_BUILD_VARIANT)
