-include ../../print_rules.mk

CFLAGS := -Wall -Werror -O3

ifeq ($(shell $(CC) --version | grep clang),)
  OMPFLAGS := -fopenmp
else
  OMPFLAGS :=
endif

default: build_from_png

clean:
	$(V)$(RM) build_from_png

.PHONY: default clean

build_from_png: build_from_png.c ../n64texconv/libn64texconv.a
	$(V)$(CC) $(CFLAGS) -o $@ $^ $(OMPFLAGS) -lz -lm
