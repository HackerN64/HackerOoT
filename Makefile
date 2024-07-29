MAKEFLAGS += --no-builtin-rules --no-print-directory

# Ensure the build fails if a piped command fails
SHELL = /bin/bash
.SHELLFLAGS = -o pipefail -c

# Build options can either be changed by modifying the makefile, or by building with 'make SETTING=value'

# currently, GCC is the only supported compiler
COMPILER := gcc
# MIPS ABI, can be one of "32", "n32" or "eabi"
ABI := eabi

# Target game version. Currently only the following version is supported:
#   gc-eu          GameCube Europe/PAL
#   gc-eu-mq       GameCube Europe/PAL Master Quest
#   gc-eu-mq-dbg   GameCube Europe/PAL Master Quest Debug
#   hackeroot-mq   HackerOoT, based on gc-eu-mq-dbg (default)
#
# The following versions are work-in-progress and not yet matching:
#   gc-us          GameCube US
#
# Note: choosing hackeroot-mq will enable HackerOoT features,
#       if another version is chosen, this repo will be like
#       zeldaret/main decomp but without the disassembly, decompilation
#       and matching tools, including the IDO compiler
VERSION := hackeroot-mq

# Enable optimization flags to use GDB on Ares
ARES_GDB := 1

# Toggle release or debug mode. 1=Release, 0=Debug
# Note: currently only used for HackerOoT
RELEASE := 0

# Valid compression algorithms are 'yaz', 'lzo' and 'aplib'
COMPRESSION ?= yaz
COMPRESSION_TYPE ?= $(shell echo $(COMPRESSION) | tr '[:lower:]' '[:upper:]')

# Number of threads to extract and compress with
N_THREADS := $(shell nproc)
# Check code syntax with host compiler
RUN_CC_CHECK := 1

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

ifeq ($(COMPILER),gcc)
  CPP_DEFINES += -DCOMPILER_GCC -DNON_MATCHING -DAVOID_UB -std=gnu11
else
  $(error Unsupported compiler. Please use gcc as the COMPILER variable.)
endif

# Set prefix to mips binutils binaries (mips-linux-gnu-ld => 'mips-linux-gnu-') - Change at your own risk!
# In nearly all cases, not having 'mips-linux-gnu-*' binaries on the PATH is indicative of missing dependencies

# Returns the path to the command $(1) if exists. Otherwise returns an empty string.
find-command = $(shell which $(1) 2>/dev/null)

ifneq ($(call find-command,mips-n64-ld),)
  MIPS_BINUTILS_PREFIX := mips-n64-
else ifneq ($(call find-command,mips64-ultra-elf-ld),)
  MIPS_BINUTILS_PREFIX := mips64-ultra-elf-
else ifneq ($(call find-command,mips64-ld),)
  MIPS_BINUTILS_PREFIX := mips64-
else ifneq ($(call find-command,mips-linux-gnu-ld),)
  MIPS_BINUTILS_PREFIX := mips-linux-gnu-
else ifneq ($(call find-command,mips64-linux-gnu-ld),)
  MIPS_BINUTILS_PREFIX := mips64-linux-gnu-
else ifneq ($(call find-command,mips-ld),)
  MIPS_BINUTILS_PREFIX := mips-
else ifneq ($(call find-command,mips64-elf-ld),)
  MIPS_BINUTILS_PREFIX := mips64-elf-
else
  $(error Unable to detect a suitable MIPS toolchain installed)
endif

# Version-specific settings
ifeq ($(VERSION),gc-us)
  DEBUG := 0
  COMPARE := 0
  CPP_DEFINES += -DOOT_NTSC=1 -DOOT_PAL=0 -DOOT_MQ=0
else ifeq ($(VERSION),gc-eu)
  DEBUG := 0
  CPP_DEFINES += -DOOT_NTSC=0 -DOOT_PAL=1 -DOOT_MQ=0
  HACKEROOT := 0
else ifeq ($(VERSION),gc-eu-mq)
  DEBUG := 0
  CPP_DEFINES += -DOOT_NTSC=0 -DOOT_PAL=1 -DOOT_MQ=1
  HACKEROOT := 0
else ifeq ($(VERSION),gc-eu-mq-dbg)
  DEBUG := 1
  CPP_DEFINES += -DOOT_NTSC=0 -DOOT_PAL=1 -DOOT_MQ=1
  HACKEROOT := 0
