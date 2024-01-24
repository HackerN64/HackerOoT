MAKEFLAGS += --no-builtin-rules

# Ensure the build fails if a piped command fails
SHELL = /bin/bash
.SHELLFLAGS = -o pipefail -c

# Build options can either be changed by modifying the makefile, or by building with 'make SETTING=value'

# If COMPILER is "gcc", compile with GCC.
COMPILER ?= gcc

# Target game version. Currently only the following version is supported:
#   gc-eu-mq-dbg   GameCube Europe/PAL Master Quest Debug (default)
VERSION := gc-eu-mq-dbg
# Number of threads to extract and compress with
N_THREADS := $(shell nproc)

# If DEBUG_BUILD is 0, compile with ``RELEASE_ROM`` defined
DEBUG_BUILD ?= 1

# Valid compression algorithms are yaz, lzo and aplib
COMPRESSION ?= yaz

# Valid compression methods are crunch64 and z64compress
COMPRESSION_METHOD ?= z64compress

ifeq ($(COMPRESSION),lzo)
  CFLAGS += -DCOMPRESSION_LZO
  CPPFLAGS += -DCOMPRESSION_LZO
endif

ifeq ($(COMPRESSION),yaz)
  CFLAGS += -DCOMPRESSION_YAZ
  CPPFLAGS += -DCOMPRESSION_YAZ
endif

ifeq ($(COMPRESSION),aplib)
  CFLAGS += -DCOMPRESSION_APLIB
  CPPFLAGS += -DCOMPRESSION_APLIB
endif

CFLAGS ?=
CPPFLAGS ?=

ifeq ($(COMPILER),gcc)
  CFLAGS += -DCOMPILER_GCC
  CPPFLAGS += -DCOMPILER_GCC
endif

ifeq ($(DEBUG_BUILD),0)
  CFLAGS += -DRELEASE_ROM
  CPPFLAGS += -DRELEASE_ROM
endif

# Set PACKAGE_VERSION define for printing commit hash
ifeq ($(origin PACKAGE_VERSION), undefined)
  PACKAGE_VERSION := $(shell git log -1 --pretty=%h | tr -d '\n')
  ifeq ('$(PACKAGE_VERSION)', '')
    PACKAGE_VERSION = Unknown version
  endif
endif

# Set PACKAGE_AUTHOR define for printing author's git name
ifeq ($(origin PACKAGE_AUTHOR), undefined)
  PACKAGE_AUTHOR := $(shell git config --get user.name)
  ifeq ('$(PACKAGE_AUTHOR)', '')
    PACKAGE_AUTHOR = Unknown author
  endif
endif

# Set prefix to mips binutils binaries (mips-linux-gnu-ld => 'mips-linux-gnu-') - Change at your own risk!
# In nearly all cases, not having 'mips-linux-gnu-*' binaries on the PATH is indicative of missing dependencies
MIPS_BINUTILS_PREFIX := mips-linux-gnu-

CFLAGS += -DNON_MATCHING -DAVOID_UB
CPPFLAGS += -DNON_MATCHING -DAVOID_UB

CFLAGS += -DPACKAGE_VERSION='$(PACKAGE_VERSION)'
CPPFLAGS += -DPACKAGE_VERSION='$(PACKAGE_VERSION)'
CFLAGS += -DPACKAGE_AUTHOR='$(PACKAGE_AUTHOR)'
CPPFLAGS += -DPACKAGE_AUTHOR='$(PACKAGE_AUTHOR)'
# Make sure the build reports the correct version
$(shell touch src/boot/build.c)

# Version-specific settings
ifeq ($(VERSION),gc-eu-mq-dbg)
  OPTFLAGS := -O2
else
$(error Unsupported version $(VERSION))
endif

PROJECT_DIR := $(dir $(realpath $(firstword $(MAKEFILE_LIST))))
BUILD_DIR := build/$(VERSION)

MAKE = make
CFLAGS += -DOOT_DEBUG
CPPFLAGS += -DOOT_DEBUG -fno-dollars-in-identifiers -P

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
        CPPFLAGS += -xc++
    endif
