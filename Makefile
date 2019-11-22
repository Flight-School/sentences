SHELL = /bin/bash

prefix ?= /usr/local
bindir ?= $(prefix)/bin
libdir ?= $(prefix)/lib
srcdir = Sources

REPODIR = $(shell pwd)
BUILDDIR = $(REPODIR)/.build
SOURCES = $(wildcard $(srcdir)/**/*.swift)

.DEFAULT_GOAL = all

.PHONY: all
all: sentences

.PHONY: sentences
sentences: $(SOURCES)
	@swift build \
		-c release \
		--disable-sandbox \
		--build-path "$(BUILDDIR)"

.PHONY: install
install: sentences
	@install -d "$(bindir)" "$(libdir)"
	@install "$(BUILDDIR)/release/sentences" "$(bindir)"

.PHONY: uninstall
uninstall:
	@rm -rf "$(bindir)/sentences"

.PHONY: clean
distclean:
	@rm -rf $(BUILDDIR)/release

.PHONY: clean
clean: distclean
	@rm -rf $(BUILDDIR)
