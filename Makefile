
SOURCES = report.tex \
          pkgs.tex \
          defs.tex \
          titlepage.tex \
          intro.tex \
          analysis.tex 
          # thrust1.tex \
          # thrust2.tex \
          # thrust3.tex \
          # thrust4.tex \
          # thrust5.tex \
          # summary.tex \
          # refs.tex \
          # refs.bib

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
	rm -f *.log *.ist *.glo *.aux *.acn *.out report.pdf
