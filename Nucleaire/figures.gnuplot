figuresdir = './figures/'
datadir = './data/'

set terminal context standalone


set output figuresdir.'Spectrumcal.tex'
f(x)=a*x+b
fit f(x) datadir."calibration.dat" using 2:3 via a,b
plot datadir."calibration.dat" using 2:3, f(x) lc rgb "blue"


slope=2.93

set output figuresdir.'Co57.tex'
plot[*:100*slope][0:100000] datadir."Co57.TKA" using ($0*slope):($1)

set output figuresdir.'Co60.tex'
plot datadir."Co60.TKA" using ($0*slope):($1)

set output figuresdir.'Cs137.tex'
plot[*:800] datadir."Cs137.TKA" using ($0*slope):($1)

set output figuresdir.'Hf181.tex'
plot[*:250*slope][0:300000] datadir."Hf181.TKA" using ($0*slope):($1)

set output figuresdir.'Na22.tex'
plot[*:500*slope][0:300] datadir."Na22.TKA" using ($0*slope):($1)

set output figuresdir.'Pb120.tex'
plot[*:40*slope] datadir."Pb120.TKA" using ($0*slope):($1)

set xtics out nomirror offset 2.2,0

set output figuresdir.'Poisson_5ms.tex'
set style data histogram
set style histogram cluster gap 0
set style fill solid border -1
set boxwidth 0.8

poisson(x,mu)=mu**int(x)/int(x)!*exp(-mu)*512
xRg=14

plot[*:xRg] "< ./data/fill-in.sh ./data/Poisson_5ms.TKA ".xRg using ($1-1):xtic(2) notitle, poisson(x,6) lc rgb "blue"

set output figuresdir.'Poisson_6ms.tex'
set style data histogram
set style histogram cluster gap 0
set style fill solid border -1
set boxwidth 0.8


xRg=17

plot[*:xRg] "< ./data/fill-in.sh ./data/Poisson_6ms.TKA ".xRg using ($1-1):xtic(2) notitle, poisson(x,8) lc rgb "blue"


set output figuresdir.'Poisson_7ms.tex'
set style data histogram
set style histogram cluster gap 0
set style fill solid border -1
set boxwidth 0.8


xRg=18

plot[*:xRg] "< ./data/fill-in.sh ./data/Poisson_7ms.TKA ".xRg using ($1-1):xtic(2) notitle, poisson(x,9) lc rgb "blue"

set output figuresdir.'Poisson_8ms.tex'
set style data histogram
set style histogram cluster gap 0
set style fill solid border -1
set boxwidth 0.8



xRg=20

plot[*:xRg] "< ./data/fill-in.sh ./data/Poisson_8ms.TKA ".xRg using ($1-1):xtic(2) notitle, poisson(x,10) lc rgb "blue"

set output figuresdir.'Poisson_9ms.tex'
set style data histogram
set style histogram cluster gap 0
set style fill solid border -1
set boxwidth 0.8


xRg=21

plot[*:xRg] "< ./data/fill-in.sh ./data/Poisson_9ms.TKA ".xRg using ($1-1):xtic(2) notitle, poisson(x,11) lc rgb "blue"



set output figuresdir.'Poisson_10ms.tex'
set style data histogram
set style histogram cluster gap 0
set style fill solid border -1
set boxwidth 0.8


xRg=24

plot[*:xRg] "< ./data/fill-in.sh ./data/Poisson_10ms.TKA ".xRg using ($1-1):xtic(2) notitle, poisson(x,12) lc rgb "blue"


set output figuresdir.'Poisson_15ms.tex'
set style data histogram
set style histogram cluster gap 0
set style fill solid border -1
set boxwidth 0.8


xRg=30

plot[*:xRg] "< ./data/fill-in.sh ./data/Poisson_15ms.TKA ".xRg using ($1-1):xtic(2) notitle, poisson(x,18) lc rgb "blue"

set output figuresdir.'Poisson_20ms.tex'
set style data histogram
set style histogram cluster gap 0
set style fill solid border -1
set boxwidth 0.8


xRg=40

plot[*:xRg] "< ./data/fill-in.sh ./data/Poisson_20ms.TKA ".xRg using ($1-1):xtic(2) notitle, poisson(x,24) lc rgb "blue"
