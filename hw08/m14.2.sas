data dat;
input machine operator y @@;
datalines;
1 1 79 1 2 94 1 3 46 2 1 92 2 2 85 2 3 76 
3 1 88 3 2 53 3 3 46 4 1 36 4 2 40 4 3 62
1 1 62 1 2 74 1 3 57 2 1 99 2 2 79 2 3 68 
3 1 75 3 2 56 3 3 57 4 1 53 4 2 56 4 3 47
;
proc glm data=dat;
class machine operator;
model y=machine operator machine*operator;
random operator machine*operator;
test h=operator e=machine*operator;
run;


proc mixed data=dat method=type1; 
class machine operator;
model y=machine operator machine*operator; 
random operator machine*operator;
run; 
