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

#include "CryptfsHwUtils.h"

#include <algorithm>
#include <cstring>

namespace vendor {
namespace qti {
namespace hardware {
namespace cryptfshw {
namespace V1_0 {
namespace implementation {

void* secure_memset(void* v, int c, size_t n) {
    auto p = reinterpret_cast<volatile unsigned char*>(v);
    while (n--) *p++ = c;
    return v;
}

void GetTmpPasswd(const char* passwd, unsigned char* tmp_passwd, size_t buf_len) {
    secure_memset(tmp_passwd, 0, buf_len);
    if (passwd) {
        size_t passwd_len = strnlen(passwd, buf_len);
        memcpy(tmp_passwd, passwd, passwd_len);
    }
}

}  // namespace implementation
}  // namespace V1_0
}  // namespace cryptfshw
}  // namespace hardware
}  // namespace qti
}  // namespace vendor
