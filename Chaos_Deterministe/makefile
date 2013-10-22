#Esquisse du futur makefile
RAP=Rapport

#all: figure context latex
all: latex

latex: buildlatex cleanlatex

context: buildcontext cleancontext

figure:
	gnuplot figures.gnuplot	

#3 fois car on veut la version final du rapport
buildlatex:
	pdflatex $(RAP).tex;
	pdflatex $(RAP).tex;
	pdflatex $(RAP).tex;

buildcontext:
	cd ./figures;context *.tex;


clean: cleanlatex cleancontext cleanfigure
	@echo "finnish the clean"

cleanlatex:
	rm -vf $(RAP).aux $(RAP).toc $(RAP).log

cleancontext:
	cd ./figures;rm -vf *.tuc; rm -vf *.log; rm -vf *.tmp;

cleanfigure:
	rm -vf ./figures/*.tex
	rm -vf ./figures/*.pdf
