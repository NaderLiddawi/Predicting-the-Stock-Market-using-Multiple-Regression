*read excel file;
proc import out=set1 datafile= "/home/u59424498/sasuser.v94/Final Project/final proj data.xlsx" DBMS=xlsx REPLACE;
run;

*regress SPX on other variables and output ANOVA with beta parameters;

proc reg data=set1;
title 'ANOVA before Model Selection';
model SPX = BITCOIN MSFT EUR_USD ES_Futures Ten_Year_Yield TSLA Gold_Futures /clb alpha=0.05;
*output out=out_set1 r=residual;
run;

proc reg data=set1;
title 'AIC/BIC Selection';
model SPX = BITCOIN MSFT EUR_USD ES_Futures Ten_Year_Yield TSLA Gold_Futures / selection=rsquare adjrsq cp aic bic;
run;


proc reg data=set1;
title 'Stepwise Selection';
model SPX = BITCOIN MSFT EUR_USD ES_Futures Ten_Year_Yield TSLA Gold_Futures / details slentry=0.15 slstay=0.30 selection=stepwise;
output out=out_set1 r=residual;
run;



title 'Examining Potential Outliers';
ods output OutputStatistics=residual1;

proc reg data=set1 plots=(DFFITS DFBETAS);
model SPX = EUR_USD ES_Futures;

output out=out_set1 dffits=DFFITS cookd=CookD rstudent=R_Student predicted=Predicted;
run;


proc print data=out_set1;
run;


data t_set;
input alpha n p;

*studentized deleted residual critical value with Bon. adj.;
t_stud_del_res2 = tinv(1-alpha/(2*n), n-p-1); 
datalines;
0.05 216 3
;
run;

title 'T distribution values';
proc print data=t_set;
run;



title 'Observations that have possible outlying Y observations';
proc print data=resid1;
where Rstudent>3.74611 or Rstudent<-3.74611;
var Observation Rstudent;
run;




title 'Observations that have a large DFFITS values';
* 2sqrt(3/216) = 0.2357;
proc print data=out_set1;
where DFFITS>0.2357 or DFFITS<-0.2357;
var Observation DFFITS;
run;



title 'Observations that have a large COOK''s Distance values';
proc print data=out_set1;
where COOKD>0.7912;
var Observation CookD;
run;



ods output OutputStatistics=resid1;


data set2;
set set1;
if _n_=180 then delete;
run;

title 'PROC REG output WITHOUT POTENTIALLY EXTREME OBSERVATION 180';
proc reg data=set2;
model SPX = EUR_USD ES_Futures /r partial influence vif clb alpha=0.05;
output out=out_set2 r=residual;
run;



proc corr data=set2;
var SPX EUR_USD ES_Futures;
run;


data out_set3;
set out_set2;
order = _n_;
run;

*output Time Series (residual vs. observations) to check any seasonal patterns;
proc gplot data=out_set3;
plot residual*order / vaxis=axis1 haxis=axis2;
title "Sequence plot of the residuals";
axis1 label = (a=90 'Residual');
axis2 label=('Observation number');
symbol v=dot cv=blue ci=red i=join;
run;





*MODEL VALIDATION;

data set_new;
set set2;
* Generate a uniform random number between 0 and 1;
unif = ranuni(720034930);
if unif <=0.80 then build = 1;
else build = 0;
run;

data training;
set set_new;
where build=1;
run;

data test;
set set_new;
where build=0;
run;

title 'Estimated regression model for training data';
proc reg data=training;
model SPX = EUR_USD ES_Futures;
run;


title 'Estimated regression model for test data';
proc reg data=test;
model SPX = EUR_USD ES_Futures;
output out=out_set4 predicted=predict;
run;

proc print data=out_set4;
var SPX predict;
run;


data out_set5;
set out_set4;
residual_sq = (SPX - predict)**2;
run;

title2 'Find the numerator of MSPR';
proc means data=out_set5 sum;
var residual_sq;
run;

quit;

