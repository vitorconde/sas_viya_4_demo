DATA WORK.ABT_MODELAGEM;
	SET DADOS.JOIN_CREDIT_APP(drop= CODE_GENDER);
	
	IF status in ("1" "2" "3" "4" "5") then target = 1;
	ELSE IF status in ("0" "X" "C") then target = 0;

	IF flag_own_car = "Y" then flag_car=1;
	ELSE flag_car = 0;
	IF flag_own_realty = "Y" then flag_realty = 1;
	ELSE flag_realty = 0;
	
	drop flag_own_car flag_own_realty;
run;
