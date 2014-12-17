MAKEFLAGS += --no-buildtin-rules
LATEX= context
NAMEGET=./Rapport/Rapport


.PHONY: all clean mr.washee 
.SUFFIXES:

all: $(NAMEGET).pdf clean

#3 fois car on veut la version final du rapport
$(NAMEGET).pdf: $(NAMEGET).tex figure
	pdflatex $<
	bibtex Rapport.aux
	pdflatex $<
	pdflatex $<

figure:
	$(MAKE) -C ./figures/


clean:
	-rm -vf *.aux
	-rm -vf *.toc
	-rm -vf *.log
	-rm -vf *.bbl
	-rm -vf *.blg	
	@echo "finnish the clean"

mr.washee: clean
	rm -vf $(NAMEGET).pdf
	$(MAKE) -C ./figures/ $@
