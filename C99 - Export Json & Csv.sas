data json_export;
set dados.bank(keep=account rfm1 rfm2 rfm3 rfm4 rfm5 rfm6 rfm7 rfm8 rfm9
							rfm10 rfm11 rfm12 cat_input1 cat_input2 cnt_tgt int_tgt);
run;

data csv_export;
set dados.bank(keep=account demog_age demog_ho demog_homeval demog_inc demog_pr
							demog_genf demog_genm);
run;


/* export para json */

proc json out="/greenmonthly-export/ssemonthly/homes/Vitor.Conde@sas.com/sas_viya_4_demo-trial/data/vars.json";
   export json_export;
run;

proc export data=json_export
    outfile="/greenmonthly-export/ssemonthly/homes/Vitor.Conde@sas.com/sas_viya_4_demo-trial/data/vars.csv"
    dbms=csv;
run;

/* export para csv */

proc export data=csv_export
    outfile="/greenmonthly-export/ssemonthly/homes/Vitor.Conde@sas.com/sas_viya_4_demo-trial/data/dim.csv"
    dbms=csv;
run;

proc json out="/greenmonthly-export/ssemonthly/homes/Vitor.Conde@sas.com/sas_viya_4_demo-trial/data/dim.json";
   export csv_export;
run;
