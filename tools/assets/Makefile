-include ../print_rules.mk

all:
# must build n64texconv before build_from_png
	$(V)$(MAKE) -C n64texconv
	$(V)$(MAKE) -C build_from_png

clean:
	$(V)$(MAKE) -C n64texconv clean
	$(V)$(MAKE) -C build_from_png clean

distclean: clean
	$(V)$(MAKE) -C n64texconv distclean

.PHONY: all clean distclean