else ifeq ($(VERSION),hackeroot-mq)
  DEBUG := 1
  CPP_DEFINES += -DOOT_NTSC=0 -DOOT_PAL=1 -DOOT_MQ=1
  HACKEROOT := 1
else
$(error Unsupported version $(VERSION))
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

AS_NOCPP := $(MIPS_BINUTILS_PREFIX)as
AS       := $(CC) $(CPPFLAGS) -x assembler-with-cpp -c
LD       := $(MIPS_BINUTILS_PREFIX)ld
OBJCOPY  := $(MIPS_BINUTILS_PREFIX)objcopy
OBJDUMP  := $(MIPS_BINUTILS_PREFIX)objdump
NM       := $(MIPS_BINUTILS_PREFIX)nm

N64_EMULATOR ?=

INC := -Iinclude -Iinclude/libc -Isrc -I$(BUILD_DIR) -I. -I$(EXTRACTED_DIR)

# Check code syntax with host compiler
CHECK_WARNINGS := -Wall -Wextra -Wno-format-security -Wno-unknown-pragmas -Wno-unused-parameter -Wno-unused-variable -Wno-missing-braces
CHECK_WARNINGS += -Werror=implicit-function-declaration -Werror=incompatible-pointer-types -Werror=int-conversion

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

# Command to replace path variables in the spec file. We can't use the C
# preprocessor for this because it won't substitute inside string literals.
SPEC_REPLACE_VARS := sed -e 's|$$(BUILD_DIR)|$(BUILD_DIR)|g'

CFLAGS += $(CPP_DEFINES)
CPPFLAGS += $(CPP_DEFINES)
CFLAGS_IDO += $(CPP_DEFINES)

# TODO PL and DOWHILE should be disabled for non-gamecube
GBI_DEFINES := -DF3DEX_GBI_2 -DF3DEX_GBI_PL -DGBI_DOWHILE
ifeq ($(DEBUG),1)
  GBI_DEFINES += -DGBI_DEBUG
endif

CFLAGS += $(GBI_DEFINES)

# Select ld output format based on toolchain default and any additional ABI-specific flags
ifeq ($(ABI),n32)
  LD_OUTPUT_FORMAT := $(shell $(LD) --print-output-format | sed -E 's/elf(32|64)-(n)?(trad)?(big|little)mips/elf\1-n\3\4mips/')
else
  ifeq ($(ABI),eabi)
    ABI_FLAGS := -mgp32 -mfp32
  endif
  LD_OUTPUT_FORMAT := $(shell $(LD) --print-output-format | sed -E 's/elf(32|64)-(n)?(trad)?(big|little)mips/elf\1-\3\4mips/')
endif
 
ifeq ($(COMPILER),gcc)
  CFLAGS += -G 0 -nostdinc $(INC) -march=vr4300 -mfix4300 -mabi=$(ABI) $(ABI_FLAGS) -mno-abicalls -mdivide-breaks -fno-PIC -fno-common -ffreestanding -fbuiltin -fno-builtin-sinf -fno-builtin-cosf $(CHECK_WARNINGS) -funsigned-char
  ASFLAGS := -march=vr4300 -mabi=$(ABI) $(ABI_FLAGS) -mno-abicalls -Wa,-no-pad-sections -I include
  ASFLAGS_NOCPP := -march=vr4300 -mabi=$(ABI) $(ABI_FLAGS) -no-pad-sections -I include
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

# create extracted directories
$(shell mkdir -p $(EXTRACTED_DIR) $(EXTRACTED_DIR)/assets $(EXTRACTED_DIR)/text)

# create extracted directories
$(shell mkdir -p $(EXTRACTED_DIR) $(EXTRACTED_DIR)/assets $(EXTRACTED_DIR)/text)

