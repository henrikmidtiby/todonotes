test: \
	clean \
	testsuite

testsuite: \
	plain.pdf \
	danish.pdf \
	german.pdf \
	colorinlistoftodos.pdf \
	disable.pdf \
	dvistyle.pdf \

%.pdf: \
	%.tex
	@echo "==============================="
	@echo "Compiling $*.tex"
	@pdflatex -halt-on-error $*.tex > $*.pdf.log
	@pdflatex -halt-on-error $*.tex > $*.pdf.log
	@echo "Compilation succeded"
	@echo 

clean: 
	@rm -f *.pdf
	@rm -f *.out
	@rm -f *.tdo
	@rm -f *.aux
	@rm -f *.log

