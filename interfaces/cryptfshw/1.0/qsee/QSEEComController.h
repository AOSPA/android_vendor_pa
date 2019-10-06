/*
 * Copyright (C) 2019 The LineageOS Project
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

#include <ICryptfsHwController.h>
#include <android-base/macros.h>

#include <memory>

namespace vendor {
namespace qti {
namespace hardware {
namespace cryptfshw {
namespace V1_0 {
namespace implementation {
namespace qsee {

// interface wrapper
class Controller : public ICryptfsHwController {
  public:
    Controller();
    int createKey(int usage, const char* passwd) override;
    int updateKey(int usage, const char* oldpw, const char* newpw) override;
    int wipeKey(int usage) override;

  private:
    template <typename Function>
    Function loadFunction(const char* name);
    std::shared_ptr<void> handle_;

    int (*mFn_create_key)(int, void*);
    int (*mFn_update_key_user_info)(int, void*, void*);
    int (*mFn_wipe_key)(int);

    DISALLOW_COPY_AND_ASSIGN(Controller);
    Controller(Controller&&) = delete;
    Controller& operator=(Controller&&) = delete;
};

}  // namespace qsee
}  // namespace implementation
}  // namespace V1_0
}  // namespace cryptfshw
}  // namespace hardware
}  // namespace qti
}  // namespace vendor
