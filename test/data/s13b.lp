min: 0
 + 1 bu10_suarez_o1
 + 1 gu13_tbd_o1 + 2 gu13_tbd_o2 + 3 gu13_tbd_o3
 + 1 gu9_tbd_o1
 + 1 bu8_perry_o1
 + 1 bu12_martin_o1 + 2 bu12_martin_o2 + 3 bu12_martin_o3
 + 1 bu14_tbd_o1 + 2 bu14_tbd_o2 + 3 bu14_tbd_o3
 + 1 bu9_serrano_o1
 + 1 bu12_suarez_o1
 + 1 gu11_cardinale_o1
 + 1 bu11_anderson_o1
;
/* Must pick one option for each team */
bu10_suarez_o1 = 1;
gu13_tbd_o1 + gu13_tbd_o2 + gu13_tbd_o3 = 1;
gu9_tbd_o1 = 1;
bu8_perry_o1 = 1;
bu12_martin_o1 + bu12_martin_o2 + bu12_martin_o3 = 1;
bu14_tbd_o1 + bu14_tbd_o2 + bu14_tbd_o3 = 1;
bu9_serrano_o1 = 1;
bu12_suarez_o1 = 1;
gu11_cardinale_o1 = 1;
bu11_anderson_o1 = 1;

/* team options */
bu10_suarez_o1 = bu10_suarez_o1_adaE+bu10_suarez_o1_adaW;

gu13_tbd_o1 = gu13_tbd_o1_adaE+gu13_tbd_o1_adaW;
4 gu13_tbd_o1_adaE = gu13_tbd_adaE_fr_300 + gu13_tbd_adaE_fr_330 + gu13_tbd_adaE_we_300 + gu13_tbd_adaE_we_330;
4 gu13_tbd_o1_adaW = gu13_tbd_adaW_fr_300 + gu13_tbd_adaW_fr_330 + gu13_tbd_adaW_we_300 + gu13_tbd_adaW_we_330;

gu13_tbd_o2 = gu13_tbd_o2_adaE+gu13_tbd_o2_adaW;
4 gu13_tbd_o2_adaE = gu13_tbd_adaE_tu_500 + gu13_tbd_adaE_tu_530 + gu13_tbd_adaE_th_500 + gu13_tbd_adaE_th_530;
4 gu13_tbd_o2_adaW = gu13_tbd_adaW_tu_500 + gu13_tbd_adaW_tu_530 + gu13_tbd_adaW_th_500 + gu13_tbd_adaW_th_530;

gu13_tbd_o3 = gu13_tbd_o3_adaE+gu13_tbd_o3_adaW;

gu9_tbd_o1 = gu9_tbd_o1_adaE+gu9_tbd_o1_adaW;

bu8_perry_o1 = bu8_perry_o1_adaE+bu8_perry_o1_adaW;

bu12_martin_o1 = bu12_martin_o1_adaE+bu12_martin_o1_adaW;
4 bu12_martin_o1_adaE = bu12_martin_adaE_tu_300 + bu12_martin_adaE_tu_330 + bu12_martin_adaE_th_300 + bu12_martin_adaE_th_330;
4 bu12_martin_o1_adaW = bu12_martin_adaW_tu_300 + bu12_martin_adaW_tu_330 + bu12_martin_adaW_th_300 + bu12_martin_adaW_th_330;

bu12_martin_o2 = bu12_martin_o2_adaE+bu12_martin_o2_adaW;
4 bu12_martin_o2_adaE = bu12_martin_adaE_fr_400 + bu12_martin_adaE_fr_430 + bu12_martin_adaE_we_400 + bu12_martin_adaE_we_430;
4 bu12_martin_o2_adaW = bu12_martin_adaW_fr_400 + bu12_martin_adaW_fr_430 + bu12_martin_adaW_we_400 + bu12_martin_adaW_we_430;

bu12_martin_o3 = bu12_martin_o3_adaE+bu12_martin_o3_adaW;

bu14_tbd_o1 = bu14_tbd_o1_adaE+bu14_tbd_o1_adaW;
4 bu14_tbd_o1_adaE = bu14_tbd_adaE_fr_400 + bu14_tbd_adaE_fr_430 + bu14_tbd_adaE_we_400 + bu14_tbd_adaE_we_430;
4 bu14_tbd_o1_adaW = bu14_tbd_adaW_fr_400 + bu14_tbd_adaW_fr_430 + bu14_tbd_adaW_we_400 + bu14_tbd_adaW_we_430;

bu14_tbd_o2 = bu14_tbd_o2_adaE+bu14_tbd_o2_adaW;
4 bu14_tbd_o2_adaE = bu14_tbd_adaE_fr_500 + bu14_tbd_adaE_fr_530 + bu14_tbd_adaE_we_500 + bu14_tbd_adaE_we_530;
4 bu14_tbd_o2_adaW = bu14_tbd_adaW_fr_500 + bu14_tbd_adaW_fr_530 + bu14_tbd_adaW_we_500 + bu14_tbd_adaW_we_530;

bu14_tbd_o3 = bu14_tbd_o3_adaE+bu14_tbd_o3_adaW;

bu9_serrano_o1 = bu9_serrano_o1_adaE+bu9_serrano_o1_adaW;

bu12_suarez_o1 = bu12_suarez_o1_adaE+bu12_suarez_o1_adaW;

gu11_cardinale_o1 = gu11_cardinale_o1_adaE+gu11_cardinale_o1_adaW;

bu11_anderson_o1 = bu11_anderson_o1_adaE+bu11_anderson_o1_adaW;

/* DON'T OVERBOOK FIELDS */
adaE_tu_300 <= 1.5;
adaE_tu_300 = bu10_suarez_adaE_tu_300 + gu13_tbd_adaE_tu_300 + gu9_tbd_adaE_tu_300 + bu8_perry_adaE_tu_300 + bu12_martin_adaE_tu_300 + bu14_tbd_adaE_tu_300 + bu9_serrano_adaE_tu_300 + bu12_suarez_adaE_tu_300 + gu11_cardinale_adaE_tu_300 + bu11_anderson_adaE_tu_300;