endif

#### Tools ####
ifneq ($(shell type $(MIPS_BINUTILS_PREFIX)ld >/dev/null 2>/dev/null; echo $$?), 0)
  $(error Unable to find $(MIPS_BINUTILS_PREFIX)ld. Please install or build MIPS binutils, commonly mips-linux-gnu. (or set MIPS_BINUTILS_PREFIX if your MIPS binutils install uses another prefix))
endif

# Detect compiler and set variables appropriately.
ifeq ($(COMPILER),gcc)
  CC       := $(MIPS_BINUTILS_PREFIX)gcc
else
$(error Unsupported compiler. Please use either gcc as the COMPILER variable.)
endif

AS      := $(MIPS_BINUTILS_PREFIX)as
LD      := $(MIPS_BINUTILS_PREFIX)ld
OBJCOPY := $(MIPS_BINUTILS_PREFIX)objcopy
OBJDUMP := $(MIPS_BINUTILS_PREFIX)objdump
NM      := $(MIPS_BINUTILS_PREFIX)nm

N64_EMULATOR ?= 

INC := -Iinclude -Iinclude/libc -Isrc -I$(BUILD_DIR) -I.

# Check code syntax with host compiler
CHECK_WARNINGS := -Wall -Wextra -Wno-format-security -Wno-unknown-pragmas -Wno-unused-parameter -Wno-unused-variable -Wno-missing-braces

CPP        := cpp
MKLDSCRIPT := tools/mkldscript
MKDMADATA  := tools/mkdmadata
ELF2ROM    := tools/elf2rom
ZAPD       := tools/ZAPD/ZAPD.out
FADO       := tools/fado/fado.elf
PYTHON     ?= python3

# Command to replace path variables in the spec file. We can't use the C
# preprocessor for this because it won't substitute inside string literals.
SPEC_REPLACE_VARS := sed -e 's|$$(BUILD_DIR)|$(BUILD_DIR)|g'

ifeq ($(COMPILER),gcc)
  OPTFLAGS := -Os -ffast-math -fno-unsafe-math-optimizations
endif

ASFLAGS := -march=vr4300 -32 -no-pad-sections -Iinclude

ifeq ($(COMPILER),gcc)
  CFLAGS += -G 0 -nostdinc $(INC) -march=vr4300 -mfix4300 -mabi=32 -fno-pic -mno-abicalls -mdivide-breaks -fno-zero-initialized-in-bss -fno-toplevel-reorder -ffreestanding -fno-common -fno-merge-constants -mno-explicit-relocs -mno-split-addresses $(CHECK_WARNINGS) -funsigned-char
  MIPS_VERSION := -mips3
else
  # Suppress warnings for wrong number of macro arguments (to fake variadic
  # macros) and Microsoft extensions such as anonymous structs (which the
  # compiler does support but warns for their usage).
  CFLAGS += -G 0 -non_shared -fullwarn -verbose -Xcpluscomm $(INC) -Wab,-r4300_mul -woff 516,609,649,838,712
  MIPS_VERSION := -mips2
endif

CC_CHECK  = @:

OBJDUMP_FLAGS := -d -r -z -Mreg-names=32

#### Files ####

# ROM image
ROM  := HackerOoT-$(VERSION).z64
ELF  := $(ROM:.z64=.elf)
ROMC := $(ROM:.z64=-compressed.z64)
WAD  := $(ROM:.z64=.wad)
# description of ROM segments
SPEC := spec

SRC_DIRS := $(shell find src -type d)

