libname arqdata base "/greenmonthly-export/ssemonthly/homes/Vitor.Conde@sas.com/sas_viya_4_demo/demo_mobil";

/* Campanha Venda */

data arqdata.campanha_venda(drop=Sexo Regiao);
set arqdata.campanha_venda_model;

	/* Mudando Flags */
	Sexo_num = IFN(Sexo = "M",0,IFN(Sexo = "U",99,1),1);

	/* Quebra de Qualidade de Dados */
	Regiao_brk = tranwrd(Regiao,"a", "@");
	Regiao_brk = tranwrd(Regiao,"O", "0");

	/* Email para API */
	email = "fake_email@corporate.co";
run;

proc export data=arqdata.campanha_venda replace
    outfile="/greenmonthly-export/ssemonthly/homes/Vitor.Conde@sas.com/sas_viya_4_demo/demo_mobil/campanha_venda.csv"
    dbms=csv;
run;

/* 22.223 */
proc sql;
select count(*) from arqdata.campanha_venda;
quit;

proc export data=arqdata.lookingglass_forecast replace
    outfile="/greenmonthly-export/ssemonthly/homes/Vitor.Conde@sas.com/sas_viya_4_demo/demo_mobil/lookingglass_forecast.csv"
    dbms=csv;
run;

/* 36.457 */
/* proc sql; */
/* select count(*) from work.join_credit_app; */
/* quit; */
