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

/*
 * When device comes up or when user tries to change the password, user can
 * try wrong password upto a certain number of times. If user enters wrong
 * password further, HW would wipe all disk encryption related crypto data
 * and would return an error ERR_MAX_PASSWORD_ATTEMPTS to VOLD. VOLD would
 * wipe userdata partition once this error is received.
 */
constexpr auto ERR_MAX_PASSWORD_ATTEMPTS = -10;
constexpr auto MAX_PASSWORD_LEN = 32;
constexpr auto QTI_ICE_STORAGE_UFS = 1;
constexpr auto QTI_ICE_STORAGE_SDCC = 2;

constexpr auto CRYPTFS_HW_UP_CHECK_COUNT = 10;
constexpr auto CRYPTFS_HW_CREATE_KEY_FAILED = -7;
constexpr auto CRYPTFS_HW_WIPE_KEY_FAILED = -8;
constexpr auto CRYPTFS_HW_UPDATE_KEY_FAILED = -9;
constexpr auto CRYPTFS_HW_KMS_MAX_FAILURE = -10;

enum cryptfs_hw_key_management_usage_type {
    CRYPTFS_HW_KM_USAGE_DISK_ENCRYPTION = 0x01,
    CRYPTFS_HW_KM_USAGE_FILE_ENCRYPTION = 0x02,
    CRYPTFS_HW_KM_USAGE_UFS_ICE_DISK_ENCRYPTION = 0x03,
    CRYPTFS_HW_KM_USAGE_SDCC_ICE_DISK_ENCRYPTION = 0x04,
    CRYPTFS_HW_KM_USAGE_MAX
};
