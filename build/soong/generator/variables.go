package generator

import (
	"fmt"

	"android/soong/android"
)

func aospaExpandVariables(ctx android.ModuleContext, in string) string {
	aospaVars := ctx.Config().VendorConfig("aospaVarsPlugin")

	out, err := android.Expand(in, func(name string) (string, error) {
		if aospaVars.IsSet(name) {
			return aospaVars.String(name), nil
		}
		// This variable is not for us, restore what the original
		// variable string will have looked like for an Expand
		// that comes later.
		return fmt.Sprintf("$(%s)", name), nil
	})

	if err != nil {
		ctx.PropertyErrorf("%s: %s", in, err.Error())
		return ""
	}

	return out
}
