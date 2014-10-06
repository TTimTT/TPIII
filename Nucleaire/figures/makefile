MAKEFLAGS += --no-buildtin-rules
LATEX= context
SOURCES=$(wildcard *.tex)
TARGETS = $(SOURCES:%.tex=%.pdf)

to-md5 = $1 $(addsuffix .md5,$1)

.PHONY: all gnuplot clean mr.washee
.SUFFIXES:

all: gnuplot $(TARGETS) clean

gnuplot:
	@if test -f figures.gnuplot.md5 && md5sum -c --quiet --status figures.gnuplot.md5 ; then \
		echo "GNUplot is up-to-date"; \
	else \
		echo "GNUplot Compilation"; \
		gnuplot figures.gnuplot; \
		md5sum figures.gnuplot > figures.gnuplot.md5; \
		$(MAKE); \
	fi
 
%.pdf: %.tex
	@if test -f $<.md5 && md5sum -c --quiet --status $<.md5 ; then \
		echo "Dont need to recompile " $<; \
	else \
		echo "test" $<; \
		md5sum $< > $<.md5; \
		echo $(LATEX) $<; \
		$(LATEX) $< >/dev/null; \
		rm -vf $(<:%.tex=%.tuc); \
		rm -vf $(<:%.tex=%.log); \
		rm -vf $(<:%.tex=%.tmp); \
		rm -vf $(<:%.tex=%.top); \
	fi

%.tex:
	echo "here in %.tex"

#%.md5:
#	@if test -f $@ && md5sum -c --quiet --status $@ ; then \
#		echo "Dont need to recompile tex"; \
#	else \
#		echo "test"; \
#		md5sum $(basename $@) > $@; \
#	fi

clean:
	-rm -vf *.tuc
	-rm -vf *.tmp
	-rm -vf *.top

mr.washee: clean
	-rm -vf *.log
	-rm -vf *.tex
	-rm -vf *.pdf
	-rm -vf *.md5
	
