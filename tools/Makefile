MAKEFLAGS += --no-builtin-rules --no-print-directory

CFLAGS := -Wall -Wextra -pedantic -std=c99 -g -O2
PROGRAMS := elf2rom makeromfs mkdmadata mkldscript preprocess_pragmas reloc_prereq

ifeq ($(shell command -v clang >/dev/null 2>&1; echo $$?),0)
  CC := clang
else
  CC := gcc
endif

LLD ?= 0

ifeq ($(shell command -v ld.lld >/dev/null 2>&1; echo $$?),0)
  LLD := 1
endif

ifneq ($(LLD),0)
  CFLAGS += -fuse-ld=lld
endif

-include print_rules.mk

all: $(PROGRAMS)
	$(call print_no_args,Building ZAPD...)
	$(V)$(MAKE) -C ZAPD
	$(call print_no_args,Building fado...)
	$(V)$(MAKE) -C fado
	$(call print_no_args,Building gzinject...)
ifeq ($(wildcard ./gzinject/Makefile),)
	$(V)cd ./gzinject && ./configure
endif
	$(V)$(MAKE) -C gzinject
	$(call print_no_args,Building z64compress...)
	$(V)$(MAKE) -C z64compress
	$(call print_no_args,Building Flips...)
	$(V)$(MAKE) -C Flips TARGET=cli
	$(call print_no_args,Building audio tools...)
	$(V)$(MAKE) -C audio

clean:
	$(V)$(RM) $(PROGRAMS) $(addsuffix .exe,$(PROGRAMS))
	$(V)$(MAKE) -C ZAPD clean
	$(V)$(MAKE) -C fado clean
ifneq ($(wildcard ./gzinject/Makefile),)
	$(V)$(MAKE) -C gzinject clean
endif
	$(V)$(MAKE) -C z64compress clean
	$(V)$(MAKE) -C Flips clean
	$(V)rm Flips/flips
	$(V)$(MAKE) -C audio clean

distclean: clean
	$(V)$(MAKE) -C audio distclean

.PHONY: all clean distclean

elf2rom_SOURCES            := elf2rom.c elf32.c n64chksum.c util.c
makeromfs_SOURCES          := makeromfs.c n64chksum.c util.c
mkdmadata_SOURCES          := mkdmadata.c spec.c util.c
mkldscript_SOURCES         := mkldscript.c spec.c util.c
preprocess_pragmas_SOURCES := preprocess_pragmas.c
reloc_prereq_SOURCES       := reloc_prereq.c spec.c util.c


define COMPILE =
$(1): $($1_SOURCES)
	$(call print_two_args,Compiling:,$$^,$$@)
	$(V)$(CC) $(CFLAGS) $$^ -o $$@
endef

$(foreach p,$(PROGRAMS),$(eval $(call COMPILE,$(p))))
