libname arqdata base "/greenmonthly-export/ssemonthly/homes/Vitor.Conde@sas.com/sas_viya_4_demo/demo_mobil";

data arqdata.credit(keep=ID MONTHS_BALANCE FLAG_MOBIL DAYS_EMPLOYED DAYS_BIRTH NAME_FAMILY_STATUS AMT_INCOME_TOTAL NAME_INCOME_AND_EDUCATION_TYPE NAME_HOUSING_TYPE_BRK OCCUPATION_TYPE_BRK) 
	 arqdata.app(keep=ID FLAG_EMAIL FLAG_PHONE FLAG_WORK_PHONE STATUS CODE_GENDER_NUM FLAG_OWN_CAR_NUM FLAG_OWN_REALTY_NUM CNT_CHILDREN_NUM);
set arqdata.join_credit_app;

	/* Mudando Flags */
	CODE_GENDER_NUM = IFN(CODE_GENDER = "M",0,1);
	FLAG_OWN_CAR_NUM = IFN(FLAG_OWN_CAR = "Y",1,0);
	FLAG_OWN_REALTY_NUM = IFN(FLAG_OWN_REALTY = "Y",1,0);
	CNT_CHILDREN_NUM = IFN(CNT_CHILDREN = "Y",1,0);
	
	/* Concatenando Colunas */
	NAME_INCOME_AND_EDUCATION_TYPE = strip(NAME_INCOME_TYPE)||" | "||strip(NAME_EDUCATION_TYPE);

	/* Quebra de Qualidade de Dados */
	NAME_HOUSING_TYPE_BRK = tranwrd(NAME_HOUSING_TYPE,"a", "@");
	OCCUPATION_TYPE_BRK = tranwrd(OCCUPATION_TYPE," ", "_");
run;

proc export data=arqdata.credit replace
    outfile="/greenmonthly-export/ssemonthly/homes/Vitor.Conde@sas.com/sas_viya_4_demo/demo_mobil/credit.csv"
    dbms=csv;
run;

proc export data=arqdata.app replace
    outfile="/greenmonthly-export/ssemonthly/homes/Vitor.Conde@sas.com/sas_viya_4_demo/demo_mobil/app.csv"
    dbms=csv;
	
run;

/* 36.457 */
proc sql;
select count(*) from arqdata.join_credit_app;
quit;

/* 36.457 */
proc sql;
select count(*) from work.join_credit_app;
quit;
