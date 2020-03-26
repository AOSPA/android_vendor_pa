IS_PHONE := true

# Inherit common Paranoid Android stuff
$(call inherit-product, vendor/pa/config/common.mk)

$(call inherit-product, vendor/pa/config/telephony.mk)
