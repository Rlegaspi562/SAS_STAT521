/* Rumil Legaspi
   STAT 521
   Prof. Millie
   9/15/20
   						LAB 1 Assignment
*/

/* #1 Delimitter and dsd
*/

data Lab1_level;
	infile "/home/u49689891/STAT521/STAT521 Lecture 2 Datasets/Lab1_Level.txt" dlm='&' dsd;  /* Notice the consectutive usage of delimitter "&" being used*/
	input ID Name $ Gender $ Level $ Age;
run;
proc print data= Lab1_level;
run;







/* #2  Using Column input to read values
*/

data Lab1_Patients;
	infile "/home/u49689891/STAT521/STAT521 Lecture 2 Datasets/Lab1_Patients.txt";
	input 	ID 			1-4           /* Notice the arbitrary order when displaying selected fields */
			Age 		8-9
			Gender $ 	6
			Pulse		19-21
			Weight 		15-17
			Height		11-13;
run;
proc print data= Lab1_Patients;
run;








/* #3 Date informat and @ (notice after the @sign is where the data begins in the raw data and w. is space/digits occupied) 
	Also see formatting display dates in proc print 
*/

data Lab1_Date;
	infile "/home/u49689891/STAT521/STAT521 Lecture 2 Datasets/Lab1_Date.txt";
	input
	@1  Patient_id 2.
	@23 Age 	   2.
	@3  Start_date mmddyy10.
	@13 End_date   mmddyy10.;
run;
proc print data= Lab1_Date;
format Start_date date9.
	   End_date   date9.;
run;
	
