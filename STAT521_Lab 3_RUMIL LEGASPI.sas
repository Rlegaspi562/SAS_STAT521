/* Rumil Legaspi
   STAT 521
   Prof. Millie
   10/6/20
   						LAB 3 Assignment
   						
/* Qestion 1 ------------------------------------------------------------------------------- */
/* It will take at least 18 years to reach a salary of $100,000 per year */

/* using iterative DO loop & DROP */
Data lab4_salary1 (drop = counter);
	Increase_rate = 0.03;
	Salary = 60000; 
	do counter = 1 to 5;
		Salary + Increase_rate*Salary;
		Year + 1;
		output;
	end;
	Format Salary dollar10.2;
run;

proc print data = lab4_salary1;
title "Listing of Salary increase with DO loops";
run;


/* Qestion 2 ------------------------------------------------------------------------------- */
/* It will take at least 18 years to reach a salary of $100,000 per year */

/* Conditionally executing DO loops: */

/* Using DO UNTIL */  
Data lab4_salary2;
		salary = 60000;
		DO UNTIL(salary >= 100000);
		salary + salary * 0.03;
		year + 1;
	end;
run;

proc print data = lab4_salary2;
title "Listing of Salary Increase With at Least $100,000 Using DO UNTIL Loops";
run;




/* Using DO WHILE */ 
Data lab4_salary2;
		salary = 60000;
		DO WHILE(salary < 100000);
		salary + salary * 0.03;
		year + 1;
	end;
run;

proc print data = lab4_salary2;
title "Listing of Salary Increase With at Least $100,000 Using DO WHILE Loops";
run;


/* Qestion 3 ------------------------------------------------------------------------------- */
/* No. After using both DO UNTIL/WHILE Loops we see that the savings will only have accumulated a total of 
$102531.58 by age 18 and will require at least another 4 years to surpass or be at $120,000 */

/* Iterative and conditional DO UNTIL/WHILE Loops:: */


/* Using DO UNTIL */ 
Data lab4_Collegefund (drop = counter);
	interest_rate = 0.07;
	savings = 0;
	
	DO counter = 1 to 18 BY 2 UNTIL (savings >= 120000);
	savings + 8000;
	savings + savings *.07;
	year+2;
	output;
	end;
	Format savings dollar10.2;
run;

proc print data = lab4_Collegefund;
title "Listing of College Fund Savings From Birth to 18 Years Old using DO UNTIL Loops";
run;


/* Using DO WHILE */ 
Data lab4_Collegefund (drop = counter);
	interest_rate = 0.07;
	savings = 0;
	
	DO counter = 1 to 18 BY 2 WHILE (savings < 120000);
	savings + 8000;
	savings + savings *.07;
	year+2;
	output;
	end;
	Format savings dollar10.2;
run;

proc print data = lab4_Collegefund;
title "Listing of College Fund Savings From Birth to 18 Years Old using DO WHILE Loops";
run;



