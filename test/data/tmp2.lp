min: 0
 + 1 bu12_martin_o1 + 2 bu12_martin_o2 + 300 bu12_martin_o3
 + 1 gu13_tbd_o1 + 2 gu13_tbd_o2 + 300 gu13_tbd_o3
 + 1 bu14_tbd_o1 + 2 bu14_tbd_o2 + 300 bu14_tbd_o3
;
/* Must pick one option for each team */
bu12_martin_o1 + bu12_martin_o2 + bu12_martin_o3 = 1;
gu13_tbd_o1 + gu13_tbd_o2 + gu13_tbd_o3 = 1;
bu14_tbd_o1 + bu14_tbd_o2 + bu14_tbd_o3 = 1;

/* team options */
bu12_martin_o1 = bu12_martin_o1_adaE;
4 bu12_martin_o1_adaE = bu12_martin_adaE_we_1600 + bu12_martin_adaE_we_1630 + bu12_martin_adaE_fr_1600 + bu12_martin_adaE_fr_1630;

bu12_martin_o2 = bu12_martin_o2_adaE;
4 bu12_martin_o2_adaE = bu12_martin_adaE_tu_1500 + bu12_martin_adaE_tu_1530 + bu12_martin_adaE_th_1500 + bu12_martin_adaE_th_1530;

bu12_martin_o3 = bu12_martin_o3_adaE;

gu13_tbd_o1 = gu13_tbd_o1_adaE;
4 gu13_tbd_o1_adaE = gu13_tbd_adaE_we_1500 + gu13_tbd_adaE_we_1530 + gu13_tbd_adaE_fr_1500 + gu13_tbd_adaE_fr_1530;

gu13_tbd_o2 = gu13_tbd_o2_adaE;
4 gu13_tbd_o2_adaE = gu13_tbd_adaE_tu_1700 + gu13_tbd_adaE_tu_1730 + gu13_tbd_adaE_th_1700 + gu13_tbd_adaE_th_1730;

gu13_tbd_o3 = gu13_tbd_o3_adaE;

bu14_tbd_o1 = bu14_tbd_o1_adaE;
4 bu14_tbd_o1_adaE = bu14_tbd_adaE_tu_1600 + bu14_tbd_adaE_tu_1630 + bu14_tbd_adaE_th_1600 + bu14_tbd_adaE_th_1630;

bu14_tbd_o2 = bu14_tbd_o2_adaE;
4 bu14_tbd_o2_adaE = bu14_tbd_adaE_we_1700 + bu14_tbd_adaE_we_1730 + bu14_tbd_adaE_fr_1700 + bu14_tbd_adaE_fr_1730;

bu14_tbd_o3 = bu14_tbd_o3_adaE;

/* DON'T OVERBOOK FIELDS */
adaE_tu_1500 <= 1.5;
adaE_tu_1500 = bu12_martin_adaE_tu_1500 + gu13_tbd_adaE_tu_1500 + bu14_tbd_adaE_tu_1500;

adaE_tu_1530 <= 1.5;
adaE_tu_1530 = bu12_martin_adaE_tu_1530 + gu13_tbd_adaE_tu_1530 + bu14_tbd_adaE_tu_1530;

adaE_tu_1600 <= 1.5;
adaE_tu_1600 = bu12_martin_adaE_tu_1600 + gu13_tbd_adaE_tu_1600 + bu14_tbd_adaE_tu_1600;

adaE_tu_1630 <= 1.5;
adaE_tu_1630 = bu12_martin_adaE_tu_1630 + gu13_tbd_adaE_tu_1630 + bu14_tbd_adaE_tu_1630;

adaE_tu_1700 <= 1.5;
adaE_tu_1700 = bu12_martin_adaE_tu_1700 + gu13_tbd_adaE_tu_1700 + bu14_tbd_adaE_tu_1700;

adaE_tu_1730 <= 1.5;
adaE_tu_1730 = bu12_martin_adaE_tu_1730 + gu13_tbd_adaE_tu_1730 + bu14_tbd_adaE_tu_1730;

adaE_tu_1800 <= 1.5;
adaE_tu_1800 = bu12_martin_adaE_tu_1800 + gu13_tbd_adaE_tu_1800 + bu14_tbd_adaE_tu_1800;

adaE_tu_1830 <= 1.5;
adaE_tu_1830 = bu12_martin_adaE_tu_1830 + gu13_tbd_adaE_tu_1830 + bu14_tbd_adaE_tu_1830;

adaE_tu_1900 <= 1.5;
adaE_tu_1900 = bu12_martin_adaE_tu_1900 + gu13_tbd_adaE_tu_1900 + bu14_tbd_adaE_tu_1900;

adaE_th_1500 <= 1.5;
adaE_th_1500 = bu12_martin_adaE_th_1500 + gu13_tbd_adaE_th_1500 + bu14_tbd_adaE_th_1500;

adaE_th_1530 <= 1.5;
adaE_th_1530 = bu12_martin_adaE_th_1530 + gu13_tbd_adaE_th_1530 + bu14_tbd_adaE_th_1530;

adaE_th_1600 <= 1.5;
adaE_th_1600 = bu12_martin_adaE_th_1600 + gu13_tbd_adaE_th_1600 + bu14_tbd_adaE_th_1600;

adaE_th_1630 <= 1.5;
adaE_th_1630 = bu12_martin_adaE_th_1630 + gu13_tbd_adaE_th_1630 + bu14_tbd_adaE_th_1630;

