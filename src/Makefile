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
SRCS = $(SRCS_C)
OBJS = $(SRCS_C:.c=.o)

## TODO add README
AUX = LICENSE

.ONESHELL:

.SUFFIXES: .c .h .o

.PHONY: all
all: $(TARGET)

.PHONY: install
install: all
	$(INSTALL) $(TARGET) $(bindir)/$(TARGET)

## TODO support tags other than ctags
.PHONY: TAGS tags ctags
TAGS: ctags

tags: TAGS

ctags: $(SRCS)
	ctags $^

.PHONY: clean distclean cleantags realclean
clean:
	rm -f *.o

## TODO add dist rule, and clean its products here
distclean: clean

## TODO include tags other than ctags
cleantags:
	rm -f tags
	
realclean: clean distclean cleantags
	rm -f $(TARGET)
	rm -f *.swp

.c.o:
	$(CC) -c -x$(LANG) -std=$(STD) $(CPPFLAGS) $(CFLAGS) $< -o $@

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) $^ $(LIBS) -o $@

