MAKEFLAGS += --no-buildtin-rules
LATEX= context
NAMEFOLDER=Report
NAMETARGET=Report
NAMEGET=./$(NAMEFOLDER)/$(NAMETARGET)

#LaTeX Macro
MACROTEX = .Macro.tex
LANG = english

.PHONY: all clean mr.washee 
.SUFFIXES:

all: $(NAMEGET).pdf clean

#3 fois car on veut la version final du rapport
$(NAMEGET).pdf: $(NAMEGET).tex figure
	echo "\def\langparam{$(LANG)}">./$(NAMEFOLDER)/$(MACROTEX)
	pdflatex $<
	bibtex $(NAMETARGET).aux
	pdflatex $<
	pdflatex $<

figure:
	$(MAKE) -C ./Figures/


clean:
	-rm -vf *.aux
	-rm -vf *.toc
	-rm -vf *.log
	-rm -vf *.bbl
	-rm -vf *.blg	
	@echo "finnish the clean"

mr.washee: clean
	rm -vf $(NAMEGET).pdf
	$(MAKE) -C ./Figures/ $@
