.PHONY: all configure install clean

all: configure
	@$(MAKE) -f user.mk all

clean:
	rm -f usbpend
	rm -f config.mk

install:
	@$(MAKE) -f user.mk install
	mkdir -p $(DESTDIR)/etc/udev/rules.d
	cp usbpend.rules $(DESTDIR)/etc/udev/rules.d

configure: config.mk

config.mk: configure.mk
	@$(MAKE) -s -f configure.mk > config.mk.tmp
	@mv config.mk.tmp config.mk

