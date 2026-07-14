# Makefile for chemfigtut.tex
#
# Copyright (C) 2022--2026 José A. Navarro Ramón <janr.devel@gmail.com>
# Licencia del código GPLv2
# Licencia Creative Commons Recognition Non-Commercial Share-alike.
# (CC-BY-NC-SA)


TARGET = chemfigtut

IMGSTATICDIR=img/static

FILES =	chemfigtut.pkg.sty\
	chemfigtut.defs.sty\
	portada.tex\
	$(IMGSTATICDIR)/Cc-by-nc-sa_icon.pdf

$(TARGET).pdf: $(TARGET).tex $(FILES)

%.pdf:	%.tex
	lualatex --shell-escape $<
	lualatex --shell-escape $<

$(IMGSTATICDIR)/%.pdf: $(IMGSTATICDIR)/%.svg
	inkscape $< -o $@ --export-ignore-filters --export-ps-level=3

all: $(TARGET).pdf

.PHONY: clean

clean:
	rm -rf *.pdf *.ps *.dvi *.aux *.log *.toc *.out dat*~ *.dat *.script
	rm -rf auto
	rm -rf texto/*.aux texto/*~ texto/auto


