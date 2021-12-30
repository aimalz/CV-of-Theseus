RM = /bin/rm -fv

.SUFFIXES: .tex .dvi .ps .pdf

# ALLFILES = $(patsubst %.tex,%.pdf,$(wildcard *.tex))
all: malz_cv.pdf pubs.pdf

malz_cv.pdf: malz_cv.tex publist.tex defs.tex
pubs.pdf: pubs.tex publist.tex defs.tex

%.pdf: %.tex
	pdflatex $*
	bash -c " ( grep Rerun $*.log && pdflatex $* ) || echo noRerun "
	bash -c " ( grep Rerun $*.log && pdflatex $* ) || echo noRerun "

clean:
	$(RM) *.log *.aux *.dvi *.toc *.bbl *.blg

spotless: clean
	$(RM) *.ps *.pdf