ASSET_BIN_DIRS := $(shell find $(EXTRACTED_DIR)/assets -type d)
ASSET_FILES_BIN := $(foreach dir,$(ASSET_BIN_DIRS),$(wildcard $(dir)/*.bin))
ASSET_FILES_OUT := $(foreach f,$(ASSET_FILES_BIN:.bin=.bin.inc.c),$(f:$(EXTRACTED_DIR)/%=$(BUILD_DIR)/%)) \
				   $(foreach f,$(wildcard assets/text/*.c),$(BUILD_DIR)/$(f:.c=.o))

UNDECOMPILED_DATA_DIRS := $(shell find data -type d)

BASEROM_BIN_FILES := $(wildcard $(EXTRACTED_DIR)/baserom/*)

# source files
SRC_C_FILES   := $(filter-out %.inc.c,$(foreach dir,$(SRC_DIRS),$(wildcard $(dir)/*.c)))
ASSET_C_FILES := $(filter-out %.inc.c,$(foreach dir,$(ASSET_BIN_DIRS),$(wildcard $(dir)/*.c)))
S_FILES       := $(foreach dir,$(SRC_DIRS) $(UNDECOMPILED_DATA_DIRS),$(wildcard $(dir)/*.s))
O_FILES       := $(foreach f,$(S_FILES:.s=.o),$(BUILD_DIR)/$f) \
                 $(foreach f,$(SRC_C_FILES:.c=.o),$(BUILD_DIR)/$f) \
                 $(foreach f,$(ASSET_C_FILES:.c=.o),$(f:$(EXTRACTED_DIR)/%=$(BUILD_DIR)/%)) \
                 $(foreach f,$(BASEROM_BIN_FILES),$(BUILD_DIR)/baserom/$(notdir $f).o)
UCODE_PATCHES := $(wildcard F3DEX3/*.bps)
UCODE_FILES   := $(foreach f,$(UCODE_PATCHES:.bps=),$f)
UCODE_O_FILES := $(foreach f,$(UCODE_FILES),$(BUILD_DIR)/$f.o)

OVL_RELOC_FILES := $(shell $(CPP) $(CPPFLAGS) $(SPEC) | $(SPEC_REPLACE_VARS) | grep -o '[^"]*_reloc.o' )

# Automatic dependency files
# (Only asm_processor dependencies and reloc dependencies are handled for now)
DEP_FILES := $(O_FILES:.o=.asmproc.d) $(OVL_RELOC_FILES:.o=.d)


TEXTURE_FILES_PNG := $(foreach dir,$(ASSET_BIN_DIRS),$(wildcard $(dir)/*.png))
TEXTURE_FILES_JPG := $(foreach dir,$(ASSET_BIN_DIRS),$(wildcard $(dir)/*.jpg))
TEXTURE_FILES_OUT := $(foreach f,$(TEXTURE_FILES_PNG:.png=.inc.c),$(f:$(EXTRACTED_DIR)/%=$(BUILD_DIR)/%)) \
					 $(foreach f,$(TEXTURE_FILES_JPG:.jpg=.jpg.inc.c),$(f:$(EXTRACTED_DIR)/%=$(BUILD_DIR)/%))

# create build directories
$(shell mkdir -p $(BUILD_DIR)/baserom $(BUILD_DIR)/assets/text $(foreach dir,$(SRC_DIRS) $(UNDECOMPILED_DATA_DIRS),$(BUILD_DIR)/$(dir)) $(foreach dir,$(ASSET_BIN_DIRS),$(dir:$(EXTRACTED_DIR)/%=$(BUILD_DIR)/%)))

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

setup: venv
	$(call print,Setup in progress...)
	$(V)$(MAKE) -C tools
	$(call print,Tools: Done!)
	$(V)$(PYTHON) tools/decompress_baserom.py $(VERSION)
	$(call print,Decompressing baserom: Done!)
	$(V)$(PYTHON) tools/extract_baserom.py $(BASEROM_DIR)/baserom-decompressed.z64 --oot-version $(VERSION) -o $(EXTRACTED_DIR)/baserom
	$(V)$(PYTHON) tools/msgdis.py $(VERSION)
	$(V)$(PYTHON) extract_assets.py -v $(VERSION) -j$(N_THREADS)
	$(call print,Extracting files: Done!)
ifeq ($(VERSION),hackeroot-mq)
# TODO: proper fix (for .s files)
	cp baseroms/hackeroot-mq/baserom-decompressed.z64 baseroms/gc-eu-mq-dbg/baserom-decompressed.z64
endif

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
	@$(PRINT) "${GREEN}MIPS Toolchain: $(BLUE)$(MIPS_BINUTILS_PREFIX)$(NO_COL)\n"
	@$(PRINT) "${GREEN}MIPS ABI: $(BLUE)$(ABI)$(NO_COL)\n"
	@$(PRINT) "${GREEN}Code Version: $(BLUE)$(PACKAGE_VERSION)$(NO_COL)\n"

$(ROMC): $(ROM) $(ELF) $(BUILD_DIR)/compress_ranges.txt
ifeq ($(COMPRESSION),yaz)
	$(V)$(PYTHON) tools/compress.py --in $(ROM) --out $@ --dmadata-start `./tools/dmadata_start.sh $(NM) $(ELF)` --compress `cat $(BUILD_DIR)/compress_ranges.txt` --threads $(N_THREADS)
else
	$(V)$(PYTHON) tools/z64compress_wrapper.py --codec $(COMPRESSION) --cache $(BUILD_DIR)/cache --threads $(N_THREADS) $< $@ $(ELF) $(BUILD_DIR)/$(SPEC)
endif
	$(V)$(PYTHON) -m ipl3checksum sum --cic 6105 --update $@

$(ELF): $(TEXTURE_FILES_OUT) $(ASSET_FILES_OUT) $(O_FILES) $(OVL_RELOC_FILES) $(UCODE_O_FILES) $(LDSCRIPT) $(BUILD_DIR)/undefined_syms.txt
	$(call print,Linking:,,$@)
	$(V)$(LD) --oformat $(LD_OUTPUT_FORMAT) -T $(LDSCRIPT) -T $(BUILD_DIR)/undefined_syms.txt --no-check-sections --accept-unknown-input-arch --emit-relocs -Map $(MAP) -o $@

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
	$(V)$(CPP) $(CPPFLAGS) $< | $(SPEC_REPLACE_VARS) > $@

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
	$(V)$(AS) $(ASFLAGS) $< -o $@

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
	$(V)$(OBJCOPY) -O binary -j.rodata $@ $@.bin

$(BUILD_DIR)/assets/%.o: $(EXTRACTED_DIR)/assets/%.c
	$(call print,Compiling:,$<,$@)
	$(V)$(CC) -c $(CFLAGS) $(MIPS_VERSION) $(OPTFLAGS) -o $@ $<
	$(V)$(OBJCOPY) -O binary $@ $@.bin

$(BUILD_DIR)/src/%.o: src/%.s
	$(call print,Compiling:,$<,$@)
	$(V)$(AS) $(ASFLAGS) $< -o $@

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
ifeq ($(ABI),32)
	$(V)$(PYTHON) tools/set_o32abi_bit.py $@
endif
	$(V)@$(OBJDUMP) $(OBJDUMP_FLAGS) $@ > $(@:.o=.s)

$(BUILD_DIR)/src/libultra/libc/llcvt.o: src/libultra/libc/llcvt.c
ifneq ($(RUN_CC_CHECK),0)
	$(V)$(CC_CHECK) $<
endif
	$(call print,Compiling:,$<,$@)
	$(V)$(CC) -c $(CFLAGS) $(MIPS_VERSION) $(OPTFLAGS) -o $@ $<
ifeq ($(ABI),32)
	$(V)$(PYTHON) tools/set_o32abi_bit.py $@
endif
	$(V)@$(OBJDUMP) $(OBJDUMP_FLAGS) $@ > $(@:.o=.s)

$(BUILD_DIR)/src/overlays/%_reloc.o: $(BUILD_DIR)/$(SPEC)
	$(call print,Generating Relocation:,$<,$@)
	$(V)$(FADO) $$(tools/reloc_prereq $< $(notdir $*)) -n $(notdir $*) -o $(@:.o=.s) -M $(@:.o=.d)
	$(V)$(AS_NOCPP) $(ASFLAGS_NOCPP) $(@:.o=.s) -o $@

$(BUILD_DIR)/assets/%.inc.c: $(EXTRACTED_DIR)/assets/%.png
	$(V)$(ZAPD) btex -eh -tt $(subst .,,$(suffix $*)) -i $< -o $@

$(BUILD_DIR)/assets/%.bin.inc.c: $(EXTRACTED_DIR)/assets/%.bin
	$(V)$(ZAPD) bblb -eh -i $< -o $@

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

-include $(DEP_FILES)

# Print target for debugging
print-% : ; $(info $* is a $(flavor $*) variable set to [$($*)]) @true
