MAKEFLAGS += --no-builtin-rules --no-print-directory

# Ensure the build fails if a piped command fails
SHELL = /bin/bash
.SHELLFLAGS = -o pipefail -c

#### Build options ####

# Build options can be changed by modifying them below, or by appending 'SETTING=value' to all 'make' commands
# (e.g. 'make setup VERSION=ntsc-1.0' and 'make VERSION=ntsc-1.0' to build the NTSC 1.0 version).
# Alternatively, you can create a file called .make_options.mk (gitignored by default) and add 'SETTING=value'
# there to avoid modifying the Makefile directly.

-include .make_options.mk

# HackerOoT options
-include .make_hackeroot.mk

COMPILER ?= gcc

# Target game version. Ensure the corresponding input ROM is placed in baseroms/$(VERSION)/baserom.z64.
# Currently the following versions are supported:
#   ntsc-1.0       N64 NTSC 1.0 (Japan/US depending on REGION)
#   ntsc-1.1       N64 NTSC 1.1 (Japan/US depending on REGION)
#   pal-1.0        N64 PAL 1.0 (Europe)
#   ntsc-1.2       N64 NTSC 1.2 (Japan/US depending on REGION)
#   pal-1.1        N64 PAL 1.1 (Europe)
#   gc-jp          GameCube Japan
#   gc-jp-mq       GameCube Japan Master Quest
#   gc-us          GameCube US
#   gc-us-mq       GameCube US Master Quest
#   gc-eu-mq-dbg   GameCube Europe/PAL Master Quest Debug (default)
#   gc-eu          GameCube Europe/PAL
#   gc-eu-mq       GameCube Europe/PAL Master Quest
#   gc-jp-ce       GameCube Japan (Collector's Edition disc)
#   hackeroot-mq   HackerOoT, based on gc-eu-mq-dbg (default)
#
# Note: choosing hackeroot-mq will enable HackerOoT features,
#       if another version is chosen, this repo will be like
#       zeldaret/main decomp but without the disassembly, decompilation
#       and matching tools, including the IDO compiler
VERSION ?= hackeroot-mq
# Number of threads to extract and compress with.
N_THREADS ?= $(shell nproc)
# Check code syntax with host compiler.
RUN_CC_CHECK ?= 1
# If DEBUG_OBJECTS is 1, produce additional debugging files such as objdump output or raw binaries for assets
DEBUG_OBJECTS ?= 0
# Set prefix to mips binutils binaries (mips-linux-gnu-ld => 'mips-linux-gnu-') - Change at your own risk!
# In nearly all cases, not having 'mips-linux-gnu-*' binaries on the PATH indicates missing dependencies.
MIPS_BINUTILS_PREFIX ?= mips-linux-gnu-
# Emulator w/ flags for 'make run'.
N64_EMULATOR ?=
# Set to override game region in the ROM header (options: JP, US, EU). This can be used to build a fake US version
# of the debug ROM for better emulator compatibility, or to build US versions of NTSC N64 ROMs.
# REGION ?= US
# Set to enable debug features regardless of ROM version.
# Note that by enabling debug features on non-debug ROM versions, some debug ROM specific assets will not be included.
# This means the debug test scenes and some debug graphics in the elf_msg actors will not work as expected.
# This may also be used to disable debug features on debug ROMs by setting DEBUG_FEATURES to 0
# DEBUG_FEATURES ?= 1

CFLAGS ?=
CPPFLAGS ?=
CFLAGS_IDO ?=
CPP_DEFINES ?=

# Version-specific settings
REGIONAL_CHECKSUM := 0
ifeq ($(VERSION),ntsc-1.0)
  REGIONAL_CHECKSUM := 1
  REGION ?= JP
  PLATFORM := N64
  DEBUG_FEATURES ?= 0
  BUILD_CREATOR := zelda@srd44
  BUILD_DATE := 98-10-21
  BUILD_TIME := 04:56:31
  REVISION := 0
else ifeq ($(VERSION),ntsc-1.1)
  REGIONAL_CHECKSUM := 1
  REGION ?= JP
  PLATFORM := N64
  DEBUG_FEATURES ?= 0
  BUILD_CREATOR := zelda@srd44
  BUILD_DATE := 98-10-26
  BUILD_TIME := 10:58:45
  REVISION := 1
else ifeq ($(VERSION),pal-1.0)
  REGION ?= EU
  PLATFORM := N64
  DEBUG_FEATURES ?= 0
  BUILD_CREATOR := zelda@srd44
  BUILD_DATE := 98-11-10
  BUILD_TIME := 14:34:22
  REVISION := 0
else ifeq ($(VERSION),ntsc-1.2)
  REGIONAL_CHECKSUM := 1
  REGION ?= JP
  PLATFORM := N64
  DEBUG_FEATURES ?= 0
  BUILD_CREATOR := zelda@srd44
  BUILD_DATE := 98-11-12
  BUILD_TIME := 18:17:03
  REVISION := 2
else ifeq ($(VERSION),pal-1.1)
  REGION ?= EU
  PLATFORM := N64
  DEBUG_FEATURES ?= 0
  BUILD_CREATOR := zelda@srd44
  BUILD_DATE := 98-11-18
  BUILD_TIME := 17:36:49
  REVISION := 1
else ifeq ($(VERSION),gc-jp)
  REGION ?= JP
  PLATFORM := GC
  DEBUG_FEATURES ?= 0
  BUILD_CREATOR := zelda@srd022j
  BUILD_DATE := 02-10-29
  BUILD_TIME := 23:49:53
  REVISION := 15
else ifeq ($(VERSION),gc-jp-mq)
  REGION ?= JP
  PLATFORM := GC
  DEBUG_FEATURES ?= 0
  BUILD_CREATOR := zelda@srd022j
  BUILD_DATE := 02-10-30
  BUILD_TIME := 00:15:15
  REVISION := 15
else ifeq ($(VERSION),gc-us)
  REGION ?= US
  PLATFORM := GC
  DEBUG_FEATURES ?= 0
  BUILD_CREATOR := zelda@srd022j
  BUILD_DATE := 02-12-19
  BUILD_TIME := 13:28:09
  REVISION := 15
else ifeq ($(VERSION),gc-us-mq)
  REGION ?= US
  PLATFORM := GC
  DEBUG_FEATURES ?= 0
  BUILD_CREATOR := zelda@srd022j
  BUILD_DATE := 02-12-19
  BUILD_TIME := 14:05:42
  REVISION := 15
