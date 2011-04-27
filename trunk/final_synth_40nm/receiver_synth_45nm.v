
module receiver ( RX_Ready, Clk_S, Rst_n, S_Data, RX_Data_Valid, RX_Data );
  output [54:0] RX_Data;
  input RX_Ready, Clk_S, Rst_n, S_Data;
  output RX_Data_Valid;
  wire   \state[0] , \rx_side/next_start_seq[5] , \rx_side/next_start_seq[4] ,
         \rx_side/next_start_seq[1] , \rx_side/next_start_seq[0] ,
         \rx_side/next_counter[6] , \rx_side/next_counter[5] ,
         \rx_side/next_counter[4] , \rx_side/next_counter[3] ,
         \rx_side/next_counter[2] , \rx_side/next_counter[1] ,
         \rx_side/next_counter[0] , \rx_side/next_state[2] ,
         \rx_side/next_state[1] , \rx_side/counter[0] , \rx_side/counter[1] ,
         \rx_side/counter[2] , \rx_side/counter[3] , \rx_side/counter[4] ,
         \rx_side/counter[5] , \rx_side/counter[6] , \rx_side/start_seq[0] ,
         \rx_side/start_seq[1] , \rx_side/start_seq[4] ,
         \rx_side/start_seq[5] , \rx_side/state[1] , \rx_side/state[2] , n1,
         n2, n3, n6, n7, n11, n250, n251, n252, n253, n254, n255, n256, n257,
         n258, n259, n260, n261, n262, n263, n264, n265, n266, n267, n268,
         n269, n270, n271, n272, n273, n274, n275, n276, n277, n278, n279,
         n280, n281, n282, n283, n284, n285, n286, n287, n288, n289, n290,
         n291, n292, n293, n294, n295, n296, n297, n298, n299, n300, n301,
         n302, n303, n304, n305, n306, n307, n308, n309, n310, n311, n312,
         n313, n314, n315, n316, n317, n318, n319, n320, n321, n322, n323,
         n324, n325, n326, n327, n328, n329, n330, n331, n332, n333, n334,
         n335, n336, n337, n338, n339, n340, n341, n342, n343, n344, n345,
         n346, n347, n348, n349, n350, n351, n352, n353, n354, n355, n356,
         n357, n358, n359, n360, n361, n362, n363, n364, n365, n366, n367,
         n368, n369, n370, n371, n372, n373, n374, n375, n376, n377, n378,
         n379, n380, n381, n382, n383, n384, n385, n386, n387, n388, n389,
         n390, n391, n392, n393, n394, n395, n396, n397, n398, n399, n400,
         n401, n402, n403, n404, n405, n406, n407, n408, n409, n410, n411,
         n412, n413, n414, n415, n416, n417, n418, n419, n420, n421, n422,
         n423, n424, n425, n426, n427, n428, n429, n430, n431, n432, n433,
         n434, n435, n436, n437, n438, n439, n440, n441;
  wire   [1:0] nextState;

  DFCNQD1BWP \rx_side/counter_reg[6]  ( .D(\rx_side/next_counter[6] ), .CP(
        Clk_S), .CDN(Rst_n), .Q(\rx_side/counter[6] ) );
  DFCNQD1BWP \rx_side/state_reg[1]  ( .D(\rx_side/next_state[1] ), .CP(Clk_S), 
        .CDN(Rst_n), .Q(\rx_side/state[1] ) );
  DFCNQD1BWP \state_reg[0]  ( .D(nextState[0]), .CP(Clk_S), .CDN(Rst_n), .Q(
        \state[0] ) );
  DFCNQD1BWP \state_reg[1]  ( .D(nextState[1]), .CP(Clk_S), .CDN(Rst_n), .Q(
        RX_Data_Valid) );
  DFCNQD1BWP \rx_side/state_reg[0]  ( .D(n3), .CP(Clk_S), .CDN(Rst_n), .Q(n11)
         );
  DFCNQD1BWP \rx_side/state_reg[2]  ( .D(\rx_side/next_state[2] ), .CP(Clk_S), 
        .CDN(Rst_n), .Q(\rx_side/state[2] ) );
  DFSNQD1BWP \rx_side/start_seq_reg[0]  ( .D(\rx_side/next_start_seq[0] ), 
        .CP(Clk_S), .SDN(Rst_n), .Q(\rx_side/start_seq[0] ) );
  DFSNQD1BWP \rx_side/start_seq_reg[1]  ( .D(\rx_side/next_start_seq[1] ), 
        .CP(Clk_S), .SDN(Rst_n), .Q(\rx_side/start_seq[1] ) );
  DFCNQD1BWP \rx_side/start_seq_reg[2]  ( .D(n2), .CP(Clk_S), .CDN(Rst_n), .Q(
        n6) );
  DFCNQD1BWP \rx_side/start_seq_reg[3]  ( .D(n1), .CP(Clk_S), .CDN(Rst_n), .Q(
        n7) );
  DFSNQD1BWP \rx_side/start_seq_reg[4]  ( .D(\rx_side/next_start_seq[4] ), 
        .CP(Clk_S), .SDN(Rst_n), .Q(\rx_side/start_seq[4] ) );
  DFSNQD1BWP \rx_side/start_seq_reg[5]  ( .D(\rx_side/next_start_seq[5] ), 
        .CP(Clk_S), .SDN(Rst_n), .Q(\rx_side/start_seq[5] ) );
  DFSNQD1BWP \rx_side/counter_reg[1]  ( .D(\rx_side/next_counter[1] ), .CP(
        Clk_S), .SDN(Rst_n), .Q(\rx_side/counter[1] ) );
  DFSNQD1BWP \rx_side/counter_reg[2]  ( .D(\rx_side/next_counter[2] ), .CP(
        Clk_S), .SDN(Rst_n), .Q(\rx_side/counter[2] ) );
  DFSNQD1BWP \rx_side/counter_reg[4]  ( .D(\rx_side/next_counter[4] ), .CP(
        Clk_S), .SDN(Rst_n), .Q(\rx_side/counter[4] ) );
  DFSNQD1BWP \rx_side/counter_reg[5]  ( .D(\rx_side/next_counter[5] ), .CP(
        Clk_S), .SDN(Rst_n), .Q(\rx_side/counter[5] ) );
  DFCNQD1BWP \rx_side/counter_reg[0]  ( .D(\rx_side/next_counter[0] ), .CP(
        Clk_S), .CDN(Rst_n), .Q(\rx_side/counter[0] ) );
  DFCNQD1BWP \rx_side/counter_reg[3]  ( .D(\rx_side/next_counter[3] ), .CP(
        Clk_S), .CDN(Rst_n), .Q(\rx_side/counter[3] ) );
  DFCNQD1BWP \rx_side/packet_reg[37]  ( .D(n267), .CP(Clk_S), .CDN(Rst_n), .Q(
        RX_Data[37]) );
  DFCNQD1BWP \rx_side/packet_reg[36]  ( .D(n268), .CP(Clk_S), .CDN(Rst_n), .Q(
        RX_Data[36]) );
  DFCNQD1BWP \rx_side/packet_reg[35]  ( .D(n269), .CP(Clk_S), .CDN(Rst_n), .Q(
        RX_Data[35]) );
  DFCNQD1BWP \rx_side/packet_reg[34]  ( .D(n270), .CP(Clk_S), .CDN(Rst_n), .Q(
        RX_Data[34]) );
  DFCNQD1BWP \rx_side/packet_reg[33]  ( .D(n271), .CP(Clk_S), .CDN(Rst_n), .Q(
        RX_Data[33]) );
  DFCNQD1BWP \rx_side/packet_reg[32]  ( .D(n272), .CP(Clk_S), .CDN(Rst_n), .Q(
        RX_Data[32]) );
  DFCNQD1BWP \rx_side/packet_reg[31]  ( .D(n273), .CP(Clk_S), .CDN(Rst_n), .Q(
        RX_Data[31]) );
  DFCNQD1BWP \rx_side/packet_reg[30]  ( .D(n274), .CP(Clk_S), .CDN(Rst_n), .Q(
        RX_Data[30]) );
  DFCNQD1BWP \rx_side/packet_reg[29]  ( .D(n275), .CP(Clk_S), .CDN(Rst_n), .Q(
        RX_Data[29]) );
  DFCNQD1BWP \rx_side/packet_reg[28]  ( .D(n276), .CP(Clk_S), .CDN(Rst_n), .Q(
        RX_Data[28]) );
  DFCNQD1BWP \rx_side/packet_reg[27]  ( .D(n277), .CP(Clk_S), .CDN(Rst_n), .Q(
        RX_Data[27]) );
  DFCNQD1BWP \rx_side/packet_reg[26]  ( .D(n278), .CP(Clk_S), .CDN(Rst_n), .Q(
        RX_Data[26]) );
  DFCNQD1BWP \rx_side/packet_reg[25]  ( .D(n279), .CP(Clk_S), .CDN(Rst_n), .Q(
        RX_Data[25]) );
  DFCNQD1BWP \rx_side/packet_reg[24]  ( .D(n280), .CP(Clk_S), .CDN(Rst_n), .Q(
        RX_Data[24]) );
  DFCNQD1BWP \rx_side/packet_reg[23]  ( .D(n281), .CP(Clk_S), .CDN(Rst_n), .Q(
        RX_Data[23]) );
  DFCNQD1BWP \rx_side/packet_reg[22]  ( .D(n282), .CP(Clk_S), .CDN(Rst_n), .Q(
        RX_Data[22]) );
  DFCNQD1BWP \rx_side/packet_reg[21]  ( .D(n283), .CP(Clk_S), .CDN(Rst_n), .Q(
        RX_Data[21]) );
  DFCNQD1BWP \rx_side/packet_reg[20]  ( .D(n284), .CP(Clk_S), .CDN(Rst_n), .Q(
        RX_Data[20]) );
  DFCNQD1BWP \rx_side/packet_reg[19]  ( .D(n285), .CP(Clk_S), .CDN(Rst_n), .Q(
        RX_Data[19]) );
  DFCNQD1BWP \rx_side/packet_reg[18]  ( .D(n286), .CP(Clk_S), .CDN(Rst_n), .Q(
        RX_Data[18]) );
  DFCNQD1BWP \rx_side/packet_reg[17]  ( .D(n287), .CP(Clk_S), .CDN(Rst_n), .Q(
        RX_Data[17]) );
  DFCNQD1BWP \rx_side/packet_reg[16]  ( .D(n288), .CP(Clk_S), .CDN(Rst_n), .Q(
        RX_Data[16]) );
  DFCNQD1BWP \rx_side/packet_reg[15]  ( .D(n289), .CP(Clk_S), .CDN(Rst_n), .Q(
        RX_Data[15]) );
  DFCNQD1BWP \rx_side/packet_reg[14]  ( .D(n290), .CP(Clk_S), .CDN(Rst_n), .Q(
        RX_Data[14]) );
  DFCNQD1BWP \rx_side/packet_reg[13]  ( .D(n291), .CP(Clk_S), .CDN(Rst_n), .Q(
        RX_Data[13]) );
  DFCNQD1BWP \rx_side/packet_reg[12]  ( .D(n292), .CP(Clk_S), .CDN(Rst_n), .Q(
        RX_Data[12]) );
  DFCNQD1BWP \rx_side/packet_reg[11]  ( .D(n293), .CP(Clk_S), .CDN(Rst_n), .Q(
        RX_Data[11]) );
  DFCNQD1BWP \rx_side/packet_reg[10]  ( .D(n294), .CP(Clk_S), .CDN(Rst_n), .Q(
        RX_Data[10]) );
  DFCNQD1BWP \rx_side/packet_reg[9]  ( .D(n295), .CP(Clk_S), .CDN(Rst_n), .Q(
        RX_Data[9]) );
  DFCNQD1BWP \rx_side/packet_reg[8]  ( .D(n296), .CP(Clk_S), .CDN(Rst_n), .Q(
        RX_Data[8]) );
  DFCNQD1BWP \rx_side/packet_reg[7]  ( .D(n297), .CP(Clk_S), .CDN(Rst_n), .Q(
        RX_Data[7]) );
  DFCNQD1BWP \rx_side/packet_reg[6]  ( .D(n298), .CP(Clk_S), .CDN(Rst_n), .Q(
        RX_Data[6]) );
  DFCNQD1BWP \rx_side/packet_reg[5]  ( .D(n299), .CP(Clk_S), .CDN(Rst_n), .Q(
        RX_Data[5]) );
  DFCNQD1BWP \rx_side/packet_reg[4]  ( .D(n300), .CP(Clk_S), .CDN(Rst_n), .Q(
        RX_Data[4]) );
  DFCNQD1BWP \rx_side/packet_reg[3]  ( .D(n301), .CP(Clk_S), .CDN(Rst_n), .Q(
        RX_Data[3]) );
  DFCNQD1BWP \rx_side/packet_reg[2]  ( .D(n302), .CP(Clk_S), .CDN(Rst_n), .Q(
        RX_Data[2]) );
  DFCNQD1BWP \rx_side/packet_reg[1]  ( .D(n303), .CP(Clk_S), .CDN(Rst_n), .Q(
        RX_Data[1]) );
  DFCNQD1BWP \rx_side/packet_reg[0]  ( .D(n304), .CP(Clk_S), .CDN(Rst_n), .Q(
        RX_Data[0]) );
  DFCNQD1BWP \rx_side/packet_reg[54]  ( .D(n250), .CP(Clk_S), .CDN(Rst_n), .Q(
        RX_Data[54]) );
  DFCNQD1BWP \rx_side/packet_reg[53]  ( .D(n251), .CP(Clk_S), .CDN(Rst_n), .Q(
        RX_Data[53]) );
  DFCNQD1BWP \rx_side/packet_reg[52]  ( .D(n252), .CP(Clk_S), .CDN(Rst_n), .Q(
        RX_Data[52]) );
  DFCNQD1BWP \rx_side/packet_reg[51]  ( .D(n253), .CP(Clk_S), .CDN(Rst_n), .Q(
        RX_Data[51]) );
  DFCNQD1BWP \rx_side/packet_reg[50]  ( .D(n254), .CP(Clk_S), .CDN(Rst_n), .Q(
        RX_Data[50]) );
  DFCNQD1BWP \rx_side/packet_reg[49]  ( .D(n255), .CP(Clk_S), .CDN(Rst_n), .Q(
        RX_Data[49]) );
  DFCNQD1BWP \rx_side/packet_reg[48]  ( .D(n256), .CP(Clk_S), .CDN(Rst_n), .Q(
        RX_Data[48]) );
  DFCNQD1BWP \rx_side/packet_reg[47]  ( .D(n257), .CP(Clk_S), .CDN(Rst_n), .Q(
        RX_Data[47]) );
  DFCNQD1BWP \rx_side/packet_reg[46]  ( .D(n258), .CP(Clk_S), .CDN(Rst_n), .Q(
        RX_Data[46]) );
  DFCNQD1BWP \rx_side/packet_reg[45]  ( .D(n259), .CP(Clk_S), .CDN(Rst_n), .Q(
        RX_Data[45]) );
  DFCNQD1BWP \rx_side/packet_reg[44]  ( .D(n260), .CP(Clk_S), .CDN(Rst_n), .Q(
        RX_Data[44]) );
  DFCNQD1BWP \rx_side/packet_reg[43]  ( .D(n261), .CP(Clk_S), .CDN(Rst_n), .Q(
        RX_Data[43]) );
  DFCNQD1BWP \rx_side/packet_reg[42]  ( .D(n262), .CP(Clk_S), .CDN(Rst_n), .Q(
        RX_Data[42]) );
  DFCNQD1BWP \rx_side/packet_reg[41]  ( .D(n263), .CP(Clk_S), .CDN(Rst_n), .Q(
        RX_Data[41]) );
  DFCNQD1BWP \rx_side/packet_reg[40]  ( .D(n264), .CP(Clk_S), .CDN(Rst_n), .Q(
        RX_Data[40]) );
  DFCNQD1BWP \rx_side/packet_reg[39]  ( .D(n265), .CP(Clk_S), .CDN(Rst_n), .Q(
        RX_Data[39]) );
  DFCNQD1BWP \rx_side/packet_reg[38]  ( .D(n266), .CP(Clk_S), .CDN(Rst_n), .Q(
        RX_Data[38]) );
  ND2D2BWP U322 ( .A1(\rx_side/counter[3] ), .A2(n425), .ZN(n402) );
  ND2D2BWP U323 ( .A1(\rx_side/counter[3] ), .A2(\rx_side/counter[0] ), .ZN(
        n406) );
  CKND2D0BWP U324 ( .A1(n11), .A2(\rx_side/state[2] ), .ZN(n305) );
  MUX2ND0BWP U325 ( .I0(\state[0] ), .I1(RX_Ready), .S(RX_Data_Valid), .ZN(
        n306) );
  OAI31D0BWP U326 ( .A1(\rx_side/state[1] ), .A2(\state[0] ), .A3(n305), .B(
        n306), .ZN(nextState[0]) );
  NR2D0BWP U327 ( .A1(\rx_side/counter[0] ), .A2(n440), .ZN(
        \rx_side/next_counter[0] ) );
  OAI21D0BWP U328 ( .A1(n436), .A2(n435), .B(n3), .ZN(
        \rx_side/next_counter[5] ) );
  OAI21D0BWP U329 ( .A1(n436), .A2(n426), .B(n3), .ZN(
        \rx_side/next_counter[1] ) );
  NR2D0BWP U330 ( .A1(n441), .A2(n423), .ZN(n436) );
  IND2D0BWP U331 ( .A1(n423), .B1(n422), .ZN(\rx_side/next_state[1] ) );
  INR2XD0BWP U332 ( .A1(n437), .B1(n421), .ZN(n423) );
  NR2D0BWP U333 ( .A1(n437), .A2(n421), .ZN(\rx_side/next_state[2] ) );
  AOI21D0BWP U334 ( .A1(n434), .A2(\rx_side/counter[5] ), .B(n439), .ZN(n435)
         );
  NR2D1BWP U335 ( .A1(n434), .A2(\rx_side/counter[5] ), .ZN(n439) );
  CKND2D1BWP U336 ( .A1(n380), .A2(n351), .ZN(n366) );
  CKND2D1BWP U337 ( .A1(n428), .A2(n427), .ZN(\rx_side/next_counter[2] ) );
  CKND2D1BWP U338 ( .A1(n376), .A2(n351), .ZN(n362) );
  CKND2D1BWP U339 ( .A1(n318), .A2(n372), .ZN(n410) );
  INVD0BWP U340 ( .I(n376), .ZN(n334) );
  CKND2D1BWP U341 ( .A1(n376), .A2(n384), .ZN(n396) );
  CKND2D1BWP U342 ( .A1(n377), .A2(n351), .ZN(n360) );
  CKND2D1BWP U343 ( .A1(n318), .A2(n380), .ZN(n419) );
  CKND2D1BWP U344 ( .A1(n377), .A2(n384), .ZN(n394) );
  CKND2D1BWP U345 ( .A1(n381), .A2(n351), .ZN(n364) );
  OAI31D0BWP U346 ( .A1(n427), .A2(n344), .A3(n343), .B(n342), .ZN(n250) );
  CKND2D1BWP U347 ( .A1(n372), .A2(n384), .ZN(n392) );
  CKND2D1BWP U348 ( .A1(n373), .A2(n351), .ZN(n356) );
  INVD0BWP U349 ( .I(n380), .ZN(n340) );
  CKND2D1BWP U350 ( .A1(n373), .A2(n384), .ZN(n390) );
  INVD0BWP U351 ( .I(n372), .ZN(n330) );
  CKND2D1BWP U352 ( .A1(n380), .A2(n384), .ZN(n400) );
  CKND2D1BWP U353 ( .A1(n318), .A2(n376), .ZN(n414) );
  CKND2D1BWP U354 ( .A1(n381), .A2(n384), .ZN(n398) );
  AO211D0BWP U355 ( .A1(\rx_side/counter[4] ), .A2(n433), .B(n432), .C(n431), 
        .Z(\rx_side/next_counter[4] ) );
  CKND2D1BWP U356 ( .A1(n372), .A2(n351), .ZN(n358) );
  NR2D1BWP U357 ( .A1(n332), .A2(n344), .ZN(n376) );
  CKND1BWP U358 ( .I(n344), .ZN(n385) );
  NR2D1BWP U359 ( .A1(n338), .A2(n344), .ZN(n380) );
  CKND2D1BWP U360 ( .A1(n310), .A2(n3), .ZN(n322) );
  NR2D1BWP U361 ( .A1(n332), .A2(n432), .ZN(n377) );
  NR2D1BWP U362 ( .A1(n328), .A2(n432), .ZN(n373) );
  NR2D1BWP U363 ( .A1(n338), .A2(n432), .ZN(n381) );
  NR2D1BWP U364 ( .A1(n433), .A2(\rx_side/counter[4] ), .ZN(n431) );
  OR2XD1BWP U365 ( .A1(n341), .A2(n432), .Z(n337) );
  NR2D1BWP U366 ( .A1(n344), .A2(n328), .ZN(n372) );
  OR2D1BWP U367 ( .A1(n343), .A2(n432), .Z(n335) );
  CKND2D1BWP U368 ( .A1(n352), .A2(n3), .ZN(n368) );
  INR2XD0BWP U369 ( .A1(n318), .B1(n427), .ZN(n310) );
  CKND2D1BWP U370 ( .A1(n386), .A2(n3), .ZN(n403) );
  INR2XD0BWP U371 ( .A1(n384), .B1(n427), .ZN(n386) );
  BUFFD2BWP U372 ( .I(n416), .Z(n307) );
  NR2D1BWP U373 ( .A1(n325), .A2(\rx_side/counter[4] ), .ZN(n318) );
  CKBD1BWP U374 ( .I(n420), .Z(n308) );
  NR2D1BWP U375 ( .A1(n325), .A2(n371), .ZN(n327) );
  CKAN2D0BWP U376 ( .A1(n6), .A2(n441), .Z(n1) );
  AOI22D0BWP U377 ( .A1(\rx_side/counter[1] ), .A2(\rx_side/counter[0] ), .B1(
        n425), .B2(n424), .ZN(n426) );
  INR2XD0BWP U378 ( .A1(n441), .B1(\rx_side/start_seq[1] ), .ZN(n2) );
  IND2D0BWP U379 ( .A1(\rx_side/start_seq[4] ), .B1(n441), .ZN(
        \rx_side/next_start_seq[5] ) );
  INR2XD0BWP U380 ( .A1(n351), .B1(n427), .ZN(n352) );
  IND2D0BWP U381 ( .A1(\rx_side/start_seq[0] ), .B1(n441), .ZN(
        \rx_side/next_start_seq[1] ) );
  IND2D0BWP U382 ( .A1(S_Data), .B1(n441), .ZN(\rx_side/next_start_seq[0] ) );
  CKND2D0BWP U383 ( .A1(n441), .A2(n7), .ZN(\rx_side/next_start_seq[4] ) );
  NR3D0BWP U384 ( .A1(\rx_side/state[2] ), .A2(n11), .A3(\rx_side/state[1] ), 
        .ZN(n441) );
  NR3D0BWP U385 ( .A1(\rx_side/counter[6] ), .A2(\rx_side/counter[5] ), .A3(
        n371), .ZN(n384) );
  ND2D1BWP U386 ( .A1(n422), .A2(n421), .ZN(n3) );
  IND2D1BWP U387 ( .A1(n416), .B1(n327), .ZN(n343) );
  NR3D0BWP U388 ( .A1(\rx_side/counter[4] ), .A2(\rx_side/counter[6] ), .A3(
        \rx_side/counter[5] ), .ZN(n351) );
  ND2D1BWP U389 ( .A1(\rx_side/counter[0] ), .A2(n429), .ZN(n420) );
  ND2D1BWP U390 ( .A1(S_Data), .A2(n3), .ZN(n344) );
  ND2D1BWP U391 ( .A1(n429), .A2(n425), .ZN(n416) );
  ND2D1BWP U392 ( .A1(n385), .A2(n352), .ZN(n370) );
  ND2D1BWP U393 ( .A1(n385), .A2(n310), .ZN(n324) );
  ND2D1BWP U394 ( .A1(n385), .A2(n386), .ZN(n405) );
  ND2D1BWP U395 ( .A1(\rx_side/counter[1] ), .A2(\rx_side/counter[2] ), .ZN(
        n427) );
  INVD1BWP U396 ( .I(\rx_side/next_state[1] ), .ZN(n440) );
  ND2D1BWP U397 ( .A1(n439), .A2(n438), .ZN(n437) );
  INVD1BWP U398 ( .I(n431), .ZN(n434) );
  ND2D1BWP U399 ( .A1(n430), .A2(n429), .ZN(n433) );
  ND2D1BWP U400 ( .A1(n318), .A2(n377), .ZN(n412) );
  ND2D1BWP U401 ( .A1(\rx_side/counter[1] ), .A2(n315), .ZN(n332) );
  ND2D1BWP U402 ( .A1(n318), .A2(n381), .ZN(n417) );
  ND2D1BWP U403 ( .A1(\rx_side/counter[2] ), .A2(n424), .ZN(n338) );
  ND2D1BWP U404 ( .A1(n318), .A2(n373), .ZN(n408) );
  ND2D1BWP U405 ( .A1(n424), .A2(n315), .ZN(n328) );
  INVD1BWP U406 ( .I(\rx_side/counter[1] ), .ZN(n424) );
  ND2D1BWP U407 ( .A1(\rx_side/counter[5] ), .A2(n438), .ZN(n325) );
  INVD1BWP U408 ( .I(\rx_side/counter[0] ), .ZN(n425) );
  INVD1BWP U409 ( .I(\rx_side/counter[3] ), .ZN(n429) );
  OA21D1BWP U410 ( .A1(\state[0] ), .A2(RX_Data_Valid), .B(RX_Ready), .Z(
        nextState[1]) );
  AOI211XD0BWP U411 ( .A1(\rx_side/counter[2] ), .A2(\rx_side/counter[0] ), 
        .B(n432), .C(n430), .ZN(n428) );
  OAI31D1BWP U412 ( .A1(n432), .A2(n427), .A3(n343), .B(RX_Data[54]), .ZN(n342) );
  OAI21D1BWP U413 ( .A1(n406), .A2(n370), .B(n369), .ZN(n289) );
  OAI21D1BWP U414 ( .A1(n406), .A2(n368), .B(RX_Data[15]), .ZN(n369) );
  OAI21D1BWP U415 ( .A1(n402), .A2(n370), .B(n367), .ZN(n290) );
  OAI21D1BWP U416 ( .A1(n402), .A2(n368), .B(RX_Data[14]), .ZN(n367) );
  OAI21D1BWP U417 ( .A1(n416), .A2(n324), .B(n311), .ZN(n266) );
  OAI21D1BWP U418 ( .A1(n307), .A2(n322), .B(RX_Data[38]), .ZN(n311) );
  OAI21D1BWP U419 ( .A1(n308), .A2(n370), .B(n354), .ZN(n297) );
  OAI21D1BWP U420 ( .A1(n308), .A2(n368), .B(RX_Data[7]), .ZN(n354) );
  OAI21D1BWP U421 ( .A1(n308), .A2(n405), .B(n388), .ZN(n281) );
  OAI21D1BWP U422 ( .A1(n308), .A2(n403), .B(RX_Data[23]), .ZN(n388) );
  OAI21D1BWP U423 ( .A1(n420), .A2(n324), .B(n312), .ZN(n265) );
  OAI21D1BWP U424 ( .A1(n308), .A2(n322), .B(RX_Data[39]), .ZN(n312) );
  OAI21D1BWP U425 ( .A1(n307), .A2(n405), .B(n387), .ZN(n282) );
  OAI21D1BWP U426 ( .A1(n307), .A2(n403), .B(RX_Data[22]), .ZN(n387) );
  OAI21D1BWP U427 ( .A1(n307), .A2(n370), .B(n353), .ZN(n298) );
  OAI21D1BWP U428 ( .A1(n307), .A2(n368), .B(RX_Data[6]), .ZN(n353) );
  OAI21D1BWP U429 ( .A1(n402), .A2(n324), .B(n321), .ZN(n258) );
  OAI21D1BWP U430 ( .A1(n402), .A2(n322), .B(RX_Data[46]), .ZN(n321) );
  OAI21D1BWP U431 ( .A1(n402), .A2(n405), .B(n401), .ZN(n274) );
  OAI21D1BWP U432 ( .A1(n402), .A2(n403), .B(RX_Data[30]), .ZN(n401) );
  OAI21D1BWP U433 ( .A1(n406), .A2(n324), .B(n323), .ZN(n257) );
  OAI21D1BWP U434 ( .A1(n406), .A2(n322), .B(RX_Data[47]), .ZN(n323) );
  OAI21D1BWP U435 ( .A1(n406), .A2(n405), .B(n404), .ZN(n273) );
  OAI21D1BWP U436 ( .A1(n406), .A2(n403), .B(RX_Data[31]), .ZN(n404) );
  OAI32D1BWP U437 ( .A1(n440), .A2(n439), .A3(n438), .B1(n437), .B2(n440), 
        .ZN(\rx_side/next_counter[6] ) );
  OAI32D1BWP U438 ( .A1(n440), .A2(n430), .A3(n429), .B1(n433), .B2(n440), 
        .ZN(\rx_side/next_counter[3] ) );
  NR2XD0BWP U439 ( .A1(n328), .A2(\rx_side/counter[0] ), .ZN(n430) );
  OAI21D1BWP U440 ( .A1(n341), .A2(n330), .B(n329), .ZN(n255) );
  OAI21D1BWP U441 ( .A1(n328), .A2(n337), .B(RX_Data[49]), .ZN(n329) );
  OAI21D1BWP U442 ( .A1(n341), .A2(n340), .B(n339), .ZN(n251) );
  OAI21D1BWP U443 ( .A1(n338), .A2(n337), .B(RX_Data[53]), .ZN(n339) );
  OAI21D1BWP U444 ( .A1(n341), .A2(n334), .B(n333), .ZN(n253) );
  OAI21D1BWP U445 ( .A1(n332), .A2(n337), .B(RX_Data[51]), .ZN(n333) );
  IND2D1BWP U446 ( .A1(n420), .B1(n327), .ZN(n341) );
  OAI21D1BWP U447 ( .A1(n343), .A2(n330), .B(n326), .ZN(n256) );
  OAI21D1BWP U448 ( .A1(n328), .A2(n335), .B(RX_Data[48]), .ZN(n326) );
  OAI21D1BWP U449 ( .A1(n343), .A2(n340), .B(n336), .ZN(n252) );
  OAI21D1BWP U450 ( .A1(n338), .A2(n335), .B(RX_Data[52]), .ZN(n336) );
  OAI21D1BWP U451 ( .A1(n343), .A2(n334), .B(n331), .ZN(n254) );
  OAI21D1BWP U452 ( .A1(n332), .A2(n335), .B(RX_Data[50]), .ZN(n331) );
  OAI21D1BWP U453 ( .A1(n416), .A2(n366), .B(n349), .ZN(n300) );
  OAI21D1BWP U454 ( .A1(n416), .A2(n364), .B(RX_Data[4]), .ZN(n349) );
  OAI21D1BWP U455 ( .A1(n406), .A2(n362), .B(n361), .ZN(n293) );
  OAI21D1BWP U456 ( .A1(n406), .A2(n360), .B(RX_Data[11]), .ZN(n361) );
  OAI21D1BWP U457 ( .A1(n406), .A2(n400), .B(n399), .ZN(n275) );
  OAI21D1BWP U458 ( .A1(n406), .A2(n398), .B(RX_Data[29]), .ZN(n399) );
  OAI21D1BWP U459 ( .A1(n402), .A2(n400), .B(n397), .ZN(n276) );
  OAI21D1BWP U460 ( .A1(n402), .A2(n398), .B(RX_Data[28]), .ZN(n397) );
  OAI21D1BWP U461 ( .A1(n406), .A2(n366), .B(n365), .ZN(n291) );
  OAI21D1BWP U462 ( .A1(n406), .A2(n364), .B(RX_Data[13]), .ZN(n365) );
  OAI21D1BWP U463 ( .A1(n402), .A2(n366), .B(n363), .ZN(n292) );
  OAI21D1BWP U464 ( .A1(n402), .A2(n364), .B(RX_Data[12]), .ZN(n363) );
  OAI21D1BWP U465 ( .A1(n402), .A2(n362), .B(n359), .ZN(n294) );
  OAI21D1BWP U466 ( .A1(n402), .A2(n360), .B(RX_Data[10]), .ZN(n359) );
  OAI21D1BWP U467 ( .A1(n402), .A2(n358), .B(n355), .ZN(n296) );
  OAI21D1BWP U468 ( .A1(n402), .A2(n356), .B(RX_Data[8]), .ZN(n355) );
  OAI21D1BWP U469 ( .A1(n402), .A2(n392), .B(n389), .ZN(n280) );
  OAI21D1BWP U470 ( .A1(n402), .A2(n390), .B(RX_Data[24]), .ZN(n389) );
  OAI21D1BWP U471 ( .A1(n406), .A2(n358), .B(n357), .ZN(n295) );
  OAI21D1BWP U472 ( .A1(n406), .A2(n356), .B(RX_Data[9]), .ZN(n357) );
  OAI21D1BWP U473 ( .A1(n406), .A2(n392), .B(n391), .ZN(n279) );
  OAI21D1BWP U474 ( .A1(n406), .A2(n390), .B(RX_Data[25]), .ZN(n391) );
  OAI21D1BWP U475 ( .A1(n416), .A2(n362), .B(n347), .ZN(n302) );
  OAI21D1BWP U476 ( .A1(n307), .A2(n360), .B(RX_Data[2]), .ZN(n347) );
  OAI21D1BWP U477 ( .A1(n420), .A2(n362), .B(n348), .ZN(n301) );
  OAI21D1BWP U478 ( .A1(n420), .A2(n360), .B(RX_Data[3]), .ZN(n348) );
  OAI21D1BWP U479 ( .A1(n420), .A2(n366), .B(n350), .ZN(n299) );
  OAI21D1BWP U480 ( .A1(n420), .A2(n364), .B(RX_Data[5]), .ZN(n350) );
  OAI21D1BWP U481 ( .A1(n416), .A2(n358), .B(n345), .ZN(n304) );
  OAI21D1BWP U482 ( .A1(n307), .A2(n356), .B(RX_Data[0]), .ZN(n345) );
  OAI21D1BWP U483 ( .A1(n420), .A2(n358), .B(n346), .ZN(n303) );
  OAI21D1BWP U484 ( .A1(n420), .A2(n356), .B(RX_Data[1]), .ZN(n346) );
  OAI21D1BWP U485 ( .A1(n308), .A2(n400), .B(n383), .ZN(n283) );
  OAI21D1BWP U486 ( .A1(n308), .A2(n398), .B(RX_Data[21]), .ZN(n383) );
  OAI21D1BWP U487 ( .A1(n308), .A2(n396), .B(n379), .ZN(n285) );
  OAI21D1BWP U488 ( .A1(n308), .A2(n394), .B(RX_Data[19]), .ZN(n379) );
  OAI21D1BWP U489 ( .A1(n308), .A2(n392), .B(n375), .ZN(n287) );
  OAI21D1BWP U490 ( .A1(n308), .A2(n390), .B(RX_Data[17]), .ZN(n375) );
  OAI21D1BWP U491 ( .A1(n402), .A2(n396), .B(n393), .ZN(n278) );
  OAI21D1BWP U492 ( .A1(n402), .A2(n394), .B(RX_Data[26]), .ZN(n393) );
  OAI21D1BWP U493 ( .A1(n406), .A2(n396), .B(n395), .ZN(n277) );
  OAI21D1BWP U494 ( .A1(n406), .A2(n394), .B(RX_Data[27]), .ZN(n395) );
  OAI21D1BWP U495 ( .A1(n307), .A2(n396), .B(n378), .ZN(n286) );
  OAI21D1BWP U496 ( .A1(n307), .A2(n394), .B(RX_Data[18]), .ZN(n378) );
  OAI21D1BWP U497 ( .A1(n307), .A2(n400), .B(n382), .ZN(n284) );
  OAI21D1BWP U498 ( .A1(n307), .A2(n398), .B(RX_Data[20]), .ZN(n382) );
  OAI21D1BWP U499 ( .A1(n307), .A2(n392), .B(n374), .ZN(n288) );
  OAI21D1BWP U500 ( .A1(n307), .A2(n390), .B(RX_Data[16]), .ZN(n374) );
  INVD1BWP U501 ( .I(\rx_side/counter[4] ), .ZN(n371) );
  OAI21D1BWP U502 ( .A1(n308), .A2(n419), .B(n418), .ZN(n267) );
  OAI21D1BWP U503 ( .A1(n308), .A2(n417), .B(RX_Data[37]), .ZN(n418) );
  OAI21D1BWP U504 ( .A1(n308), .A2(n414), .B(n413), .ZN(n269) );
  OAI21D1BWP U505 ( .A1(n308), .A2(n412), .B(RX_Data[35]), .ZN(n413) );
  OAI21D1BWP U506 ( .A1(n308), .A2(n410), .B(n409), .ZN(n271) );
  OAI21D1BWP U507 ( .A1(n308), .A2(n408), .B(RX_Data[33]), .ZN(n409) );
  OAI21D1BWP U508 ( .A1(n402), .A2(n414), .B(n316), .ZN(n262) );
  OAI21D1BWP U509 ( .A1(n402), .A2(n412), .B(RX_Data[42]), .ZN(n316) );
  OAI21D1BWP U510 ( .A1(n402), .A2(n419), .B(n319), .ZN(n260) );
  OAI21D1BWP U511 ( .A1(n402), .A2(n417), .B(RX_Data[44]), .ZN(n319) );
  OAI21D1BWP U512 ( .A1(n406), .A2(n414), .B(n317), .ZN(n261) );
  OAI21D1BWP U513 ( .A1(n406), .A2(n412), .B(RX_Data[43]), .ZN(n317) );
  OAI21D1BWP U514 ( .A1(n406), .A2(n419), .B(n320), .ZN(n259) );
  OAI21D1BWP U515 ( .A1(n406), .A2(n417), .B(RX_Data[45]), .ZN(n320) );
  OAI21D1BWP U516 ( .A1(n402), .A2(n410), .B(n313), .ZN(n264) );
  OAI21D1BWP U517 ( .A1(n402), .A2(n408), .B(RX_Data[40]), .ZN(n313) );
  OAI21D1BWP U518 ( .A1(n406), .A2(n410), .B(n314), .ZN(n263) );
  OAI21D1BWP U519 ( .A1(n406), .A2(n408), .B(RX_Data[41]), .ZN(n314) );
  OAI21D1BWP U520 ( .A1(n307), .A2(n414), .B(n411), .ZN(n270) );
  OAI21D1BWP U521 ( .A1(n307), .A2(n412), .B(RX_Data[34]), .ZN(n411) );
  OAI21D1BWP U522 ( .A1(n307), .A2(n419), .B(n415), .ZN(n268) );
  OAI21D1BWP U523 ( .A1(n307), .A2(n417), .B(RX_Data[36]), .ZN(n415) );
  OAI21D1BWP U524 ( .A1(n307), .A2(n410), .B(n407), .ZN(n272) );
  OAI21D1BWP U525 ( .A1(n307), .A2(n408), .B(RX_Data[32]), .ZN(n407) );
  INVD1BWP U526 ( .I(n3), .ZN(n432) );
  INVD1BWP U527 ( .I(\rx_side/counter[2] ), .ZN(n315) );
  IND3D1BWP U528 ( .A1(\rx_side/state[2] ), .B1(n11), .B2(\rx_side/state[1] ), 
        .ZN(n421) );
  ND4D1BWP U529 ( .A1(n441), .A2(\rx_side/start_seq[0] ), .A3(
        \rx_side/start_seq[4] ), .A4(n309), .ZN(n422) );
  INVD1BWP U530 ( .I(\rx_side/counter[6] ), .ZN(n438) );
  INR4D0BWP U531 ( .A1(\rx_side/start_seq[1] ), .B1(n6), .B2(
        \rx_side/start_seq[5] ), .B3(n7), .ZN(n309) );
endmodule

