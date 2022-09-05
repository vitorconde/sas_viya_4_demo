/* Caminho dos arquivos para input */
%let app_record_data = "/greenmonthly-export/ssemonthly/homes/Vitor.Conde@sas.com/sas_viya_4_demo-trial/data/application_record.csv";
%let credit_record_data = "/greenmonthly-export/ssemonthly/homes/Vitor.Conde@sas.com/sas_viya_4_demo-trial/data/credit_record.csv";

/* Print de macrovariáveis de input */
%put &app_record_data;
%put &credit_record_data;

/* Código de import */
proc import datafile=&app_record_data.
        out=app_record_data
        dbms=csv
        replace;
     getnames=yes;
run;

proc import datafile=&credit_record_data.
        out=credit_record_data
        dbms=csv
        replace;
     getnames=yes;
run;

/* Apresentando resultado */
/* proc print data=work.app_record_data; */
/* run; */

