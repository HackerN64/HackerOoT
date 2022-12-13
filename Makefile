# ???
MAKEFLAGS += --no-builtin-rules

# Ensure the build fails if a piped command fails
SHELL = /bin/bash
.SHELLFLAGS = -o pipefail -c


#==============================================================================#
# Compiler Settings                                                            #
#==============================================================================#

# These options can either be set by building with 'make SETTING=value'.
# 'make clean' may be required first.

### Compilation flags ###

CFLAGS ?= -DNON_MATCHING -DAVOID_UB
CPPFLAGS ?= -DNON_MATCHING -DAVOID_UB -fno-dollars-in-identifiers -P
INCLUDES := -Iinclude -Isrc -Ibuild -I.

ifeq ($(COMPILER),gcc)
  CFLAGS += -G 0 -nostdinc $(INCLUDES) -march=vr4300 -mfix4300 -mabi=32 -fno-pic -mno-abicalls -mdivide-breaks -fno-zero-initialized-in-bss -fno-toplevel-reorder -ffreestanding -fno-common -fno-merge-constants -mno-explicit-relocs -mno-split-addresses $(CHECK_WARNINGS) -funsigned-char
  OPTFLAGS := -Os -ffast-math -fno-unsafe-math-optimizations
  MIPS_VERSION := -mips3
endif

# Check code syntax with host compiler
CHECK_WARNINGS := -Wall -Wextra -Wno-format-security -Wno-unknown-pragmas -Wno-unused-parameter -Wno-unused-variable -Wno-missing-braces

ASFLAGS := -march=vr4300 -32 -no-pad-sections -Iinclude
OBJDUMP_FLAGS := -d -r -z -Mreg-names=32

# Extra flags and make command detection for Mac OS
MAKE = make

ifneq ($(OS),Windows_NT)
    UNAME_S := $(shell uname -s)

    ifeq ($(UNAME_S),Darwin)
        MAKE=gmake
        CPPFLAGS += -xc++
    endif
endif

### C compiler to use for builing ###

# Currently, we only have support for the GNU C Compiler
COMPILER ?= gcc

ifeq ($(COMPILER), gcc)
  CFLAGS += -DCOMPILER_GCC
  CPPFLAGS += -DCOMPILER_GCC
else
  $(error Unsupported compiler. Currently GCC is the only supported compiler.)
endif

# Set prefix to mips binutils binaries (mips-linux-gnu-ld => 'mips-linux-gnu-') - Change at your own risk!
# In nearly all cases, not having 'mips-linux-gnu-*' binaries on the PATH is indicative of missing dependencies
MIPS_BINUTILS_PREFIX ?= mips-linux-gnu-

ifneq ($(shell type $(MIPS_BINUTILS_PREFIX)ld >/dev/null 2>/dev/null; echo $$?), 0)
  $(error Please install or build $(MIPS_BINUTILS_PREFIX))
endif

# Set binutils binaries variables
ifeq ($(COMPILER),gcc)
  CC       := $(MIPS_BINUTILS_PREFIX)gcc
endif

AS         := $(MIPS_BINUTILS_PREFIX)as
LD         := $(MIPS_BINUTILS_PREFIX)ld
OBJCOPY    := $(MIPS_BINUTILS_PREFIX)objcopy
OBJDUMP    := $(MIPS_BINUTILS_PREFIX)objdump

# ???
CC_CHECK = @:

#==============================================================================#
# Build Settings                                                               #
#==============================================================================#

### Build Type ###

# If DEBUG_BUILD is 1, compile with DEBUG_ROM defined
# This is required to use debug features (as defined in ``include/config/config_debug.h``)
DEBUG_BUILD ?= 1

ifeq ($(DEBUG_BUILD), 1)
  CFLAGS += -DDEBUG_ROM
  CPPFLAGS += -DDEBUG_ROM
endif

### Compression algorithm ###

# Supported: ``yaz0``, ``lzo``, and ``aplib``
# See https://github.com/z64me/z64enc#codec-comparison-chart for more informations
# Note: the vanilla compression algorithm is YAZ0
COMPRESSION ?= yaz0

