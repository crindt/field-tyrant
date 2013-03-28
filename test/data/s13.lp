min: 0
 + 1 bu12_martin_o1 + 2 bu12_martin_o2
 + 1 bu14_tbd_o1 + 2 bu14_tbd_o2
 + 1 gu13_tbd_o1 + 2 gu13_tbd_o2
;
/* Must pick one option for each team */
bu12_martin_o1 + bu12_martin_o2 = 1;
bu14_tbd_o1 + bu14_tbd_o2 = 1;
gu13_tbd_o1 + gu13_tbd_o2 = 1;

/* team options */
bu12_martin_o1 = bu12_martin_o1_adaE;
4 bu12_martin_o1_adaE = bu12_martin_adaE_tu_300 + bu12_martin_adaE_tu_330 + bu12_martin_adaE_th_300 + bu12_martin_adaE_th_330;

bu12_martin_o2 = bu12_martin_o2_adaE;
4 bu12_martin_o2_adaE = bu12_martin_adaE_fr_400 + bu12_martin_adaE_fr_430 + bu12_martin_adaE_we_400 + bu12_martin_adaE_we_430;

bu14_tbd_o1 = bu14_tbd_o1_adaE;
4 bu14_tbd_o1_adaE = bu14_tbd_adaE_fr_400 + bu14_tbd_adaE_fr_430 + bu14_tbd_adaE_we_400 + bu14_tbd_adaE_we_430;

bu14_tbd_o2 = bu14_tbd_o2_adaE;
4 bu14_tbd_o2_adaE = bu14_tbd_adaE_fr_500 + bu14_tbd_adaE_fr_530 + bu14_tbd_adaE_we_500 + bu14_tbd_adaE_we_530;

gu13_tbd_o1 = gu13_tbd_o1_adaE;
4 gu13_tbd_o1_adaE = gu13_tbd_adaE_fr_300 + gu13_tbd_adaE_fr_330 + gu13_tbd_adaE_we_300 + gu13_tbd_adaE_we_330;

gu13_tbd_o2 = gu13_tbd_o2_adaE;
4 gu13_tbd_o2_adaE = gu13_tbd_adaE_fr_500 + gu13_tbd_adaE_fr_530 + gu13_tbd_adaE_we_500 + gu13_tbd_adaE_we_530;

/* DON'T OVERBOOK FIELDS */
adaE_tu_300 <= 1.5;
adaE_tu_300 = bu12_martin_adaE_tu_300 + bu14_tbd_adaE_tu_300 + gu13_tbd_adaE_tu_300;

adaE_tu_330 <= 1.5;
adaE_tu_330 = bu12_martin_adaE_tu_330 + bu14_tbd_adaE_tu_330 + gu13_tbd_adaE_tu_330;

adaE_tu_400 <= 1.5;
adaE_tu_400 = bu12_martin_adaE_tu_400 + bu14_tbd_adaE_tu_400 + gu13_tbd_adaE_tu_400;

adaE_tu_430 <= 1.5;
adaE_tu_430 = bu12_martin_adaE_tu_430 + bu14_tbd_adaE_tu_430 + gu13_tbd_adaE_tu_430;

adaE_tu_500 <= 1.5;
adaE_tu_500 = bu12_martin_adaE_tu_500 + bu14_tbd_adaE_tu_500 + gu13_tbd_adaE_tu_500;

adaE_tu_530 <= 1.5;
adaE_tu_530 = bu12_martin_adaE_tu_530 + bu14_tbd_adaE_tu_530 + gu13_tbd_adaE_tu_530;

adaE_tu_600 <= 1.5;
adaE_tu_600 = bu12_martin_adaE_tu_600 + bu14_tbd_adaE_tu_600 + gu13_tbd_adaE_tu_600;

adaE_tu_630 <= 1.5;
adaE_tu_630 = bu12_martin_adaE_tu_630 + bu14_tbd_adaE_tu_630 + gu13_tbd_adaE_tu_630;

adaE_tu_700 <= 1.5;
adaE_tu_700 = bu12_martin_adaE_tu_700 + bu14_tbd_adaE_tu_700 + gu13_tbd_adaE_tu_700;

adaE_th_300 <= 1.5;
adaE_th_300 = bu12_martin_adaE_th_300 + bu14_tbd_adaE_th_300 + gu13_tbd_adaE_th_300;

adaE_th_330 <= 1.5;
adaE_th_330 = bu12_martin_adaE_th_330 + bu14_tbd_adaE_th_330 + gu13_tbd_adaE_th_330;

adaE_th_400 <= 1.5;
adaE_th_400 = bu12_martin_adaE_th_400 + bu14_tbd_adaE_th_400 + gu13_tbd_adaE_th_400;

adaE_th_430 <= 1.5;
adaE_th_430 = bu12_martin_adaE_th_430 + bu14_tbd_adaE_th_430 + gu13_tbd_adaE_th_430;

adaE_th_500 <= 1.5;
adaE_th_500 = bu12_martin_adaE_th_500 + bu14_tbd_adaE_th_500 + gu13_tbd_adaE_th_500;

adaE_th_530 <= 1.5;
adaE_th_530 = bu12_martin_adaE_th_530 + bu14_tbd_adaE_th_530 + gu13_tbd_adaE_th_530;

adaE_th_600 <= 1.5;
adaE_th_600 = bu12_martin_adaE_th_600 + bu14_tbd_adaE_th_600 + gu13_tbd_adaE_th_600;

adaE_th_630 <= 1.5;
adaE_th_630 = bu12_martin_adaE_th_630 + bu14_tbd_adaE_th_630 + gu13_tbd_adaE_th_630;

