.PHONY: all configure install clean

ifeq (, $(COMP))
  COMP = $(shell which halcompile)
endif
ifeq (, $(COMP))
  COMP = $(shell which comp)
endif
ifeq (, $(COMP))
  $(error halcompile/comp executable not found or set)
endif

all: usbpend

clean:
	rm -f usbpend

install:
	$(COMP) --install usbpend.comp
	mkdir -p /etc/udev/rules.d
	cp usbpend.rules /etc/udev/rules.d

usbpend:
	$(COMP) --compile usbpend.comp

