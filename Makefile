
SOURCES = report.tex \
          pkgs.tex \
          defs.tex \
          titlepage.tex \
          intro.tex \
          analysis.tex \
          code.tex \
          data.tex \
          materials.tex \
          summary.tex \
          refs.tex \
          refs.bib

report.pdf: ${SOURCES}
	pdflatex report.tex
	bibtex prod.aux
	bibtex ref.aux
	pdflatex report.tex
	pdflatex report.tex

force:
	pdflatex report.tex
	bibtex prod.aux
	bibtex ref.aux
	pdflatex report.tex
	pdflatex report.tex

check: report.pdf
	pdflatex report.tex | grep Citation | sort

clean:
	rm -f *.lo[fgt] *.toc *.bbl *.blg *.ist *.glo *.aux *.acn *.out report.pdf