adaE_tu_330 <= 1.5;
adaE_tu_330 = bu10_suarez_adaE_tu_330 + gu13_tbd_adaE_tu_330 + gu9_tbd_adaE_tu_330 + bu8_perry_adaE_tu_330 + bu12_martin_adaE_tu_330 + bu14_tbd_adaE_tu_330 + bu9_serrano_adaE_tu_330 + bu12_suarez_adaE_tu_330 + gu11_cardinale_adaE_tu_330 + bu11_anderson_adaE_tu_330;

adaE_tu_400 <= 1.5;
adaE_tu_400 = bu10_suarez_adaE_tu_400 + gu13_tbd_adaE_tu_400 + gu9_tbd_adaE_tu_400 + bu8_perry_adaE_tu_400 + bu12_martin_adaE_tu_400 + bu14_tbd_adaE_tu_400 + bu9_serrano_adaE_tu_400 + bu12_suarez_adaE_tu_400 + gu11_cardinale_adaE_tu_400 + bu11_anderson_adaE_tu_400;

adaE_tu_430 <= 1.5;
adaE_tu_430 = bu10_suarez_adaE_tu_430 + gu13_tbd_adaE_tu_430 + gu9_tbd_adaE_tu_430 + bu8_perry_adaE_tu_430 + bu12_martin_adaE_tu_430 + bu14_tbd_adaE_tu_430 + bu9_serrano_adaE_tu_430 + bu12_suarez_adaE_tu_430 + gu11_cardinale_adaE_tu_430 + bu11_anderson_adaE_tu_430;

adaE_tu_500 <= 1.5;
adaE_tu_500 = bu10_suarez_adaE_tu_500 + gu13_tbd_adaE_tu_500 + gu9_tbd_adaE_tu_500 + bu8_perry_adaE_tu_500 + bu12_martin_adaE_tu_500 + bu14_tbd_adaE_tu_500 + bu9_serrano_adaE_tu_500 + bu12_suarez_adaE_tu_500 + gu11_cardinale_adaE_tu_500 + bu11_anderson_adaE_tu_500;

adaE_tu_530 <= 1.5;
adaE_tu_530 = bu10_suarez_adaE_tu_530 + gu13_tbd_adaE_tu_530 + gu9_tbd_adaE_tu_530 + bu8_perry_adaE_tu_530 + bu12_martin_adaE_tu_530 + bu14_tbd_adaE_tu_530 + bu9_serrano_adaE_tu_530 + bu12_suarez_adaE_tu_530 + gu11_cardinale_adaE_tu_530 + bu11_anderson_adaE_tu_530;

adaE_tu_600 <= 1.5;
adaE_tu_600 = bu10_suarez_adaE_tu_600 + gu13_tbd_adaE_tu_600 + gu9_tbd_adaE_tu_600 + bu8_perry_adaE_tu_600 + bu12_martin_adaE_tu_600 + bu14_tbd_adaE_tu_600 + bu9_serrano_adaE_tu_600 + bu12_suarez_adaE_tu_600 + gu11_cardinale_adaE_tu_600 + bu11_anderson_adaE_tu_600;

adaE_tu_630 <= 1.5;
adaE_tu_630 = bu10_suarez_adaE_tu_630 + gu13_tbd_adaE_tu_630 + gu9_tbd_adaE_tu_630 + bu8_perry_adaE_tu_630 + bu12_martin_adaE_tu_630 + bu14_tbd_adaE_tu_630 + bu9_serrano_adaE_tu_630 + bu12_suarez_adaE_tu_630 + gu11_cardinale_adaE_tu_630 + bu11_anderson_adaE_tu_630;

adaE_tu_700 <= 1.5;
adaE_tu_700 = bu10_suarez_adaE_tu_700 + gu13_tbd_adaE_tu_700 + gu9_tbd_adaE_tu_700 + bu8_perry_adaE_tu_700 + bu12_martin_adaE_tu_700 + bu14_tbd_adaE_tu_700 + bu9_serrano_adaE_tu_700 + bu12_suarez_adaE_tu_700 + gu11_cardinale_adaE_tu_700 + bu11_anderson_adaE_tu_700;

adaE_sa_200 <= 1.5;
adaE_sa_200 = bu10_suarez_adaE_sa_200 + gu13_tbd_adaE_sa_200 + gu9_tbd_adaE_sa_200 + bu8_perry_adaE_sa_200 + bu12_martin_adaE_sa_200 + bu14_tbd_adaE_sa_200 + bu9_serrano_adaE_sa_200 + bu12_suarez_adaE_sa_200 + gu11_cardinale_adaE_sa_200 + bu11_anderson_adaE_sa_200;

adaE_sa_230 <= 1.5;
adaE_sa_230 = bu10_suarez_adaE_sa_230 + gu13_tbd_adaE_sa_230 + gu9_tbd_adaE_sa_230 + bu8_perry_adaE_sa_230 + bu12_martin_adaE_sa_230 + bu14_tbd_adaE_sa_230 + bu9_serrano_adaE_sa_230 + bu12_suarez_adaE_sa_230 + gu11_cardinale_adaE_sa_230 + bu11_anderson_adaE_sa_230;

adaE_sa_300 <= 1.5;
adaE_sa_300 = bu10_suarez_adaE_sa_300 + gu13_tbd_adaE_sa_300 + gu9_tbd_adaE_sa_300 + bu8_perry_adaE_sa_300 + bu12_martin_adaE_sa_300 + bu14_tbd_adaE_sa_300 + bu9_serrano_adaE_sa_300 + bu12_suarez_adaE_sa_300 + gu11_cardinale_adaE_sa_300 + bu11_anderson_adaE_sa_300;

adaE_sa_330 <= 1.5;
adaE_sa_330 = bu10_suarez_adaE_sa_330 + gu13_tbd_adaE_sa_330 + gu9_tbd_adaE_sa_330 + bu8_perry_adaE_sa_330 + bu12_martin_adaE_sa_330 + bu14_tbd_adaE_sa_330 + bu9_serrano_adaE_sa_330 + bu12_suarez_adaE_sa_330 + gu11_cardinale_adaE_sa_330 + bu11_anderson_adaE_sa_330;

