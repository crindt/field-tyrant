min: 0
 + 100 bu8_perry_o1
 + 1 gu9_reza_o1 + 200 gu9_reza_o2
 + 1 bu9_serrano_o1 + 200 bu9_serrano_o2
 + 1 bu10_suarez_o1 + 200 bu10_suarez_o2
 + 1 bu11_anderson_o1 + 200 bu11_anderson_o2
 + 1 gu11_cardinale_o1 + 200 gu11_cardinale_o2
 + 1 bu12_martin_o1 + 200 bu12_martin_o2
 + 100 bu12_suarez_o1
 + 1 gu13_fisher_o1 + 200 gu13_fisher_o2
 + 100 bu14_suarez_o1
;
/* Must pick one option for each team */
bu8_perry_o1 = 1;
gu9_reza_o1 + gu9_reza_o2 = 1;
bu9_serrano_o1 + bu9_serrano_o2 = 1;
bu10_suarez_o1 + bu10_suarez_o2 = 1;
bu11_anderson_o1 + bu11_anderson_o2 = 1;
gu11_cardinale_o1 + gu11_cardinale_o2 = 1;
bu12_martin_o1 + bu12_martin_o2 = 1;
bu12_suarez_o1 = 1;
gu13_fisher_o1 + gu13_fisher_o2 = 1;
bu14_suarez_o1 = 1;

/* team options */
bu8_perry_o1 = bu8_perry_o1_adaE+bu8_perry_o1_berkS1+bu8_perry_o1_berkS2;

gu9_reza_o1 = gu9_reza_o1_adaE+gu9_reza_o1_berkS1+gu9_reza_o1_berkS2;
6 gu9_reza_o1_adaE = gu9_reza_adaE_mo_1630 + gu9_reza_adaE_mo_1700 + gu9_reza_adaE_mo_1730 + gu9_reza_adaE_we_1630 + gu9_reza_adaE_we_1700 + gu9_reza_adaE_we_1730;
6 gu9_reza_o1_berkS1 = gu9_reza_berkS1_mo_1630 + gu9_reza_berkS1_mo_1700 + gu9_reza_berkS1_mo_1730 + gu9_reza_berkS1_we_1630 + gu9_reza_berkS1_we_1700 + gu9_reza_berkS1_we_1730;
6 gu9_reza_o1_berkS2 = gu9_reza_berkS2_mo_1630 + gu9_reza_berkS2_mo_1700 + gu9_reza_berkS2_mo_1730 + gu9_reza_berkS2_we_1630 + gu9_reza_berkS2_we_1700 + gu9_reza_berkS2_we_1730;

gu9_reza_o2 = gu9_reza_o2_adaE+gu9_reza_o2_berkS1+gu9_reza_o2_berkS2;

bu9_serrano_o1 = bu9_serrano_o1_adaE+bu9_serrano_o1_berkS1+bu9_serrano_o1_berkS2;
3 bu9_serrano_o1_adaE = bu9_serrano_adaE_we_1630 + bu9_serrano_adaE_we_1700 + bu9_serrano_adaE_we_1730;
3 bu9_serrano_o1_berkS1 = bu9_serrano_berkS1_we_1630 + bu9_serrano_berkS1_we_1700 + bu9_serrano_berkS1_we_1730;
3 bu9_serrano_o1_berkS2 = bu9_serrano_berkS2_we_1630 + bu9_serrano_berkS2_we_1700 + bu9_serrano_berkS2_we_1730;

bu9_serrano_o2 = bu9_serrano_o2_adaE+bu9_serrano_o2_berkS1+bu9_serrano_o2_berkS2;

bu10_suarez_o1 = bu10_suarez_o1_adaE+bu10_suarez_o1_berkS1+bu10_suarez_o1_berkS2;
3 bu10_suarez_o1_adaE = bu10_suarez_adaE_fr_1600 + bu10_suarez_adaE_fr_1630 + bu10_suarez_adaE_fr_1700;
3 bu10_suarez_o1_berkS1 = bu10_suarez_berkS1_fr_1600 + bu10_suarez_berkS1_fr_1630 + bu10_suarez_berkS1_fr_1700;
3 bu10_suarez_o1_berkS2 = bu10_suarez_berkS2_fr_1600 + bu10_suarez_berkS2_fr_1630 + bu10_suarez_berkS2_fr_1700;

bu10_suarez_o2 = bu10_suarez_o2_adaE+bu10_suarez_o2_berkS1+bu10_suarez_o2_berkS2;

bu11_anderson_o1 = bu11_anderson_o1_adaE+bu11_anderson_o1_berkS1+bu11_anderson_o1_berkS2;
6 bu11_anderson_o1_adaE = bu11_anderson_adaE_tu_1630 + bu11_anderson_adaE_tu_1700 + bu11_anderson_adaE_tu_1730 + bu11_anderson_adaE_th_1630 + bu11_anderson_adaE_th_1700 + bu11_anderson_adaE_th_1730;
6 bu11_anderson_o1_berkS1 = bu11_anderson_berkS1_tu_1630 + bu11_anderson_berkS1_tu_1700 + bu11_anderson_berkS1_tu_1730 + bu11_anderson_berkS1_th_1630 + bu11_anderson_berkS1_th_1700 + bu11_anderson_berkS1_th_1730;
6 bu11_anderson_o1_berkS2 = bu11_anderson_berkS2_tu_1630 + bu11_anderson_berkS2_tu_1700 + bu11_anderson_berkS2_tu_1730 + bu11_anderson_berkS2_th_1630 + bu11_anderson_berkS2_th_1700 + bu11_anderson_berkS2_th_1730;

bu11_anderson_o2 = bu11_anderson_o2_adaE+bu11_anderson_o2_berkS1+bu11_anderson_o2_berkS2;

gu11_cardinale_o1 = gu11_cardinale_o1_adaE+gu11_cardinale_o1_berkS1+gu11_cardinale_o1_berkS2;
6 gu11_cardinale_o1_adaE = gu11_cardinale_adaE_tu_1630 + gu11_cardinale_adaE_tu_1700 + gu11_cardinale_adaE_tu_1730 + gu11_cardinale_adaE_th_1630 + gu11_cardinale_adaE_th_1700 + gu11_cardinale_adaE_th_1730;
6 gu11_cardinale_o1_berkS1 = gu11_cardinale_berkS1_tu_1630 + gu11_cardinale_berkS1_tu_1700 + gu11_cardinale_berkS1_tu_1730 + gu11_cardinale_berkS1_th_1630 + gu11_cardinale_berkS1_th_1700 + gu11_cardinale_berkS1_th_1730;
6 gu11_cardinale_o1_berkS2 = gu11_cardinale_berkS2_tu_1630 + gu11_cardinale_berkS2_tu_1700 + gu11_cardinale_berkS2_tu_1730 + gu11_cardinale_berkS2_th_1630 + gu11_cardinale_berkS2_th_1700 + gu11_cardinale_berkS2_th_1730;

gu11_cardinale_o2 = gu11_cardinale_o2_adaE+gu11_cardinale_o2_berkS1+gu11_cardinale_o2_berkS2;

bu12_martin_o1 = bu12_martin_o1_adaE+bu12_martin_o1_berkS1+bu12_martin_o1_berkS2;
6 bu12_martin_o1_adaE = bu12_martin_adaE_tu_1630 + bu12_martin_adaE_tu_1700 + bu12_martin_adaE_tu_1730 + bu12_martin_adaE_th_1630 + bu12_martin_adaE_th_1700 + bu12_martin_adaE_th_1730;
6 bu12_martin_o1_berkS1 = bu12_martin_berkS1_tu_1630 + bu12_martin_berkS1_tu_1700 + bu12_martin_berkS1_tu_1730 + bu12_martin_berkS1_th_1630 + bu12_martin_berkS1_th_1700 + bu12_martin_berkS1_th_1730;
6 bu12_martin_o1_berkS2 = bu12_martin_berkS2_tu_1630 + bu12_martin_berkS2_tu_1700 + bu12_martin_berkS2_tu_1730 + bu12_martin_berkS2_th_1630 + bu12_martin_berkS2_th_1700 + bu12_martin_berkS2_th_1730;

bu12_martin_o2 = bu12_martin_o2_adaE+bu12_martin_o2_berkS1+bu12_martin_o2_berkS2;

bu12_suarez_o1 = bu12_suarez_o1_adaE+bu12_suarez_o1_berkS1+bu12_suarez_o1_berkS2;

gu13_fisher_o1 = gu13_fisher_o1_adaE+gu13_fisher_o1_berkS1+gu13_fisher_o1_berkS2;
6 gu13_fisher_o1_adaE = gu13_fisher_adaE_mo_1630 + gu13_fisher_adaE_mo_1700 + gu13_fisher_adaE_mo_1730 + gu13_fisher_adaE_we_1630 + gu13_fisher_adaE_we_1700 + gu13_fisher_adaE_we_1730;
6 gu13_fisher_o1_berkS1 = gu13_fisher_berkS1_mo_1630 + gu13_fisher_berkS1_mo_1700 + gu13_fisher_berkS1_mo_1730 + gu13_fisher_berkS1_we_1630 + gu13_fisher_berkS1_we_1700 + gu13_fisher_berkS1_we_1730;
6 gu13_fisher_o1_berkS2 = gu13_fisher_berkS2_mo_1630 + gu13_fisher_berkS2_mo_1700 + gu13_fisher_berkS2_mo_1730 + gu13_fisher_berkS2_we_1630 + gu13_fisher_berkS2_we_1700 + gu13_fisher_berkS2_we_1730;

gu13_fisher_o2 = gu13_fisher_o2_adaE+gu13_fisher_o2_berkS1+gu13_fisher_o2_berkS2;

bu14_suarez_o1 = bu14_suarez_o1_adaE+bu14_suarez_o1_berkS1+bu14_suarez_o1_berkS2;

/* DON'T OVERBOOK FIELDS */
adaE_tu_1500 <= 1.5;
adaE_tu_1500 = bu8_perry_adaE_tu_1500 + gu9_reza_adaE_tu_1500 + bu9_serrano_adaE_tu_1500 + bu10_suarez_adaE_tu_1500 + bu11_anderson_adaE_tu_1500 + gu11_cardinale_adaE_tu_1500 + bu12_martin_adaE_tu_1500 + bu12_suarez_adaE_tu_1500 + gu13_fisher_adaE_tu_1500 + bu14_suarez_adaE_tu_1500;

adaE_tu_1530 <= 1.5;
adaE_tu_1530 = bu8_perry_adaE_tu_1530 + gu9_reza_adaE_tu_1530 + bu9_serrano_adaE_tu_1530 + bu10_suarez_adaE_tu_1530 + bu11_anderson_adaE_tu_1530 + gu11_cardinale_adaE_tu_1530 + bu12_martin_adaE_tu_1530 + bu12_suarez_adaE_tu_1530 + gu13_fisher_adaE_tu_1530 + bu14_suarez_adaE_tu_1530;

adaE_tu_1600 <= 1.5;
adaE_tu_1600 = bu8_perry_adaE_tu_1600 + gu9_reza_adaE_tu_1600 + bu9_serrano_adaE_tu_1600 + bu10_suarez_adaE_tu_1600 + bu11_anderson_adaE_tu_1600 + gu11_cardinale_adaE_tu_1600 + bu12_martin_adaE_tu_1600 + bu12_suarez_adaE_tu_1600 + gu13_fisher_adaE_tu_1600 + bu14_suarez_adaE_tu_1600;

adaE_tu_1630 <= 1.5;
adaE_tu_1630 = bu8_perry_adaE_tu_1630 + gu9_reza_adaE_tu_1630 + bu9_serrano_adaE_tu_1630 + bu10_suarez_adaE_tu_1630 + bu11_anderson_adaE_tu_1630 + gu11_cardinale_adaE_tu_1630 + bu12_martin_adaE_tu_1630 + bu12_suarez_adaE_tu_1630 + gu13_fisher_adaE_tu_1630 + bu14_suarez_adaE_tu_1630;

adaE_tu_1700 <= 1.5;
adaE_tu_1700 = bu8_perry_adaE_tu_1700 + gu9_reza_adaE_tu_1700 + bu9_serrano_adaE_tu_1700 + bu10_suarez_adaE_tu_1700 + bu11_anderson_adaE_tu_1700 + gu11_cardinale_adaE_tu_1700 + bu12_martin_adaE_tu_1700 + bu12_suarez_adaE_tu_1700 + gu13_fisher_adaE_tu_1700 + bu14_suarez_adaE_tu_1700;

adaE_tu_1730 <= 1.5;
adaE_tu_1730 = bu8_perry_adaE_tu_1730 + gu9_reza_adaE_tu_1730 + bu9_serrano_adaE_tu_1730 + bu10_suarez_adaE_tu_1730 + bu11_anderson_adaE_tu_1730 + gu11_cardinale_adaE_tu_1730 + bu12_martin_adaE_tu_1730 + bu12_suarez_adaE_tu_1730 + gu13_fisher_adaE_tu_1730 + bu14_suarez_adaE_tu_1730;

