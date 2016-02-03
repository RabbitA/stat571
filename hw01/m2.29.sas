/* Generated Code (IMPORT) */
/* Source File: p2.csv */
/* Source Path: /folders/myfolders */
/* Code generated on: Wednesday, February 3, 2016 6:01:33 PM */

%web_drop_table(WORK.IMPORT);


FILENAME REFFILE "/folders/myfolders/photo.csv" TERMSTR=NL;

PROC IMPORT DATAFILE=REFFILE
    DBMS=CSV
    OUT=photo;
    GETNAMES=YES;
RUN;

PROC CONTENTS DATA=photo; RUN;


proc print data=photo; 

proc sgplot data=photo;
  dot temp / response=size stat=mean
  limitstat=stddev numstd=1;
 run; 

proc ttest data=photo alpha=0.05;
  class temp;
  var size;
run;

proc univariate data=photo;
var size;
run;

proc univariate data=photo NORMALTEST;
  var size;
  QQPLOT size/NORMAL(MU=EST SIGMA=EST COLOR=BLUE L=1);
run;
 
 
proc power;
 twosamplemeans test=diff
 meandiff = 1.5
 stddev = 1.88
 npergroup = .
 power = 0.9;
run;

%web_open_table(WORK.IMPORT);
