figuresdir = './figures/'
datadir = './data/processed/'

set terminal context standalone

set xlabel '$\theta$'
set ylabel '$\dot{\theta}$'

set key off

set output figuresdir.'1_1_001_lab.tex'
plot datadir.'1.1_001.lab' using 2:3 with lines title 'Asymétrie du pendule'


unset ytics
set output figuresdir.'1_1_008_lab.tex'
plot datadir.'1.1_008.lab' using 2:3 with lines title 'Rééquilibrage'

set ytics auto
set output figuresdir.'1_2_U_10_95_lab.tex'
plot datadir.'1.2_U_10.95.lab' using 2:3 with lines title 'Rotation rapide du moteur'

unset ytics
set output figuresdir.'1_2_U_2_41_lab.tex'
plot datadir.'1.2_U_2.41.lab' using 2:3 with lines title 'Rotation lente du moteur'

set ytics auto
set output figuresdir.'1_2_U_3_02_lab.tex'
plot datadir.'1.2_U_3.02.lab' using 2:3 with lines title 'Attracteur à droite'

set output figuresdir.'1_2_U_3_44_lab.tex'
plot datadir.'1.2_U_3.44.lab' using 2:3 with lines title "Convergence vers position d'équilibre"

set output figuresdir.'1_2_U_4_54_lab.tex'
plot datadir.'1.2_U_4.54_frottement_chni.lab' using 2:3 with lines title "Point d'équilibre à gauche"

set output figuresdir.'1_2_U_4_97_theta__FREIN_PAS_FREIN_lab.tex'
plot datadir.'1.2_U_4.97_theta__FREIN_PAS_FREIN.lab' every ::2800 with lines notitle, '' every ::::2800 with lines notitle

set output figuresdir.'1_2_U_5_63_lab.tex'
plot datadir.'1.2_U_5.63.lab' using 2:3 with lines title 'Symétrie du pendule problématique'


set xrange [-10:-3]
set yrange [-0.1:0.12]

set output figuresdir.'1_3_U_5_01_lab.tex'
plot datadir.'1.3_U_5.01.lab' using 2:3 with lines lc rgb "#77FF0000" , datadir.'1.3_U_5.01_v2.lab' using 2:3 with lines lc rgb "#7700FF00", datadir.'1.3_U_5.01_v3.lab' using 2:3 with lines lc rgb "#AA000000", datadir.'1.3_U_5.01_v4.lab' using 2:3 with lines lc rgb "#AA0000FF"


set xrange [*:*]
set yrange [*:*]
set output figuresdir.'1_1_001_lab.tex'
plot datadir.'1.1_001.lab' using 2:3 with lines title '$\phi (\theta)$'


set output figuresdir.'comparaison.tex'

set xlabel '$t$ [s]'
set ylabel '$\theta$'

set xrange [0:75]

plot datadir.'1.2_U_4.97_theta_phi_FREIN_comparison_2_1.lab' using ($1-1):2 with lines title '1', \
	datadir.'1.2_U_4.97_theta_phi_FREIN_comparison_2_2.lab' using ($1-1.5):2 with lines title '2', \
	datadir.'1.2_U_4.97_theta_phi_FREIN_comparison_2_3.lab' using ($1-0.3):2 with lines title '3', \
	datadir.'1.2_U_4.97_theta_phi_FREIN_comparison_2_4.lab' with lines title '4'


set xlabel '$\dot{\theta}$'
set ylabel '$phi$'

set xrange [*:*]

set output figuresdir.'comparaison2.tex'
plot datadir.'1.2_U_4.97_theta_phi_FREIN_comparison_2_1.lab' using 2:3 with lines title '1', \
	datadir.'1.2_U_4.97_theta_phi_FREIN_comparison_2_2.lab' using 2:3 with lines title '2', \
	datadir.'1.2_U_4.97_theta_phi_FREIN_comparison_2_3.lab' using 2:3 with lines title '3', \
	datadir.'1.2_U_4.97_theta_phi_FREIN_comparison_2_4.lab' using 2:3with lines title '4'


#set output figuresdir.'potentiel' 
set terminal context standalone
set output figuresdir.'potentiel.tex'

#set title '$V(\theta,t)=\frac{k}{2}(\theta-a.sin(\omega t))^2-\frac{mg}{2}cos(x)$'
set palette gray
set border 4095 front linetype -1 linewidth 1.000
set pm3d implicit at s
set ticslevel 0
set hidden3d

#set contour
set samples 100;set isosamples 100

set xlabel '$\theta$'
set ylabel '$t$ [s]'

set ztics 100
set cbtics 100

k=10.0; a=3.0; w=1.0; b=30.0;

set xrange [-3.14:3.14]
set yrange [0:6.28*3/w]

f(x,t)=k*(x-a*sin(w*t))**2-b*cos(x)

splot f(x,y) notitle
