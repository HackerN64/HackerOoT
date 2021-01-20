MAKEFLAGS += --no-builtin-rules

# Build options can either be changed by modifying the makefile, or by building with 'make SETTING=value'

# If COMPARE is 1, check the output md5sum after building
COMPARE ?= 1
# If NON_MATCHING is 1, define the NON_MATCHING C flag when building
NON_MATCHING ?= 0
# If ORIG_COMPILER is 1, compile with QEMU_IRIX and the original compiler
ORIG_COMPILER ?= 0

ifeq ($(NON_MATCHING),1)
  CFLAGS := -DNON_MATCHING
  CPPFLAGS := -DNON_MATCHING
  COMPARE := 0
endif

PROJECT_DIR := $(dir $(realpath $(firstword $(MAKEFILE_LIST))))

MAKE = make
CPPFLAGS += -P

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
ifeq ($(shell type mips-linux-gnu-ld >/dev/null 2>/dev/null; echo $$?), 0)
  MIPS_BINUTILS_PREFIX := mips-linux-gnu-
else
  $(error Please install or build mips-linux-gnu)
endif

CC       := tools/ido_recomp/$(DETECTED_OS)/7.1/cc
CC_OLD   := tools/ido_recomp/$(DETECTED_OS)/5.3/cc

# if ORIG_COMPILER is 1, check that either QEMU_IRIX is set or qemu-irix package installed
ifeq ($(ORIG_COMPILER),1)
  ifndef QEMU_IRIX
    QEMU_IRIX := $(shell which qemu-irix)
    ifeq (, $(QEMU_IRIX))
      $(error Please install qemu-irix package or set QEMU_IRIX env var to the full qemu-irix binary path)
    endif
  endif
  CC        = $(QEMU_IRIX) -L tools/ido7.1_compiler tools/ido7.1_compiler/usr/bin/cc
  CC_OLD    = $(QEMU_IRIX) -L tools/ido5.3_compiler tools/ido5.3_compiler/usr/bin/cc
endif

AS         := $(MIPS_BINUTILS_PREFIX)as
LD         := $(MIPS_BINUTILS_PREFIX)ld
OBJCOPY    := $(MIPS_BINUTILS_PREFIX)objcopy
OBJDUMP    := $(MIPS_BINUTILS_PREFIX)objdump
EMULATOR = mupen64plus
EMU_FLAGS = --noosd

# Check code syntax with host compiler
CHECK_WARNINGS := -Wall -Wextra -Wno-format-security -Wno-unknown-pragmas -Wno-unused-parameter -Wno-unused-variable -Wno-missing-braces -Wno-int-conversion
CC_CHECK   := gcc -fno-builtin -fsyntax-only -fsigned-char -std=gnu90 -D _LANGUAGE_C -D NON_MATCHING -Iinclude -Isrc -Iassets -Ibuild -include stdarg.h $(CHECK_WARNINGS)

CPP        := cpp
MKLDSCRIPT := tools/mkldscript
ELF2ROM    := tools/elf2rom
ZAPD       := tools/ZAPD/ZAPD.out

OPTFLAGS := -O2
ASFLAGS := -march=vr4300 -32 -Iinclude
MIPS_VERSION := -mips2

# we support Microsoft extensions such as anonymous structs, which the compiler does support but warns for their usage. Surpress the warnings with -woff.
CFLAGS += -G 0 -non_shared -Xfullwarn -Xcpluscomm -Iinclude -Isrc -Iassets -Ibuild -Wab,-r4300_mul -woff 649,838,712

ifeq ($(shell getconf LONG_BIT), 32)
  # Work around memory allocation bug in QEMU
  export QEMU_GUEST_BASE := 1
else
  # Ensure that gcc treats the code as 32-bit
  CC_CHECK += -m32
endif

#### Files ####

# ROM image
ROM := zelda_ocarina_mq_dbg.z64
ELF := $(ROM:.z64=.elf)
# description of ROM segments
SPEC := spec

