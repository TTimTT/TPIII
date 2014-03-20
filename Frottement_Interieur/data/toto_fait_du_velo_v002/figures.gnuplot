#Pour gnuplot et l'expérience frottement intérieur
figuresdir = './figures/'
datadir = './data/toto_fait_du_velo_v002/'

kb=1.380*10**(-23)

!rm statsa.dat
!rm statsb.dat
!rm statsc.dat
##Graph de la variation température lente


filename(n) = sprintf('< gawk "NR>=10"  MegaBalayageH%d.txt', n)


#set xlabel 'Température [°K]'
#set ylabel 'Déphasage'
unset key

#plot for[i=1:21:2] filename(i) using 1:3 lc rgb 'blue' lt 1

#pause -1;print "Press Enter to continue";

#Sauve les valeurs max et leurs positions x respective
set print "statsa.dat"

filename(n) = sprintf('< gawk "NR>=10"  MegaBalayageF%d.txt', n)

do for[i=2:22:2]{ stats[*:2] filename(i) using 2:3 nooutput;X=STATS_pos_max_y;Y=STATS_max_y;DEV=STATS_stddev_x;stats[*:2] filename(i) using 0:1 nooutput;print STATS_max_y,X,Y,DEV,DEV*2*sqrt(2*log(2));}

#Courbe 3D
set pm3d
set logscale y

set title 'Scan en fréquence'

set xlabel 'Température [°K]'
set ylabel 'Fréquence excitation [Hz]'
set zlabel 'Déphasage' rotate by 90

splot '<(for i in {2..22..2}; do gawk "NR>=10" MegaBalayageF${i}.txt;echo; done)' using 1:2:3 lc rgb 'black', 'statsa.dat' using 1:2:3

pause -1;print "Press Enter to continue";

unset pm3d
unset logscale y

f1(x)=a1*x+b1
fit f1(x) 'statsa.dat' using (1/$1):(log($2*2*pi)) via a1,b1

set title 'Droite des maximums, scan fréquence'

set ylabel 'ln(ω)'
set xlabel '1/T [1/K]'
set key

set arrow from 0.00265,-1.0 to 0.0026,-1.5
set arrow from 0.0021,5.0 to 0.002,5.4

set label '-E/k' at 0.00265,-0.9
set label 'ln(1/τ0)' at 0.00211,5.17

set print
print a1, -a1*kb
print 1/b1, exp(-b1)

plot[0.002:*] 'statsa.dat' using (1/$1):(log($2*2*pi)) title 'Data', f1(x) title 'Interpolation'

unset label
unset arrow
unset key

pause -1;

##
##
##

set print "statsb.dat"

filename(n) = sprintf('< gawk "NR>=10"  Balayage_TC%d.txt', n)

do for[i=2:20:2]{ stats filename(i) using 1:3 nooutput;X=STATS_pos_max_y;Y=STATS_max_y;DEV=STATS_stddev_x;stats filename(i) using 0:2 nooutput;print X,STATS_max_y,Y,DEV,DEV*2*sqrt(2*log(2));}


#Courbe 3D
set pm3d

set title 'Scan en température'

set xlabel 'Température [°K]'
set ylabel 'Fréquence excitation [Hz]'
set zlabel 'Déphasage' rotate by 90

splot '<(for i in {2..20..2}; do gawk "NR>=10" Balayage_TC${i}.txt;echo; done)' using 1:2:3 lc rgb 'black', 'statsb.dat' using 1:2:3

pause -1;print "Press Enter to continue";

unset pm3d

f2(x)=a2*x+b2
fit f2(x) 'statsb.dat' using (1/$1):(log($2*2*pi)) via a2,b2

set title 'Droite des maximums, scan température'

set ylabel 'ln(ω)'
set xlabel '1/T [1/K]'

set xtics 0.000025

set arrow from 0.00227,3.1 to 0.00223709,3.1
set arrow from 0.00217,4.25 to 0.00215,4.42

set label '-E/k' at 0.00227,3.1
set label 'ln(1/τ0)' at 0.00217,4.25
set key

set print
print a2, -a2*kb
print 1/b2, exp(-b2)


plot 'statsb.dat' using (1/$1):(log($2*2*pi)) title 'Data', f2(x) title 'Interpolation'

