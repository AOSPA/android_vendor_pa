package android
type Product_variables struct {
	Target_init_vendor_lib struct {
		Whole_static_libs []string
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
}

type ProductVariables struct {
	Target_init_vendor_lib  *string `json:",omitempty"`
	Target_process_sdk_version_override *string `json:",omitempty"`
	Target_shim_libs  *string `json:",omitempty"`
	Target_surfaceflinger_fod_lib  *string `json:",omitempty"`
}
