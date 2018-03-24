package android
type Product_variables struct {
	Target_shim_libs struct {
		Cppflags []string
	}
    Uses_qti_camera_device struct {
        Cppflags []string
        Shared_libs []string
    }
}

type ProductVariables struct {
	Target_shim_libs  *string `json:",omitempty"`
    Uses_qti_camera_device  *bool `json:",omitempty"`
}