SRC_DIRS := $(shell find src -type d)
ASM_DIRS := $(shell find asm -type d -not -path "asm/non_matchings*") $(shell find data -type d)
ASSET_DIRS := assets/objects assets/textures assets/scenes assets/overlays
ASSET_BIN_DIRS := $(shell find assets/* -type d -not -path "assets/xml*")
ASSET_FILES_XML := $(foreach dir,$(ASSET_BIN_DIRS),$(wildcard $(dir)/*.xml))
ASSET_FILES_BIN := $(foreach dir,$(ASSET_BIN_DIRS),$(wildcard $(dir)/*.bin))
ASSET_FILES_OUT := $(foreach f,$(ASSET_FILES_XML:.xml=.c),$f) \
				   $(foreach f,$(ASSET_FILES_BIN:.bin=.bin.inc.c),build/$f)

TEXTURE_DIRS := assets/textures assets/scenes assets/objects assets/overlays

# source files
C_FILES       := $(foreach dir,$(SRC_DIRS) $(ASSET_BIN_DIRS),$(wildcard $(dir)/*.c))
S_FILES       := $(foreach dir,$(ASM_DIRS),$(wildcard $(dir)/*.s))
O_FILES       := $(foreach f,$(S_FILES:.s=.o),build/$f) \
                 $(foreach f,$(C_FILES:.c=.o),build/$f) \
                 $(foreach f,$(wildcard baserom/*),build/$f.o)

TEXTURE_BIN_DIRS := $(shell find assets/objects/* assets/textures/* assets/scenes/* assets/overlays/* -type d)

TEXTURE_FILES_RGBA32 := $(foreach dir,$(TEXTURE_BIN_DIRS),$(wildcard $(dir)/*.rgba32.png))
TEXTURE_FILES_RGBA16 := $(foreach dir,$(TEXTURE_BIN_DIRS),$(wildcard $(dir)/*.rgb5a1.png))
TEXTURE_FILES_GRAY4 := $(foreach dir,$(TEXTURE_BIN_DIRS),$(wildcard $(dir)/*.i4.png))
TEXTURE_FILES_GRAY8 := $(foreach dir,$(TEXTURE_BIN_DIRS),$(wildcard $(dir)/*.i8.png))
TEXTURE_FILES_GRAYA4 := $(foreach dir,$(TEXTURE_BIN_DIRS),$(wildcard $(dir)/*.ia4.png))
TEXTURE_FILES_GRAYA8 := $(foreach dir,$(TEXTURE_BIN_DIRS),$(wildcard $(dir)/*.ia8.png))
TEXTURE_FILES_GRAYA16 := $(foreach dir,$(TEXTURE_BIN_DIRS),$(wildcard $(dir)/*.ia16.png))
TEXTURE_FILES_CI4 := $(foreach dir,$(TEXTURE_BIN_DIRS),$(wildcard $(dir)/*.ci4.png))
TEXTURE_FILES_CI8 := $(foreach dir,$(TEXTURE_BIN_DIRS),$(wildcard $(dir)/*.ci8.png))
TEXTURE_FILES_OUT := $(foreach f,$(TEXTURE_FILES_RGBA32:.rgba32.png=.rgba32.inc.c),build/$f) \
					 $(foreach f,$(TEXTURE_FILES_RGBA16:.rgb5a1.png=.rgb5a1.inc.c),build/$f) \
					 $(foreach f,$(TEXTURE_FILES_GRAY4:.i4.png=.i4.inc.c),build/$f) \
					 $(foreach f,$(TEXTURE_FILES_GRAY8:.i8.png=.i8.inc.c),build/$f) \
					 $(foreach f,$(TEXTURE_FILES_GRAYA4:.ia4.png=.ia4.inc.c),build/$f) \
					 $(foreach f,$(TEXTURE_FILES_GRAYA8:.ia8.png=.ia8.inc.c),build/$f) \
					 $(foreach f,$(TEXTURE_FILES_GRAYA16:.ia16.png=.ia16.inc.c),build/$f) \
					 $(foreach f,$(TEXTURE_FILES_CI4:.ci4.png=.ci4.inc.c),build/$f) \
					 $(foreach f,$(TEXTURE_FILES_CI8:.ci8.png=.ci8.inc.c),build/$f) \

# create build directories
$(shell mkdir -p build/baserom $(foreach dir,$(SRC_DIRS) $(ASM_DIRS) $(TEXTURE_DIRS) $(ASSET_BIN_DIRS),build/$(dir)))

build/src/libultra_boot_O1/%.o: OPTFLAGS := -O1
build/src/libultra_boot_O2/%.o: OPTFLAGS := -O2
build/src/libultra_code_O1/%.o: OPTFLAGS := -O1
build/src/libultra_code_O2/%.o: OPTFLAGS := -O2
build/src/libultra_code_O2_g3/%.o: OPTFLAGS := -O2 -g3

build/src/libultra_code_O1/llcvt.o: MIPS_VERSION := -mips3 -32

build/src/code/fault.o: CFLAGS += -trapuv
build/src/code/fault.o: OPTFLAGS := -O2 -g3
build/src/code/fault_drawer.o: CFLAGS += -trapuv
build/src/code/fault_drawer.o: OPTFLAGS := -O2 -g3
build/src/code/ucode_disas.o: OPTFLAGS := -O2 -g3
build/src/code/code_801068B0.o: OPTFLAGS := -g
build/src/code/code_80106860.o: OPTFLAGS := -g
build/src/code/code_801067F0.o: OPTFLAGS := -g

build/src/libultra_boot_O1/%.o: CC := $(CC_OLD)
build/src/libultra_boot_O2/%.o: CC := $(CC_OLD)
build/src/libultra_code_O1/%.o: CC := python3 tools/asm_processor/build.py $(CC_OLD) -- $(AS) $(ASFLAGS) --
build/src/libultra_code_O2/%.o: CC := python3 tools/asm_processor/build.py $(CC_OLD) -- $(AS) $(ASFLAGS) --
build/src/libultra_code_O2_g3/%.o: CC := python3 tools/asm_processor/build.py $(CC_OLD) -- $(AS) $(ASFLAGS) --

build/src/code/jpegutils.o: CC := python3 tools/asm_processor/build.py $(CC_OLD) -- $(AS) $(ASFLAGS) --
build/src/code/jpegdecoder.o: CC := python3 tools/asm_processor/build.py $(CC_OLD) -- $(AS) $(ASFLAGS) --

build/src/boot/%.o: CC := python3 tools/asm_processor/build.py $(CC) -- $(AS) $(ASFLAGS) --
build/src/code/%.o: CC := python3 tools/asm_processor/build.py $(CC) -- $(AS) $(ASFLAGS) --
build/src/overlays/actors/%.o: CC := python3 tools/asm_processor/build.py $(CC) -- $(AS) $(ASFLAGS) --
build/src/overlays/effects/%.o: CC := python3 tools/asm_processor/build.py $(CC) -- $(AS) $(ASFLAGS) --
build/src/overlays/gamestates/%.o: CC := python3 tools/asm_processor/build.py $(CC) -- $(AS) $(ASFLAGS) --

#### Main Targets ###

all: $(ROM)
ifeq ($(COMPARE),1)
	@md5sum $(ROM)
	@md5sum -c checksum.md5
endif

$(ROM): $(ELF)
	$(ELF2ROM) -cic 6105 $< $@

$(ELF): $(TEXTURE_FILES_OUT) $(ASSET_FILES_OUT) $(O_FILES) build/ldscript.txt build/undefined_syms.txt
	$(LD) -T build/undefined_syms.txt -T build/ldscript.txt --no-check-sections --accept-unknown-input-arch --emit-relocs -Map build/z64.map -o $@

build/ldscript.txt: $(SPEC)
	$(CPP) $(CPPFLAGS) $< > build/spec
	$(MKLDSCRIPT) build/spec $@

build/undefined_syms.txt: undefined_syms.txt
	$(CPP) $(CPPFLAGS) $< > build/undefined_syms.txt

clean:
	$(RM) -r $(ROM) $(ELF) build

setup:
	$(MAKE) -C tools -j
	python3 fixbaserom.py
	python3 extract_baserom.py
	python3 extract_assets.py

resources: $(ASSET_FILES_OUT)
test: $(ROM)
	$(EMULATOR) $(EMU_FLAGS) $<

.PHONY: all clean setup test

#### Various Recipes ####

build/baserom/%.o: baserom/%
	$(OBJCOPY) -I binary -O elf32-big $< $@

build/asm/%.o: asm/%.s
	$(AS) $(ASFLAGS) $^ -o $@

build/data/%.o: data/%.s
	iconv --from UTF-8 --to EUC-JP $^ | $(AS) $(ASFLAGS) -o $@

build/assets/%.o: assets/%.c
	$(CC) -c $(CFLAGS) $(MIPS_VERSION) $(OPTFLAGS) -o $@ $^
	$(OBJCOPY) -O binary $@ $@.bin

build/src/overlays/%.o: src/overlays/%.c
	$(CC) -c $(CFLAGS) $(MIPS_VERSION) $(OPTFLAGS) -o $@ $^
	$(CC_CHECK) $^
	$(ZAPD) bovl -i $@ -cfg $^ --outputpath $(@D)/$(notdir $(@D))_reloc.s
	-test -f $(@D)/$(notdir $(@D))_reloc.s && $(AS) $(ASFLAGS) $(@D)/$(notdir $(@D))_reloc.s -o $(@D)/$(notdir $(@D))_reloc.o
	@$(OBJDUMP) -d $@ > $(@:.o=.s)

build/src/%.o: src/%.c
	$(CC) -c $(CFLAGS) $(MIPS_VERSION) $(OPTFLAGS) -o $@ $^
	$(CC_CHECK) $^
	@$(OBJDUMP) -d $@ > $(@:.o=.s)

build/src/libultra_code_O1/llcvt.o: src/libultra_code_O1/llcvt.c
	$(CC) -c $(CFLAGS) $(MIPS_VERSION) $(OPTFLAGS) -o $@ $^
	$(CC_CHECK) $^
	python3 tools/set_o32abi_bit.py $@
	@$(OBJDUMP) -d $@ > $(@:.o=.s)

assets/%.c: assets/%.xml
#	$(ZAPD) bsf -i $< -o $(dir $@)
	$(ZAPD) bsf -eh -i $< -o $(dir $<)
	$(CC) -c $(CFLAGS) $(MIPS_VERSION) $(OPTFLAGS) -o build/$(@:.c=.o) $@

build/%.rgba32.inc.c: %.rgba32.png
	$(ZAPD) btex -tt rgba32 -i $< -o $@

build/%.rgb5a1.inc.c: %.rgb5a1.png
	$(ZAPD) btex -tt rgb5a1 -i $< -o $@

build/%.i4.inc.c: %.i4.png
	$(ZAPD) btex -tt i4 -i $< -o $@

build/%.i8.inc.c: %.i8.png
	$(ZAPD) btex -tt i8 -i $< -o $@

build/%.ia4.inc.c: %.ia4.png
	$(ZAPD) btex -tt ia4 -i $< -o $@

build/%.ia8.inc.c: %.ia8.png
	$(ZAPD) btex -tt ia8 -i $< -o $@

build/%.ia16.inc.c: %.ia16.png
	$(ZAPD) btex -tt ia16 -i $< -o $@

build/%.ci4.inc.c: %.ci4.png
	$(ZAPD) btex -tt ci4 -i $< -o $@

build/%.ci8.inc.c: %.ci8.png
	$(ZAPD) btex -tt ci8 -i $< -o $@

build/assets/%.bin.inc.c: assets/%.bin
	$(ZAPD) bblb -i $< -o $@
