figuresdir = './figures/'
datadir = './data/processed/'

set terminal context standalone

set xlabel '$\theta$'
set ylabel '$\dot{\theta}$'

set key on

set output figuresdir.'1_1_001_lab.tex'
plot datadir.'1.1_001.lab' using 2:3 with lines title 'Asymétrie du pendule'

set output figuresdir.'1_1_008_lab.tex'
plot datadir.'1.1_008.lab' using 2:3 with lines title 'Rééquilibrage'

set output figuresdir.'1_2_U_10_95_lab.tex'
plot datadir.'1.2_U_10.95.lab' using 2:3 with lines title 'Rotation rapide du moteur'

set output figuresdir.'1_2_U_2_41_lab.tex'
plot datadir.'1.2_U_2.41.lab' using 2:3 with lines title 'Rotation lente du moteur'

set output figuresdir.'1_2_U_3_02_lab.tex'
plot datadir.'1.2_U_3.02.lab' using 2:3 with lines title 'Attracteur à droite'

set output figuresdir.'1_2_U_3_44_lab.tex'
plot datadir.'1.2_U_3.44.lab' using 2:3 with lines title "Convergence vers position d'équilibre"

set output figuresdir.'1_2_U_4_54_lab.tex'
plot datadir.'1.2_U_4.54_frottement_chni.lab' using 2:3 with lines title "Point d'équilibre à gauche"

set output figuresdir.'1_2_U_4_97_theta__FREIN_PAS_FREIN_lab.tex'
plot datadir.'1.2_U_4.97_theta__FREIN_PAS_FREIN.lab' using 2:3 with lines title 'Passage périodique à chaotique'

set output figuresdir.'1_2_U_5_63_lab.tex'
plot datadir.'1.2_U_5.63.lab' using 2:3 with lines title 'Symétrie du pendule problématique'

set output figuresdir.'1_3_U_5_01_lab.tex'
plot datadir.'1.3_U_5.01.lab' using 2:3 with lines lc rgb "#77FF0000" , datadir.'1.3_U_5.01_v2.lab' using 2:3 with lines lc rgb "#7700FF00", datadir.'1.3_U_5.01_v3.lab' using 2:3 with lines lc rgb "#AA000000", datadir.'1.3_U_5.01_v4.lab' using 2:3 with lines lc rgb "#AA0000FF"


set output figuresdir.'1_1_001_lab.tex'
plot datadir.'1.1_001.lab' using 2:3 with lines title '$\phi (\theta)$'
