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

#define LOG_TAG "vendor.qti.hardware.cryptfshw@1.0-impl-qti"

#include "CryptfsHw.h"

#include <android-base/logging.h>
#include <android-base/properties.h>
#include <android-base/unique_fd.h>
#include <dlfcn.h>
#include <linux/qseecom.h>

#include "Types.h"

namespace vendor {
namespace qti {
namespace hardware {
namespace cryptfshw {
namespace V1_0 {
namespace implementation {

using ::android::base::GetProperty;
using ::android::base::unique_fd;

namespace {
bool IsHwDiskEncryption(const hidl_string& encryption_mode) {
    if (encryption_mode == "aes-xts") {
        LOG_TO(SYSTEM, DEBUG) << "HW based disk encryption is enabled";
        return true;
    }
    return false;
}
};  // anonymous namespace

CryptfsHw::CryptfsHw(std::unique_ptr<ICryptfsHwController> controller)
    : controller_(std::move(controller)) {
    std::string bootdevice = GetProperty("ro.boot.bootdevice", "");

    if (bootdevice.find("ufs") != std::string::npos) {
        /*
         * All UFS based devices has ICE in it. So we dont need
         * to check if corresponding device exists or not
         */
        usage_ = CRYPTFS_HW_KM_USAGE_UFS_ICE_DISK_ENCRYPTION;
    } else if (bootdevice.find("sdhc") != std::string::npos && access("/dev/icesdcc", F_OK) != -1) {
        usage_ = CRYPTFS_HW_KM_USAGE_SDCC_ICE_DISK_ENCRYPTION;
    } else {
        usage_ = CRYPTFS_HW_KM_USAGE_DISK_ENCRYPTION;
    }
}

// Methods from ::vendor::qti::hardware::cryptfshw::V1_0::ICryptfsHw follow.
Return<int32_t> CryptfsHw::setIceParam(uint32_t flag) {
#ifdef QSEECOM_IOCTL_SET_ICE_INFO
    int32_t ret = -1;
    qseecom_ice_data_t ice_data;
    unique_fd qseecom_fd(open("/dev/qseecom", O_RDWR));
    if (qseecom_fd < 0) return ret;
    ice_data.flag = static_cast<int>(flag);
    ret = ioctl(qseecom_fd, QSEECOM_IOCTL_SET_ICE_INFO, &ice_data);
    return ret;
#else
    (void)flag;
    return -1;
#endif
}

Return<int32_t> CryptfsHw::setKey(const hidl_string& passwd, const hidl_string& enc_mode) {
    int err = -1;

    if (!IsHwDiskEncryption(enc_mode)) return err;

    err = controller_->createKey(usage_, passwd.c_str());
    if (err < 0) {
        if (ERR_MAX_PASSWORD_ATTEMPTS == err)
            LOG_TO(SYSTEM, INFO) << "Maximum wrong password attempts reached, will erase userdata";
    }

    return err;
}

Return<int32_t> CryptfsHw::updateKey(const hidl_string& oldpw, const hidl_string& newpw,
                                     const hidl_string& enc_mode) {
    int err = -1;

    if (!IsHwDiskEncryption(enc_mode)) return err;

    err = controller_->updateKey(usage_, oldpw.c_str(), newpw.c_str());
    if (err < 0) {
        if (ERR_MAX_PASSWORD_ATTEMPTS == err)
            LOG_TO(SYSTEM, INFO) << "Maximum wrong password attempts reached, will erase userdata";
    }

    return err;
}

Return<int32_t> CryptfsHw::clearKey() {
    return controller_->wipeKey(usage_);
}

}  // namespace implementation
}  // namespace V1_0
}  // namespace cryptfshw
}  // namespace hardware
}  // namespace qti
}  // namespace vendor
