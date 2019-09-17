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
  PA_VERSION_CODE := 1
endif

ifndef PA_BUILD_VARIANT
  # Determines the variant of the build.
  # DEV: Unofficial builds given to the general population, created by
  # non PA developers.
  # ALPHA: Public/Private builds for testing purposes
  # BETA: Public builds for testing purposes
  # Public releases will not include a TAG
  PA_BUILD_VARIANT := DEV
endif