adaE_tu_1800 <= 1.5;
adaE_tu_1800 = bu8_perry_adaE_tu_1800 + gu9_reza_adaE_tu_1800 + bu9_serrano_adaE_tu_1800 + bu10_suarez_adaE_tu_1800 + bu11_anderson_adaE_tu_1800 + gu11_cardinale_adaE_tu_1800 + bu12_martin_adaE_tu_1800 + bu12_suarez_adaE_tu_1800 + gu13_fisher_adaE_tu_1800 + bu14_suarez_adaE_tu_1800;

adaE_tu_1830 <= 1.5;
adaE_tu_1830 = bu8_perry_adaE_tu_1830 + gu9_reza_adaE_tu_1830 + bu9_serrano_adaE_tu_1830 + bu10_suarez_adaE_tu_1830 + bu11_anderson_adaE_tu_1830 + gu11_cardinale_adaE_tu_1830 + bu12_martin_adaE_tu_1830 + bu12_suarez_adaE_tu_1830 + gu13_fisher_adaE_tu_1830 + bu14_suarez_adaE_tu_1830;

adaE_tu_1900 <= 1.5;
adaE_tu_1900 = bu8_perry_adaE_tu_1900 + gu9_reza_adaE_tu_1900 + bu9_serrano_adaE_tu_1900 + bu10_suarez_adaE_tu_1900 + bu11_anderson_adaE_tu_1900 + gu11_cardinale_adaE_tu_1900 + bu12_martin_adaE_tu_1900 + bu12_suarez_adaE_tu_1900 + gu13_fisher_adaE_tu_1900 + bu14_suarez_adaE_tu_1900;

adaE_th_1500 <= 1.5;
adaE_th_1500 = bu8_perry_adaE_th_1500 + gu9_reza_adaE_th_1500 + bu9_serrano_adaE_th_1500 + bu10_suarez_adaE_th_1500 + bu11_anderson_adaE_th_1500 + gu11_cardinale_adaE_th_1500 + bu12_martin_adaE_th_1500 + bu12_suarez_adaE_th_1500 + gu13_fisher_adaE_th_1500 + bu14_suarez_adaE_th_1500;

adaE_th_1530 <= 1.5;
adaE_th_1530 = bu8_perry_adaE_th_1530 + gu9_reza_adaE_th_1530 + bu9_serrano_adaE_th_1530 + bu10_suarez_adaE_th_1530 + bu11_anderson_adaE_th_1530 + gu11_cardinale_adaE_th_1530 + bu12_martin_adaE_th_1530 + bu12_suarez_adaE_th_1530 + gu13_fisher_adaE_th_1530 + bu14_suarez_adaE_th_1530;

adaE_th_1600 <= 1.5;
adaE_th_1600 = bu8_perry_adaE_th_1600 + gu9_reza_adaE_th_1600 + bu9_serrano_adaE_th_1600 + bu10_suarez_adaE_th_1600 + bu11_anderson_adaE_th_1600 + gu11_cardinale_adaE_th_1600 + bu12_martin_adaE_th_1600 + bu12_suarez_adaE_th_1600 + gu13_fisher_adaE_th_1600 + bu14_suarez_adaE_th_1600;

adaE_th_1630 <= 1.5;
adaE_th_1630 = bu8_perry_adaE_th_1630 + gu9_reza_adaE_th_1630 + bu9_serrano_adaE_th_1630 + bu10_suarez_adaE_th_1630 + bu11_anderson_adaE_th_1630 + gu11_cardinale_adaE_th_1630 + bu12_martin_adaE_th_1630 + bu12_suarez_adaE_th_1630 + gu13_fisher_adaE_th_1630 + bu14_suarez_adaE_th_1630;

adaE_th_1700 <= 1.5;
adaE_th_1700 = bu8_perry_adaE_th_1700 + gu9_reza_adaE_th_1700 + bu9_serrano_adaE_th_1700 + bu10_suarez_adaE_th_1700 + bu11_anderson_adaE_th_1700 + gu11_cardinale_adaE_th_1700 + bu12_martin_adaE_th_1700 + bu12_suarez_adaE_th_1700 + gu13_fisher_adaE_th_1700 + bu14_suarez_adaE_th_1700;

adaE_th_1730 <= 1.5;
adaE_th_1730 = bu8_perry_adaE_th_1730 + gu9_reza_adaE_th_1730 + bu9_serrano_adaE_th_1730 + bu10_suarez_adaE_th_1730 + bu11_anderson_adaE_th_1730 + gu11_cardinale_adaE_th_1730 + bu12_martin_adaE_th_1730 + bu12_suarez_adaE_th_1730 + gu13_fisher_adaE_th_1730 + bu14_suarez_adaE_th_1730;

adaE_th_1800 <= 1.5;
adaE_th_1800 = bu8_perry_adaE_th_1800 + gu9_reza_adaE_th_1800 + bu9_serrano_adaE_th_1800 + bu10_suarez_adaE_th_1800 + bu11_anderson_adaE_th_1800 + gu11_cardinale_adaE_th_1800 + bu12_martin_adaE_th_1800 + bu12_suarez_adaE_th_1800 + gu13_fisher_adaE_th_1800 + bu14_suarez_adaE_th_1800;

adaE_th_1830 <= 1.5;
adaE_th_1830 = bu8_perry_adaE_th_1830 + gu9_reza_adaE_th_1830 + bu9_serrano_adaE_th_1830 + bu10_suarez_adaE_th_1830 + bu11_anderson_adaE_th_1830 + gu11_cardinale_adaE_th_1830 + bu12_martin_adaE_th_1830 + bu12_suarez_adaE_th_1830 + gu13_fisher_adaE_th_1830 + bu14_suarez_adaE_th_1830;

adaE_th_1900 <= 1.5;
adaE_th_1900 = bu8_perry_adaE_th_1900 + gu9_reza_adaE_th_1900 + bu9_serrano_adaE_th_1900 + bu10_suarez_adaE_th_1900 + bu11_anderson_adaE_th_1900 + gu11_cardinale_adaE_th_1900 + bu12_martin_adaE_th_1900 + bu12_suarez_adaE_th_1900 + gu13_fisher_adaE_th_1900 + bu14_suarez_adaE_th_1900;

berkS1_tu_1500 <= 1.5;
berkS1_tu_1500 = bu8_perry_berkS1_tu_1500 + gu9_reza_berkS1_tu_1500 + bu9_serrano_berkS1_tu_1500 + bu10_suarez_berkS1_tu_1500 + bu11_anderson_berkS1_tu_1500 + gu11_cardinale_berkS1_tu_1500 + bu12_martin_berkS1_tu_1500 + bu12_suarez_berkS1_tu_1500 + gu13_fisher_berkS1_tu_1500 + bu14_suarez_berkS1_tu_1500;

berkS1_tu_1530 <= 1.5;
berkS1_tu_1530 = bu8_perry_berkS1_tu_1530 + gu9_reza_berkS1_tu_1530 + bu9_serrano_berkS1_tu_1530 + bu10_suarez_berkS1_tu_1530 + bu11_anderson_berkS1_tu_1530 + gu11_cardinale_berkS1_tu_1530 + bu12_martin_berkS1_tu_1530 + bu12_suarez_berkS1_tu_1530 + gu13_fisher_berkS1_tu_1530 + bu14_suarez_berkS1_tu_1530;

berkS1_tu_1600 <= 1.5;
berkS1_tu_1600 = bu8_perry_berkS1_tu_1600 + gu9_reza_berkS1_tu_1600 + bu9_serrano_berkS1_tu_1600 + bu10_suarez_berkS1_tu_1600 + bu11_anderson_berkS1_tu_1600 + gu11_cardinale_berkS1_tu_1600 + bu12_martin_berkS1_tu_1600 + bu12_suarez_berkS1_tu_1600 + gu13_fisher_berkS1_tu_1600 + bu14_suarez_berkS1_tu_1600;

berkS1_tu_1630 <= 1.5;
berkS1_tu_1630 = bu8_perry_berkS1_tu_1630 + gu9_reza_berkS1_tu_1630 + bu9_serrano_berkS1_tu_1630 + bu10_suarez_berkS1_tu_1630 + bu11_anderson_berkS1_tu_1630 + gu11_cardinale_berkS1_tu_1630 + bu12_martin_berkS1_tu_1630 + bu12_suarez_berkS1_tu_1630 + gu13_fisher_berkS1_tu_1630 + bu14_suarez_berkS1_tu_1630;

berkS1_tu_1700 <= 1.5;
berkS1_tu_1700 = bu8_perry_berkS1_tu_1700 + gu9_reza_berkS1_tu_1700 + bu9_serrano_berkS1_tu_1700 + bu10_suarez_berkS1_tu_1700 + bu11_anderson_berkS1_tu_1700 + gu11_cardinale_berkS1_tu_1700 + bu12_martin_berkS1_tu_1700 + bu12_suarez_berkS1_tu_1700 + gu13_fisher_berkS1_tu_1700 + bu14_suarez_berkS1_tu_1700;

berkS1_tu_1730 <= 1.5;
berkS1_tu_1730 = bu8_perry_berkS1_tu_1730 + gu9_reza_berkS1_tu_1730 + bu9_serrano_berkS1_tu_1730 + bu10_suarez_berkS1_tu_1730 + bu11_anderson_berkS1_tu_1730 + gu11_cardinale_berkS1_tu_1730 + bu12_martin_berkS1_tu_1730 + bu12_suarez_berkS1_tu_1730 + gu13_fisher_berkS1_tu_1730 + bu14_suarez_berkS1_tu_1730;

berkS1_tu_1800 <= 1.5;
berkS1_tu_1800 = bu8_perry_berkS1_tu_1800 + gu9_reza_berkS1_tu_1800 + bu9_serrano_berkS1_tu_1800 + bu10_suarez_berkS1_tu_1800 + bu11_anderson_berkS1_tu_1800 + gu11_cardinale_berkS1_tu_1800 + bu12_martin_berkS1_tu_1800 + bu12_suarez_berkS1_tu_1800 + gu13_fisher_berkS1_tu_1800 + bu14_suarez_berkS1_tu_1800;

berkS1_tu_1830 <= 1.5;
berkS1_tu_1830 = bu8_perry_berkS1_tu_1830 + gu9_reza_berkS1_tu_1830 + bu9_serrano_berkS1_tu_1830 + bu10_suarez_berkS1_tu_1830 + bu11_anderson_berkS1_tu_1830 + gu11_cardinale_berkS1_tu_1830 + bu12_martin_berkS1_tu_1830 + bu12_suarez_berkS1_tu_1830 + gu13_fisher_berkS1_tu_1830 + bu14_suarez_berkS1_tu_1830;

berkS1_tu_1900 <= 1.5;
berkS1_tu_1900 = bu8_perry_berkS1_tu_1900 + gu9_reza_berkS1_tu_1900 + bu9_serrano_berkS1_tu_1900 + bu10_suarez_berkS1_tu_1900 + bu11_anderson_berkS1_tu_1900 + gu11_cardinale_berkS1_tu_1900 + bu12_martin_berkS1_tu_1900 + bu12_suarez_berkS1_tu_1900 + gu13_fisher_berkS1_tu_1900 + bu14_suarez_berkS1_tu_1900;

berkS1_th_1500 <= 1.5;
berkS1_th_1500 = bu8_perry_berkS1_th_1500 + gu9_reza_berkS1_th_1500 + bu9_serrano_berkS1_th_1500 + bu10_suarez_berkS1_th_1500 + bu11_anderson_berkS1_th_1500 + gu11_cardinale_berkS1_th_1500 + bu12_martin_berkS1_th_1500 + bu12_suarez_berkS1_th_1500 + gu13_fisher_berkS1_th_1500 + bu14_suarez_berkS1_th_1500;

berkS1_th_1530 <= 1.5;
berkS1_th_1530 = bu8_perry_berkS1_th_1530 + gu9_reza_berkS1_th_1530 + bu9_serrano_berkS1_th_1530 + bu10_suarez_berkS1_th_1530 + bu11_anderson_berkS1_th_1530 + gu11_cardinale_berkS1_th_1530 + bu12_martin_berkS1_th_1530 + bu12_suarez_berkS1_th_1530 + gu13_fisher_berkS1_th_1530 + bu14_suarez_berkS1_th_1530;

berkS1_th_1600 <= 1.5;
berkS1_th_1600 = bu8_perry_berkS1_th_1600 + gu9_reza_berkS1_th_1600 + bu9_serrano_berkS1_th_1600 + bu10_suarez_berkS1_th_1600 + bu11_anderson_berkS1_th_1600 + gu11_cardinale_berkS1_th_1600 + bu12_martin_berkS1_th_1600 + bu12_suarez_berkS1_th_1600 + gu13_fisher_berkS1_th_1600 + bu14_suarez_berkS1_th_1600;

berkS1_th_1630 <= 1.5;
berkS1_th_1630 = bu8_perry_berkS1_th_1630 + gu9_reza_berkS1_th_1630 + bu9_serrano_berkS1_th_1630 + bu10_suarez_berkS1_th_1630 + bu11_anderson_berkS1_th_1630 + gu11_cardinale_berkS1_th_1630 + bu12_martin_berkS1_th_1630 + bu12_suarez_berkS1_th_1630 + gu13_fisher_berkS1_th_1630 + bu14_suarez_berkS1_th_1630;