else ifeq ($(VERSION),gc-eu-mq-dbg)
  REGION ?= EU
  PLATFORM := GC
  DEBUG_FEATURES ?= 1
  BUILD_CREATOR := zelda@srd022j
  BUILD_DATE := 03-02-21
  BUILD_TIME := 00:16:31
  REVISION := 15
else ifeq ($(VERSION),gc-eu)
  REGION ?= EU
  PLATFORM := GC
  DEBUG_FEATURES ?= 0
  BUILD_CREATOR := zelda@srd022j
  BUILD_DATE := 03-02-21
  BUILD_TIME := 20:12:23
  REVISION := 15
else ifeq ($(VERSION),gc-eu-mq)
  REGION ?= EU
  PLATFORM := GC
  DEBUG_FEATURES ?= 0
  BUILD_CREATOR := zelda@srd022j
  BUILD_DATE := 03-02-21
  BUILD_TIME := 20:37:19
  REVISION := 15
else ifeq ($(VERSION),gc-jp-ce)
  REGION ?= JP
  PLATFORM := GC
  DEBUG := 0
  DEBUG_FEATURES ?= 0
  BUILD_CREATOR := zelda@srd022j
  BUILD_DATE := 03-10-08
  BUILD_TIME := 21:53:00
  REVISION := 15
else ifeq ($(VERSION),ique-cn)
  COMPARE := 0
  REGION ?= US
  PLATFORM := IQUE
  DEBUG_FEATURES ?= 0
  BUILD_CREATOR := build@toad.routefree.com
  BUILD_DATE := 03-10-22
  BUILD_TIME := 16:23:19
  REVISION := 0
else ifeq ($(VERSION),hackeroot-mq)
  REGION := NULL
  PLATFORM := GC
  DEBUG := 1
  DEBUG_FEATURES ?= 1
  BUILD_CREATOR := none
  BUILD_DATE := none
  BUILD_TIME := none
ifeq ($(TARGET),iso)
  REVISION := 0
else ifeq ($(TARGET),wad)
  REVISION := 0
else
  REVISION := 15
endif
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

ifeq ($(PLATFORM),N64)
  CPP_DEFINES += -DPLATFORM_N64=1 -DPLATFORM_GC=0 -DPLATFORM_IQUE=0
  LIBULTRA_VERSION := I
  LIBULTRA_PATCH := 1
else ifeq ($(PLATFORM),GC)
  CPP_DEFINES += -DPLATFORM_N64=0 -DPLATFORM_GC=1 -DPLATFORM_IQUE=0
  LIBULTRA_VERSION := L
  LIBULTRA_PATCH := 0
else ifeq ($(PLATFORM),IQUE)
  CPP_DEFINES += -DPLATFORM_N64=0 -DPLATFORM_GC=0 -DPLATFORM_IQUE=1 -DBBPLAYER
  LIBULTRA_VERSION := L
  LIBULTRA_PATCH := 0
else
$(error Unsupported platform $(PLATFORM))
endif

# Set PACKAGE_NAME define for printing commit name
ifeq ($(origin PACKAGE_NAME), undefined)
  PACKAGE_NAME := "$(shell git log -1 --pretty=%s | tr -d '()`"\n' | tr -d "'" | sed 's/\"/\\\"/g')"
  ifeq ($(PACKAGE_NAME),"")
    PACKAGE_NAME := "Unknown name"
  endif
endif

# Set PACKAGE_COMMIT_AUTHOR for printing commit author
ifeq ($(origin PACKAGE_COMMIT_AUTHOR), undefined)
  PACKAGE_COMMIT_AUTHOR := "$(shell git log -1 --pretty=format:'%an' | tr -d '\n' | sed 's/\"/\\\"/g')"
  ifeq ($(PACKAGE_COMMIT_AUTHOR),"")
    PACKAGE_COMMIT_AUTHOR := "Unknown author"
  endif
endif

# Set PACKAGE_AUTHOR define for printing author's git name
ifeq ($(origin PACKAGE_AUTHOR), undefined)
  PACKAGE_AUTHOR := "$(shell git config --get user.name | tr -d '\n' | sed 's/\"/\\\"/g')"
  ifeq ($(PACKAGE_AUTHOR),"")
    PACKAGE_AUTHOR := "Unknown author"
  endif
endif

# Set PACKAGE_VERSION define for printing commit hash
ifeq ($(origin PACKAGE_VERSION), undefined)
  PACKAGE_VERSION := "$(shell git log -1 --pretty=%h | tr -d '\n' | sed 's/\"/\\\"/g')"
  ifeq ($(PACKAGE_VERSION),"")
    PACKAGE_VERSION := "Unknown version"
  endif
endif

# Converts e.g. ntsc-1.0 to NTSC_1_0
ifeq ($(VERSION),hackeroot-mq)
CPP_DEFINES += -DOOT_VERSION=GC_EU_MQ_DBG -DOOT_REVISION=$(REVISION)
else
VERSION_MACRO := $(shell echo $(VERSION) | tr a-z-. A-Z__)
CPP_DEFINES += -DOOT_VERSION=$(VERSION_MACRO) -DOOT_REVISION=$(REVISION)
endif
CPP_DEFINES += -DOOT_REGION=REGION_$(REGION)
CPP_DEFINES += -DBUILD_CREATOR="\"$(BUILD_CREATOR)\"" -DBUILD_DATE="\"$(BUILD_DATE)\"" -DBUILD_TIME="\"$(BUILD_TIME)\""
CPP_DEFINES += -DLIBULTRA_VERSION=LIBULTRA_VERSION_$(LIBULTRA_VERSION)
CPP_DEFINES += -DLIBULTRA_PATCH=$(LIBULTRA_PATCH)
ifeq ($(PLATFORM),IQUE)
  CPP_DEFINES += -DBBPLAYER
endif

ifeq ($(VERSION),hackeroot-mq)
  CPP_DEFINES += -DENABLE_HACKEROOT=1
  OPTFLAGS := -Os

  ifeq ($(RELEASE),1)
    CPP_DEFINES += -DRELEASE_ROM=1 -DDEBUG_FEATURES=0 -DNDEBUG
    CFLAGS_IDO += -DDEBUG_FEATURES=0
  else
    CPP_DEFINES += -DRELEASE_ROM=0 -DDEBUG_FEATURES=1
  endif
else
  ifeq ($(DEBUG_FEATURES),1)
    CPP_DEFINES += -DDEBUG_FEATURES=1
    OPTFLAGS := -O2
  else
    CPP_DEFINES += -DDEBUG_FEATURES=0 -DNDEBUG
    OPTFLAGS := -O2 -g3
  endif

  CPP_DEFINES += -DENABLE_HACKEROOT=0
