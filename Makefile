# USB Pendant - LinuxCNC userspace component
# Uses modcompile for building
#
# Requires modcompile in PATH (source rip-environment or install linuxcnc-dev)

MODCOMPILE := $(shell which modcompile 2>/dev/null)
ifeq ($(MODCOMPILE),)
  $(error modcompile not found in PATH. Source rip-environment or install linuxcnc-dev)
endif

$(eval $(shell $(MODCOMPILE) --print-make-inc))

.PHONY: all install clean

all: usbpend.so

usbpend.so: usbpend.comp
	$(MODCOMPILE) --compile $<

install: usbpend.so
	install -d $(DESTDIR)$(GOMC_CMOD_DIR)
	install -m 644 usbpend.so $(DESTDIR)$(GOMC_CMOD_DIR)/
	install -d $(DESTDIR)/etc/udev/rules.d
	install -m 644 usbpend.rules $(DESTDIR)/etc/udev/rules.d/

clean:
	rm -f usbpend.so
