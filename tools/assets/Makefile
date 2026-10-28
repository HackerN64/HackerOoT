-include ../print_rules.mk

all:
# must build n64texconv before build_from_png and build_jfif
	$(V)$(MAKE) -C n64texconv
	$(V)$(MAKE) -C build_from_png
	$(V)$(MAKE) -C build_jfif

clean:
	$(V)$(MAKE) -C n64texconv clean
	$(V)$(MAKE) -C build_from_png clean
	$(V)$(MAKE) -C build_jfif clean

distclean: clean
	$(V)$(MAKE) -C n64texconv distclean

.PHONY: all clean distclean
