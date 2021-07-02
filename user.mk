include config.mk

.PHONY: all install

all: usbpend

install: usbpend
	mkdir -p $(DESTDIR)$(EMC2_HOME)/bin
	cp usbpend $(DESTDIR)$(EMC2_HOME)/bin/

usbpend: usbpend.comp
	$(COMP) --compile $<

