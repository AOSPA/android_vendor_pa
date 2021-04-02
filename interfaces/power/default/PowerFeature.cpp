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

#define LOG_TAG "vendor.aospa.power-service"
// #define LOG_NDEBUG 0

#include "PowerFeature.h"

#include <fcntl.h>
#include <log/log.h>
#include <unistd.h>

namespace aidl {
namespace vendor {
namespace aospa {
namespace power {

static constexpr int kInputEventWakeupModeOff = 4;
static constexpr int kInputEventWakeupModeOn = 5;

ndk::ScopedAStatus PowerFeature::setFeature(Feature feature, bool enabled) {
    switch (feature) {
#ifdef GESTURES_NODE
        case Feature::GESTURES:
            sysFsWrite(GESTURES_NODE, enabled);
            break;
#endif
#ifdef TAP_TO_WAKE_NODE
        case Feature::DOUBLE_TAP:
            sysFsWrite(TAP_TO_WAKE_NODE, enabled);
            break;
#elif defined(TAP_TO_WAKE_EVENT_NODE)
        case Feature::DOUBLE_TAP:
            input_event ev;
            ev.type = EV_SYN;
            ev.code = SYN_CONFIG;
            ev.value = enabled ? kInputEventWakeupModeOn : kInputEventWakeupModeOff;
            sysFsWrite(TAP_TO_WAKE_EVENT_NODE, &ev);
            break;
#endif
#ifdef DRAW_V_NODE
        case Feature::DRAW_V:
            sysFsWrite(DRAW_V_NODE, enabled);
            break;
#endif
#ifdef DRAW_INVERSE_V_NODE
        case Feature::DRAW_INVERSE_V:
            sysFsWrite(DRAW_INVERSE_V_NODE, enabled);
            break;
#endif
#ifdef DRAW_O_NODE
        case Feature::DRAW_O:
            sysFsWrite(DRAW_O_NODE, enabled);
            break;
#endif
#ifdef DRAW_M_NODE
        case Feature::DRAW_M:
            sysFsWrite(DRAW_M_NODE, enabled);
            break;
#endif
#ifdef DRAW_W_NODE
        case Feature::DRAW_W:
            sysFsWrite(DRAW_W_NODE, enabled);
            break;
#endif
#ifdef DRAW_ARROW_LEFT_NODE
        case Feature::DRAW_ARROW_LEFT:
            sysFsWrite(DRAW_ARROW_LEFT_NODE, enabled);
            break;
#endif
#ifdef DRAW_ARROW_RIGHT_NODE
        case Feature::DRAW_ARROW_RIGHT:
            sysFsWrite(DRAW_ARROW_RIGHT_NODE, enabled);
            break;
#endif
#ifdef ONE_FINGER_SWIPE_UP_NODE
        case Feature::ONE_FINGER_SWIPE_UP:
            sysFsWrite(ONE_FINGER_SWIPE_UP_NODE, enabled);
            break;
#endif
#ifdef ONE_FINGER_SWIPE_RIGHT_NODE
        case Feature::ONE_FINGER_SWIPE_RIGHT:
            sysFsWrite(ONE_FINGER_SWIPE_RIGHT_NODE, enabled);
            break;
#endif
#ifdef ONE_FINGER_SWIPE_DOWN_NODE
        case Feature::ONE_FINGER_SWIPE_DOWN:
            sysFsWrite(ONE_FINGER_SWIPE_DOWN_NODE, enabled);
            break;
#endif
#ifdef ONE_FINGER_SWIPE_LEFT_NODE
        case Feature::ONE_FINGER_SWIPE_LEFT:
            sysFsWrite(ONE_FINGER_SWIPE_LEFT_NODE, enabled);
            break;
#endif
#ifdef TWO_FINGER_SWIPE_NODE
        case Feature::TWO_FINGER_SWIPE:
            sysFsWrite(TWO_FINGER_SWIPE_NODE, enabled);
            break;
#endif
#ifdef DRAW_S_NODE
        case Feature::DRAW_S:
            sysFsWrite(DRAW_S_NODE, enabled);
            break;
#endif
#ifdef SINGLE_TAP_TO_WAKE_NODE
        case Feature::SINGLE_TAP:
            sysFsWrite(SINGLE_TAP_TO_WAKE_NODE, enabled);
            break;
#endif
        default:
            return ndk::ScopedAStatus::fromServiceSpecificError(ENOTSUP);
    }

    return ndk::ScopedAStatus::ok();
}

void PowerFeature::sysFsWrite(const char *file_node, bool enabled) {
    int fd, rc;
    fd = open(file_node, O_WRONLY);
    if (fd < 0) {
        ALOGE("Failed to open %s, %d", file_node, fd);
        return;
    }

    rc = write(fd, enabled ? "1" : "0", 1);
    if (rc < 0) {
        ALOGE("Failed to write \"%d\" to %s", enabled, file_node);
    }

    close(fd);
}

void PowerFeature::sysFsWrite(const char *file_node, const input_event *ev) {
    int fd, rc;
    fd = open(file_node, O_WRONLY);
    if (fd < 0) {
        ALOGE("Failed to open %s, %d", file_node, fd);
        return;
    }

    rc = write(fd, ev, sizeof(*ev));
    if (rc < 0) {
        ALOGE("Failed to write \"%d\" to %s", ev->value, file_node);
    }

    close(fd);
}

}  // namespace power
}  // namespace aospa
}  // namespace vendor
}  // namespace aidl
