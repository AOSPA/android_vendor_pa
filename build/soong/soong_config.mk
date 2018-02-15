# Insert new variables inside the Lineage structure
pa_soong:
	$(hide) mkdir -p $(dir $@)
	$(hide) (\
	echo '{'; \
	echo '"Pa": {'; \
	echo '    "Target_shim_libs": "$(TARGET_LD_SHIM_LIBS)"'; \
	echo '},'; \
	echo '') > $(SOONG_VARIABLES_TMP)