adaE_sa_400 <= 1.5;
adaE_sa_400 = bu10_suarez_adaE_sa_400 + gu13_tbd_adaE_sa_400 + gu9_tbd_adaE_sa_400 + bu8_perry_adaE_sa_400 + bu12_martin_adaE_sa_400 + bu14_tbd_adaE_sa_400 + bu9_serrano_adaE_sa_400 + bu12_suarez_adaE_sa_400 + gu11_cardinale_adaE_sa_400 + bu11_anderson_adaE_sa_400;

adaE_sa_430 <= 1.5;
adaE_sa_430 = bu10_suarez_adaE_sa_430 + gu13_tbd_adaE_sa_430 + gu9_tbd_adaE_sa_430 + bu8_perry_adaE_sa_430 + bu12_martin_adaE_sa_430 + bu14_tbd_adaE_sa_430 + bu9_serrano_adaE_sa_430 + bu12_suarez_adaE_sa_430 + gu11_cardinale_adaE_sa_430 + bu11_anderson_adaE_sa_430;

adaE_sa_500 <= 1.5;
adaE_sa_500 = bu10_suarez_adaE_sa_500 + gu13_tbd_adaE_sa_500 + gu9_tbd_adaE_sa_500 + bu8_perry_adaE_sa_500 + bu12_martin_adaE_sa_500 + bu14_tbd_adaE_sa_500 + bu9_serrano_adaE_sa_500 + bu12_suarez_adaE_sa_500 + gu11_cardinale_adaE_sa_500 + bu11_anderson_adaE_sa_500;

adaE_sa_530 <= 1.5;
adaE_sa_530 = bu10_suarez_adaE_sa_530 + gu13_tbd_adaE_sa_530 + gu9_tbd_adaE_sa_530 + bu8_perry_adaE_sa_530 + bu12_martin_adaE_sa_530 + bu14_tbd_adaE_sa_530 + bu9_serrano_adaE_sa_530 + bu12_suarez_adaE_sa_530 + gu11_cardinale_adaE_sa_530 + bu11_anderson_adaE_sa_530;

adaE_sa_600 <= 1.5;
adaE_sa_600 = bu10_suarez_adaE_sa_600 + gu13_tbd_adaE_sa_600 + gu9_tbd_adaE_sa_600 + bu8_perry_adaE_sa_600 + bu12_martin_adaE_sa_600 + bu14_tbd_adaE_sa_600 + bu9_serrano_adaE_sa_600 + bu12_suarez_adaE_sa_600 + gu11_cardinale_adaE_sa_600 + bu11_anderson_adaE_sa_600;

adaE_sa_630 <= 1.5;
adaE_sa_630 = bu10_suarez_adaE_sa_630 + gu13_tbd_adaE_sa_630 + gu9_tbd_adaE_sa_630 + bu8_perry_adaE_sa_630 + bu12_martin_adaE_sa_630 + bu14_tbd_adaE_sa_630 + bu9_serrano_adaE_sa_630 + bu12_suarez_adaE_sa_630 + gu11_cardinale_adaE_sa_630 + bu11_anderson_adaE_sa_630;

adaE_sa_700 <= 1.5;
adaE_sa_700 = bu10_suarez_adaE_sa_700 + gu13_tbd_adaE_sa_700 + gu9_tbd_adaE_sa_700 + bu8_perry_adaE_sa_700 + bu12_martin_adaE_sa_700 + bu14_tbd_adaE_sa_700 + bu9_serrano_adaE_sa_700 + bu12_suarez_adaE_sa_700 + gu11_cardinale_adaE_sa_700 + bu11_anderson_adaE_sa_700;

adaE_th_300 <= 1.5;
adaE_th_300 = bu10_suarez_adaE_th_300 + gu13_tbd_adaE_th_300 + gu9_tbd_adaE_th_300 + bu8_perry_adaE_th_300 + bu12_martin_adaE_th_300 + bu14_tbd_adaE_th_300 + bu9_serrano_adaE_th_300 + bu12_suarez_adaE_th_300 + gu11_cardinale_adaE_th_300 + bu11_anderson_adaE_th_300;

adaE_th_330 <= 1.5;
adaE_th_330 = bu10_suarez_adaE_th_330 + gu13_tbd_adaE_th_330 + gu9_tbd_adaE_th_330 + bu8_perry_adaE_th_330 + bu12_martin_adaE_th_330 + bu14_tbd_adaE_th_330 + bu9_serrano_adaE_th_330 + bu12_suarez_adaE_th_330 + gu11_cardinale_adaE_th_330 + bu11_anderson_adaE_th_330;

adaE_th_400 <= 1.5;
adaE_th_400 = bu10_suarez_adaE_th_400 + gu13_tbd_adaE_th_400 + gu9_tbd_adaE_th_400 + bu8_perry_adaE_th_400 + bu12_martin_adaE_th_400 + bu14_tbd_adaE_th_400 + bu9_serrano_adaE_th_400 + bu12_suarez_adaE_th_400 + gu11_cardinale_adaE_th_400 + bu11_anderson_adaE_th_400;

adaE_th_430 <= 1.5;
adaE_th_430 = bu10_suarez_adaE_th_430 + gu13_tbd_adaE_th_430 + gu9_tbd_adaE_th_430 + bu8_perry_adaE_th_430 + bu12_martin_adaE_th_430 + bu14_tbd_adaE_th_430 + bu9_serrano_adaE_th_430 + bu12_suarez_adaE_th_430 + gu11_cardinale_adaE_th_430 + bu11_anderson_adaE_th_430;

adaE_th_500 <= 1.5;
adaE_th_500 = bu10_suarez_adaE_th_500 + gu13_tbd_adaE_th_500 + gu9_tbd_adaE_th_500 + bu8_perry_adaE_th_500 + bu12_martin_adaE_th_500 + bu14_tbd_adaE_th_500 + bu9_serrano_adaE_th_500 + bu12_suarez_adaE_th_500 + gu11_cardinale_adaE_th_500 + bu11_anderson_adaE_th_500;

