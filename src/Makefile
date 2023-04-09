#!/usr/bin/make -f

SHELL = /bin/sh

topdir = ..
srcdir = $(topdir)/src

CC = clang
INSTALL = /usr/local/bin/install -c
INSTALLDATA = /usr/local/bin/install -c -m 644

LANG = c
STD = c11
CDEBUG = -g
CFLAGS = $(CDEBUG) -Wall -pedantic -O2
DEFS = -DDEBUG
CPPFLAGS = -I. -I$(srcdir) -I$(topdir)/include $(DEFS)
LDFLAGS = 

LIBS =

prefix = /usr/local
binprefix = 

bindir = $(prefix)/bin

SRCS_C = main.c
SRCS = $(SRCS_C)
OBJS = $(SRCS_C:.c=.o)

## add README and LICENSE to this
AUX = LICENSE

.ONESHELL:

.EXPORT_ALL_VARIABLES:

.SUFFIXES:
.SUFFIXES: .c .h .o

.cpp.o:
	$(CC) -c -x$(LANG) -std=$(STD) $(CPPFLAGS) $(CFLAGS) $< -o $@

.PHONY: all
all: bitwise

.PHONY: install
install: all
	$(INSTALL) bitwise $(bindir)/$(binprefix)bitwise

.PHONY: TAGS tags
TAGS: $(SRCS)
	ctags $^

tags: TAGS

.PHONY: clean realclean distclean
clean:
	rm -f *.o

realclean: clean
	rm -f bitwise TAGS tags

distclean: realclean
	rm -f *.swp

bitwise: $(OBJS)
	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) $^ $(LIBS) -o $@

main.o:

