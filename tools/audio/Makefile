MAKEFLAGS += --no-builtin-rules --no-print-directory

PROGRAMS := afile_sizes atblgen sbc sfc sfpatch

ifeq ($(shell which xml2-config),)
  $(error xml2-config not found. Did you install libxml2-dev?)
endif

CLANG_FORMAT := clang-format-14
FORMAT_ARGS := -i -style=file

CC := gcc
CFLAGS := -Wall -Wextra -pedantic
OPTFLAGS := -O2

XML_CFLAGS := $(shell xml2-config --cflags)
XML_LDFLAGS := $(shell xml2-config --libs)

-include ../print_rules.mk

.PHONY: all clean distclean format

all: $(PROGRAMS)
	$(V)$(MAKE) -C sampleconv

clean:
	$(V)$(RM) $(PROGRAMS)
	$(V)$(MAKE) -C sampleconv clean

distclean: clean
	$(V)$(MAKE) -C sampleconv distclean

format:
	$(V)$(CLANG_FORMAT) $(FORMAT_ARGS) $(shell find . -maxdepth 1 -type f -name "*.[ch]")
	$(V)$(MAKE) -C sampleconv format

afile_sizes_SOURCES := afile_sizes.c util.c
atblgen_SOURCES     := audio_tablegen.c samplebank.c soundfont.c xml.c util.c
sbc_SOURCES         := samplebank_compiler.c samplebank.c aifc.c xml.c util.c
sfc_SOURCES         := soundfont_compiler.c samplebank.c soundfont.c aifc.c xml.c util.c
sfpatch_SOURCES     := sfpatch.c util.c

atblgen_CFLAGS := $(XML_CFLAGS)
sbc_CFLAGS     := $(XML_CFLAGS)
sfc_CFLAGS     := $(XML_CFLAGS)

atblgen_LDFLAGS := $(XML_LDFLAGS)
sbc_LDFLAGS     := $(XML_LDFLAGS)
sfc_LDFLAGS     := $(XML_LDFLAGS)

define COMPILE =
$(1): $($1_SOURCES)
	$(V)$(CC) $(CFLAGS) $($1_CFLAGS) $$^ $($1_LDFLAGS) -o $$@
endef

$(foreach p,$(PROGRAMS),$(eval $(call COMPILE,$(p))))
