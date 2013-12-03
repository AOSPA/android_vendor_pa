ifneq ($ROM_VERSION_TAG,"")
        VERSION := $(ROM_VERSION_MAJOR).$(ROM_VERSION_MINOR)$(ROM_VERSION_MAINTENANCE)-$(ROM_VERSION_TAG)
        export ROM_VERSION := $(VERSION)-$(ROM_VERSION_TAG)-$(shell date -u +%Y%m%d)
else
        VERSION := $(ROM_VERSION_MAJOR).$(ROM_VERSION_MINOR)$(ROM_VERSION_MAINTENANCE)
        export ROM_VERSION := $(VERSION)-$(shell date -u +%Y%m%d)
endif

PRODUCT_PROPERTY_OVERRIDES += \
    ro.modversion=$(ROM_VERSION) \
    ro.$(VENDOR).version=$(VERSION)