berkS1_th_1700 <= 1.5;
berkS1_th_1700 = bu8_perry_berkS1_th_1700 + gu9_reza_berkS1_th_1700 + bu9_serrano_berkS1_th_1700 + bu10_suarez_berkS1_th_1700 + bu11_anderson_berkS1_th_1700 + gu11_cardinale_berkS1_th_1700 + bu12_martin_berkS1_th_1700 + bu12_suarez_berkS1_th_1700 + gu13_fisher_berkS1_th_1700 + bu14_suarez_berkS1_th_1700;

berkS1_th_1730 <= 1.5;
berkS1_th_1730 = bu8_perry_berkS1_th_1730 + gu9_reza_berkS1_th_1730 + bu9_serrano_berkS1_th_1730 + bu10_suarez_berkS1_th_1730 + bu11_anderson_berkS1_th_1730 + gu11_cardinale_berkS1_th_1730 + bu12_martin_berkS1_th_1730 + bu12_suarez_berkS1_th_1730 + gu13_fisher_berkS1_th_1730 + bu14_suarez_berkS1_th_1730;

berkS1_th_1800 <= 1.5;
berkS1_th_1800 = bu8_perry_berkS1_th_1800 + gu9_reza_berkS1_th_1800 + bu9_serrano_berkS1_th_1800 + bu10_suarez_berkS1_th_1800 + bu11_anderson_berkS1_th_1800 + gu11_cardinale_berkS1_th_1800 + bu12_martin_berkS1_th_1800 + bu12_suarez_berkS1_th_1800 + gu13_fisher_berkS1_th_1800 + bu14_suarez_berkS1_th_1800;

berkS1_th_1830 <= 1.5;
berkS1_th_1830 = bu8_perry_berkS1_th_1830 + gu9_reza_berkS1_th_1830 + bu9_serrano_berkS1_th_1830 + bu10_suarez_berkS1_th_1830 + bu11_anderson_berkS1_th_1830 + gu11_cardinale_berkS1_th_1830 + bu12_martin_berkS1_th_1830 + bu12_suarez_berkS1_th_1830 + gu13_fisher_berkS1_th_1830 + bu14_suarez_berkS1_th_1830;

berkS1_th_1900 <= 1.5;
berkS1_th_1900 = bu8_perry_berkS1_th_1900 + gu9_reza_berkS1_th_1900 + bu9_serrano_berkS1_th_1900 + bu10_suarez_berkS1_th_1900 + bu11_anderson_berkS1_th_1900 + gu11_cardinale_berkS1_th_1900 + bu12_martin_berkS1_th_1900 + bu12_suarez_berkS1_th_1900 + gu13_fisher_berkS1_th_1900 + bu14_suarez_berkS1_th_1900;

berkS2_tu_1500 <= 1.5;
berkS2_tu_1500 = bu8_perry_berkS2_tu_1500 + gu9_reza_berkS2_tu_1500 + bu9_serrano_berkS2_tu_1500 + bu10_suarez_berkS2_tu_1500 + bu11_anderson_berkS2_tu_1500 + gu11_cardinale_berkS2_tu_1500 + bu12_martin_berkS2_tu_1500 + bu12_suarez_berkS2_tu_1500 + gu13_fisher_berkS2_tu_1500 + bu14_suarez_berkS2_tu_1500;

berkS2_tu_1530 <= 1.5;
berkS2_tu_1530 = bu8_perry_berkS2_tu_1530 + gu9_reza_berkS2_tu_1530 + bu9_serrano_berkS2_tu_1530 + bu10_suarez_berkS2_tu_1530 + bu11_anderson_berkS2_tu_1530 + gu11_cardinale_berkS2_tu_1530 + bu12_martin_berkS2_tu_1530 + bu12_suarez_berkS2_tu_1530 + gu13_fisher_berkS2_tu_1530 + bu14_suarez_berkS2_tu_1530;

berkS2_tu_1600 <= 1.5;
berkS2_tu_1600 = bu8_perry_berkS2_tu_1600 + gu9_reza_berkS2_tu_1600 + bu9_serrano_berkS2_tu_1600 + bu10_suarez_berkS2_tu_1600 + bu11_anderson_berkS2_tu_1600 + gu11_cardinale_berkS2_tu_1600 + bu12_martin_berkS2_tu_1600 + bu12_suarez_berkS2_tu_1600 + gu13_fisher_berkS2_tu_1600 + bu14_suarez_berkS2_tu_1600;

berkS2_tu_1630 <= 1.5;
berkS2_tu_1630 = bu8_perry_berkS2_tu_1630 + gu9_reza_berkS2_tu_1630 + bu9_serrano_berkS2_tu_1630 + bu10_suarez_berkS2_tu_1630 + bu11_anderson_berkS2_tu_1630 + gu11_cardinale_berkS2_tu_1630 + bu12_martin_berkS2_tu_1630 + bu12_suarez_berkS2_tu_1630 + gu13_fisher_berkS2_tu_1630 + bu14_suarez_berkS2_tu_1630;

berkS2_tu_1700 <= 1.5;
berkS2_tu_1700 = bu8_perry_berkS2_tu_1700 + gu9_reza_berkS2_tu_1700 + bu9_serrano_berkS2_tu_1700 + bu10_suarez_berkS2_tu_1700 + bu11_anderson_berkS2_tu_1700 + gu11_cardinale_berkS2_tu_1700 + bu12_martin_berkS2_tu_1700 + bu12_suarez_berkS2_tu_1700 + gu13_fisher_berkS2_tu_1700 + bu14_suarez_berkS2_tu_1700;

berkS2_tu_1730 <= 1.5;
berkS2_tu_1730 = bu8_perry_berkS2_tu_1730 + gu9_reza_berkS2_tu_1730 + bu9_serrano_berkS2_tu_1730 + bu10_suarez_berkS2_tu_1730 + bu11_anderson_berkS2_tu_1730 + gu11_cardinale_berkS2_tu_1730 + bu12_martin_berkS2_tu_1730 + bu12_suarez_berkS2_tu_1730 + gu13_fisher_berkS2_tu_1730 + bu14_suarez_berkS2_tu_1730;

berkS2_tu_1800 <= 1.5;
berkS2_tu_1800 = bu8_perry_berkS2_tu_1800 + gu9_reza_berkS2_tu_1800 + bu9_serrano_berkS2_tu_1800 + bu10_suarez_berkS2_tu_1800 + bu11_anderson_berkS2_tu_1800 + gu11_cardinale_berkS2_tu_1800 + bu12_martin_berkS2_tu_1800 + bu12_suarez_berkS2_tu_1800 + gu13_fisher_berkS2_tu_1800 + bu14_suarez_berkS2_tu_1800;

berkS2_tu_1830 <= 1.5;
berkS2_tu_1830 = bu8_perry_berkS2_tu_1830 + gu9_reza_berkS2_tu_1830 + bu9_serrano_berkS2_tu_1830 + bu10_suarez_berkS2_tu_1830 + bu11_anderson_berkS2_tu_1830 + gu11_cardinale_berkS2_tu_1830 + bu12_martin_berkS2_tu_1830 + bu12_suarez_berkS2_tu_1830 + gu13_fisher_berkS2_tu_1830 + bu14_suarez_berkS2_tu_1830;

berkS2_tu_1900 <= 1.5;
berkS2_tu_1900 = bu8_perry_berkS2_tu_1900 + gu9_reza_berkS2_tu_1900 + bu9_serrano_berkS2_tu_1900 + bu10_suarez_berkS2_tu_1900 + bu11_anderson_berkS2_tu_1900 + gu11_cardinale_berkS2_tu_1900 + bu12_martin_berkS2_tu_1900 + bu12_suarez_berkS2_tu_1900 + gu13_fisher_berkS2_tu_1900 + bu14_suarez_berkS2_tu_1900;

berkS2_th_1500 <= 1.5;
berkS2_th_1500 = bu8_perry_berkS2_th_1500 + gu9_reza_berkS2_th_1500 + bu9_serrano_berkS2_th_1500 + bu10_suarez_berkS2_th_1500 + bu11_anderson_berkS2_th_1500 + gu11_cardinale_berkS2_th_1500 + bu12_martin_berkS2_th_1500 + bu12_suarez_berkS2_th_1500 + gu13_fisher_berkS2_th_1500 + bu14_suarez_berkS2_th_1500;

berkS2_th_1530 <= 1.5;
berkS2_th_1530 = bu8_perry_berkS2_th_1530 + gu9_reza_berkS2_th_1530 + bu9_serrano_berkS2_th_1530 + bu10_suarez_berkS2_th_1530 + bu11_anderson_berkS2_th_1530 + gu11_cardinale_berkS2_th_1530 + bu12_martin_berkS2_th_1530 + bu12_suarez_berkS2_th_1530 + gu13_fisher_berkS2_th_1530 + bu14_suarez_berkS2_th_1530;

berkS2_th_1600 <= 1.5;
berkS2_th_1600 = bu8_perry_berkS2_th_1600 + gu9_reza_berkS2_th_1600 + bu9_serrano_berkS2_th_1600 + bu10_suarez_berkS2_th_1600 + bu11_anderson_berkS2_th_1600 + gu11_cardinale_berkS2_th_1600 + bu12_martin_berkS2_th_1600 + bu12_suarez_berkS2_th_1600 + gu13_fisher_berkS2_th_1600 + bu14_suarez_berkS2_th_1600;

berkS2_th_1630 <= 1.5;
berkS2_th_1630 = bu8_perry_berkS2_th_1630 + gu9_reza_berkS2_th_1630 + bu9_serrano_berkS2_th_1630 + bu10_suarez_berkS2_th_1630 + bu11_anderson_berkS2_th_1630 + gu11_cardinale_berkS2_th_1630 + bu12_martin_berkS2_th_1630 + bu12_suarez_berkS2_th_1630 + gu13_fisher_berkS2_th_1630 + bu14_suarez_berkS2_th_1630;

berkS2_th_1700 <= 1.5;
berkS2_th_1700 = bu8_perry_berkS2_th_1700 + gu9_reza_berkS2_th_1700 + bu9_serrano_berkS2_th_1700 + bu10_suarez_berkS2_th_1700 + bu11_anderson_berkS2_th_1700 + gu11_cardinale_berkS2_th_1700 + bu12_martin_berkS2_th_1700 + bu12_suarez_berkS2_th_1700 + gu13_fisher_berkS2_th_1700 + bu14_suarez_berkS2_th_1700;

berkS2_th_1730 <= 1.5;
berkS2_th_1730 = bu8_perry_berkS2_th_1730 + gu9_reza_berkS2_th_1730 + bu9_serrano_berkS2_th_1730 + bu10_suarez_berkS2_th_1730 + bu11_anderson_berkS2_th_1730 + gu11_cardinale_berkS2_th_1730 + bu12_martin_berkS2_th_1730 + bu12_suarez_berkS2_th_1730 + gu13_fisher_berkS2_th_1730 + bu14_suarez_berkS2_th_1730;

berkS2_th_1800 <= 1.5;
berkS2_th_1800 = bu8_perry_berkS2_th_1800 + gu9_reza_berkS2_th_1800 + bu9_serrano_berkS2_th_1800 + bu10_suarez_berkS2_th_1800 + bu11_anderson_berkS2_th_1800 + gu11_cardinale_berkS2_th_1800 + bu12_martin_berkS2_th_1800 + bu12_suarez_berkS2_th_1800 + gu13_fisher_berkS2_th_1800 + bu14_suarez_berkS2_th_1800;

berkS2_th_1830 <= 1.5;
berkS2_th_1830 = bu8_perry_berkS2_th_1830 + gu9_reza_berkS2_th_1830 + bu9_serrano_berkS2_th_1830 + bu10_suarez_berkS2_th_1830 + bu11_anderson_berkS2_th_1830 + gu11_cardinale_berkS2_th_1830 + bu12_martin_berkS2_th_1830 + bu12_suarez_berkS2_th_1830 + gu13_fisher_berkS2_th_1830 + bu14_suarez_berkS2_th_1830;

berkS2_th_1900 <= 1.5;
berkS2_th_1900 = bu8_perry_berkS2_th_1900 + gu9_reza_berkS2_th_1900 + bu9_serrano_berkS2_th_1900 + bu10_suarez_berkS2_th_1900 + bu11_anderson_berkS2_th_1900 + gu11_cardinale_berkS2_th_1900 + bu12_martin_berkS2_th_1900 + bu12_suarez_berkS2_th_1900 + gu13_fisher_berkS2_th_1900 + bu14_suarez_berkS2_th_1900;

