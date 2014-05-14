figuresdir = './'
datadir = '../data/'

set terminal context standalone


set output figuresdir.'Spectrumcal.tex'

set xlabel 'Channel'
set ylabel 'Energy [KeV]'

set key top left

f(x)=a*x+b
fit f(x) datadir."calibration.dat" using 2:3 via a,b
plot datadir."calibration.dat" using 2:3 notitle, f(x) lc rgb "blue" title 'Fit'

set output figuresdir.'Resolution.tex'

set xlabel '$\frac{1}{\sqrt{E}}$'
set ylabel '$\frac{\sigma_E}{E}$'

fit f(x) "< sort -h -k3 ../data/sig_energy.dat" using ($3/$2):(1/sqrt($2)) via a,b
plot "< sort -h -k3 ../data/sig_energy.dat" using ($3/$2):(1/sqrt($2)) notitle, f(x) title 'Fit'

set key top left

set xlabel 'Thickness [cm]'
set ylabel '$ln(N/t)$'

set output figuresdir.'Attenuation.tex'
f1(x)=a1*x+b1
f2(x)=a2*x+b2
fit f1(x) datadir."attenuation_alu.dat" using 2:(log($4/(18.30*$3))) via a1,b1
fit f2(x) datadir."attenuation_pb.dat" using 2:(log($4/(18.30*$3))) via a2,b2
plot[0:*][-4:1] datadir."attenuation_alu.dat" using 2:(log($4/(18.30*$3))):(1/sqrt($4)) with yerrorbars notitle pt 0, datadir."attenuation_pb.dat" using 2:(log($4/(18.30*$3))):(1/sqrt($4)) with yerrorbars notitle pt 0, f1(x) title "Aluminium" , f2(x) title "Lead"


set xlabel 'Thickness [cm]'
set ylabel '$I^{\frac{1}{4}}$'

set output figuresdir.'Attenuation_beta.tex'

set key top right

f3(x)=a3*x+b3
fit f3(x) datadir."beta.dat" using 1:(($3/$2)**0.25) via a3,b3
plot datadir."beta.dat" using 1:(($3/($2))**0.25):((1/($3))**0.25) with yerrorbars notitle , f3(x) title 'Fit'



set xlabel 'Thickness [cm]'
set ylabel '$I^{\frac{1}{4}}$'

set output figuresdir.'Attenuation_beta.tex'

set key top right

g(x)=a*exp(-b*x)
a=0.12
b=0.009
fit g(x) datadir."coincidence8.nat" using 1:($4/$5) via a,b
plot datadir."coincidence8.nat" using 1:($4/$5) notitle, g(x) title 'Fit'

slope=2.93

set label 1 '1' at 112,90000 tc ls 0


set xlabel 'Energy [KeV]'
set ylabel 'Amount of $\gamma$'

set output figuresdir.'Co57.tex'
plot[*:100*slope][0:100000] datadir."Co57.TKA" using ($0*slope):($1) title "Co57"


set label 1 '1' at 50,650 tc ls 0
set label 2 '2' at 210,535 tc ls 0
set label 3 '3' at 860,250 tc ls 0
set label 4 '4' at 1155,210 tc ls 0
set label 5 '5' at 1325,150 tc ls 0


set output figuresdir.'Co60.tex'
plot datadir."Co60.TKA" using ($0*slope):($1) title "Co60"


set label 1 '1' at 60,14000 tc ls 0
set label 2 '2' at 180,13000 tc ls 0
set label 3 '3' at 405,9000 tc ls 0
set label 4 '4' at 605,19500 tc ls 0
unset label 5

set key top center

set output figuresdir.'Cs137.tex'
plot[*:800] datadir."Cs137.TKA" using ($0*slope):($1) title "Cs137"

set key top right

set label 1 '1' at 65,210 tc ls 0
set label 2 '2' at 490,270 tc ls 0
set label 3 '3' at 1240,40 tc ls 0
unset label 4
unset label 5

set output figuresdir.'Na22.tex'
plot[*:500*slope][0:300] datadir."Na22.TKA" using ($0*slope):($1) title "Na22"

