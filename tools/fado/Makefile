MAKEFLAGS += --no-builtin-rules --no-print-directory

DEBUG       ?= 0
LLD         ?= 0
ASAN        ?= 0
EXPERIMENTAL?= 0

ELF         := fado.elf

CC          := $(shell ./find_program.sh gcc clang clang-[0-9][0-9] clang-[0-9])
LD          := $(shell ./find_program.sh ld ld.lld ld.lld-*)
INC         := -I include -I lib
WARNINGS    := -Wall -Wextra -Wpedantic -Wshadow -Werror=implicit-function-declaration -Wvla -Wno-unused-function 
CFLAGS      := -std=c11
LDFLAGS     := 

ifeq ($(DEBUG),0)
  OPTFLAGS  := -O2
  CFLAGS    += -Werror
else
  OPTFLAGS  := -O0 -g3 -DDEBUG_ON
endif

ifneq ($(ASAN),0)
  CFLAGS    += -fsanitize=address -fsanitize=pointer-compare -fsanitize=pointer-subtract -fsanitize=undefined
endif

ifneq ($(EXPERIMENTAL),0)
  CFLAGS    += -DEXPERIMENTAL
endif

# GCC is too stupid to be trusted with these warnings
ifeq ($(CC),gcc)
  WARNINGS += -Wno-implicit-fallthrough -Wno-maybe-uninitialized
endif

SRC_DIRS    := $(shell find src -type d)
C_FILES     := $(foreach dir,$(SRC_DIRS),$(wildcard $(dir)/*.c))
H_FILES     := $(foreach dir,$(INC),$(wildcard $(dir)/*.h))
O_FILES     := $(foreach f,$(C_FILES:.c=.o),build/$f)

LIB_DIRS    := $(shell find lib -type d)
# exclude test file since we don't want it
C_LIB_FILES := $(filter-out lib/vc_vector/vc_vector_test.c, $(foreach dir,$(LIB_DIRS),$(wildcard $(dir)/*.c)))
O_LIB_FILES := $(foreach f,$(C_LIB_FILES:.c=.o),build/$f)

-include ../print_rules.mk

# Main targets
all: $(ELF)

clean:
	$(V)$(RM) -r build $(ELF)

format:
	$(V)clang-format-14 -i $(C_FILES) $(H_FILES) lib/fairy/*

.PHONY: all clean format

# create build directories
$(shell mkdir -p $(foreach dir,$(SRC_DIRS),build/$(dir)) $(foreach dir,$(LIB_DIRS),build/$(dir)))

$(ELF): $(O_FILES) $(O_LIB_FILES)
	$(V)$(CC) $(INC) $(WARNINGS) $(CFLAGS) $(OPTFLAGS) $(LDFLAGS) -o $@ $^

build/%.o: %.c $(H_FILES)
	$(call print_two_args,Compiling:,$<,$@)
	$(V)$(CC) -c $(INC) $(WARNINGS) $(CFLAGS) $(OPTFLAGS) -o $@ $<

build/lib/%.o: lib/%.c
	$(call print_two_args,Compiling:,$<,$@)
	$(V)$(CC) -c $(INC) $(WARNINGS) $(CFLAGS) $(OPTFLAGS) -o $@ $<
