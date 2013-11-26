figuresdir = './figures/'
datadir = './data/graph/'

set terminal context standalone
unset key

set xlabel '$\lambda$ [nm]'
set ylabel 'Réflexion [$\%$]'

set yrange [0:*]

f(x)=a*x+b

set output figuresdir.'A0.tex'

X1=1800
X2=2200
fit [X1:X2] f(x) datadir.'A0_v2.txt' via a,b

set arrow from b+X1,10 to b+X1-10,2 as 1
set label sprintf("%d",b+X1) at b+X1,12
plot datadir.'A0_v2.txt' with lines, f(x) with lines

unset arrow
unset label

set output figuresdir.'A1.tex'

X1=2100
X2=2300
fit [X1:X2] f(x) datadir.'A1_v1.txt' via a,b

set arrow from 1830,10 to 1820,2 as 1
set label sprintf("%d",1820) at 1830,12
plot datadir.'A1_v1.txt' with lines, f(x) with lines

unset arrow
unset label

set output figuresdir.'A2.tex'

X1=2300
X2=2500
fit [X1:X2] f(x) datadir.'A2_v2.txt' via a,b

set arrow from 2200,10 to 2185,2 as 1
set label sprintf("%d",2185) at 2200,12
plot datadir.'A2_v2.txt' with lines, f(x) with lines

unset arrow
unset label

set output figuresdir.'B1.tex'

X1=1900
X2=2100
fit [X1:X2] f(x) datadir.'B1_v1.txt' via a,b

set arrow from 1600,10 to 1590,2 as 1
set label sprintf("%d",1590) at 1600,12
plot datadir.'B1_v1.txt' with lines, f(x) with lines

unset arrow
unset label

set output figuresdir.'B2.tex'

X1=2300
X2=2500
fit [X1:X2] f(x) datadir.'B2_v1.txt' via a,b

set arrow from 1980,10 to 1950,2
set label sprintf("%d",1950) at 1980,12
plot datadir.'B2_v1.txt' with lines, f(x) with lines

unset arrow
unset label

set output figuresdir.'C1.tex'

X1=1700
X2=1900
fit [X1:X2] f(x) datadir.'C1_v1.txt' via a,b

set arrow from 1610,10 to 1605,2 as 1
set label sprintf("%d",1605) at 1610,12
plot datadir.'C1_v1.txt' with lines, f(x) with lines

unset arrow
unset label

set output figuresdir.'C2.tex'

X1=2400
X2=2500
fit [X1:X2] f(x) datadir.'C2_v1.txt' via a,b

set arrow from 2100,10 to 2070,2 as 1
set label sprintf("%d",2070) at 2100,12
plot datadir.'C2_v1.txt' with lines, f(x) with lines

unset arrow
unset label