endif
ASOPTFLAGS := -O1


# Override optimization flags if using GDB
ifeq ($(ARES_GDB),1)
  OPTFLAGS := -Og -ggdb3
endif

# Define author and package version for every OoT version
# Note: this won't be used if not using HackerOoT
CPP_DEFINES += -DCOMPRESS_$(COMPRESSION_TYPE)=1 -DPACKAGE_VERSION='$(PACKAGE_VERSION)' -DPACKAGE_NAME='$(PACKAGE_NAME)' -DPACKAGE_COMMIT_AUTHOR='$(PACKAGE_COMMIT_AUTHOR)' -DPACKAGE_AUTHOR='$(PACKAGE_AUTHOR)'
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

#### Tools ####
ifneq ($(shell type $(MIPS_BINUTILS_PREFIX)ld >/dev/null 2>/dev/null; echo $$?), 0)
  $(error Unable to find $(MIPS_BINUTILS_PREFIX)ld. Please install or build MIPS binutils, commonly mips-linux-gnu. (or set MIPS_BINUTILS_PREFIX if your MIPS binutils install uses another prefix))
endif

# Detect compiler and set variables appropriately.
ifeq ($(COMPILER),gcc)
  CC       := $(MIPS_BINUTILS_PREFIX)gcc
  CCAS     := $(CC) -x assembler-with-cpp
else
$(error Unsupported compiler. Please use gcc as the COMPILER variable.)
endif

# EGCS Compiler
EGCS_PREFIX := tools/egcs/$(DETECTED_OS)/
EGCS_CC := $(EGCS_PREFIX)gcc -B $(EGCS_PREFIX)
EGCS_CCAS := $(EGCS_CC) -x assembler-with-cpp

AS      := $(MIPS_BINUTILS_PREFIX)as
LD      := $(MIPS_BINUTILS_PREFIX)ld
OBJCOPY := $(MIPS_BINUTILS_PREFIX)objcopy
OBJDUMP := $(MIPS_BINUTILS_PREFIX)objdump
NM      := $(MIPS_BINUTILS_PREFIX)nm
STRIP   := $(MIPS_BINUTILS_PREFIX)strip

# Command to patch certain object files after they are built
POSTPROCESS_OBJ := @:

# The default iconv on macOS has some differences from GNU iconv, so we use the Homebrew version instead
ifeq ($(UNAME_S),Darwin)
  ICONV := $(shell brew --prefix)/opt/libiconv/bin/iconv
else
  ICONV := iconv
endif

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
CC_IDO     := tools/ido_recomp/$(DETECTED_OS)/5.3/cc

# Command to replace $(BUILD_DIR) in some files with the build path.
# We can't use the C preprocessor for this because it won't substitute inside string literals.
BUILD_DIR_REPLACE := sed -e 's|$$(BUILD_DIR)|$(BUILD_DIR)|g'

# Audio tools
SAMPLECONV    := tools/audio/sampleconv/sampleconv
SBC           := tools/audio/sbc
SFC           := tools/audio/sfc
SFPATCH       := tools/audio/sfpatch
ATBLGEN       := tools/audio/atblgen
AFILE_SIZES   := tools/audio/afile_sizes
# We want linemarkers in sequence assembly files for better assembler error messages
SEQ_CPP       := $(CPP) -x assembler-with-cpp -fno-dollars-in-identifiers
SEQ_CPPFLAGS  := -D_LANGUAGE_ASEQ -DMML_VERSION=MML_VERSION_OOT $(CPP_DEFINES) -I include -I include/audio -I include/tables/sfx -I $(BUILD_DIR)/assets/audio/soundfonts

SBCFLAGS := --matching
SFCFLAGS := --matching

CFLAGS += $(CPP_DEFINES)
CPPFLAGS += $(CPP_DEFINES)
CFLAGS_IDO += $(CPP_DEFINES)

# Extra debugging steps
ifeq ($(DEBUG_OBJECTS),1)
  OBJDUMP_CMD = @$(OBJDUMP) $(OBJDUMP_FLAGS) $@ > $(@:.o=.s)
  OBJCOPY_CMD = @$(OBJCOPY) -O binary $@ $(@:.o=.bin)
else
  OBJDUMP_CMD = @:
  OBJCOPY_CMD = @:
endif

GBI_DEFINES := -DF3DEX_GBI_2
ifneq ($(PLATFORM),N64)
  GBI_DEFINES += -DF3DEX_GBI_PL -DGBI_DOWHILE
endif
ifeq ($(DEBUG_FEATURES),1)
  GBI_DEFINES += -DGBI_DEBUG
endif

CPPFLAGS += -P -xc -fno-dollars-in-identifiers $(CPP_DEFINES)
ASFLAGS += -march=vr4300 -32 -no-pad-sections -Iinclude -I$(EXTRACTED_DIR)

ifeq ($(COMPILER),gcc)
  CFLAGS += $(CPP_DEFINES) $(GBI_DEFINES) -G 0 -nostdinc $(INC) -march=vr4300 -mfix4300 -mabi=32 -mno-abicalls -mdivide-breaks -fno-PIC -fno-common -ffreestanding -funsigned-char -fbuiltin -fno-builtin-sinf -fno-builtin-cosf $(CHECK_WARNINGS)
  CCASFLAGS += $(CPP_DEFINES) $(GBI_DEFINES) -G 0 -nostdinc $(INC) -march=vr4300 -mfix4300 -mabi=32 -mno-abicalls -fno-PIC -fno-common -Wa,-no-pad-sections
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
  SOUNDFONT_EXTRACT_DIRS := $(shell find $(EXTRACTED_DIR)/assets/audio/soundfonts -type d)
  SEQUENCE_EXTRACT_DIRS := $(shell find $(EXTRACTED_DIR)/assets/audio/sequences -type d)
else
  SAMPLE_EXTRACT_DIRS :=
  SAMPLEBANK_EXTRACT_DIRS :=
  SOUNDFONT_EXTRACT_DIRS :=
  SEQUENCE_EXTRACT_DIRS :=
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

ifneq ($(wildcard assets/audio/soundfonts),)
  SOUNDFONT_DIRS := $(shell find assets/audio/soundfonts -type d)
else
  SOUNDFONT_DIRS :=
endif

ifneq ($(wildcard assets/audio/sequences),)
  SEQUENCE_DIRS := $(shell find assets/audio/sequences -type d)
else
  SEQUENCE_DIRS :=
endif

