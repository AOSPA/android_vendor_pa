# Theme engine
PRODUCT_PACKAGES += \
    aapt \
    ThemeChooser \
    ThemesProvider \
    cm.theme.platform-res \
    cm.theme.platform

PRODUCT_COPY_FILES += \
   vendor/pa/configs/permissions/org.cyanogenmod.theme.xml:system/etc/permissions/org.cyanogenmod.theme.xml
