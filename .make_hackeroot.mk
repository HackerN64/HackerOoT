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
