///////////////////////////////////////////////////////////////////////////////
// THIS FILE IS IMMUTABLE. DO NOT EDIT IN ANY CASE.                          //
///////////////////////////////////////////////////////////////////////////////

// This file is a snapshot of an AIDL interface (or parcelable). Do not try to
// edit this file. It looks like you are doing that because you have modified
// an AIDL interface in a backward-incompatible way, e.g., deleting a function
// from an interface or a field from a parcelable and it broke the build. That
// breakage is intended.
//
// You must not make a backward incompatible changes to the AIDL files built
// with the aidl_interface module type with versions property set. The module
// type is used to build AIDL files in a way that they can be used across
// independently updatable components of the system. If a device is shipped
// with such a backward incompatible change, it has a high risk of breaking
// later when a module using the interface is updated, e.g., Mainline modules.

package vendor.aospa.power;
@Backing(type="int") @VintfStability
enum Feature {
  GESTURES = 0,
  DOUBLE_TAP = 1,
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
