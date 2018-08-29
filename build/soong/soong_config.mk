_contents := $(_contents)    "Aospa":{$(newline)

# See build/core/soong_config.mk for the add_json_* functions you can use here.

$(call add_json_bool, Needs_text_relocations,                $(filter true,$(TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS)))
$(call add_json_str,  Target_process_sdk_version_override,   $(TARGET_PROCESS_SDK_VERSION_OVERRIDE))
$(call add_json_str,  Target_shim_libs,                      $(TARGET_LD_SHIM_LIBS))

# This causes the build system to strip out the last comma in our nested struct, to keep the JSON valid.
_contents := $(_contents)__SV_END

_contents := $(_contents)    },$(newline)
