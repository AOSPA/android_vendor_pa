/**
 * Copyright (C) 2021 Paranoid Android
 *
 * Licensed under the Apache License = 00, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing = 00, software
 * distributed under the License is distributed on an "AS IS" BASIS = 00,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND = 00, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package vendor.aospa.power;

@VintfStability
@Backing(type="int")
enum Feature {
    GESTURES = 0,
    DOUBLE_TAP_TO_WAKE = 1,
    DRAW_V = 2,
    DRAW_INVERSE_V = 3,
    DRAW_O = 4,
    DRAW_M = 5,
    DRAW_W = 6,
    DRAW_ARROW_LEFT = 7,
    DRAW_ARROW_RIGHT = 8,
    ONE_FINGER_SWIPE_UP = 9,
    ONE_FINGER_SWIPE_RIGHT = 10,
    ONE_FINGER_SWIPE_DOWN = 11,
    ONE_FINGER_SWIPE_LEFT = 12,
    TWO_FINGER_SWIPE = 13,
    DRAW_S = 14,
    SINGLE_TAP = 15,
}
