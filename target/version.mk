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
#     AOSPA_MAJOR_VERSION
#     AOSPA_MINOR_VERSION
#     AOSPA_BUILD_VARIANT
#

# This is the global AOSPA version flavor that determines the focal point
# behind our releases. This is bundled alongside $(AOSPA_MINOR_VERSION)
# and only changes per major Android releases.
AOSPA_MAJOR_VERSION := ruby

# The version code is the upgradable portion during the cycle of
# every major Android release. Each version code upgrade indicates
# our own major release during each lifecycle.
AOSPA_MINOR_VERSION := 1

# Build Variants
#
# Alpha: Development / Test
# Beta: Public releases with CI
# Release: Final Product | No Tagging
AOSPA_BUILD_VARIANT := alpha

# Build Date
BUILD_DATE := $(shell date -u +%Y%m%d)

# AOSPA Version
AOSPA_VERSION := $(AOSPA_MAJOR_VERSION)-$(AOSPA_MINOR_VERSION)-$(AOSPA_BUILD)-$(AOSPA_BUILD_VARIANT)-$(BUILD_DATE)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.aospa.version=$(AOSPA_VERSION)

# The properties will be uppercase for parse by Settings, etc.
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.aospa.version.major=$(shell V1=$(AOSPA_MAJOR_VERSION); echo $${V1^}) \
    ro.aospa.version.minor=$(AOSPA_MINOR_VERSION) \
    ro.aospa.build.variant=$(shell V2=$(AOSPA_BUILD_VARIANT); echo $${V2^})
