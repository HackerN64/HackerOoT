MAKEFLAGS += --no-builtin-rules --no-print-directory

CFLAGS := -Wall -Wextra -pedantic -std=gnu99 -g -O2
PROGRAMS := bin2c mkdmadata mkldscript mkspecrules preprocess_pragmas

UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Linux)
  DETECTED_OS=linux
else ifeq ($(UNAME_S),Darwin)
  DETECTED_OS=macos
else
  $(error Unsupported OS: $(UNAME_S))
endif

IDO_RECOMP_VERSION := v1.2
IDO_RECOMP_5_3_DIR := ido_recomp/$(DETECTED_OS)/5.3
IDO_RECOMP_7_1_DIR := ido_recomp/$(DETECTED_OS)/7.1

EGCS_BINUTILS_VERSION := 0.6
EGCS_GCC_VERSION := 0.7
EGCS_DIR := egcs/$(DETECTED_OS)

WARNFLAGS := -Wall -Wextra -pedantic
OPTFLAGS := -O2 -g
LDFLAGS :=

ifeq ($(shell command -v clang >/dev/null 2>&1; echo $$?),0)
  CC := clang
  CXX := clang++
else
  CC := gcc
  CXX := g++
endif

LLD ?= 0

ifeq ($(shell command -v ld.lld >/dev/null 2>&1; echo $$?),0)
  LLD := 1
endif

ifneq ($(LLD),0)
  LDFLAGS += -fuse-ld=lld
endif

-include print_rules.mk

.PHONY: all clean distclean

all: $(PROGRAMS) armips $(IDO_RECOMP_5_3_DIR) $(IDO_RECOMP_7_1_DIR) $(EGCS_DIR)
	$(call print_no_args,Building fado...)
	$(V)$(MAKE) -C fado
	$(call print_no_args,Building audio tools...)
	$(V)$(MAKE) -C audio
	$(call print_no_args,Building com-plugin...)
	$(V)$(MAKE) -C com-plugin
	$(call print_no_args,Building assets tools...)
	$(V)$(MAKE) -C assets
	$(call print_no_args,Building gzinject...)
ifeq ($(wildcard ./gzinject/Makefile),)
	$(V)cd ./gzinject && ./configure
endif
	$(V)$(MAKE) -C gzinject
	$(call print_no_args,Building z64compress...)
	$(V)$(MAKE) -C z64compress
	$(call print_no_args,Building Flips...)
	$(V)$(MAKE) -C Flips TARGET=cli

clean:
	$(V)$(RM) $(PROGRAMS) $(addsuffix .exe,$(PROGRAMS))
	$(V)$(RM) -r compiler_archives/archives
	$(V)$(RM) -r ido_recomp egcs
	$(V)$(MAKE) -C fado clean
	$(V)$(MAKE) -C audio clean
	$(V)$(MAKE) -C com-plugin clean
	$(V)$(MAKE) -C assets clean
ifneq ($(wildcard ./gzinject/Makefile),)
	$(V)$(MAKE) -C gzinject distclean
endif
	$(V)$(MAKE) -C z64compress clean
	$(V)$(MAKE) -C Flips clean
	$(V)rm -f Flips/flips

distclean: clean
	$(V)$(MAKE) -C audio distclean
	$(V)$(MAKE) -C assets distclean
	$(V)$(RM) armips

armips: armips.cpp
	$(CXX) $(WARNFLAGS) -std=c++17 $(OPTFLAGS) -s -fno-rtti -pipe -Wno-unused-parameter -Wno-sign-compare $< -o $@

bin2c_SOURCES              := bin2c.c
mkdmadata_SOURCES          := mkdmadata.c spec.c util.c
mkldscript_SOURCES         := mkldscript.c spec.c util.c
mkspecrules_SOURCES        := mkspecrules.c spec.c util.c
preprocess_pragmas_SOURCES := preprocess_pragmas.c

define COMPILE
$(1): $($1_SOURCES)
	$(call print_two_args,Compiling:,$$^,$$@)
	$(V)$(CC) $(WARNFLAGS) -std=gnu99 $(OPTFLAGS) $$^ $(LDFLAGS) -o $$@
endef

$(foreach p,$(PROGRAMS),$(eval $(call COMPILE,$(p))))

compiler_archives/archives/ido-5.3-recomp-$(DETECTED_OS).tar.gz:
	$(V)mkdir -p $(@D)
	$(V)curl -sL https://github.com/decompals/ido-static-recomp/releases/download/$(IDO_RECOMP_VERSION)/ido-5.3-recomp-$(DETECTED_OS).tar.gz -o $@.unverified
	$(V)sha256sum -c compiler_archives/signatures/ido-5.3-recomp-$(DETECTED_OS).tar.gz.sha256
	$(V)mv $@.unverified $@

$(IDO_RECOMP_5_3_DIR): compiler_archives/archives/ido-5.3-recomp-$(DETECTED_OS).tar.gz
	$(V)mkdir -p $@
	$(V)tar xzf $< -C $@

compiler_archives/archives/ido-7.1-recomp-$(DETECTED_OS).tar.gz:
	$(V)mkdir -p $(@D)
	$(V)curl -sL https://github.com/decompals/ido-static-recomp/releases/download/$(IDO_RECOMP_VERSION)/ido-7.1-recomp-$(DETECTED_OS).tar.gz -o $@.unverified
	$(V)sha256sum -c compiler_archives/signatures/ido-7.1-recomp-$(DETECTED_OS).tar.gz.sha256
	$(V)mv $@.unverified $@

$(IDO_RECOMP_7_1_DIR): compiler_archives/archives/ido-7.1-recomp-$(DETECTED_OS).tar.gz
	$(V)mkdir -p $@
	$(V)tar xzf $< -C $@

compiler_archives/archives/mips-binutils-egcs-2.9.5-$(DETECTED_OS).tar.gz:
	$(V)mkdir -p $(@D)
	$(V)curl -sL https://github.com/decompals/mips-binutils-egcs-2.9.5/releases/download/$(EGCS_BINUTILS_VERSION)/mips-binutils-egcs-2.9.5-$(DETECTED_OS).tar.gz -o $@.unverified
	$(V)sha256sum -c compiler_archives/signatures/mips-binutils-egcs-2.9.5-$(DETECTED_OS).tar.gz.sha256
	$(V)mv $@.unverified $@

compiler_archives/archives/mips-gcc-egcs-2.91.66-$(DETECTED_OS).tar.gz:
	$(V)mkdir -p $(@D)
	$(V)curl -sL https://github.com/decompals/mips-gcc-egcs-2.91.66/releases/download/$(EGCS_GCC_VERSION)/mips-gcc-egcs-2.91.66-$(DETECTED_OS).tar.gz -o $@.unverified
	$(V)sha256sum -c compiler_archives/signatures/mips-gcc-egcs-2.91.66-$(DETECTED_OS).tar.gz.sha256
	$(V)mv $@.unverified $@

$(EGCS_DIR): compiler_archives/archives/mips-binutils-egcs-2.9.5-$(DETECTED_OS).tar.gz compiler_archives/archives/mips-gcc-egcs-2.91.66-$(DETECTED_OS).tar.gz
	$(V)mkdir -p $@
	$(V)tar xzf compiler_archives/archives/mips-binutils-egcs-2.9.5-$(DETECTED_OS).tar.gz -C $@
	$(V)tar xzf compiler_archives/archives/mips-gcc-egcs-2.91.66-$(DETECTED_OS).tar.gz -C $@
