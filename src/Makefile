#!/usr/bin/make -f

CC = clang
LEX = /usr/bin/flex
YACC = /usr/bin/bison -d

INSTALL = /usr/local/bin/install -c
INSTALLDATA = /usr/local/bin/install -c -m 644

LANG = c
STD = c17

CDEBUG = -g
WARN = -Wall -pedantic
OPTIM = -O2
CFLAGS = $(CDEBUG) $(WARN) $(OPTIM)
DEFS = -D_POSIX_C_SOURCE
## _POSIX_C_SOURCE needed to get fileno() from stdio
##	eliminates warning from produced lex.yy.c
CPPFLAGS = -I$(srcdir) -I$(topdir)/include $(DEFS)
LDFLAGS =

LIBS =

LFLAGS =

SRCS_L = lex.l
SRCS_Y = parse.y
SRCS_C = main.c bitwise.c $(SRCS_L:.l=.yy.c) $(SRCS_Y:.y=.tab.c)

SRCS = $(addprefix $(srcdir)/, $(SRCS_C))
OBJS = $(addprefix $(objdir)/, $(SRCS_C:.c=.o))

## TODO add README
AUX = LICENSE

.ONESHELL:

.SUFFIXES: .c .h .o .l .y

.PHONY: all
all: DIRS $(TARGET)

.PHONY: install
install: all
	$(INSTALL) $(builddir)/$(TARGET) $(bindir)/$(TARGET)

.PHONY: DIRS
DIRS:
	mkdir -p $(objdir)
	mkdir -p $(builddir)

## TODO support tags other than ctags
.PHONY: TAGS tags ctags
TAGS: ctags

tags: TAGS

ctags: $(SRCS)
	ctags $^

.PHONY: clean distclean cleantags realclean
## TODO remove lex.yy.c properly
clean:
	rm -f $(OBJS)
	rm -f *.yy.c *.yy.h
	rm -f *.tab.c *.tab.h

## TODO add dist rule, and clean its products here
distclean: clean

## TODO include tags other than ctags
cleantags:
	rm -f tags

cleandirs:
	rm -rf $(objdir)
	rm -rf $(builddir)
	
realclean: clean distclean cleantags cleandirs
	rm -rf $(builddir)
	rm -rf $(objdir)
	rm -f *.swp

$(objdir)/%.o: $(srcdir)/%.c
	$(CC) -c -x$(LANG) -std=$(STD) $(CPPFLAGS) $(CFLAGS) $< -o $@

$(srcdir)/%.yy.c: $(srcdir)/%.l
	$(LEX) $(LFLAGS) --header-file=$(<:.l=.yy.h) $<

$(srcdir)/%.tab.c: $(srcdir)/%.y
	$(YACC) $(YFLAGS) $<

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) $^ $(LIBS) -o $(builddir)/$@

$(objdir)/main.o: $(addprefix $(objdir)/, bitwise.o lex.yy.o parse.tab.o)

$(srcdir)/lex.yy.c: $(srcdir)/parse.tab.c

$(objdir)/lex.yy.o: $(addprefix $(objdir)/, bitwise.o parse.tab.o)

