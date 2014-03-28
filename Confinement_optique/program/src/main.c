#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <string.h>

typedef struct Position {
	int frame_number;
	float x;
	float y;
	float zero_order_intensity_moment_m0;
	float second_order_intensity_moment_m2;
	float non_particle_discrimination_score;
}Position;

typedef struct Trajectorie{
	Position * pos_tab;	
	int pos_count;
	int pos_count_max;
}Trajectorie;



int main(int argc, char** argv){
	FILE *fp;
	char * filename=NULL;
	printf("\n-----\n");
	float fps;
	if(argc>2){
		filename = argv[1];
		printf("file opened : %s\n", filename );
		printf("-----\n");
		sscanf(argv[2],"%f",&fps);
	}else {
		printf("no filename specified !\n");
		printf("you should type :\n");
		printf("   ./prog Traj_video.txt 30\n");
		printf("where 30 is the value of fps you actually have\n");

		exit(1);
	}
	fp = fopen(filename, "r");

	if (fp == NULL) {
		fprintf(stderr, "Can't open input file in.list!\n");
		printf("-----\n");
		exit(1);
	}

	int nbytes=1000;
	char * buffer;
	buffer = (char *) malloc (nbytes + 1);//+1 because of \0 

	int char_read=0;
	char * new_traj=malloc(sizeof(char)*1000);

	int traj_i=0;
	int traj_i_max=1;
	Trajectorie * traj_tab = malloc(sizeof(Trajectorie)*traj_i_max);

	printf("file parsing !\n");
	printf("-----\n");

	while( (char_read=getline(&buffer, &nbytes, fp))!=-1  ){
		sprintf(new_traj,"%%%% Trajectory %i\n",traj_i+1);

		// if new traj
		if(!strcmp(buffer,new_traj)){
			traj_i++;
			if(traj_i>=traj_i_max){
				// alloc twice more memory
				traj_i_max*=2;
				traj_tab = realloc(traj_tab,sizeof(Trajectorie)*traj_i_max);
			}
			traj_tab[traj_i-1].pos_count=0;
			traj_tab[traj_i-1].pos_count_max=10;
			traj_tab[traj_i-1].pos_tab = malloc(traj_tab[traj_i-1].pos_count_max*sizeof(Position));
			// debug
			// printf("+++%s", buffer);
		}
		// if we are reading a particle trajectory
		else if(traj_i){
			// if empty
			if(buffer[0]=='\n'){
				// debug
				// printf("empty\n");
			}else{
				traj_tab[traj_i-1].pos_count++;
				if(traj_tab[traj_i-1].pos_count>=traj_tab[traj_i-1].pos_count_max){
					traj_tab[traj_i-1].pos_count_max*=2;
					traj_tab[traj_i-1].pos_tab=realloc(traj_tab[traj_i-1].pos_tab,sizeof(Position)*traj_tab[traj_i-1].pos_count_max);
				}
				Trajectorie * t = traj_tab+(traj_i-1);
				Position * p = t->pos_tab + ( t->pos_count -1 );

				// printf("traj %i, pos %i \n",traj_i,t->pos_count );
				// printf("%s",buffer);

				sscanf(buffer,"%i %f %f %f %f %f\n",
					&(p->frame_number),
					&(p->x),
					&(p->y),
					&(p->zero_order_intensity_moment_m0),
					&(p->second_order_intensity_moment_m2),
					&(p->non_particle_discrimination_score)
				);
			}
		}
	}

	fclose(fp);

	printf("file parsed !\n");
	printf("-----\n");

	//==========================================================
	//==========================================================
	//==========================================================
	//============== TRAITER LES DATAS MAINTENANT ==============
	//==========================================================
	//==========================================================
	//==========================================================


	double * MSD[traj_i];

	double spf = 1./fps;
	// particule trajectoire
	for (int i=0;i<traj_i;i++){
		Trajectorie * t = traj_tab+(i);
		MSD[i]=malloc(t->pos_count*sizeof(double));
		// t = j*spf
		for (int j=0;j<t->pos_count-1;j++){
			MSD[i][j]=0;
			for (int k=0;k<t->pos_count-1-j;k++){
				Position * p1 = t->pos_tab + (k);
				Position * p2 = t->pos_tab + (k+j);
				// printf("traj %i,x: %f,y: %f\n",i,p->x,p->y );
				MSD[i][j]+=(p2->x-p1->x)*(p2->x-p1->x) + (p2->y-p1->y)*(p2->y-p1->y);
			}
			MSD[i][j]/=(double)(t->pos_count-1-j);
			// printf("%lf ",MSD[i][j] );
		}
		// printf("\n" );
	}


	// gamma_0 = 6 pi r eta
	// D = k_b T / gamma_0
	// d=2
	// MSD(t) = 2dDt

	double D[traj_i];

	for (int i=0;i<traj_i;i++){
		Trajectorie * t = traj_tab+(i);
		D[i]=0;

		// use this to ignore too short trajectories

		// if(t->pos_count<100){
		// 	continue;
		// }

		for(int j=1;j<t->pos_count;j++){
			D[i] += MSD[i][j]*.25*fps/j;
		}
		// printf("particle %i, D = %lf\n", i, D);
		D[i]/=t->pos_count;
	}

	double D_average=0;
	for (int i=0;i<traj_i;i++){
		D_average+=D[i];
	}
	D_average/=traj_i;
	printf("MSD = 4 D t\n");
	printf("average D : %lf\n", D_average);






	// k = k_B T / <r^2>
	// [x,y] average position calculation
	double * x_average=malloc(sizeof(double)*traj_i);
	double * y_average=malloc(sizeof(double)*traj_i);
	for (int i=0;i<traj_i;i++){
		x_average[i]=0;
		y_average[i]=0;
		Trajectorie * t = traj_tab+(i);
		for(int j=1;j<t->pos_count;j++){
			x_average[i]+=t->pos_tab[j].x;
			y_average[i]+=t->pos_tab[j].y;
		}
		x_average[i]/=t->pos_count;
		y_average[i]/=t->pos_count;
		// printf("%lf,%lf\n", x_average[i],y_average[i]);
	}
	// r^2 calculation
	double * r2=malloc(sizeof(double)*traj_i);
	for (int i=0;i<traj_i;i++){
		Trajectorie * t = traj_tab+(i);
		for(int j=1;j<t->pos_count;j++){
			r2[i]+= (x_average[i]-t->pos_tab[j].x)*(x_average[i]-t->pos_tab[j].x)
				+ (y_average[i]-t->pos_tab[j].y)*(y_average[i]-t->pos_tab[j].y);
		}
		r2[i]/=t->pos_count;
	}
	// k calculation
	double * k=malloc(sizeof(double)*traj_i);
	
	//put actual temperature here
	double T=298;
	
	// boltzmann constant
	double k_b = 1.3806488e-23;

	for (int i=0;i<traj_i;i++){
		//k per trapped particle (the input must content only trapped particles)
		k[i]=k_b * T / r2[i];
	}
	//average k
	double k_average =0;
	for (int i=0;i<traj_i;i++){
		k_average+=k[i];
	}
	k_average/=traj_i;

	return 0;
}
