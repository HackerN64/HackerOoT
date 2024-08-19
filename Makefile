MAKEFLAGS += --no-builtin-rules --no-print-directory

# Ensure the build fails if a piped command fails
SHELL = /bin/bash
.SHELLFLAGS = -o pipefail -c

# Build options can either be changed by modifying the makefile, or by building with 'make SETTING=value'
# It is also possible to override default settings in a file called .make_options.mk with 'SETTING=value'.

-include .make_options.mk

# Enable optimization flags to use GDB on Ares
ARES_GDB := 1

# Toggle release or debug mode. 1=Release, 0=Debug
# Note: currently only used for HackerOoT
RELEASE := 0

# Valid compression algorithms are 'yaz', 'lzo' and 'aplib'
COMPRESSION ?= yaz
COMPRESSION_TYPE ?= $(shell echo $(COMPRESSION) | tr '[:lower:]' '[:upper:]')

# If COMPILER is "gcc", compile with GCC instead of IDO.
COMPILER ?= gcc
# Target game version. Currently the following versions are supported:
#   gc-jp          GameCube Japan
#   gc-jp-mq       GameCube Japan Master Quest
#   gc-jp-ce       GameCube Japan (Collector's Edition disc)
#   gc-us          GameCube US
#   gc-us-mq       GameCube US
#   gc-eu          GameCube Europe/PAL
#   gc-eu-mq       GameCube Europe/PAL Master Quest
#   gc-eu-mq-dbg   GameCube Europe/PAL Master Quest Debug
#   hackeroot-mq   HackerOoT, based on gc-eu-mq-dbg (default)
#
# The following versions are work-in-progress and not yet matching:
#   ntsc-1.2       N64 NTSC 1.2 (Japan/US depending on REGION)
#
# Note: choosing hackeroot-mq will enable HackerOoT features,
#       if another version is chosen, this repo will be like
#       zeldaret/main decomp but without the disassembly, decompilation
#       and matching tools, including the IDO compiler
VERSION ?= hackeroot-mq
# Number of threads to extract and compress with
N_THREADS ?= $(shell nproc)
# Check code syntax with host compiler
RUN_CC_CHECK ?= 1
# Set prefix to mips binutils binaries (mips-linux-gnu-ld => 'mips-linux-gnu-') - Change at your own risk!
# In nearly all cases, not having 'mips-linux-gnu-*' binaries on the PATH is indicative of missing dependencies
MIPS_BINUTILS_PREFIX ?= mips-linux-gnu-
# Emulator w/ flags
N64_EMULATOR ?=
# Set to override game region in the ROM header. Options: JP, US, EU
# REGION ?= US

CFLAGS ?=
CPPFLAGS ?=
CFLAGS_IDO ?=
CPP_DEFINES ?=

TARGET ?=

ifeq ($(TARGET),wad)
CFLAGS := -DCONSOLE_WIIVC -fno-reorder-blocks -fno-optimize-sibling-calls
CPPFLAGS := -DCONSOLE_WIIVC
else ifeq ($(TARGET),iso)
CFLAGS := -DCONSOLE_GC -fno-reorder-blocks -fno-optimize-sibling-calls
CPPFLAGS := -DCONSOLE_GC
endif

# Version-specific settings
ifeq ($(VERSION),ntsc-1.2)
  REGION ?= JP
  PLATFORM := N64
  PAL := 0
  MQ := 0
  DEBUG := 0
  COMPARE := 0
else ifeq ($(VERSION),gc-jp)
  REGION ?= JP
  PLATFORM := GC
  PAL := 0
  MQ := 0
  DEBUG := 0
else ifeq ($(VERSION),gc-jp-mq)
  REGION ?= JP
  PLATFORM := GC
  PAL := 0
  MQ := 1
  DEBUG := 0
else ifeq ($(VERSION),gc-jp-ce)
  REGION ?= JP
  PLATFORM := GC
  PAL := 0
  MQ := 0
  DEBUG := 0
else ifeq ($(VERSION),gc-us)
  REGION ?= US
  PLATFORM := GC
  PAL := 0
  MQ := 0
  DEBUG := 0
else ifeq ($(VERSION),gc-us-mq)
  REGION ?= US
  PLATFORM := GC
  PAL := 0
  MQ := 1
  DEBUG := 0
else ifeq ($(VERSION),gc-eu)
  REGION ?= EU
  PLATFORM := GC
  PAL := 1
  MQ := 0
  DEBUG := 0
else ifeq ($(VERSION),gc-eu-mq)
  REGION ?= EU
  PLATFORM := GC
  PAL := 1
  MQ := 1
  DEBUG := 0
else ifeq ($(VERSION),gc-eu-mq-dbg)
  REGION ?= EU
  PLATFORM := GC
  PAL := 1
  MQ := 1
  DEBUG := 1
else ifeq ($(VERSION),hackeroot-mq)
  REGION := NULL
  PLATFORM := GC
  PAL := 1
  MQ := 1
  DEBUG := 1
else
$(error Unsupported version $(VERSION))
endif

ifeq ($(VERSION),hackeroot-mq)
  HACKEROOT := 1
else
  HACKEROOT := 0
endif

ifeq ($(COMPILER),gcc)
  CPP_DEFINES += -DCOMPILER_GCC -DNON_MATCHING -DAVOID_UB -std=gnu11
else
  $(error Unsupported compiler. Please use gcc as the COMPILER variable.)
endif

PROJECT_DIR := $(dir $(realpath $(firstword $(MAKEFILE_LIST))))
BUILD_DIR := build/$(VERSION)
EXPECTED_DIR := expected/$(BUILD_DIR)
BASEROM_DIR := baseroms/$(VERSION)
EXTRACTED_DIR := extracted/$(VERSION)
VENV := .venv

MAKE = make
CPPFLAGS += -P -xc -fno-dollars-in-identifiers

# Set PACKAGE_VERSION define for printing commit hash
ifeq ($(origin PACKAGE_VERSION), undefined)
  PACKAGE_VERSION := $(shell git log -1 --pretty=%h | tr -d '\n')
  ifeq ('$(PACKAGE_VERSION)', '')
    PACKAGE_VERSION = Unknown version
  endif
endif

# Converts e.g. ntsc-1.0 to OOT_NTSC_1_0
VERSION_MACRO := OOT_$(shell echo $(VERSION) | tr a-z-. A-Z__)
CPP_DEFINES += -DOOT_VERSION=$(VERSION_MACRO)
CPP_DEFINES += -DOOT_REGION=REGION_$(REGION)

ifeq ($(PLATFORM),N64)
  CPP_DEFINES += -DPLATFORM_N64=1 -DPLATFORM_GC=0
