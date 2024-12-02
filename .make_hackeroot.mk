#### Compiling ####

# Returns the path to the command $(1) if exists. Otherwise returns an empty string.
find-command = $(shell which $(1) 2>/dev/null)

# Set prefix to mips binutils binaries (mips-linux-gnu-ld => 'mips-linux-gnu-') - Change at your own risk!
# In nearly all cases, not having 'mips-linux-gnu-*' binaries on the PATH is indicative of missing dependencies
ifneq ($(call find-command,mips-n64-ld),)
	MIPS_BINUTILS_PREFIX := mips-n64-
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

# Enable optimization flags to use GDB on Ares
# Default value: `0`
ARES_GDB := 0

# Toggle debug features. Make sure to set this to 0 when you release your mod.
# Default value: `0`
DEBUG_FEATURES := 0

# Compression algorithm. Valid algorithms are 'yaz', 'lzo' and 'aplib'
# Default value: `yaz`
COMPRESSION ?= yaz
COMPRESSION_TYPE ?= $(shell echo $(COMPRESSION) | tr '[:lower:]' '[:upper:]')

# Set the game's region
REGION := NULL

# Set the optimization level
OPTFLAGS := -Os

# Platform compatibility flags
# Default value: (nothing)
TARGET ?=
ifeq ($(TARGET),wad)
CFLAGS := -fno-reorder-blocks -fno-optimize-sibling-calls
CPP_DEFINES := -DCONSOLE_WIIVC
else ifeq ($(TARGET),iso)
CFLAGS := -fno-reorder-blocks -fno-optimize-sibling-calls
CPP_DEFINES := -DCONSOLE_GC
endif

# Set PACKAGE_VERSION define for printing commit hash
ifeq ($(origin PACKAGE_VERSION), undefined)
	PACKAGE_VERSION := $(shell git log -1 --pretty=%h | tr -d '\n')
	ifeq ('$(PACKAGE_VERSION)', '')
		PACKAGE_VERSION = Unknown version
	endif
endif

# Define author and package version for every OoT version
CPP_DEFINES += -DPACKAGE_VERSION='$(PACKAGE_VERSION)' -DCOMPRESS_$(COMPRESSION_TYPE)=1
OPTFLAGS += -ffast-math -fno-unsafe-math-optimizations

# Override optimization flags if using GDB
ifeq ($(ARES_GDB),1)
	OPTFLAGS := -Og -ggdb3
endif

#### Tools ####

FLIPS      := tools/Flips/flips
GZINJECT   := tools/gzinject/gzinject

# Temporary measure to avoid issues on ISO builds (same for `CFLAGS_IDO`).
# The real fix would be having the proper fixes in the N64 emulator itself
# but this requires some time to figure it out.
CC_IDO     := tools/ido_recomp/linux/5.3/cc

#### Files ####

# Config file used for building ISOs.
DMA_CONFIG_FILE := dma_config.txt

# Baserom to use when creating BPS patches
BASEROM_PATCH ?= baseroms/$(VERSION)/baserom.z64

#### Build Rules ####

# Build the codebase to inject in a WAD file (for Wii VC)
# Steps:
#		- check if there's the common-key.bin file
#		- build and compress the rom
#		- inject the binary in the wad file (and apply patches)
#		- remove temporary folders
wad:
	$(call print,Patching WAD...)
ifeq ("$(wildcard baseroms/$(VERSION)/common-key.bin)", "")
	$(error Please provide the common-key.bin file.)
endif
	$(V)$(MAKE) compress TARGET=wad
	$(V)$(GZINJECT) -a inject -r 1 -k baseroms/$(VERSION)/common-key.bin -w baseroms/$(VERSION)/basewad.wad -m $(ROMC) -o $(WAD) -t "HackerOoT" -i NHOE -p tools/gzinject/patches/NACE.gzi -p tools/gzinject/patches/gz_default_remap.gzi
	$(V)$(RM) -r wadextract/
	$(call print,Success!)

# Build the codebase to inject in a ISO file (for GameCube)
# Steps:
#		- build and compress the rom
#		- create the dma config file
#		- extract the iso
#		- copy the rom and dma config file to the extracted iso folder
#		- remove any unnecessary files
#		- apply the modifications on the emulator binary
#		- pack the iso
#		- remove temporary folders
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

# Create a BPS patch for the built rom
# Steps:
#		- run Flips and create the patch
# TODO: add compressed rom support.
patch:
	$(call print,Creating BPS patch...)
	$(V)$(FLIPS) --create --bps $(BASEROM_PATCH) $(ROM) $(BPS)
	$(call print,Success!)

# Create F3DEX3 bps patches
# Steps:
#		- run Flips and create the patches
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

# Build the rom and print its checksum (using md5)
# Steps:
#		- run `make clean`
#		- build the rom
#		- show the checksum
verify:
	$(V)$(MAKE) clean
	$(V)$(MAKE) rom
	@md5sum $(ROM)

.PHONY: wad iso patch create_f3dex3_patches verify

F3DEX3/f3dzex2.code:
	$(V)dd bs=1 if=$(BASEROM_DIR)/baserom-decompressed.z64 of=$@ skip=12374256 count=5680 status=none

F3DEX3/f3dzex2.data:
	$(V)dd bs=1 if=$(BASEROM_DIR)/baserom-decompressed.z64 of=$@ skip=12379936 count=1056 status=none

F3DEX3/F3DEX3%.code: F3DEX3/F3DEX3%.code.bps F3DEX3/f3dzex2.code
	$(V)$(FLIPS) --apply F3DEX3/F3DEX3$*.code.bps F3DEX3/f3dzex2.code $@
	
F3DEX3/F3DEX3%.data: F3DEX3/F3DEX3%.data.bps F3DEX3/f3dzex2.data
	$(V)$(FLIPS) --apply F3DEX3/F3DEX3$*.data.bps F3DEX3/f3dzex2.data $@

.PRECIOUS: $(UCODE_FILES)

$(BUILD_DIR)/F3DEX3/%.o: F3DEX3/%
	$(call print,Wrapping binary to ELF:,$<,$@)
	$(V)mkdir -p $(BUILD_DIR)/F3DEX3
	$(V)$(OBJCOPY) -I binary -O elf32-big $< $@

#### Output ####

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
