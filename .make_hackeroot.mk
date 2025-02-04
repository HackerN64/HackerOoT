# Set prefix to mips binutils binaries (mips-linux-gnu-ld => 'mips-linux-gnu-') - Change at your own risk!
# In nearly all cases, not having 'mips-linux-gnu-*' binaries on the PATH is indicative of missing dependencies

# Returns the path to the command $(1) if exists. Otherwise returns an empty string.
find-command = $(shell which $(1) 2>/dev/null)

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

-include tools/print_rules.mk

# Enable optimization flags to use GDB on Ares
ARES_GDB := 1

# Toggle release or debug mode. 1=Release, 0=Debug
# Note: currently only used for HackerOoT
RELEASE := 0

# Valid compression algorithms are 'yaz', 'lzo' and 'aplib'
COMPRESSION ?= yaz
COMPRESSION_TYPE ?= $(shell echo $(COMPRESSION) | tr '[:lower:]' '[:upper:]')

# Platform compatibility flags
TARGET ?=

ifeq ($(TARGET),wad)
CFLAGS := -DCONSOLE_WIIVC -fno-reorder-blocks -fno-optimize-sibling-calls
CPPFLAGS := -DCONSOLE_WIIVC
else ifeq ($(TARGET),iso)
CFLAGS := -DCONSOLE_GC -fno-reorder-blocks -fno-optimize-sibling-calls
CPPFLAGS := -DCONSOLE_GC
endif

### SummerCart64 Settings ###

# path to the deployer program
SC64_DEPLOYER ?=

# upload the build
sc64: rom
ifeq ($(SC64_DEPLOYER),)
	$(error sc64deployer path not set. Set SC64_DEPLOYER in the Makefile or define it as an environment variable)
endif
	$(SC64_DEPLOYER) upload $(ROM)
	$(SC64_DEPLOYER) debug --isv 0x03FF0000

# same as above and start listening to the IS-Viewer
sc64v: sc64
	$(SC64_DEPLOYER) debug --isv 0x03FF0000
