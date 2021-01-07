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
    GESTURES,
    DOUBLE_TAP,
    DRAW_V,
    DRAW_INVERSE_V,
    DRAW_O,
    DRAW_M,
    DRAW_W,
    DRAW_ARROW_LEFT,
    DRAW_ARROW_RIGHT,
    ONE_FINGER_SWIPE_UP,
    ONE_FINGER_SWIPE_RIGHT,
    ONE_FINGER_SWIPE_DOWN,
    ONE_FINGER_SWIPE_LEFT,
    TWO_FINGER_SWIPE,
    DRAW_S,
    SINGLE_TAP,
}