ifeq ($(COMPRESSION), lzo)
  CFLAGS += -DCOMPRESSION_LZO
  CPPFLAGS += -DCOMPRESSION_LZO

else ifeq ($(COMPRESSION), yaz0)
  CFLAGS += -DCOMPRESSION_YAZ0
  CPPFLAGS += -DCOMPRESSION_YAZ0

else ifeq ($(COMPRESSION), aplib)
  CFLAGS += -DCOMPRESSION_APLIB
  CPPFLAGS += -DCOMPRESSION_APLIB

endif

### Build Informations ###

# Set the version define based on the commit hash
ifeq ($(origin PACKAGE_VERSION), undefined)
  PACKAGE_VERSION := $(shell git log -1 --pretty=%h | tr -d '\n')
  ifeq ('$(PACKAGE_VERSION)', '')
    PACKAGE_VERSION = Unknown version
  endif
endif

CFLAGS += -DPACKAGE_VERSION='$(PACKAGE_VERSION)'
CPPFLAGS += -DPACKAGE_VERSION='$(PACKAGE_VERSION)'

# Set the author define based on the author's name
# You can set the name with ``git config --global user.name "NAME_HERE"``
ifeq ($(origin PACKAGE_AUTHOR), undefined)
  PACKAGE_AUTHOR := $(shell git config --get user.name)
  ifeq ('$(PACKAGE_AUTHOR)', '')
    PACKAGE_AUTHOR = Unknown author
  endif
endif

CFLAGS += -DPACKAGE_AUTHOR='$(PACKAGE_AUTHOR)'
CPPFLAGS += -DPACKAGE_AUTHOR='$(PACKAGE_AUTHOR)'

# Make sure the build reports the correct version
$(shell touch src/boot/build.c)


#==============================================================================#
# Project Settings                                                             #
#==============================================================================#

# ???
PROJECT_DIR := $(dir $(realpath $(firstword $(MAKEFILE_LIST))))

# CPU Threads to use
N_THREADS ?= $(shell nproc)

#### Tools ####

EMULATOR = mupen64plus
EMU_FLAGS = --noosd

CPP        := cpp
MKLDSCRIPT := tools/mkldscript
MKDMADATA  := tools/mkdmadata
ELF2ROM    := tools/elf2rom
ZAPD       := tools/ZAPD/ZAPD.out
FADO       := tools/fado/fado.elf

#### Files ####

# Output
ROM  := HackerOoT.z64
ELF  := $(ROM:.z64=.elf)
ROMC := $(ROM:.z64=_compressed.z64)
WAD  := $(ROM:.z64=.wad)

# description of ROM segments
SPEC := spec

SRC_DIRS := $(shell find src -type d)

