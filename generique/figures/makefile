MAKEFLAGS += --no-buildtin-rules
LATEX= context
SOURCES=$(wildcard *.tex)
TARGETS = $(SOURCES:%.tex=%.pdf)


.PHONY: all figure figure.pdf clean mr.washee
.SUFFIXES:

all: figure $(TARGETS) clean

figure: gnuplot.log

gnuplot.log:
	gnuplot figures.gnuplot | tee gnuplot.log
	$(MAKE)
#	$(MAKEFLAGS) wierd w written :S

%.pdf : %.tex gnuplot.log
	@echo $(LATEX) $<
	@$(LATEX) $< >/dev/null
	@-rm -vf $(<:%.tex=%.tuc)
	@-rm -vf $(<:%.tex=%.log)
	@-rm -vf $(<:%.tex=%.tmp)
	@-rm -vf $(<:%.tex=%.top)


clean:
	-rm -vf *.tuc
	-rm -vf *.tmp
	-rm -vf *.top

mr.washee: clean
	-rm -vf *.log
	-rm -vf *.tex
	-rm -vf *.pdf