else ifeq ($(PLATFORM),GC)
  CPP_DEFINES += -DPLATFORM_N64=0 -DPLATFORM_GC=1
else
  $(error Unsupported platform $(PLATFORM))
endif

ifeq ($(PAL),0)
  CPP_DEFINES += -DOOT_NTSC=1
else
  CPP_DEFINES += -DOOT_PAL=1
endif

ifeq ($(MQ),0)
  CPP_DEFINES += -DOOT_MQ=0
else
  CPP_DEFINES += -DOOT_MQ=1
endif

ifeq ($(DEBUG),1)
  CPP_DEFINES += -DOOT_DEBUG=1
  OPTFLAGS := -O2
else
  CPP_DEFINES += -DOOT_DEBUG=0 -DNDEBUG
  OPTFLAGS := -O2 -g3
endif

ifeq ($(VERSION),hackeroot-mq)
  CPP_DEFINES += -DENABLE_HACKEROOT=1
  OPTFLAGS := -Os

  ifeq ($(RELEASE),1)
    CPP_DEFINES += -DRELEASE_ROM=1 -DOOT_DEBUG=0
    CFLAGS_IDO += -DOOT_DEBUG=0
  else
    CPP_DEFINES += -DRELEASE_ROM=0 -DOOT_DEBUG=1
  endif
else
  ifeq ($(DEBUG),1)
    CPP_DEFINES += -DOOT_DEBUG=1
    OPTFLAGS := -O2
  else
    CPP_DEFINES += -DNDEBUG -DOOT_DEBUG=0
    OPTFLAGS := -O2 -g3
  endif

  CPP_DEFINES += -DENABLE_HACKEROOT=0
endif

# Override optimization flags if using GDB
ifeq ($(ARES_GDB),1)
  OPTFLAGS := -Og -ggdb3
endif

# Define author and package version for every OoT version
# Note: this won't be used if not using HackerOoT
CFLAGS += -DPACKAGE_VERSION='$(PACKAGE_VERSION)' -DCOMPRESS_$(COMPRESSION_TYPE)=1
CPPFLAGS += -DPACKAGE_VERSION='$(PACKAGE_VERSION)' -DCOMPRESS_$(COMPRESSION_TYPE)=1
CFLAGS_IDO += -DPACKAGE_VERSION='$(PACKAGE_VERSION)' -DCOMPRESS_$(COMPRESSION_TYPE)=1
OPTFLAGS += -ffast-math -fno-unsafe-math-optimizations

ifeq ($(OS),Windows_NT)
    DETECTED_OS=windows
else
    UNAME_S := $(shell uname -s)
    ifeq ($(UNAME_S),Linux)
        DETECTED_OS=linux
    endif
    ifeq ($(UNAME_S),Darwin)
        DETECTED_OS=macos
        MAKE=gmake
    endif
endif

# Verbose toggle
V := @
ifeq (VERBOSE, 1)
    V=
endif

