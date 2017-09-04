# Insert new variables inside the Lineage structure
pa_soong:
	$(hide) mkdir -p $(dir $@)
	$(hide) (\
	echo '{'; \
	echo '"Pa": {'; \
	echo '},'; \
	echo '') > $(SOONG_VARIABLES_TMP)
