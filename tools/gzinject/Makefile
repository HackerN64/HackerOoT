CC		= gcc
LD		= gcc
INSTALL		= /usr/bin/install -c
CFLAGS		= -Wall -Wno-unused-result -O3 -maes -msse -msse2
CPPFLAGS		= -DFASTAES
prefix 		= /usr/local
exec_prefix 	= ${prefix}
bindir		= ${exec_prefix}/bin
PROGNAME	= gzinject
LDFLAGS		= -s 
CFILES		= *.c
SRCDIR		= src
CSRC	   	:= $(foreach s,$(CFILES),$(wildcard $(SRCDIR)/$(s)))
COBJ		= $(patsubst $(SRCDIR)/%,$(OBJDIR)/%.o,$(CSRC))
LIBS		=
OBJDIR		= obj
OUTDIR		= $(OBJDIR)

.PHONY		: all install clean distclean

all		:	$(PROGNAME)

clean		:
	rm -rf $(PROGNAME) obj

distclean	:	clean
	rm -f Makefile

install		:	$(PROGNAME)
	$(INSTALL) -p -D --target-directory=$(DESTDIR)$(bindir) $(PROGNAME)

$(PROGNAME)	:	$(COBJ)
	$(LD) $(LDFLAGS) $^ -o $@ $(LIBS)

$(OUTDIR)   	:
	mkdir -p $@

$(COBJ)	 	:	$(OBJDIR)/%.o: $(SRCDIR)/% | $(OBJDIR)
	$(CC) -c $(CPPFLAGS) $(CFLAGS) $< -o $@