# Colors
NO_COL  := \033[0m
GREEN   := \033[0;32m
BLUE    := \033[0;36m
YELLOW  := \033[0;33m
BLINK   := \033[32;5m

PRINT := printf

# Generic print function for make rules
define print
  $(V)echo -e "$(GREEN)$(1) $(YELLOW)$(2)$(GREEN) -> $(BLUE)$(3)$(NO_COL)"
endef

#### Tools ####
ifneq ($(shell type $(MIPS_BINUTILS_PREFIX)ld >/dev/null 2>/dev/null; echo $$?), 0)
  $(error Unable to find $(MIPS_BINUTILS_PREFIX)ld. Please install or build MIPS binutils, commonly mips-linux-gnu. (or set MIPS_BINUTILS_PREFIX if your MIPS binutils install uses another prefix))
endif

# Detect compiler and set variables appropriately.
ifeq ($(COMPILER),gcc)
  CC       := $(MIPS_BINUTILS_PREFIX)gcc
else
$(error Unsupported compiler. Please use gcc as the COMPILER variable.)
endif

AS      := $(MIPS_BINUTILS_PREFIX)as
LD      := $(MIPS_BINUTILS_PREFIX)ld
OBJCOPY := $(MIPS_BINUTILS_PREFIX)objcopy
OBJDUMP := $(MIPS_BINUTILS_PREFIX)objdump
NM      := $(MIPS_BINUTILS_PREFIX)nm

INC := -Iinclude -Iinclude/libc -Isrc -I$(BUILD_DIR) -I. -I$(EXTRACTED_DIR)

# Check code syntax with host compiler
CHECK_WARNINGS := -Wall -Wextra -Wno-format-security -Wno-unknown-pragmas -Wno-unused-parameter -Wno-unused-variable -Wno-missing-braces
CHECK_WARNINGS += -Werror=implicit-int -Werror=implicit-function-declaration -Werror=int-conversion -Werror=incompatible-pointer-types

# The `cpp` command behaves differently on macOS (it behaves as if
# `-traditional-cpp` was passed) so we use `gcc -E` instead.
CPP        := gcc -E
MKLDSCRIPT := tools/mkldscript
MKDMADATA  := tools/mkdmadata
ELF2ROM    := tools/elf2rom
ZAPD       := tools/ZAPD/ZAPD.out
FADO       := tools/fado/fado.elf
PYTHON     ?= $(VENV)/bin/python3
FLIPS      := tools/Flips/flips
GZINJECT   := tools/gzinject/gzinject
CC_IDO     := tools/ido_recomp/linux/5.3/cc

# Command to replace $(BUILD_DIR) in some files with the build path.
# We can't use the C preprocessor for this because it won't substitute inside string literals.
BUILD_DIR_REPLACE := sed -e 's|$$(BUILD_DIR)|$(BUILD_DIR)|g'

# Audio tools
AUDIO_EXTRACT := $(PYTHON) tools/audio_extraction.py
SAMPLECONV    := tools/audio/sampleconv/sampleconv
SBC           := tools/audio/sbc
ATBLGEN       := tools/audio/atblgen

SBCFLAGS := --matching

CFLAGS += $(CPP_DEFINES)
CPPFLAGS += $(CPP_DEFINES)
CFLAGS_IDO += $(CPP_DEFINES)

GBI_DEFINES := -DF3DEX_GBI_2
ifeq ($(PLATFORM),GC)
  GBI_DEFINES += -DF3DEX_GBI_PL -DGBI_DOWHILE
endif
ifeq ($(DEBUG),1)
  GBI_DEFINES += -DGBI_DEBUG
endif

CFLAGS += $(GBI_DEFINES)

ASFLAGS := -march=vr4300 -32 -no-pad-sections -Iinclude -I$(EXTRACTED_DIR)

ifeq ($(COMPILER),gcc)
  CFLAGS += -G 0 -nostdinc $(INC) -march=vr4300 -mfix4300 -mabi=32 -mno-abicalls -mdivide-breaks -fno-PIC -fno-common -ffreestanding -fbuiltin -fno-builtin-sinf -fno-builtin-cosf $(CHECK_WARNINGS) -funsigned-char
  MIPS_VERSION := -mips3
  RUN_CC_CHECK := 0
endif

OBJDUMP_FLAGS := -d -r -z -Mreg-names=32

#### Files ####

# ROM image
ifeq ($(VERSION),hackeroot-mq)
  ROM      := $(BUILD_DIR)/$(VERSION).z64
else
  ROM      := $(BUILD_DIR)/oot-$(VERSION).z64
endif
ROMC     := $(ROM:.z64=-compressed-$(COMPRESSION).z64)
WAD      := $(ROM:.z64=.wad)
ISO      := $(ROM:.z64=.iso)
BPS      := $(ROM:.z64=.bps)
ELF      := $(ROM:.z64=.elf)
MAP      := $(ROM:.z64=.map)
LDSCRIPT := $(ROM:.z64=.ld)
DMA_CONFIG_FILE := dma_config.txt
# description of ROM segments
SPEC := spec

# Baserom to use when creating BPS patches
BASEROM_PATCH ?= baseroms/$(VERSION)/baserom.z64

ifeq ($(COMPILER),gcc)
SRC_DIRS := $(shell find src -type d)
endif

ifneq ($(wildcard $(EXTRACTED_DIR)/assets/audio),)
  SAMPLE_EXTRACT_DIRS := $(shell find $(EXTRACTED_DIR)/assets/audio/samples -type d)
  SAMPLEBANK_EXTRACT_DIRS := $(shell find $(EXTRACTED_DIR)/assets/audio/samplebanks -type d)
else
  SAMPLE_EXTRACT_DIRS :=
  SAMPLEBANK_EXTRACT_DIRS :=
endif

ifneq ($(wildcard assets/audio/samples),)
  SAMPLE_DIRS := $(shell find assets/audio/samples -type d)
else
  SAMPLE_DIRS :=
endif

ifneq ($(wildcard assets/audio/samplebanks),)
  SAMPLEBANK_DIRS := $(shell find assets/audio/samplebanks -type d)
else
  SAMPLEBANK_DIRS :=
endif

SAMPLE_FILES         := $(foreach dir,$(SAMPLE_DIRS),$(wildcard $(dir)/*.wav))
SAMPLE_EXTRACT_FILES := $(foreach dir,$(SAMPLE_EXTRACT_DIRS),$(wildcard $(dir)/*.wav))
AIFC_FILES           := $(foreach f,$(SAMPLE_FILES),$(BUILD_DIR)/$(f:.wav=.aifc)) $(foreach f,$(SAMPLE_EXTRACT_FILES:.wav=.aifc),$(f:$(EXTRACTED_DIR)/%=$(BUILD_DIR)/%))

SAMPLEBANK_XMLS         := $(foreach dir,$(SAMPLEBANK_DIRS),$(wildcard $(dir)/*.xml))
SAMPLEBANK_EXTRACT_XMLS := $(foreach dir,$(SAMPLEBANK_EXTRACT_DIRS),$(wildcard $(dir)/*.xml))
SAMPLEBANK_BUILD_XMLS   := $(foreach f,$(SAMPLEBANK_XMLS),$(BUILD_DIR)/$f) $(foreach f,$(SAMPLEBANK_EXTRACT_XMLS),$(f:$(EXTRACTED_DIR)/%=$(BUILD_DIR)/%))
SAMPLEBANK_O_FILES      := $(foreach f,$(SAMPLEBANK_BUILD_XMLS),$(f:.xml=.o))
SAMPLEBANK_DEP_FILES    := $(foreach f,$(SAMPLEBANK_O_FILES),$(f:.o=.d))

# create extracted directories
$(shell mkdir -p $(EXTRACTED_DIR) $(EXTRACTED_DIR)/assets $(EXTRACTED_DIR)/text)

ASSET_BIN_DIRS_EXTRACTED := $(shell find $(EXTRACTED_DIR)/assets -type d)
ASSET_BIN_DIRS_COMMITTED := $(shell find assets -type d -not -path "assets/xml*" -not -path assets/text)
ASSET_BIN_DIRS := $(ASSET_BIN_DIRS_EXTRACTED) $(ASSET_BIN_DIRS_COMMITTED)

ASSET_FILES_BIN_EXTRACTED := $(foreach dir,$(ASSET_BIN_DIRS_EXTRACTED),$(wildcard $(dir)/*.bin))
ASSET_FILES_BIN_COMMITTED := $(foreach dir,$(ASSET_BIN_DIRS_COMMITTED),$(wildcard $(dir)/*.bin))
ASSET_FILES_OUT := $(foreach f,$(ASSET_FILES_BIN_EXTRACTED:.bin=.bin.inc.c),$(f:$(EXTRACTED_DIR)/%=$(BUILD_DIR)/%)) \
                   $(foreach f,$(ASSET_FILES_BIN_COMMITTED:.bin=.bin.inc.c),$(BUILD_DIR)/$f) \
                   $(foreach f,$(wildcard assets/text/*.c),$(BUILD_DIR)/$(f:.c=.o))

UNDECOMPILED_DATA_DIRS := $(shell find data -type d)

BASEROM_BIN_FILES := $(wildcard $(EXTRACTED_DIR)/baserom/*)

# source files
ASSET_C_FILES_EXTRACTED := $(filter-out %.inc.c,$(foreach dir,$(ASSET_BIN_DIRS_EXTRACTED),$(wildcard $(dir)/*.c)))
ASSET_C_FILES_COMMITTED := $(filter-out %.inc.c,$(foreach dir,$(ASSET_BIN_DIRS_COMMITTED),$(wildcard $(dir)/*.c)))
SRC_C_FILES   := $(filter-out %.inc.c,$(foreach dir,$(SRC_DIRS),$(wildcard $(dir)/*.c)))
S_FILES       := $(foreach dir,$(SRC_DIRS) $(UNDECOMPILED_DATA_DIRS),$(wildcard $(dir)/*.s))
O_FILES       := $(foreach f,$(S_FILES:.s=.o),$(BUILD_DIR)/$f) \
                 $(foreach f,$(SRC_C_FILES:.c=.o),$(BUILD_DIR)/$f) \
                 $(foreach f,$(ASSET_C_FILES_EXTRACTED:.c=.o),$(f:$(EXTRACTED_DIR)/%=$(BUILD_DIR)/%)) \
                 $(foreach f,$(ASSET_C_FILES_COMMITTED:.c=.o),$(BUILD_DIR)/$f) \
                 $(foreach f,$(BASEROM_BIN_FILES),$(BUILD_DIR)/baserom/$(notdir $f).o)
UCODE_PATCHES := $(wildcard F3DEX3/*.bps)
UCODE_FILES   := $(foreach f,$(UCODE_PATCHES:.bps=),$f)
UCODE_O_FILES := $(foreach f,$(UCODE_FILES),$(BUILD_DIR)/$f.o)

OVL_RELOC_FILES := $(shell $(CPP) $(CPPFLAGS) $(SPEC) | $(BUILD_DIR_REPLACE) | grep -o '[^"]*_reloc.o' )

# Automatic dependency files
# (Only asm_processor dependencies and reloc dependencies are handled for now)
DEP_FILES := $(O_FILES:.o=.asmproc.d) $(OVL_RELOC_FILES:.o=.d)


TEXTURE_FILES_PNG_EXTRACTED := $(foreach dir,$(ASSET_BIN_DIRS_EXTRACTED),$(wildcard $(dir)/*.png))
TEXTURE_FILES_PNG_COMMITTED := $(foreach dir,$(ASSET_BIN_DIRS_COMMITTED),$(wildcard $(dir)/*.png))
TEXTURE_FILES_JPG_EXTRACTED := $(foreach dir,$(ASSET_BIN_DIRS_EXTRACTED),$(wildcard $(dir)/*.jpg))
TEXTURE_FILES_JPG_COMMITTED := $(foreach dir,$(ASSET_BIN_DIRS_COMMITTED),$(wildcard $(dir)/*.jpg))
TEXTURE_FILES_OUT := $(foreach f,$(TEXTURE_FILES_PNG_EXTRACTED:.png=.inc.c),$(f:$(EXTRACTED_DIR)/%=$(BUILD_DIR)/%)) \
                     $(foreach f,$(TEXTURE_FILES_PNG_COMMITTED:.png=.inc.c),$(BUILD_DIR)/$f) \
                     $(foreach f,$(TEXTURE_FILES_JPG_EXTRACTED:.jpg=.jpg.inc.c),$(f:$(EXTRACTED_DIR)/%=$(BUILD_DIR)/%)) \
                     $(foreach f,$(TEXTURE_FILES_JPG_COMMITTED:.jpg=.jpg.inc.c),$(BUILD_DIR)/$f)

# create build directories
$(shell mkdir -p $(BUILD_DIR)/baserom \
                 $(BUILD_DIR)/assets/text)
$(shell mkdir -p $(foreach dir, \
                      $(SRC_DIRS) \
                      $(UNDECOMPILED_DATA_DIRS) \
                      $(SAMPLE_DIRS) \
                      $(SAMPLEBANK_DIRS) \
                      $(ASSET_BIN_DIRS_COMMITTED), \
                    $(BUILD_DIR)/$(dir)))
ifneq ($(wildcard $(EXTRACTED_DIR)/assets),)
$(shell mkdir -p $(foreach dir, \
                      $(SAMPLE_EXTRACT_DIRS) \
                      $(SAMPLEBANK_EXTRACT_DIRS) \
                      $(ASSET_BIN_DIRS_EXTRACTED), \
                    $(dir:$(EXTRACTED_DIR)/%=$(BUILD_DIR)/%)))
endif

ifeq ($(COMPILER),gcc)
# Note that if adding additional assets directories for modding reasons these flags must also be used there
  $(BUILD_DIR)/assets/%.o: CFLAGS += -fno-zero-initialized-in-bss -fno-toplevel-reorder
  $(BUILD_DIR)/src/%.o: CFLAGS += -fexec-charset=utf-8
  $(BUILD_DIR)/src/libultra/libc/ll.o: OPTFLAGS := -Ofast
  $(BUILD_DIR)/src/overlays/%.o: CFLAGS += -fno-merge-constants -mno-explicit-relocs -mno-split-addresses

  $(BUILD_DIR)/src/overlays/actors/ovl_Item_Shield/%.o: OPTFLAGS := -O2
  $(BUILD_DIR)/src/overlays/actors/ovl_En_Part/%.o: OPTFLAGS := -O2
  $(BUILD_DIR)/src/overlays/actors/ovl_Item_B_Heart/%.o: OPTFLAGS := -O0
  $(BUILD_DIR)/src/overlays/actors/ovl_Bg_Mori_Hineri/%.o: OPTFLAGS := -O0

# library overrides for Gamecube
ifeq ($(TARGET),iso)
  MIPS_VERSION_IDO := -mips2
  CFLAGS_IDO += -G 0 -non_shared -fullwarn -verbose -Xcpluscomm $(INC) -Wab,-r4300_mul -woff 516,609,649,838,712
  $(BUILD_DIR)/src/libultra/io/viswapbuf.o: OPTFLAGS := -O2
  $(BUILD_DIR)/src/libultra/io/viswapbuf.o: MIPS_VERSION := $(MIPS_VERSION_IDO)
  $(BUILD_DIR)/src/libultra/io/viswapbuf.o: CFLAGS := $(CFLAGS_IDO)
  $(BUILD_DIR)/src/libultra/io/viswapbuf.o: CC := $(CC_IDO)
  $(BUILD_DIR)/src/libultra/gu/sinf.o: OPTFLAGS := -O2
  $(BUILD_DIR)/src/libultra/gu/sinf.o: MIPS_VERSION := $(MIPS_VERSION_IDO)
  $(BUILD_DIR)/src/libultra/gu/sinf.o: CFLAGS := $(CFLAGS_IDO)
  $(BUILD_DIR)/src/libultra/gu/sinf.o: CC := $(CC_IDO)
  $(BUILD_DIR)/src/libultra/gu/cosf.o: OPTFLAGS := -O2
  $(BUILD_DIR)/src/libultra/gu/cosf.o: MIPS_VERSION := $(MIPS_VERSION_IDO)
  $(BUILD_DIR)/src/libultra/gu/cosf.o: CFLAGS := $(CFLAGS_IDO)
  $(BUILD_DIR)/src/libultra/gu/cosf.o: CC := $(CC_IDO)
  $(BUILD_DIR)/src/libultra/gu/perspective.o: OPTFLAGS := -O2
  $(BUILD_DIR)/src/libultra/gu/perspective.o: MIPS_VERSION := $(MIPS_VERSION_IDO)
  $(BUILD_DIR)/src/libultra/gu/perspective.o: CFLAGS := $(CFLAGS_IDO)
  $(BUILD_DIR)/src/libultra/gu/perspective.o: CC := $(CC_IDO)
  $(BUILD_DIR)/src/libultra/os/getmemsize.o: OPTFLAGS := -O1
  $(BUILD_DIR)/src/libultra/os/getmemsize.o: MIPS_VERSION := $(MIPS_VERSION_IDO)
  $(BUILD_DIR)/src/libultra/os/getmemsize.o: CFLAGS := $(CFLAGS_IDO)
  $(BUILD_DIR)/src/libultra/os/getmemsize.o: CC := $(CC_IDO)
  $(BUILD_DIR)/src/libultra/os/aisetnextbuf.o: OPTFLAGS := -O1
  $(BUILD_DIR)/src/libultra/os/aisetnextbuf.o: MIPS_VERSION := $(MIPS_VERSION_IDO)
  $(BUILD_DIR)/src/libultra/os/aisetnextbuf.o: CFLAGS := $(CFLAGS_IDO)
  $(BUILD_DIR)/src/libultra/os/aisetnextbuf.o: CC := $(CC_IDO)
endif
endif

#### Main Targets ###

all: rom

rom:
	$(call print,Building the rom...)
	$(V)python3 tools/mod_assets.py --oot-version $(VERSION)
	$(V)$(MAKE) $(ROM)

compress:
	$(call print,Compressing the rom...)
# make sure z_std_dma.c and spec are up-to-date
	$(V)$(shell touch spec)
	$(V)$(shell touch src/boot/z_std_dma.c)
	$(V)$(MAKE) $(ROMC)
	$(call print,Success!)

wad:
	$(call print,Patching WAD...)
ifeq ("$(wildcard baseroms/$(VERSION)/common-key.bin)", "")
	$(error Please provide the common-key.bin file.)
endif
	$(V)$(MAKE) compress TARGET=wad
	$(V)$(GZINJECT) -a inject -r 1 -k baseroms/$(VERSION)/common-key.bin -w baseroms/$(VERSION)/basewad.wad -m $(ROMC) -o $(WAD) -t "HackerOoT" -i NHOE -p tools/gzinject/patches/NACE.gzi -p tools/gzinject/patches/gz_default_remap.gzi
	$(V)$(RM) -r wadextract/
	$(call print,Success!)

iso:
	$(V)$(MAKE) compress TARGET=iso
	$(call print,Patching ISO...)
	$(V)$(PYTHON) tools/gc_utility.py -v $(VERSION) -c $(COMPRESSION)
	$(V)$(GZINJECT) -a extract -s baseroms/$(VERSION)/baseiso.iso
	$(V)cp $(BUILD_DIR)/$(DMA_CONFIG_FILE) isoextract/zlj_f.tgc/$(DMA_CONFIG_FILE)
	$(V)cp $(ROMC) isoextract/zlj_f.tgc/zlj_f.n64
	$(V)$(RM) -r isoextract/S_*.tgc/ isoextract/zlj_f.tgc/*.thp
	$(V)$(FLIPS) --apply tools/gamecube.bps isoextract/zlj_f.tgc/main.dol isoextract/zlj_f.tgc/main.dol
	$(V)$(GZINJECT) -a pack -s $(ISO)
	$(V)$(RM) -r isoextract/
	$(call print,Success!)

clean:
	$(V)$(RM) -r $(BUILD_DIR)
	$(call print,Success!)

assetclean:
	$(V)$(RM) -r $(EXTRACTED_DIR)
	$(call print,Success!)

distclean:
	$(V)$(RM) -r extracted/
	$(V)$(RM) -r build/
	$(V)$(MAKE) -C tools distclean
	$(V)$(RM) -r F3DEX3/*.code F3DEX3/*.data
	$(call print,Success!)

venv:
# Create the virtual environment if it doesn't exist.
# Delete the virtual environment directory if creation fails.
	$(call print,Preparing the virtual environment...)
	$(V)test -d $(VENV) || python3 -m venv $(VENV) || { rm -rf $(VENV); false; }
	$(V)$(PYTHON) -m pip install -U pip
	$(V)$(PYTHON) -m pip install -U -r requirements.txt
	$(call print,Success!)

# TODO this is a temporary rule for testing audio, to be removed
setup-audio:
	$(AUDIO_EXTRACT) -o $(EXTRACTED_DIR) -v $(VERSION) --read-xml

setup: venv
	$(call print,Setup in progress...)
	$(V)$(MAKE) -C tools
	$(call print,Tools: Done!)
	$(V)$(PYTHON) tools/decompress_baserom.py $(VERSION)
	$(call print,Decompressing baserom: Done!)
	$(V)$(PYTHON) tools/extract_baserom.py $(BASEROM_DIR)/baserom-decompressed.z64 --oot-version $(VERSION) -o $(EXTRACTED_DIR)/baserom
	$(V)$(PYTHON) tools/extract_incbins.py $(EXTRACTED_DIR)/baserom --oot-version $(VERSION) -o $(EXTRACTED_DIR)/incbin
	$(V)$(PYTHON) tools/msgdis.py $(VERSION)
	$(V)$(PYTHON) extract_assets.py -v $(VERSION) -j$(N_THREADS)
	$(V)$(AUDIO_EXTRACT) -o $(EXTRACTED_DIR) -v $(VERSION) --read-xml
	$(call print,Extracting files: Done!)

run: rom
ifeq ($(N64_EMULATOR),)
	$(error Emulator path not set. Set N64_EMULATOR in the Makefile or define it as an environment variable)
endif
	$(N64_EMULATOR) $(ROM)

patch:
	$(call print,Creating BPS patch...)
	$(V)$(FLIPS) --create --bps $(BASEROM_PATCH) $(ROM) $(BPS)
	$(call print,Success!)

create_f3dex3_patches: F3DEX3/f3dzex2.code F3DEX3/f3dzex2.data
	$(call print,Creating F3DEX3 patches...)
	$(V)$(FLIPS) --create --bps F3DEX3/f3dzex2.code F3DEX3/F3DEX3_BrW.code F3DEX3/F3DEX3_BrW.code.bps
	$(V)$(FLIPS) --create --bps F3DEX3/f3dzex2.data F3DEX3/F3DEX3_BrW.data F3DEX3/F3DEX3_BrW.data.bps
	$(V)$(FLIPS) --create --bps F3DEX3/f3dzex2.code F3DEX3/F3DEX3_BrW_PA.code F3DEX3/F3DEX3_BrW_PA.code.bps
	$(V)$(FLIPS) --create --bps F3DEX3/f3dzex2.data F3DEX3/F3DEX3_BrW_PA.data F3DEX3/F3DEX3_BrW_PA.data.bps
	$(V)$(FLIPS) --create --bps F3DEX3/f3dzex2.code F3DEX3/F3DEX3_BrW_PB.code F3DEX3/F3DEX3_BrW_PB.code.bps
	$(V)$(FLIPS) --create --bps F3DEX3/f3dzex2.data F3DEX3/F3DEX3_BrW_PB.data F3DEX3/F3DEX3_BrW_PB.data.bps
	$(V)$(FLIPS) --create --bps F3DEX3/f3dzex2.code F3DEX3/F3DEX3_BrW_PC.code F3DEX3/F3DEX3_BrW_PC.code.bps
	$(V)$(FLIPS) --create --bps F3DEX3/f3dzex2.data F3DEX3/F3DEX3_BrW_PC.data F3DEX3/F3DEX3_BrW_PC.data.bps
	$(V)$(FLIPS) --create --bps F3DEX3/f3dzex2.code F3DEX3/F3DEX3_BrW_NOC.code F3DEX3/F3DEX3_BrW_NOC.code.bps
	$(V)$(FLIPS) --create --bps F3DEX3/f3dzex2.data F3DEX3/F3DEX3_BrW_NOC.data F3DEX3/F3DEX3_BrW_NOC.data.bps
	$(V)$(FLIPS) --create --bps F3DEX3/f3dzex2.code F3DEX3/F3DEX3_BrW_NOC_PA.code F3DEX3/F3DEX3_BrW_NOC_PA.code.bps
	$(V)$(FLIPS) --create --bps F3DEX3/f3dzex2.data F3DEX3/F3DEX3_BrW_NOC_PA.data F3DEX3/F3DEX3_BrW_NOC_PA.data.bps
	$(V)$(FLIPS) --create --bps F3DEX3/f3dzex2.code F3DEX3/F3DEX3_BrW_NOC_PB.code F3DEX3/F3DEX3_BrW_NOC_PB.code.bps
	$(V)$(FLIPS) --create --bps F3DEX3/f3dzex2.data F3DEX3/F3DEX3_BrW_NOC_PB.data F3DEX3/F3DEX3_BrW_NOC_PB.data.bps
	$(V)$(FLIPS) --create --bps F3DEX3/f3dzex2.code F3DEX3/F3DEX3_BrW_NOC_PC.code F3DEX3/F3DEX3_BrW_NOC_PC.code.bps
	$(V)$(FLIPS) --create --bps F3DEX3/f3dzex2.data F3DEX3/F3DEX3_BrW_NOC_PC.data F3DEX3/F3DEX3_BrW_NOC_PC.data.bps
	$(call print,Success!)

verify:
	$(V)$(MAKE) clean
	$(V)$(MAKE) rom
	@md5sum $(ROM)

.PHONY: all rom compress clean assetclean distclean venv setup run wad iso patch create_f3dex3_patches verify

.DEFAULT_GOAL := rom

#### Various Recipes ####

$(ROM): $(ELF)
	$(V)$(ELF2ROM) -cic 6105 $< $@
	@$(PRINT) "${BLINK}Build succeeded.\n$(NO_COL)"
	@$(PRINT) "==== Build Options ====$(NO_COL)\n"
	@$(PRINT) "${GREEN}OoT Version: $(BLUE)$(VERSION)$(NO_COL)\n"
	@$(PRINT) "${GREEN}Code Version: $(BLUE)$(PACKAGE_VERSION)$(NO_COL)\n"

$(ROMC): $(ROM) $(ELF) $(BUILD_DIR)/compress_ranges.txt
ifeq ($(COMPRESSION),yaz)
	$(V)$(PYTHON) tools/compress.py --in $(ROM) --out $@ --dmadata-start `./tools/dmadata_start.sh $(NM) $(ELF)` --compress `cat $(BUILD_DIR)/compress_ranges.txt` --threads $(N_THREADS)
else
	$(V)$(PYTHON) tools/z64compress_wrapper.py --codec $(COMPRESSION) --cache $(BUILD_DIR)/cache --threads $(N_THREADS) $< $@ $(ELF) $(BUILD_DIR)/$(SPEC)
endif
	$(V)$(PYTHON) -m ipl3checksum sum --cic 6105 --update $@

$(ELF): $(TEXTURE_FILES_OUT) $(ASSET_FILES_OUT) $(O_FILES) $(OVL_RELOC_FILES) $(LDSCRIPT) $(BUILD_DIR)/undefined_syms.txt \
        $(SAMPLEBANK_O_FILES)
	$(call print,Linking:,,$@)
	$(V)$(LD) -T $(LDSCRIPT) -T $(BUILD_DIR)/undefined_syms.txt --no-check-sections --accept-unknown-input-arch --emit-relocs -Map $(MAP) -o $@

## Order-only prerequisites
# These ensure e.g. the O_FILES are built before the OVL_RELOC_FILES.
# The intermediate phony targets avoid quadratically-many dependencies between the targets and prerequisites.

o_files: $(O_FILES)
$(OVL_RELOC_FILES): | o_files

asset_files: $(TEXTURE_FILES_OUT) $(ASSET_FILES_OUT)
$(O_FILES): | asset_files

.PHONY: o_files asset_files

$(BUILD_DIR)/$(SPEC): $(SPEC)
	$(call print,Preprocessing:,$<,$@)
	$(V)$(CPP) $(CPPFLAGS) $< | $(BUILD_DIR_REPLACE) > $@

$(LDSCRIPT): $(BUILD_DIR)/$(SPEC)
	$(call print,Creating linker script:,$<,$@)
	$(V)$(MKLDSCRIPT) $< $@

$(BUILD_DIR)/undefined_syms.txt: undefined_syms.txt
	$(call print,Preprocessing:,$<,$@)
	$(V)$(CPP) $(CPPFLAGS) $< > $@

$(BUILD_DIR)/baserom/%.o: $(EXTRACTED_DIR)/baserom/%
	$(call print,Wrapping binary to ELF:,$<,$@)
	$(V)$(OBJCOPY) -I binary -O elf32-big $< $@
	
$(BUILD_DIR)/F3DEX3/%.o: F3DEX3/%
	$(call print,Wrapping binary to ELF:,$<,$@)
	$(V)mkdir -p $(BUILD_DIR)/F3DEX3
	$(V)$(OBJCOPY) -I binary -O elf32-big $< $@

$(BUILD_DIR)/data/%.o: data/%.s
	$(call print,Assembling:,$<,$@)
	$(V)$(CPP) $(CPPFLAGS) -Iinclude $< | $(AS) $(ASFLAGS) -o $@

$(BUILD_DIR)/assets/text/%.enc.jpn.h: assets/text/%.h $(EXTRACTED_DIR)/text/%.h assets/text/charmap.txt
	$(call print,Encoding:,$<,$@)
	$(V)$(CPP) $(CPPFLAGS) -I$(EXTRACTED_DIR) $< | $(PYTHON) tools/msgenc.py --encoding jpn --charmap assets/text/charmap.txt - $@

$(BUILD_DIR)/assets/text/%.enc.nes.h: assets/text/%.h $(EXTRACTED_DIR)/text/%.h assets/text/charmap.txt
	$(call print,Encoding:,$<,$@)
	$(V)$(CPP) $(CPPFLAGS) -I$(EXTRACTED_DIR) $< | $(PYTHON) tools/msgenc.py --encoding nes --charmap assets/text/charmap.txt - $@

# Dependencies for files including message data headers
# TODO remove when full header dependencies are used.
$(BUILD_DIR)/assets/text/jpn_message_data_static.o: $(BUILD_DIR)/assets/text/message_data.enc.jpn.h
$(BUILD_DIR)/assets/text/nes_message_data_static.o: $(BUILD_DIR)/assets/text/message_data.enc.nes.h
$(BUILD_DIR)/assets/text/ger_message_data_static.o: $(BUILD_DIR)/assets/text/message_data.enc.nes.h
$(BUILD_DIR)/assets/text/fra_message_data_static.o: $(BUILD_DIR)/assets/text/message_data.enc.nes.h
$(BUILD_DIR)/assets/text/staff_message_data_static.o: $(BUILD_DIR)/assets/text/message_data_staff.enc.nes.h
$(BUILD_DIR)/src/code/z_message.o: assets/text/message_data.h assets/text/message_data_staff.h

$(BUILD_DIR)/assets/text/%.o: assets/text/%.c
	$(call print,Compiling:,$<,$@)
	$(V)$(CC) -c $(CFLAGS) $(MIPS_VERSION) $(OPTFLAGS) -o $@ $<
	$(V)$(OBJCOPY) -O binary --only-section .rodata $@ $@.bin

$(BUILD_DIR)/assets/%.o: assets/%.c
	$(CC) -c $(CFLAGS) $(MIPS_VERSION) $(OPTFLAGS) -o $@ $<
	$(OBJCOPY) -O binary $@ $@.bin

$(BUILD_DIR)/assets/%.o: $(EXTRACTED_DIR)/assets/%.c
	$(call print,Compiling:,$<,$@)
	$(V)$(CC) -c $(CFLAGS) $(MIPS_VERSION) $(OPTFLAGS) -o $@ $<
	$(V)$(OBJCOPY) -O binary $@ $@.bin

$(BUILD_DIR)/src/%.o: src/%.s
	$(call print,Compiling:,$<,$@)
	$(V)$(CPP) $(CPPFLAGS) -Iinclude $< | $(AS) $(ASFLAGS) -o $@

$(BUILD_DIR)/dmadata_table_spec.h $(BUILD_DIR)/compress_ranges.txt: $(BUILD_DIR)/$(SPEC)
	$(V)$(MKDMADATA) $< $(BUILD_DIR)/dmadata_table_spec.h $(BUILD_DIR)/compress_ranges.txt

# Dependencies for files that may include the dmadata header automatically generated from the spec file
$(BUILD_DIR)/src/boot/z_std_dma.o: $(BUILD_DIR)/dmadata_table_spec.h
$(BUILD_DIR)/src/dmadata/dmadata.o: $(BUILD_DIR)/dmadata_table_spec.h

# Dependencies for files including from include/tables/
# TODO remove when full header dependencies are used.
$(BUILD_DIR)/src/code/graph.o: include/tables/gamestate_table.h
$(BUILD_DIR)/src/code/object_table.o: include/tables/object_table.h
$(BUILD_DIR)/src/code/z_actor.o: include/tables/actor_table.h # so uses of ACTOR_ID_MAX update when the table length changes
$(BUILD_DIR)/src/code/z_actor_dlftbls.o: include/tables/actor_table.h
$(BUILD_DIR)/src/code/z_effect_soft_sprite_dlftbls.o: include/tables/effect_ss_table.h
$(BUILD_DIR)/src/code/z_game_dlftbls.o: include/tables/gamestate_table.h
$(BUILD_DIR)/src/code/z_scene_table.o: include/tables/scene_table.h include/tables/entrance_table.h

$(BUILD_DIR)/src/%.o: src/%.c
ifneq ($(RUN_CC_CHECK),0)
	$(V)$(CC_CHECK) $<
endif
	$(call print,Compiling:,$<,$@)
	$(V)$(CC) -c $(CFLAGS) $(MIPS_VERSION) $(OPTFLAGS) -o $@ $<
	$(V)@$(OBJDUMP) $(OBJDUMP_FLAGS) $@ > $(@:.o=.s)

$(BUILD_DIR)/src/libultra/libc/ll.o: src/libultra/libc/ll.c
ifneq ($(RUN_CC_CHECK),0)
	$(V)$(CC_CHECK) $<
endif
	$(call print,Compiling:,$<,$@)
	$(V)$(CC) -c $(CFLAGS) $(MIPS_VERSION) $(OPTFLAGS) -o $@ $<
	$(V)$(PYTHON) tools/set_o32abi_bit.py $@
	$(V)@$(OBJDUMP) $(OBJDUMP_FLAGS) $@ > $(@:.o=.s)

$(BUILD_DIR)/src/libultra/libc/llcvt.o: src/libultra/libc/llcvt.c
ifneq ($(RUN_CC_CHECK),0)
	$(V)$(CC_CHECK) $<
endif
	$(call print,Compiling:,$<,$@)
	$(V)$(CC) -c $(CFLAGS) $(MIPS_VERSION) $(OPTFLAGS) -o $@ $<
	$(V)$(PYTHON) tools/set_o32abi_bit.py $@
	$(V)@$(OBJDUMP) $(OBJDUMP_FLAGS) $@ > $(@:.o=.s)

$(BUILD_DIR)/src/overlays/%_reloc.o: $(BUILD_DIR)/$(SPEC)
	$(call print,Generating Relocation:,$<,$@)
	$(V)$(FADO) $$(tools/reloc_prereq $< $(notdir $*)) -n $(notdir $*) -o $(@:.o=.s) -M $(@:.o=.d)
	$(V)$(AS) $(ASFLAGS) $(@:.o=.s) -o $@

$(BUILD_DIR)/assets/%.inc.c: assets/%.png
	$(ZAPD) btex -eh -tt $(subst .,,$(suffix $*)) -i $< -o $@

$(BUILD_DIR)/assets/%.inc.c: $(EXTRACTED_DIR)/assets/%.png
	$(V)$(ZAPD) btex -eh -tt $(subst .,,$(suffix $*)) -i $< -o $@

$(BUILD_DIR)/assets/%.bin.inc.c: assets/%.bin
	$(ZAPD) bblb -eh -i $< -o $@

$(BUILD_DIR)/assets/%.bin.inc.c: $(EXTRACTED_DIR)/assets/%.bin
	$(V)$(ZAPD) bblb -eh -i $< -o $@

$(BUILD_DIR)/assets/%.jpg.inc.c: assets/%.jpg
	$(ZAPD) bren -eh -i $< -o $@

$(BUILD_DIR)/assets/%.jpg.inc.c: $(EXTRACTED_DIR)/assets/%.jpg
	$(V)$(ZAPD) bren -eh -i $< -o $@

F3DEX3/f3dzex2.code:
	$(V)$(PYTHON) tools/data_extractor.py --start 0xBCD0F0 --size 0x1630 --input $(BASEROM_DIR)/baserom-decompressed.z64 --output $@

F3DEX3/f3dzex2.data:
	$(V)$(PYTHON) tools/data_extractor.py --start 0xBCE720 --size 0x420 --input $(BASEROM_DIR)/baserom-decompressed.z64 --output $@

F3DEX3/F3DEX3%.code: F3DEX3/F3DEX3%.code.bps F3DEX3/f3dzex2.code
	$(V)$(FLIPS) --apply F3DEX3/F3DEX3$*.code.bps F3DEX3/f3dzex2.code $@
	
F3DEX3/F3DEX3%.data: F3DEX3/F3DEX3%.data.bps F3DEX3/f3dzex2.data
	$(V)$(FLIPS) --apply F3DEX3/F3DEX3$*.data.bps F3DEX3/f3dzex2.data $@

.PRECIOUS: $(UCODE_FILES)

# Audio

AUDIO_BUILD_DEBUG ?= 0

# first build samples...

.PRECIOUS: $(BUILD_DIR)/assets/audio/samples/%.aifc
.PRECIOUS: $(BUILD_DIR)/assets/audio/samples/%.half.aifc

$(BUILD_DIR)/assets/audio/samples/%.half.aifc: assets/audio/samples/%.half.wav
	$(call print,Building Sample:,$<,$@)
	$(V)$(SAMPLECONV) vadpcm-half $< $@

$(BUILD_DIR)/assets/audio/samples/%.half.aifc: $(EXTRACTED_DIR)/assets/audio/samples/%.half.wav
	$(call print,Building Sample:,$<,$@)
	$(V)$(SAMPLECONV) vadpcm-half $< $@
ifeq ($(AUDIO_BUILD_DEBUG),1)
	@(cmp $(<D)/aifc/$(<F:.half.wav=.half.aifc) $@ && echo "$(<F) OK") || (mkdir -p NONMATCHINGS/$(<D) && cp $(<D)/aifc/$(<F:.half.wav=.half.aifc) NONMATCHINGS/$(<D)/$(<F:.half.wav=.half.aifc))
endif

$(BUILD_DIR)/assets/audio/samples/%.aifc: assets/audio/samples/%.wav
	$(call print,Building Sample:,$<,$@)
	$(V)$(SAMPLECONV) vadpcm $< $@

$(BUILD_DIR)/assets/audio/samples/%.aifc: $(EXTRACTED_DIR)/assets/audio/samples/%.wav
	$(call print,Building Sample:,$<,$@)
	$(V)$(SAMPLECONV) vadpcm $< $@
ifeq ($(AUDIO_BUILD_DEBUG),1)
	@(cmp $(<D)/aifc/$(<F:.wav=.aifc) $@ && echo "$(<F) OK") || (mkdir -p NONMATCHINGS/$(<D) && cp $(<D)/aifc/$(<F:.wav=.aifc) NONMATCHINGS/$(<D)/$(<F:.wav=.aifc))
endif

# then assemble the samplebanks...

.PRECIOUS: $(BUILD_DIR)/assets/audio/samplebanks/%.xml

$(BUILD_DIR)/assets/audio/samplebanks/%.xml: assets/audio/samplebanks/%.xml
	$(V)cat $< | $(BUILD_DIR_REPLACE) > $@

$(BUILD_DIR)/assets/audio/samplebanks/%.xml: $(EXTRACTED_DIR)/assets/audio/samplebanks/%.xml
	$(V)cat $< | $(BUILD_DIR_REPLACE) > $@

.PRECIOUS: $(BUILD_DIR)/assets/audio/samplebanks/%.s
$(BUILD_DIR)/assets/audio/samplebanks/%.s: $(BUILD_DIR)/assets/audio/samplebanks/%.xml | $(AIFC_FILES)
	$(V)$(SBC) $(SBCFLAGS) --makedepend $(@:.s=.d) $< $@

-include $(SAMPLEBANK_DEP_FILES)

$(BUILD_DIR)/assets/audio/samplebanks/%.o: $(BUILD_DIR)/assets/audio/samplebanks/%.s
	$(call print,Assembling Samplebank:,$<,$@)
	$(V)$(AS) $(ASFLAGS) $< -o $@
ifeq ($(AUDIO_BUILD_DEBUG),1)
	$(OBJCOPY) -O binary --only-section .rodata $@ $(@:.o=.bin)
	@cmp $(@:.o=.bin) $(patsubst $(BUILD_DIR)/assets/audio/samplebanks/%,$(EXTRACTED_DIR)/baserom_audiotest/audiotable_files/%,$(@:.o=.bin)) && echo "$(<F) OK"
endif

# put together the tables

$(BUILD_DIR)/assets/audio/samplebank_table.h: $(SAMPLEBANK_BUILD_XMLS)
	$(V)$(ATBLGEN) --banks $@ $^

# build the tables into objects, move data -> rodata

$(BUILD_DIR)/src/audio/tables/samplebank_table.o: src/audio/tables/samplebank_table.c $(BUILD_DIR)/assets/audio/samplebank_table.h
ifneq ($(RUN_CC_CHECK),0)
	$(V)$(CC_CHECK) $<
endif
	$(V)$(CC) -c $(CFLAGS) $(MIPS_VERSION) $(OPTFLAGS) -o $(@:.o=.tmp) $<
	$(V)$(LD) -r -T linker_scripts/audio_table_rodata.ld $(@:.o=.tmp) -o $@
	@$(RM) $(@:.o=.tmp)

-include $(DEP_FILES)

# Print target for debugging
print-% : ; $(info $* is a $(flavor $*) variable set to [$($*)]) @true