ASSET_BIN_DIRS := $(shell find assets/* -type d -not -path "assets/xml*" -not -path "assets/text")
ASSET_FILES_XML := $(foreach dir,$(ASSET_BIN_DIRS),$(wildcard $(dir)/*.xml))
ASSET_FILES_BIN := $(foreach dir,$(ASSET_BIN_DIRS),$(wildcard $(dir)/*.bin))
ASSET_FILES_OUT := $(foreach f,$(ASSET_FILES_XML:.xml=.c),$f) \
				   $(foreach f,$(ASSET_FILES_BIN:.bin=.bin.inc.c),build/$f) \
				   $(foreach f,$(wildcard assets/text/*.c),build/$(f:.c=.o))

UNDECOMPILED_DATA_DIRS := $(shell find data -type d)

# source files
C_FILES       := $(filter-out %.inc.c,$(foreach dir,$(SRC_DIRS) $(ASSET_BIN_DIRS),$(wildcard $(dir)/*.c)))
S_FILES       := $(foreach dir,$(SRC_DIRS) $(UNDECOMPILED_DATA_DIRS),$(wildcard $(dir)/*.s))
O_FILES       := $(foreach f,$(S_FILES:.s=.o),build/$f) \
                 $(foreach f,$(C_FILES:.c=.o),build/$f) \
                 $(foreach f,$(wildcard baserom/*),build/$f.o)

OVL_RELOC_FILES := $(shell $(CPP) $(CPPFLAGS) $(SPEC) | grep -o '[^"]*_reloc.o' )

# Automatic dependency files
# (Only asm_processor dependencies and reloc dependencies are handled for now)
DEP_FILES := $(O_FILES:.o=.asmproc.d) $(OVL_RELOC_FILES:.o=.d)


TEXTURE_FILES_PNG := $(foreach dir,$(ASSET_BIN_DIRS),$(wildcard $(dir)/*.png))
TEXTURE_FILES_JPG := $(foreach dir,$(ASSET_BIN_DIRS),$(wildcard $(dir)/*.jpg))
TEXTURE_FILES_OUT := $(foreach f,$(TEXTURE_FILES_PNG:.png=.inc.c),build/$f) \
					 $(foreach f,$(TEXTURE_FILES_JPG:.jpg=.jpg.inc.c),build/$f) \

# create build directories
$(shell mkdir -p build/baserom build/assets/text $(foreach dir,$(SRC_DIRS) $(UNDECOMPILED_DATA_DIRS) $(ASSET_BIN_DIRS),build/$(dir)))

build/src/libultra/libc/ll.o: OPTFLAGS := -Ofast
build/src/%.o: CC := $(CC) -fexec-charset=euc-jp

build/src/overlays/actors/ovl_Item_Shield/%.o: OPTFLAGS := -O2
build/src/overlays/actors/ovl_En_Part/%.o: OPTFLAGS := -O2
build/src/overlays/actors/ovl_Item_B_Heart/%.o: OPTFLAGS := -O0
build/src/overlays/actors/ovl_Bg_Mori_Hineri/%.o: OPTFLAGS := -O0

#### Main Targets ###

all: $(ROM)

compress: $(ROMC)

wad:
	$(MAKE) compress CFLAGS="-DCONSOLE_WIIVC $(CFLAGS) -fno-reorder-blocks -fno-optimize-sibling-calls" CPPFLAGS="-DCONSOLE_WIIVC $(CPPFLAGS)"
	@echo 45e | tools/gzinject/gzinject -a genkey -k common-key.bin >/dev/null
	tools/gzinject/gzinject -a inject -r 1 -k common-key.bin -w basewad.wad -m $(ROMC) -o $(WAD) -t "HackerOoT" -i NHOE -p tools/gzinject/patches/NACE.gzi -p tools/gzinject/patches/gz_default_remap.gzi
	$(RM) -r wadextract/ common-key.bin

clean:
	$(RM) -r $(ROM) $(ROMC) $(WAD) $(ELF) build cache

assetclean:
	$(RM) -r $(ASSET_BIN_DIRS)
	$(RM) -r assets/text/*.h
	$(RM) -r build/assets
	$(RM) -r .extracted-assets.json

rebuildtools:
	$(MAKE) -C tools distclean
	$(MAKE) -C tools

distclean: clean assetclean
	$(RM) -r baserom/
	$(MAKE) -C tools distclean

setup:
	$(MAKE) -C tools
	python3 fixbaserom.py
	python3 extract_baserom.py
	python3 extract_assets.py -j$(N_THREADS)
	python3 tools/daf/daf.py -a -p ./

test: $(ROM)
	$(EMULATOR) $(EMU_FLAGS) $<


.PHONY: all clean setup test distclean assetclean compress wad rebuildtools

#### Various Recipes ####

$(ROM): $(ELF)
	$(ELF2ROM) -cic 6105 $< $@

$(ROMC): $(ROM)
	python3 tools/z64compress_wrapper.py --codec $(COMPRESSION) --cache cache --threads $(N_THREADS) $< $@ $(ELF) build/$(SPEC)

$(ELF): $(TEXTURE_FILES_OUT) $(ASSET_FILES_OUT) $(O_FILES) $(OVL_RELOC_FILES) build/ldscript.txt build/undefined_syms.txt
	$(LD) -T build/undefined_syms.txt -T build/ldscript.txt --no-check-sections --accept-unknown-input-arch --emit-relocs -Map build/z64.map -o $@

## Order-only prerequisites
# These ensure e.g. the O_FILES are built before the OVL_RELOC_FILES.
# The intermediate phony targets avoid quadratically-many dependencies between the targets and prerequisites.

o_files: $(O_FILES)
$(OVL_RELOC_FILES): | o_files

asset_files: $(TEXTURE_FILES_OUT) $(ASSET_FILES_OUT)
$(O_FILES): | asset_files

.PHONY: o_files asset_files

build/$(SPEC): $(SPEC)
	$(CPP) $(CPPFLAGS) $< > $@

build/ldscript.txt: build/$(SPEC)
	$(MKLDSCRIPT) $< $@

build/undefined_syms.txt: undefined_syms.txt
	$(CPP) $(CPPFLAGS) $< > $@

build/baserom/%.o: baserom/%
	$(OBJCOPY) -I binary -O elf32-big $< $@

build/data/%.o: data/%.s
	$(AS) $(ASFLAGS) $< -o $@

build/assets/text/%.enc.h: assets/text/%.h assets/text/charmap.txt
	python3 tools/msgenc.py assets/text/charmap.txt $< $@

build/assets/text/fra_message_data_static.o: build/assets/text/message_data.enc.h
build/assets/text/ger_message_data_static.o: build/assets/text/message_data.enc.h
build/assets/text/nes_message_data_static.o: build/assets/text/message_data.enc.h
build/assets/text/staff_message_data_static.o: build/assets/text/message_data_staff.enc.h

build/assets/%.o: assets/%.c
	$(CC) -c $(CFLAGS) $(MIPS_VERSION) $(OPTFLAGS) -o $@ $<
	$(OBJCOPY) -O binary $@ $@.bin

build/src/%.o: src/%.s
	$(CPP) $(CPPFLAGS) -Iinclude $< | $(AS) $(ASFLAGS) -o $@

build/dmadata_table_spec.h: build/$(SPEC)
	$(MKDMADATA) $< $@

build/src/boot/z_std_dma.o: build/dmadata_table_spec.h
build/src/dmadata/dmadata.o: build/dmadata_table_spec.h

build/src/%.o: src/%.c
	$(CC_CHECK) $<
	$(CC) -c $(CFLAGS) $(MIPS_VERSION) $(OPTFLAGS) -o $@ $<
	@$(OBJDUMP) $(OBJDUMP_FLAGS) $@ > $(@:.o=.s)

build/src/libultra/libc/ll.o: src/libultra/libc/ll.c
	$(CC_CHECK) $<
	$(CC) -c $(CFLAGS) $(MIPS_VERSION) $(OPTFLAGS) -o $@ $<
	python3 tools/set_o32abi_bit.py $@
	@$(OBJDUMP) $(OBJDUMP_FLAGS) $@ > $(@:.o=.s)

build/src/libultra/libc/llcvt.o: src/libultra/libc/llcvt.c
	$(CC_CHECK) $<
	$(CC) -c $(CFLAGS) $(MIPS_VERSION) $(OPTFLAGS) -o $@ $<
	python3 tools/set_o32abi_bit.py $@
	@$(OBJDUMP) $(OBJDUMP_FLAGS) $@ > $(@:.o=.s)

build/src/overlays/%_reloc.o: build/$(SPEC)
	$(FADO) $$(tools/reloc_prereq $< $(notdir $*)) -n $(notdir $*) -o $(@:.o=.s) -M $(@:.o=.d)
	$(AS) $(ASFLAGS) $(@:.o=.s) -o $@

build/%.inc.c: %.png
	$(ZAPD) btex -eh -tt $(subst .,,$(suffix $*)) -i $< -o $@

build/assets/%.bin.inc.c: assets/%.bin
	$(ZAPD) bblb -eh -i $< -o $@

build/assets/%.jpg.inc.c: assets/%.jpg
	$(ZAPD) bren -eh -i $< -o $@

-include $(DEP_FILES)
