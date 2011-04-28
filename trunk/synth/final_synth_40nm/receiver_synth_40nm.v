
module receiver_synthed ( RX_Ready, Clk_S, Rst_n, S_Data, RX_Data_Valid, RX_Data );
  output [54:0] RX_Data;
  input RX_Ready, Clk_S, Rst_n, S_Data;
  output RX_Data_Valid;
  wire   \state[0] , \rx_side/N643 , \rx_side/N641 , \rx_side/N640 ,
         \rx_side/N639 , \rx_side/N638 , \rx_side/N637 , \rx_side/N636 ,
         \rx_side/N635 , \rx_side/N634 , \rx_side/N633 , \rx_side/N632 ,
         \rx_side/N631 , \rx_side/N630 , \rx_side/N629 , \rx_side/N628 ,
         \rx_side/N627 , \rx_side/N626 , \rx_side/N625 , \rx_side/N624 ,
         \rx_side/N623 , \rx_side/N622 , \rx_side/N621 , \rx_side/N620 ,
         \rx_side/N619 , \rx_side/N617 , \rx_side/N616 , \rx_side/N613 ,
         \rx_side/N610 , \rx_side/N609 , \rx_side/N607 , \rx_side/N606 ,
         \rx_side/N603 , \rx_side/N602 , \rx_side/N601 , \rx_side/N599 ,
         \rx_side/N598 , \rx_side/N596 , \rx_side/N595 , \rx_side/N594 ,
         \rx_side/N593 , \rx_side/N592 , \rx_side/N591 , \rx_side/N590 ,
         \rx_side/N479 , \rx_side/N477 , \rx_side/N474 , \rx_side/N473 ,
         \rx_side/N472 , \rx_side/N471 , \rx_side/N470 , \rx_side/N469 ,
         \rx_side/N467 , \rx_side/N466 , \rx_side/N465 , \rx_side/N464 ,
         \rx_side/N463 , \rx_side/N462 , \rx_side/N461 , \rx_side/N460 ,
         \rx_side/N459 , \rx_side/N458 , \rx_side/N457 , \rx_side/N454 ,
         \rx_side/N453 , \rx_side/N450 , \rx_side/N449 , \rx_side/N447 ,
         \rx_side/N446 , \rx_side/N445 , \rx_side/N442 , \rx_side/N441 ,
         \rx_side/N438 , \rx_side/N437 , \rx_side/N435 , \rx_side/N434 ,
         \rx_side/N433 , \rx_side/N430 , \rx_side/N426 , \rx_side/N425 ,
         \rx_side/N244 , \rx_side/N243 , \rx_side/N242 , \rx_side/N241 ,
         \rx_side/N239 , \rx_side/N238 , \rx_side/N237 , \rx_side/N236 ,
         \rx_side/N235 , \rx_side/N234 , \rx_side/N233 , \rx_side/N232 ,
         \rx_side/N231 , \rx_side/N230 , \rx_side/N229 , \rx_side/N228 ,
         \rx_side/N227 , \rx_side/N226 , \rx_side/N222 , \rx_side/N221 ,
         \rx_side/N220 , \rx_side/N218 , \rx_side/N217 , \rx_side/N216 ,
         \rx_side/N215 , \rx_side/N213 , \rx_side/N212 , \rx_side/N211 ,
         \rx_side/N209 , \rx_side/N207 , \rx_side/N206 , \rx_side/N205 ,
         \rx_side/N204 , \rx_side/N201 , \rx_side/N200 , \rx_side/N199 ,
         \rx_side/N198 , \rx_side/N197 , \rx_side/N194 , \rx_side/N193 ,
         \rx_side/N192 , \rx_side/N191 , \rx_side/N190 ,
         \rx_side/next_start_seq[5] , \rx_side/next_start_seq[4] ,
         \rx_side/next_start_seq[1] , \rx_side/next_start_seq[0] ,
         \rx_side/next_counter[6] , \rx_side/next_counter[5] ,
         \rx_side/next_counter[4] , \rx_side/next_counter[3] ,
         \rx_side/next_counter[1] , \rx_side/next_counter[0] ,
         \rx_side/next_state[1] , \rx_side/counter[0] , \rx_side/counter[1] ,
         \rx_side/counter[3] , \rx_side/counter[4] , \rx_side/counter[5] ,
         \rx_side/counter[6] , \rx_side/start_seq[0] , \rx_side/start_seq[1] ,
         \rx_side/start_seq[4] , \rx_side/start_seq[5] , \rx_side/state[1] ,
         \rx_side/state[2] , n1, n2, n3, n6, n7, n11, n250, n251, n252, n253,
         n254, n255, n256, n257, n258, n259, n260, n261, n262, n263, n264,
         n265, n266, n267, n268, n269, n270, n271, n272, n273, n274, n275,
         n276, n277, n278, n279, n280, n281, n282, n283, n284, n285, n286,
         n287, n288, n289, n290, n291, n292, n293, n294, n295, n296, n297,
         n298, n299, n300, n301, n302, n303, n304, n305, n306, n307, n308,
         n309, n310, n311, n312, n313, n314, n315, n316, n317, n318, n319,
         n320, n321, n322, n323, n324, n325, n326, n327, n328, n329, n330,
         n331, n332, n333, n334, n335, n336, n337, n338, n339, n340, n341,
         n342, n343, n344, n345, n346, n347, n348, n349, n350, n351, n352,
         n353, n354, n355, n356, n357, n358, n359, n360, n361, n362, n363,
         n364, n365, n366, n367, n368, n369, n370, n371, n372, n373, n374,
         n375, n376, n377, n378, n379, n380, n381, n382, n383, n384, n385,
         n386, n387, n388, n389, n390, n391, n392, n393, n394, n395, n396,
         n397, n398, n399, n400, n401, n402, n403, n404, n405, n406, n407,
         n408, n409, n410, n411, n412, n413, n414, n415, n416, n417, n418,
         n419, n420, n421, n422, n423, n424, n425, n426, n427, n428, n429,
         n430, n431, n432, n433, n434, n435, n436, n437, n438, n439, n440,
         n441, n442, n443, n444, n445, n446, n447, n448, n449, n450, n451,
         n452, n453, n454, n455, n456, n457, n458, n459, n460, n461, n462,
         n463, n464, n465, n466, n467, n468, n469, n470, n471, n472, n473,
         n474, n475, n476, n477, n478, n479, n480, n481, n482, n483, n484,
         n485, n486, n487, n488, n489, n490, n491, n492, n493, n494, n495,
         n496, n497, n498, n499, n500, n501, n502, n503, n504, n505, n506,
         n507, n508, n509, n510, n511, n512, n513, n514, n515, n516, n517,
         n518, n519, n520, n521, n522, n523, n524, n525, n526, n527, n528,
         n529, n530, n531, n532, n533, n534, n535, n536, n537, n538, n539,
         n540, n541, n542, n543, n544, n545, n546, n547, n548, n549, n550,
         n551, n552, n553, n554, n555, n556, n557, n558, n559, n560, n561,
         n562, n563, n564, n565, n566, n567, n568, n569, n570, n571, n572,
         n573, n574, n575, n576, n577, n578, n579, n580, n581, n582, n583,
         n584, n585, n586, n587, n588, n589, n590, n591, n592, n593, n594,
         n595, n596, n597, n598, n599, n600, n601, n602, n603, n604, n605,
         n606, n607, n608, n609, n610, n611, n612, n613, n614, n615, n616,
         n617, n618, n619, n620, n621, n622, n623, n624, n625, n626, n627,
         n628, n629, n630, n631, n632, n633, n634, n635, n636, n637, n638,
         n639, n640, n641, n642, n643, n644, n645, n646, n647, n648, n649,
         n650, n651, n652, n653, n654, n655, n656, n657, n658, n659, n660,
         n661, n662, n663, n664, n665, n666, n667, n668, n669, n670, n671,
         n672, n673, n674, n675, n676, n677, n678, n679, n680, n681, n682,
         n683, n684, n685, n686, n687, n688, n689, n690, n691, n692, n693,
         n694, n695, n696, n697, n698, n699, n700, n701, n702, n703, n704,
         n705, n706, n707, n708, n709, n710, n711, n712, n713, n714, n715,
         n716, n717, n718, n719, n720, n721, n722, n723, n724, n725, n726,
         n727, n728, n729, n730, n731, n732, n733, n734, n735, n736, n737,
         n738, n739, n740, n741, n742, n743, n744, n745, n746, n747, n748,
         n749, n750, n751, n752, n753, n754, n755, n756, n757, n758, n759,
         n760, n761, n762, n763, n764, n765, n766, n767, n768, n769, n770,
         n771, n772, n773, n774, n775, n776, n777, n778, n779, n780, n781,
         n782, n783, n784, n785, n786, n787, n788, n789, n790, n791, n792,
         n793, n794, n795, n796, n797, n798, n799, n800, n801, n802, n803,
         n804, n805, n806, n807, n808, n809, n810, n811, n812, n813;
  wire   [1:0] nextState;

  DFCNQD1BWP \rx_side/state_reg[1]  ( .D(\rx_side/next_state[1] ), .CP(Clk_S), 
        .CDN(Rst_n), .Q(\rx_side/state[1] ) );
  DFCNQD1BWP \state_reg[0]  ( .D(nextState[0]), .CP(Clk_S), .CDN(Rst_n), .Q(
        \state[0] ) );
  DFCNQD1BWP \rx_side/state_reg[0]  ( .D(n3), .CP(Clk_S), .CDN(Rst_n), .Q(n11)
         );
  DFCNQD1BWP \rx_side/state_reg[2]  ( .D(n807), .CP(Clk_S), .CDN(Rst_n), .Q(
        \rx_side/state[2] ) );
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
  DFCNQD4BWP \rx_side/counter_reg[2]  ( .D(n371), .CP(Clk_S), .CDN(Rst_n), .Q(
        n723) );
  DFCNQD4BWP \rx_side/counter_reg[3]  ( .D(\rx_side/next_counter[3] ), .CP(
        Clk_S), .CDN(Rst_n), .Q(\rx_side/counter[3] ) );
  DFSNQD2BWP \rx_side/counter_reg[1]  ( .D(\rx_side/next_counter[1] ), .CP(
        Clk_S), .SDN(Rst_n), .Q(\rx_side/counter[1] ) );
  NR2XD0BWP \decode_29_3/*cell*2619  ( .A1(n743), .A2(n762), .ZN(
        \rx_side/N457 ) );
  NR2XD0BWP \decode_29_3/*cell*2633  ( .A1(n741), .A2(n762), .ZN(
        \rx_side/N447 ) );
  NR2XD0BWP \decode_29_3/*cell*2613  ( .A1(n745), .A2(n762), .ZN(
        \rx_side/N461 ) );
  NR2XD0BWP \decode_29_3/*cell*2616  ( .A1(n744), .A2(n762), .ZN(
        \rx_side/N459 ) );
  NR2XD0BWP \decode_29_3/*cell*2610  ( .A1(n746), .A2(n762), .ZN(
        \rx_side/N463 ) );
  NR2XD0BWP \decode_29_3/*cell*2636  ( .A1(n740), .A2(n762), .ZN(
        \rx_side/N445 ) );
  NR2XD0BWP \decode_29_3/*cell*2664  ( .A1(n762), .A2(n750), .ZN(
        \rx_side/N425 ) );
  NR2XD0BWP \decode_29_3/*cell*2588  ( .A1(n749), .A2(n751), .ZN(
        \rx_side/N477 ) );
  INR2D1BWP \decode_29_3/*cell*2586  ( .A1(n761), .B1(n749), .ZN(
        \rx_side/N479 ) );
  NR2XD0BWP \decode_29_3/*cell*2644  ( .A1(n739), .A2(n762), .ZN(
        \rx_side/N441 ) );
  ND2D1BWP \decode_29_3/*cell*2611  ( .A1(n761), .A2(n742), .ZN(n746) );
  ND2D1BWP \decode_29_3/*cell*2620  ( .A1(n747), .A2(n742), .ZN(n743) );
  ND2D1BWP \decode_29_3/*cell*2595  ( .A1(\rx_side/counter[0] ), .A2(n759), 
        .ZN(n748) );
  ND2D1BWP \decode_29_3/*cell*2614  ( .A1(n732), .A2(n742), .ZN(n745) );
  ND2D1BWP \decode_29_3/*cell*2645  ( .A1(n747), .A2(n738), .ZN(n739) );
  ND2D1BWP \decode_29_3/*cell*2634  ( .A1(n761), .A2(n738), .ZN(n741) );
  ND2D1BWP \decode_29_3/*cell*2617  ( .A1(n760), .A2(n742), .ZN(n744) );
  ND2D1BWP \decode_29_3/*cell*2665  ( .A1(n747), .A2(n752), .ZN(n750) );
  NR2D1BWP \decode_29_3/*cell*2653  ( .A1(n733), .A2(n764), .ZN(\rx_side/N437 ) );
  NR2D1BWP \decode_29_3/*cell*2596  ( .A1(n749), .A2(n720), .ZN(\rx_side/N473 ) );
  NR2D1BWP \decode_29_3/*cell*2638  ( .A1(n734), .A2(n750), .ZN(\rx_side/N426 ) );
  NR2D1BWP \decode_29_3/*cell*2642  ( .A1(n734), .A2(n739), .ZN(\rx_side/N442 ) );
  NR2D1BWP \decode_29_3/*cell*2581  ( .A1(n736), .A2(n750), .ZN(\rx_side/N434 ) );
  NR2D1BWP \decode_29_3/*cell*2594  ( .A1(n748), .A2(n720), .ZN(\rx_side/N474 ) );
  NR2D1BWP \decode_29_3/*cell*2585  ( .A1(n734), .A2(n733), .ZN(\rx_side/N430 ) );
  NR2D1BWP \decode_29_3/*cell*2659  ( .A1(n755), .A2(n764), .ZN(\rx_side/N435 ) );
  NR2D1BWP \decode_29_3/*cell*2630  ( .A1(n739), .A2(n736), .ZN(\rx_side/N450 ) );
  NR2D1BWP \decode_29_3/*cell*2631  ( .A1(n739), .A2(n764), .ZN(\rx_side/N449 ) );
  NR2D1BWP \decode_29_3/*cell*2582  ( .A1(n764), .A2(n750), .ZN(\rx_side/N433 ) );
  NR2D1BWP \decode_29_3/*cell*2605  ( .A1(n744), .A2(n764), .ZN(\rx_side/N467 ) );
  NR2D1BWP \decode_29_3/*cell*2603  ( .A1(n745), .A2(n764), .ZN(\rx_side/N469 ) );
  NR2D1BWP \decode_29_3/*cell*2606  ( .A1(n743), .A2(n736), .ZN(\rx_side/N466 ) );
  NR2D1BWP \decode_29_3/*cell*2602  ( .A1(n745), .A2(n736), .ZN(\rx_side/N470 ) );
  NR2D1BWP \decode_29_3/*cell*2635  ( .A1(n740), .A2(n734), .ZN(\rx_side/N446 ) );
  NR2D1BWP \decode_29_3/*cell*2627  ( .A1(n740), .A2(n764), .ZN(\rx_side/N453 ) );
  NR2D1BWP \decode_29_3/*cell*2615  ( .A1(n744), .A2(n734), .ZN(\rx_side/N460 ) );
  NR2D1BWP \decode_29_3/*cell*2607  ( .A1(n743), .A2(n764), .ZN(\rx_side/N465 ) );
  NR2D1BWP \decode_29_3/*cell*2601  ( .A1(n746), .A2(n764), .ZN(\rx_side/N471 ) );
  NR2D1BWP \decode_29_3/*cell*2600  ( .A1(n746), .A2(n736), .ZN(\rx_side/N472 ) );
  NR2D1BWP \decode_29_3/*cell*2626  ( .A1(n740), .A2(n736), .ZN(\rx_side/N454 ) );
  NR2D1BWP \decode_29_3/*cell*2612  ( .A1(n745), .A2(n734), .ZN(\rx_side/N462 ) );
  NR2D1BWP \decode_29_3/*cell*2609  ( .A1(n746), .A2(n734), .ZN(\rx_side/N464 ) );
  NR2D1BWP \decode_29_3/*cell*2618  ( .A1(n743), .A2(n734), .ZN(\rx_side/N458 ) );
  DFCND1BWP \state_reg[1]  ( .D(nextState[1]), .CP(Clk_S), .CDN(Rst_n), .Q(
        RX_Data_Valid), .QN(n809) );
  DFCNQD4BWP \rx_side/counter_reg[0]  ( .D(\rx_side/next_counter[0] ), .CP(
        Clk_S), .CDN(Rst_n), .Q(\rx_side/counter[0] ) );
  DFSNQD1BWP \rx_side/counter_reg[4]  ( .D(\rx_side/next_counter[4] ), .CP(
        Clk_S), .SDN(Rst_n), .Q(\rx_side/counter[4] ) );
  DFSNQD1BWP \rx_side/counter_reg[5]  ( .D(\rx_side/next_counter[5] ), .CP(
        Clk_S), .SDN(Rst_n), .Q(\rx_side/counter[5] ) );
  DFCNQD1BWP \rx_side/counter_reg[6]  ( .D(\rx_side/next_counter[6] ), .CP(
        Clk_S), .CDN(Rst_n), .Q(\rx_side/counter[6] ) );
  IND2D1BWP U322 ( .A1(n769), .B1(RX_Data[45]), .ZN(n657) );
  CKND2BWP U323 ( .I(\rx_side/counter[0] ), .ZN(n768) );
  CKND2BWP U324 ( .I(n788), .ZN(n361) );
  ND2D3BWP U325 ( .A1(n799), .A2(n723), .ZN(n798) );
  IND2D1BWP U326 ( .A1(n769), .B1(RX_Data[6]), .ZN(n613) );
  INVD1BWP U327 ( .I(n771), .ZN(n364) );
  ND2D3BWP U328 ( .A1(\rx_side/counter[3] ), .A2(n768), .ZN(n764) );
  CKBD3BWP U329 ( .I(n789), .Z(n366) );
  AN2XD1BWP U330 ( .A1(n807), .A2(S_Data), .Z(n368) );
  MAOI22D0BWP U331 ( .A1(\rx_side/N594 ), .A2(n774), .B1(n713), .B2(
        \rx_side/N194 ), .ZN(n711) );
  INR2D0BWP U332 ( .A1(n796), .B1(n758), .ZN(n742) );
  CKND0BWP U333 ( .I(\rx_side/N430 ), .ZN(n305) );
  OAI32D0BWP U334 ( .A1(\rx_side/N430 ), .A2(n666), .A3(n813), .B1(n362), .B2(
        n305), .ZN(n670) );
  NR2D0BWP U335 ( .A1(\rx_side/N477 ), .A2(n769), .ZN(n306) );
  OAI21D0BWP U336 ( .A1(n306), .A2(n438), .B(RX_Data[52]), .ZN(n307) );
  CKND2D0BWP U337 ( .A1(n436), .A2(n307), .ZN(n252) );
  NR2XD0BWP U338 ( .A1(n726), .A2(n762), .ZN(n308) );
  CKND0BWP U339 ( .I(n362), .ZN(n309) );
  OAI31D0BWP U340 ( .A1(n366), .A2(n771), .A3(n309), .B(n308), .ZN(n310) );
  AOI32D0BWP U341 ( .A1(n775), .A2(n596), .A3(n769), .B1(n308), .B2(n596), 
        .ZN(n311) );
  CKND2D0BWP U342 ( .A1(RX_Data[18]), .A2(n311), .ZN(n312) );
  OAI211D0BWP U343 ( .A1(n552), .A2(n308), .B(n310), .C(n312), .ZN(n286) );
  AOI22D0BWP U344 ( .A1(n367), .A2(\rx_side/N200 ), .B1(n770), .B2(RX_Data[10]), .ZN(n508) );
  NR2D0BWP U345 ( .A1(n365), .A2(\rx_side/N437 ), .ZN(n313) );
  CKND2D0BWP U346 ( .A1(RX_Data[12]), .A2(n313), .ZN(n709) );
  NR2D0BWP U347 ( .A1(n736), .A2(n744), .ZN(n314) );
  MAOI22D0BWP U348 ( .A1(n772), .A2(n314), .B1(\rx_side/N633 ), .B2(n457), 
        .ZN(n315) );
  MAOI22D0BWP U349 ( .A1(\rx_side/N633 ), .A2(n773), .B1(n314), .B2(n458), 
        .ZN(n316) );
  AOI22D0BWP U350 ( .A1(\rx_side/N233 ), .A2(n474), .B1(RX_Data[43]), .B2(n456), .ZN(n317) );
  ND3D0BWP U351 ( .A1(n315), .A2(n316), .A3(n317), .ZN(n261) );
  NR2D0BWP U352 ( .A1(\rx_side/N479 ), .A2(n365), .ZN(n318) );
  OAI21D0BWP U353 ( .A1(n318), .A2(n448), .B(RX_Data[54]), .ZN(n319) );
  CKND2D0BWP U354 ( .A1(n446), .A2(n319), .ZN(n250) );
  NR2D0BWP U355 ( .A1(n764), .A2(n725), .ZN(n320) );
  NR2D0BWP U356 ( .A1(n764), .A2(n753), .ZN(n321) );
  AOI22D0BWP U357 ( .A1(n321), .A2(n366), .B1(n771), .B2(\rx_side/N449 ), .ZN(
        n322) );
  CKND0BWP U358 ( .I(n320), .ZN(n323) );
  OAI22D0BWP U359 ( .A1(n321), .A2(n775), .B1(n320), .B2(n813), .ZN(n324) );
  OAI21D0BWP U360 ( .A1(n581), .A2(n324), .B(RX_Data[24]), .ZN(n325) );
  OAI211D0BWP U361 ( .A1(n362), .A2(n323), .B(n322), .C(n325), .ZN(n280) );
  NR2D0BWP U362 ( .A1(n775), .A2(\rx_side/N602 ), .ZN(n326) );
  OA21D1BWP U363 ( .A1(n770), .A2(n326), .B(RX_Data[12]), .Z(n707) );
  CKND0BWP U364 ( .I(RX_Data[38]), .ZN(n327) );
  MUX2ND0BWP U365 ( .I0(n397), .I1(n474), .S(\rx_side/N228 ), .ZN(n328) );
  OAI211D0BWP U366 ( .A1(n398), .A2(n327), .B(n399), .C(n328), .ZN(n266) );
  CKND0BWP U367 ( .I(RX_Data[0]), .ZN(n329) );
  CKND0BWP U368 ( .I(\rx_side/N190 ), .ZN(n330) );
  OAI32D1BWP U369 ( .A1(\rx_side/N190 ), .A2(n813), .A3(n329), .B1(n362), .B2(
        n330), .ZN(n331) );
  NR2D0BWP U370 ( .A1(\rx_side/N590 ), .A2(n775), .ZN(n332) );
  OAI32D0BWP U371 ( .A1(n331), .A2(n332), .A3(n482), .B1(RX_Data[0]), .B2(n331), .ZN(n333) );
  AOI22D0BWP U372 ( .A1(\rx_side/N425 ), .A2(n771), .B1(\rx_side/N590 ), .B2(
        n774), .ZN(n334) );
  CKND2D0BWP U373 ( .A1(n333), .A2(n334), .ZN(n304) );
  CKND0BWP U374 ( .I(n362), .ZN(n335) );
  MUX2ND0BWP U375 ( .I0(n405), .I1(n335), .S(\rx_side/N229 ), .ZN(n336) );
  OAI211D0BWP U376 ( .A1(n406), .A2(n407), .B(n408), .C(n336), .ZN(n265) );
  CKND0BWP U377 ( .I(RX_Data[1]), .ZN(n337) );
  CKND0BWP U378 ( .I(\rx_side/N191 ), .ZN(n338) );
  OAI32D0BWP U379 ( .A1(\rx_side/N191 ), .A2(n813), .A3(n337), .B1(n790), .B2(
        n338), .ZN(n339) );
  NR2D0BWP U380 ( .A1(\rx_side/N591 ), .A2(n775), .ZN(n340) );
  OAI32D0BWP U381 ( .A1(n339), .A2(n340), .A3(n483), .B1(RX_Data[1]), .B2(n339), .ZN(n341) );
  AOI22D0BWP U382 ( .A1(\rx_side/N426 ), .A2(n771), .B1(\rx_side/N591 ), .B2(
        n774), .ZN(n342) );
  CKND2D0BWP U383 ( .A1(n341), .A2(n342), .ZN(n303) );
  CKND0BWP U384 ( .I(n466), .ZN(n343) );
  AOI32D0BWP U385 ( .A1(n365), .A2(n361), .A3(n343), .B1(\rx_side/N438 ), .B2(
        n361), .ZN(n676) );
  IND3D0BWP U386 ( .A1(n365), .B1(RX_Data[31]), .B2(n344), .ZN(n562) );
  CKND0BWP U387 ( .I(\rx_side/N621 ), .ZN(n344) );
  OA32D0BWP U388 ( .A1(n345), .A2(\rx_side/N236 ), .A3(n777), .B1(n346), .B2(
        n362), .Z(n347) );
  OAI211D0BWP U389 ( .A1(n401), .A2(n402), .B(n403), .C(n347), .ZN(n258) );
  CKND0BWP U390 ( .I(RX_Data[46]), .ZN(n345) );
  CKND0BWP U391 ( .I(\rx_side/N236 ), .ZN(n346) );
  CKND0BWP U392 ( .I(RX_Data[8]), .ZN(n348) );
  CKND0BWP U393 ( .I(\rx_side/N198 ), .ZN(n349) );
  OAI32D0BWP U394 ( .A1(\rx_side/N198 ), .A2(n813), .A3(n348), .B1(n790), .B2(
        n349), .ZN(n350) );
  NR2D0BWP U395 ( .A1(\rx_side/N598 ), .A2(n775), .ZN(n351) );
  OAI32D0BWP U396 ( .A1(n350), .A2(n351), .A3(n481), .B1(RX_Data[8]), .B2(n350), .ZN(n352) );
  AOI22D0BWP U397 ( .A1(\rx_side/N433 ), .A2(n771), .B1(\rx_side/N598 ), .B2(
        n774), .ZN(n353) );
  CKND2D0BWP U398 ( .A1(n352), .A2(n353), .ZN(n296) );
  NR2D0BWP U399 ( .A1(n736), .A2(n753), .ZN(n354) );
  AOI22D0BWP U400 ( .A1(n771), .A2(\rx_side/N450 ), .B1(n354), .B2(n366), .ZN(
        n355) );
  OAI211D0BWP U401 ( .A1(\rx_side/N215 ), .A2(n570), .B(n571), .C(n572), .ZN(
        n356) );
  IAO21D0BWP U402 ( .A1(n354), .A2(n568), .B(n356), .ZN(n357) );
  OAI211D0BWP U403 ( .A1(\rx_side/N450 ), .A2(n569), .B(n355), .C(n357), .ZN(
        n279) );
  CKND0BWP U404 ( .I(n382), .ZN(n358) );
  AOI211D0BWP U405 ( .A1(\rx_side/N623 ), .A2(n366), .B(n380), .C(n379), .ZN(
        n359) );
  OAI21D0BWP U406 ( .A1(n381), .A2(n358), .B(n359), .ZN(n271) );
  CKBD3BWP U407 ( .I(n788), .Z(n770) );
  NR2D4BWP U408 ( .A1(\rx_side/counter[0] ), .A2(\rx_side/counter[1] ), .ZN(
        n799) );
  NR2XD1BWP U409 ( .A1(n812), .A2(n793), .ZN(n789) );
  CKND12BWP U410 ( .I(n788), .ZN(n596) );
  NR3D4BWP U411 ( .A1(\rx_side/state[2] ), .A2(n11), .A3(\rx_side/state[1] ), 
        .ZN(n808) );
  CKND2BWP U412 ( .I(n788), .ZN(n468) );
  CKND2BWP U413 ( .I(n793), .ZN(n776) );
  CKND12BWP U414 ( .I(n776), .ZN(n775) );
  INVD1BWP U415 ( .I(n807), .ZN(n787) );
  CKBD4BWP U416 ( .I(n790), .Z(n362) );
  CKND6BWP U417 ( .I(n808), .ZN(n813) );
  CKBD1BWP U418 ( .I(n368), .Z(n772) );
  NR2XD0BWP U419 ( .A1(n767), .A2(n724), .ZN(n760) );
  MAOI22D0BWP U420 ( .A1(n773), .A2(\rx_side/N205 ), .B1(\rx_side/N205 ), .B2(
        n620), .ZN(n614) );
  MAOI22D0BWP U421 ( .A1(n774), .A2(\rx_side/N204 ), .B1(\rx_side/N204 ), .B2(
        n606), .ZN(n598) );
  MAOI22D0BWP U422 ( .A1(n366), .A2(\rx_side/N596 ), .B1(\rx_side/N596 ), .B2(
        n613), .ZN(n607) );
  MAOI22D0BWP U423 ( .A1(n774), .A2(\rx_side/N599 ), .B1(\rx_side/N434 ), .B2(
        n496), .ZN(n495) );
  ND2D4BWP U424 ( .A1(n768), .A2(n766), .ZN(n762) );
  OAI21D1BWP U425 ( .A1(\rx_side/N613 ), .A2(n775), .B(n595), .ZN(n592) );
  IND2D1BWP U426 ( .A1(n775), .B1(RX_Data[7]), .ZN(n628) );
  IND2D1BWP U427 ( .A1(n775), .B1(RX_Data[34]), .ZN(n467) );
  IND2D1BWP U428 ( .A1(n775), .B1(RX_Data[43]), .ZN(n457) );
  IND2D1BWP U429 ( .A1(n775), .B1(RX_Data[25]), .ZN(n568) );
  IND2D1BWP U430 ( .A1(n775), .B1(RX_Data[10]), .ZN(n506) );
  IND2D1BWP U431 ( .A1(n775), .B1(RX_Data[27]), .ZN(n576) );
  BUFFD2BWP U432 ( .I(n789), .Z(n773) );
  BUFFD8BWP U433 ( .I(n368), .Z(n771) );
  ND2D1BWP U434 ( .A1(n802), .A2(n378), .ZN(n793) );
  CKND2D0BWP U435 ( .A1(n788), .A2(RX_Data[35]), .ZN(n491) );
  INVD2BWP U436 ( .I(n770), .ZN(n360) );
  NR2D1BWP U437 ( .A1(n729), .A2(n736), .ZN(\rx_side/N635 ) );
  NR2D1BWP U438 ( .A1(n424), .A2(n425), .ZN(n375) );
  NR2D1BWP U439 ( .A1(n440), .A2(n441), .ZN(n377) );
  NR2D1BWP U440 ( .A1(n806), .A2(n805), .ZN(\rx_side/next_counter[6] ) );
  NR2D1BWP U441 ( .A1(\rx_side/counter[0] ), .A2(n806), .ZN(
        \rx_side/next_counter[0] ) );
  NR2D1BWP U442 ( .A1(n806), .A2(n792), .ZN(\rx_side/next_counter[3] ) );
  NR2D1BWP U443 ( .A1(n430), .A2(n431), .ZN(n376) );
  CKMUX2D1BWP U444 ( .I0(n492), .I1(n567), .S(\rx_side/N460 ), .Z(n484) );
  IND2D0BWP U445 ( .A1(n775), .B1(RX_Data[9]), .ZN(n497) );
  IND2D0BWP U446 ( .A1(n775), .B1(RX_Data[35]), .ZN(n487) );
  MAOI22D0BWP U447 ( .A1(\rx_side/N602 ), .A2(n774), .B1(n706), .B2(
        \rx_side/N437 ), .ZN(n704) );
  IND2D0BWP U448 ( .A1(n775), .B1(RX_Data[4]), .ZN(n715) );
  IND2D0BWP U449 ( .A1(n775), .B1(RX_Data[42]), .ZN(n478) );
  BUFFD2BWP U450 ( .I(n789), .Z(n774) );
  CKND1BWP U451 ( .I(n773), .ZN(n363) );
  BUFFD4BWP U452 ( .I(n787), .Z(n769) );
  BUFFD4BWP U453 ( .I(n787), .Z(n365) );
  INR2XD0BWP U454 ( .A1(n468), .B1(n369), .ZN(n464) );
  CKND2D1BWP U455 ( .A1(\rx_side/N232 ), .A2(n361), .ZN(n475) );
  OA21D0BWP U456 ( .A1(n804), .A2(n803), .B(n802), .Z(n805) );
  CKND2D1BWP U457 ( .A1(n474), .A2(\rx_side/N232 ), .ZN(n473) );
  ND2D2BWP U458 ( .A1(n804), .A2(n803), .ZN(n802) );
  CKND2D1BWP U459 ( .A1(n770), .A2(RX_Data[4]), .ZN(n716) );
  CKND2D1BWP U460 ( .A1(n770), .A2(RX_Data[25]), .ZN(n572) );
  CKND2D1BWP U461 ( .A1(n770), .A2(RX_Data[9]), .ZN(n500) );
  AOI21D0BWP U462 ( .A1(\rx_side/counter[5] ), .A2(n795), .B(n804), .ZN(n794)
         );
  CKND2D1BWP U463 ( .A1(n770), .A2(RX_Data[27]), .ZN(n580) );
  OAI211D0BWP U464 ( .A1(n797), .A2(n796), .B(n3), .C(n795), .ZN(
        \rx_side/next_counter[4] ) );
  NR2XD2BWP U465 ( .A1(n795), .A2(\rx_side/counter[5] ), .ZN(n804) );
  CKND2BWP U466 ( .I(n362), .ZN(n367) );
  CKMUX2D1BWP U467 ( .I0(n520), .I1(n790), .S(\rx_side/N193 ), .Z(n519) );
  ND2D2BWP U468 ( .A1(n797), .A2(n796), .ZN(n795) );
  NR2D1BWP U469 ( .A1(n764), .A2(n765), .ZN(\rx_side/N598 ) );
  NR2D1BWP U470 ( .A1(n734), .A2(n753), .ZN(\rx_side/N607 ) );
  NR2D1BWP U471 ( .A1(n756), .A2(n734), .ZN(\rx_side/N623 ) );
  NR2D1BWP U472 ( .A1(n756), .A2(n764), .ZN(\rx_side/N630 ) );
  INVD4BWP U473 ( .I(n3), .ZN(n788) );
  NR2D1BWP U474 ( .A1(n734), .A2(n765), .ZN(\rx_side/N591 ) );
  NR2D1BWP U475 ( .A1(n736), .A2(n765), .ZN(\rx_side/N599 ) );
  AOI21D0BWP U476 ( .A1(\rx_side/counter[3] ), .A2(n798), .B(n797), .ZN(n792)
         );
  NR2D1BWP U477 ( .A1(n756), .A2(n736), .ZN(\rx_side/N631 ) );
  CKND1BWP U478 ( .I(\rx_side/N237 ), .ZN(n786) );
  CKND0BWP U479 ( .I(n420), .ZN(n423) );
  NR2D1BWP U480 ( .A1(n726), .A2(n736), .ZN(\rx_side/N617 ) );
  IND2D0BWP U481 ( .A1(n813), .B1(RX_Data[21]), .ZN(n648) );
  NR2D1BWP U482 ( .A1(n730), .A2(n736), .ZN(\rx_side/N237 ) );
  NR2D1BWP U483 ( .A1(n748), .A2(n737), .ZN(\rx_side/N239 ) );
  NR2D1BWP U484 ( .A1(n754), .A2(n734), .ZN(\rx_side/N211 ) );
  IND2D0BWP U485 ( .A1(n813), .B1(RX_Data[36]), .ZN(n693) );
  NR2D1BWP U486 ( .A1(n726), .A2(n764), .ZN(\rx_side/N616 ) );
  NR2D1BWP U487 ( .A1(n730), .A2(n764), .ZN(\rx_side/N236 ) );
  NR2D1BWP U488 ( .A1(n729), .A2(n736), .ZN(\rx_side/N235 ) );
  NR2D1BWP U489 ( .A1(n730), .A2(n734), .ZN(\rx_side/N229 ) );
  IND2D0BWP U490 ( .A1(n777), .B1(RX_Data[26]), .ZN(n543) );
  NR2D1BWP U491 ( .A1(n764), .A2(n735), .ZN(\rx_side/N198 ) );
  IND2D0BWP U492 ( .A1(n813), .B1(RX_Data[28]), .ZN(n634) );
  IND2D0BWP U493 ( .A1(n813), .B1(RX_Data[9]), .ZN(n498) );
  NR2D1BWP U494 ( .A1(n728), .A2(n736), .ZN(\rx_side/N231 ) );
  IND2D0BWP U495 ( .A1(n813), .B1(RX_Data[29]), .ZN(n655) );
  NR2D1BWP U496 ( .A1(n757), .A2(n764), .ZN(\rx_side/N632 ) );
  NR2D1BWP U497 ( .A1(n734), .A2(n733), .ZN(\rx_side/N595 ) );
  NR2D1BWP U498 ( .A1(n726), .A2(n764), .ZN(\rx_side/N216 ) );
  NR2D1BWP U499 ( .A1(n755), .A2(n764), .ZN(\rx_side/N200 ) );
  NR2D1BWP U500 ( .A1(n729), .A2(n734), .ZN(\rx_side/N227 ) );
  NR2D1BWP U501 ( .A1(n736), .A2(n735), .ZN(\rx_side/N199 ) );
  NR2D1BWP U502 ( .A1(n728), .A2(n764), .ZN(\rx_side/N230 ) );
  NR2D1BWP U503 ( .A1(n748), .A2(n373), .ZN(\rx_side/N641 ) );
  NR2D1BWP U504 ( .A1(n730), .A2(n736), .ZN(\rx_side/N637 ) );
  NR2D1BWP U505 ( .A1(n749), .A2(n751), .ZN(\rx_side/N242 ) );
  NR2D1BWP U506 ( .A1(n741), .A2(n734), .ZN(\rx_side/N213 ) );
  IND2D0BWP U507 ( .A1(n813), .B1(RX_Data[27]), .ZN(n578) );
  NR2D1BWP U508 ( .A1(n725), .A2(n736), .ZN(\rx_side/N215 ) );
  NR2D1BWP U509 ( .A1(n748), .A2(n373), .ZN(\rx_side/N241 ) );
  NR2D1BWP U510 ( .A1(n730), .A2(n764), .ZN(\rx_side/N636 ) );
  NR2D1BWP U511 ( .A1(n754), .A2(n764), .ZN(\rx_side/N218 ) );
  NR2D1BWP U512 ( .A1(n729), .A2(n734), .ZN(\rx_side/N627 ) );
  IND2D0BWP U513 ( .A1(n813), .B1(RX_Data[4]), .ZN(n713) );
  IND2D0BWP U514 ( .A1(n813), .B1(RX_Data[25]), .ZN(n570) );
  IND2D0BWP U515 ( .A1(n813), .B1(RX_Data[17]), .ZN(n532) );
  NR2D1BWP U516 ( .A1(n733), .A2(n736), .ZN(\rx_side/N603 ) );
  NR2D1BWP U517 ( .A1(n734), .A2(n725), .ZN(\rx_side/N207 ) );
  NR2D1BWP U518 ( .A1(n734), .A2(n735), .ZN(\rx_side/N191 ) );
  NR2D1BWP U519 ( .A1(n757), .A2(n736), .ZN(\rx_side/N633 ) );
  NR2D1BWP U520 ( .A1(n729), .A2(n764), .ZN(\rx_side/N234 ) );
  NR2D1BWP U521 ( .A1(n729), .A2(n764), .ZN(\rx_side/N634 ) );
  IND2D0BWP U522 ( .A1(n777), .B1(RX_Data[18]), .ZN(n552) );
  IND2D0BWP U523 ( .A1(n813), .B1(RX_Data[16]), .ZN(n537) );
  NR2D1BWP U524 ( .A1(n748), .A2(n751), .ZN(\rx_side/N243 ) );
  NR2D1BWP U525 ( .A1(n741), .A2(n736), .ZN(\rx_side/N221 ) );
  NR2D1BWP U526 ( .A1(n733), .A2(n764), .ZN(\rx_side/N602 ) );
  NR2D1BWP U527 ( .A1(n749), .A2(n373), .ZN(\rx_side/N640 ) );
  NR2XD2BWP U528 ( .A1(n798), .A2(\rx_side/counter[3] ), .ZN(n797) );
  NR2D1BWP U529 ( .A1(n749), .A2(n737), .ZN(\rx_side/N238 ) );
  NR2D1BWP U530 ( .A1(n726), .A2(n734), .ZN(\rx_side/N609 ) );
  NR2D1BWP U531 ( .A1(n757), .A2(n736), .ZN(\rx_side/N233 ) );
  IND2D0BWP U532 ( .A1(n777), .B1(RX_Data[19]), .ZN(n549) );
  NR2D1BWP U533 ( .A1(n777), .A2(\rx_side/start_seq[1] ), .ZN(n2) );
  NR2D1BWP U534 ( .A1(n726), .A2(n734), .ZN(\rx_side/N209 ) );
  CKND1BWP U535 ( .I(n813), .ZN(n466) );
  IND2D0BWP U536 ( .A1(n777), .B1(RX_Data[44]), .ZN(n683) );
  NR2D1BWP U537 ( .A1(n757), .A2(n734), .ZN(\rx_side/N625 ) );
  NR2D1BWP U538 ( .A1(n757), .A2(n764), .ZN(\rx_side/N232 ) );
  NR2D1BWP U539 ( .A1(n736), .A2(n755), .ZN(\rx_side/N201 ) );
  IND2D0BWP U540 ( .A1(n813), .B1(RX_Data[11]), .ZN(n526) );
  NR2D1BWP U541 ( .A1(n734), .A2(n755), .ZN(\rx_side/N593 ) );
  NR2D1BWP U542 ( .A1(n741), .A2(n764), .ZN(\rx_side/N220 ) );
  NR2D1BWP U543 ( .A1(n736), .A2(n755), .ZN(\rx_side/N601 ) );
  IND2D0BWP U544 ( .A1(n813), .B1(RX_Data[20]), .ZN(n641) );
  NR2D1BWP U545 ( .A1(n730), .A2(n734), .ZN(\rx_side/N629 ) );
  NR2D1BWP U546 ( .A1(n734), .A2(n755), .ZN(\rx_side/N193 ) );
  OAI31D0BWP U547 ( .A1(\rx_side/state[1] ), .A2(\state[0] ), .A3(n811), .B(
        n810), .ZN(nextState[0]) );
  CKND1BWP U548 ( .I(n731), .ZN(n737) );
  BUFFD2BWP U549 ( .I(n813), .Z(n777) );
  IND2D0BWP U550 ( .A1(n813), .B1(RX_Data[12]), .ZN(n706) );
  CKND2D1BWP U551 ( .A1(n732), .A2(n727), .ZN(n729) );
  CKAN2D1BWP U552 ( .A1(n6), .A2(n808), .Z(n1) );
  NR2D2BWP U553 ( .A1(n502), .A2(\rx_side/counter[6] ), .ZN(n738) );
  NR2D1BWP U554 ( .A1(n724), .A2(\rx_side/counter[1] ), .ZN(n731) );
  CKND1BWP U555 ( .I(n781), .ZN(n378) );
  CKND2D0BWP U556 ( .A1(n808), .A2(n812), .ZN(\rx_side/next_start_seq[0] ) );
  IND2D0BWP U557 ( .A1(\rx_side/start_seq[0] ), .B1(n808), .ZN(
        \rx_side/next_start_seq[1] ) );
  CKND2D0BWP U558 ( .A1(n808), .A2(n7), .ZN(\rx_side/next_start_seq[4] ) );
  OR2D1BWP U559 ( .A1(n767), .A2(n724), .Z(n373) );
  NR2D1BWP U560 ( .A1(n758), .A2(\rx_side/counter[4] ), .ZN(n727) );
  IND2D0BWP U561 ( .A1(\rx_side/start_seq[4] ), .B1(n808), .ZN(
        \rx_side/next_start_seq[5] ) );
  CKND0BWP U562 ( .I(RX_Data[19]), .ZN(n546) );
  CKND0BWP U563 ( .I(RX_Data[28]), .ZN(n629) );
  CKND0BWP U564 ( .I(RX_Data[26]), .ZN(n540) );
  CKND1BWP U565 ( .I(RX_Data[5]), .ZN(n666) );
  CKND0BWP U566 ( .I(RX_Data[7]), .ZN(n626) );
  CKND0BWP U567 ( .I(RX_Data[40]), .ZN(n391) );
  CKND0BWP U568 ( .I(RX_Data[37]), .ZN(n700) );
  CKND1BWP U569 ( .I(RX_Data[41]), .ZN(n451) );
  IND4D2BWP U570 ( .A1(\rx_side/start_seq[5] ), .B1(\rx_side/start_seq[1] ), 
        .B2(\rx_side/start_seq[4] ), .B3(\rx_side/start_seq[0] ), .ZN(n778) );
  CKND0BWP U571 ( .I(RX_Data[46]), .ZN(n402) );
  CKND0BWP U572 ( .I(RX_Data[10]), .ZN(n507) );
  CKND0BWP U573 ( .I(RX_Data[16]), .ZN(n534) );
  CKND1BWP U574 ( .I(RX_Data[51]), .ZN(n425) );
  CKND0BWP U575 ( .I(RX_Data[11]), .ZN(n522) );
  CKND1BWP U576 ( .I(RX_Data[50]), .ZN(n417) );
  CKND0BWP U577 ( .I(RX_Data[44]), .ZN(n685) );
  CKND0BWP U578 ( .I(RX_Data[21]), .ZN(n643) );
  CKND0BWP U579 ( .I(RX_Data[14]), .ZN(n604) );
  CKND0BWP U580 ( .I(RX_Data[42]), .ZN(n477) );
  CKND0BWP U581 ( .I(RX_Data[45]), .ZN(n660) );
  CKND2D0BWP U582 ( .A1(\rx_side/state[2] ), .A2(n11), .ZN(n811) );
  CKND0BWP U583 ( .I(RX_Data[20]), .ZN(n636) );
  CKND1BWP U584 ( .I(RX_Data[13]), .ZN(n673) );
  CKND0BWP U585 ( .I(RX_Data[17]), .ZN(n528) );
  CKND0BWP U586 ( .I(RX_Data[32]), .ZN(n385) );
  CKND0BWP U587 ( .I(RX_Data[29]), .ZN(n650) );
  CKND0BWP U588 ( .I(RX_Data[39]), .ZN(n407) );
  CKND0BWP U589 ( .I(RX_Data[36]), .ZN(n695) );
  CKND0BWP U590 ( .I(RX_Data[3]), .ZN(n516) );
  CKND1BWP U591 ( .I(RX_Data[53]), .ZN(n441) );
  CKND1BWP U592 ( .I(RX_Data[49]), .ZN(n431) );
  CKND0BWP U593 ( .I(RX_Data[4]), .ZN(n719) );
  CKND0BWP U594 ( .I(RX_Data[2]), .ZN(n510) );
  CKND1BWP U595 ( .I(RX_Data[48]), .ZN(n411) );
  CKND1BWP U596 ( .I(RX_Data[33]), .ZN(n381) );
  ND2D4BWP U597 ( .A1(\rx_side/counter[0] ), .A2(n766), .ZN(n734) );
  ND2D4BWP U598 ( .A1(\rx_side/counter[0] ), .A2(\rx_side/counter[3] ), .ZN(
        n736) );
  IND2D2BWP U599 ( .A1(\rx_side/counter[6] ), .B1(\rx_side/counter[5] ), .ZN(
        n758) );
  ND2D2BWP U600 ( .A1(n791), .A2(n781), .ZN(n3) );
  ND2D2BWP U601 ( .A1(n808), .A2(n779), .ZN(n791) );
  NR3D1BWP U602 ( .A1(\rx_side/counter[6] ), .A2(\rx_side/counter[4] ), .A3(
        \rx_side/counter[5] ), .ZN(n752) );
  IND3D1BWP U603 ( .A1(\rx_side/state[2] ), .B1(n11), .B2(\rx_side/state[1] ), 
        .ZN(n781) );
  ND2D1BWP U604 ( .A1(n780), .A2(S_Data), .ZN(n790) );
  INVD1BWP U605 ( .I(n723), .ZN(n724) );
  INVD1BWP U606 ( .I(\rx_side/counter[4] ), .ZN(n796) );
  INVD1BWP U607 ( .I(\rx_side/next_state[1] ), .ZN(n806) );
  ND2D1BWP U608 ( .A1(n775), .A2(n791), .ZN(\rx_side/next_state[1] ) );
  ND2D1BWP U609 ( .A1(\rx_side/N434 ), .A2(n771), .ZN(n501) );
  ND2D1BWP U610 ( .A1(n705), .A2(n709), .ZN(n708) );
  ND2D1BWP U611 ( .A1(n731), .A2(n752), .ZN(n735) );
  ND2D1BWP U612 ( .A1(n747), .A2(n752), .ZN(n765) );
  ND2D1BWP U613 ( .A1(n752), .A2(n760), .ZN(n755) );
  ND2D1BWP U614 ( .A1(n732), .A2(n738), .ZN(n754) );
  ND2D1BWP U615 ( .A1(n561), .A2(n562), .ZN(n374) );
  AN2XD1BWP U616 ( .A1(n472), .A2(n473), .Z(n480) );
  ND2D1BWP U617 ( .A1(n475), .A2(n476), .ZN(n472) );
  ND2D1BWP U618 ( .A1(n760), .A2(n727), .ZN(n757) );
  AN2XD1BWP U619 ( .A1(\rx_side/N467 ), .A2(n771), .Z(n479) );
  ND2D1BWP U620 ( .A1(n759), .A2(n768), .ZN(n749) );
  INVD1BWP U621 ( .I(n366), .ZN(n691) );
  INVD1BWP U622 ( .I(n368), .ZN(n567) );
  ND2D1BWP U623 ( .A1(\rx_side/N630 ), .A2(n773), .ZN(n393) );
  AN2XD1BWP U624 ( .A1(n771), .A2(\rx_side/N458 ), .Z(n379) );
  INVD1BWP U625 ( .I(n362), .ZN(n558) );
  ND2D1BWP U626 ( .A1(n760), .A2(n738), .ZN(n726) );
  ND2D1BWP U627 ( .A1(n747), .A2(n738), .ZN(n753) );
  ND2D1BWP U628 ( .A1(n731), .A2(n738), .ZN(n725) );
  INVD1BWP U629 ( .I(n362), .ZN(n474) );
  ND2D1BWP U630 ( .A1(n752), .A2(n761), .ZN(n763) );
  ND2D1BWP U631 ( .A1(n712), .A2(n718), .ZN(n717) );
  ND2D1BWP U632 ( .A1(n752), .A2(n732), .ZN(n733) );
  INVD1BWP U633 ( .I(n732), .ZN(n751) );
  INR2D2BWP U634 ( .A1(n724), .B1(\rx_side/counter[1] ), .ZN(n732) );
  INVD1BWP U635 ( .I(n362), .ZN(n594) );
  ND2D1BWP U636 ( .A1(\rx_side/N622 ), .A2(n366), .ZN(n387) );
  AN2XD1BWP U637 ( .A1(n723), .A2(n767), .Z(n747) );
  ND2D1BWP U638 ( .A1(n747), .A2(n727), .ZN(n756) );
  ND2D1BWP U639 ( .A1(n723), .A2(n767), .ZN(n720) );
  INVD1BWP U640 ( .I(\rx_side/counter[3] ), .ZN(n766) );
  ND2D1BWP U641 ( .A1(n731), .A2(n727), .ZN(n728) );
  NR2XD1BWP U642 ( .A1(n802), .A2(n781), .ZN(n807) );
  INVD1BWP U643 ( .I(\rx_side/counter[6] ), .ZN(n803) );
  INVD1BWP U644 ( .I(n791), .ZN(n780) );
  ND2D1BWP U645 ( .A1(n761), .A2(n727), .ZN(n730) );
  INR2D2BWP U646 ( .A1(n724), .B1(n767), .ZN(n761) );
  INVD1BWP U647 ( .I(\rx_side/counter[1] ), .ZN(n767) );
  INVD1BWP U648 ( .I(S_Data), .ZN(n812) );
  NR3D0BWP U649 ( .A1(n778), .A2(n6), .A3(n7), .ZN(n779) );
  OA21D1BWP U650 ( .A1(\state[0] ), .A2(RX_Data_Valid), .B(RX_Ready), .Z(
        nextState[1]) );
  AOI22D1BWP U651 ( .A1(RX_Data_Valid), .A2(RX_Ready), .B1(\state[0] ), .B2(
        n809), .ZN(n810) );
  OAI21D1BWP U652 ( .A1(n801), .A2(n794), .B(n3), .ZN(
        \rx_side/next_counter[5] ) );
  OAI21D1BWP U653 ( .A1(n801), .A2(n800), .B(n3), .ZN(
        \rx_side/next_counter[1] ) );
  NR2XD0BWP U654 ( .A1(n808), .A2(n776), .ZN(n801) );
  OAI211D1BWP U655 ( .A1(n516), .A2(n517), .B(n518), .C(n519), .ZN(n301) );
  IND2D1BWP U656 ( .A1(n813), .B1(RX_Data[3]), .ZN(n520) );
  AOI22D1BWP U657 ( .A1(n771), .A2(\rx_side/N593 ), .B1(n774), .B2(
        \rx_side/N593 ), .ZN(n518) );
  IAO21D1BWP U658 ( .A1(\rx_side/N593 ), .A2(n775), .B(n521), .ZN(n517) );
  IND3D1BWP U659 ( .A1(n493), .B1(n495), .B2(n494), .ZN(n295) );
  IND2D1BWP U660 ( .A1(n365), .B1(RX_Data[9]), .ZN(n496) );
  IND2D1BWP U661 ( .A1(n362), .B1(\rx_side/N199 ), .ZN(n499) );
  ND3D1BWP U662 ( .A1(n509), .A2(n503), .A3(n504), .ZN(n294) );
  IND2D1BWP U663 ( .A1(n365), .B1(RX_Data[10]), .ZN(n505) );
  OA31D1BWP U664 ( .A1(n507), .A2(\rx_side/N200 ), .A3(n813), .B(n508), .Z(
        n509) );
  IND3D1BWP U665 ( .A1(n708), .B1(n703), .B2(n704), .ZN(n292) );
  ND3D1BWP U666 ( .A1(n370), .A2(n696), .A3(n697), .ZN(n267) );
  IND2D1BWP U667 ( .A1(n567), .B1(\rx_side/N462 ), .ZN(n697) );
  IND2D1BWP U668 ( .A1(\rx_side/N462 ), .B1(n698), .ZN(n696) );
  INR2D1BWP U669 ( .A1(RX_Data[37]), .B1(n365), .ZN(n698) );
  AOI22D1BWP U670 ( .A1(\rx_side/N627 ), .A2(n366), .B1(\rx_side/N227 ), .B2(
        n367), .ZN(n701) );
  IAO21D1BWP U671 ( .A1(\rx_side/N627 ), .A2(n775), .B(n702), .ZN(n699) );
  OAI21D1BWP U672 ( .A1(\rx_side/N227 ), .A2(n813), .B(n361), .ZN(n702) );
  OAI211D1BWP U673 ( .A1(n534), .A2(n539), .B(n535), .C(n536), .ZN(n288) );
  MUX2D1BWP U674 ( .I0(n537), .I1(n362), .S(\rx_side/N206 ), .Z(n536) );
  NR2XD0BWP U675 ( .A1(n725), .A2(n762), .ZN(\rx_side/N206 ) );
  AOI22D1BWP U676 ( .A1(n771), .A2(\rx_side/N441 ), .B1(n366), .B2(
        \rx_side/N606 ), .ZN(n535) );
  IAO21D1BWP U677 ( .A1(\rx_side/N606 ), .A2(n775), .B(n538), .ZN(n539) );
  NR2XD0BWP U678 ( .A1(n753), .A2(n762), .ZN(\rx_side/N606 ) );
  OAI211D1BWP U679 ( .A1(n528), .A2(n529), .B(n530), .C(n531), .ZN(n287) );
  MUX2D1BWP U680 ( .I0(n532), .I1(n362), .S(\rx_side/N207 ), .Z(n531) );
  AOI22D1BWP U681 ( .A1(n771), .A2(\rx_side/N442 ), .B1(n366), .B2(
        \rx_side/N607 ), .ZN(n530) );
  IAO21D1BWP U682 ( .A1(\rx_side/N607 ), .A2(n775), .B(n533), .ZN(n529) );
  OAI211D1BWP U683 ( .A1(n522), .A2(n523), .B(n524), .C(n525), .ZN(n293) );
  MUX2D1BWP U684 ( .I0(n526), .I1(n362), .S(\rx_side/N201 ), .Z(n525) );
  AOI22D1BWP U685 ( .A1(n771), .A2(\rx_side/N601 ), .B1(n774), .B2(
        \rx_side/N601 ), .ZN(n524) );
  IAO21D1BWP U686 ( .A1(\rx_side/N601 ), .A2(n775), .B(n527), .ZN(n523) );
  AOI21D1BWP U687 ( .A1(\rx_side/N479 ), .A2(n774), .B(n447), .ZN(n446) );
  AO22D1BWP U688 ( .A1(\rx_side/N479 ), .A2(n771), .B1(\rx_side/N244 ), .B2(
        n367), .Z(n447) );
  OA21D1BWP U689 ( .A1(\rx_side/N244 ), .A2(n813), .B(n360), .Z(n449) );
  INR2D1BWP U690 ( .A1(n761), .B1(n749), .ZN(\rx_side/N244 ) );
  OAI21D1BWP U691 ( .A1(n416), .A2(n417), .B(n418), .ZN(n254) );
  AOI21D1BWP U692 ( .A1(\rx_side/N640 ), .A2(n774), .B(n419), .ZN(n418) );
  AO22D1BWP U693 ( .A1(\rx_side/N640 ), .A2(n772), .B1(n420), .B2(n558), .Z(
        n419) );
  IAO21D1BWP U694 ( .A1(\rx_side/N640 ), .A2(n769), .B(n421), .ZN(n416) );
  AOI21D1BWP U695 ( .A1(n423), .A2(n466), .B(n770), .ZN(n422) );
  INR2D1BWP U696 ( .A1(n760), .B1(n749), .ZN(n420) );
  AOI21D1BWP U697 ( .A1(\rx_side/N477 ), .A2(n774), .B(n437), .ZN(n436) );
  AO22D1BWP U698 ( .A1(\rx_side/N477 ), .A2(n772), .B1(\rx_side/N242 ), .B2(
        n367), .Z(n437) );
  OA21D1BWP U699 ( .A1(\rx_side/N242 ), .A2(n813), .B(n360), .Z(n439) );
  NR2XD0BWP U700 ( .A1(n762), .A2(n735), .ZN(\rx_side/N190 ) );
  NR2XD0BWP U701 ( .A1(n762), .A2(n765), .ZN(\rx_side/N590 ) );
  OAI211D1BWP U702 ( .A1(n540), .A2(n545), .B(n541), .C(n542), .ZN(n278) );
  MUX2D1BWP U703 ( .I0(n543), .I1(n362), .S(\rx_side/N216 ), .Z(n542) );
  AOI22D1BWP U704 ( .A1(n771), .A2(\rx_side/N216 ), .B1(n366), .B2(
        \rx_side/N616 ), .ZN(n541) );
  IAO21D1BWP U705 ( .A1(\rx_side/N616 ), .A2(n775), .B(n544), .ZN(n545) );
  OAI211D1BWP U706 ( .A1(n510), .A2(n511), .B(n512), .C(n513), .ZN(n302) );
  MUX2D1BWP U707 ( .I0(n514), .I1(n362), .S(\rx_side/N192 ), .Z(n513) );
  NR2XD0BWP U708 ( .A1(n755), .A2(n762), .ZN(\rx_side/N192 ) );
  IND2D1BWP U709 ( .A1(n813), .B1(RX_Data[2]), .ZN(n514) );
  AOI22D1BWP U710 ( .A1(n771), .A2(\rx_side/N592 ), .B1(n774), .B2(
        \rx_side/N592 ), .ZN(n512) );
  IAO21D1BWP U711 ( .A1(\rx_side/N592 ), .A2(n775), .B(n515), .ZN(n511) );
  NR2XD0BWP U712 ( .A1(n755), .A2(n762), .ZN(\rx_side/N592 ) );
  OAI211D1BWP U713 ( .A1(n546), .A2(n551), .B(n547), .C(n548), .ZN(n285) );
  MUX2D1BWP U714 ( .I0(n549), .I1(n362), .S(\rx_side/N209 ), .Z(n548) );
  AOI22D1BWP U715 ( .A1(n771), .A2(\rx_side/N209 ), .B1(n366), .B2(
        \rx_side/N609 ), .ZN(n547) );
  IAO21D1BWP U716 ( .A1(\rx_side/N609 ), .A2(n775), .B(n550), .ZN(n551) );
  OAI211D1BWP U717 ( .A1(n666), .A2(n667), .B(n668), .C(n669), .ZN(n299) );
  IND2D1BWP U718 ( .A1(n364), .B1(\rx_side/N430 ), .ZN(n669) );
  AOI21D1BWP U719 ( .A1(\rx_side/N595 ), .A2(n774), .B(n670), .ZN(n668) );
  IAO21D1BWP U720 ( .A1(\rx_side/N430 ), .A2(n769), .B(n671), .ZN(n667) );
  AOI21D1BWP U721 ( .A1(\rx_side/N231 ), .A2(n474), .B(n453), .ZN(n452) );
  AO22D1BWP U722 ( .A1(\rx_side/N466 ), .A2(n771), .B1(\rx_side/N631 ), .B2(
        n773), .Z(n453) );
  OAI21D1BWP U723 ( .A1(n672), .A2(n673), .B(n674), .ZN(n291) );
  AOI21D1BWP U724 ( .A1(\rx_side/N603 ), .A2(n366), .B(n675), .ZN(n674) );
  AO22D1BWP U725 ( .A1(\rx_side/N438 ), .A2(n771), .B1(\rx_side/N438 ), .B2(
        n558), .Z(n675) );
  IAO21D1BWP U726 ( .A1(\rx_side/N603 ), .A2(n775), .B(n676), .ZN(n672) );
  OAI211D1BWP U727 ( .A1(n629), .A2(n630), .B(n631), .C(n632), .ZN(n276) );
  AOI21D1BWP U728 ( .A1(\rx_side/N218 ), .A2(n366), .B(n633), .ZN(n632) );
  INR2D1BWP U729 ( .A1(\rx_side/N453 ), .B1(n567), .ZN(n633) );
  MUX2D1BWP U730 ( .I0(n634), .I1(n362), .S(\rx_side/N218 ), .Z(n631) );
  IAO21D1BWP U731 ( .A1(\rx_side/N218 ), .A2(n775), .B(n635), .ZN(n630) );
  OAI21D1BWP U732 ( .A1(\rx_side/N453 ), .A2(n365), .B(n468), .ZN(n635) );
  OAI211D1BWP U733 ( .A1(n650), .A2(n651), .B(n652), .C(n653), .ZN(n275) );
  AOI21D1BWP U734 ( .A1(\rx_side/N619 ), .A2(n366), .B(n654), .ZN(n653) );
  INR2D1BWP U735 ( .A1(\rx_side/N454 ), .B1(n567), .ZN(n654) );
  MUX2D1BWP U736 ( .I0(n655), .I1(n362), .S(\rx_side/N619 ), .Z(n652) );
  IAO21D1BWP U737 ( .A1(\rx_side/N619 ), .A2(n775), .B(n656), .ZN(n651) );
  OAI21D1BWP U738 ( .A1(\rx_side/N454 ), .A2(n365), .B(n361), .ZN(n656) );
  NR2XD0BWP U739 ( .A1(n754), .A2(n736), .ZN(\rx_side/N619 ) );
  OAI211D1BWP U740 ( .A1(n636), .A2(n637), .B(n638), .C(n639), .ZN(n284) );
  AOI21D1BWP U741 ( .A1(\rx_side/N610 ), .A2(n366), .B(n640), .ZN(n639) );
  INR2D1BWP U742 ( .A1(\rx_side/N445 ), .B1(n567), .ZN(n640) );
  MUX2D1BWP U743 ( .I0(n641), .I1(n362), .S(\rx_side/N610 ), .Z(n638) );
  IAO21D1BWP U744 ( .A1(\rx_side/N610 ), .A2(n775), .B(n642), .ZN(n637) );
  OAI21D1BWP U745 ( .A1(\rx_side/N445 ), .A2(n769), .B(n596), .ZN(n642) );
  NR2XD0BWP U746 ( .A1(n754), .A2(n762), .ZN(\rx_side/N610 ) );
  OAI211D1BWP U747 ( .A1(n643), .A2(n644), .B(n645), .C(n646), .ZN(n283) );
  AOI21D1BWP U748 ( .A1(\rx_side/N211 ), .A2(n366), .B(n647), .ZN(n646) );
  INR2D1BWP U749 ( .A1(\rx_side/N446 ), .B1(n567), .ZN(n647) );
  MUX2D1BWP U750 ( .I0(n648), .I1(n362), .S(\rx_side/N211 ), .Z(n645) );
  IAO21D1BWP U751 ( .A1(\rx_side/N211 ), .A2(n775), .B(n649), .ZN(n644) );
  OAI21D1BWP U752 ( .A1(\rx_side/N446 ), .A2(n769), .B(n596), .ZN(n649) );
  INR2D1BWP U753 ( .A1(RX_Data[38]), .B1(n777), .ZN(n397) );
  NR2XD0BWP U754 ( .A1(n730), .A2(n762), .ZN(\rx_side/N228 ) );
  AOI22D1BWP U755 ( .A1(n773), .A2(\rx_side/N628 ), .B1(n771), .B2(
        \rx_side/N463 ), .ZN(n399) );
  IAO21D1BWP U756 ( .A1(\rx_side/N463 ), .A2(n365), .B(n400), .ZN(n398) );
  OAI21D1BWP U757 ( .A1(\rx_side/N628 ), .A2(n775), .B(n361), .ZN(n400) );
  NR2XD0BWP U758 ( .A1(n730), .A2(n762), .ZN(\rx_side/N628 ) );
  IND2D1BWP U759 ( .A1(n374), .B1(n563), .ZN(n273) );
  AOI21D1BWP U760 ( .A1(n564), .A2(RX_Data[31]), .B(n565), .ZN(n563) );
  AO22D1BWP U761 ( .A1(\rx_side/N621 ), .A2(n366), .B1(\rx_side/N221 ), .B2(
        n594), .Z(n565) );
  OAI21D1BWP U762 ( .A1(\rx_side/N621 ), .A2(n775), .B(n566), .ZN(n564) );
  OA21D1BWP U763 ( .A1(\rx_side/N221 ), .A2(n813), .B(n468), .Z(n566) );
  NR2XD0BWP U764 ( .A1(n741), .A2(n736), .ZN(\rx_side/N621 ) );
  IND2D1BWP U765 ( .A1(n567), .B1(\rx_side/N621 ), .ZN(n561) );
  ND3D1BWP U766 ( .A1(n485), .A2(n484), .A3(n486), .ZN(n269) );
  IND2D1BWP U767 ( .A1(n691), .B1(\rx_side/N625 ), .ZN(n486) );
  IND2D1BWP U768 ( .A1(n365), .B1(RX_Data[35]), .ZN(n492) );
  AOI21D1BWP U769 ( .A1(n722), .A2(n489), .B(n490), .ZN(n488) );
  OAI21D1BWP U770 ( .A1(n722), .A2(n362), .B(n491), .ZN(n490) );
  INR2D1BWP U771 ( .A1(RX_Data[35]), .B1(n813), .ZN(n489) );
  OR2XD1BWP U772 ( .A1(n757), .A2(n734), .Z(n722) );
  IND2D1BWP U773 ( .A1(\rx_side/N459 ), .B1(n462), .ZN(n461) );
  INR2D1BWP U774 ( .A1(RX_Data[34]), .B1(n365), .ZN(n462) );
  OAI22D1BWP U775 ( .A1(n464), .A2(n465), .B1(n362), .B2(n369), .ZN(n463) );
  OAI21D1BWP U776 ( .A1(n788), .A2(n466), .B(RX_Data[34]), .ZN(n465) );
  NR2XD0BWP U777 ( .A1(n757), .A2(n762), .ZN(\rx_side/N624 ) );
  IND2D1BWP U778 ( .A1(n769), .B1(RX_Data[43]), .ZN(n458) );
  IND4D1BWP U779 ( .A1(n479), .B1(n469), .B2(n470), .B3(n480), .ZN(n262) );
  AOI21D1BWP U780 ( .A1(n361), .A2(n777), .B(n477), .ZN(n476) );
  IND2D1BWP U781 ( .A1(\rx_side/N467 ), .B1(n471), .ZN(n470) );
  INR2D1BWP U782 ( .A1(RX_Data[42]), .B1(n365), .ZN(n471) );
  MUX2D1BWP U783 ( .I0(n478), .I1(n363), .S(\rx_side/N632 ), .Z(n469) );
  INR2D1BWP U784 ( .A1(RX_Data[39]), .B1(n777), .ZN(n405) );
  AOI22D1BWP U785 ( .A1(\rx_side/N464 ), .A2(n771), .B1(\rx_side/N629 ), .B2(
        n773), .ZN(n408) );
  IAO21D1BWP U786 ( .A1(\rx_side/N464 ), .A2(n365), .B(n409), .ZN(n406) );
  ND3D1BWP U787 ( .A1(n583), .A2(n582), .A3(n584), .ZN(n274) );
  AOI21D1BWP U788 ( .A1(n585), .A2(RX_Data[30]), .B(n586), .ZN(n584) );
  AO22D1BWP U789 ( .A1(\rx_side/N620 ), .A2(n366), .B1(\rx_side/N220 ), .B2(
        n594), .Z(n586) );
  OAI21D1BWP U790 ( .A1(\rx_side/N620 ), .A2(n775), .B(n587), .ZN(n585) );
  OA21D1BWP U791 ( .A1(\rx_side/N220 ), .A2(n813), .B(n361), .Z(n587) );
  NR2XD0BWP U792 ( .A1(n741), .A2(n764), .ZN(\rx_side/N620 ) );
  IND2D1BWP U793 ( .A1(n567), .B1(\rx_side/N620 ), .ZN(n582) );
  IND2D1BWP U794 ( .A1(\rx_side/N620 ), .B1(n588), .ZN(n583) );
  INR2D1BWP U795 ( .A1(RX_Data[30]), .B1(n769), .ZN(n588) );
  ND3D1BWP U796 ( .A1(n590), .A2(n589), .A3(n591), .ZN(n281) );
  AOI21D1BWP U797 ( .A1(n592), .A2(RX_Data[23]), .B(n593), .ZN(n591) );
  AO22D1BWP U798 ( .A1(\rx_side/N613 ), .A2(n366), .B1(\rx_side/N213 ), .B2(
        n594), .Z(n593) );
  OA21D1BWP U799 ( .A1(\rx_side/N213 ), .A2(n813), .B(n596), .Z(n595) );
  NR2XD0BWP U800 ( .A1(n741), .A2(n734), .ZN(\rx_side/N613 ) );
  IND2D1BWP U801 ( .A1(n567), .B1(\rx_side/N613 ), .ZN(n589) );
  IND2D1BWP U802 ( .A1(\rx_side/N613 ), .B1(n597), .ZN(n590) );
  INR2D1BWP U803 ( .A1(RX_Data[23]), .B1(n365), .ZN(n597) );
  OAI21D1BWP U804 ( .A1(n410), .A2(n411), .B(n412), .ZN(n256) );
  AOI21D1BWP U805 ( .A1(\rx_side/N638 ), .A2(n773), .B(n413), .ZN(n412) );
  AO22D1BWP U806 ( .A1(\rx_side/N473 ), .A2(n772), .B1(\rx_side/N238 ), .B2(
        n367), .Z(n413) );
  IAO21D1BWP U807 ( .A1(\rx_side/N473 ), .A2(n769), .B(n414), .ZN(n410) );
  OA21D1BWP U808 ( .A1(\rx_side/N238 ), .A2(n777), .B(n360), .Z(n415) );
  NR2XD0BWP U809 ( .A1(n749), .A2(n720), .ZN(\rx_side/N638 ) );
  IND4D1BWP U810 ( .A1(n686), .B1(n688), .B2(n687), .B3(n689), .ZN(n268) );
  AOI21D1BWP U811 ( .A1(\rx_side/N226 ), .A2(n367), .B(n690), .ZN(n689) );
  INR2D1BWP U812 ( .A1(\rx_side/N626 ), .B1(n691), .ZN(n690) );
  IND2D1BWP U813 ( .A1(n567), .B1(\rx_side/N461 ), .ZN(n687) );
  IND2D1BWP U814 ( .A1(\rx_side/N461 ), .B1(n692), .ZN(n688) );
  INR2D1BWP U815 ( .A1(RX_Data[36]), .B1(n365), .ZN(n692) );
  OA21D1BWP U816 ( .A1(\rx_side/N626 ), .A2(n775), .B(n468), .Z(n694) );
  NR2XD0BWP U817 ( .A1(n729), .A2(n762), .ZN(\rx_side/N626 ) );
  NR2XD0BWP U818 ( .A1(n729), .A2(n762), .ZN(\rx_side/N226 ) );
  IND4D1BWP U819 ( .A1(n677), .B1(n679), .B2(n678), .B3(n680), .ZN(n260) );
  AOI21D1BWP U820 ( .A1(\rx_side/N234 ), .A2(n474), .B(n681), .ZN(n680) );
  INR2D1BWP U821 ( .A1(\rx_side/N634 ), .B1(n363), .ZN(n681) );
  IND2D1BWP U822 ( .A1(n567), .B1(\rx_side/N469 ), .ZN(n678) );
  IND2D1BWP U823 ( .A1(\rx_side/N469 ), .B1(n682), .ZN(n679) );
  INR2D1BWP U824 ( .A1(RX_Data[44]), .B1(n769), .ZN(n682) );
  OA21D1BWP U825 ( .A1(\rx_side/N634 ), .A2(n775), .B(n468), .Z(n684) );
  OAI211D1BWP U826 ( .A1(n391), .A2(n392), .B(n393), .C(n394), .ZN(n264) );
  AOI22D1BWP U827 ( .A1(\rx_side/N230 ), .A2(n474), .B1(\rx_side/N465 ), .B2(
        n771), .ZN(n394) );
  IAO21D1BWP U828 ( .A1(\rx_side/N230 ), .A2(n777), .B(n395), .ZN(n392) );
  OA21D1BWP U829 ( .A1(\rx_side/N465 ), .A2(n365), .B(n361), .Z(n396) );
  ND3D1BWP U830 ( .A1(n598), .A2(n599), .A3(n600), .ZN(n290) );
  IND2D1BWP U831 ( .A1(\rx_side/N204 ), .B1(n601), .ZN(n600) );
  INR2D1BWP U832 ( .A1(RX_Data[14]), .B1(n775), .ZN(n601) );
  AOI21D1BWP U833 ( .A1(\rx_side/N204 ), .A2(n771), .B(n602), .ZN(n599) );
  OAI21D1BWP U834 ( .A1(n603), .A2(n604), .B(n605), .ZN(n602) );
  IND2D1BWP U835 ( .A1(n362), .B1(\rx_side/N204 ), .ZN(n605) );
  OA21D1BWP U836 ( .A1(\rx_side/N204 ), .A2(n777), .B(n361), .Z(n603) );
  NR2XD0BWP U837 ( .A1(n763), .A2(n764), .ZN(\rx_side/N204 ) );
  IND2D1BWP U838 ( .A1(n365), .B1(RX_Data[14]), .ZN(n606) );
  IND3D1BWP U839 ( .A1(n372), .B1(n621), .B2(n622), .ZN(n297) );
  IND2D1BWP U840 ( .A1(\rx_side/N197 ), .B1(n623), .ZN(n622) );
  INR2D1BWP U841 ( .A1(RX_Data[7]), .B1(n365), .ZN(n623) );
  AOI21D1BWP U842 ( .A1(\rx_side/N197 ), .A2(n771), .B(n624), .ZN(n621) );
  OAI21D1BWP U843 ( .A1(n625), .A2(n626), .B(n627), .ZN(n624) );
  IND2D1BWP U844 ( .A1(n362), .B1(\rx_side/N197 ), .ZN(n627) );
  OA21D1BWP U845 ( .A1(\rx_side/N197 ), .A2(n777), .B(n596), .Z(n625) );
  NR2XD0BWP U846 ( .A1(n734), .A2(n763), .ZN(\rx_side/N197 ) );
  ND3D1BWP U847 ( .A1(n554), .A2(n553), .A3(n555), .ZN(n282) );
  AOI21D1BWP U848 ( .A1(n556), .A2(RX_Data[22]), .B(n557), .ZN(n555) );
  AO22D1BWP U849 ( .A1(\rx_side/N447 ), .A2(n366), .B1(\rx_side/N212 ), .B2(
        n558), .Z(n557) );
  OAI21D1BWP U850 ( .A1(\rx_side/N447 ), .A2(n775), .B(n559), .ZN(n556) );
  OA21D1BWP U851 ( .A1(\rx_side/N212 ), .A2(n777), .B(n596), .Z(n559) );
  NR2XD0BWP U852 ( .A1(n741), .A2(n762), .ZN(\rx_side/N212 ) );
  IND2D1BWP U853 ( .A1(n567), .B1(\rx_side/N447 ), .ZN(n553) );
  IND2D1BWP U854 ( .A1(\rx_side/N447 ), .B1(n560), .ZN(n554) );
  INR2D1BWP U855 ( .A1(RX_Data[22]), .B1(n769), .ZN(n560) );
  INR2D1BWP U856 ( .A1(n367), .B1(n721), .ZN(n380) );
  OAI211D1BWP U857 ( .A1(n775), .A2(\rx_side/N623 ), .B(n383), .C(n384), .ZN(
        n382) );
  IND2D1BWP U858 ( .A1(n813), .B1(n721), .ZN(n384) );
  OR2XD1BWP U859 ( .A1(n728), .A2(n734), .Z(n721) );
  OA21D1BWP U860 ( .A1(\rx_side/N458 ), .A2(n365), .B(n468), .Z(n383) );
  ND3D1BWP U861 ( .A1(n614), .A2(n615), .A3(n616), .ZN(n289) );
  IND2D1BWP U862 ( .A1(\rx_side/N205 ), .B1(n617), .ZN(n616) );
  INR2D1BWP U863 ( .A1(RX_Data[15]), .B1(n775), .ZN(n617) );
  AOI21D1BWP U864 ( .A1(\rx_side/N205 ), .A2(n771), .B(n618), .ZN(n615) );
  AO22D1BWP U865 ( .A1(n619), .A2(RX_Data[15]), .B1(\rx_side/N205 ), .B2(n558), 
        .Z(n618) );
  OAI21D1BWP U866 ( .A1(\rx_side/N205 ), .A2(n777), .B(n468), .ZN(n619) );
  NR2XD0BWP U867 ( .A1(n763), .A2(n736), .ZN(\rx_side/N205 ) );
  IND2D1BWP U868 ( .A1(n365), .B1(RX_Data[15]), .ZN(n620) );
  IND3D1BWP U869 ( .A1(n573), .B1(n574), .B2(n575), .ZN(n277) );
  IND2D1BWP U870 ( .A1(n769), .B1(RX_Data[27]), .ZN(n577) );
  AOI22D1BWP U871 ( .A1(\rx_side/N217 ), .A2(n771), .B1(\rx_side/N617 ), .B2(
        n366), .ZN(n574) );
  IND2D1BWP U872 ( .A1(n362), .B1(\rx_side/N217 ), .ZN(n579) );
  IND2D1BWP U873 ( .A1(n769), .B1(RX_Data[25]), .ZN(n569) );
  IND2D1BWP U874 ( .A1(n362), .B1(\rx_side/N215 ), .ZN(n571) );
  IND2D1BWP U875 ( .A1(\rx_side/counter[5] ), .B1(\rx_side/counter[4] ), .ZN(
        n502) );
  IND2D1BWP U876 ( .A1(n665), .B1(n658), .ZN(n259) );
  AOI21D1BWP U877 ( .A1(\rx_side/N470 ), .A2(n368), .B(n663), .ZN(n658) );
  AO22D1BWP U878 ( .A1(\rx_side/N235 ), .A2(n474), .B1(\rx_side/N635 ), .B2(
        n773), .Z(n663) );
  IND2D1BWP U879 ( .A1(n664), .B1(n659), .ZN(n665) );
  NR2XD0BWP U880 ( .A1(\rx_side/N470 ), .A2(n657), .ZN(n664) );
  ND3D1BWP U881 ( .A1(n607), .A2(n608), .A3(n609), .ZN(n298) );
  IND2D1BWP U882 ( .A1(\rx_side/N596 ), .B1(n610), .ZN(n609) );
  INR2D1BWP U883 ( .A1(RX_Data[6]), .B1(n775), .ZN(n610) );
  AOI21D1BWP U884 ( .A1(\rx_side/N596 ), .A2(n771), .B(n611), .ZN(n608) );
  AO22D1BWP U885 ( .A1(n612), .A2(RX_Data[6]), .B1(\rx_side/N596 ), .B2(n367), 
        .Z(n611) );
  OAI21D1BWP U886 ( .A1(\rx_side/N596 ), .A2(n777), .B(n468), .ZN(n612) );
  NR2XD0BWP U887 ( .A1(n763), .A2(n762), .ZN(\rx_side/N596 ) );
  IND3D1BWP U888 ( .A1(n717), .B1(n710), .B2(n711), .ZN(n300) );
  NR2XD0BWP U889 ( .A1(n733), .A2(n762), .ZN(\rx_side/N594 ) );
  NR2XD0BWP U890 ( .A1(n733), .A2(n762), .ZN(\rx_side/N194 ) );
  IND2D1BWP U891 ( .A1(n375), .B1(n426), .ZN(n253) );
  IAO21D1BWP U892 ( .A1(\rx_side/N641 ), .A2(n769), .B(n428), .ZN(n424) );
  OAI211D1BWP U893 ( .A1(n775), .A2(\rx_side/N641 ), .B(n468), .C(n429), .ZN(
        n428) );
  IND2D1BWP U894 ( .A1(\rx_side/N241 ), .B1(n466), .ZN(n429) );
  IND2D1BWP U895 ( .A1(n376), .B1(n432), .ZN(n255) );
  IAO21D1BWP U896 ( .A1(\rx_side/N474 ), .A2(n769), .B(n434), .ZN(n430) );
  OAI211D1BWP U897 ( .A1(n775), .A2(\rx_side/N639 ), .B(n360), .C(n435), .ZN(
        n434) );
  IND2D1BWP U898 ( .A1(\rx_side/N239 ), .B1(n466), .ZN(n435) );
  NR2XD0BWP U899 ( .A1(n748), .A2(n720), .ZN(\rx_side/N639 ) );
  IND2D1BWP U900 ( .A1(n377), .B1(n442), .ZN(n251) );
  IAO21D1BWP U901 ( .A1(\rx_side/N643 ), .A2(n769), .B(n444), .ZN(n440) );
  OAI211D1BWP U902 ( .A1(n775), .A2(\rx_side/N643 ), .B(n360), .C(n445), .ZN(
        n444) );
  IND2D1BWP U903 ( .A1(\rx_side/N243 ), .B1(n466), .ZN(n445) );
  NR2XD0BWP U904 ( .A1(n748), .A2(n751), .ZN(\rx_side/N643 ) );
  OAI211D1BWP U905 ( .A1(n385), .A2(n386), .B(n387), .C(n388), .ZN(n272) );
  AOI22D1BWP U906 ( .A1(\rx_side/N222 ), .A2(n594), .B1(\rx_side/N457 ), .B2(
        n771), .ZN(n388) );
  IAO21D1BWP U907 ( .A1(\rx_side/N222 ), .A2(n813), .B(n389), .ZN(n386) );
  OA21D1BWP U908 ( .A1(\rx_side/N457 ), .A2(n365), .B(n361), .Z(n390) );
  NR2XD0BWP U909 ( .A1(n756), .A2(n762), .ZN(\rx_side/N622 ) );
  NR2XD0BWP U910 ( .A1(n728), .A2(n762), .ZN(\rx_side/N222 ) );
  AOI22D1BWP U911 ( .A1(\rx_side/N471 ), .A2(n772), .B1(\rx_side/N636 ), .B2(
        n773), .ZN(n403) );
  IAO21D1BWP U912 ( .A1(\rx_side/N471 ), .A2(n769), .B(n404), .ZN(n401) );
  OAI211D1BWP U913 ( .A1(n786), .A2(n362), .B(n785), .C(n784), .ZN(n257) );
  AOI22D1BWP U914 ( .A1(n773), .A2(\rx_side/N637 ), .B1(\rx_side/N472 ), .B2(
        n772), .ZN(n784) );
  OAI31D1BWP U915 ( .A1(n770), .A2(n783), .A3(n782), .B(RX_Data[47]), .ZN(n785) );
  NR2XD0BWP U916 ( .A1(n777), .A2(\rx_side/N237 ), .ZN(n782) );
  OAI22D1BWP U917 ( .A1(\rx_side/N472 ), .A2(n769), .B1(\rx_side/N637 ), .B2(
        n775), .ZN(n783) );
  OR2XD1BWP U918 ( .A1(n757), .A2(n762), .Z(n369) );
  OA21D1BWP U919 ( .A1(n699), .A2(n700), .B(n701), .Z(n370) );
  OA211D1BWP U920 ( .A1(n799), .A2(n723), .B(n3), .C(n798), .Z(n371) );
  MUX2ND0BWP U921 ( .I0(n628), .I1(n363), .S(\rx_side/N197 ), .ZN(n372) );
  OAI21D1BWP U922 ( .A1(\rx_side/N622 ), .A2(n775), .B(n390), .ZN(n389) );
  OAI21D1BWP U923 ( .A1(\rx_side/N630 ), .A2(n775), .B(n396), .ZN(n395) );
  OAI21D1BWP U924 ( .A1(\rx_side/N636 ), .A2(n775), .B(n596), .ZN(n404) );
  OAI21D1BWP U925 ( .A1(\rx_side/N629 ), .A2(n775), .B(n361), .ZN(n409) );
  OAI21D1BWP U926 ( .A1(\rx_side/N638 ), .A2(n775), .B(n415), .ZN(n414) );
  OAI21D1BWP U927 ( .A1(\rx_side/N640 ), .A2(n775), .B(n422), .ZN(n421) );
  AOI21D1BWP U928 ( .A1(\rx_side/N641 ), .A2(n772), .B(n427), .ZN(n426) );
  AO22D1BWP U929 ( .A1(\rx_side/N641 ), .A2(n774), .B1(\rx_side/N241 ), .B2(
        n367), .Z(n427) );
  AOI21D1BWP U930 ( .A1(\rx_side/N474 ), .A2(n772), .B(n433), .ZN(n432) );
  AO22D1BWP U931 ( .A1(\rx_side/N639 ), .A2(n774), .B1(\rx_side/N239 ), .B2(
        n594), .Z(n433) );
  OAI21D1BWP U932 ( .A1(\rx_side/N477 ), .A2(n775), .B(n439), .ZN(n438) );
  AOI21D1BWP U933 ( .A1(\rx_side/N643 ), .A2(n771), .B(n443), .ZN(n442) );
  AO22D1BWP U934 ( .A1(\rx_side/N643 ), .A2(n774), .B1(\rx_side/N243 ), .B2(
        n594), .Z(n443) );
  OAI21D1BWP U935 ( .A1(\rx_side/N479 ), .A2(n775), .B(n449), .ZN(n448) );
  OA21D1BWP U936 ( .A1(\rx_side/N631 ), .A2(n775), .B(n361), .Z(n454) );
  OR2XD1BWP U937 ( .A1(\rx_side/N466 ), .A2(n365), .Z(n455) );
  OAI21D1BWP U938 ( .A1(n450), .A2(n451), .B(n452), .ZN(n263) );
  OA211D1BWP U939 ( .A1(n777), .A2(\rx_side/N231 ), .B(n454), .C(n455), .Z(
        n450) );
  OAI21D1BWP U940 ( .A1(\rx_side/N233 ), .A2(n777), .B(n360), .ZN(n456) );
  ND3D1BWP U941 ( .A1(n459), .A2(n460), .A3(n461), .ZN(n270) );
  AOI21D1BWP U942 ( .A1(\rx_side/N459 ), .A2(n368), .B(n463), .ZN(n460) );
  MUX2D1BWP U943 ( .I0(n467), .I1(n691), .S(\rx_side/N624 ), .Z(n459) );
  OAI21D1BWP U944 ( .A1(\rx_side/N433 ), .A2(n365), .B(n596), .ZN(n481) );
  OAI21D1BWP U945 ( .A1(\rx_side/N425 ), .A2(n769), .B(n468), .ZN(n482) );
  OAI21D1BWP U946 ( .A1(\rx_side/N426 ), .A2(n365), .B(n360), .ZN(n483) );
  OA21D1BWP U947 ( .A1(\rx_side/N625 ), .A2(n487), .B(n488), .Z(n485) );
  OA21D1BWP U948 ( .A1(n497), .A2(\rx_side/N599 ), .B(n501), .Z(n494) );
  OAI211D1BWP U949 ( .A1(\rx_side/N199 ), .A2(n498), .B(n499), .C(n500), .ZN(
        n493) );
  MUX2D1BWP U950 ( .I0(n505), .I1(n364), .S(\rx_side/N435 ), .Z(n504) );
  MUX2D1BWP U951 ( .I0(n506), .I1(n363), .S(\rx_side/N435 ), .Z(n503) );
  OAI21D1BWP U952 ( .A1(\rx_side/N592 ), .A2(n769), .B(n596), .ZN(n515) );
  OAI21D1BWP U953 ( .A1(\rx_side/N593 ), .A2(n365), .B(n360), .ZN(n521) );
  OAI21D1BWP U954 ( .A1(\rx_side/N601 ), .A2(n365), .B(n361), .ZN(n527) );
  OAI21D1BWP U955 ( .A1(\rx_side/N442 ), .A2(n365), .B(n468), .ZN(n533) );
  OAI21D1BWP U956 ( .A1(\rx_side/N441 ), .A2(n365), .B(n361), .ZN(n538) );
  OAI21D1BWP U957 ( .A1(\rx_side/N216 ), .A2(n769), .B(n596), .ZN(n544) );
  OAI21D1BWP U958 ( .A1(\rx_side/N209 ), .A2(n769), .B(n596), .ZN(n550) );
  OAI211D1BWP U959 ( .A1(\rx_side/N217 ), .A2(n578), .B(n579), .C(n580), .ZN(
        n573) );
  OA22D1BWP U960 ( .A1(\rx_side/N617 ), .A2(n576), .B1(\rx_side/N217 ), .B2(
        n577), .Z(n575) );
  OAI21D1BWP U961 ( .A1(\rx_side/N449 ), .A2(n769), .B(n596), .ZN(n581) );
  IND2D1BWP U962 ( .A1(n660), .B1(n661), .ZN(n659) );
  OAI21D1BWP U963 ( .A1(\rx_side/N235 ), .A2(n777), .B(n662), .ZN(n661) );
  OA21D1BWP U964 ( .A1(\rx_side/N635 ), .A2(n775), .B(n360), .Z(n662) );
  OAI21D1BWP U965 ( .A1(\rx_side/N595 ), .A2(n775), .B(n360), .ZN(n671) );
  OAI22D1BWP U966 ( .A1(\rx_side/N234 ), .A2(n683), .B1(n684), .B2(n685), .ZN(
        n677) );
  OAI22D1BWP U967 ( .A1(\rx_side/N226 ), .A2(n693), .B1(n694), .B2(n695), .ZN(
        n686) );
  IND2D1BWP U968 ( .A1(n362), .B1(\rx_side/N437 ), .ZN(n705) );
  AOI21D1BWP U969 ( .A1(\rx_side/N437 ), .A2(n771), .B(n707), .ZN(n703) );
  IND2D1BWP U970 ( .A1(n362), .B1(\rx_side/N194 ), .ZN(n712) );
  OAI21D1BWP U971 ( .A1(\rx_side/N594 ), .A2(n715), .B(n716), .ZN(n714) );
  OR3XD1BWP U972 ( .A1(n719), .A2(n769), .A3(\rx_side/N194 ), .Z(n718) );
  AOI21D1BWP U973 ( .A1(\rx_side/N194 ), .A2(n771), .B(n714), .ZN(n710) );
  AOI21D1BWP U974 ( .A1(\rx_side/counter[1] ), .A2(\rx_side/counter[0] ), .B(
        n799), .ZN(n800) );
  IND2D1BWP U975 ( .A1(n751), .B1(n738), .ZN(n740) );
  NR2XD0BWP U976 ( .A1(n733), .A2(n736), .ZN(\rx_side/N438 ) );
  NR2XD0BWP U977 ( .A1(n726), .A2(n736), .ZN(\rx_side/N217 ) );
  NR3D0BWP U978 ( .A1(\rx_side/counter[3] ), .A2(n796), .A3(n758), .ZN(n759)
         );
endmodule

