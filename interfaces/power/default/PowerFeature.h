/*
 * Copyright (C) 2021, Paranoid Android
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#pragma once

#include <aidl/vendor/aospa/power/BnPowerFeature.h>
#include <linux/input.h>

namespace aidl {
namespace vendor {
namespace aospa {
namespace power {

class PowerFeature : public BnPowerFeature {
    public:
      ndk::ScopedAStatus setFeature(Feature feature, bool enabled) override;

    protected:
      void sysFsWrite(const char *file_node, bool enabled);
      void sysFsWrite(const char *file_node, const input_event *ev);
};

}  // namespace power
}  // namespace aospa
}  // namespace vendor
}  // namespace aidl
