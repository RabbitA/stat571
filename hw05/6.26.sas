data filter;
do E = -1 to 1 by 2; do D = -1 to 1 by 2;do C = -1 to 1 by 2; do B = -1 to 1 by 2;do A = -1 to 1 by 2; input y @@; output;
end; end; end; end; end;
datalines;
7 9 34 55 16 20 40 60 8 10 32 50 18 21 44 61
8 12 35 52 15 22 45 65 6 10 30 53 15 20 41 63
;

proc print data=filter;
run;
data inter; /* Define Interaction Terms */
set filter;
AB=A*B; AC=A*C; AD=A*D; AE=A*E;
BC=B*C; BD=B*D; BE=B*E;
CD=C*D; CE=C*E;
ABC=AB*C; ABD=AB*D; ABE=AB*E;
ACD=AC*D; ACE=AC*E;
ADE=AD*E;
BCD=BC*D; BDE=CD*E;
ABCD=ABC*D; ABCE=ABC*E;
ABDE=ABD*E; ACDE=ACD*E;
BCDE=BCD*E;
ABCDE=ABCD*E;
run;
proc print data=inter; run;

proc glm data=inter; /* GLM Proc to Obtain Effects */
 class A B C D E AB AC AD AE BC BD BE CD CE ABC ABD ABE ACD ACE ADE BCD BDE ABCD ABCE ABDE ACDE BCDE ABCDE;
 model y=A B C D E AB AC AD AE BC BD BE CD CE ABC ABD ABE ACD ACE ADE BCD BDE ABCD ABCE ABDE ACDE BCDE ABCDE;
estimate 'A' A -1 1; estimate 'AC' AC -1 1; run;
proc reg outest=effects data=inter; /* REG Proc to Obtain Effects */
 model y=A B C D E AB AC AD AE BC BD BE CD CE ABC ABD ABE ACD ACE ADE BCD BDE ABCD ABCE ABDE ACDE BCDE ABCDE;
run;

data effect2; set effects; drop y intercept _RMSE_; run;
proc transpose data=effect2 out=effect3; run;
data effect4; set effect3; effect=col1*2; run;
proc sort data=effect4; by effect; run;
proc print data=effect4; run;

proc rank data=effect4 out=effect5 normal=blom;
var effect; ranks neff; run;
proc print data=effect5; run;
proc sgplot data=effect5;
scatter x=neff y=effect/datalabel=_NAME_; xaxis label='Normal Scores';
run;

proc glm data=filter;
class A C D;
model y=A|C|D;
run;
