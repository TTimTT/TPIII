figuresdir = './'
datadir = '../data/'

set terminal context standalone

a=1000
b=0.06

set output figuresdir.'calibration.tex'

f(x)=a*sin(b*x)
fit f(x) datadir."calibration.dat" using 1:2 via a,b

plot[0:45] datadir."calibration.dat" using 1:2:3 with yerrorbars notitle, f(x) title 'Fit'


set output figuresdir.'concentration.tex'

g(x)=a/(b*x+c)
fit g(x) datadir."Concentration" using 1:4 via a,b,c
plot datadir."Concentration" using 1:4 notitle , g(x) title 'Fit'


f(x)=exp(-x/a)

set output figuresdir.'C01.tex'

a=1083
fit f(x) datadir."C01" using 1:(1-$3/1083)*0.5 via a
plot datadir."C01" using 1:(1-$3/1083)*0.5 notitle, f(x) title 'Fit'


set output figuresdir.'c015.tex'

a=913
fit f(x) datadir."C015" using 1:(1-$3/913)*0.5 via a
plot datadir."C015" using 1:(1-$3/913)*0.5 notitle, f(x) title 'Fit'


set output figuresdir.'c03.tex'

a=461
fit f(x) datadir."C03" using 1:(1-$3/461)*0.5 via a
plot datadir."C03" using 1:(1-$3/461)*0.5 notitle, f(x) title 'Fit'


set output figuresdir.'C05.tex'

a=197
fit f(x) datadir."C05" using 1:(1-$3/197.77)*0.5 via a
plot datadir."C05" using 1:(1-$3/197.77)*0.5:(sqrt($4)) with yerrorbars notitle, f(x) title 'Fit'