adaE_th_530 <= 1.5;
adaE_th_530 = bu10_suarez_adaE_th_530 + gu13_tbd_adaE_th_530 + gu9_tbd_adaE_th_530 + bu8_perry_adaE_th_530 + bu12_martin_adaE_th_530 + bu14_tbd_adaE_th_530 + bu9_serrano_adaE_th_530 + bu12_suarez_adaE_th_530 + gu11_cardinale_adaE_th_530 + bu11_anderson_adaE_th_530;

adaE_th_600 <= 1.5;
adaE_th_600 = bu10_suarez_adaE_th_600 + gu13_tbd_adaE_th_600 + gu9_tbd_adaE_th_600 + bu8_perry_adaE_th_600 + bu12_martin_adaE_th_600 + bu14_tbd_adaE_th_600 + bu9_serrano_adaE_th_600 + bu12_suarez_adaE_th_600 + gu11_cardinale_adaE_th_600 + bu11_anderson_adaE_th_600;

adaE_th_630 <= 1.5;
adaE_th_630 = bu10_suarez_adaE_th_630 + gu13_tbd_adaE_th_630 + gu9_tbd_adaE_th_630 + bu8_perry_adaE_th_630 + bu12_martin_adaE_th_630 + bu14_tbd_adaE_th_630 + bu9_serrano_adaE_th_630 + bu12_suarez_adaE_th_630 + gu11_cardinale_adaE_th_630 + bu11_anderson_adaE_th_630;

adaE_th_700 <= 1.5;
adaE_th_700 = bu10_suarez_adaE_th_700 + gu13_tbd_adaE_th_700 + gu9_tbd_adaE_th_700 + bu8_perry_adaE_th_700 + bu12_martin_adaE_th_700 + bu14_tbd_adaE_th_700 + bu9_serrano_adaE_th_700 + bu12_suarez_adaE_th_700 + gu11_cardinale_adaE_th_700 + bu11_anderson_adaE_th_700;

adaW_sa_200 <= 1.5;
adaW_sa_200 = bu10_suarez_adaW_sa_200 + gu13_tbd_adaW_sa_200 + gu9_tbd_adaW_sa_200 + bu8_perry_adaW_sa_200 + bu12_martin_adaW_sa_200 + bu14_tbd_adaW_sa_200 + bu9_serrano_adaW_sa_200 + bu12_suarez_adaW_sa_200 + gu11_cardinale_adaW_sa_200 + bu11_anderson_adaW_sa_200;

adaW_sa_230 <= 1.5;
adaW_sa_230 = bu10_suarez_adaW_sa_230 + gu13_tbd_adaW_sa_230 + gu9_tbd_adaW_sa_230 + bu8_perry_adaW_sa_230 + bu12_martin_adaW_sa_230 + bu14_tbd_adaW_sa_230 + bu9_serrano_adaW_sa_230 + bu12_suarez_adaW_sa_230 + gu11_cardinale_adaW_sa_230 + bu11_anderson_adaW_sa_230;

adaW_sa_300 <= 1.5;
adaW_sa_300 = bu10_suarez_adaW_sa_300 + gu13_tbd_adaW_sa_300 + gu9_tbd_adaW_sa_300 + bu8_perry_adaW_sa_300 + bu12_martin_adaW_sa_300 + bu14_tbd_adaW_sa_300 + bu9_serrano_adaW_sa_300 + bu12_suarez_adaW_sa_300 + gu11_cardinale_adaW_sa_300 + bu11_anderson_adaW_sa_300;

adaW_sa_330 <= 1.5;
adaW_sa_330 = bu10_suarez_adaW_sa_330 + gu13_tbd_adaW_sa_330 + gu9_tbd_adaW_sa_330 + bu8_perry_adaW_sa_330 + bu12_martin_adaW_sa_330 + bu14_tbd_adaW_sa_330 + bu9_serrano_adaW_sa_330 + bu12_suarez_adaW_sa_330 + gu11_cardinale_adaW_sa_330 + bu11_anderson_adaW_sa_330;

adaW_sa_400 <= 1.5;
adaW_sa_400 = bu10_suarez_adaW_sa_400 + gu13_tbd_adaW_sa_400 + gu9_tbd_adaW_sa_400 + bu8_perry_adaW_sa_400 + bu12_martin_adaW_sa_400 + bu14_tbd_adaW_sa_400 + bu9_serrano_adaW_sa_400 + bu12_suarez_adaW_sa_400 + gu11_cardinale_adaW_sa_400 + bu11_anderson_adaW_sa_400;

adaW_sa_430 <= 1.5;
adaW_sa_430 = bu10_suarez_adaW_sa_430 + gu13_tbd_adaW_sa_430 + gu9_tbd_adaW_sa_430 + bu8_perry_adaW_sa_430 + bu12_martin_adaW_sa_430 + bu14_tbd_adaW_sa_430 + bu9_serrano_adaW_sa_430 + bu12_suarez_adaW_sa_430 + gu11_cardinale_adaW_sa_430 + bu11_anderson_adaW_sa_430;

adaW_sa_500 <= 1.5;
adaW_sa_500 = bu10_suarez_adaW_sa_500 + gu13_tbd_adaW_sa_500 + gu9_tbd_adaW_sa_500 + bu8_perry_adaW_sa_500 + bu12_martin_adaW_sa_500 + bu14_tbd_adaW_sa_500 + bu9_serrano_adaW_sa_500 + bu12_suarez_adaW_sa_500 + gu11_cardinale_adaW_sa_500 + bu11_anderson_adaW_sa_500;

adaW_sa_530 <= 1.5;
adaW_sa_530 = bu10_suarez_adaW_sa_530 + gu13_tbd_adaW_sa_530 + gu9_tbd_adaW_sa_530 + bu8_perry_adaW_sa_530 + bu12_martin_adaW_sa_530 + bu14_tbd_adaW_sa_530 + bu9_serrano_adaW_sa_530 + bu12_suarez_adaW_sa_530 + gu11_cardinale_adaW_sa_530 + bu11_anderson_adaW_sa_530;

