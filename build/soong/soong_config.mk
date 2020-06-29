add_json_str_omitempty = $(if $(strip $(2)),$(call add_json_str, $(1), $(2)))

_json_contents := $(_json_contents)    "Aospa":{$(newline)

# See build/core/soong_config.mk for the add_json_* functions you can use here.
$(call add_json_str_omitempty, Additional_gralloc_10_usage_bits, $(TARGET_ADDITIONAL_GRALLOC_10_USAGE_BITS))
$(call add_json_bool, Has_legacy_camera_hal1, $(filter true,$(TARGET_HAS_LEGACY_CAMERA_HAL1)))
$(call add_json_bool, Should_wait_for_qsee, $(filter true,$(TARGET_KEYMASTER_WAIT_FOR_QSEE)))
$(call add_json_str_omitempty, Target_init_vendor_lib, $(TARGET_INIT_VENDOR_LIB))
$(call add_json_bool, Target_needs_netd_direct_connect_rule, $(filter true,$(TARGET_NEEDS_NETD_DIRECT_CONNECT_RULE)))
$(call add_json_str_omitempty, Target_process_sdk_version_override, $(TARGET_PROCESS_SDK_VERSION_OVERRIDE))
$(call add_json_str_omitempty, Target_shim_libs, $(subst $(space),:,$(TARGET_LD_SHIM_LIBS)))
$(call add_json_str_omitempty, Target_surfaceflinger_fod_lib, $(TARGET_SURFACEFLINGER_FOD_LIB))
$(call add_json_bool, Target_uses_color_metadata, $(filter true,$(TARGET_USES_COLOR_METADATA)))
$(call add_json_bool, Target_uses_prebuilt_dynamic_partitions,   $(filter true,$(TARGET_USES_PREBUILT_DYNAMIC_PARTITIONS)))

# This causes the build system to strip out the last comma in our nested struct, to keep the JSON valid.
_json_contents := $(_json_contents)__SV_END

_json_contents := $(_json_contents)    },$(newline)