/* ZERO THE DISALLOWED TIMES */
gu9_reza_adaE_mo_1630 + gu9_reza_adaE_mo_1700 + gu9_reza_adaE_mo_1730 + gu9_reza_adaE_we_1630 + gu9_reza_adaE_we_1700 + gu9_reza_adaE_we_1730 + gu9_reza_berkS1_mo_1630 + gu9_reza_berkS1_mo_1700 + gu9_reza_berkS1_mo_1730 + gu9_reza_berkS1_we_1630 + gu9_reza_berkS1_we_1700 + gu9_reza_berkS1_we_1730 + gu9_reza_berkS2_mo_1630 + gu9_reza_berkS2_mo_1700 + gu9_reza_berkS2_mo_1730 + gu9_reza_berkS2_we_1630 + gu9_reza_berkS2_we_1700 + gu9_reza_berkS2_we_1730 + bu9_serrano_adaE_we_1630 + bu9_serrano_adaE_we_1700 + bu9_serrano_adaE_we_1730 + bu9_serrano_berkS1_we_1630 + bu9_serrano_berkS1_we_1700 + bu9_serrano_berkS1_we_1730 + bu9_serrano_berkS2_we_1630 + bu9_serrano_berkS2_we_1700 + bu9_serrano_berkS2_we_1730 + bu10_suarez_adaE_fr_1600 + bu10_suarez_adaE_fr_1630 + bu10_suarez_adaE_fr_1700 + bu10_suarez_berkS1_fr_1600 + bu10_suarez_berkS1_fr_1630 + bu10_suarez_berkS1_fr_1700 + bu10_suarez_berkS2_fr_1600 + bu10_suarez_berkS2_fr_1630 + bu10_suarez_berkS2_fr_1700 + gu13_fisher_adaE_mo_1630 + gu13_fisher_adaE_mo_1700 + gu13_fisher_adaE_mo_1730 + gu13_fisher_adaE_we_1630 + gu13_fisher_adaE_we_1700 + gu13_fisher_adaE_we_1730 + gu13_fisher_berkS1_mo_1630 + gu13_fisher_berkS1_mo_1700 + gu13_fisher_berkS1_mo_1730 + gu13_fisher_berkS1_we_1630 + gu13_fisher_berkS1_we_1700 + gu13_fisher_berkS1_we_1730 + gu13_fisher_berkS2_mo_1630 + gu13_fisher_berkS2_mo_1700 + gu13_fisher_berkS2_mo_1730 + gu13_fisher_berkS2_we_1630 + gu13_fisher_berkS2_we_1700 + gu13_fisher_berkS2_we_1730 = 0;
/* BINARY VARS */
bin bu8_perry_o1, gu9_reza_o1, gu9_reza_o2, bu9_serrano_o1, bu9_serrano_o2, bu10_suarez_o1, bu10_suarez_o2, bu11_anderson_o1, bu11_anderson_o2, gu11_cardinale_o1, gu11_cardinale_o2, bu12_martin_o1, bu12_martin_o2, bu12_suarez_o1, gu13_fisher_o1, gu13_fisher_o2, bu14_suarez_o1, bu8_perry_o1_adaE, bu8_perry_o1_berkS1, bu8_perry_o1_berkS2, gu9_reza_o1_adaE, gu9_reza_o1_berkS1, gu9_reza_o1_berkS2, gu9_reza_adaE_mo_1630, gu9_reza_adaE_mo_1700, gu9_reza_adaE_mo_1730, gu9_reza_adaE_we_1630, gu9_reza_adaE_we_1700, gu9_reza_adaE_we_1730, gu9_reza_berkS1_mo_1630, gu9_reza_berkS1_mo_1700, gu9_reza_berkS1_mo_1730, gu9_reza_berkS1_we_1630, gu9_reza_berkS1_we_1700, gu9_reza_berkS1_we_1730, gu9_reza_berkS2_mo_1630, gu9_reza_berkS2_mo_1700, gu9_reza_berkS2_mo_1730, gu9_reza_berkS2_we_1630, gu9_reza_berkS2_we_1700, gu9_reza_berkS2_we_1730, gu9_reza_o2_adaE, gu9_reza_o2_berkS1, gu9_reza_o2_berkS2, bu9_serrano_o1_adaE, bu9_serrano_o1_berkS1, bu9_serrano_o1_berkS2, bu9_serrano_adaE_we_1630, bu9_serrano_adaE_we_1700, bu9_serrano_adaE_we_1730, bu9_serrano_berkS1_we_1630, bu9_serrano_berkS1_we_1700, bu9_serrano_berkS1_we_1730, bu9_serrano_berkS2_we_1630, bu9_serrano_berkS2_we_1700, bu9_serrano_berkS2_we_1730, bu9_serrano_o2_adaE, bu9_serrano_o2_berkS1, bu9_serrano_o2_berkS2, bu10_suarez_o1_adaE, bu10_suarez_o1_berkS1, bu10_suarez_o1_berkS2, bu10_suarez_adaE_fr_1600, bu10_suarez_adaE_fr_1630, bu10_suarez_adaE_fr_1700, bu10_suarez_berkS1_fr_1600, bu10_suarez_berkS1_fr_1630, bu10_suarez_berkS1_fr_1700, bu10_suarez_berkS2_fr_1600, bu10_suarez_berkS2_fr_1630, bu10_suarez_berkS2_fr_1700, bu10_suarez_o2_adaE, bu10_suarez_o2_berkS1, bu10_suarez_o2_berkS2, bu11_anderson_o1_adaE, bu11_anderson_o1_berkS1, bu11_anderson_o1_berkS2, bu11_anderson_adaE_tu_1630, bu11_anderson_adaE_tu_1700, bu11_anderson_adaE_tu_1730, bu11_anderson_adaE_th_1630, bu11_anderson_adaE_th_1700, bu11_anderson_adaE_th_1730, bu11_anderson_berkS1_tu_1630, bu11_anderson_berkS1_tu_1700, bu11_anderson_berkS1_tu_1730, bu11_anderson_berkS1_th_1630, bu11_anderson_berkS1_th_1700, bu11_anderson_berkS1_th_1730, bu11_anderson_berkS2_tu_1630, bu11_anderson_berkS2_tu_1700, bu11_anderson_berkS2_tu_1730, bu11_anderson_berkS2_th_1630, bu11_anderson_berkS2_th_1700, bu11_anderson_berkS2_th_1730, bu11_anderson_o2_adaE, bu11_anderson_o2_berkS1, bu11_anderson_o2_berkS2, gu11_cardinale_o1_adaE, gu11_cardinale_o1_berkS1, gu11_cardinale_o1_berkS2, gu11_cardinale_adaE_tu_1630, gu11_cardinale_adaE_tu_1700, gu11_cardinale_adaE_tu_1730, gu11_cardinale_adaE_th_1630, gu11_cardinale_adaE_th_1700, gu11_cardinale_adaE_th_1730, gu11_cardinale_berkS1_tu_1630, gu11_cardinale_berkS1_tu_1700, gu11_cardinale_berkS1_tu_1730, gu11_cardinale_berkS1_th_1630, gu11_cardinale_berkS1_th_1700, gu11_cardinale_berkS1_th_1730, gu11_cardinale_berkS2_tu_1630, gu11_cardinale_berkS2_tu_1700, gu11_cardinale_berkS2_tu_1730, gu11_cardinale_berkS2_th_1630, gu11_cardinale_berkS2_th_1700, gu11_cardinale_berkS2_th_1730, gu11_cardinale_o2_adaE, gu11_cardinale_o2_berkS1, gu11_cardinale_o2_berkS2, bu12_martin_o1_adaE, bu12_martin_o1_berkS1, bu12_martin_o1_berkS2, bu12_martin_adaE_tu_1630, bu12_martin_adaE_tu_1700, bu12_martin_adaE_tu_1730, bu12_martin_adaE_th_1630, bu12_martin_adaE_th_1700, bu12_martin_adaE_th_1730, bu12_martin_berkS1_tu_1630, bu12_martin_berkS1_tu_1700, bu12_martin_berkS1_tu_1730, bu12_martin_berkS1_th_1630, bu12_martin_berkS1_th_1700, bu12_martin_berkS1_th_1730, bu12_martin_berkS2_tu_1630, bu12_martin_berkS2_tu_1700, bu12_martin_berkS2_tu_1730, bu12_martin_berkS2_th_1630, bu12_martin_berkS2_th_1700, bu12_martin_berkS2_th_1730, bu12_martin_o2_adaE, bu12_martin_o2_berkS1, bu12_martin_o2_berkS2, bu12_suarez_o1_adaE, bu12_suarez_o1_berkS1, bu12_suarez_o1_berkS2, gu13_fisher_o1_adaE, gu13_fisher_o1_berkS1, gu13_fisher_o1_berkS2, gu13_fisher_adaE_mo_1630, gu13_fisher_adaE_mo_1700, gu13_fisher_adaE_mo_1730, gu13_fisher_adaE_we_1630, gu13_fisher_adaE_we_1700, gu13_fisher_adaE_we_1730, gu13_fisher_berkS1_mo_1630, gu13_fisher_berkS1_mo_1700, gu13_fisher_berkS1_mo_1730, gu13_fisher_berkS1_we_1630, gu13_fisher_berkS1_we_1700, gu13_fisher_berkS1_we_1730, gu13_fisher_berkS2_mo_1630, gu13_fisher_berkS2_mo_1700, gu13_fisher_berkS2_mo_1730, gu13_fisher_berkS2_we_1630, gu13_fisher_berkS2_we_1700, gu13_fisher_berkS2_we_1730, gu13_fisher_o2_adaE, gu13_fisher_o2_berkS1, gu13_fisher_o2_berkS2, bu14_suarez_o1_adaE, bu14_suarez_o1_berkS1, bu14_suarez_o1_berkS2, adaE_tu_1500, bu8_perry_adaE_tu_1500, gu9_reza_adaE_tu_1500, bu9_serrano_adaE_tu_1500, bu10_suarez_adaE_tu_1500, bu11_anderson_adaE_tu_1500, gu11_cardinale_adaE_tu_1500, bu12_martin_adaE_tu_1500, bu12_suarez_adaE_tu_1500, gu13_fisher_adaE_tu_1500, bu14_suarez_adaE_tu_1500, adaE_tu_1530, bu8_perry_adaE_tu_1530, gu9_reza_adaE_tu_1530, bu9_serrano_adaE_tu_1530, bu10_suarez_adaE_tu_1530, bu11_anderson_adaE_tu_1530, gu11_cardinale_adaE_tu_1530, bu12_martin_adaE_tu_1530, bu12_suarez_adaE_tu_1530, gu13_fisher_adaE_tu_1530, bu14_suarez_adaE_tu_1530, adaE_tu_1600, bu8_perry_adaE_tu_1600, gu9_reza_adaE_tu_1600, bu9_serrano_adaE_tu_1600, bu10_suarez_adaE_tu_1600, bu11_anderson_adaE_tu_1600, gu11_cardinale_adaE_tu_1600, bu12_martin_adaE_tu_1600, bu12_suarez_adaE_tu_1600, gu13_fisher_adaE_tu_1600, bu14_suarez_adaE_tu_1600, adaE_tu_1630, bu8_perry_adaE_tu_1630, gu9_reza_adaE_tu_1630, bu9_serrano_adaE_tu_1630, bu10_suarez_adaE_tu_1630, bu12_suarez_adaE_tu_1630, gu13_fisher_adaE_tu_1630, bu14_suarez_adaE_tu_1630, adaE_tu_1700, bu8_perry_adaE_tu_1700, gu9_reza_adaE_tu_1700, bu9_serrano_adaE_tu_1700, bu10_suarez_adaE_tu_1700, bu12_suarez_adaE_tu_1700, gu13_fisher_adaE_tu_1700, bu14_suarez_adaE_tu_1700, adaE_tu_1730, bu8_perry_adaE_tu_1730, gu9_reza_adaE_tu_1730, bu9_serrano_adaE_tu_1730, bu10_suarez_adaE_tu_1730, bu12_suarez_adaE_tu_1730, gu13_fisher_adaE_tu_1730, bu14_suarez_adaE_tu_1730, adaE_tu_1800, bu8_perry_adaE_tu_1800, gu9_reza_adaE_tu_1800, bu9_serrano_adaE_tu_1800, bu10_suarez_adaE_tu_1800, bu11_anderson_adaE_tu_1800, gu11_cardinale_adaE_tu_1800, bu12_martin_adaE_tu_1800, bu12_suarez_adaE_tu_1800, gu13_fisher_adaE_tu_1800, bu14_suarez_adaE_tu_1800, adaE_tu_1830, bu8_perry_adaE_tu_1830, gu9_reza_adaE_tu_1830, bu9_serrano_adaE_tu_1830, bu10_suarez_adaE_tu_1830, bu11_anderson_adaE_tu_1830, gu11_cardinale_adaE_tu_1830, bu12_martin_adaE_tu_1830, bu12_suarez_adaE_tu_1830, gu13_fisher_adaE_tu_1830, bu14_suarez_adaE_tu_1830, adaE_tu_1900, bu8_perry_adaE_tu_1900, gu9_reza_adaE_tu_1900, bu9_serrano_adaE_tu_1900, bu10_suarez_adaE_tu_1900, bu11_anderson_adaE_tu_1900, gu11_cardinale_adaE_tu_1900, bu12_martin_adaE_tu_1900, bu12_suarez_adaE_tu_1900, gu13_fisher_adaE_tu_1900, bu14_suarez_adaE_tu_1900, adaE_th_1500, bu8_perry_adaE_th_1500, gu9_reza_adaE_th_1500, bu9_serrano_adaE_th_1500, bu10_suarez_adaE_th_1500, bu11_anderson_adaE_th_1500, gu11_cardinale_adaE_th_1500, bu12_martin_adaE_th_1500, bu12_suarez_adaE_th_1500, gu13_fisher_adaE_th_1500, bu14_suarez_adaE_th_1500, adaE_th_1530, bu8_perry_adaE_th_1530, gu9_reza_adaE_th_1530, bu9_serrano_adaE_th_1530, bu10_suarez_adaE_th_1530, bu11_anderson_adaE_th_1530, gu11_cardinale_adaE_th_1530, bu12_martin_adaE_th_1530, bu12_suarez_adaE_th_1530, gu13_fisher_adaE_th_1530, bu14_suarez_adaE_th_1530, adaE_th_1600, bu8_perry_adaE_th_1600, gu9_reza_adaE_th_1600, bu9_serrano_adaE_th_1600, bu10_suarez_adaE_th_1600, bu11_anderson_adaE_th_1600, gu11_cardinale_adaE_th_1600, bu12_martin_adaE_th_1600, bu12_suarez_adaE_th_1600, gu13_fisher_adaE_th_1600, bu14_suarez_adaE_th_1600, adaE_th_1630, bu8_perry_adaE_th_1630, gu9_reza_adaE_th_1630, bu9_serrano_adaE_th_1630, bu10_suarez_adaE_th_1630, bu12_suarez_adaE_th_1630, gu13_fisher_adaE_th_1630, bu14_suarez_adaE_th_1630, adaE_th_1700, bu8_perry_adaE_th_1700, gu9_reza_adaE_th_1700, bu9_serrano_adaE_th_1700, bu10_suarez_adaE_th_1700, bu12_suarez_adaE_th_1700, gu13_fisher_adaE_th_1700, bu14_suarez_adaE_th_1700, adaE_th_1730, bu8_perry_adaE_th_1730, gu9_reza_adaE_th_1730, bu9_serrano_adaE_th_1730, bu10_suarez_adaE_th_1730, bu12_suarez_adaE_th_1730, gu13_fisher_adaE_th_1730, bu14_suarez_adaE_th_1730, adaE_th_1800, bu8_perry_adaE_th_1800, gu9_reza_adaE_th_1800, bu9_serrano_adaE_th_1800, bu10_suarez_adaE_th_1800, bu11_anderson_adaE_th_1800, gu11_cardinale_adaE_th_1800, bu12_martin_adaE_th_1800, bu12_suarez_adaE_th_1800, gu13_fisher_adaE_th_1800, bu14_suarez_adaE_th_1800, adaE_th_1830, bu8_perry_adaE_th_1830, gu9_reza_adaE_th_1830, bu9_serrano_adaE_th_1830, bu10_suarez_adaE_th_1830, bu11_anderson_adaE_th_1830, gu11_cardinale_adaE_th_1830, bu12_martin_adaE_th_1830, bu12_suarez_adaE_th_1830, gu13_fisher_adaE_th_1830, bu14_suarez_adaE_th_1830, adaE_th_1900, bu8_perry_adaE_th_1900, gu9_reza_adaE_th_1900, bu9_serrano_adaE_th_1900, bu10_suarez_adaE_th_1900, bu11_anderson_adaE_th_1900, gu11_cardinale_adaE_th_1900, bu12_martin_adaE_th_1900, bu12_suarez_adaE_th_1900, gu13_fisher_adaE_th_1900, bu14_suarez_adaE_th_1900, berkS1_tu_1500, bu8_perry_berkS1_tu_1500, gu9_reza_berkS1_tu_1500, bu9_serrano_berkS1_tu_1500, bu10_suarez_berkS1_tu_1500, bu11_anderson_berkS1_tu_1500, gu11_cardinale_berkS1_tu_1500, bu12_martin_berkS1_tu_1500, bu12_suarez_berkS1_tu_1500, gu13_fisher_berkS1_tu_1500, bu14_suarez_berkS1_tu_1500, berkS1_tu_1530, bu8_perry_berkS1_tu_1530, gu9_reza_berkS1_tu_1530, bu9_serrano_berkS1_tu_1530, bu10_suarez_berkS1_tu_1530, bu11_anderson_berkS1_tu_1530, gu11_cardinale_berkS1_tu_1530, bu12_martin_berkS1_tu_1530, bu12_suarez_berkS1_tu_1530, gu13_fisher_berkS1_tu_1530, bu14_suarez_berkS1_tu_1530, berkS1_tu_1600, bu8_perry_berkS1_tu_1600, gu9_reza_berkS1_tu_1600, bu9_serrano_berkS1_tu_1600, bu10_suarez_berkS1_tu_1600, bu11_anderson_berkS1_tu_1600, gu11_cardinale_berkS1_tu_1600, bu12_martin_berkS1_tu_1600, bu12_suarez_berkS1_tu_1600, gu13_fisher_berkS1_tu_1600, bu14_suarez_berkS1_tu_1600, berkS1_tu_1630, bu8_perry_berkS1_tu_1630, gu9_reza_berkS1_tu_1630, bu9_serrano_berkS1_tu_1630, bu10_suarez_berkS1_tu_1630, bu12_suarez_berkS1_tu_1630, gu13_fisher_berkS1_tu_1630, bu14_suarez_berkS1_tu_1630, berkS1_tu_1700, bu8_perry_berkS1_tu_1700, gu9_reza_berkS1_tu_1700, bu9_serrano_berkS1_tu_1700, bu10_suarez_berkS1_tu_1700, bu12_suarez_berkS1_tu_1700, gu13_fisher_berkS1_tu_1700, bu14_suarez_berkS1_tu_1700, berkS1_tu_1730, bu8_perry_berkS1_tu_1730, gu9_reza_berkS1_tu_1730, bu9_serrano_berkS1_tu_1730, bu10_suarez_berkS1_tu_1730, bu12_suarez_berkS1_tu_1730, gu13_fisher_berkS1_tu_1730, bu14_suarez_berkS1_tu_1730, berkS1_tu_1800, bu8_perry_berkS1_tu_1800, gu9_reza_berkS1_tu_1800, bu9_serrano_berkS1_tu_1800, bu10_suarez_berkS1_tu_1800, bu11_anderson_berkS1_tu_1800, gu11_cardinale_berkS1_tu_1800, bu12_martin_berkS1_tu_1800, bu12_suarez_berkS1_tu_1800, gu13_fisher_berkS1_tu_1800, bu14_suarez_berkS1_tu_1800, berkS1_tu_1830, bu8_perry_berkS1_tu_1830, gu9_reza_berkS1_tu_1830, bu9_serrano_berkS1_tu_1830, bu10_suarez_berkS1_tu_1830, bu11_anderson_berkS1_tu_1830, gu11_cardinale_berkS1_tu_1830, bu12_martin_berkS1_tu_1830, bu12_suarez_berkS1_tu_1830, gu13_fisher_berkS1_tu_1830, bu14_suarez_berkS1_tu_1830, berkS1_tu_1900, bu8_perry_berkS1_tu_1900, gu9_reza_berkS1_tu_1900, bu9_serrano_berkS1_tu_1900, bu10_suarez_berkS1_tu_1900, bu11_anderson_berkS1_tu_1900, gu11_cardinale_berkS1_tu_1900, bu12_martin_berkS1_tu_1900, bu12_suarez_berkS1_tu_1900, gu13_fisher_berkS1_tu_1900, bu14_suarez_berkS1_tu_1900, berkS1_th_1500, bu8_perry_berkS1_th_1500, gu9_reza_berkS1_th_1500, bu9_serrano_berkS1_th_1500, bu10_suarez_berkS1_th_1500, bu11_anderson_berkS1_th_1500, gu11_cardinale_berkS1_th_1500, bu12_martin_berkS1_th_1500, bu12_suarez_berkS1_th_1500, gu13_fisher_berkS1_th_1500, bu14_suarez_berkS1_th_1500, berkS1_th_1530, bu8_perry_berkS1_th_1530, gu9_reza_berkS1_th_1530, bu9_serrano_berkS1_th_1530, bu10_suarez_berkS1_th_1530, bu11_anderson_berkS1_th_1530, gu11_cardinale_berkS1_th_1530, bu12_martin_berkS1_th_1530, bu12_suarez_berkS1_th_1530, gu13_fisher_berkS1_th_1530, bu14_suarez_berkS1_th_1530, berkS1_th_1600, bu8_perry_berkS1_th_1600, gu9_reza_berkS1_th_1600, bu9_serrano_berkS1_th_1600, bu10_suarez_berkS1_th_1600, bu11_anderson_berkS1_th_1600, gu11_cardinale_berkS1_th_1600, bu12_martin_berkS1_th_1600, bu12_suarez_berkS1_th_1600, gu13_fisher_berkS1_th_1600, bu14_suarez_berkS1_th_1600, berkS1_th_1630, bu8_perry_berkS1_th_1630, gu9_reza_berkS1_th_1630, bu9_serrano_berkS1_th_1630, bu10_suarez_berkS1_th_1630, bu12_suarez_berkS1_th_1630, gu13_fisher_berkS1_th_1630, bu14_suarez_berkS1_th_1630, berkS1_th_1700, bu8_perry_berkS1_th_1700, gu9_reza_berkS1_th_1700, bu9_serrano_berkS1_th_1700, bu10_suarez_berkS1_th_1700, bu12_suarez_berkS1_th_1700, gu13_fisher_berkS1_th_1700, bu14_suarez_berkS1_th_1700, berkS1_th_1730, bu8_perry_berkS1_th_1730, gu9_reza_berkS1_th_1730, bu9_serrano_berkS1_th_1730, bu10_suarez_berkS1_th_1730, bu12_suarez_berkS1_th_1730, gu13_fisher_berkS1_th_1730, bu14_suarez_berkS1_th_1730, berkS1_th_1800, bu8_perry_berkS1_th_1800, gu9_reza_berkS1_th_1800, bu9_serrano_berkS1_th_1800, bu10_suarez_berkS1_th_1800, bu11_anderson_berkS1_th_1800, gu11_cardinale_berkS1_th_1800, bu12_martin_berkS1_th_1800, bu12_suarez_berkS1_th_1800, gu13_fisher_berkS1_th_1800, bu14_suarez_berkS1_th_1800, berkS1_th_1830, bu8_perry_berkS1_th_1830, gu9_reza_berkS1_th_1830, bu9_serrano_berkS1_th_1830, bu10_suarez_berkS1_th_1830, bu11_anderson_berkS1_th_1830, gu11_cardinale_berkS1_th_1830, bu12_martin_berkS1_th_1830, bu12_suarez_berkS1_th_1830, gu13_fisher_berkS1_th_1830, bu14_suarez_berkS1_th_1830, berkS1_th_1900, bu8_perry_berkS1_th_1900, gu9_reza_berkS1_th_1900, bu9_serrano_berkS1_th_1900, bu10_suarez_berkS1_th_1900, bu11_anderson_berkS1_th_1900, gu11_cardinale_berkS1_th_1900, bu12_martin_berkS1_th_1900, bu12_suarez_berkS1_th_1900, gu13_fisher_berkS1_th_1900, bu14_suarez_berkS1_th_1900, berkS2_tu_1500, bu8_perry_berkS2_tu_1500, gu9_reza_berkS2_tu_1500, bu9_serrano_berkS2_tu_1500, bu10_suarez_berkS2_tu_1500, bu11_anderson_berkS2_tu_1500, gu11_cardinale_berkS2_tu_1500, bu12_martin_berkS2_tu_1500, bu12_suarez_berkS2_tu_1500, gu13_fisher_berkS2_tu_1500, bu14_suarez_berkS2_tu_1500, berkS2_tu_1530, bu8_perry_berkS2_tu_1530, gu9_reza_berkS2_tu_1530, bu9_serrano_berkS2_tu_1530, bu10_suarez_berkS2_tu_1530, bu11_anderson_berkS2_tu_1530, gu11_cardinale_berkS2_tu_1530, bu12_martin_berkS2_tu_1530, bu12_suarez_berkS2_tu_1530, gu13_fisher_berkS2_tu_1530, bu14_suarez_berkS2_tu_1530, berkS2_tu_1600, bu8_perry_berkS2_tu_1600, gu9_reza_berkS2_tu_1600, bu9_serrano_berkS2_tu_1600, bu10_suarez_berkS2_tu_1600, bu11_anderson_berkS2_tu_1600, gu11_cardinale_berkS2_tu_1600, bu12_martin_berkS2_tu_1600, bu12_suarez_berkS2_tu_1600, gu13_fisher_berkS2_tu_1600, bu14_suarez_berkS2_tu_1600, berkS2_tu_1630, bu8_perry_berkS2_tu_1630, gu9_reza_berkS2_tu_1630, bu9_serrano_berkS2_tu_1630, bu10_suarez_berkS2_tu_1630, bu12_suarez_berkS2_tu_1630, gu13_fisher_berkS2_tu_1630, bu14_suarez_berkS2_tu_1630, berkS2_tu_1700, bu8_perry_berkS2_tu_1700, gu9_reza_berkS2_tu_1700, bu9_serrano_berkS2_tu_1700, bu10_suarez_berkS2_tu_1700, bu12_suarez_berkS2_tu_1700, gu13_fisher_berkS2_tu_1700, bu14_suarez_berkS2_tu_1700, berkS2_tu_1730, bu8_perry_berkS2_tu_1730, gu9_reza_berkS2_tu_1730, bu9_serrano_berkS2_tu_1730, bu10_suarez_berkS2_tu_1730, bu12_suarez_berkS2_tu_1730, gu13_fisher_berkS2_tu_1730, bu14_suarez_berkS2_tu_1730, berkS2_tu_1800, bu8_perry_berkS2_tu_1800, gu9_reza_berkS2_tu_1800, bu9_serrano_berkS2_tu_1800, bu10_suarez_berkS2_tu_1800, bu11_anderson_berkS2_tu_1800, gu11_cardinale_berkS2_tu_1800, bu12_martin_berkS2_tu_1800, bu12_suarez_berkS2_tu_1800, gu13_fisher_berkS2_tu_1800, bu14_suarez_berkS2_tu_1800, berkS2_tu_1830, bu8_perry_berkS2_tu_1830, gu9_reza_berkS2_tu_1830, bu9_serrano_berkS2_tu_1830, bu10_suarez_berkS2_tu_1830, bu11_anderson_berkS2_tu_1830, gu11_cardinale_berkS2_tu_1830, bu12_martin_berkS2_tu_1830, bu12_suarez_berkS2_tu_1830, gu13_fisher_berkS2_tu_1830, bu14_suarez_berkS2_tu_1830, berkS2_tu_1900, bu8_perry_berkS2_tu_1900, gu9_reza_berkS2_tu_1900, bu9_serrano_berkS2_tu_1900, bu10_suarez_berkS2_tu_1900, bu11_anderson_berkS2_tu_1900, gu11_cardinale_berkS2_tu_1900, bu12_martin_berkS2_tu_1900, bu12_suarez_berkS2_tu_1900, gu13_fisher_berkS2_tu_1900, bu14_suarez_berkS2_tu_1900, berkS2_th_1500, bu8_perry_berkS2_th_1500, gu9_reza_berkS2_th_1500, bu9_serrano_berkS2_th_1500, bu10_suarez_berkS2_th_1500, bu11_anderson_berkS2_th_1500, gu11_cardinale_berkS2_th_1500, bu12_martin_berkS2_th_1500, bu12_suarez_berkS2_th_1500, gu13_fisher_berkS2_th_1500, bu14_suarez_berkS2_th_1500, berkS2_th_1530, bu8_perry_berkS2_th_1530, gu9_reza_berkS2_th_1530, bu9_serrano_berkS2_th_1530, bu10_suarez_berkS2_th_1530, bu11_anderson_berkS2_th_1530, gu11_cardinale_berkS2_th_1530, bu12_martin_berkS2_th_1530, bu12_suarez_berkS2_th_1530, gu13_fisher_berkS2_th_1530, bu14_suarez_berkS2_th_1530, berkS2_th_1600, bu8_perry_berkS2_th_1600, gu9_reza_berkS2_th_1600, bu9_serrano_berkS2_th_1600, bu10_suarez_berkS2_th_1600, bu11_anderson_berkS2_th_1600, gu11_cardinale_berkS2_th_1600, bu12_martin_berkS2_th_1600, bu12_suarez_berkS2_th_1600, gu13_fisher_berkS2_th_1600, bu14_suarez_berkS2_th_1600, berkS2_th_1630, bu8_perry_berkS2_th_1630, gu9_reza_berkS2_th_1630, bu9_serrano_berkS2_th_1630, bu10_suarez_berkS2_th_1630, bu12_suarez_berkS2_th_1630, gu13_fisher_berkS2_th_1630, bu14_suarez_berkS2_th_1630, berkS2_th_1700, bu8_perry_berkS2_th_1700, gu9_reza_berkS2_th_1700, bu9_serrano_berkS2_th_1700, bu10_suarez_berkS2_th_1700, bu12_suarez_berkS2_th_1700, gu13_fisher_berkS2_th_1700, bu14_suarez_berkS2_th_1700, berkS2_th_1730, bu8_perry_berkS2_th_1730, gu9_reza_berkS2_th_1730, bu9_serrano_berkS2_th_1730, bu10_suarez_berkS2_th_1730, bu12_suarez_berkS2_th_1730, gu13_fisher_berkS2_th_1730, bu14_suarez_berkS2_th_1730, berkS2_th_1800, bu8_perry_berkS2_th_1800, gu9_reza_berkS2_th_1800, bu9_serrano_berkS2_th_1800, bu10_suarez_berkS2_th_1800, bu11_anderson_berkS2_th_1800, gu11_cardinale_berkS2_th_1800, bu12_martin_berkS2_th_1800, bu12_suarez_berkS2_th_1800, gu13_fisher_berkS2_th_1800, bu14_suarez_berkS2_th_1800, berkS2_th_1830, bu8_perry_berkS2_th_1830, gu9_reza_berkS2_th_1830, bu9_serrano_berkS2_th_1830, bu10_suarez_berkS2_th_1830, bu11_anderson_berkS2_th_1830, gu11_cardinale_berkS2_th_1830, bu12_martin_berkS2_th_1830, bu12_suarez_berkS2_th_1830, gu13_fisher_berkS2_th_1830, bu14_suarez_berkS2_th_1830, berkS2_th_1900, bu8_perry_berkS2_th_1900, gu9_reza_berkS2_th_1900, bu9_serrano_berkS2_th_1900, bu10_suarez_berkS2_th_1900, bu11_anderson_berkS2_th_1900, gu11_cardinale_berkS2_th_1900, bu12_martin_berkS2_th_1900, bu12_suarez_berkS2_th_1900, gu13_fisher_berkS2_th_1900, bu14_suarez_berkS2_th_1900;
[31mERRORS[39m
[31m[39m

Value of objective function: 803

Actual values of the variables:
bu8_perry_o1                    0
gu9_reza_o1                     0
gu9_reza_o2                     1
bu9_serrano_o1                  0
bu9_serrano_o2                  1
bu10_suarez_o1                  0
bu10_suarez_o2                  1
bu11_anderson_o1                1
bu11_anderson_o2                0
gu11_cardinale_o1               1
gu11_cardinale_o2               0
bu12_martin_o1                  1
bu12_martin_o2                  0
bu12_suarez_o1                  0
gu13_fisher_o1                  0
gu13_fisher_o2                  1
bu14_suarez_o1                  0
bu8_perry_o1_adaE               0
bu8_perry_o1_berkS1             0
bu8_perry_o1_berkS2             0
gu9_reza_o1_adaE                0
gu9_reza_o1_berkS1              0
gu9_reza_o1_berkS2              0
gu9_reza_adaE_mo_1630            0
gu9_reza_adaE_mo_1700            0
gu9_reza_adaE_mo_1730            0
gu9_reza_adaE_we_1630            0
gu9_reza_adaE_we_1700            0
gu9_reza_adaE_we_1730            0
gu9_reza_berkS1_mo_1630            0
gu9_reza_berkS1_mo_1700            0
gu9_reza_berkS1_mo_1730            0
gu9_reza_berkS1_we_1630            0
gu9_reza_berkS1_we_1700            0
gu9_reza_berkS1_we_1730            0
gu9_reza_berkS2_mo_1630            0
gu9_reza_berkS2_mo_1700            0
gu9_reza_berkS2_mo_1730            0
gu9_reza_berkS2_we_1630            0
gu9_reza_berkS2_we_1700            0
gu9_reza_berkS2_we_1730            0
gu9_reza_o2_adaE                1
gu9_reza_o2_berkS1              0
gu9_reza_o2_berkS2              0
bu9_serrano_o1_adaE             0
bu9_serrano_o1_berkS1            0
bu9_serrano_o1_berkS2            0
bu9_serrano_adaE_we_1630            0
bu9_serrano_adaE_we_1700            0
bu9_serrano_adaE_we_1730            0
bu9_serrano_berkS1_we_1630            0
bu9_serrano_berkS1_we_1700            0
bu9_serrano_berkS1_we_1730            0
bu9_serrano_berkS2_we_1630            0
bu9_serrano_berkS2_we_1700            0
bu9_serrano_berkS2_we_1730            0
bu9_serrano_o2_adaE             1
bu9_serrano_o2_berkS1            0
bu9_serrano_o2_berkS2            0
bu10_suarez_o1_adaE             0
bu10_suarez_o1_berkS1            0
bu10_suarez_o1_berkS2            0
bu10_suarez_adaE_fr_1600            0
bu10_suarez_adaE_fr_1630            0
bu10_suarez_adaE_fr_1700            0
bu10_suarez_berkS1_fr_1600            0
bu10_suarez_berkS1_fr_1630            0
bu10_suarez_berkS1_fr_1700            0
bu10_suarez_berkS2_fr_1600            0
bu10_suarez_berkS2_fr_1630            0
bu10_suarez_berkS2_fr_1700            0
bu10_suarez_o2_adaE             1
bu10_suarez_o2_berkS1            0
bu10_suarez_o2_berkS2            0
bu11_anderson_o1_adaE            0
bu11_anderson_o1_berkS1            0
bu11_anderson_o1_berkS2            1
bu11_anderson_adaE_tu_1630            0
bu11_anderson_adaE_tu_1700            0
bu11_anderson_adaE_tu_1730            0
bu11_anderson_adaE_th_1630            0
bu11_anderson_adaE_th_1700            0
bu11_anderson_adaE_th_1730            0
bu11_anderson_berkS1_tu_1630            0
bu11_anderson_berkS1_tu_1700            0
bu11_anderson_berkS1_tu_1730            0
bu11_anderson_berkS1_th_1630            0
bu11_anderson_berkS1_th_1700            0
bu11_anderson_berkS1_th_1730            0
bu11_anderson_berkS2_tu_1630            1
bu11_anderson_berkS2_tu_1700            1
bu11_anderson_berkS2_tu_1730            1
bu11_anderson_berkS2_th_1630            1
bu11_anderson_berkS2_th_1700            1
bu11_anderson_berkS2_th_1730            1
bu11_anderson_o2_adaE            0
bu11_anderson_o2_berkS1            0
bu11_anderson_o2_berkS2            0
gu11_cardinale_o1_adaE            0
gu11_cardinale_o1_berkS1            1
gu11_cardinale_o1_berkS2            0
gu11_cardinale_adaE_tu_1630            0
gu11_cardinale_adaE_tu_1700            0
gu11_cardinale_adaE_tu_1730            0
gu11_cardinale_adaE_th_1630            0
gu11_cardinale_adaE_th_1700            0
gu11_cardinale_adaE_th_1730            0
gu11_cardinale_berkS1_tu_1630            1
gu11_cardinale_berkS1_tu_1700            1
gu11_cardinale_berkS1_tu_1730            1
gu11_cardinale_berkS1_th_1630            1
gu11_cardinale_berkS1_th_1700            1
gu11_cardinale_berkS1_th_1730            1
gu11_cardinale_berkS2_tu_1630            0
gu11_cardinale_berkS2_tu_1700            0
gu11_cardinale_berkS2_tu_1730            0
gu11_cardinale_berkS2_th_1630            0
gu11_cardinale_berkS2_th_1700            0
gu11_cardinale_berkS2_th_1730            0
gu11_cardinale_o2_adaE            0
gu11_cardinale_o2_berkS1            0
gu11_cardinale_o2_berkS2            0
bu12_martin_o1_adaE             1
bu12_martin_o1_berkS1            0
bu12_martin_o1_berkS2            0
bu12_martin_adaE_tu_1630            1
bu12_martin_adaE_tu_1700            1
bu12_martin_adaE_tu_1730            1
bu12_martin_adaE_th_1630            1
bu12_martin_adaE_th_1700            1
bu12_martin_adaE_th_1730            1
bu12_martin_berkS1_tu_1630            0
bu12_martin_berkS1_tu_1700            0
bu12_martin_berkS1_tu_1730            0
bu12_martin_berkS1_th_1630            0
bu12_martin_berkS1_th_1700            0
bu12_martin_berkS1_th_1730            0
bu12_martin_berkS2_tu_1630            0
bu12_martin_berkS2_tu_1700            0
bu12_martin_berkS2_tu_1730            0
bu12_martin_berkS2_th_1630            0
bu12_martin_berkS2_th_1700            0
bu12_martin_berkS2_th_1730            0
bu12_martin_o2_adaE             0
bu12_martin_o2_berkS1            0
bu12_martin_o2_berkS2            0
bu12_suarez_o1_adaE             0
bu12_suarez_o1_berkS1            0
bu12_suarez_o1_berkS2            0
gu13_fisher_o1_adaE             0
gu13_fisher_o1_berkS1            0
gu13_fisher_o1_berkS2            0
gu13_fisher_adaE_mo_1630            0
gu13_fisher_adaE_mo_1700            0
gu13_fisher_adaE_mo_1730            0
gu13_fisher_adaE_we_1630            0
gu13_fisher_adaE_we_1700            0
gu13_fisher_adaE_we_1730            0
gu13_fisher_berkS1_mo_1630            0
gu13_fisher_berkS1_mo_1700            0
gu13_fisher_berkS1_mo_1730            0
gu13_fisher_berkS1_we_1630            0
gu13_fisher_berkS1_we_1700            0
gu13_fisher_berkS1_we_1730            0
gu13_fisher_berkS2_mo_1630            0
gu13_fisher_berkS2_mo_1700            0
gu13_fisher_berkS2_mo_1730            0
gu13_fisher_berkS2_we_1630            0
gu13_fisher_berkS2_we_1700            0
gu13_fisher_berkS2_we_1730            0
gu13_fisher_o2_adaE             1
gu13_fisher_o2_berkS1            0
gu13_fisher_o2_berkS2            0
bu14_suarez_o1_adaE             0
bu14_suarez_o1_berkS1            0
bu14_suarez_o1_berkS2            0
adaE_tu_1500                    0
bu8_perry_adaE_tu_1500            0
gu9_reza_adaE_tu_1500            0
bu9_serrano_adaE_tu_1500            0
bu10_suarez_adaE_tu_1500            0
bu11_anderson_adaE_tu_1500            0
gu11_cardinale_adaE_tu_1500            0
bu12_martin_adaE_tu_1500            0
bu12_suarez_adaE_tu_1500            0
gu13_fisher_adaE_tu_1500            0
bu14_suarez_adaE_tu_1500            0
adaE_tu_1530                    0
bu8_perry_adaE_tu_1530            0
gu9_reza_adaE_tu_1530            0
bu9_serrano_adaE_tu_1530            0
bu10_suarez_adaE_tu_1530            0
bu11_anderson_adaE_tu_1530            0
gu11_cardinale_adaE_tu_1530            0
bu12_martin_adaE_tu_1530            0
bu12_suarez_adaE_tu_1530            0
gu13_fisher_adaE_tu_1530            0
bu14_suarez_adaE_tu_1530            0
adaE_tu_1600                    0
bu8_perry_adaE_tu_1600            0
gu9_reza_adaE_tu_1600            0
bu9_serrano_adaE_tu_1600            0
bu10_suarez_adaE_tu_1600            0
bu11_anderson_adaE_tu_1600            0
gu11_cardinale_adaE_tu_1600            0
bu12_martin_adaE_tu_1600            0
bu12_suarez_adaE_tu_1600            0
gu13_fisher_adaE_tu_1600            0
bu14_suarez_adaE_tu_1600            0
adaE_tu_1630                    1
bu8_perry_adaE_tu_1630            0
gu9_reza_adaE_tu_1630            0
bu9_serrano_adaE_tu_1630            0
bu10_suarez_adaE_tu_1630            0
bu12_suarez_adaE_tu_1630            0
gu13_fisher_adaE_tu_1630            0
bu14_suarez_adaE_tu_1630            0
adaE_tu_1700                    1
bu8_perry_adaE_tu_1700            0
gu9_reza_adaE_tu_1700            0
bu9_serrano_adaE_tu_1700            0
bu10_suarez_adaE_tu_1700            0
bu12_suarez_adaE_tu_1700            0
gu13_fisher_adaE_tu_1700            0
bu14_suarez_adaE_tu_1700            0
adaE_tu_1730                    1
bu8_perry_adaE_tu_1730            0
gu9_reza_adaE_tu_1730            0
bu9_serrano_adaE_tu_1730            0
bu10_suarez_adaE_tu_1730            0
bu12_suarez_adaE_tu_1730            0
gu13_fisher_adaE_tu_1730            0
bu14_suarez_adaE_tu_1730            0
adaE_tu_1800                    0
bu8_perry_adaE_tu_1800            0
gu9_reza_adaE_tu_1800            0
bu9_serrano_adaE_tu_1800            0
bu10_suarez_adaE_tu_1800            0
bu11_anderson_adaE_tu_1800            0
gu11_cardinale_adaE_tu_1800            0
bu12_martin_adaE_tu_1800            0
bu12_suarez_adaE_tu_1800            0
gu13_fisher_adaE_tu_1800            0
bu14_suarez_adaE_tu_1800            0
adaE_tu_1830                    0
bu8_perry_adaE_tu_1830            0
gu9_reza_adaE_tu_1830            0
bu9_serrano_adaE_tu_1830            0
bu10_suarez_adaE_tu_1830            0
bu11_anderson_adaE_tu_1830            0
gu11_cardinale_adaE_tu_1830            0
bu12_martin_adaE_tu_1830            0
bu12_suarez_adaE_tu_1830            0
gu13_fisher_adaE_tu_1830            0
bu14_suarez_adaE_tu_1830            0
adaE_tu_1900                    0
bu8_perry_adaE_tu_1900            0
gu9_reza_adaE_tu_1900            0
bu9_serrano_adaE_tu_1900            0
bu10_suarez_adaE_tu_1900            0
bu11_anderson_adaE_tu_1900            0
gu11_cardinale_adaE_tu_1900            0
bu12_martin_adaE_tu_1900            0
bu12_suarez_adaE_tu_1900            0
gu13_fisher_adaE_tu_1900            0
bu14_suarez_adaE_tu_1900            0
adaE_th_1500                    0
bu8_perry_adaE_th_1500            0
gu9_reza_adaE_th_1500            0
bu9_serrano_adaE_th_1500            0
bu10_suarez_adaE_th_1500            0
bu11_anderson_adaE_th_1500            0
gu11_cardinale_adaE_th_1500            0
bu12_martin_adaE_th_1500            0
bu12_suarez_adaE_th_1500            0
gu13_fisher_adaE_th_1500            0
bu14_suarez_adaE_th_1500            0
adaE_th_1530                    0
bu8_perry_adaE_th_1530            0
gu9_reza_adaE_th_1530            0
bu9_serrano_adaE_th_1530            0
bu10_suarez_adaE_th_1530            0
bu11_anderson_adaE_th_1530            0
gu11_cardinale_adaE_th_1530            0
bu12_martin_adaE_th_1530            0
bu12_suarez_adaE_th_1530            0
gu13_fisher_adaE_th_1530            0
bu14_suarez_adaE_th_1530            0
adaE_th_1600                    0
bu8_perry_adaE_th_1600            0
gu9_reza_adaE_th_1600            0
bu9_serrano_adaE_th_1600            0
bu10_suarez_adaE_th_1600            0
bu11_anderson_adaE_th_1600            0
gu11_cardinale_adaE_th_1600            0
bu12_martin_adaE_th_1600            0
bu12_suarez_adaE_th_1600            0
gu13_fisher_adaE_th_1600            0
bu14_suarez_adaE_th_1600            0
adaE_th_1630                    1
bu8_perry_adaE_th_1630            0
gu9_reza_adaE_th_1630            0
bu9_serrano_adaE_th_1630            0
bu10_suarez_adaE_th_1630            0
bu12_suarez_adaE_th_1630            0
gu13_fisher_adaE_th_1630            0
bu14_suarez_adaE_th_1630            0
adaE_th_1700                    1
bu8_perry_adaE_th_1700            0
gu9_reza_adaE_th_1700            0
bu9_serrano_adaE_th_1700            0
bu10_suarez_adaE_th_1700            0
bu12_suarez_adaE_th_1700            0
gu13_fisher_adaE_th_1700            0
bu14_suarez_adaE_th_1700            0
adaE_th_1730                    1
bu8_perry_adaE_th_1730            0
gu9_reza_adaE_th_1730            0
bu9_serrano_adaE_th_1730            0
bu10_suarez_adaE_th_1730            0
bu12_suarez_adaE_th_1730            0
gu13_fisher_adaE_th_1730            0
bu14_suarez_adaE_th_1730            0
adaE_th_1800                    0
bu8_perry_adaE_th_1800            0
gu9_reza_adaE_th_1800            0
bu9_serrano_adaE_th_1800            0
bu10_suarez_adaE_th_1800            0
bu11_anderson_adaE_th_1800            0
gu11_cardinale_adaE_th_1800            0
bu12_martin_adaE_th_1800            0
bu12_suarez_adaE_th_1800            0
gu13_fisher_adaE_th_1800            0
bu14_suarez_adaE_th_1800            0
adaE_th_1830                    0
bu8_perry_adaE_th_1830            0
gu9_reza_adaE_th_1830            0
bu9_serrano_adaE_th_1830            0
bu10_suarez_adaE_th_1830            0
bu11_anderson_adaE_th_1830            0
gu11_cardinale_adaE_th_1830            0
bu12_martin_adaE_th_1830            0
bu12_suarez_adaE_th_1830            0
gu13_fisher_adaE_th_1830            0
bu14_suarez_adaE_th_1830            0
adaE_th_1900                    0
bu8_perry_adaE_th_1900            0
gu9_reza_adaE_th_1900            0
bu9_serrano_adaE_th_1900            0
bu10_suarez_adaE_th_1900            0
bu11_anderson_adaE_th_1900            0
gu11_cardinale_adaE_th_1900            0
bu12_martin_adaE_th_1900            0
bu12_suarez_adaE_th_1900            0
gu13_fisher_adaE_th_1900            0
bu14_suarez_adaE_th_1900            0
berkS1_tu_1500                  0
bu8_perry_berkS1_tu_1500            0
gu9_reza_berkS1_tu_1500            0
bu9_serrano_berkS1_tu_1500            0
bu10_suarez_berkS1_tu_1500            0
bu11_anderson_berkS1_tu_1500            0
gu11_cardinale_berkS1_tu_1500            0
bu12_martin_berkS1_tu_1500            0
bu12_suarez_berkS1_tu_1500            0
gu13_fisher_berkS1_tu_1500            0
bu14_suarez_berkS1_tu_1500            0
berkS1_tu_1530                  0
bu8_perry_berkS1_tu_1530            0
gu9_reza_berkS1_tu_1530            0
bu9_serrano_berkS1_tu_1530            0
bu10_suarez_berkS1_tu_1530            0
bu11_anderson_berkS1_tu_1530            0
gu11_cardinale_berkS1_tu_1530            0
bu12_martin_berkS1_tu_1530            0
bu12_suarez_berkS1_tu_1530            0
gu13_fisher_berkS1_tu_1530            0
bu14_suarez_berkS1_tu_1530            0
berkS1_tu_1600                  0
bu8_perry_berkS1_tu_1600            0
gu9_reza_berkS1_tu_1600            0
bu9_serrano_berkS1_tu_1600            0
bu10_suarez_berkS1_tu_1600            0
bu11_anderson_berkS1_tu_1600            0
gu11_cardinale_berkS1_tu_1600            0
bu12_martin_berkS1_tu_1600            0
bu12_suarez_berkS1_tu_1600            0
gu13_fisher_berkS1_tu_1600            0
bu14_suarez_berkS1_tu_1600            0
berkS1_tu_1630                  1
bu8_perry_berkS1_tu_1630            0
gu9_reza_berkS1_tu_1630            0
bu9_serrano_berkS1_tu_1630            0
bu10_suarez_berkS1_tu_1630            0
bu12_suarez_berkS1_tu_1630            0
gu13_fisher_berkS1_tu_1630            0
bu14_suarez_berkS1_tu_1630            0
berkS1_tu_1700                  1
bu8_perry_berkS1_tu_1700            0
gu9_reza_berkS1_tu_1700            0
bu9_serrano_berkS1_tu_1700            0
bu10_suarez_berkS1_tu_1700            0
bu12_suarez_berkS1_tu_1700            0
gu13_fisher_berkS1_tu_1700            0
bu14_suarez_berkS1_tu_1700            0
berkS1_tu_1730                  1
bu8_perry_berkS1_tu_1730            0
gu9_reza_berkS1_tu_1730            0
bu9_serrano_berkS1_tu_1730            0
bu10_suarez_berkS1_tu_1730            0
bu12_suarez_berkS1_tu_1730            0
gu13_fisher_berkS1_tu_1730            0
bu14_suarez_berkS1_tu_1730            0
berkS1_tu_1800                  0
bu8_perry_berkS1_tu_1800            0
gu9_reza_berkS1_tu_1800            0
bu9_serrano_berkS1_tu_1800            0
bu10_suarez_berkS1_tu_1800            0
bu11_anderson_berkS1_tu_1800            0
gu11_cardinale_berkS1_tu_1800            0
bu12_martin_berkS1_tu_1800            0
bu12_suarez_berkS1_tu_1800            0
gu13_fisher_berkS1_tu_1800            0
bu14_suarez_berkS1_tu_1800            0
berkS1_tu_1830                  0
bu8_perry_berkS1_tu_1830            0
gu9_reza_berkS1_tu_1830            0
bu9_serrano_berkS1_tu_1830            0
bu10_suarez_berkS1_tu_1830            0
bu11_anderson_berkS1_tu_1830            0
gu11_cardinale_berkS1_tu_1830            0
bu12_martin_berkS1_tu_1830            0
bu12_suarez_berkS1_tu_1830            0
gu13_fisher_berkS1_tu_1830            0
bu14_suarez_berkS1_tu_1830            0
berkS1_tu_1900                  0
bu8_perry_berkS1_tu_1900            0
gu9_reza_berkS1_tu_1900            0
bu9_serrano_berkS1_tu_1900            0
bu10_suarez_berkS1_tu_1900            0
bu11_anderson_berkS1_tu_1900            0
gu11_cardinale_berkS1_tu_1900            0
bu12_martin_berkS1_tu_1900            0
bu12_suarez_berkS1_tu_1900            0
gu13_fisher_berkS1_tu_1900            0
bu14_suarez_berkS1_tu_1900            0
berkS1_th_1500                  0
bu8_perry_berkS1_th_1500            0
gu9_reza_berkS1_th_1500            0
bu9_serrano_berkS1_th_1500            0
bu10_suarez_berkS1_th_1500            0
bu11_anderson_berkS1_th_1500            0
gu11_cardinale_berkS1_th_1500            0
bu12_martin_berkS1_th_1500            0
bu12_suarez_berkS1_th_1500            0
gu13_fisher_berkS1_th_1500            0
bu14_suarez_berkS1_th_1500            0
berkS1_th_1530                  0
bu8_perry_berkS1_th_1530            0
gu9_reza_berkS1_th_1530            0
bu9_serrano_berkS1_th_1530            0
bu10_suarez_berkS1_th_1530            0
bu11_anderson_berkS1_th_1530            0
gu11_cardinale_berkS1_th_1530            0
bu12_martin_berkS1_th_1530            0
bu12_suarez_berkS1_th_1530            0
gu13_fisher_berkS1_th_1530            0
bu14_suarez_berkS1_th_1530            0
berkS1_th_1600                  0
bu8_perry_berkS1_th_1600            0
gu9_reza_berkS1_th_1600            0
bu9_serrano_berkS1_th_1600            0
bu10_suarez_berkS1_th_1600            0
bu11_anderson_berkS1_th_1600            0
gu11_cardinale_berkS1_th_1600            0
bu12_martin_berkS1_th_1600            0
bu12_suarez_berkS1_th_1600            0
gu13_fisher_berkS1_th_1600            0
bu14_suarez_berkS1_th_1600            0
berkS1_th_1630                  1
bu8_perry_berkS1_th_1630            0
gu9_reza_berkS1_th_1630            0
bu9_serrano_berkS1_th_1630            0
bu10_suarez_berkS1_th_1630            0
bu12_suarez_berkS1_th_1630            0
gu13_fisher_berkS1_th_1630            0
bu14_suarez_berkS1_th_1630            0
berkS1_th_1700                  1
bu8_perry_berkS1_th_1700            0
gu9_reza_berkS1_th_1700            0
bu9_serrano_berkS1_th_1700            0
bu10_suarez_berkS1_th_1700            0
bu12_suarez_berkS1_th_1700            0
gu13_fisher_berkS1_th_1700            0
bu14_suarez_berkS1_th_1700            0
berkS1_th_1730                  1
bu8_perry_berkS1_th_1730            0
gu9_reza_berkS1_th_1730            0
bu9_serrano_berkS1_th_1730            0
bu10_suarez_berkS1_th_1730            0
bu12_suarez_berkS1_th_1730            0
gu13_fisher_berkS1_th_1730            0
bu14_suarez_berkS1_th_1730            0
berkS1_th_1800                  0
bu8_perry_berkS1_th_1800            0
gu9_reza_berkS1_th_1800            0
bu9_serrano_berkS1_th_1800            0
bu10_suarez_berkS1_th_1800            0
bu11_anderson_berkS1_th_1800            0
gu11_cardinale_berkS1_th_1800            0
bu12_martin_berkS1_th_1800            0
bu12_suarez_berkS1_th_1800            0
gu13_fisher_berkS1_th_1800            0
bu14_suarez_berkS1_th_1800            0
berkS1_th_1830                  0
bu8_perry_berkS1_th_1830            0
gu9_reza_berkS1_th_1830            0
bu9_serrano_berkS1_th_1830            0
bu10_suarez_berkS1_th_1830            0
bu11_anderson_berkS1_th_1830            0
gu11_cardinale_berkS1_th_1830            0
bu12_martin_berkS1_th_1830            0
bu12_suarez_berkS1_th_1830            0
gu13_fisher_berkS1_th_1830            0
bu14_suarez_berkS1_th_1830            0
berkS1_th_1900                  0
bu8_perry_berkS1_th_1900            0
gu9_reza_berkS1_th_1900            0
bu9_serrano_berkS1_th_1900            0
bu10_suarez_berkS1_th_1900            0
bu11_anderson_berkS1_th_1900            0
gu11_cardinale_berkS1_th_1900            0
bu12_martin_berkS1_th_1900            0
bu12_suarez_berkS1_th_1900            0
gu13_fisher_berkS1_th_1900            0
bu14_suarez_berkS1_th_1900            0
berkS2_tu_1500                  0
bu8_perry_berkS2_tu_1500            0
gu9_reza_berkS2_tu_1500            0
bu9_serrano_berkS2_tu_1500            0
bu10_suarez_berkS2_tu_1500            0
bu11_anderson_berkS2_tu_1500            0
gu11_cardinale_berkS2_tu_1500            0
bu12_martin_berkS2_tu_1500            0
bu12_suarez_berkS2_tu_1500            0
gu13_fisher_berkS2_tu_1500            0
bu14_suarez_berkS2_tu_1500            0
berkS2_tu_1530                  0
bu8_perry_berkS2_tu_1530            0
gu9_reza_berkS2_tu_1530            0
bu9_serrano_berkS2_tu_1530            0
bu10_suarez_berkS2_tu_1530            0
bu11_anderson_berkS2_tu_1530            0
gu11_cardinale_berkS2_tu_1530            0
bu12_martin_berkS2_tu_1530            0
bu12_suarez_berkS2_tu_1530            0
gu13_fisher_berkS2_tu_1530            0
bu14_suarez_berkS2_tu_1530            0
berkS2_tu_1600                  0
bu8_perry_berkS2_tu_1600            0
gu9_reza_berkS2_tu_1600            0
bu9_serrano_berkS2_tu_1600            0
bu10_suarez_berkS2_tu_1600            0
bu11_anderson_berkS2_tu_1600            0
gu11_cardinale_berkS2_tu_1600            0
bu12_martin_berkS2_tu_1600            0
bu12_suarez_berkS2_tu_1600            0
gu13_fisher_berkS2_tu_1600            0
bu14_suarez_berkS2_tu_1600            0
berkS2_tu_1630                  1
bu8_perry_berkS2_tu_1630            0
gu9_reza_berkS2_tu_1630            0
bu9_serrano_berkS2_tu_1630            0
bu10_suarez_berkS2_tu_1630            0
bu12_suarez_berkS2_tu_1630            0
gu13_fisher_berkS2_tu_1630            0
bu14_suarez_berkS2_tu_1630            0
berkS2_tu_1700                  1
bu8_perry_berkS2_tu_1700            0
gu9_reza_berkS2_tu_1700            0
bu9_serrano_berkS2_tu_1700            0
bu10_suarez_berkS2_tu_1700            0
bu12_suarez_berkS2_tu_1700            0
gu13_fisher_berkS2_tu_1700            0
bu14_suarez_berkS2_tu_1700            0
berkS2_tu_1730                  1
bu8_perry_berkS2_tu_1730            0
gu9_reza_berkS2_tu_1730            0
bu9_serrano_berkS2_tu_1730            0
bu10_suarez_berkS2_tu_1730            0
bu12_suarez_berkS2_tu_1730            0
gu13_fisher_berkS2_tu_1730            0
bu14_suarez_berkS2_tu_1730            0
berkS2_tu_1800                  0
bu8_perry_berkS2_tu_1800            0
gu9_reza_berkS2_tu_1800            0
bu9_serrano_berkS2_tu_1800            0
bu10_suarez_berkS2_tu_1800            0
bu11_anderson_berkS2_tu_1800            0
gu11_cardinale_berkS2_tu_1800            0
bu12_martin_berkS2_tu_1800            0
bu12_suarez_berkS2_tu_1800            0
gu13_fisher_berkS2_tu_1800            0
bu14_suarez_berkS2_tu_1800            0
berkS2_tu_1830                  0
bu8_perry_berkS2_tu_1830            0
gu9_reza_berkS2_tu_1830            0
bu9_serrano_berkS2_tu_1830            0
bu10_suarez_berkS2_tu_1830            0
bu11_anderson_berkS2_tu_1830            0
gu11_cardinale_berkS2_tu_1830            0
bu12_martin_berkS2_tu_1830            0
bu12_suarez_berkS2_tu_1830            0
gu13_fisher_berkS2_tu_1830            0
bu14_suarez_berkS2_tu_1830            0
berkS2_tu_1900                  0
bu8_perry_berkS2_tu_1900            0
gu9_reza_berkS2_tu_1900            0
bu9_serrano_berkS2_tu_1900            0
bu10_suarez_berkS2_tu_1900            0
bu11_anderson_berkS2_tu_1900            0
gu11_cardinale_berkS2_tu_1900            0
bu12_martin_berkS2_tu_1900            0
bu12_suarez_berkS2_tu_1900            0
gu13_fisher_berkS2_tu_1900            0
bu14_suarez_berkS2_tu_1900            0
berkS2_th_1500                  0
bu8_perry_berkS2_th_1500            0
gu9_reza_berkS2_th_1500            0
bu9_serrano_berkS2_th_1500            0
bu10_suarez_berkS2_th_1500            0
bu11_anderson_berkS2_th_1500            0
gu11_cardinale_berkS2_th_1500            0
bu12_martin_berkS2_th_1500            0
bu12_suarez_berkS2_th_1500            0
gu13_fisher_berkS2_th_1500            0
bu14_suarez_berkS2_th_1500            0
berkS2_th_1530                  0
bu8_perry_berkS2_th_1530            0
gu9_reza_berkS2_th_1530            0
bu9_serrano_berkS2_th_1530            0
bu10_suarez_berkS2_th_1530            0
bu11_anderson_berkS2_th_1530            0
gu11_cardinale_berkS2_th_1530            0
bu12_martin_berkS2_th_1530            0
bu12_suarez_berkS2_th_1530            0
gu13_fisher_berkS2_th_1530            0
bu14_suarez_berkS2_th_1530            0
berkS2_th_1600                  0
bu8_perry_berkS2_th_1600            0
gu9_reza_berkS2_th_1600            0
bu9_serrano_berkS2_th_1600            0
bu10_suarez_berkS2_th_1600            0
bu11_anderson_berkS2_th_1600            0
gu11_cardinale_berkS2_th_1600            0
bu12_martin_berkS2_th_1600            0
bu12_suarez_berkS2_th_1600            0
gu13_fisher_berkS2_th_1600            0
bu14_suarez_berkS2_th_1600            0
berkS2_th_1630                  1
bu8_perry_berkS2_th_1630            0
gu9_reza_berkS2_th_1630            0
bu9_serrano_berkS2_th_1630            0
bu10_suarez_berkS2_th_1630            0
bu12_suarez_berkS2_th_1630            0
gu13_fisher_berkS2_th_1630            0
bu14_suarez_berkS2_th_1630            0
berkS2_th_1700                  1
bu8_perry_berkS2_th_1700            0
gu9_reza_berkS2_th_1700            0
bu9_serrano_berkS2_th_1700            0
bu10_suarez_berkS2_th_1700            0
bu12_suarez_berkS2_th_1700            0
gu13_fisher_berkS2_th_1700            0
bu14_suarez_berkS2_th_1700            0
berkS2_th_1730                  1
bu8_perry_berkS2_th_1730            0
gu9_reza_berkS2_th_1730            0
bu9_serrano_berkS2_th_1730            0
bu10_suarez_berkS2_th_1730            0
bu12_suarez_berkS2_th_1730            0
gu13_fisher_berkS2_th_1730            0
bu14_suarez_berkS2_th_1730            0
berkS2_th_1800                  0
bu8_perry_berkS2_th_1800            0
gu9_reza_berkS2_th_1800            0
bu9_serrano_berkS2_th_1800            0
bu10_suarez_berkS2_th_1800            0
bu11_anderson_berkS2_th_1800            0
gu11_cardinale_berkS2_th_1800            0
bu12_martin_berkS2_th_1800            0
bu12_suarez_berkS2_th_1800            0
gu13_fisher_berkS2_th_1800            0
bu14_suarez_berkS2_th_1800            0
berkS2_th_1830                  0
bu8_perry_berkS2_th_1830            0
gu9_reza_berkS2_th_1830            0
bu9_serrano_berkS2_th_1830            0
bu10_suarez_berkS2_th_1830            0
bu11_anderson_berkS2_th_1830            0
gu11_cardinale_berkS2_th_1830            0
bu12_martin_berkS2_th_1830            0
bu12_suarez_berkS2_th_1830            0
gu13_fisher_berkS2_th_1830            0
bu14_suarez_berkS2_th_1830            0
berkS2_th_1900                  0
bu8_perry_berkS2_th_1900            0
gu9_reza_berkS2_th_1900            0
bu9_serrano_berkS2_th_1900            0
bu10_suarez_berkS2_th_1900            0
bu11_anderson_berkS2_th_1900            0
gu11_cardinale_berkS2_th_1900            0
bu12_martin_berkS2_th_1900            0
bu12_suarez_berkS2_th_1900            0
gu13_fisher_berkS2_th_1900            0
bu14_suarez_berkS2_th_1900            0

TEAM SCHEDULES
	bu11_anderson:
		tu from 1630--1800 @ berkS2
		th from 1630--1800 @ berkS2
	gu11_cardinale:
		tu from 1630--1800 @ berkS1
		th from 1630--1800 @ berkS1
	bu12_martin:
		tu from 1630--1800 @ adaE
		th from 1630--1800 @ adaE
	CDR:
		we from 1500--1930 @ adaW
		sa from 900--1300 @ adaW
	EML:
		mo from 1500--1930 @ adaW
		fr from 1500--1930 @ adaW
	ESL:
		tu from 1500--1930 @ adaW
		th from 1500--1930 @ adaW
