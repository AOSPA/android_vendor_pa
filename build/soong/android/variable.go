package android
type Product_variables struct {
	Target_shim_libs struct {
		Cppflags []string
	}
}

type ProductVariables struct {
	Target_shim_libs  *string `json:",omitempty"`
}
