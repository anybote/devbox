# Variables
USERNAME := anybote
BOXNAME := devbox
PROVIDER := virtualbox

# Default version if not provided
VERSION ?= 1.3.0

# Phony targets
.PHONY: all package upload clean

all: package upload clean

# Package the Vagrant box
package:
	vagrant package --output $(BOXNAME)-$(VERSION).box

# Upload the box to Vagrant Cloud
upload:
	vagrant cloud publish $(USERNAME)/$(BOXNAME) $(VERSION) $(PROVIDER) $(BOXNAME)-$(VERSION).box

clean:
	rm -f $(BOXNAME)-$(VERSION).box

help:
	@echo "Usage: make [target] VERSION=x.y.z"
	@echo "Targets:"
	@echo "  all     : Package, upload, and clean (default)"
	@echo "  package : Package the Vagrant box"
	@echo "  upload  : Upload the box to Vagrant Cloud"
	@echo "  clean   : Remove the packaged box file"
	@echo "  help    : Show this help message"
