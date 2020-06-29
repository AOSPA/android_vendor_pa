package android
type Product_variables struct {
	Additional_gralloc_10_usage_bits struct {
		Cppflags []string
	}
	Has_legacy_camera_hal1 struct {
		Cflags []string
		Overrides []string
		Shared_libs []string
	}
	Should_wait_for_qsee struct {
		Cflags []string
	}
	Target_init_vendor_lib struct {
		Whole_static_libs []string
	}
	Target_needs_netd_direct_connect_rule struct {
		Cppflags []string
	}
	Target_process_sdk_version_override struct {
		Cppflags []string
	}
	Target_shim_libs struct {
		Cppflags []string
	}
	Target_surfaceflinger_fod_lib struct {
		Cflags []string
		Whole_static_libs []string
	}
	Target_uses_color_metadata struct {
		Cppflags []string
	}
	Target_uses_prebuilt_dynamic_partitions struct {
		Cflags []string
	}
}

type ProductVariables struct {
	Additional_gralloc_10_usage_bits  *string `json:",omitempty"`
	Has_legacy_camera_hal1  *bool `json:",omitempty"`
	Should_wait_for_qsee  *bool `json:",omitempty"`
	Target_init_vendor_lib  *string `json:",omitempty"`
	Target_needs_netd_direct_connect_rule  *bool `json:",omitempty"`
	Target_process_sdk_version_override *string `json:",omitempty"`
	Target_shim_libs  *string `json:",omitempty"`
	Target_surfaceflinger_fod_lib  *string `json:",omitempty"`
	Target_uses_color_metadata  *bool `json:",omitempty"`
	Target_uses_prebuilt_dynamic_partitions  *bool `json:",omitempty"`
}