adaE_th_700 <= 1.5;
adaE_th_700 = bu12_martin_adaE_th_700 + bu14_tbd_adaE_th_700 + gu13_tbd_adaE_th_700;

/* ZERO THE DISALLOWED TIMES */
bu12_martin_adaE_fr_400 + bu12_martin_adaE_fr_430 + bu12_martin_adaE_fr_400 + bu12_martin_adaE_fr_430 + bu12_martin_adaE_we_400 + bu12_martin_adaE_we_430 + bu12_martin_adaE_we_400 + bu12_martin_adaE_we_430 + bu14_tbd_adaE_fr_400 + bu14_tbd_adaE_fr_430 + bu14_tbd_adaE_fr_400 + bu14_tbd_adaE_fr_430 + bu14_tbd_adaE_we_400 + bu14_tbd_adaE_we_430 + bu14_tbd_adaE_we_400 + bu14_tbd_adaE_we_430 + bu14_tbd_adaE_fr_500 + bu14_tbd_adaE_fr_530 + bu14_tbd_adaE_fr_500 + bu14_tbd_adaE_fr_530 + bu14_tbd_adaE_we_500 + bu14_tbd_adaE_we_530 + bu14_tbd_adaE_we_500 + bu14_tbd_adaE_we_530 + gu13_tbd_adaE_fr_300 + gu13_tbd_adaE_fr_330 + gu13_tbd_adaE_fr_300 + gu13_tbd_adaE_fr_330 + gu13_tbd_adaE_we_300 + gu13_tbd_adaE_we_330 + gu13_tbd_adaE_we_300 + gu13_tbd_adaE_we_330 + gu13_tbd_adaE_fr_500 + gu13_tbd_adaE_fr_530 + gu13_tbd_adaE_fr_500 + gu13_tbd_adaE_fr_530 + gu13_tbd_adaE_we_500 + gu13_tbd_adaE_we_530 + gu13_tbd_adaE_we_500 + gu13_tbd_adaE_we_530 = 0;
/* BINARY VARS */
bin bu12_martin_adaE_tu_700, bu12_martin_adaE_th_330, bu14_tbd_o1, bu12_martin_adaE_tu_300, bu14_tbd_adaE_th_600, bu12_martin_adaE_th_530, gu13_tbd_adaE_tu_500, bu14_tbd_adaE_we_400, bu14_tbd_adaE_fr_500, bu14_tbd_adaE_fr_400, bu14_tbd_adaE_tu_700, adaE_tu_700, bu12_martin_adaE_th_300, bu14_tbd_adaE_tu_500, gu13_tbd_adaE_fr_500, gu13_tbd_adaE_fr_530, bu14_tbd_adaE_tu_300, gu13_tbd_adaE_tu_600, adaE_tu_600, gu13_tbd_adaE_tu_400, gu13_tbd_adaE_tu_430, gu13_tbd_o2, bu12_martin_adaE_th_600, adaE_th_430, bu12_martin_adaE_we_400, gu13_tbd_adaE_we_530, bu14_tbd_o2_adaE, bu12_martin_adaE_tu_430, bu14_tbd_adaE_we_430, bu14_tbd_adaE_fr_430, bu12_martin_adaE_th_630, bu12_martin_o1_adaE, bu14_tbd_adaE_th_530, adaE_tu_330, gu13_tbd_adaE_tu_700, bu12_martin_adaE_tu_330, gu13_tbd_adaE_th_430, bu14_tbd_adaE_tu_430, bu14_tbd_adaE_we_500, gu13_tbd_adaE_th_600, bu14_tbd_adaE_th_700, bu14_tbd_adaE_th_400, gu13_tbd_adaE_tu_630, gu13_tbd_adaE_fr_330, bu14_tbd_adaE_we_530, bu14_tbd_adaE_tu_600, bu14_tbd_adaE_tu_330, bu12_martin_adaE_tu_630, adaE_th_400, gu13_tbd_adaE_th_630, adaE_tu_630, adaE_tu_530, gu13_tbd_o2_adaE, gu13_tbd_adaE_th_530, adaE_tu_430, adaE_th_630, adaE_th_700, bu12_martin_adaE_we_430, bu12_martin_adaE_th_500, adaE_th_300, bu12_martin_adaE_th_700, bu12_martin_adaE_th_430, bu14_tbd_o2, bu14_tbd_adaE_tu_630, gu13_tbd_adaE_we_500, bu14_tbd_adaE_th_630, adaE_th_600, gu13_tbd_adaE_th_300, adaE_tu_400, gu13_tbd_adaE_th_500, gu13_tbd_o1, adaE_th_330, gu13_tbd_adaE_we_300, adaE_th_500, bu12_martin_adaE_th_400, gu13_tbd_adaE_tu_300, bu14_tbd_adaE_tu_400, gu13_tbd_adaE_tu_330, gu13_tbd_adaE_th_400, bu14_tbd_adaE_th_300, adaE_th_530, bu14_tbd_adaE_th_330, bu12_martin_adaE_tu_400, gu13_tbd_o1_adaE, gu13_tbd_adaE_tu_530, gu13_tbd_adaE_fr_300, adaE_tu_300, bu14_tbd_o1_adaE, bu12_martin_adaE_tu_500, gu13_tbd_adaE_th_330, bu12_martin_adaE_tu_530, bu14_tbd_adaE_tu_530, bu14_tbd_adaE_th_500, bu14_tbd_adaE_th_430, bu12_martin_o2, adaE_tu_500, bu12_martin_adaE_fr_430, bu12_martin_o2_adaE, bu14_tbd_adaE_fr_530, gu13_tbd_adaE_th_700, gu13_tbd_adaE_we_330, bu12_martin_o1, bu12_martin_adaE_fr_400, bu12_martin_adaE_tu_600;
