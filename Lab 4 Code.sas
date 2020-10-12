/* Rumil Legaspi
   STAT 521
   Prof. Millie
   10/13/20
   						LAB 3 Assignment
   						
/* Qestion 1 ------------------------------------------------------------------------------- */

/* One Dimensional arrays */ 
proc import datafile= "/home/u49689891/STAT521/STAT521 Lecture 5/Lab4_score_data_miss777.xlsx"  /* (i.) New dataset creatd; converting "777" to missing numericals */
			DBMS = xlsx
			OUT = lab4_scoredata0 replace;
			run;

Data lab4_scoredata1 (drop = i score_var); /* (ii.) Dropping array index var and score1-score3 vars */
set lab4_scoredata0;
	ARRAY score_var (3) score1 score2 score3;
	DO i = 1 TO 3;
		IF score_var(i) = 777 THEN score_var(i) = . ;
	END;

proc means data = lab4_scoredata1; /* (iii.) Using PROC MEANS on three score variables */
var score1 score2 score3;
run;
	
Data lab4_scoredata2 (drop = i); /* (iv.) Creating a new SAS dataset */
set lab4_scoredata1	;
	ARRAY score(3) score1 score2 score3;
	array average{3} _temporary_(79.5 81.9 79.1);
	array score_diff(3);
		do i = 1 to 3;
		score_diff{i} = score{i} - average{i};
	end;
run;
			
	
proc print data = lab4_scoredata2; /* (v.) Printing new dataset */
run;
	


/* Qestion 2 ------------------------------------------------------------------------------- */

/* Two-Dimensional Arrays & Nested DO Loops */	
proc import datafile= "/home/u49689891/STAT521/STAT521 Lecture 3 Datasets/Lab2_Vehicles.xlsx"  
			DBMS = xlsx
			OUT = lab4_vehicles_monthly replace;
			run;	

data lab4_vehicles_quarterly (drop=i j); /* (i.) Creating quarterly sales dataset using two-dimensional arrays */
   set lab4_vehicles_monthly;
   array m{4,3} Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec;
   array Qtr{4};
   do i=1 to 4;
      qtr{i}=0; 
      do j=1 to 3;
         qtr{i}+m{i,j};
      end;
   end;

   
run;

proc print data = lab4_vehicles_quarterly (keep = type qtr1 qtr2 qtr3 qtr4); /* (ii.) Printing quarterly sales dataset, only keeping "type" and "qtr1-qtr4" */
run;



/* Qestion 3 ------------------------------------------------------------------------------- */

/* Rotating a Table with Arrays */
data lab4_vehicles_rotate (drop = qtr1-qtr4 Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec);
	set lab4_vehicles_quarterly;
	array contrib{4} Qtr1-Qtr4; /* (i.) Creating four rows, transforming dataset into a long form */
	do Qtr = 1 to 4;
		Sales = contrib{qtr};
		output;
	end;
run;
	
	
proc print data = lab4_vehicles_rotate (keep = Type Qtr Sales); /* (ii. & iii.) Keeping only "type", "Qtr", and "Sales"; Printing rotated dataset */
run;	
	
	

