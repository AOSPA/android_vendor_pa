# Copyright (C) 2021 Paranoid Android
# SPDX-License-Identifier: MIT

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