unset label
unset arrow
set xtics auto
unset key

pause -1;

##
##
##

set print "statsc.dat"

filename(n) = sprintf('< gawk "NR>=10"  Balayage_TH%d.txt', n)

do for[i=1:19:2]{ stats filename(i) using 1:3 nooutput;X=STATS_pos_max_y;Y=STATS_max_y;DEV=STATS_stddev_x;stats filename(i) using 0:2 nooutput;print X,STATS_max_y,Y,DEV,DEV*2*sqrt(2*log(2));}


#Courbe 3D
set pm3d

set title 'Scan en température, refroidissement'

set xlabel 'Température [°K]'
set ylabel 'Fréquence excitation [Hz]'
set zlabel 'Déphasage' rotate by 90

splot '<(for i in {1..19..2}; do gawk "NR>=10" Balayage_TH${i}.txt;echo; done)' using 1:2:3 lc rgb 'black', 'statsc.dat' using 1:2:3

pause -1;

unset pm3d

f3(x)=a3*x+b3
fit f3(x) '< gawk "NR!=4" statsc.dat' using (1/$1):(log($2*2*pi)) via a3,b3

set title 'Droite des maximums, scan température, refroidissement'

set ylabel 'ln(ω)'
set xlabel '1/T [1/K]'
set key

set arrow from 0.002155,2.9 to 0.0021425,2.9
set arrow from 0.00209,4.15 to 0.00206,4.3

set label '-E/k' at 0.002155,2.9
set label 'ln(1/τ0)' at 0.00209,4.15

set print
print a3, -a3*kb
print 1/b3, exp(-b3)

plot[0.00206:*] '< gawk "NR!=4" statsc.dat' using (1/$1):(log($2*2*pi)) title 'Data', f3(x) title 'Interpolation'

unset label
unset arrow

pause -1

set title 'Déplacement du pic lors du refoidissement, F=1 [Hz]'

set key

set xlabel 'Température [°K]'
set ylabel 'Déphasage' rotate by 90

plot '< gawk "NR>=10" Balayage_TC2.txt' using 1:3 lc rgb "blue" title 'chauffage', '< gawk "NR>=10" Balayage_TH1.txt' using 1:3 lc rgb "red" title 'refroidissement'


pause -1;

#Define the minimum from the right side
Min_y = `gawk 'END{print $3}' Balayage_TH1.txt | cat`

!echo $Min_y
#Get the maximum and the position x corresponding to it.
stats [*:*][Min_y:*] 'Balayage_TH1.txt' using 1:3 nooutput

X_max_y = STATS_pos_max_y
Max_y = STATS_max_y


#Get the first half of the FWHM
stats [*:X_max_y][Min_y:(Max_y+Min_y)/2] 'Balayage_TH1.txt' using 1:3 nooutput
X_half_one = STATS_pos_max_y

#Get the second half of the FWHM
stats [X_max_y:*][Min_y:(Max_y+Min_y)/2] 'Balayage_TH1.txt' using 1:3 nooutput
X_half_two = STATS_pos_max_y

####Result needed
FWHM = X_half_two - X_half_one
print FWHM

plot  'Balayage_TH1.txt' using 1:3 lc rgb 'black'

pause -1

set print
filenames(n) = sprintf('Balayage_TH%d.txt', n)

#Get the maximum and the position x corresponding to it.
do for[i=1:19:2]{
	stats filenames(i) using 1:3 nooutput

	Min_y = STATS_min_y
	X_max_y = STATS_pos_max_y
	Max_y = STATS_max_y
	
	if(i != 7){
#Get the first half of the FWHM
		stats [*:X_max_y][Min_y:(Max_y+Min_y)/2] filenames(i) using 1:3 nooutput
		X_half_one = STATS_pos_max_y

#Get the second half of the FWHM
		stats [X_max_y:*][Min_y:(Max_y+Min_y)/2] filenames(i) using 1:3 nooutput
		X_half_two = STATS_pos_max_y

####Result needed
#		FWHM = X_half_two - X_half_one
		val = (kb*2.633)/(1/X_half_one -1/X_half_two)
		print i,val

		plot filenames(i) using 1:3 lc rgb 'black'
	}
pause -1
}