adaE_th_1700 <= 1.5;
adaE_th_1700 = bu12_martin_adaE_th_1700 + gu13_tbd_adaE_th_1700 + bu14_tbd_adaE_th_1700;

adaE_th_1730 <= 1.5;
adaE_th_1730 = bu12_martin_adaE_th_1730 + gu13_tbd_adaE_th_1730 + bu14_tbd_adaE_th_1730;

adaE_th_1800 <= 1.5;
adaE_th_1800 = bu12_martin_adaE_th_1800 + gu13_tbd_adaE_th_1800 + bu14_tbd_adaE_th_1800;

adaE_th_1830 <= 1.5;
adaE_th_1830 = bu12_martin_adaE_th_1830 + gu13_tbd_adaE_th_1830 + bu14_tbd_adaE_th_1830;

adaE_th_1900 <= 1.5;
adaE_th_1900 = bu12_martin_adaE_th_1900 + gu13_tbd_adaE_th_1900 + bu14_tbd_adaE_th_1900;

/* ZERO THE DISALLOWED TIMES */
bu12_martin_adaE_we_1600 + bu12_martin_adaE_we_1630 + bu12_martin_adaE_fr_1600 + bu12_martin_adaE_fr_1630 + gu13_tbd_adaE_we_1500 + gu13_tbd_adaE_we_1530 + gu13_tbd_adaE_fr_1500 + gu13_tbd_adaE_fr_1530 + bu14_tbd_adaE_we_1700 + bu14_tbd_adaE_we_1730 + bu14_tbd_adaE_fr_1700 + bu14_tbd_adaE_fr_1730 = 0;
/* BINARY VARS */
bin bu12_martin_o1, bu12_martin_o2, bu12_martin_o3, gu13_tbd_o1, gu13_tbd_o2, gu13_tbd_o3, bu14_tbd_o1, bu14_tbd_o2, bu14_tbd_o3, bu12_martin_o1_adaE, bu12_martin_adaE_we_1600, bu12_martin_adaE_we_1630, bu12_martin_adaE_fr_1600, bu12_martin_adaE_fr_1630, bu12_martin_o2_adaE, bu12_martin_adaE_tu_1500, bu12_martin_adaE_tu_1530, bu12_martin_adaE_th_1500, bu12_martin_adaE_th_1530, bu12_martin_o3_adaE, gu13_tbd_o1_adaE, gu13_tbd_adaE_we_1500, gu13_tbd_adaE_we_1530, gu13_tbd_adaE_fr_1500, gu13_tbd_adaE_fr_1530, gu13_tbd_o2_adaE, gu13_tbd_adaE_tu_1700, gu13_tbd_adaE_tu_1730, gu13_tbd_adaE_th_1700, gu13_tbd_adaE_th_1730, gu13_tbd_o3_adaE, bu14_tbd_o1_adaE, bu14_tbd_adaE_tu_1600, bu14_tbd_adaE_tu_1630, bu14_tbd_adaE_th_1600, bu14_tbd_adaE_th_1630, bu14_tbd_o2_adaE, bu14_tbd_adaE_we_1700, bu14_tbd_adaE_we_1730, bu14_tbd_adaE_fr_1700, bu14_tbd_adaE_fr_1730, bu14_tbd_o3_adaE, adaE_tu_1500, gu13_tbd_adaE_tu_1500, bu14_tbd_adaE_tu_1500, adaE_tu_1530, gu13_tbd_adaE_tu_1530, bu14_tbd_adaE_tu_1530, adaE_tu_1600, bu12_martin_adaE_tu_1600, gu13_tbd_adaE_tu_1600, adaE_tu_1630, bu12_martin_adaE_tu_1630, gu13_tbd_adaE_tu_1630, adaE_tu_1700, bu12_martin_adaE_tu_1700, bu14_tbd_adaE_tu_1700, adaE_tu_1730, bu12_martin_adaE_tu_1730, bu14_tbd_adaE_tu_1730, adaE_tu_1800, bu12_martin_adaE_tu_1800, gu13_tbd_adaE_tu_1800, bu14_tbd_adaE_tu_1800, adaE_tu_1830, bu12_martin_adaE_tu_1830, gu13_tbd_adaE_tu_1830, bu14_tbd_adaE_tu_1830, adaE_tu_1900, bu12_martin_adaE_tu_1900, gu13_tbd_adaE_tu_1900, bu14_tbd_adaE_tu_1900, adaE_th_1500, gu13_tbd_adaE_th_1500, bu14_tbd_adaE_th_1500, adaE_th_1530, gu13_tbd_adaE_th_1530, bu14_tbd_adaE_th_1530, adaE_th_1600, bu12_martin_adaE_th_1600, gu13_tbd_adaE_th_1600, adaE_th_1630, bu12_martin_adaE_th_1630, gu13_tbd_adaE_th_1630, adaE_th_1700, bu12_martin_adaE_th_1700, bu14_tbd_adaE_th_1700, adaE_th_1730, bu12_martin_adaE_th_1730, bu14_tbd_adaE_th_1730, adaE_th_1800, bu12_martin_adaE_th_1800, gu13_tbd_adaE_th_1800, bu14_tbd_adaE_th_1800, adaE_th_1830, bu12_martin_adaE_th_1830, gu13_tbd_adaE_th_1830, bu14_tbd_adaE_th_1830, adaE_th_1900, bu12_martin_adaE_th_1900, gu13_tbd_adaE_th_1900, bu14_tbd_adaE_th_1900;