set label 1 '1' at 35,1300000 tc ls 0
unset label 2
unset label 3
unset label 4
unset label 5


set output figuresdir.'Pb120.tex'
plot[*:40*slope] datadir."Pb120.TKA" using ($0*slope):($1) title "Pb120"


set label 1 '1' at 115,269659 tc ls 0
set label 2 '2' at 320,73000 tc ls 0
set label 3 '3' at 460,60500 tc ls 0
unset label 4
unset label 5

set output figuresdir.'Hf181.tex'
plot[*:250*slope][0:300000] datadir."Hf181.TKA" using ($0*slope):($1) title "Hf181"

unset label 1
unset label 2
unset label 3

set xtics out nomirror offset 2.2,0


set xlabel 'N (number of measured photons)'
set ylabel 'f(N)'

set output figuresdir.'Poisson_5ms.tex'
set style data histogram
set style histogram cluster gap 0
set style fill solid border -1
set boxwidth 0.8

poisson(x,mu)=mu**int(x)/(int(x)!)*exp(-mu)*512
xRg=14

plot[*:xRg] "< ../data/fill-in.sh ../data/Poisson_5ms.TKA ".xRg using ($1-1):xtic(2) notitle, poisson(x,6) lc rgb "blue"

set output figuresdir.'Poisson_6ms.tex'
set style data histogram
set style histogram cluster gap 0
set style fill solid border -1
set boxwidth 0.8


xRg=17

plot[*:xRg] "< ../data/fill-in.sh ../data/Poisson_6ms.TKA ".xRg using ($1-1):xtic(2) notitle, poisson(x,8) lc rgb "blue"


set output figuresdir.'Poisson_7ms.tex'
set style data histogram
set style histogram cluster gap 0
set style fill solid border -1
set boxwidth 0.8


xRg=18

plot[*:xRg] "< ../data/fill-in.sh ../data/Poisson_7ms.TKA ".xRg using ($1-1):xtic(2) notitle, poisson(x,9) lc rgb "blue"

set output figuresdir.'Poisson_8ms.tex'
set style data histogram
set style histogram cluster gap 0
set style fill solid border -1
set boxwidth 0.8



xRg=20

plot[*:xRg] "< ../data/fill-in.sh ../data/Poisson_8ms.TKA ".xRg using ($1-1):xtic(2) notitle, poisson(x,10) lc rgb "blue"

set output figuresdir.'Poisson_9ms.tex'
set style data histogram
set style histogram cluster gap 0
set style fill solid border -1
set boxwidth 0.8


xRg=21

plot[*:xRg] "< ../data/fill-in.sh ../data/Poisson_9ms.TKA ".xRg using ($1-1):xtic(2) notitle, poisson(x,11) lc rgb "blue"


set output figuresdir.'Poisson_10ms.tex'
set style data histogram
set style histogram cluster gap 0
set style fill solid border -1
set boxwidth 0.8


xRg=24
everyNth(countColumn,labelColumnNum,N) =((int(column(countColumn)) % N == 0) ? stringcolumn(labelColumnNum) : '');

plot[0:xRg] "< ../data/fill-in.sh ../data/Poisson_10ms.TKA ".xRg using ($1-1):xtic(everyNth(2,2,2))  notitle, poisson(x,12) lc rgb "blue"


set output figuresdir.'Poisson_15ms.tex'
set style data histogram
set style histogram cluster gap 0
set style fill solid border -1
set boxwidth 0.8


xRg=30

plot[5:xRg] "< ../data/fill-in.sh ../data/Poisson_15ms.TKA ".xRg using ($1-1):xtic(everyNth(2,2,2)) notitle, poisson(x,18) lc rgb "blue"

set output figuresdir.'Poisson_20ms.tex'
set style data histogram
set style histogram cluster gap 0
set style fill solid border -1
set boxwidth 0.8


xRg=40

plot[5:xRg] "< ../data/fill-in.sh ../data/Poisson_20ms.TKA ".xRg using ($1-1):xtic(everyNth(2,2,2)) notitle, poisson(x,24) lc rgb "blue"
