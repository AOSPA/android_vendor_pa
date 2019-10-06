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

#ifndef CRYPTFS_HW_BACKEND
#error "CRYPTFS_HW_BACKEND must be set before including this file."
#endif

#include <android-base/logging.h>
#include <hidl/HidlTransportSupport.h>

#ifdef ARCH_ARM_32
#include <hwbinder/ProcessState.h>
#endif

#include <CryptfsHw.h>

using ::android::OK;
using ::android::status_t;
using ::android::hardware::configureRpcThreadpool;
using ::android::hardware::joinRpcThreadpool;

using ::vendor::qti::hardware::cryptfshw::V1_0::implementation::CryptfsHw;
using ::vendor::qti::hardware::cryptfshw::V1_0::implementation::ICryptfsHwController;
using ::vendor::qti::hardware::cryptfshw::V1_0::implementation::CRYPTFS_HW_BACKEND::Controller;

int main() {
#ifdef ARCH_ARM_32
    android::hardware::ProcessState::initWithMmapSize((size_t)16384);
#endif

    LOG(DEBUG) << "CryptfsHw HAL service is starting.";

    auto controller = std::make_unique<Controller>();
    android::sp<CryptfsHw> cryptfsHw = new CryptfsHw(std::move(controller));

    configureRpcThreadpool(1, true /*callerWillJoin*/);

    status_t status = cryptfsHw->registerAsService();
    if (status == OK) {
        LOG(DEBUG) << "CryptfsHw HAL service is ready.";
        joinRpcThreadpool();
    } else {
        LOG(ERROR) << "Could not register service for CryptfsHw HAL CryptfsHw Iface (" << status
                   << ")";
    }

    // In normal operation, we don't expect the thread pool to shutdown
    LOG(ERROR) << "CryptfsHw HAL service is shutting down.";
    return 1;
}
