# Setup SOONG_CONFIG_* vars to export the vars listed above.
# Documentation here:
# https://github.com/LineageOS/android_build_soong/commit/8328367c44085b948c003116c0ed74a047237a69

# PA Variables

SOONG_CONFIG_NAMESPACES += aospaVarsPlugin

SOONG_CONFIG_aospaVarsPlugin :=

define addVar
  SOONG_CONFIG_aospaVarsPlugin += $(1)
  SOONG_CONFIG_aospaVarsPlugin_$(1) := $$(subst ",\",$$($1))
endef

$(foreach v,$(EXPORT_TO_SOONG),$(eval $(call addVar,$(v))))

SOONG_CONFIG_NAMESPACES += aospaGlobalVars
SOONG_CONFIG_aospaGlobalVars += \
    board_fingerprint_vendor \
    no_mask_layer \
    target_init_vendor_lib \
    target_ld_shim_libs \
    target_process_sdk_version_override \
    target_surfaceflinger_fod_lib \
    target_gesture_node \
    target_single_tap_node \
    target_double_tap_node \
    target_v_node \
    target_inverse_v_node \
    target_o_node \
    target_m_node \
    target_w_node \
    target_s_node \
    target_arrow_left_node \
    target_arrow_right_node \
    target_up_node \
    target_right_node \
    target_down_node \
    target_left_node \
    target_two_finger_swipe_node

# Set default values
TARGET_INIT_VENDOR_LIB ?= vendor_init
TARGET_SURFACEFLINGER_FOD_LIB ?= surfaceflinger_fod_lib

# Soong value variables
SOONG_CONFIG_aospaGlobalVars_board_fingerprint_vendor := $(BOARD_FINGERPRINT_VENDOR)
SOONG_CONFIG_aospaGlobalVars_no_mask_layer := $(TARGET_DISPLAY_HAS_NO_MASK_LAYER)
SOONG_CONFIG_aospaGlobalVars_target_init_vendor_lib := $(TARGET_INIT_VENDOR_LIB)
SOONG_CONFIG_aospaGlobalVars_target_ld_shim_libs := $(subst $(space),:,$(TARGET_LD_SHIM_LIBS))
SOONG_CONFIG_aospaGlobalVars_target_process_sdk_version_override := $(TARGET_PROCESS_SDK_VERSION_OVERRIDE)
SOONG_CONFIG_aospaGlobalVars_target_surfaceflinger_fod_lib := $(TARGET_SURFACEFLINGER_FOD_LIB)
SOONG_CONFIG_aospaGlobalVars_target_gesture_node = $(patsubst "%",%,$(TARGET_GESTURES_NODE))
SOONG_CONFIG_aospaGlobalVars_target_single_tap_node = $(patsubst "%",%,$(TARGET_SINGLE_TAP_TO_WAKE_NODE))
SOONG_CONFIG_aospaGlobalVars_target_double_tap_node = $(patsubst "%",%,$(TARGET_TAP_TO_WAKE_NODE))
SOONG_CONFIG_aospaGlobalVars_target_v_node = $(patsubst "%",%,$(TARGET_DRAW_V_NODE))
SOONG_CONFIG_aospaGlobalVars_target_inverse_v_node = $(patsubst "%",%,$(TARGET_DRAW_INVERSE_V_NODE))
SOONG_CONFIG_aospaGlobalVars_target_o_node = $(patsubst "%",%,$(TARGET_DRAW_O_NODE))
SOONG_CONFIG_aospaGlobalVars_target_m_node = $(patsubst "%",%,$(TARGET_DRAW_M_NODE))
SOONG_CONFIG_aospaGlobalVars_target_w_node = $(patsubst "%",%,$(TARGET_DRAW_W_NODE))
SOONG_CONFIG_aospaGlobalVars_target_s_node = $(patsubst "%",%,$(TARGET_DRAW_S_NODE))
SOONG_CONFIG_aospaGlobalVars_target_arrow_left_node = $(patsubst "%",%,$(TARGET_DRAW_ARROW_LEFT_NODE))
SOONG_CONFIG_aospaGlobalVars_target_arrow_right_node = $(patsubst "%",%,$(TARGET_DRAW_ARROW_RIGHT_NODE))
SOONG_CONFIG_aospaGlobalVars_target_up_node = $(patsubst "%",%,$(TARGET_ONE_FINGER_SWIPE_UP_NODE))
SOONG_CONFIG_aospaGlobalVars_target_right_node = $(patsubst "%",%,$(TARGET_ONE_FINGER_SWIPE_RIGHT_NODE))
SOONG_CONFIG_aospaGlobalVars_target_down_node = $(patsubst "%",%,$(TARGET_ONE_FINGER_SWIPE_DOWN_NODE))
SOONG_CONFIG_aospaGlobalVars_target_left_node = $(patsubst "%",%,$(TARGET_ONE_FINGER_SWIPE_LEFT_NODE))
SOONG_CONFIG_aospaGlobalVars_target_two_finger_swipe_node = $(patsubst "%",%,$(TARGET_TWO_FINGER_SWIPE_NODE))

# Qualcomm variables
SOONG_CONFIG_NAMESPACES += aosp_vs_qva
SOONG_CONFIG_aosp_vs_qva += aosp_or_qva
SOONG_CONFIG_aosp_vs_qva_aosp_or_qva := qva
