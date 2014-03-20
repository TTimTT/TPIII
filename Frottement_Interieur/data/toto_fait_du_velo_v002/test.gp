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
		FWHM = X_half_two - X_half_one
		print FWHM

		plot filenames(i) using 1:3 lc rgb 'black'
	}
pause -1
}
