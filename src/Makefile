#!/usr/bin/make -f

CC = clang
LEX = /usr/bin/flex
YACC = /usr/bin/bison

INSTALL = /usr/local/bin/install -c
INSTALLDATA = /usr/local/bin/install -c -m 644

LANG = c
STD = c17

CDEBUG = -g
WARN = -Wall -pedantic
OPTIM = -O2
CFLAGS = $(CDEBUG) $(WARN) $(OPTIM)
DEFS =
CPPFLAGS = -I$(srcdir) -I$(topdir)/include $(DEFS)
LDFLAGS =

LIBS =

SRCS_C = main.c

SRCS = $(addprefix $(srcdir)/, $(SRCS_C))
OBJS = $(addprefix $(objdir)/, $(SRCS_C:.c=.o))

## TODO add README
AUX = LICENSE

.ONESHELL:

.SUFFIXES: .c .h .o

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
clean:
	rm -f $(OBJS)

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

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) $^ $(LIBS) -o $(builddir)/$@

## FIXME DEBUG
main.o: foo.o