SAMPLE_FILES         := $(foreach dir,$(SAMPLE_DIRS),$(wildcard $(dir)/*.wav))
SAMPLE_EXTRACT_FILES := $(foreach dir,$(SAMPLE_EXTRACT_DIRS),$(wildcard $(dir)/*.wav))
AIFC_FILES           := $(foreach f,$(SAMPLE_FILES),$(BUILD_DIR)/$(f:.wav=.aifc)) $(foreach f,$(SAMPLE_EXTRACT_FILES:.wav=.aifc),$(f:$(EXTRACTED_DIR)/%=$(BUILD_DIR)/%))

SAMPLEBANK_XMLS         := $(foreach dir,$(SAMPLEBANK_DIRS),$(wildcard $(dir)/*.xml))
SAMPLEBANK_EXTRACT_XMLS := $(foreach dir,$(SAMPLEBANK_EXTRACT_DIRS),$(wildcard $(dir)/*.xml))
SAMPLEBANK_BUILD_XMLS   := $(foreach f,$(SAMPLEBANK_XMLS),$(BUILD_DIR)/$f) $(foreach f,$(SAMPLEBANK_EXTRACT_XMLS),$(f:$(EXTRACTED_DIR)/%=$(BUILD_DIR)/%))
SAMPLEBANK_O_FILES      := $(foreach f,$(SAMPLEBANK_BUILD_XMLS),$(f:.xml=.o))
SAMPLEBANK_DEP_FILES    := $(foreach f,$(SAMPLEBANK_O_FILES),$(f:.o=.d))

SOUNDFONT_XMLS         := $(foreach dir,$(SOUNDFONT_DIRS),$(wildcard $(dir)/*.xml))
SOUNDFONT_EXTRACT_XMLS := $(foreach dir,$(SOUNDFONT_EXTRACT_DIRS),$(wildcard $(dir)/*.xml))
SOUNDFONT_BUILD_XMLS   := $(foreach f,$(SOUNDFONT_XMLS),$(BUILD_DIR)/$f) $(foreach f,$(SOUNDFONT_EXTRACT_XMLS),$(f:$(EXTRACTED_DIR)/%=$(BUILD_DIR)/%))
SOUNDFONT_O_FILES      := $(foreach f,$(SOUNDFONT_BUILD_XMLS),$(f:.xml=.o))
SOUNDFONT_HEADERS      := $(foreach f,$(SOUNDFONT_BUILD_XMLS),$(f:.xml=.h))
SOUNDFONT_DEP_FILES    := $(foreach f,$(SOUNDFONT_O_FILES),$(f:.o=.d))

SEQUENCE_FILES         := $(foreach dir,$(SEQUENCE_DIRS),$(wildcard $(dir)/*.seq))
SEQUENCE_EXTRACT_FILES := $(foreach dir,$(SEQUENCE_EXTRACT_DIRS),$(wildcard $(dir)/*.seq))
SEQUENCE_O_FILES       := $(foreach f,$(SEQUENCE_FILES),$(BUILD_DIR)/$(f:.seq=.o)) $(foreach f,$(SEQUENCE_EXTRACT_FILES:.seq=.o),$(f:$(EXTRACTED_DIR)/%=$(BUILD_DIR)/%))
SEQUENCE_DEP_FILES     := $(foreach f,$(SEQUENCE_O_FILES),$(f:.o=.d))

SEQUENCE_TABLE := include/tables/sequence_table.h

# create extracted directory
$(shell mkdir -p $(EXTRACTED_DIR))

ifneq ($(wildcard $(EXTRACTED_DIR)/assets),)
  ASSET_BIN_DIRS_EXTRACTED := $(shell find $(EXTRACTED_DIR)/assets -type d)
else
  ASSET_BIN_DIRS_EXTRACTED :=
endif
ASSET_BIN_DIRS_COMMITTED := $(shell find assets -type d -not -path "assets/xml*" -not -path "assets/audio*" -not -path assets/text)
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
                 $(foreach f,$(BASEROM_BIN_FILES),$(BUILD_DIR)/baserom/$(notdir $f).o) \
                 $(BUILD_DIR)/src/code/z_message_z_game_over.o \
                 $(BUILD_DIR)/src/makerom/ipl3.o

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
                 $(BUILD_DIR)/assets/text \
                 $(BUILD_DIR)/linker_scripts)
$(shell mkdir -p $(foreach dir, \
                      $(SRC_DIRS) \
                      $(UNDECOMPILED_DATA_DIRS) \
                      $(SAMPLE_DIRS) \
                      $(SAMPLEBANK_DIRS) \
                      $(SOUNDFONT_DIRS) \
                      $(SEQUENCE_DIRS) \
                      $(ASSET_BIN_DIRS_COMMITTED), \
                    $(BUILD_DIR)/$(dir)))
ifneq ($(wildcard $(EXTRACTED_DIR)/assets),)
$(shell mkdir -p $(foreach dir, \
                      $(SAMPLE_EXTRACT_DIRS) \
                      $(SAMPLEBANK_EXTRACT_DIRS) \
                      $(SOUNDFONT_EXTRACT_DIRS) \
                      $(SEQUENCE_EXTRACT_DIRS) \
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
	$(call print_no_args,Building the rom...)
	$(V)python3 tools/mod_assets.py --oot-version $(VERSION)
	$(V)$(MAKE) $(ROM)

compress:
	$(call print_no_args,Compressing the rom...)
# make sure z_std_dma.c and spec are up-to-date
	$(V)$(shell touch spec)
	$(V)$(shell touch src/boot/z_std_dma.c)
	$(V)$(MAKE) $(ROMC)
	$(call print_no_args,Success!)

wad:
	$(call print_no_args,Patching WAD...)
ifeq ("$(wildcard baseroms/$(VERSION)/common-key.bin)", "")
	$(error Please provide the common-key.bin file.)
endif
	$(V)$(MAKE) compress TARGET=wad
	$(V)$(GZINJECT) -a inject -r 1 -k baseroms/$(VERSION)/common-key.bin -w baseroms/$(VERSION)/basewad.wad -m $(ROMC) -o $(WAD) -t "HackerOoT" -i NHOE -p tools/gzinject/patches/NACE.gzi -p tools/gzinject/patches/gz_default_remap.gzi
	$(V)$(RM) -r wadextract/
	$(call print_no_args,Success!)

iso:
	$(V)$(MAKE) compress TARGET=iso
	$(call print_no_args,Patching ISO...)
	$(V)$(PYTHON) tools/gc_utility.py -v $(VERSION) -c $(COMPRESSION)
	$(V)$(GZINJECT) -a extract -s baseroms/$(VERSION)/baseiso.iso
	$(V)cp $(BUILD_DIR)/$(DMA_CONFIG_FILE) isoextract/zlj_f.tgc/$(DMA_CONFIG_FILE)
	$(V)cp $(ROMC) isoextract/zlj_f.tgc/zlj_f.n64
	$(V)$(RM) -r isoextract/S_*.tgc/ isoextract/zlj_f.tgc/*.thp
	$(V)$(FLIPS) --apply tools/gamecube.bps isoextract/zlj_f.tgc/main.dol isoextract/zlj_f.tgc/main.dol
	$(V)$(GZINJECT) -a pack -s $(ISO)
	$(V)$(RM) -r isoextract/
	$(call print_no_args,Success!)

clean:
	$(V)$(RM) -r $(BUILD_DIR)
	$(call print_no_args,Success!)

assetclean:
	$(V)$(RM) -r $(EXTRACTED_DIR)
	$(call print_no_args,Success!)

distclean:
	$(V)$(RM) -r extracted/
	$(V)$(RM) -r build/
	$(V)$(MAKE) -C tools distclean
	$(V)$(RM) -r F3DEX3/*.code F3DEX3/*.data
	$(call print_no_args,Success!)

venv:
# Create the virtual environment if it doesn't exist.
# Delete the virtual environment directory if creation fails.
	$(call print_no_args,Preparing the virtual environment...)
	$(V)test -d $(VENV) || python3 -m venv $(VENV) || { rm -rf $(VENV); false; }
	$(V)$(PYTHON) -m pip install -U pip
	$(V)$(PYTHON) -m pip install -U -r requirements.txt
	$(call print_no_args,Success!)

setup: venv
	$(call print_no_args,Setup in progress...)
	$(V)$(MAKE) -C tools
	$(call print_no_args,Tools: Done!)
	$(V)$(PYTHON) tools/decompress_baserom.py $(VERSION)
	$(call print_no_args,Decompressing baserom: Done!)
	$(V)$(PYTHON) tools/extract_baserom.py $(BASEROM_DIR)/baserom-decompressed.z64 $(EXTRACTED_DIR)/baserom -v $(VERSION)
	$(V)$(PYTHON) tools/extract_incbins.py $(EXTRACTED_DIR)/baserom $(EXTRACTED_DIR)/incbin -v $(VERSION)
	$(V)$(PYTHON) tools/extract_text.py $(EXTRACTED_DIR)/baserom $(EXTRACTED_DIR)/text -v $(VERSION)
	$(V)$(PYTHON) tools/extract_assets.py $(EXTRACTED_DIR)/baserom $(EXTRACTED_DIR)/assets -v $(VERSION) -j$(N_THREADS)
	$(V)$(PYTHON) tools/extract_audio.py -o $(EXTRACTED_DIR) -v $(VERSION) --read-xml
	$(call print_no_args,Extracting files: Done!)

run: rom
ifeq ($(N64_EMULATOR),)
	$(error Emulator path not set. Set N64_EMULATOR in the Makefile or define it as an environment variable)
endif
	$(N64_EMULATOR) $(ROM)

patch:
	$(call print_no_args,Creating BPS patch...)
	$(V)$(FLIPS) --create --bps $(BASEROM_PATCH) $(ROM) $(BPS)
	$(call print_no_args,Success!)

create_f3dex3_patches: F3DEX3/f3dzex2.code F3DEX3/f3dzex2.data
	$(call print_no_args,Creating F3DEX3 patches...)
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
	$(call print_no_args,Success!)

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
	@$(PRINT) "${GREEN}Build Author: $(BLUE)$(PACKAGE_AUTHOR)$(NO_COL)\n"
	@$(PRINT) "${GREEN}Commit Author: $(BLUE)$(PACKAGE_COMMIT_AUTHOR)$(NO_COL)\n"

ifeq ($(PLATFORM),IQUE)
  COMPRESS_ARGS := --format gzip --pad-to 0x4000
  CIC = 6102
else
  COMPRESS_ARGS := --format yaz0 --pad-to 0x800000 --fill-padding-bytes
  CIC = 6105
endif

$(ROMC): $(ROM) $(ELF) $(BUILD_DIR)/compress_ranges.txt
ifeq ($(COMPRESSION),yaz)
	$(V)$(PYTHON) tools/compress.py --in $(ROM) --out $@ --dmadata-start `./tools/dmadata_start.sh $(NM) $(ELF)` --compress `cat $(BUILD_DIR)/compress_ranges.txt` --threads $(N_THREADS) $(COMPRESS_ARGS)
else
	$(V)$(PYTHON) tools/z64compress_wrapper.py --codec $(COMPRESSION) --cache $(BUILD_DIR)/cache --threads $(N_THREADS) $< $@ $(ELF) $(BUILD_DIR)/$(SPEC)
endif
	$(V)$(PYTHON) -m ipl3checksum sum --cic $(CIC) --update $@

$(ELF): $(TEXTURE_FILES_OUT) $(ASSET_FILES_OUT) $(O_FILES) $(OVL_RELOC_FILES) $(UCODE_O_FILES) $(LDSCRIPT) $(BUILD_DIR)/linker_scripts/makerom.ld $(BUILD_DIR)/undefined_syms.txt \
        $(SAMPLEBANK_O_FILES) $(SOUNDFONT_O_FILES) $(SEQUENCE_O_FILES) \
        $(BUILD_DIR)/assets/audio/sequence_font_table.o $(BUILD_DIR)/assets/audio/audiobank_padding.o
	$(call print_one_arg,Linking:,$@)
	$(V)$(LD) -T $(LDSCRIPT) -T $(BUILD_DIR)/linker_scripts/makerom.ld -T $(BUILD_DIR)/undefined_syms.txt --no-check-sections --accept-unknown-input-arch --emit-relocs -Map $(MAP) -o $@

$(BUILD_DIR)/linker_scripts/makerom.ld: linker_scripts/makerom.ld
	$(V)$(CPP) -I include $(CPPFLAGS) $< > $@

## Order-only prerequisites
# These ensure e.g. the O_FILES are built before the OVL_RELOC_FILES.
# The intermediate phony targets avoid quadratically-many dependencies between the targets and prerequisites.

o_files: $(O_FILES)
$(OVL_RELOC_FILES): | o_files

asset_files: $(TEXTURE_FILES_OUT) $(ASSET_FILES_OUT)
$(O_FILES): | asset_files

.PHONY: o_files asset_files

$(BUILD_DIR)/$(SPEC): $(SPEC)
	$(call print_two_args,Preprocessing:,$<,$@)
	$(V)$(CPP) $(CPPFLAGS) $< | $(BUILD_DIR_REPLACE) > $@

$(LDSCRIPT): $(BUILD_DIR)/$(SPEC)
	$(call print_two_args,Creating linker script:,$<,$@)
	$(V)$(MKLDSCRIPT) $< $@

$(BUILD_DIR)/undefined_syms.txt: undefined_syms.txt
	$(call print_two_args,Preprocessing:,$<,$@)
	$(V)$(CPP) $(CPPFLAGS) $< > $@

$(BUILD_DIR)/baserom/%.o: $(EXTRACTED_DIR)/baserom/%
	$(call print_two_args,Wrapping binary to ELF:,$<,$@)
	$(V)$(OBJCOPY) -I binary -O elf32-big $< $@
	
$(BUILD_DIR)/F3DEX3/%.o: F3DEX3/%
	$(call print_two_args,Wrapping binary to ELF:,$<,$@)
	$(V)mkdir -p $(BUILD_DIR)/F3DEX3
	$(V)$(OBJCOPY) -I binary -O elf32-big $< $@

$(BUILD_DIR)/data/%.o: data/%.s
	$(call print_two_args,Assembling:,$<,$@)
	$(V)$(CPP) $(CPPFLAGS) -Iinclude $< | $(AS) $(ASFLAGS) -o $@

ifeq ($(PLATFORM),IQUE)
  NES_CHARMAP := assets/text/charmap.chn.txt
else
  NES_CHARMAP := assets/text/charmap.nes.txt
endif

$(BUILD_DIR)/assets/text/%.enc.nes.h: assets/text/%.h $(EXTRACTED_DIR)/text/%.h $(NES_CHARMAP)
	$(call print_two_args,Encoding:,$<,$@)
	$(V)$(CPP) $(CPPFLAGS) $(INC) $< | $(PYTHON) tools/msgenc.py --encoding utf-8 --charmap $(NES_CHARMAP) - $@

$(BUILD_DIR)/assets/text/%.enc.jpn.h: assets/text/%.h $(EXTRACTED_DIR)/text/%.h assets/text/charmap.jpn.txt
	$(call print_two_args,Encoding:,$<,$@)
	$(V)$(CPP) $(CPPFLAGS) $(INC) $< | $(PYTHON) tools/msgenc.py --encoding SHIFT-JIS --wchar --charmap assets/text/charmap.jpn.txt - $@

# Dependencies for files including message data headers
# TODO remove when full header dependencies are used.
$(BUILD_DIR)/assets/text/jpn_message_data_static.o: $(BUILD_DIR)/assets/text/message_data.enc.jpn.h
$(BUILD_DIR)/assets/text/nes_message_data_static.o: $(BUILD_DIR)/assets/text/message_data.enc.nes.h
$(BUILD_DIR)/assets/text/ger_message_data_static.o: $(BUILD_DIR)/assets/text/message_data.enc.nes.h
$(BUILD_DIR)/assets/text/fra_message_data_static.o: $(BUILD_DIR)/assets/text/message_data.enc.nes.h
$(BUILD_DIR)/assets/text/staff_message_data_static.o: $(BUILD_DIR)/assets/text/message_data_staff.enc.nes.h
$(BUILD_DIR)/src/code/z_message.o: assets/text/message_data.h assets/text/message_data_staff.h

$(BUILD_DIR)/assets/text/%.o: assets/text/%.c
	$(call print_two_args,Compiling:,$<,$@)
	$(V)$(CC) -c $(CFLAGS) $(MIPS_VERSION) $(OPTFLAGS) -o $@ $<
	$(V)$(OBJCOPY) -O binary --only-section .rodata $@ $@.bin

$(BUILD_DIR)/assets/%.o: assets/%.c
	$(call print,Compiling:,$<,$@)
	$(V)$(CC) -c $(CFLAGS) $(MIPS_VERSION) $(OPTFLAGS) -o $@ $<
	$(V)$(OBJCOPY_CMD)

$(BUILD_DIR)/assets/%.o: $(EXTRACTED_DIR)/assets/%.c
	$(call print_two_args,Compiling:,$<,$@)
	$(V)$(CC) -c $(CFLAGS) $(MIPS_VERSION) $(OPTFLAGS) -o $@ $<
	$(V)$(OBJCOPY_CMD)

# Assemble the ROM header with GNU AS always
$(BUILD_DIR)/src/makerom/rom_header.o: src/makerom/rom_header.s
	$(call print,Compiling:,$<,$@)
	$(V)$(CCAS) -c $(CCASFLAGS) $(MIPS_VERSION) $(ASOPTFLAGS) -o $@ $<
	$(V)$(OBJDUMP_CMD)

$(BUILD_DIR)/src/makerom/ipl3.o: $(EXTRACTED_DIR)/incbin/ipl3
	$(call print,Compiling:,$<,$@)
	$(V)$(OBJCOPY) -I binary -O elf32-big --rename-section .data=.text $< $@

$(BUILD_DIR)/src/%.o: src/%.s
	$(call print_two_args,Compiling:,$<,$@)
	$(V)$(CCAS) -c $(CCASFLAGS) $(MIPS_VERSION) $(ASOPTFLAGS) -o $@ $<
	$(V)$(POSTPROCESS_OBJ) $@
	$(V)$(OBJDUMP_CMD)

# Incremental link to move z_message and z_game_over data into rodata
$(BUILD_DIR)/src/code/z_message_z_game_over.o: $(BUILD_DIR)/src/code/z_message.o $(BUILD_DIR)/src/code/z_game_over.o
	$(V)$(LD) -r -T linker_scripts/data_with_rodata.ld -o $@ $^

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
$(BUILD_DIR)/src/audio/general.o: $(SEQUENCE_TABLE) include/tables/sfx/*.h
$(BUILD_DIR)/src/audio/sfx_params.o: include/tables/sfx/*.h

$(BUILD_DIR)/src/%.o: src/%.c
ifneq ($(RUN_CC_CHECK),0)
	$(V)$(CC_CHECK) $<
endif
	$(call print_two_args,Compiling:,$<,$@)
	$(V)$(CC) -c $(CFLAGS) $(MIPS_VERSION) $(OPTFLAGS) -o $@ $<
	$(V)$(POSTPROCESS_OBJ) $@
	$(V)$(OBJDUMP_CMD)

$(BUILD_DIR)/src/audio/session_init.o: src/audio/session_init.c $(BUILD_DIR)/assets/audio/soundfont_sizes.h $(BUILD_DIR)/assets/audio/sequence_sizes.h
ifneq ($(RUN_CC_CHECK),0)
	$(V)$(CC_CHECK) $<
endif
	$(call print_two_args,Compiling:,$<,$@)
	$(V)$(CC) -c $(CFLAGS) $(MIPS_VERSION) $(OPTFLAGS) -o $(@:.o=.tmp) $<
	$(V)$(LD) -r -T linker_scripts/data_with_rodata.ld -o $@ $(@:.o=.tmp)
	$(V)$(OBJDUMP) $(OBJDUMP_FLAGS) $@ > $(@:.o=.s)

$(BUILD_DIR)/src/overlays/%_reloc.o: $(BUILD_DIR)/$(SPEC)
	$(call print_two_args,Generating Relocation:,$<,$@)
	$(V)$(FADO) $$(tools/reloc_prereq $< $(notdir $*)) -n $(notdir $*) -o $(@:.o=.s) -M $(@:.o=.d)
	$(V)$(AS) $(ASFLAGS) $(@:.o=.s) -o $@

$(BUILD_DIR)/assets/%.inc.c: assets/%.png
	$(V)$(ZAPD) btex -eh -tt $(subst .,,$(suffix $*)) -i $< -o $@

$(BUILD_DIR)/assets/%.inc.c: $(EXTRACTED_DIR)/assets/%.png
	$(V)$(ZAPD) btex -eh -tt $(subst .,,$(suffix $*)) -i $< -o $@

$(BUILD_DIR)/assets/%.bin.inc.c: assets/%.bin
	$(V)$(ZAPD) bblb -eh -i $< -o $@

$(BUILD_DIR)/assets/%.bin.inc.c: $(EXTRACTED_DIR)/assets/%.bin
	$(V)$(ZAPD) bblb -eh -i $< -o $@

$(BUILD_DIR)/assets/%.jpg.inc.c: assets/%.jpg
	$(V)$(ZAPD) bren -eh -i $< -o $@

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
ifeq ($(AUDIO_BUILD_DEBUG),1)
  # for debugging only, make soundfonts depend on samplebanks so they can be linked against
  $(BUILD_DIR)/assets/audio/soundfonts/%.o: $(SAMPLEBANK_O_FILES)
endif

# first build samples...

.PRECIOUS: $(BUILD_DIR)/assets/audio/samples/%.aifc
.PRECIOUS: $(BUILD_DIR)/assets/audio/samples/%.half.aifc

$(BUILD_DIR)/assets/audio/samples/%.half.aifc: assets/audio/samples/%.half.wav
	$(call print_two_args,Building Sample:,$<,$@)
	$(V)$(SAMPLECONV) vadpcm-half $< $@

$(BUILD_DIR)/assets/audio/samples/%.half.aifc: $(EXTRACTED_DIR)/assets/audio/samples/%.half.wav
	$(call print_two_args,Building Sample:,$<,$@)
	$(V)$(SAMPLECONV) vadpcm-half $< $@
ifeq ($(AUDIO_BUILD_DEBUG),1)
	@(cmp $(<D)/aifc/$(<F:.half.wav=.half.aifc) $@ && echo "$(<F) OK") || (mkdir -p NONMATCHINGS/$(<D) && cp $(<D)/aifc/$(<F:.half.wav=.half.aifc) NONMATCHINGS/$(<D)/$(<F:.half.wav=.half.aifc))
endif

$(BUILD_DIR)/assets/audio/samples/%.aifc: assets/audio/samples/%.wav
	$(call print_two_args,Building Sample:,$<,$@)
	$(V)$(SAMPLECONV) vadpcm $< $@

$(BUILD_DIR)/assets/audio/samples/%.aifc: $(EXTRACTED_DIR)/assets/audio/samples/%.wav
	$(call print_two_args,Building Sample:,$<,$@)
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
	$(call print_two_args,Assembling Samplebank:,$<,$@)
	$(V)$(AS) $(ASFLAGS) $< -o $@
ifeq ($(AUDIO_BUILD_DEBUG),1)
	$(V)$(OBJCOPY) -O binary --only-section .rodata $@ $(@:.o=.bin)
	@cmp $(@:.o=.bin) $(patsubst $(BUILD_DIR)/assets/audio/samplebanks/%,$(EXTRACTED_DIR)/baserom_audiotest/audiotable_files/%,$(@:.o=.bin)) && echo "$(<F) OK"
endif

# also assemble the soundfonts and generate the associated headers...

$(BUILD_DIR)/assets/audio/soundfonts/%.xml: assets/audio/soundfonts/%.xml
	$(V)cat $< | $(BUILD_DIR_REPLACE) > $@

$(BUILD_DIR)/assets/audio/soundfonts/%.xml: $(EXTRACTED_DIR)/assets/audio/soundfonts/%.xml
	$(V)cat $< | $(BUILD_DIR_REPLACE) > $@

.PRECIOUS: $(BUILD_DIR)/assets/audio/soundfonts/%.c $(BUILD_DIR)/assets/audio/soundfonts/%.h $(BUILD_DIR)/assets/audio/soundfonts/%.name
$(BUILD_DIR)/assets/audio/soundfonts/%.c $(BUILD_DIR)/assets/audio/soundfonts/%.h $(BUILD_DIR)/assets/audio/soundfonts/%.name: $(BUILD_DIR)/assets/audio/soundfonts/%.xml | $(SAMPLEBANK_BUILD_XMLS) $(AIFC_FILES)
# This rule can be triggered for either the .c or .h file, so $@ may refer to either the .c or .h file. A simple
# substitution $(@:.c=.h) will fail ~50% of the time with -j. Instead, don't assume anything about the suffix of $@.
	$(V)$(SFC) $(SFCFLAGS) --makedepend $(basename $@).d $< $(basename $@).c $(basename $@).h $(basename $@).name

-include $(SOUNDFONT_DEP_FILES)

$(BUILD_DIR)/assets/audio/soundfonts/%.o: $(BUILD_DIR)/assets/audio/soundfonts/%.c $(BUILD_DIR)/assets/audio/soundfonts/%.name
# compile c to unlinked object
	$(V)$(CC) -c $(CFLAGS) $(MIPS_VERSION) $(OPTFLAGS) -I include/audio -o $(@:.o=.tmp) $<
# partial link
	$(V)$(LD) -r -T linker_scripts/soundfont.ld $(@:.o=.tmp) -o $(@:.o=.tmp2)
# patch defined symbols to be ABS symbols so that they remain file-relative offsets forever
	$(V)$(SFPATCH) $(@:.o=.tmp2) $(@:.o=.tmp2)
# write start and size symbols afterwards, filename != symbolic name so source symbolic name from the .name file written by sfc
# also write a .note.name section containing the symbolic name of the soundfont
	$(V)$(OBJCOPY) --add-symbol $$(cat $(<:.c=.name) | tr -d '\0')_Start=.rodata:0,global --redefine-sym __LEN__=$$(cat $(<:.c=.name) | tr -d '\0')_Size --add-section .note.name=$(<:.c=.name) $(@:.o=.tmp2) $@
# cleanup temp files
	@$(RM) $(@:.o=.tmp) $(@:.o=.tmp2)
ifeq ($(AUDIO_BUILD_DEBUG),1)
	$(V)$(LD) $(foreach f,$(SAMPLEBANK_O_FILES),-R $f) -T linker_scripts/soundfont.ld $@ -o $(@:.o=.elf)
	$(V)$(OBJCOPY) -O binary -j.rodata $(@:.o=.elf) $(@:.o=.bin)
	@(cmp $(@:.o=.bin) $(patsubst $(BUILD_DIR)/assets/audio/soundfonts/%,$(EXTRACTED_DIR)/baserom_audiotest/audiobank_files/%,$(@:.o=.bin)) && echo "$(<F) OK" || (mkdir -p NONMATCHINGS/soundfonts && cp $(@:.o=.bin) NONMATCHINGS/soundfonts/$(@F:.o=.bin)))
endif

# then assemble the sequences...

$(BUILD_DIR)/assets/audio/sequences/%.o: assets/audio/sequences/%.seq include/audio/aseq.h $(SEQUENCE_TABLE) | $(SOUNDFONT_HEADERS)
	$(V)$(SEQ_CPP) $(SEQ_CPPFLAGS) $< -o $(@:.o=.s) -MMD -MT $@
	$(V)$(AS) $(ASFLAGS) -I $(BUILD_DIR)/assets/audio/soundfonts -I include/audio -I $(dir $<) $(@:.o=.s) -o $@

$(BUILD_DIR)/assets/audio/sequences/%.o: $(EXTRACTED_DIR)/assets/audio/sequences/%.seq include/audio/aseq.h $(SEQUENCE_TABLE) | $(SOUNDFONT_HEADERS)
	$(V)$(SEQ_CPP) $(SEQ_CPPFLAGS) $< -o $(@:.o=.s) -MMD -MT $@
	$(V)$(AS) $(ASFLAGS) -I $(BUILD_DIR)/assets/audio/soundfonts -I include/audio -I $(dir $<) $(@:.o=.s) -o $@
ifeq ($(AUDIO_BUILD_DEBUG),1)
	$(V)$(OBJCOPY) -O binary -j.data $@ $(@:.o=.aseq)
	@(cmp $(@:.o=.aseq) $(patsubst $(BUILD_DIR)/assets/audio/sequences/%,$(EXTRACTED_DIR)/baserom_audiotest/audioseq_files/%,$(@:.o=.aseq)) && echo "$(<F) OK" || (mkdir -p NONMATCHINGS/sequences && cp $(@:.o=.aseq) NONMATCHINGS/sequences/$(@F:.o=.aseq)))
endif

-include $(SEQUENCE_DEP_FILES)

# put together the tables

$(BUILD_DIR)/assets/audio/samplebank_table.h: $(SAMPLEBANK_BUILD_XMLS)
	$(V)$(ATBLGEN) --banks $@ $^

$(BUILD_DIR)/assets/audio/soundfont_table.h: $(SOUNDFONT_BUILD_XMLS) $(SAMPLEBANK_BUILD_XMLS)
	$(V)$(ATBLGEN) --fonts $@ $(SOUNDFONT_BUILD_XMLS)

SEQ_ORDER_DEFS := -DDEFINE_SEQUENCE_PTR\(name,seqId,_2,_3,_4\)=*\(name,seqId\) \
                  -DDEFINE_SEQUENCE\(name,seqId,_2,_3,_4\)=\(name,seqId\)
$(BUILD_DIR)/assets/audio/sequence_order.in: $(SEQUENCE_TABLE)
	$(V)$(CPP) $(CPPFLAGS) $< $(SEQ_ORDER_DEFS) -o $@

$(BUILD_DIR)/assets/audio/sequence_font_table.s: $(BUILD_DIR)/assets/audio/sequence_order.in $(SEQUENCE_O_FILES)
	$(V)$(ATBLGEN) --sequences $@ $^

# build the tables into objects, move data -> rodata

$(BUILD_DIR)/src/audio/tables/samplebank_table.o: src/audio/tables/samplebank_table.c $(BUILD_DIR)/assets/audio/samplebank_table.h
$(BUILD_DIR)/src/audio/tables/soundfont_table.o: src/audio/tables/soundfont_table.c $(BUILD_DIR)/assets/audio/soundfont_table.h $(SOUNDFONT_HEADERS)
$(BUILD_DIR)/src/audio/tables/sequence_table.o: src/audio/tables/sequence_table.c $(SEQUENCE_TABLE)

$(BUILD_DIR)/src/audio/tables/sequence_table.o: CFLAGS += -I include/tables

$(BUILD_DIR)/src/audio/tables/%.o: src/audio/tables/%.c
ifneq ($(RUN_CC_CHECK),0)
	$(V)$(CC_CHECK) $<
endif
	$(V)$(CC) -c $(CFLAGS) $(MIPS_VERSION) $(OPTFLAGS) -o $(@:.o=.tmp) $<
	$(V)$(LD) -r -T linker_scripts/data_with_rodata.ld $(@:.o=.tmp) -o $@
	@$(RM) $(@:.o=.tmp)

$(BUILD_DIR)/assets/audio/sequence_font_table.o: $(BUILD_DIR)/assets/audio/sequence_font_table.s
	$(V)$(AS) $(ASFLAGS) $< -o $@

# make headers with file sizes and amounts

$(BUILD_DIR)/assets/audio/soundfont_sizes.h: $(SOUNDFONT_O_FILES)
	$(V)$(AFILE_SIZES) $@ NUM_SOUNDFONTS SOUNDFONT_SIZES .rodata $^

$(BUILD_DIR)/assets/audio/sequence_sizes.h: $(SEQUENCE_O_FILES)
	$(V)$(AFILE_SIZES) $@ NUM_SEQUENCES SEQUENCE_SIZES .data $^

# Extra audiobank padding that doesn't belong to any soundfont file
$(BUILD_DIR)/assets/audio/audiobank_padding.o:
	$(V)echo ".section .rodata; .fill 0x20" | $(AS) $(ASFLAGS) -o $@

-include $(DEP_FILES)

# Print target for debugging
print-% : ; $(info $* is a $(flavor $*) variable set to [$($*)]) @true