ASSET_BIN_DIRS := $(shell find assets/* -type d -not -path "assets/xml*" -not -path "assets/text")
ASSET_FILES_XML := $(foreach dir,$(ASSET_BIN_DIRS),$(wildcard $(dir)/*.xml))
ASSET_FILES_BIN := $(foreach dir,$(ASSET_BIN_DIRS),$(wildcard $(dir)/*.bin))
ASSET_FILES_OUT := $(foreach f,$(ASSET_FILES_XML:.xml=.c),$f) \
				   $(foreach f,$(ASSET_FILES_BIN:.bin=.bin.inc.c),$(BUILD_DIR)/$f) \
				   $(foreach f,$(wildcard assets/text/*.c),$(BUILD_DIR)/$(f:.c=.o))

UNDECOMPILED_DATA_DIRS := $(shell find data -type d)

# source files
C_FILES       := $(filter-out %.inc.c,$(foreach dir,$(SRC_DIRS) $(ASSET_BIN_DIRS),$(wildcard $(dir)/*.c)))
S_FILES       := $(foreach dir,$(SRC_DIRS) $(UNDECOMPILED_DATA_DIRS),$(wildcard $(dir)/*.s))
BASEROM_BIN_FILES := $(wildcard baseroms/$(VERSION)/segments/*)
O_FILES       := $(foreach f,$(S_FILES:.s=.o),$(BUILD_DIR)/$f) \
                 $(foreach f,$(C_FILES:.c=.o),$(BUILD_DIR)/$f) \
                 $(foreach f,$(BASEROM_BIN_FILES),$(BUILD_DIR)/baserom/$(notdir $f).o)

OVL_RELOC_FILES := $(shell $(CPP) $(CPPFLAGS) $(SPEC) | $(SPEC_REPLACE_VARS) | grep -o '[^"]*_reloc.o' )

# Automatic dependency files
# (Only asm_processor dependencies and reloc dependencies are handled for now)
DEP_FILES := $(O_FILES:.o=.d) $(O_FILES:.o=.asmproc.d) $(OVL_RELOC_FILES:.o=.d)


TEXTURE_FILES_PNG := $(foreach dir,$(ASSET_BIN_DIRS),$(wildcard $(dir)/*.png))
TEXTURE_FILES_JPG := $(foreach dir,$(ASSET_BIN_DIRS),$(wildcard $(dir)/*.jpg))
TEXTURE_FILES_OUT := $(foreach f,$(TEXTURE_FILES_PNG:.png=.inc.c),$(BUILD_DIR)/$f) \
					 $(foreach f,$(TEXTURE_FILES_JPG:.jpg=.jpg.inc.c),$(BUILD_DIR)/$f) \

# create build directories
$(shell mkdir -p $(BUILD_DIR)/baserom $(BUILD_DIR)/assets/text $(foreach dir,$(SRC_DIRS) $(UNDECOMPILED_DATA_DIRS) $(ASSET_BIN_DIRS),$(BUILD_DIR)/$(dir)))

$(BUILD_DIR)/src/libultra/libc/ll.o: OPTFLAGS := -Ofast
$(BUILD_DIR)/src/%.o: CC := $(CC) -fexec-charset=euc-jp

$(BUILD_DIR)/src/overlays/actors/ovl_Item_Shield/%.o: OPTFLAGS := -O2
$(BUILD_DIR)/src/overlays/actors/ovl_En_Part/%.o: OPTFLAGS := -O2
$(BUILD_DIR)/src/overlays/actors/ovl_Item_B_Heart/%.o: OPTFLAGS := -O0
$(BUILD_DIR)/src/overlays/actors/ovl_Bg_Mori_Hineri/%.o: OPTFLAGS := -O0

#### Main Targets ###

rom: $(ROM)

compressed: $(ROMC)

wad:
	$(MAKE) compressed CFLAGS="-DCONSOLE_WIIVC $(CFLAGS) -fno-reorder-blocks -fno-optimize-sibling-calls" CPPFLAGS="-DCONSOLE_WIIVC $(CPPFLAGS)"
	@echo 45e | tools/gzinject/gzinject -a genkey -k common-key.bin >/dev/null
	tools/gzinject/gzinject -a inject -r 1 -k common-key.bin -w basewad.wad -m $(ROMC) -o $(WAD) -t "HackerOoT" -i NHOE -p tools/gzinject/patches/NACE.gzi -p tools/gzinject/patches/gz_default_remap.gzi
	$(RM) -r wadextract/ common-key.bin

clean:
	$(RM) -r $(ROM) $(ROMC) $(WAD) $(ELF) $(BUILD_DIR) cache

assetclean:
	$(RM) -r $(ASSET_BIN_DIRS)
	$(RM) -r assets/text/*.h
	$(RM) -r $(BUILD_DIR)/assets
	$(RM) -r .extracted-assets.json

rebuildtools:
	$(MAKE) -C tools distclean
	$(MAKE) -C tools

distclean: clean assetclean
	$(RM) -r baseroms/$(VERSION)/segments
	$(MAKE) -C tools distclean

setup:
	$(MAKE) -C tools
	$(PYTHON) tools/decompress_baserom.py $(VERSION)
	$(PYTHON) extract_baserom.py
	$(PYTHON) extract_assets.py -j$(N_THREADS)

run: $(ROM)
ifeq ($(N64_EMULATOR),)
	$(error Emulator path not set. Set N64_EMULATOR in the Makefile or define it as an environment variable)
endif
	$(N64_EMULATOR) $<


.PHONY: all rom compressed clean setup run distclean assetclean wad rebuildtools
.DEFAULT_GOAL := rom
all: rom compressed

#### Various Recipes ####

$(ROM): $(ELF)
	$(ELF2ROM) -cic 6105 $< $@

ifeq ($(COMPRESSION_METHOD),z64compress)
$(ROMC): $(ROM)
	python3 tools/z64compress_wrapper.py --codec $(COMPRESSION) --cache cache --threads $(N_THREADS) $< $@ $(ELF) $(BUILD_DIR)/$(SPEC)
else ifeq ($(COMPRESSION_METHOD),crunch64)
$(ROMC): $(ROM) $(ELF) $(BUILD_DIR)/compress_ranges.txt
# note: $(BUILD_DIR)/compress_ranges.txt should only be used for nonmatching builds. it works by chance for matching builds too though
	$(PYTHON) tools/compress.py --in $(ROM) --out $@ --dma-range `./tools/dmadata_range.sh $(NM) $(ELF)` --compress `cat $(BUILD_DIR)/compress_ranges.txt` --threads $(N_THREADS)
	$(PYTHON) -m ipl3checksum sum --cic 6105 --update $@
else
	$(error Unsupported compression method: `$(COMPRESSION_METHOD)`)

$(ELF): $(TEXTURE_FILES_OUT) $(ASSET_FILES_OUT) $(O_FILES) $(OVL_RELOC_FILES) $(BUILD_DIR)/ldscript.txt $(BUILD_DIR)/undefined_syms.txt
	$(LD) -T $(BUILD_DIR)/undefined_syms.txt -T $(BUILD_DIR)/ldscript.txt --no-check-sections --accept-unknown-input-arch --emit-relocs -Map $(BUILD_DIR)/z64.map -o $@

## Order-only prerequisites
# These ensure e.g. the O_FILES are built before the OVL_RELOC_FILES.
# The intermediate phony targets avoid quadratically-many dependencies between the targets and prerequisites.

o_files: $(O_FILES)
$(OVL_RELOC_FILES): | o_files

asset_files: $(TEXTURE_FILES_OUT) $(ASSET_FILES_OUT)
$(O_FILES): | asset_files

.PHONY: o_files asset_files

$(BUILD_DIR)/$(SPEC): $(SPEC)
	$(CPP) $(CPPFLAGS) $< | $(SPEC_REPLACE_VARS) > $@

$(BUILD_DIR)/ldscript.txt: $(BUILD_DIR)/$(SPEC)
	$(MKLDSCRIPT) $< $@

$(BUILD_DIR)/undefined_syms.txt: undefined_syms.txt
	$(CPP) $(CPPFLAGS) $< > $@

$(BUILD_DIR)/baserom/%.o: baseroms/$(VERSION)/segments/%
	$(OBJCOPY) -I binary -O elf32-big $< $@

$(BUILD_DIR)/data/%.o: data/%.s
	$(AS) $(ASFLAGS) $< -o $@

$(BUILD_DIR)/assets/text/%.enc.h: assets/text/%.h assets/text/charmap.txt
	$(PYTHON) tools/msgenc.py assets/text/charmap.txt $< $@

# Dependencies for files including message data headers
# TODO remove when full header dependencies are used.
$(BUILD_DIR)/assets/text/fra_message_data_static.o: $(BUILD_DIR)/assets/text/message_data.enc.h
$(BUILD_DIR)/assets/text/ger_message_data_static.o: $(BUILD_DIR)/assets/text/message_data.enc.h
$(BUILD_DIR)/assets/text/nes_message_data_static.o: $(BUILD_DIR)/assets/text/message_data.enc.h
$(BUILD_DIR)/assets/text/staff_message_data_static.o: $(BUILD_DIR)/assets/text/message_data_staff.enc.h
$(BUILD_DIR)/src/code/z_message_PAL.o: $(BUILD_DIR)/assets/text/message_data.enc.h $(BUILD_DIR)/assets/text/message_data_staff.enc.h

$(BUILD_DIR)/assets/%.o: assets/%.c
	$(CC) -c $(CFLAGS) $(MIPS_VERSION) $(OPTFLAGS) -MMD -MF $(basename $@).d -o $@ $<
	$(OBJCOPY) -O binary $@ $@.bin

$(BUILD_DIR)/src/%.o: src/%.s
	$(CPP) $(CPPFLAGS) -Iinclude -MMD -MF $(basename $@).d  $< | $(AS) $(ASFLAGS) -o $@

$(BUILD_DIR)/dmadata_table_spec.h $(BUILD_DIR)/compress_ranges.txt: $(BUILD_DIR)/$(SPEC)
	$(MKDMADATA) $< $(BUILD_DIR)/dmadata_table_spec.h $(BUILD_DIR)/compress_ranges.txt

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
	$(CC_CHECK) $<
	$(CC) -c $(CFLAGS) $(MIPS_VERSION) $(OPTFLAGS) -MMD -MF $(basename $@).d  -o $@ $<
	@$(OBJDUMP) $(OBJDUMP_FLAGS) $@ > $(@:.o=.s)

$(BUILD_DIR)/src/libultra/libc/ll.o: src/libultra/libc/ll.c
	$(CC_CHECK) $<
	$(CC) -c $(CFLAGS) $(MIPS_VERSION) $(OPTFLAGS) -MMD -MF $(basename $@).d  -o $@ $<
	$(PYTHON) tools/set_o32abi_bit.py $@
	@$(OBJDUMP) $(OBJDUMP_FLAGS) $@ > $(@:.o=.s)

$(BUILD_DIR)/src/libultra/libc/llcvt.o: src/libultra/libc/llcvt.c
	$(CC_CHECK) $<
	$(CC) -c $(CFLAGS) $(MIPS_VERSION) $(OPTFLAGS) -MMD -MF $(basename $@).d  -o $@ $<
	$(PYTHON) tools/set_o32abi_bit.py $@
	@$(OBJDUMP) $(OBJDUMP_FLAGS) $@ > $(@:.o=.s)

$(BUILD_DIR)/src/overlays/%_reloc.o: $(BUILD_DIR)/$(SPEC)
	$(FADO) $$(tools/reloc_prereq $< $(notdir $*)) -n $(notdir $*) -o $(@:.o=.s) -M $(@:.o=.d)
	$(AS) $(ASFLAGS) $(@:.o=.s) -o $@

$(BUILD_DIR)/%.inc.c: %.png
	$(ZAPD) btex -eh -tt $(subst .,,$(suffix $*)) -i $< -o $@

$(BUILD_DIR)/assets/%.bin.inc.c: assets/%.bin
	$(ZAPD) bblb -eh -i $< -o $@

$(BUILD_DIR)/assets/%.jpg.inc.c: assets/%.jpg
	$(ZAPD) bren -eh -i $< -o $@

-include $(DEP_FILES)

# Print target for debugging
print-% : ; $(info $* is a $(flavor $*) variable set to [$($*)]) @true
