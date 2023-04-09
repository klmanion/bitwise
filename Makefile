#!/usr/bin/make -f

SHELL=/bin/sh

TARGET = bitwise

topdir = $(PWD)
srcdir = $(topdir)/src
builddir = $(topdir)/build

prefix = /usr/local

bindir = $(prefix)/bin
datadir = $(prefix)/share
sysconfdir = $(prefix)/etc
localstatedir = $(prefix)/var
docdir = $(datadir)/doc

man1ext = .1
man3ext = .3
manext = .1

.ONESHELL:

.EXPORT_ALL_VARIABLES:

.SUFFIXES:

.PHONY: all
all:
	$(MAKE) -C $(srcdir) all

.PHONY: $(TARGET)
$(TARGET):
	$(MAKE) -C $(srcdir) $(TARGET)

.PHONY: install
install:
	$(MAKE) -C $(srcdir) install

.PHONY: TAGS tags ctags
TAGS:
	$(MAKE) -C $(srcdir) TAGS

tags:
	$(MAKE) -C $(srcdir) tags

ctags:
	$(MAKE) -C $(srcdir) ctags

.PHONY: clean distclean cleantags realclean
clean:
	rm -rf *.dSYM
	$(MAKE) -C $(srcdir) clean

distclean:
	$(MAKE) -C $(srcdir) distclean

cleantags:
	$(MAKE) -C $(srcdir) cleantags

realclean:
	$(MAKE) -C $(srcdir) realclean