adaW_sa_600 <= 1.5;
adaW_sa_600 = bu10_suarez_adaW_sa_600 + gu13_tbd_adaW_sa_600 + gu9_tbd_adaW_sa_600 + bu8_perry_adaW_sa_600 + bu12_martin_adaW_sa_600 + bu14_tbd_adaW_sa_600 + bu9_serrano_adaW_sa_600 + bu12_suarez_adaW_sa_600 + gu11_cardinale_adaW_sa_600 + bu11_anderson_adaW_sa_600;

adaW_sa_630 <= 1.5;
adaW_sa_630 = bu10_suarez_adaW_sa_630 + gu13_tbd_adaW_sa_630 + gu9_tbd_adaW_sa_630 + bu8_perry_adaW_sa_630 + bu12_martin_adaW_sa_630 + bu14_tbd_adaW_sa_630 + bu9_serrano_adaW_sa_630 + bu12_suarez_adaW_sa_630 + gu11_cardinale_adaW_sa_630 + bu11_anderson_adaW_sa_630;

adaW_sa_700 <= 1.5;
adaW_sa_700 = bu10_suarez_adaW_sa_700 + gu13_tbd_adaW_sa_700 + gu9_tbd_adaW_sa_700 + bu8_perry_adaW_sa_700 + bu12_martin_adaW_sa_700 + bu14_tbd_adaW_sa_700 + bu9_serrano_adaW_sa_700 + bu12_suarez_adaW_sa_700 + gu11_cardinale_adaW_sa_700 + bu11_anderson_adaW_sa_700;

