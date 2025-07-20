SRC := init.lua
PLUGIN_NAME := $(notdir $(CURDIR))
VIS_PLUGIN_DIR := $(HOME)/.config/vis/plugins

.PHONY: install uninstall

install:
	install -Dm644 $(SRC) $(VIS_PLUGIN_DIR)/$(PLUGIN_NAME)/$(SRC)
	@echo "Plugin installed to $(VIS_PLUGIN_DIR)/$(PLUGIN_NAME)"

uninstall:
	rm -v $(VIS_PLUGIN_DIR)/$(PLUGIN_NAME)/$(SRC)
	rmdir --ignore-fail-on-non-empty $(VIS_PLUGIN_DIR)/$(PLUGIN_NAME)
	@echo "Plugin removed from $(VIS_PLUGIN_DIR)"
