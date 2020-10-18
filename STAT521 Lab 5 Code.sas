
/* Rumil Legaspi
   STAT 521
   Prof. Millie
   9/29/20
   						LAB 2 Assignment
   						
/* Qestion 1 ------------------------------------------------------------------------------- */

/* (i) Creating a Library using LIBNAME and importing/storing Lab2_vehicles data */
Libname lab2 "/home/u49689891/STAT521/STAT521 Lecture 2 Datasets";

proc import datafile = "/home/u49689891/STAT521/STAT521 Lecture 3 Datasets/Lab2_Vehicles.xlsx"
DBMS= xlsx out = lab2.Lab2_vehicles replace;
run;

/* (ii) */
DATA newlab2SASdataset;
set  lab2.lab2_vehicles;
	 Unit = 'In Thousands';
	Ave_sales = MEAN(Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec);
    Total_sales = SUM(Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec);  		
	Max_sales = MAX(Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec);
	Min_sales = MIN(Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec);

	Range = Sum(Max_sales, - Min_sales);
	Max_pred_total_sales_in_2019 = (1.1 * total_sales);
	Min_pred_total_sales_in_2019 = (1.02 * total_sales);
	Pred2019max_compared_2018 = Sum(Max_pred_total_sales_in_2019, - total_sales);
	Pred2019min_compared_2018 = Sum(Min_pred_total_sales_in_2019, - total_sales);
run;

/* (iii) */
proc print DATA = newlab2SASdataset;
run;







/* Question 2 ------------------------------------------------------------------------------- */

/* (i) importing Lab2_poverty data */
proc import datafile = '/home/u49689891/STAT521/STAT521 Lecture 3 Datasets/Lab2_Poverty.xlsx'
DBMS = xlsx out = Lab2_poverty replace ;
run;

/* (ii) Unit variable added */
DATA new_lab2_poverty;
set Lab2_poverty;
	Unit = 'Percentage';
	Average_poverty_rate = MEAN(year_2017, year_2016, year_2015);
	Maximum_poverty_rate = MAX(year_2017, year_2016, year_2015);
	Poverty_rate_changes_2015to2016	= year_2016 - year_2015;
	Poverty_rate_changes_2016to2017 = year_2017 - year_2016;
		

run;

/* (iii) */
proc print DATA = new_lab2_poverty;
run;

/* Mississippi has the Highest average poverty rate, New Hampshire has the Lowest average poverty rate. */


/* (iv) creating a new dataset adding 'level' and 'note' variables */
DATA new2_lab2_poverty;
set Lab2_poverty;
	Unit = 'Percentage';

	Average_poverty_rate = MEAN(year_2017, year_2016, year_2015);
	Maximum_poverty_rate = MAX(year_2017, year_2016, year_2015);
	Poverty_rate_changes_2015to2016	= year_2016 - year_2015;
	Poverty_rate_changes_2016to2017 = year_2017 - year_2016;
	
	if Average_poverty_rate < 10 then do;
	level =  'Below 10%';
	END;
	
	Else if Average_poverty_rate < 15 then do;
	level =  'Moderate';
	END;
	
	Else if Average_poverty_rate < 20 then do;
	level =  'High';
	END;
	
	Else if Average_poverty_rate >= 20 then do;
	level =  'Very High';
	END;
	
	Else DO;
	level =  'NA';
	END;
	
	
	
	If Poverty_rate_changes_2015to2016 AND Poverty_rate_changes_2016to2017 <0 then
	note ='Improve consecutively';
	
	
	ELSE If Poverty_rate_changes_2015to2016 AND Poverty_rate_changes_2016to2017 >0 then 
	note = 'Worsen consecutively';
	
	
	ELSE If Poverty_rate_changes_2015to2016 AND Poverty_rate_changes_2016to2017 =0 then 
	note = 'Unchanged';
	
	Else
	note = 'Fluctuate';
	
run;

/* (v) */
proc print DATA = new2_lab2_poverty;
run;








/* Question 3 -------------------------------------------------------------------------------*/

/* (i) import lab2_course dataset */
proc import datafile= "/home/u49689891/STAT521/STAT521 Lecture 3 Datasets/Lab2_Course.xlsx"
DBMS= xlsx out = lab2.Lab2_Course replace;
run;

/* (ii) new dataset with 'weight_ave' variable added */
DATA lab2.New_Lab2_course;
SET lab2.Lab2_Course;
Weighted_Ave = ((0.2 * Midterm1) + (0.2 * Midterm2) + (0.4 * Final) + (0.1 * Attendance) + (0.1 * Homework)) /1;
 
/* (iii) */
proc print DATA = lab2.New_Lab2_course;
run;


/* (iv & v) assigning 'grade' and 'status' variables */
DATA lab2.New_Lab2_course;
SET lab2.Lab2_Course;
Weighted_Ave = ((0.2 * Midterm1) + (0.2 * Midterm2) + (0.4 * Final) + (0.1 * Attendance) + (0.1 * Homework)) /1;
 

 IF Weighted_Ave >= 90 THEN DO;
	grade = 'A';
	status = 'pass';
	end; /*in this case, 'end is needed notice 'do'*/
	
	Else if Weighted_Ave >= 80 then do;
	grade = 'B';
	status = 'pass';
	END;
	
	Else if Weighted_Ave >= 70 then do;
	grade = 'C';
	status = 'pass';
	END;
	
	Else if Weighted_Ave >= 60 then do;
	grade = 'D';
	status = 'pass';
	END;
	
	Else if Weighted_Ave < 60 then do;
	grade = 'F';
	status = 'fail';
	END;
	
	Else DO;
	grade = ' ';
	status = ' ';
	end;
	run;

/* (v) */
proc print DATA = lab2.New_Lab2_course;
run;