/* ZERO THE DISALLOWED TIMES */
gu13_tbd_adaE_fr_300 + gu13_tbd_adaE_fr_330 + gu13_tbd_adaE_we_300 + gu13_tbd_adaE_we_330 + gu13_tbd_adaW_fr_300 + gu13_tbd_adaW_fr_330 + gu13_tbd_adaW_we_300 + gu13_tbd_adaW_we_330 + gu13_tbd_adaW_tu_500 + gu13_tbd_adaW_tu_530 + gu13_tbd_adaW_th_500 + gu13_tbd_adaW_th_530 + bu12_martin_adaW_tu_300 + bu12_martin_adaW_tu_330 + bu12_martin_adaW_th_300 + bu12_martin_adaW_th_330 + bu12_martin_adaE_fr_400 + bu12_martin_adaE_fr_430 + bu12_martin_adaE_we_400 + bu12_martin_adaE_we_430 + bu12_martin_adaW_fr_400 + bu12_martin_adaW_fr_430 + bu12_martin_adaW_we_400 + bu12_martin_adaW_we_430 + bu14_tbd_adaE_fr_400 + bu14_tbd_adaE_fr_430 + bu14_tbd_adaE_we_400 + bu14_tbd_adaE_we_430 + bu14_tbd_adaW_fr_400 + bu14_tbd_adaW_fr_430 + bu14_tbd_adaW_we_400 + bu14_tbd_adaW_we_430 + bu14_tbd_adaE_fr_500 + bu14_tbd_adaE_fr_530 + bu14_tbd_adaE_we_500 + bu14_tbd_adaE_we_530 + bu14_tbd_adaW_fr_500 + bu14_tbd_adaW_fr_530 + bu14_tbd_adaW_we_500 + bu14_tbd_adaW_we_530 = 0;
/* BINARY VARS */
bin bu12_martin_adaE_tu_700, bu8_perry_adaE_sa_400, bu12_martin_o2_adaW, bu10_suarez_adaE_tu_530, bu10_suarez_adaW_sa_430, adaE_sa_500, adaE_sa_200, bu14_tbd_adaW_sa_300, bu12_martin_adaE_th_530, bu12_suarez_adaE_th_400, adaW_sa_230, gu11_cardinale_adaE_tu_600, gu11_cardinale_adaE_sa_330, bu14_tbd_adaW_fr_430, bu11_anderson_o1_adaE, bu10_suarez_adaE_th_330, bu11_anderson_adaE_th_700, bu14_tbd_adaW_fr_530, bu11_anderson_adaE_tu_600, gu11_cardinale_adaE_tu_300, gu13_tbd_adaW_tu_500, bu9_serrano_adaE_sa_600, gu13_tbd_adaE_th_430, gu13_tbd_adaE_sa_300, bu11_anderson_o1_adaW, bu12_suarez_adaW_sa_430, bu12_suarez_o1_adaW, gu13_tbd_adaE_fr_330, adaE_th_400, bu9_serrano_adaE_tu_330, bu8_perry_o1_adaW, adaW_sa_200, bu12_martin_adaW_th_300, gu9_tbd_adaE_sa_530, bu11_anderson_adaW_sa_230, bu8_perry_adaW_sa_700, bu12_suarez_adaW_sa_600, adaW_sa_500, gu11_cardinale_adaE_th_630, bu10_suarez_adaE_sa_400, gu11_cardinale_adaE_sa_300, bu10_suarez_adaW_sa_500, bu9_serrano_adaW_sa_200, bu12_martin_o3_adaW, gu11_cardinale_adaE_tu_400, bu10_suarez_o1_adaW, bu12_martin_adaE_th_400, bu9_serrano_adaE_th_300, bu12_suarez_adaE_sa_200, gu11_cardinale_adaE_sa_600, adaE_sa_330, adaW_sa_630, gu13_tbd_adaE_fr_300, bu14_tbd_o1_adaE, gu9_tbd_adaE_th_630, gu13_tbd_adaE_th_330, bu14_tbd_adaE_tu_530, gu9_tbd_adaW_sa_630, gu9_tbd_adaE_sa_300, bu12_martin_o2, adaE_tu_500, gu9_tbd_o1_adaE, gu11_cardinale_adaE_sa_230, gu13_tbd_adaE_th_700, bu11_anderson_adaE_th_330, bu12_suarez_adaE_tu_330, bu10_suarez_adaE_tu_630, bu14_tbd_adaW_sa_400, gu13_tbd_adaE_tu_500, bu8_perry_adaW_sa_600, bu11_anderson_adaE_sa_530, bu9_serrano_adaW_sa_400, bu14_tbd_adaE_fr_500, bu12_suarez_adaW_sa_200, bu14_tbd_adaE_tu_700, bu8_perry_adaE_th_700, bu8_perry_adaE_sa_630, bu12_suarez_adaE_tu_400, bu8_perry_adaW_sa_300, gu9_tbd_adaE_tu_700, bu12_martin_adaE_we_400, bu14_tbd_o2_adaE, bu12_martin_adaE_tu_430, bu14_tbd_adaE_fr_430, bu12_martin_adaE_sa_400, bu8_perry_adaE_sa_230, gu11_cardinale_adaE_tu_430, bu9_serrano_adaW_sa_630, bu12_suarez_adaE_tu_430, bu10_suarez_adaE_sa_200, bu10_suarez_adaE_sa_230, gu13_tbd_adaW_sa_700, adaE_sa_400, adaE_tu_530, gu11_cardinale_adaE_sa_700, adaE_th_630, bu12_martin_o1_adaW, bu12_suarez_adaE_sa_600, gu11_cardinale_adaE_sa_500, bu12_martin_adaW_tu_300, bu8_perry_adaE_tu_300, bu12_martin_adaW_fr_400, gu9_tbd_adaE_tu_400, bu14_tbd_adaE_th_630, gu11_cardinale_adaE_th_530, bu11_anderson_adaW_sa_430, gu13_tbd_adaE_th_500, bu9_serrano_adaW_sa_430, bu11_anderson_adaE_th_430, gu13_tbd_adaW_sa_330, gu9_tbd_adaW_sa_400, gu13_tbd_adaW_we_330, bu12_martin_adaW_sa_330, bu12_suarez_adaE_th_700, gu13_tbd_adaE_th_400, bu14_tbd_adaW_we_400, bu14_tbd_adaE_th_300, adaE_th_530, bu9_serrano_adaE_sa_430, bu12_martin_adaE_tu_400, gu13_tbd_adaW_sa_630, bu10_suarez_adaW_sa_630, bu9_serrano_adaE_sa_530, gu13_tbd_o1_adaE, gu11_cardinale_adaE_th_700, gu9_tbd_adaE_tu_330, gu9_tbd_adaW_sa_700, adaW_sa_300, bu12_martin_adaW_we_400, bu9_serrano_o1_adaE, bu12_suarez_adaE_sa_630, bu12_martin_o2_adaE, bu11_anderson_adaW_sa_700, bu11_anderson_adaW_sa_600, bu9_serrano_adaW_sa_500, bu8_perry_adaE_tu_500, bu12_martin_o1, bu14_tbd_adaW_sa_630, bu14_tbd_o1, bu12_martin_adaE_th_330, bu14_tbd_adaW_sa_600, bu11_anderson_adaW_sa_400, bu11_anderson_adaW_sa_300, adaW_sa_530, bu12_suarez_adaW_sa_630, bu10_suarez_adaE_th_700, bu12_martin_adaW_fr_430, bu10_suarez_adaE_sa_700, bu12_suarez_adaE_th_630, bu11_anderson_adaE_tu_330, bu10_suarez_adaE_sa_300, bu14_tbd_adaE_tu_300, bu10_suarez_adaE_sa_430, bu9_serrano_adaE_sa_700, gu13_tbd_adaE_tu_600, bu14_tbd_adaW_sa_500, bu12_martin_adaE_th_630, bu14_tbd_adaE_sa_300, gu11_cardinale_adaE_sa_200, gu11_cardinale_o1_adaE, bu14_tbd_adaE_we_500, bu14_tbd_adaW_sa_230, bu8_perry_adaW_sa_400, bu12_suarez_adaE_th_330, bu14_tbd_adaE_th_700, bu12_suarez_adaW_sa_700, gu13_tbd_adaW_sa_300, gu9_tbd_adaE_th_700, bu12_martin_adaE_tu_630, bu9_serrano_adaW_sa_530, bu8_perry_adaW_sa_200, bu8_perry_adaE_tu_600, bu9_serrano_adaW_sa_700, bu10_suarez_adaE_tu_430, adaE_th_700, bu12_martin_adaE_we_430, gu11_cardinale_adaE_tu_530, bu12_martin_adaE_sa_200, bu9_serrano_adaW_sa_230, bu11_anderson_adaE_tu_530, gu9_tbd_adaW_sa_330, gu9_tbd_adaE_sa_430, adaE_tu_400, bu8_perry_adaW_sa_430, bu12_suarez_o1_adaE, gu9_tbd_adaE_tu_300, gu11_cardinale_adaE_tu_500, bu14_tbd_adaE_tu_400, gu9_tbd_adaE_th_600, bu12_martin_adaE_sa_630, bu8_perry_adaE_tu_330, bu14_tbd_adaE_sa_630, bu9_serrano_adaE_tu_700, gu9_tbd_adaW_sa_230, bu10_suarez_adaW_sa_200, bu12_suarez_adaE_tu_630, gu11_cardinale_adaE_tu_700, bu10_suarez_adaE_sa_530, gu13_tbd_adaE_tu_530, gu11_cardinale_adaE_th_430, bu14_tbd_adaW_sa_200, bu8_perry_adaE_th_400, bu14_tbd_adaE_th_430, adaW_sa_700, bu12_suarez_adaE_sa_400, bu12_martin_adaW_sa_630, bu10_suarez_adaE_tu_400, bu12_martin_adaE_tu_600, bu12_martin_adaW_sa_400, gu11_cardinale_adaE_sa_430, bu10_suarez_adaE_sa_500, bu10_suarez_adaW_sa_530, bu9_serrano_adaE_th_530, bu14_tbd_adaE_fr_400, adaE_tu_700, bu14_tbd_adaE_tu_500, bu14_tbd_o3_adaW, bu10_suarez_adaE_th_300, gu13_tbd_adaE_tu_400, bu12_suarez_adaW_sa_330, adaE_th_430, gu9_tbd_adaW_sa_500, gu9_tbd_adaE_tu_430, gu11_cardinale_adaW_sa_600, bu12_martin_adaW_sa_430, bu12_martin_o1_adaE, adaE_sa_630, gu9_tbd_o1, bu14_tbd_adaE_we_530, gu11_cardinale_adaW_sa_430, bu11_anderson_adaE_tu_700, bu8_perry_adaE_sa_530, bu8_perry_adaE_tu_630, bu10_suarez_o1, adaE_tu_430, gu13_tbd_adaE_th_530, bu12_suarez_adaE_sa_330, bu14_tbd_adaW_fr_400, gu13_tbd_adaE_sa_430, gu9_tbd_adaE_th_330, bu12_martin_adaE_th_500, gu13_tbd_adaW_sa_430, bu12_martin_adaE_sa_600, bu11_anderson_adaW_sa_500, gu9_tbd_adaE_sa_200, bu8_perry_adaW_sa_630, adaE_th_330, bu14_tbd_adaE_sa_330, bu11_anderson_adaE_tu_430, gu13_tbd_adaE_sa_600, gu9_tbd_adaE_sa_330, bu12_suarez_adaE_tu_700, bu11_anderson_adaE_sa_630, gu11_cardinale_adaW_sa_500, gu9_tbd_adaE_sa_700, bu10_suarez_adaW_sa_600, adaE_tu_300, bu12_martin_adaE_tu_500, bu11_anderson_adaE_sa_500, gu9_tbd_adaE_th_500, gu11_cardinale_adaE_th_330, bu14_tbd_adaE_sa_400, bu14_tbd_adaE_sa_600, bu12_martin_adaE_fr_430, gu11_cardinale_o1_adaW, gu13_tbd_adaE_we_330, bu12_suarez_adaE_tu_500, bu8_perry_adaE_tu_530, bu10_suarez_adaE_sa_330, gu13_tbd_adaE_sa_530, bu8_perry_adaE_sa_700, bu9_serrano_adaE_th_400, gu13_tbd_adaE_sa_500, gu11_cardinale_adaE_th_400, bu9_serrano_adaE_tu_630, bu11_anderson_adaE_th_600, gu9_tbd_adaE_tu_500, bu8_perry_adaW_sa_330, gu13_tbd_o2, gu13_tbd_adaE_tu_430, bu12_martin_adaE_th_600, bu14_tbd_adaW_we_500, bu8_perry_adaW_sa_230, bu9_serrano_adaE_tu_430, adaW_sa_400, bu12_martin_adaE_tu_330, bu8_perry_adaE_tu_400, gu13_tbd_adaE_tu_700, bu12_martin_adaW_th_330, bu8_perry_adaE_th_530, gu13_tbd_adaW_sa_400, bu10_suarez_adaE_th_400, bu14_tbd_adaW_sa_700, bu11_anderson_adaE_th_530, bu10_suarez_adaE_tu_600, gu13_tbd_adaE_th_630, bu12_martin_adaW_sa_700, bu12_suarez_adaE_sa_300, gu13_tbd_o2_adaE, bu9_serrano_adaE_th_600, bu11_anderson_adaE_sa_230, bu9_serrano_adaE_sa_500, gu11_cardinale_adaE_sa_400, bu12_martin_adaW_sa_530, bu11_anderson_adaE_tu_500, bu12_suarez_adaW_sa_230, bu10_suarez_adaE_tu_700, bu12_suarez_adaE_tu_300, bu9_serrano_adaE_tu_600, gu13_tbd_adaE_th_300, adaE_th_600, bu11_anderson_adaE_sa_400, bu8_perry_adaE_th_630, bu8_perry_adaW_sa_500, bu12_martin_adaE_sa_430, bu11_anderson_adaE_th_300, bu9_serrano_adaE_th_630, bu11_anderson_adaE_th_500, bu8_perry_adaE_th_500, bu12_suarez_adaE_sa_530, gu13_tbd_adaW_th_500, bu14_tbd_o3_adaE, bu10_suarez_adaW_sa_330, bu9_serrano_adaW_sa_330, bu9_serrano_adaE_th_700, bu11_anderson_adaE_sa_430, bu14_tbd_adaE_sa_230, bu10_suarez_adaW_sa_400, adaE_sa_530, bu12_martin_adaE_tu_530, gu13_tbd_adaE_sa_330, bu12_martin_adaW_sa_200, adaW_sa_330, bu9_serrano_adaE_tu_530, bu12_martin_adaE_fr_400, bu10_suarez_adaE_sa_600, bu8_perry_o1_adaE, bu11_anderson_adaE_th_400, gu13_tbd_adaW_sa_500, bu10_suarez_adaE_th_430, bu14_tbd_adaE_th_600, bu14_tbd_adaE_sa_700, bu12_suarez_adaE_sa_700, gu13_tbd_o3, bu14_tbd_adaE_we_400, gu13_tbd_o1_adaW, bu9_serrano_adaE_sa_330, bu11_anderson_adaE_tu_630, bu12_martin_adaE_sa_500, bu14_tbd_adaE_sa_500, bu11_anderson_adaE_sa_600, gu13_tbd_adaW_sa_530, bu10_suarez_adaW_sa_300, bu11_anderson_adaE_tu_300, bu14_tbd_adaW_sa_530, gu11_cardinale_adaW_sa_300, gu13_tbd_adaE_th_600, gu11_cardinale_adaE_sa_530, bu14_tbd_adaE_tu_600, bu11_anderson_adaW_sa_530, bu14_tbd_adaE_tu_330, bu11_anderson_o1, bu10_suarez_adaE_tu_500, gu9_tbd_adaE_tu_630, gu9_tbd_adaW_sa_430, bu8_perry_adaE_sa_500, bu11_anderson_adaW_sa_630, gu13_tbd_adaE_sa_630, bu11_anderson_adaW_sa_330, bu10_suarez_o1_adaE, gu9_tbd_o1_adaW, bu12_suarez_adaE_tu_600, adaE_th_300, bu12_martin_adaE_th_700, bu11_anderson_adaE_sa_300, bu9_serrano_adaE_sa_630, gu11_cardinale_adaE_th_300, bu10_suarez_adaE_th_530, gu13_tbd_adaE_sa_700, bu12_martin_o3_adaE, bu14_tbd_adaW_sa_430, bu8_perry_o1, bu8_perry_adaE_sa_300, bu12_suarez_adaE_sa_500, bu9_serrano_adaW_sa_300, bu10_suarez_adaW_sa_230, bu8_perry_adaE_tu_430, bu14_tbd_o2_adaW, bu10_suarez_adaE_th_600, bu12_suarez_adaE_th_300, gu13_tbd_adaW_th_530, gu13_tbd_adaW_we_300, bu9_serrano_adaE_sa_200, bu14_tbd_adaE_sa_430, gu9_tbd_adaW_sa_530, bu9_serrano_o1_adaW, bu14_tbd_adaW_we_530, bu14_tbd_o3, bu10_suarez_adaE_tu_330, bu8_perry_adaE_th_430, bu12_martin_adaE_tu_300, bu12_martin_adaE_sa_530, gu9_tbd_adaE_sa_630, bu12_martin_adaW_sa_500, bu12_suarez_adaE_sa_430, gu9_tbd_adaE_tu_600, bu9_serrano_adaE_tu_300, bu12_suarez_adaE_th_600, gu11_cardinale_adaE_sa_630, adaW_sa_600, bu12_martin_adaE_th_300, bu10_suarez_adaE_th_630, gu13_tbd_adaE_sa_230, bu8_perry_adaE_th_330, bu9_serrano_adaE_th_500, adaE_tu_330, bu14_tbd_adaE_tu_430, gu9_tbd_adaE_sa_400, bu11_anderson_adaE_sa_200, bu8_perry_adaE_tu_700, gu13_tbd_adaE_tu_630, bu14_tbd_adaE_th_400, bu9_serrano_adaE_sa_300, bu12_martin_adaE_sa_230, adaE_tu_630, bu12_suarez_adaW_sa_300, gu13_tbd_o2_adaW, bu9_serrano_adaE_th_430, bu8_perry_adaE_sa_200, gu13_tbd_adaW_sa_600, bu9_serrano_adaW_sa_600, adaE_sa_230, bu8_perry_adaW_sa_530, adaE_sa_600, gu13_tbd_o3_adaW, bu12_suarez_adaW_sa_400, gu11_cardinale_adaW_sa_530, bu8_perry_adaE_sa_600, adaE_sa_700, gu9_tbd_adaW_sa_300, gu11_cardinale_adaW_sa_330, bu12_suarez_adaE_th_500, bu14_tbd_o2, gu9_tbd_adaE_th_300, gu13_tbd_adaE_sa_400, adaE_sa_430, gu9_tbd_adaE_th_530, bu14_tbd_adaE_tu_630, bu14_tbd_adaW_we_430, gu13_tbd_adaW_fr_300, gu9_tbd_adaE_sa_600, bu12_martin_adaE_sa_330, bu9_serrano_o1, bu12_martin_adaW_sa_300, gu13_tbd_adaE_we_300, gu13_tbd_adaE_tu_300, adaE_th_500, bu12_suarez_adaE_th_530, gu11_cardinale_adaW_sa_700, bu12_suarez_adaW_sa_500, bu12_martin_adaE_sa_700, adaE_sa_300, bu12_martin_adaW_sa_230, gu9_tbd_adaE_tu_530, gu13_tbd_adaW_tu_530, gu9_tbd_adaE_sa_230, bu14_tbd_o1_adaW, gu11_cardinale_adaE_th_600, bu8_perry_adaE_th_600, gu9_tbd_adaE_th_400, gu11_cardinale_adaW_sa_630, bu11_anderson_adaE_tu_400, bu14_tbd_adaE_fr_530, gu13_tbd_o3_adaE, bu14_tbd_adaE_sa_200, bu12_suarez_adaW_sa_530, bu10_suarez_adaE_tu_300, bu12_suarez_adaE_th_430, bu11_anderson_adaW_sa_200, gu9_tbd_adaW_sa_600, gu13_tbd_adaW_sa_230, adaE_tu_600, gu11_cardinale_adaE_tu_330, bu9_serrano_adaE_sa_400, bu14_tbd_adaE_we_430, bu9_serrano_adaE_th_330, bu12_martin_adaW_tu_330, bu9_serrano_adaE_tu_400, bu14_tbd_adaE_th_530, gu11_cardinale_adaE_th_500, bu14_tbd_adaW_sa_330, bu12_suarez_adaE_sa_230, gu11_cardinale_adaW_sa_200, bu9_serrano_adaE_tu_500, bu11_anderson_adaE_sa_700, gu11_cardinale_adaE_tu_630, adaW_sa_430, bu8_perry_adaE_sa_330, gu11_cardinale_adaW_sa_400, bu12_martin_o3, gu13_tbd_adaW_sa_200, gu9_tbd_adaE_th_430, bu12_martin_adaE_th_430, bu9_serrano_adaE_sa_230, gu13_tbd_adaE_sa_200, bu14_tbd_adaW_fr_500, bu12_suarez_o1, gu13_tbd_adaW_fr_330, bu8_perry_adaE_sa_430, gu13_tbd_o1, bu12_martin_adaW_sa_600, bu11_anderson_adaE_sa_330, bu10_suarez_adaE_th_500, gu11_cardinale_o1, gu13_tbd_adaE_tu_330, bu8_perry_adaE_th_300, bu14_tbd_adaE_th_330, bu10_suarez_adaW_sa_700, bu10_suarez_adaE_sa_630, bu12_martin_adaW_we_430, gu9_tbd_adaE_sa_500, gu9_tbd_adaW_sa_200, bu12_martin_adaE_sa_300, bu14_tbd_adaE_th_500, bu11_anderson_adaE_th_630, bu12_suarez_adaE_tu_530, gu11_cardinale_adaW_sa_230, bu14_tbd_adaE_sa_530;
