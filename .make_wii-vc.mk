# Example usage:
# - make wad VERSION=ntsc-1.2
# - make iso VERSION=ntsc-1.2
#
# if building a mod for the GameCube, you will need to build this: https://github.com/Yanis002/oot-gc/tree/oot_gcc_compat
# and place the build in the baseroms folder (see `DOL` below)

## Tools

# You can get gzinject here https://github.com/PracticeROM/gzinject
GZINJECT ?= gzinject

COPY ?= cp -v

# This tool generates a file that the (modified) emulator can read
# to figure out which parts of the rom to cache.
# It outputs file indices from the rom and the location and the size of `gDmaDataTable`.
GEN_DMA_CONFIG := tools/generate_dma_config.py

# This tool generates a file that the (modified) emulator can read
# to figure out where some of the N64 functions are to apply the proper hacks
# to make the game run properly.
# By default, the emulator will compute a checksum and it tries to find functions based on
# the calculated checksum and the size of the function, though this can fail completely
# since other compilers like GCC can change these values, this system is a workaround for that.
# Note: this is only useful when building with GCC.
GEN_LIB_CONFIG := tools/generate_lib_config.py

## Files

BASEWAD := baseroms/baserom-$(REGION).wad
COMMON_KEY := baseroms/common-key.bin
WAD := $(ROM:.z64=.wad)

# for ISOs we pick the MQ-JP one for all versions and instead patch the emulator
BASEISO := baseroms/baserom.iso
ISO := $(ROM:.z64=.iso)
DMA_CONFIG_FILE := dma_config.bin
LIB_CONFIG_FILE := lib_config.bin

# set to 1 to inject in MQ
MQ_INJECT ?= 0

ifeq ($(MQ_INJECT),1)
ROM_NAME := urazlj_f
else
ROM_NAME := zlj_f
endif

# the emulator replacement dol, can be empty skip this step
DOL := baseroms/oot-gc.dol

## Flags

# wad or iso to make a compatible gcc build
TARGET ?=

ifeq ($(COMPILER),gcc)
ifneq ($(TARGET),)
CFLAGS += -fno-reorder-blocks -fno-optimize-sibling-calls -fno-toplevel-reorder
CPPFLAGS += -fno-reorder-blocks -fno-optimize-sibling-calls -fno-toplevel-reorder

# Disables `.set gp=64` in exceptasm.s
CCASFLAGS += -DTARGET_GC

$(BUILD_DIR)/src/audio/internal/seqplayer.o: OPTFLAGS := -O1
endif
endif

ifeq ($(TARGET),)
TARGET := n64
endif

## Targets

wad:
	$(V)$(MAKE) compress TARGET=wad
	$(V)$(GZINJECT) -a inject -r 1 -t "HackerOoT" -i NHOE -k $(COMMON_KEY) -m $(ROMC) -w $(BASEWAD) -o $(WAD) -p gzi/$(REGION).gzi -p gzi/controller.gzi
	$(V)$(RM) -r wadextract/

# for ISOs we need to do things manually since we want to remove
# the useless files that increase the size of the file by a lot
iso:
	$(V)$(MAKE) compress TARGET=iso
	$(V)$(GZINJECT) -a extract -s $(BASEISO)
	$(V)$(PYTHON) $(GEN_DMA_CONFIG) -v $(VERSION)
	$(V)$(COPY) $(BUILD_DIR)/$(DMA_CONFIG_FILE) isoextract/zlj_f.tgc/$(DMA_CONFIG_FILE)
ifneq ($(COMPILER),ido)
	$(V)$(PYTHON) $(GEN_LIB_CONFIG) -v $(VERSION)
	$(V)$(COPY) $(BUILD_DIR)/$(LIB_CONFIG_FILE) isoextract/zlj_f.tgc/$(LIB_CONFIG_FILE)
endif
	$(V)$(COPY) $(ROMC) isoextract/zlj_f.tgc/$(ROM_NAME).n64
ifneq ($(DOL),)
	$(V)$(COPY) $(DOL) isoextract/zlj_f.tgc/main.dol
endif
	$(V)$(RM) -r isoextract/S_*.tgc/ isoextract/zlj_f.tgc/*.thp
	$(V)$(GZINJECT) -a pack -s $(ISO)
	$(V)$(RM) -r isoextract/

.PHONY: wad iso
