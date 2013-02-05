min: 0
 + 1 bu12_martin_o1 + 2 bu12_martin_o2 + 3 bu12_martin_o3
 + 1 bu14_o1 + 2 bu14_o2 + 3 bu14_o3
 + 1 gu13_o1 + 2 gu13_o2 + 3 gu13_o3
;

/* Must pick one option for each team */
bu12_martin_o1 + bu12_martin_o2 + bu12_martin_o3 = 1;
bu14_o1 + bu14_o2 + bu14_o3 = 1;
gu13_o1 + gu13_o2 + gu13_o3 = 1;

/* team options */
bu12_martin_o1 = bu12_martin_o1_ada;
4 bu12_martin_o1_ada = bu12_martin_ada_w_300 + bu12_martin_ada_w_330 + bu12_martin_ada_f_300 + bu12_martin_ada_f_330;

bu12_martin_o2 = bu12_martin_o2_ada;
4 bu12_martin_o2_ada = bu12_martin_ada_w_400 + bu12_martin_ada_w_430 + bu12_martin_ada_f_400 + bu12_martin_ada_f_430;

bu12_martin_o3 = bu12_martin_o3_ada;

bu14_o1 = bu14_o1_ada;
4 bu14_o1_ada = bu14_ada_w_400 + bu14_ada_w_430 + bu14_ada_f_400 + bu14_ada_f_430;

bu14_o2 = bu14_o2_ada;
4 bu14_o2_ada = bu14_ada_w_500 + bu14_ada_w_530 + bu14_ada_f_500 + bu14_ada_f_530;

bu14_o3 = bu14_o3_ada;

gu13_o1 = gu13_o1_ada;
4 gu13_o1_ada = gu13_ada_w_300 + gu13_ada_w_330 + gu13_ada_f_300 + gu13_ada_f_330;

gu13_o2 = gu13_o2_ada;
4 gu13_o2_ada = gu13_ada_w_500 + gu13_ada_w_530 + gu13_ada_f_500 + gu13_ada_f_530;

gu13_o3 = gu13_o3_ada;

/* DON'T OVERBOOK FIELDS */
ada_w_300 <= 1.5;
ada_w_300 = bu12_martin_ada_w_300 + gu13_ada_w_300 + bu14_ada_w_300;

ada_w_330 <= 1.5;
ada_w_330 = bu12_martin_ada_w_330 + gu13_ada_w_330 + bu14_ada_w_330;

ada_w_400 <= 1.5;
ada_w_400 = bu12_martin_ada_w_400 + gu13_ada_w_400 + bu14_ada_w_400;

ada_w_430 <= 1.5;
ada_w_430 = bu12_martin_ada_w_430 + gu13_ada_w_430 + bu14_ada_w_430;

ada_w_500 <= 1.5;
ada_w_500 = bu12_martin_ada_w_500 + gu13_ada_w_500 + bu14_ada_w_500;

ada_w_530 <= 1.5;
ada_w_530 = bu12_martin_ada_w_530 + gu13_ada_w_530 + bu14_ada_w_530;

ada_f_300 <= 1.5;
ada_f_300 = bu12_martin_ada_f_300 + gu13_ada_f_300 + bu14_ada_f_300;

ada_f_330 <= 1.5;
ada_f_330 = bu12_martin_ada_f_330 + gu13_ada_f_330 + bu14_ada_f_330;

ada_f_400 <= 1.5;
ada_f_400 = bu12_martin_ada_f_400 + gu13_ada_f_400 + bu14_ada_f_400;

ada_f_430 <= 1.5;
ada_f_430 = bu12_martin_ada_f_430 + gu13_ada_f_430 + bu14_ada_f_430;

ada_f_500 <= 1.5;
ada_f_500 = bu12_martin_ada_f_500 + gu13_ada_f_500 + bu14_ada_f_500;

ada_f_530 <= 1.5;
ada_f_530 = bu12_martin_ada_f_530 + gu13_ada_f_530 + bu14_ada_f_530;

/* BINARY VARS */
bin bu12_martin_ada_f_400, gu13_ada_f_530, ada_f_430, bu14_ada_f_330, bu14_o3_ada, bu14_o1_ada, gu13_o3, ada_f_330, gu13_ada_w_430, bu12_martin_o2_ada, gu13_o1_ada, gu13_o1, bu12_martin_o1_ada, ada_f_530, bu12_martin_ada_w_430, bu14_ada_w_330, bu14_ada_f_430, bu12_martin_ada_w_500, bu12_martin_ada_f_500, bu12_martin_ada_w_300, bu14_ada_w_530, bu14_ada_w_300, bu14_o2, bu12_martin_ada_w_400, gu13_o3_ada, gu13_ada_w_300, ada_w_330, bu14_ada_w_400, gu13_ada_f_400, gu13_ada_f_430, gu13_ada_f_300, bu14_o3, bu12_martin_ada_f_530, bu14_o1, bu14_o2_ada, gu13_o2_ada, bu14_ada_f_300, bu12_martin_o3_ada, bu12_martin_o3, ada_w_430, bu12_martin_ada_w_530, ada_f_500, gu13_ada_w_330, gu13_ada_w_500, ada_f_400, bu12_martin_ada_f_330, bu12_martin_ada_f_430, gu13_ada_f_330, ada_f_300, bu12_martin_ada_f_300, ada_w_400, gu13_ada_w_530, gu13_ada_f_500, bu14_ada_w_430, bu14_ada_f_530, gu13_ada_w_400, bu14_ada_f_500, bu14_ada_f_400, ada_w_300, gu13_o2, ada_w_500, bu12_martin_o2, bu12_martin_ada_w_330, ada_w_530, bu14_ada_w_500, bu12_martin_o1;
