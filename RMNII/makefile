MAKEFLAGS += --no-buildtin-rules
LATEX= context
NAMEGET=Rapport


.PHONY: all clean mr.washee 
.SUFFIXES:

all: Rapport.pdf

#3 fois car on veut la version final du rapport
$(NAMEGET).pdf: $(NAMEGET).tex figure
	pdflatex $<
	pdflatex $<
	pdflatex $<

figure:
	$(MAKE) -C ./figures/


clean:
	-rm -vf *.aux
	-rm -vf *.toc
	-rm -vf *.log
	@echo "finnish the clean"

mr.washee: clean
	rm -vf $(NAMEGET).pdf
	$(MAKE) -C ./figures/ $@
