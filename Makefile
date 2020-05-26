# -----------------------------------------
# Makefile for cover letter, cv, research statement and list of publications
# -----------------------------------------
TEXFILE = eprint

TEX=latex
DVIPS=dvips
PS2PDF=ps2pdf
BIBTEX=bibtex

SOURCES         = $(wildcard ./*.tex)
BIBFILE         = $(widlcard ./*.bbl)
EPSFIGURES      = $(wildcard figures/*.eps)

all: ${TEXFILE}.pdf

${TEXFILE}.pdf: ${TEXFILE}.ps
	$(PS2PDF) -sPAPERSIZE=a4 ${TEXFILE}.ps

${TEXFILE}.ps: ${TEXFILE}.dvi
	$(DVIPS) -ta4 ${TEXFILE}.dvi -o ${TEXFILE}.ps

${TEXFILE}.bbl: ${TEXFILE}.bib
	$(BIBTEX) ${TEXFILE}

${TEXFILE}.dvi: ${SOURCES} ${EPSFIGURES} ${BIBFILE}
	$(TEX) ${TEXFILE}.tex
	$(TEX) ${TEXFILE}.tex && $(TEX) ${TEXFILE}.tex 

clean:
	rm -f ${TEXFILE}.ps ${TEXFILE}.dvi ${TEXFILE}.aux *.log ${TEXFILE}.pdf ${TEXFILE}.bbl *.out *.toc ${TEXFILE}.blg *~
