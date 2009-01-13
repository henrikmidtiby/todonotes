CLEAN := \
	danish.pdf \

testsuite: \
	danish.pdf \
	german.pdf \
	colorinlistoftodos.pdf \
	disable.pdf \

%.pdf: \
	%.tex
	pdflatex $*.tex
	pdflatex $*.tex

clean: 
	@rm -f *.pdf
	@rm -f *.out
	@rm -f *.tdo
	@rm -f *.aux
	@rm -f *.log

