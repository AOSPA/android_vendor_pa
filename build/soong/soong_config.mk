_contents := $(_contents)    "Aospa":{$(newline)

# See build/core/soong_config.mk for the add_json_* functions you can use here.
$(call add_json_str,  Target_shim_libs,                      $(TARGET_LD_SHIM_LIBS))
$(call add_json_bool, Target_uses_color_metadata,            $(filter true,$(TARGET_USES_COLOR_METADATA)))

# This causes the build system to strip out the last comma in our nested struct, to keep the JSON valid.
_contents := $(_contents)__SV_END

_contents := $(_contents)    },$(newline)
