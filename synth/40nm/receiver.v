
module receiver ( RX_Ready, Clk_S, Rst_n, S_Data, RX_Data_Valid, RX_Data );
  output [54:0] RX_Data;
  input RX_Ready, Clk_S, Rst_n, S_Data;
  output RX_Data_Valid;
  wire   \state[0] , \rx_side/N644 , \rx_side/N643 , \rx_side/N640 ,
         \rx_side/N639 , \rx_side/N637 , \rx_side/N635 , \rx_side/N634 ,
         \rx_side/N633 , \rx_side/N632 , \rx_side/N631 , \rx_side/N630 ,
         \rx_side/N628 , \rx_side/N627 , \rx_side/N626 , \rx_side/N625 ,
         \rx_side/N624 , \rx_side/N623 , \rx_side/N622 , \rx_side/N620 ,
         \rx_side/N619 , \rx_side/N618 , \rx_side/N612 , \rx_side/N611 ,
         \rx_side/N610 , \rx_side/N609 , \rx_side/N605 , \rx_side/N603 ,
         \rx_side/N602 , \rx_side/N599 , \rx_side/N598 , \rx_side/N596 ,
         \rx_side/N594 , \rx_side/N591 , \rx_side/N477 , \rx_side/N476 ,
         \rx_side/N473 , \rx_side/N471 , \rx_side/N470 , \rx_side/N469 ,
         \rx_side/N462 , \rx_side/N461 , \rx_side/N456 , \rx_side/N454 ,
         \rx_side/N452 , \rx_side/N451 , \rx_side/N450 , \rx_side/N449 ,
         \rx_side/N448 , \rx_side/N446 , \rx_side/N444 , \rx_side/N442 ,
         \rx_side/N441 , \rx_side/N439 , \rx_side/N438 , \rx_side/N437 ,
         \rx_side/N436 , \rx_side/N435 , \rx_side/N432 , \rx_side/N430 ,
         \rx_side/N429 , \rx_side/N428 , \rx_side/N427 , \rx_side/N244 ,
         \rx_side/N243 , \rx_side/N242 , \rx_side/N240 , \rx_side/N239 ,
         \rx_side/N237 , \rx_side/N236 , \rx_side/N235 , \rx_side/N234 ,
         \rx_side/N233 , \rx_side/N232 , \rx_side/N230 , \rx_side/N229 ,
         \rx_side/N228 , \rx_side/N227 , \rx_side/N226 , \rx_side/N225 ,
         \rx_side/N224 , \rx_side/N223 , \rx_side/N222 , \rx_side/N221 ,
         \rx_side/N220 , \rx_side/N218 , \rx_side/N217 , \rx_side/N216 ,
         \rx_side/N215 , \rx_side/N214 , \rx_side/N213 , \rx_side/N212 ,
         \rx_side/N210 , \rx_side/N208 , \rx_side/N207 , \rx_side/N206 ,
         \rx_side/N205 , \rx_side/N204 , \rx_side/N203 , \rx_side/N202 ,
         \rx_side/N201 , \rx_side/N200 , \rx_side/N199 , \rx_side/N198 ,
         \rx_side/N195 , \rx_side/N194 , \rx_side/N193 , \rx_side/N191 ,
         \rx_side/N190 , \rx_side/next_start_seq[5] ,
         \rx_side/next_start_seq[4] , \rx_side/next_start_seq[1] ,
         \rx_side/next_start_seq[0] , \rx_side/next_counter[6] ,
         \rx_side/next_counter[5] , \rx_side/next_counter[4] ,
         \rx_side/next_counter[3] , \rx_side/next_counter[1] ,
         \rx_side/next_counter[0] , \rx_side/next_state[1] ,
         \rx_side/counter[0] , \rx_side/counter[1] , \rx_side/counter[3] ,
         \rx_side/counter[4] , \rx_side/counter[5] , \rx_side/counter[6] ,
         \rx_side/start_seq[0] , \rx_side/start_seq[1] ,
         \rx_side/start_seq[4] , \rx_side/start_seq[5] , \rx_side/state[1] ,
         \rx_side/state[2] , n1, n2, n3, n6, n7, n11, n250, n251, n252, n253,
         n254, n255, n256, n257, n258, n259, n260, n261, n262, n263, n264,
         n265, n266, n267, n268, n269, n270, n271, n272, n273, n274, n275,
         n276, n277, n278, n279, n280, n281, n282, n283, n284, n285, n286,
         n287, n288, n289, n290, n291, n292, n293, n294, n295, n296, n297,
         n298, n299, n300, n301, n302, n303, n304, \rx_side/N595 , n305, n306,
         n307, n308, n309, n310, n311, n312, n313, n314, n315, n316, n317,
         n318, n319, n320, n321, n322, n323, n324, n325, n326, n327, n328,
         n329, n330, n331, n332, n333, n334, n335, n336, n337, n338, n339,
         n340, n341, n342, n343, n344, n345, n346, n347, n348, n349, n350,
         n351, n352, n353, n354, n355, n356, n357, n358, n359, n360, n361,
         n362, n363, n364, n365, n366, n367, n368, n369, n370, n371, n372,
         n373, n374, n375, n376, n377, n378, n379, n380, n381, n382, n383,
         n384, n385, n386, n387, n388, n389, n390, n391, n392, n393, n394,
         n395, n396, n397, n398, n399, n400, n401, n402, n403, n404, n405,
         n406, n407, n408, n409, n410, n411, n412, n413, n414, n415, n416,
         n417, n418, n419, n420, n421, n422, n423, n424, n425, n426, n427,
         n428, n429, n430, n431, n432, n433, n434, n435, n436, n437, n438,
         n439, n440, n441, n442, n443, n444, n445, n446, n447, n448, n449,
         n450, n451, n452, n453, n454, n455, n456, n457, n458, n459, n460,
         n461, n462, n463, n464, n465, n466, n467, n468, n469, n470, n471,
         n472, n473, n474, n475, n476, n477, n478, n479, n480, n481, n482,
         n483, n484, n485, n486, n487, n488, n489, n490, n491, n492, n493,
         n494, n495, n496, n497, n498, n499, n500, n501, n502, n503, n504,
         n505, n506, n507, n508, n509, n510, n511, n512, n513, n514, n515,
         n516, n517, n518, n519, n520, n521, n522, n523, n524, n525, n526,
         n527, n528, n529, n530, n531, n532, n533, n534, n535, n536, n537,
         n538, n539, n540, n541, n542, n543, n544, n545, n546, n547, n548,
         n549, n550, n551, n552, n553, n554, n555, n556, n557, n558, n559,
         n560, n561, n562, n563, n564, n565, n566, n567, n568, n569, n570,
         n571, n572, n573, n574, n575, n576, n577, n578, n579, n580, n581,
         n582, n583, n584, n585, n586, n587, n588, n589, n590, n591, n592,
         n593, n594, n595, n596, n597, n598, n599, n600, n601, n602, n603,
         n604, n605, n606, n607, n608, n609, n610, n611, n612, n613, n614,
         n615, n616, n617, n618, n619, n620, n621, n622, n623, n624, n625,
         n626, n627, n628, n629, n630, n631, n632, n633, n634, n635, n636,
         n637, n638, n639, n640, n641, n642, n643, n644, n645, n646, n647,
         n648, n649, n650, n651, n652, n653, n654, n655, n656, n657, n658,
         n659, n660, n661, n662, n663, n664, n665, n666, n667, n668, n669,
         n670, n671, n672, n673, n674, n675, n676, n677, n678, n679, n680,
         n681, n682, n683, n684, n685, n686, n687, n688, n689, n690, n691,
         n692, n693, n694, n695, n696, n697, n698, n699, n700, n701, n702,
         n703, n704, n705, n706, n707, n708, n709, n710, n711, n712, n713,
         n714, n715, n716, n717, n718, n719, n720, n721, n722, n723, n724,
         n725, n726, n727, n728, n729, n730, n731, n732, n733, n734, n735,
         n736, n737, n738, n739, n740, n741, n742, n743, n744, n745, n746,
         n747, n748, n749, n750, n751, n752, n753, n754, n755, n756, n757,
         n758, n759, n760, n761, n762, n763, n764, n765, n766, n767, n768,
         n769, n770, n771, n772, n773, n774, n775, n776, n777, n778, n779,
         n780, n781, n782, n783, n784, n785, n786, n787, n788, n789, n790,
         n791, n792, n793, n794, n795, n796;
  wire   [1:0] nextState;

  DFCNQD1BWP \state_reg[0]  ( .D(nextState[0]), .CP(Clk_S), .CDN(Rst_n), .Q(
        \state[0] ) );
  DFCNQD1BWP \rx_side/state_reg[2]  ( .D(n790), .CP(Clk_S), .CDN(Rst_n), .Q(
        \rx_side/state[2] ) );
  DFSNQD1BWP \rx_side/start_seq_reg[0]  ( .D(\rx_side/next_start_seq[0] ), 
        .CP(Clk_S), .SDN(Rst_n), .Q(\rx_side/start_seq[0] ) );
  DFSNQD1BWP \rx_side/start_seq_reg[1]  ( .D(\rx_side/next_start_seq[1] ), 
        .CP(Clk_S), .SDN(Rst_n), .Q(\rx_side/start_seq[1] ) );
  DFSNQD1BWP \rx_side/start_seq_reg[4]  ( .D(\rx_side/next_start_seq[4] ), 
        .CP(Clk_S), .SDN(Rst_n), .Q(\rx_side/start_seq[4] ) );
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
  DFSNQD4BWP \rx_side/counter_reg[5]  ( .D(\rx_side/next_counter[5] ), .CP(
        Clk_S), .SDN(Rst_n), .Q(\rx_side/counter[5] ) );
  DFCNQD4BWP \rx_side/counter_reg[0]  ( .D(\rx_side/next_counter[0] ), .CP(
        Clk_S), .CDN(Rst_n), .Q(\rx_side/counter[0] ) );
  DFSNQD1BWP \rx_side/counter_reg[4]  ( .D(\rx_side/next_counter[4] ), .CP(
        Clk_S), .SDN(Rst_n), .Q(\rx_side/counter[4] ) );
  DFCNQD4BWP \rx_side/counter_reg[3]  ( .D(\rx_side/next_counter[3] ), .CP(
        Clk_S), .CDN(Rst_n), .Q(\rx_side/counter[3] ) );
  DFCNQD1BWP \rx_side/counter_reg[6]  ( .D(\rx_side/next_counter[6] ), .CP(
        Clk_S), .CDN(Rst_n), .Q(\rx_side/counter[6] ) );
  NR2XD0BWP \decode_29_3/*cell*2659  ( .A1(n744), .A2(n721), .ZN(
        \rx_side/N436 ) );
  NR2XD0BWP \decode_29_3/*cell*2627  ( .A1(n721), .A2(n742), .ZN(
        \rx_side/N427 ) );
  NR2XD0BWP \decode_29_3/*cell*2585  ( .A1(n743), .A2(n727), .ZN(
        \rx_side/N432 ) );
  NR2XD0BWP \decode_29_3/*cell*2590  ( .A1(n724), .A2(n730), .ZN(
        \rx_side/N477 ) );
  NR2XD0BWP \decode_29_3/*cell*2598  ( .A1(n724), .A2(n470), .ZN(
        \rx_side/N473 ) );
  NR2XD0BWP \decode_29_3/*cell*2651  ( .A1(n727), .A2(n360), .ZN(
        \rx_side/N439 ) );
  NR2XD0BWP \decode_29_3/*cell*2592  ( .A1(n723), .A2(n747), .ZN(
        \rx_side/N476 ) );
  NR2XD0BWP \decode_29_3/*cell*2628  ( .A1(n706), .A2(n744), .ZN(
        \rx_side/N454 ) );
  NR2XD0BWP \decode_29_3/*cell*2625  ( .A1(n734), .A2(n744), .ZN(
        \rx_side/N456 ) );
  ND2D1BWP \decode_29_3/*cell*2652  ( .A1(n731), .A2(n725), .ZN(n727) );
  ND2D1BWP \decode_29_3/*cell*2663  ( .A1(n731), .A2(n714), .ZN(n721) );
  ND2D1BWP \decode_29_3/*cell*2597  ( .A1(\rx_side/counter[0] ), .A2(n741), 
        .ZN(n723) );
  ND2D1BWP \decode_29_3/*cell*2600  ( .A1(n741), .A2(n748), .ZN(n724) );
  ND2D1BWP \decode_29_3/*cell*2616  ( .A1(n715), .A2(n707), .ZN(n722) );
  DFCNQD2BWP \rx_side/state_reg[1]  ( .D(\rx_side/next_state[1] ), .CP(Clk_S), 
        .CDN(Rst_n), .Q(\rx_side/state[1] ) );
  DFSNQD4BWP \rx_side/counter_reg[1]  ( .D(\rx_side/next_counter[1] ), .CP(
        Clk_S), .SDN(Rst_n), .Q(\rx_side/counter[1] ) );
  CKND2D1BWP \decode_29_3/*cell*2656  ( .A1(n731), .A2(n715), .ZN(n726) );
  NR2D1BWP \decode_29_3/*cell*2630  ( .A1(n733), .A2(n744), .ZN(\rx_side/N452 ) );
  NR2D1BWP \decode_29_3/*cell*2654  ( .A1(n726), .A2(n744), .ZN(\rx_side/N438 ) );
  NR2D1BWP \decode_29_3/*cell*2644  ( .A1(n743), .A2(n732), .ZN(\rx_side/N442 ) );
  NR2D1BWP \decode_29_3/*cell*2632  ( .A1(n732), .A2(n744), .ZN(\rx_side/N450 ) );
  NR2D1BWP \decode_29_3/*cell*2646  ( .A1(n732), .A2(n742), .ZN(\rx_side/N441 ) );
  NR2D1BWP \decode_29_3/*cell*2610  ( .A1(n743), .A2(n721), .ZN(\rx_side/N428 ) );
  NR2D1BWP \decode_29_3/*cell*2595  ( .A1(n726), .A2(n742), .ZN(\rx_side/N429 ) );
  NR2D1BWP \decode_29_3/*cell*2634  ( .A1(n734), .A2(n743), .ZN(\rx_side/N448 ) );
  NR2D1BWP \decode_29_3/*cell*2637  ( .A1(n706), .A2(n743), .ZN(\rx_side/N446 ) );
  NR2D1BWP \decode_29_3/*cell*2641  ( .A1(n733), .A2(n743), .ZN(\rx_side/N444 ) );
  NR2D1BWP \decode_29_3/*cell*2587  ( .A1(n743), .A2(n726), .ZN(\rx_side/N430 ) );
  NR2D1BWP \decode_29_3/*cell*2633  ( .A1(n732), .A2(n360), .ZN(\rx_side/N449 ) );
  NR2D1BWP \decode_29_3/*cell*2661  ( .A1(n721), .A2(n360), .ZN(\rx_side/N435 ) );
  NR2D1BWP \decode_29_3/*cell*2631  ( .A1(n733), .A2(n360), .ZN(\rx_side/N451 ) );
  NR2D1BWP \decode_29_3/*cell*2655  ( .A1(n726), .A2(n360), .ZN(\rx_side/N437 ) );
  NR2D1BWP \decode_29_3/*cell*2603  ( .A1(n738), .A2(n360), .ZN(\rx_side/N471 ) );
  NR2D1BWP \decode_29_3/*cell*2604  ( .A1(n722), .A2(n744), .ZN(\rx_side/N470 ) );
  NR2D1BWP \decode_29_3/*cell*2605  ( .A1(n722), .A2(n360), .ZN(\rx_side/N469 ) );
  NR2D1BWP \decode_29_3/*cell*2615  ( .A1(n722), .A2(n742), .ZN(\rx_side/N461 ) );
  NR2D1BWP \decode_29_3/*cell*2614  ( .A1(n722), .A2(n743), .ZN(\rx_side/N462 ) );
  DFCNQD1BWP \rx_side/start_seq_reg[3]  ( .D(n1), .CP(Clk_S), .CDN(Rst_n), .Q(
        n7) );
  DFCNQD1BWP \rx_side/state_reg[0]  ( .D(n3), .CP(Clk_S), .CDN(Rst_n), .Q(n11)
         );
  DFCNQD1BWP \rx_side/counter_reg[2]  ( .D(n374), .CP(Clk_S), .CDN(Rst_n), .Q(
        n702) );
  DFCNQD1BWP \rx_side/start_seq_reg[2]  ( .D(n2), .CP(Clk_S), .CDN(Rst_n), .Q(
        n6) );
  DFCND1BWP \state_reg[1]  ( .D(nextState[1]), .CP(Clk_S), .CDN(Rst_n), .Q(
        RX_Data_Valid), .QN(n792) );
  DFSNQD4BWP \rx_side/start_seq_reg[5]  ( .D(\rx_side/next_start_seq[5] ), 
        .CP(Clk_S), .SDN(Rst_n), .Q(\rx_side/start_seq[5] ) );
  ND2D3BWP U322 ( .A1(\rx_side/counter[0] ), .A2(\rx_side/counter[3] ), .ZN(
        n744) );
  ND2D3BWP U323 ( .A1(n748), .A2(n745), .ZN(n742) );
  ND2D3BWP U324 ( .A1(\rx_side/counter[0] ), .A2(n745), .ZN(n743) );
  CKND12BWP U325 ( .I(n372), .ZN(n384) );
  NR3D1BWP U326 ( .A1(\rx_side/counter[6] ), .A2(\rx_side/counter[5] ), .A3(
        n729), .ZN(n720) );
  INVD1BWP U327 ( .I(\rx_side/counter[4] ), .ZN(n729) );
  CKBD2BWP U328 ( .I(n796), .Z(n369) );
  MAOI22D0BWP U329 ( .A1(n753), .A2(\rx_side/N591 ), .B1(\rx_side/N591 ), .B2(
        n521), .ZN(n513) );
  MAOI22D0BWP U330 ( .A1(n753), .A2(\rx_side/N598 ), .B1(\rx_side/N598 ), .B2(
        n530), .ZN(n522) );
  MAOI22D0BWP U331 ( .A1(n753), .A2(\rx_side/N599 ), .B1(\rx_side/N599 ), .B2(
        n512), .ZN(n504) );
  MAOI22D0BWP U332 ( .A1(n754), .A2(\rx_side/N612 ), .B1(\rx_side/N612 ), .B2(
        n627), .ZN(n620) );
  MAOI22D0BWP U333 ( .A1(n754), .A2(\rx_side/N448 ), .B1(\rx_side/N448 ), .B2(
        n649), .ZN(n643) );
  MAOI22D0BWP U334 ( .A1(n754), .A2(\rx_side/N620 ), .B1(\rx_side/N620 ), .B2(
        n642), .ZN(n636) );
  MAOI22D0BWP U335 ( .A1(n755), .A2(\rx_side/N456 ), .B1(\rx_side/N456 ), .B2(
        n635), .ZN(n628) );
  MAOI22D0BWP U336 ( .A1(n361), .A2(\rx_side/N628 ), .B1(\rx_side/N628 ), .B2(
        n561), .ZN(n559) );
  MAOI22D0BWP U337 ( .A1(n755), .A2(\rx_side/N637 ), .B1(\rx_side/N637 ), .B2(
        n548), .ZN(n542) );
  CKND0BWP U338 ( .I(\rx_side/N623 ), .ZN(n305) );
  CKND2D0BWP U339 ( .A1(n751), .A2(n384), .ZN(n306) );
  AOI21D0BWP U340 ( .A1(n306), .A2(n305), .B(n367), .ZN(n445) );
  NR2XD0BWP U341 ( .A1(n742), .A2(n728), .ZN(n307) );
  CKND0BWP U342 ( .I(RX_Data[0]), .ZN(n308) );
  AOI211D0BWP U343 ( .A1(n384), .A2(n751), .B(n307), .C(n308), .ZN(n309) );
  AOI211XD0BWP U344 ( .A1(n361), .A2(n307), .B(n531), .C(n309), .ZN(n310) );
  OAI31D0BWP U345 ( .A1(n742), .A2(n728), .A3(n591), .B(n310), .ZN(n304) );
  OR2D0BWP U346 ( .A1(n743), .A2(n717), .Z(n311) );
  CKND2D0BWP U347 ( .A1(n311), .A2(RX_Data[7]), .ZN(n312) );
  OAI22D0BWP U348 ( .A1(n312), .A2(n757), .B1(n311), .B2(n368), .ZN(n313) );
  INVD1BWP U349 ( .I(n386), .ZN(n314) );
  CKND0BWP U350 ( .I(\rx_side/N432 ), .ZN(n315) );
  AOI32D1BWP U351 ( .A1(n363), .A2(\rx_side/N432 ), .A3(n314), .B1(n619), .B2(
        n315), .ZN(n316) );
  AO211D1BWP U352 ( .A1(RX_Data[7]), .A2(n618), .B(n313), .C(n316), .Z(n297)
         );
  NR2D0BWP U353 ( .A1(\rx_side/N640 ), .A2(n749), .ZN(n317) );
  OAI21D0BWP U354 ( .A1(n317), .A2(n494), .B(RX_Data[50]), .ZN(n318) );
  CKND2D0BWP U355 ( .A1(n492), .A2(n318), .ZN(n254) );
  IND2D0BWP U356 ( .A1(n730), .B1(n731), .ZN(n395) );
  NR2D0BWP U357 ( .A1(n744), .A2(n717), .ZN(\rx_side/N205 ) );
  NR2D0BWP U358 ( .A1(n733), .A2(n742), .ZN(n319) );
  MUX2ND0BWP U359 ( .I0(n751), .I1(n363), .S(n319), .ZN(n320) );
  OAI21D0BWP U360 ( .A1(n319), .A2(RX_Data[18]), .B(n320), .ZN(n607) );
  NR2D0BWP U361 ( .A1(n757), .A2(\rx_side/N224 ), .ZN(n321) );
  OAI21D0BWP U362 ( .A1(n751), .A2(\rx_side/N624 ), .B(n634), .ZN(n322) );
  OAI21D0BWP U363 ( .A1(n321), .A2(n322), .B(RX_Data[34]), .ZN(n582) );
  CKND0BWP U364 ( .I(RX_Data[39]), .ZN(n323) );
  CKND0BWP U365 ( .I(n752), .ZN(n324) );
  OAI32D0BWP U366 ( .A1(n323), .A2(n757), .A3(\rx_side/N229 ), .B1(n324), .B2(
        n323), .ZN(n550) );
  AOI211XD0BWP U367 ( .A1(n753), .A2(\rx_side/N435 ), .B(n667), .C(n668), .ZN(
        n325) );
  IND2D0BWP U368 ( .A1(n662), .B1(n325), .ZN(n294) );
  NR2D0BWP U369 ( .A1(\rx_side/N441 ), .A2(n751), .ZN(n326) );
  OAI21D0BWP U370 ( .A1(n326), .A2(n479), .B(RX_Data[16]), .ZN(n327) );
  CKND2D0BWP U371 ( .A1(n477), .A2(n327), .ZN(n288) );
  AOI21D0BWP U372 ( .A1(\rx_side/N476 ), .A2(n361), .B(n458), .ZN(n328) );
  NR2D0BWP U373 ( .A1(\rx_side/N476 ), .A2(n749), .ZN(n329) );
  OAI211D0BWP U374 ( .A1(\rx_side/N476 ), .A2(n384), .B(n459), .C(n3), .ZN(
        n330) );
  OAI21D0BWP U375 ( .A1(n329), .A2(n330), .B(RX_Data[51]), .ZN(n331) );
  OAI211D0BWP U376 ( .A1(n375), .A2(n782), .B(n328), .C(n331), .ZN(n253) );
  CKND2D0BWP U377 ( .A1(n791), .A2(n376), .ZN(n332) );
  MOAI22D0BWP U378 ( .A1(n593), .A2(n332), .B1(n361), .B2(\rx_side/N427 ), 
        .ZN(n598) );
  OR2D0BWP U379 ( .A1(n742), .A2(n717), .Z(n762) );
  CKND0BWP U380 ( .I(\rx_side/N233 ), .ZN(n333) );
  MOAI22D0BWP U381 ( .A1(n368), .A2(n333), .B1(\rx_side/N633 ), .B2(n361), 
        .ZN(n539) );
  NR2D0BWP U382 ( .A1(n757), .A2(\rx_side/N236 ), .ZN(n334) );
  OA21D1BWP U383 ( .A1(n367), .A2(n334), .B(RX_Data[46]), .Z(n556) );
  AOI32D0BWP U384 ( .A1(n751), .A2(n472), .A3(n756), .B1(\rx_side/N450 ), .B2(
        n472), .ZN(n335) );
  AOI21D0BWP U385 ( .A1(n754), .A2(\rx_side/N450 ), .B(n471), .ZN(n336) );
  IOA21D0BWP U386 ( .A1(RX_Data[25]), .A2(n335), .B(n336), .ZN(n279) );
  OA211D1BWP U387 ( .A1(\rx_side/N216 ), .A2(n587), .B(n588), .C(n589), .Z(
        n337) );
  IND3D0BWP U388 ( .A1(n394), .B1(n586), .B2(n337), .ZN(n278) );
  NR2D0BWP U389 ( .A1(\rx_side/N477 ), .A2(n749), .ZN(n338) );
  OAI21D0BWP U390 ( .A1(n338), .A2(n498), .B(RX_Data[52]), .ZN(n339) );
  CKND2D0BWP U391 ( .A1(n496), .A2(n339), .ZN(n252) );
  IND2D0BWP U392 ( .A1(n470), .B1(n731), .ZN(n728) );
  INR3D0BWP U393 ( .A1(RX_Data[26]), .B1(n751), .B2(\rx_side/N451 ), .ZN(n394)
         );
  INVD1BWP U394 ( .I(n757), .ZN(n340) );
  AO21D1BWP U395 ( .A1(n438), .A2(n340), .B(n752), .Z(n440) );
  INR3D0BWP U396 ( .A1(RX_Data[42]), .B1(n384), .B2(\rx_side/N632 ), .ZN(n579)
         );
  NR2D0BWP U397 ( .A1(\rx_side/N430 ), .A2(n751), .ZN(n341) );
  OAI21D0BWP U398 ( .A1(n341), .A2(n413), .B(RX_Data[5]), .ZN(n342) );
  CKND2D0BWP U399 ( .A1(n411), .A2(n342), .ZN(n299) );
  NR2D0BWP U400 ( .A1(\rx_side/N442 ), .A2(n751), .ZN(n343) );
  OAI21D0BWP U401 ( .A1(n343), .A2(n483), .B(RX_Data[17]), .ZN(n344) );
  CKND2D0BWP U402 ( .A1(n481), .A2(n344), .ZN(n287) );
  NR2XD0BWP U403 ( .A1(n738), .A2(n743), .ZN(n345) );
  AOI22D0BWP U404 ( .A1(\rx_side/N229 ), .A2(n362), .B1(n345), .B2(n755), .ZN(
        n346) );
  INR3D0BWP U405 ( .A1(RX_Data[39]), .B1(n345), .B2(n384), .ZN(n347) );
  AOI211XD0BWP U406 ( .A1(n345), .A2(n361), .B(n347), .C(n550), .ZN(n348) );
  OAI211D0BWP U407 ( .A1(n345), .A2(n549), .B(n346), .C(n348), .ZN(n265) );
  NR2D0BWP U408 ( .A1(\rx_side/N643 ), .A2(n749), .ZN(n349) );
  OAI21D0BWP U409 ( .A1(n349), .A2(n462), .B(RX_Data[53]), .ZN(n350) );
  CKND2D0BWP U410 ( .A1(n460), .A2(n350), .ZN(n251) );
  ND3D0BWP U411 ( .A1(n762), .A2(RX_Data[6]), .A3(n365), .ZN(n674) );
  INR3D0BWP U412 ( .A1(RX_Data[10]), .B1(n756), .B2(\rx_side/N435 ), .ZN(n667)
         );
  NR3D0BWP U413 ( .A1(n360), .A2(n370), .A3(n730), .ZN(\rx_side/N634 ) );
  OAI32D0BWP U414 ( .A1(n789), .A2(n382), .A3(n788), .B1(n383), .B2(n789), 
        .ZN(\rx_side/next_counter[6] ) );
  NR2D0BWP U415 ( .A1(\rx_side/N437 ), .A2(n751), .ZN(n351) );
  OAI21D0BWP U416 ( .A1(n351), .A2(n423), .B(RX_Data[12]), .ZN(n352) );
  CKND2D0BWP U417 ( .A1(n421), .A2(n352), .ZN(n292) );
  AOI21D0BWP U418 ( .A1(n666), .A2(\rx_side/N208 ), .B(n608), .ZN(n353) );
  ND3D0BWP U419 ( .A1(n607), .A2(n606), .A3(n353), .ZN(n286) );
  NR2D0BWP U420 ( .A1(\rx_side/N449 ), .A2(n751), .ZN(n354) );
  OAI21D0BWP U421 ( .A1(n354), .A2(n475), .B(RX_Data[24]), .ZN(n355) );
  CKND2D0BWP U422 ( .A1(n473), .A2(n355), .ZN(n280) );
  AOI22D0BWP U423 ( .A1(\rx_side/N632 ), .A2(n361), .B1(n362), .B2(
        \rx_side/N232 ), .ZN(n356) );
  AOI21D0BWP U424 ( .A1(n386), .A2(\rx_side/N632 ), .B(n579), .ZN(n357) );
  ND3D0BWP U425 ( .A1(n575), .A2(n356), .A3(n357), .ZN(n262) );
  NR2D0BWP U426 ( .A1(\rx_side/N644 ), .A2(n749), .ZN(n358) );
  OAI21D0BWP U427 ( .A1(n358), .A2(n502), .B(RX_Data[54]), .ZN(n359) );
  CKND2D0BWP U428 ( .A1(n500), .A2(n359), .ZN(n250) );
  CKND2BWP U429 ( .I(n367), .ZN(n634) );
  NR2XD3BWP U430 ( .A1(n379), .A2(\rx_side/counter[3] ), .ZN(n380) );
  ND2D3BWP U431 ( .A1(\rx_side/counter[3] ), .A2(n748), .ZN(n360) );
  CKND3BWP U432 ( .I(n752), .ZN(n366) );
  ND2D4BWP U433 ( .A1(n783), .A2(n761), .ZN(n3) );
  CKND2BWP U434 ( .I(n367), .ZN(n626) );
  NR2XD1BWP U435 ( .A1(n739), .A2(\rx_side/counter[4] ), .ZN(n707) );
  ND2D2BWP U436 ( .A1(n760), .A2(S_Data), .ZN(n782) );
  CKND4BWP U437 ( .I(n372), .ZN(n756) );
  BUFFD12BWP U438 ( .I(n781), .Z(n367) );
  CKBD2BWP U439 ( .I(n385), .Z(n755) );
  CKBD2BWP U440 ( .I(n780), .Z(n749) );
  INVD1BWP U441 ( .I(n3), .ZN(n781) );
  CKBD1BWP U442 ( .I(n385), .Z(n753) );
  IND2D1BWP U443 ( .A1(\rx_side/counter[6] ), .B1(\rx_side/counter[5] ), .ZN(
        n739) );
  NR2XD0BWP U444 ( .A1(n791), .A2(n372), .ZN(n787) );
  IND2D0BWP U445 ( .A1(\rx_side/N605 ), .B1(n372), .ZN(n387) );
  IND2D1BWP U446 ( .A1(n756), .B1(RX_Data[18]), .ZN(n611) );
  BUFFD6BWP U447 ( .I(n780), .Z(n751) );
  BUFFD12BWP U448 ( .I(n371), .Z(n361) );
  IAO21D0BWP U449 ( .A1(\rx_side/N199 ), .A2(n757), .B(n752), .ZN(n509) );
  CKND2D1BWP U450 ( .A1(n752), .A2(RX_Data[38]), .ZN(n565) );
  INVD2BWP U451 ( .I(n368), .ZN(n362) );
  BUFFD4BWP U452 ( .I(n781), .Z(n752) );
  NR2D0BWP U453 ( .A1(n369), .A2(\rx_side/N454 ), .ZN(n765) );
  NR2XD0BWP U454 ( .A1(n710), .A2(n744), .ZN(\rx_side/N233 ) );
  NR2D1BWP U455 ( .A1(n734), .A2(n742), .ZN(\rx_side/N212 ) );
  IND2D1BWP U456 ( .A1(n749), .B1(RX_Data[47]), .ZN(n548) );
  IND2D1BWP U457 ( .A1(n749), .B1(RX_Data[10]), .ZN(n663) );
  IND2D1BWP U458 ( .A1(n756), .B1(RX_Data[21]), .ZN(n691) );
  IND2D1BWP U459 ( .A1(n756), .B1(RX_Data[20]), .ZN(n700) );
  INVD2BWP U460 ( .I(n361), .ZN(n363) );
  OAI21D0BWP U461 ( .A1(\rx_side/N441 ), .A2(n756), .B(n480), .ZN(n479) );
  NR2D1BWP U462 ( .A1(n376), .A2(n368), .ZN(n596) );
  INVD2BWP U463 ( .I(n368), .ZN(n364) );
  NR2D0BWP U464 ( .A1(n369), .A2(\rx_side/N218 ), .ZN(n679) );
  IND2D0BWP U465 ( .A1(n369), .B1(RX_Data[18]), .ZN(n609) );
  IND2D0BWP U466 ( .A1(n369), .B1(RX_Data[20]), .ZN(n697) );
  IND2D0BWP U467 ( .A1(n369), .B1(RX_Data[21]), .ZN(n688) );
  IND2D0BWP U468 ( .A1(n369), .B1(RX_Data[14]), .ZN(n617) );
  INVD2BWP U469 ( .I(n369), .ZN(n365) );
  CKND2D0BWP U470 ( .A1(n791), .A2(n7), .ZN(\rx_side/next_start_seq[4] ) );
  IND2D0BWP U471 ( .A1(\rx_side/start_seq[4] ), .B1(n791), .ZN(
        \rx_side/next_start_seq[5] ) );
  IND2D0BWP U472 ( .A1(\rx_side/start_seq[0] ), .B1(n791), .ZN(
        \rx_side/next_start_seq[1] ) );
  CKND2D0BWP U473 ( .A1(n791), .A2(n795), .ZN(\rx_side/next_start_seq[0] ) );
  NR3D2BWP U474 ( .A1(\rx_side/state[2] ), .A2(n11), .A3(\rx_side/state[1] ), 
        .ZN(n791) );
  CKND1BWP U475 ( .I(RX_Data[35]), .ZN(n569) );
  CKND1BWP U476 ( .I(RX_Data[42]), .ZN(n576) );
  NR2D1BWP U477 ( .A1(n789), .A2(n784), .ZN(\rx_side/next_counter[3] ) );
  NR2D1BWP U478 ( .A1(\rx_side/N625 ), .A2(n566), .ZN(n573) );
  BUFFD8BWP U479 ( .I(n385), .Z(n754) );
  BUFFD3BWP U480 ( .I(n385), .Z(n386) );
  CKND2D1BWP U481 ( .A1(\rx_side/N471 ), .A2(n361), .ZN(n557) );
  IND2D0BWP U482 ( .A1(n750), .B1(RX_Data[39]), .ZN(n549) );
  IND2D0BWP U483 ( .A1(n749), .B1(RX_Data[46]), .ZN(n555) );
  NR2D1BWP U484 ( .A1(\rx_side/N624 ), .A2(n580), .ZN(n584) );
  NR2D1BWP U485 ( .A1(\rx_side/N217 ), .A2(n756), .ZN(n659) );
  IND2D0BWP U486 ( .A1(n756), .B1(RX_Data[26]), .ZN(n587) );
  IND2D0BWP U487 ( .A1(n384), .B1(RX_Data[46]), .ZN(n554) );
  IND2D0BWP U488 ( .A1(n384), .B1(RX_Data[38]), .ZN(n561) );
  IND2D0BWP U489 ( .A1(n429), .B1(n371), .ZN(n430) );
  NR2D1BWP U490 ( .A1(\rx_side/N609 ), .A2(n756), .ZN(n653) );
  IND2D0BWP U491 ( .A1(n756), .B1(RX_Data[3]), .ZN(n602) );
  OAI21D1BWP U492 ( .A1(\rx_side/N237 ), .A2(n757), .B(n3), .ZN(n547) );
  NR2D1BWP U493 ( .A1(n737), .A2(n744), .ZN(\rx_side/N635 ) );
  NR2D1BWP U494 ( .A1(n737), .A2(n742), .ZN(\rx_side/N626 ) );
  NR2D1BWP U495 ( .A1(n744), .A2(n728), .ZN(\rx_side/N599 ) );
  CKND0BWP U496 ( .I(\rx_side/N202 ), .ZN(n764) );
  NR2D1BWP U497 ( .A1(n395), .A2(n360), .ZN(\rx_side/N602 ) );
  NR2D1BWP U498 ( .A1(n360), .A2(n728), .ZN(\rx_side/N598 ) );
  CKND1BWP U499 ( .I(\rx_side/N234 ), .ZN(n779) );
  NR2D1BWP U500 ( .A1(n395), .A2(n742), .ZN(\rx_side/N594 ) );
  NR2D1BWP U501 ( .A1(n395), .A2(n743), .ZN(\rx_side/N595 ) );
  NR2D1BWP U502 ( .A1(n395), .A2(n744), .ZN(\rx_side/N603 ) );
  NR2D1BWP U503 ( .A1(n757), .A2(\rx_side/N234 ), .ZN(n775) );
  OR2XD1BWP U504 ( .A1(n730), .A2(n370), .Z(n737) );
  CKMUX2D1BWP U505 ( .I0(n617), .I1(n782), .S(\rx_side/N204 ), .Z(n612) );
  NR2D1BWP U506 ( .A1(n743), .A2(n728), .ZN(\rx_side/N591 ) );
  CKND1BWP U507 ( .I(\rx_side/N218 ), .ZN(n683) );
  NR2D1BWP U508 ( .A1(n738), .A2(n744), .ZN(\rx_side/N637 ) );
  NR2D1BWP U509 ( .A1(n716), .A2(n360), .ZN(\rx_side/N202 ) );
  CKND1BWP U510 ( .I(\rx_side/N227 ), .ZN(n774) );
  NR2D1BWP U511 ( .A1(n709), .A2(n360), .ZN(\rx_side/N230 ) );
  CKND0BWP U512 ( .I(\rx_side/N201 ), .ZN(n763) );
  NR2XD2BWP U513 ( .A1(n381), .A2(\rx_side/counter[5] ), .ZN(n382) );
  NR2D1BWP U514 ( .A1(n708), .A2(n360), .ZN(\rx_side/N200 ) );
  NR2D1BWP U515 ( .A1(n757), .A2(\rx_side/N227 ), .ZN(n770) );
  NR2D1BWP U516 ( .A1(n717), .A2(n360), .ZN(\rx_side/N204 ) );
  CKND2D1BWP U517 ( .A1(n375), .A2(n365), .ZN(n459) );
  CKND1BWP U518 ( .I(\rx_side/N438 ), .ZN(n429) );
  NR2D1BWP U519 ( .A1(n705), .A2(n360), .ZN(\rx_side/N214 ) );
  NR2D1BWP U520 ( .A1(n712), .A2(n360), .ZN(\rx_side/N236 ) );
  CKND1BWP U521 ( .I(\rx_side/N235 ), .ZN(n410) );
  NR2D1BWP U522 ( .A1(n706), .A2(n360), .ZN(\rx_side/N618 ) );
  NR2D1BWP U523 ( .A1(n710), .A2(n360), .ZN(\rx_side/N232 ) );
  NR2D1BWP U524 ( .A1(n734), .A2(n360), .ZN(\rx_side/N220 ) );
  NR2D1BWP U525 ( .A1(n360), .A2(n718), .ZN(\rx_side/N198 ) );
  CKND1BWP U526 ( .I(\rx_side/N454 ), .ZN(n769) );
  BUFFD4BWP U527 ( .I(n782), .Z(n368) );
  CKND1BWP U528 ( .I(\rx_side/N226 ), .ZN(n403) );
  NR2D1BWP U529 ( .A1(n711), .A2(n360), .ZN(\rx_side/N234 ) );
  NR2D1BWP U530 ( .A1(n734), .A2(n360), .ZN(\rx_side/N620 ) );
  NR2D1BWP U531 ( .A1(n706), .A2(n360), .ZN(\rx_side/N218 ) );
  NR2D1BWP U532 ( .A1(n709), .A2(n743), .ZN(\rx_side/N223 ) );
  NR2D1BWP U533 ( .A1(n734), .A2(n743), .ZN(\rx_side/N213 ) );
  NR2D1BWP U534 ( .A1(n743), .A2(n716), .ZN(\rx_side/N195 ) );
  NR2D1BWP U535 ( .A1(n733), .A2(n742), .ZN(\rx_side/N208 ) );
  NR2D1BWP U536 ( .A1(n724), .A2(n747), .ZN(\rx_side/N240 ) );
  NR2D1BWP U537 ( .A1(n711), .A2(n742), .ZN(\rx_side/N226 ) );
  NR2D1BWP U538 ( .A1(n716), .A2(n742), .ZN(\rx_side/N194 ) );
  NR2D1BWP U539 ( .A1(n706), .A2(n743), .ZN(\rx_side/N611 ) );
  NR2D1BWP U540 ( .A1(n711), .A2(n744), .ZN(\rx_side/N235 ) );
  NR2D1BWP U541 ( .A1(n724), .A2(n747), .ZN(\rx_side/N640 ) );
  NR2D1BWP U542 ( .A1(n709), .A2(n742), .ZN(\rx_side/N222 ) );
  NR2D1BWP U543 ( .A1(n733), .A2(n743), .ZN(\rx_side/N609 ) );
  NR2D1BWP U544 ( .A1(n706), .A2(n742), .ZN(\rx_side/N210 ) );
  NR2D1BWP U545 ( .A1(n706), .A2(n742), .ZN(\rx_side/N610 ) );
  OR2D1BWP U546 ( .A1(n723), .A2(n747), .Z(n375) );
  NR2D1BWP U547 ( .A1(n734), .A2(n742), .ZN(\rx_side/N612 ) );
  OR2D1BWP U548 ( .A1(n709), .A2(n744), .Z(n438) );
  NR2D1BWP U549 ( .A1(n743), .A2(n718), .ZN(\rx_side/N191 ) );
  NR2D1BWP U550 ( .A1(n724), .A2(n730), .ZN(\rx_side/N242 ) );
  NR2D1BWP U551 ( .A1(n723), .A2(n730), .ZN(\rx_side/N643 ) );
  NR2D1BWP U552 ( .A1(n757), .A2(\rx_side/start_seq[1] ), .ZN(n2) );
  NR2D1BWP U553 ( .A1(n710), .A2(n742), .ZN(\rx_side/N224 ) );
  NR2D1BWP U554 ( .A1(n724), .A2(n719), .ZN(n489) );
  NR2D1BWP U555 ( .A1(n743), .A2(n705), .ZN(\rx_side/N207 ) );
  NR2D1BWP U556 ( .A1(n711), .A2(n743), .ZN(\rx_side/N227 ) );
  NR2D1BWP U557 ( .A1(n723), .A2(n719), .ZN(\rx_side/N239 ) );
  NR2D1BWP U558 ( .A1(n712), .A2(n743), .ZN(\rx_side/N229 ) );
  NR2D1BWP U559 ( .A1(n705), .A2(n744), .ZN(\rx_side/N215 ) );
  NR2D1BWP U560 ( .A1(n710), .A2(n743), .ZN(\rx_side/N225 ) );
  NR2D1BWP U561 ( .A1(n742), .A2(n718), .ZN(\rx_side/N190 ) );
  NR2D1BWP U562 ( .A1(n705), .A2(n742), .ZN(\rx_side/N206 ) );
  IND2D0BWP U563 ( .A1(n757), .B1(RX_Data[38]), .ZN(n564) );
  NR2D1BWP U564 ( .A1(n723), .A2(n470), .ZN(\rx_side/N639 ) );
  ND2D2BWP U565 ( .A1(n380), .A2(n729), .ZN(n381) );
  NR2D1BWP U566 ( .A1(n723), .A2(n730), .ZN(\rx_side/N243 ) );
  NR2D1BWP U567 ( .A1(n712), .A2(n742), .ZN(\rx_side/N228 ) );
  CKND1BWP U568 ( .I(n713), .ZN(n719) );
  BUFFD2BWP U569 ( .I(n796), .Z(n757) );
  CKAN2D1BWP U570 ( .A1(n6), .A2(n791), .Z(n1) );
  NR2D1BWP U571 ( .A1(n703), .A2(\rx_side/counter[1] ), .ZN(n713) );
  NR2D2BWP U572 ( .A1(n746), .A2(n703), .ZN(n714) );
  ND2D3BWP U573 ( .A1(n378), .A2(n702), .ZN(n379) );
  CKND1BWP U574 ( .I(n761), .ZN(n396) );
  AOI21D0BWP U575 ( .A1(\rx_side/counter[1] ), .A2(\rx_side/counter[0] ), .B(
        n378), .ZN(n786) );
  AN3XD1BWP U576 ( .A1(n729), .A2(n788), .A3(n701), .Z(n704) );
  CKND1BWP U577 ( .I(RX_Data[2]), .ZN(n593) );
  CKND0BWP U578 ( .I(RX_Data[8]), .ZN(n528) );
  CKND0BWP U579 ( .I(RX_Data[9]), .ZN(n510) );
  CKND0BWP U580 ( .I(RX_Data[1]), .ZN(n519) );
  CKND1BWP U581 ( .I(RX_Data[11]), .ZN(n673) );
  CKND2D0BWP U582 ( .A1(\rx_side/state[2] ), .A2(n11), .ZN(n794) );
  CKND0BWP U583 ( .I(RX_Data[0]), .ZN(n533) );
  NR2XD3BWP U584 ( .A1(\rx_side/counter[0] ), .A2(\rx_side/counter[1] ), .ZN(
        n378) );
  CKND1BWP U585 ( .I(RX_Data[15]), .ZN(n392) );
  CKND0BWP U586 ( .I(\rx_side/counter[5] ), .ZN(n701) );
  CKND1BWP U587 ( .I(RX_Data[4]), .ZN(n416) );
  CKND1BWP U588 ( .I(RX_Data[49]), .ZN(n465) );
  CKND1BWP U589 ( .I(RX_Data[36]), .ZN(n398) );
  CKND1BWP U590 ( .I(RX_Data[48]), .ZN(n486) );
  CKND1BWP U591 ( .I(RX_Data[32]), .ZN(n453) );
  CKND1BWP U592 ( .I(RX_Data[33]), .ZN(n442) );
  CKND1BWP U593 ( .I(RX_Data[40]), .ZN(n447) );
  CKND1BWP U594 ( .I(RX_Data[41]), .ZN(n433) );
  CKND1BWP U595 ( .I(RX_Data[45]), .ZN(n405) );
  INVD1BWP U596 ( .I(\rx_side/counter[0] ), .ZN(n748) );
  INVD1BWP U597 ( .I(n707), .ZN(n370) );
  NR2XD8BWP U598 ( .A1(n795), .A2(n384), .ZN(n385) );
  INVD1BWP U599 ( .I(n790), .ZN(n780) );
  NR3D0BWP U600 ( .A1(\rx_side/counter[4] ), .A2(\rx_side/counter[6] ), .A3(
        \rx_side/counter[5] ), .ZN(n731) );
  IND3D1BWP U601 ( .A1(\rx_side/state[2] ), .B1(n11), .B2(\rx_side/state[1] ), 
        .ZN(n761) );
  ND2D2BWP U602 ( .A1(n791), .A2(n759), .ZN(n783) );
  AN2XD1BWP U603 ( .A1(n703), .A2(\rx_side/counter[1] ), .Z(n725) );
  AN2D2BWP U604 ( .A1(n790), .A2(S_Data), .Z(n371) );
  AN2D4BWP U605 ( .A1(n383), .A2(n396), .Z(n372) );
  CKBD2BWP U606 ( .I(n780), .Z(n750) );
  ND2D3BWP U607 ( .A1(n382), .A2(n788), .ZN(n383) );
  INVD1BWP U608 ( .I(\rx_side/next_state[1] ), .ZN(n789) );
  ND2D1BWP U609 ( .A1(n651), .A2(n650), .ZN(n285) );
  ND2D1BWP U610 ( .A1(n725), .A2(n720), .ZN(n734) );
  ND2D1BWP U611 ( .A1(n657), .A2(n656), .ZN(n277) );
  ND2D1BWP U612 ( .A1(n367), .A2(RX_Data[21]), .ZN(n689) );
  ND2D1BWP U613 ( .A1(n367), .A2(RX_Data[20]), .ZN(n698) );
  ND2D1BWP U614 ( .A1(n715), .A2(n720), .ZN(n706) );
  ND2D1BWP U615 ( .A1(n725), .A2(n707), .ZN(n712) );
  ND2D1BWP U616 ( .A1(n725), .A2(n707), .ZN(n738) );
  ND2D1BWP U617 ( .A1(n367), .A2(RX_Data[18]), .ZN(n610) );
  INVD1BWP U618 ( .I(n386), .ZN(n692) );
  INVD1BWP U619 ( .I(n754), .ZN(n591) );
  ND2D1BWP U620 ( .A1(n714), .A2(n720), .ZN(n733) );
  ND2D1BWP U621 ( .A1(n713), .A2(n720), .ZN(n705) );
  ND2D1BWP U622 ( .A1(n740), .A2(n720), .ZN(n732) );
  ND2D1BWP U623 ( .A1(n715), .A2(n707), .ZN(n711) );
  AN2XD1BWP U624 ( .A1(\rx_side/N435 ), .A2(n361), .Z(n668) );
  INVD1BWP U625 ( .I(n714), .ZN(n747) );
  INVD1BWP U626 ( .I(n438), .ZN(n437) );
  ND2D1BWP U627 ( .A1(n713), .A2(n707), .ZN(n709) );
  ND2D1BWP U628 ( .A1(n740), .A2(n707), .ZN(n735) );
  INVD1BWP U629 ( .I(n750), .ZN(n541) );
  ND2D1BWP U630 ( .A1(n714), .A2(n707), .ZN(n710) );
  ND2D1BWP U631 ( .A1(n714), .A2(n707), .ZN(n736) );
  ND2D1BWP U632 ( .A1(n704), .A2(n713), .ZN(n718) );
  INVD1BWP U633 ( .I(n740), .ZN(n470) );
  AN2XD1BWP U634 ( .A1(n702), .A2(n746), .Z(n740) );
  INVD1BWP U635 ( .I(\rx_side/counter[3] ), .ZN(n745) );
  ND2D1BWP U636 ( .A1(n704), .A2(n715), .ZN(n716) );
  INVD1BWP U637 ( .I(n715), .ZN(n730) );
  INR2D2BWP U638 ( .A1(n703), .B1(\rx_side/counter[1] ), .ZN(n715) );
  ND2D1BWP U639 ( .A1(n704), .A2(n714), .ZN(n708) );
  INVD1BWP U640 ( .I(n782), .ZN(n666) );
  INVD1BWP U641 ( .I(n783), .ZN(n760) );
  INVD1BWP U642 ( .I(n791), .ZN(n796) );
  ND2D1BWP U643 ( .A1(n704), .A2(n725), .ZN(n717) );
  NR2XD1BWP U644 ( .A1(n383), .A2(n761), .ZN(n790) );
  INVD1BWP U645 ( .I(\rx_side/counter[6] ), .ZN(n788) );
  INVD1BWP U646 ( .I(n702), .ZN(n703) );
  NR2XD0BWP U647 ( .A1(\rx_side/counter[0] ), .A2(n789), .ZN(
        \rx_side/next_counter[0] ) );
  ND2D1BWP U648 ( .A1(n384), .A2(n783), .ZN(\rx_side/next_state[1] ) );
  INVD1BWP U649 ( .I(\rx_side/counter[1] ), .ZN(n746) );
  INVD1BWP U650 ( .I(S_Data), .ZN(n795) );
  NR3D0BWP U651 ( .A1(n758), .A2(n6), .A3(n7), .ZN(n759) );
  OA21D1BWP U652 ( .A1(\state[0] ), .A2(RX_Data_Valid), .B(RX_Ready), .Z(
        nextState[1]) );
  OAI31D1BWP U653 ( .A1(\rx_side/state[1] ), .A2(\state[0] ), .A3(n794), .B(
        n793), .ZN(nextState[0]) );
  AOI22D1BWP U654 ( .A1(RX_Data_Valid), .A2(RX_Ready), .B1(\state[0] ), .B2(
        n792), .ZN(n793) );
  OAI211D1BWP U655 ( .A1(n380), .A2(n729), .B(n3), .C(n381), .ZN(
        \rx_side/next_counter[4] ) );
  AOI21D1BWP U656 ( .A1(\rx_side/counter[3] ), .A2(n379), .B(n380), .ZN(n784)
         );
  OAI21D1BWP U657 ( .A1(n654), .A2(n653), .B(RX_Data[19]), .ZN(n650) );
  OAI211D1BWP U658 ( .A1(n751), .A2(\rx_side/N444 ), .B(n655), .C(n626), .ZN(
        n654) );
  IND2D1BWP U659 ( .A1(\rx_side/N609 ), .B1(n365), .ZN(n655) );
  AOI21D1BWP U660 ( .A1(\rx_side/N609 ), .A2(n386), .B(n652), .ZN(n651) );
  AO22D1BWP U661 ( .A1(\rx_side/N444 ), .A2(n361), .B1(\rx_side/N609 ), .B2(
        n666), .Z(n652) );
  ND3D1BWP U662 ( .A1(n628), .A2(n629), .A3(n630), .ZN(n273) );
  IND2D1BWP U663 ( .A1(\rx_side/N456 ), .B1(n631), .ZN(n630) );
  INR2D1BWP U664 ( .A1(RX_Data[31]), .B1(n756), .ZN(n631) );
  AOI21D1BWP U665 ( .A1(\rx_side/N456 ), .A2(n361), .B(n632), .ZN(n629) );
  AO22D1BWP U666 ( .A1(n633), .A2(RX_Data[31]), .B1(\rx_side/N221 ), .B2(n666), 
        .Z(n632) );
  OAI21D1BWP U667 ( .A1(\rx_side/N221 ), .A2(n369), .B(n634), .ZN(n633) );
  NR2XD0BWP U668 ( .A1(n734), .A2(n744), .ZN(\rx_side/N221 ) );
  IND2D1BWP U669 ( .A1(n751), .B1(RX_Data[31]), .ZN(n635) );
  OAI21D1BWP U670 ( .A1(n787), .A2(n786), .B(n3), .ZN(
        \rx_side/next_counter[1] ) );
  ND3D1BWP U671 ( .A1(n643), .A2(n644), .A3(n645), .ZN(n281) );
  IND2D1BWP U672 ( .A1(\rx_side/N448 ), .B1(n646), .ZN(n645) );
  INR2D1BWP U673 ( .A1(RX_Data[23]), .B1(n756), .ZN(n646) );
  AOI21D1BWP U674 ( .A1(\rx_side/N448 ), .A2(n361), .B(n647), .ZN(n644) );
  AO22D1BWP U675 ( .A1(n648), .A2(RX_Data[23]), .B1(\rx_side/N213 ), .B2(n364), 
        .Z(n647) );
  OAI21D1BWP U676 ( .A1(\rx_side/N213 ), .A2(n369), .B(n634), .ZN(n648) );
  IND2D1BWP U677 ( .A1(n751), .B1(RX_Data[23]), .ZN(n649) );
  ND3D1BWP U678 ( .A1(n636), .A2(n637), .A3(n638), .ZN(n274) );
  IND2D1BWP U679 ( .A1(\rx_side/N620 ), .B1(n639), .ZN(n638) );
  INR2D1BWP U680 ( .A1(RX_Data[30]), .B1(n756), .ZN(n639) );
  AOI21D1BWP U681 ( .A1(\rx_side/N620 ), .A2(n361), .B(n640), .ZN(n637) );
  AO22D1BWP U682 ( .A1(n641), .A2(RX_Data[30]), .B1(\rx_side/N220 ), .B2(n364), 
        .Z(n640) );
  OAI21D1BWP U683 ( .A1(\rx_side/N220 ), .A2(n369), .B(n626), .ZN(n641) );
  IND2D1BWP U684 ( .A1(n751), .B1(RX_Data[30]), .ZN(n642) );
  ND3D1BWP U685 ( .A1(n620), .A2(n621), .A3(n622), .ZN(n282) );
  IND2D1BWP U686 ( .A1(\rx_side/N612 ), .B1(n623), .ZN(n622) );
  INR2D1BWP U687 ( .A1(RX_Data[22]), .B1(n756), .ZN(n623) );
  AOI21D1BWP U688 ( .A1(\rx_side/N612 ), .A2(n361), .B(n624), .ZN(n621) );
  AO22D1BWP U689 ( .A1(n625), .A2(RX_Data[22]), .B1(\rx_side/N212 ), .B2(n362), 
        .Z(n624) );
  OAI21D1BWP U690 ( .A1(\rx_side/N212 ), .A2(n369), .B(n626), .ZN(n625) );
  IND2D1BWP U691 ( .A1(n751), .B1(RX_Data[22]), .ZN(n627) );
  OAI21D1BWP U692 ( .A1(n660), .A2(n659), .B(RX_Data[27]), .ZN(n656) );
  OAI211D1BWP U693 ( .A1(n751), .A2(\rx_side/N452 ), .B(n661), .C(n634), .ZN(
        n660) );
  IND2D1BWP U694 ( .A1(\rx_side/N217 ), .B1(n365), .ZN(n661) );
  AOI21D1BWP U695 ( .A1(\rx_side/N217 ), .A2(n754), .B(n658), .ZN(n657) );
  AO22D1BWP U696 ( .A1(\rx_side/N452 ), .A2(n361), .B1(\rx_side/N217 ), .B2(
        n362), .Z(n658) );
  NR2XD0BWP U697 ( .A1(n733), .A2(n744), .ZN(\rx_side/N217 ) );
  OAI21D1BWP U698 ( .A1(n787), .A2(n785), .B(n3), .ZN(
        \rx_side/next_counter[5] ) );
  AOI21D1BWP U699 ( .A1(\rx_side/counter[5] ), .A2(n381), .B(n382), .ZN(n785)
         );
  IND2D1BWP U700 ( .A1(n751), .B1(RX_Data[21]), .ZN(n690) );
  IND2D1BWP U701 ( .A1(n751), .B1(RX_Data[20]), .ZN(n699) );
  OAI211D1BWP U702 ( .A1(n683), .A2(n368), .B(n682), .C(n681), .ZN(n276) );
  OAI31D1BWP U703 ( .A1(n752), .A2(n680), .A3(n679), .B(RX_Data[28]), .ZN(n682) );
  ND3D1BWP U704 ( .A1(n513), .A2(n514), .A3(n515), .ZN(n303) );
  IND2D1BWP U705 ( .A1(\rx_side/N591 ), .B1(n516), .ZN(n515) );
  INR2D1BWP U706 ( .A1(RX_Data[1]), .B1(n756), .ZN(n516) );
  AOI21D1BWP U707 ( .A1(\rx_side/N591 ), .A2(n361), .B(n517), .ZN(n514) );
  OAI21D1BWP U708 ( .A1(n518), .A2(n519), .B(n520), .ZN(n517) );
  IND2D1BWP U709 ( .A1(n368), .B1(\rx_side/N191 ), .ZN(n520) );
  OA21D1BWP U710 ( .A1(\rx_side/N191 ), .A2(n757), .B(n626), .Z(n518) );
  IND2D1BWP U711 ( .A1(n751), .B1(RX_Data[1]), .ZN(n521) );
  ND3D1BWP U712 ( .A1(n522), .A2(n523), .A3(n524), .ZN(n296) );
  IND2D1BWP U713 ( .A1(\rx_side/N598 ), .B1(n525), .ZN(n524) );
  INR2D1BWP U714 ( .A1(RX_Data[8]), .B1(n756), .ZN(n525) );
  AOI21D1BWP U715 ( .A1(\rx_side/N598 ), .A2(n361), .B(n526), .ZN(n523) );
  OAI21D1BWP U716 ( .A1(n527), .A2(n528), .B(n529), .ZN(n526) );
  IND2D1BWP U717 ( .A1(n368), .B1(\rx_side/N198 ), .ZN(n529) );
  OA21D1BWP U718 ( .A1(\rx_side/N198 ), .A2(n757), .B(n366), .Z(n527) );
  IND2D1BWP U719 ( .A1(n749), .B1(RX_Data[8]), .ZN(n530) );
  ND3D1BWP U720 ( .A1(n560), .A2(n559), .A3(n558), .ZN(n266) );
  IAO21D1BWP U721 ( .A1(\rx_side/N628 ), .A2(n562), .B(n563), .ZN(n558) );
  OAI21D1BWP U722 ( .A1(\rx_side/N228 ), .A2(n564), .B(n565), .ZN(n563) );
  IND2D1BWP U723 ( .A1(n750), .B1(RX_Data[38]), .ZN(n562) );
  NR2XD0BWP U724 ( .A1(n738), .A2(n742), .ZN(\rx_side/N628 ) );
  ND3D1BWP U725 ( .A1(n553), .A2(n552), .A3(n551), .ZN(n258) );
  IAO21D1BWP U726 ( .A1(\rx_side/N471 ), .A2(n555), .B(n556), .ZN(n551) );
  OAI211D1BWP U727 ( .A1(n769), .A2(n368), .B(n768), .C(n767), .ZN(n275) );
  OAI31D1BWP U728 ( .A1(n367), .A2(n766), .A3(n765), .B(RX_Data[29]), .ZN(n768) );
  IND2D1BWP U729 ( .A1(n393), .B1(n675), .ZN(n298) );
  AOI21D1BWP U730 ( .A1(n676), .A2(RX_Data[6]), .B(n677), .ZN(n675) );
  AO22D1BWP U731 ( .A1(\rx_side/N596 ), .A2(n361), .B1(\rx_side/N596 ), .B2(
        n753), .Z(n677) );
  OAI21D1BWP U732 ( .A1(\rx_side/N596 ), .A2(n749), .B(n678), .ZN(n676) );
  OA21D1BWP U733 ( .A1(\rx_side/N596 ), .A2(n756), .B(n366), .Z(n678) );
  NR2XD0BWP U734 ( .A1(n742), .A2(n727), .ZN(\rx_side/N596 ) );
  OAI21D1BWP U735 ( .A1(n368), .A2(n762), .B(n674), .ZN(n393) );
  ND3D1BWP U736 ( .A1(n542), .A2(n543), .A3(n544), .ZN(n257) );
  IND2D1BWP U737 ( .A1(\rx_side/N637 ), .B1(n545), .ZN(n544) );
  INR2D1BWP U738 ( .A1(RX_Data[47]), .B1(n384), .ZN(n545) );
  AOI21D1BWP U739 ( .A1(\rx_side/N637 ), .A2(n361), .B(n546), .ZN(n543) );
  AO22D1BWP U740 ( .A1(n547), .A2(RX_Data[47]), .B1(\rx_side/N237 ), .B2(n362), 
        .Z(n546) );
  NR2XD0BWP U741 ( .A1(n712), .A2(n744), .ZN(\rx_side/N237 ) );
  OAI211D1BWP U742 ( .A1(n779), .A2(n782), .B(n778), .C(n777), .ZN(n260) );
  OAI31D1BWP U743 ( .A1(n752), .A2(n776), .A3(n775), .B(RX_Data[44]), .ZN(n778) );
  OAI21D1BWP U744 ( .A1(n532), .A2(n533), .B(n534), .ZN(n531) );
  IND2D1BWP U745 ( .A1(n368), .B1(\rx_side/N190 ), .ZN(n534) );
  OA21D1BWP U746 ( .A1(\rx_side/N190 ), .A2(n757), .B(n634), .Z(n532) );
  INR2D1BWP U747 ( .A1(\rx_side/N476 ), .B1(n591), .ZN(n458) );
  OAI211D1BWP U748 ( .A1(n774), .A2(n782), .B(n773), .C(n772), .ZN(n267) );
  OAI31D1BWP U749 ( .A1(n752), .A2(n771), .A3(n770), .B(RX_Data[37]), .ZN(n773) );
  IND2D1BWP U750 ( .A1(n363), .B1(\rx_side/N451 ), .ZN(n586) );
  AOI22D1BWP U751 ( .A1(n590), .A2(RX_Data[26]), .B1(\rx_side/N216 ), .B2(n362), .ZN(n589) );
  OAI21D1BWP U752 ( .A1(\rx_side/N216 ), .A2(n369), .B(n634), .ZN(n590) );
  NR2XD0BWP U753 ( .A1(n733), .A2(n360), .ZN(\rx_side/N216 ) );
  AOI21D1BWP U754 ( .A1(\rx_side/N449 ), .A2(n754), .B(n474), .ZN(n473) );
  AO22D1BWP U755 ( .A1(\rx_side/N449 ), .A2(n361), .B1(\rx_side/N214 ), .B2(
        n362), .Z(n474) );
  IAO21D1BWP U756 ( .A1(\rx_side/N214 ), .A2(n369), .B(n367), .ZN(n476) );
  AO22D1BWP U757 ( .A1(\rx_side/N450 ), .A2(n361), .B1(\rx_side/N215 ), .B2(
        n364), .Z(n471) );
  IAO21D1BWP U758 ( .A1(\rx_side/N215 ), .A2(n369), .B(n752), .ZN(n472) );
  AOI21D1BWP U759 ( .A1(\rx_side/N441 ), .A2(n386), .B(n478), .ZN(n477) );
  AO22D1BWP U760 ( .A1(\rx_side/N441 ), .A2(n361), .B1(\rx_side/N206 ), .B2(
        n666), .Z(n478) );
  IAO21D1BWP U761 ( .A1(\rx_side/N206 ), .A2(n369), .B(n367), .ZN(n480) );
  AOI21D1BWP U762 ( .A1(\rx_side/N442 ), .A2(n754), .B(n482), .ZN(n481) );
  AO22D1BWP U763 ( .A1(\rx_side/N442 ), .A2(n361), .B1(\rx_side/N207 ), .B2(
        n666), .Z(n482) );
  OA21D1BWP U764 ( .A1(\rx_side/N207 ), .A2(n369), .B(n626), .Z(n484) );
  OAI21D1BWP U765 ( .A1(n397), .A2(n398), .B(n399), .ZN(n268) );
  IAO21D1BWP U766 ( .A1(n403), .A2(n782), .B(n400), .ZN(n399) );
  IAO21D1BWP U767 ( .A1(\rx_side/N226 ), .A2(n369), .B(n401), .ZN(n397) );
  OAI211D1BWP U768 ( .A1(n384), .A2(\rx_side/N626 ), .B(n402), .C(n366), .ZN(
        n401) );
  IND2D1BWP U769 ( .A1(\rx_side/N461 ), .B1(n541), .ZN(n402) );
  OAI21D1BWP U770 ( .A1(n404), .A2(n405), .B(n406), .ZN(n259) );
  IAO21D1BWP U771 ( .A1(n410), .A2(n782), .B(n407), .ZN(n406) );
  IAO21D1BWP U772 ( .A1(\rx_side/N235 ), .A2(n757), .B(n408), .ZN(n404) );
  OAI211D1BWP U773 ( .A1(n384), .A2(\rx_side/N635 ), .B(n409), .C(n3), .ZN(
        n408) );
  IND2D1BWP U774 ( .A1(\rx_side/N470 ), .B1(n541), .ZN(n409) );
  IND2D1BWP U775 ( .A1(n749), .B1(RX_Data[14]), .ZN(n616) );
  AOI21D1BWP U776 ( .A1(\rx_side/N223 ), .A2(n364), .B(n444), .ZN(n443) );
  AO22D1BWP U777 ( .A1(\rx_side/N623 ), .A2(n386), .B1(\rx_side/N623 ), .B2(
        n361), .Z(n444) );
  NR2XD0BWP U778 ( .A1(n735), .A2(n743), .ZN(\rx_side/N623 ) );
  AOI21D1BWP U779 ( .A1(\rx_side/N222 ), .A2(n666), .B(n455), .ZN(n454) );
  AO22D1BWP U780 ( .A1(\rx_side/N622 ), .A2(n753), .B1(\rx_side/N622 ), .B2(
        n361), .Z(n455) );
  OA21D1BWP U781 ( .A1(\rx_side/N622 ), .A2(n384), .B(n457), .Z(n456) );
  IAO21D1BWP U782 ( .A1(\rx_side/N622 ), .A2(n751), .B(n367), .ZN(n457) );
  NR2XD0BWP U783 ( .A1(n735), .A2(n742), .ZN(\rx_side/N622 ) );
  AOI21D1BWP U784 ( .A1(\rx_side/N230 ), .A2(n362), .B(n449), .ZN(n448) );
  AO22D1BWP U785 ( .A1(\rx_side/N630 ), .A2(n386), .B1(\rx_side/N630 ), .B2(
        n361), .Z(n449) );
  OA21D1BWP U786 ( .A1(\rx_side/N630 ), .A2(n384), .B(n451), .Z(n450) );
  IAO21D1BWP U787 ( .A1(\rx_side/N630 ), .A2(n750), .B(n752), .ZN(n451) );
  NR2XD0BWP U788 ( .A1(n735), .A2(n360), .ZN(\rx_side/N630 ) );
  OA21D1BWP U789 ( .A1(\rx_side/N632 ), .A2(n750), .B(n366), .Z(n578) );
  NR2XD0BWP U790 ( .A1(n736), .A2(n360), .ZN(\rx_side/N632 ) );
  IND2D1BWP U791 ( .A1(n585), .B1(n581), .ZN(n270) );
  AOI21D1BWP U792 ( .A1(\rx_side/N624 ), .A2(n755), .B(n583), .ZN(n581) );
  AO22D1BWP U793 ( .A1(\rx_side/N224 ), .A2(n362), .B1(\rx_side/N624 ), .B2(
        n361), .Z(n583) );
  IND2D1BWP U794 ( .A1(n584), .B1(n582), .ZN(n585) );
  IND2D1BWP U795 ( .A1(n384), .B1(RX_Data[34]), .ZN(n580) );
  NR2XD0BWP U796 ( .A1(n736), .A2(n742), .ZN(\rx_side/N624 ) );
  IND2D1BWP U797 ( .A1(n574), .B1(n567), .ZN(n269) );
  AOI21D1BWP U798 ( .A1(\rx_side/N625 ), .A2(n754), .B(n572), .ZN(n567) );
  AO22D1BWP U799 ( .A1(\rx_side/N225 ), .A2(n364), .B1(\rx_side/N625 ), .B2(
        n361), .Z(n572) );
  IND2D1BWP U800 ( .A1(n573), .B1(n568), .ZN(n574) );
  OA21D1BWP U801 ( .A1(\rx_side/N625 ), .A2(n750), .B(n366), .Z(n571) );
  IND2D1BWP U802 ( .A1(n384), .B1(RX_Data[35]), .ZN(n566) );
  NR2XD0BWP U803 ( .A1(n736), .A2(n743), .ZN(\rx_side/N625 ) );
  OAI21D1BWP U804 ( .A1(n415), .A2(n416), .B(n417), .ZN(n300) );
  AOI21D1BWP U805 ( .A1(\rx_side/N429 ), .A2(n361), .B(n418), .ZN(n417) );
  IAO21D1BWP U806 ( .A1(\rx_side/N429 ), .A2(n749), .B(n419), .ZN(n415) );
  OAI21D1BWP U807 ( .A1(\rx_side/N594 ), .A2(n756), .B(n420), .ZN(n419) );
  IAO21D1BWP U808 ( .A1(\rx_side/N194 ), .A2(n757), .B(n367), .ZN(n420) );
  AOI21D1BWP U809 ( .A1(\rx_side/N644 ), .A2(n361), .B(n501), .ZN(n500) );
  AO22D1BWP U810 ( .A1(\rx_side/N644 ), .A2(n753), .B1(\rx_side/N244 ), .B2(
        n666), .Z(n501) );
  OAI21D1BWP U811 ( .A1(\rx_side/N644 ), .A2(n384), .B(n503), .ZN(n502) );
  IAO21D1BWP U812 ( .A1(\rx_side/N244 ), .A2(n757), .B(n367), .ZN(n503) );
  INR2D1BWP U813 ( .A1(n725), .B1(n724), .ZN(\rx_side/N244 ) );
  INR2D1BWP U814 ( .A1(n725), .B1(n724), .ZN(\rx_side/N644 ) );
  AOI21D1BWP U815 ( .A1(\rx_side/N640 ), .A2(n361), .B(n493), .ZN(n492) );
  AO22D1BWP U816 ( .A1(\rx_side/N640 ), .A2(n755), .B1(\rx_side/N240 ), .B2(
        n362), .Z(n493) );
  OAI21D1BWP U817 ( .A1(\rx_side/N640 ), .A2(n384), .B(n495), .ZN(n494) );
  IAO21D1BWP U818 ( .A1(\rx_side/N240 ), .A2(n757), .B(n367), .ZN(n495) );
  OAI21D1BWP U819 ( .A1(n485), .A2(n486), .B(n487), .ZN(n256) );
  AOI21D1BWP U820 ( .A1(\rx_side/N473 ), .A2(n361), .B(n488), .ZN(n487) );
  AO22D1BWP U821 ( .A1(\rx_side/N473 ), .A2(n755), .B1(n489), .B2(n364), .Z(
        n488) );
  IAO21D1BWP U822 ( .A1(\rx_side/N473 ), .A2(n749), .B(n490), .ZN(n485) );
  OAI21D1BWP U823 ( .A1(\rx_side/N473 ), .A2(n384), .B(n491), .ZN(n490) );
  IAO21D1BWP U824 ( .A1(n489), .A2(n757), .B(n367), .ZN(n491) );
  OAI21D1BWP U825 ( .A1(n464), .A2(n465), .B(n466), .ZN(n255) );
  AOI21D1BWP U826 ( .A1(\rx_side/N639 ), .A2(n361), .B(n467), .ZN(n466) );
  AO22D1BWP U827 ( .A1(\rx_side/N639 ), .A2(n755), .B1(\rx_side/N239 ), .B2(
        n362), .Z(n467) );
  IAO21D1BWP U828 ( .A1(\rx_side/N639 ), .A2(n749), .B(n468), .ZN(n464) );
  OAI21D1BWP U829 ( .A1(\rx_side/N639 ), .A2(n384), .B(n469), .ZN(n468) );
  IAO21D1BWP U830 ( .A1(\rx_side/N239 ), .A2(n757), .B(n367), .ZN(n469) );
  AOI21D1BWP U831 ( .A1(\rx_side/N477 ), .A2(n361), .B(n497), .ZN(n496) );
  AO22D1BWP U832 ( .A1(\rx_side/N477 ), .A2(n755), .B1(\rx_side/N242 ), .B2(
        n362), .Z(n497) );
  OAI21D1BWP U833 ( .A1(\rx_side/N477 ), .A2(n384), .B(n499), .ZN(n498) );
  IAO21D1BWP U834 ( .A1(\rx_side/N242 ), .A2(n757), .B(n367), .ZN(n499) );
  AOI21D1BWP U835 ( .A1(\rx_side/N430 ), .A2(n361), .B(n412), .ZN(n411) );
  OAI21D1BWP U836 ( .A1(\rx_side/N595 ), .A2(n756), .B(n414), .ZN(n413) );
  IAO21D1BWP U837 ( .A1(\rx_side/N195 ), .A2(n757), .B(n752), .ZN(n414) );
  AOI21D1BWP U838 ( .A1(\rx_side/N643 ), .A2(n361), .B(n461), .ZN(n460) );
  AO22D1BWP U839 ( .A1(\rx_side/N643 ), .A2(n755), .B1(\rx_side/N243 ), .B2(
        n362), .Z(n461) );
  OAI21D1BWP U840 ( .A1(\rx_side/N643 ), .A2(n384), .B(n463), .ZN(n462) );
  IAO21D1BWP U841 ( .A1(\rx_side/N243 ), .A2(n757), .B(n367), .ZN(n463) );
  IND2D1BWP U842 ( .A1(n750), .B1(RX_Data[7]), .ZN(n619) );
  OAI211D1BWP U843 ( .A1(\rx_side/N428 ), .A2(n599), .B(n601), .C(n600), .ZN(
        n301) );
  IAO21D1BWP U844 ( .A1(\rx_side/N428 ), .A2(n602), .B(n603), .ZN(n601) );
  IOA21D1BWP U845 ( .A1(\rx_side/N428 ), .A2(n753), .B(n604), .ZN(n603) );
  AOI22D1BWP U846 ( .A1(n605), .A2(RX_Data[3]), .B1(\rx_side/N193 ), .B2(n364), 
        .ZN(n604) );
  OAI21D1BWP U847 ( .A1(\rx_side/N193 ), .A2(n757), .B(n366), .ZN(n605) );
  NR2XD0BWP U848 ( .A1(n743), .A2(n708), .ZN(\rx_side/N193 ) );
  IND2D1BWP U849 ( .A1(n751), .B1(RX_Data[3]), .ZN(n599) );
  OAI21D1BWP U850 ( .A1(n432), .A2(n433), .B(n434), .ZN(n263) );
  AOI21D1BWP U851 ( .A1(\rx_side/N631 ), .A2(n386), .B(n435), .ZN(n434) );
  IOA21D1BWP U852 ( .A1(\rx_side/N631 ), .A2(n361), .B(n436), .ZN(n435) );
  IND2D1BWP U853 ( .A1(n368), .B1(n437), .ZN(n436) );
  OA21D1BWP U854 ( .A1(\rx_side/N631 ), .A2(n756), .B(n439), .Z(n432) );
  IAO21D1BWP U855 ( .A1(\rx_side/N631 ), .A2(n750), .B(n440), .ZN(n439) );
  NR2XD0BWP U856 ( .A1(n735), .A2(n744), .ZN(\rx_side/N631 ) );
  AOI21D1BWP U857 ( .A1(n538), .A2(RX_Data[43]), .B(n539), .ZN(n536) );
  OAI211D1BWP U858 ( .A1(\rx_side/N233 ), .A2(n369), .B(n540), .C(n366), .ZN(
        n538) );
  IND2D1BWP U859 ( .A1(\rx_side/N633 ), .B1(n541), .ZN(n540) );
  IND2D1BWP U860 ( .A1(n384), .B1(RX_Data[43]), .ZN(n535) );
  ND3D1BWP U861 ( .A1(n504), .A2(n505), .A3(n506), .ZN(n295) );
  IND2D1BWP U862 ( .A1(\rx_side/N599 ), .B1(n507), .ZN(n506) );
  INR2D1BWP U863 ( .A1(RX_Data[9]), .B1(n756), .ZN(n507) );
  AOI21D1BWP U864 ( .A1(\rx_side/N599 ), .A2(n361), .B(n508), .ZN(n505) );
  OAI21D1BWP U865 ( .A1(n509), .A2(n510), .B(n511), .ZN(n508) );
  IND2D1BWP U866 ( .A1(n368), .B1(\rx_side/N199 ), .ZN(n511) );
  IND2D1BWP U867 ( .A1(n751), .B1(RX_Data[9]), .ZN(n512) );
  OAI21D1BWP U868 ( .A1(n592), .A2(n593), .B(n594), .ZN(n302) );
  INR3D0BWP U869 ( .A1(n597), .B1(n596), .B2(n598), .ZN(n594) );
  IAO21D1BWP U870 ( .A1(\rx_side/N427 ), .A2(n749), .B(n595), .ZN(n592) );
  OAI21D1BWP U871 ( .A1(\rx_side/N427 ), .A2(n756), .B(n626), .ZN(n595) );
  IND3D1BWP U872 ( .A1(n426), .B1(n430), .B2(n431), .ZN(n291) );
  IND2D1BWP U873 ( .A1(n425), .B1(RX_Data[13]), .ZN(n431) );
  IAO21D1BWP U874 ( .A1(\rx_side/N438 ), .A2(n751), .B(n427), .ZN(n425) );
  OAI21D1BWP U875 ( .A1(\rx_side/N603 ), .A2(n756), .B(n428), .ZN(n427) );
  IAO21D1BWP U876 ( .A1(\rx_side/N203 ), .A2(n369), .B(n752), .ZN(n428) );
  AO22D1BWP U877 ( .A1(\rx_side/N603 ), .A2(n386), .B1(\rx_side/N203 ), .B2(
        n666), .Z(n426) );
  NR2XD0BWP U878 ( .A1(n716), .A2(n744), .ZN(\rx_side/N203 ) );
  AOI21D1BWP U879 ( .A1(\rx_side/N437 ), .A2(n361), .B(n422), .ZN(n421) );
  AO22D1BWP U880 ( .A1(\rx_side/N602 ), .A2(n386), .B1(\rx_side/N202 ), .B2(
        n666), .Z(n422) );
  OAI21D1BWP U881 ( .A1(\rx_side/N602 ), .A2(n756), .B(n424), .ZN(n423) );
  AOI21D1BWP U882 ( .A1(n365), .A2(n764), .B(n367), .ZN(n424) );
  IND2D1BWP U883 ( .A1(n671), .B1(n669), .ZN(n293) );
  AOI21D1BWP U884 ( .A1(\rx_side/N436 ), .A2(n386), .B(n670), .ZN(n669) );
  AO22D1BWP U885 ( .A1(\rx_side/N436 ), .A2(n361), .B1(\rx_side/N201 ), .B2(
        n666), .Z(n670) );
  AOI21D1BWP U886 ( .A1(n672), .A2(n373), .B(n673), .ZN(n671) );
  IAO21D1BWP U887 ( .A1(\rx_side/N436 ), .A2(n749), .B(n377), .ZN(n672) );
  AOI21D1BWP U888 ( .A1(\rx_side/N605 ), .A2(n361), .B(n388), .ZN(n390) );
  IAO21D1BWP U889 ( .A1(\rx_side/N605 ), .A2(n750), .B(n389), .ZN(n391) );
  OAI211D1BWP U890 ( .A1(\rx_side/N205 ), .A2(n369), .B(n387), .C(n626), .ZN(
        n389) );
  IND4D1BWP U891 ( .A1(\rx_side/start_seq[5] ), .B1(\rx_side/start_seq[1] ), 
        .B2(\rx_side/start_seq[4] ), .B3(\rx_side/start_seq[0] ), .ZN(n758) );
  NR2XD0BWP U892 ( .A1(n727), .A2(n744), .ZN(\rx_side/N605 ) );
  OR2XD1BWP U893 ( .A1(\rx_side/N436 ), .A2(n756), .Z(n373) );
  OA211D1BWP U894 ( .A1(n378), .A2(n702), .B(n3), .C(n379), .Z(n374) );
  OR2XD1BWP U895 ( .A1(n708), .A2(n742), .Z(n376) );
  AO21D1BWP U896 ( .A1(n763), .A2(n791), .B(n367), .Z(n377) );
  OAI22D1BWP U897 ( .A1(\rx_side/N462 ), .A2(n750), .B1(\rx_side/N627 ), .B2(
        n384), .ZN(n771) );
  OAI22D1BWP U898 ( .A1(\rx_side/N469 ), .A2(n750), .B1(\rx_side/N634 ), .B2(
        n384), .ZN(n776) );
  AO22D1BWP U899 ( .A1(\rx_side/N205 ), .A2(n666), .B1(\rx_side/N605 ), .B2(
        n386), .Z(n388) );
  AOI22D1BWP U900 ( .A1(n615), .A2(RX_Data[14]), .B1(\rx_side/N439 ), .B2(n386), .ZN(n614) );
  OAI21D1BWP U901 ( .A1(n392), .A2(n391), .B(n390), .ZN(n289) );
  AO22D1BWP U902 ( .A1(\rx_side/N595 ), .A2(n753), .B1(\rx_side/N195 ), .B2(
        n364), .Z(n412) );
  AO22D1BWP U903 ( .A1(\rx_side/N626 ), .A2(n755), .B1(\rx_side/N461 ), .B2(
        n361), .Z(n400) );
  AO22D1BWP U904 ( .A1(\rx_side/N635 ), .A2(n755), .B1(\rx_side/N470 ), .B2(
        n361), .Z(n407) );
  AO22D1BWP U905 ( .A1(\rx_side/N594 ), .A2(n753), .B1(\rx_side/N194 ), .B2(
        n364), .Z(n418) );
  OAI21D1BWP U906 ( .A1(n441), .A2(n442), .B(n443), .ZN(n271) );
  OA21D1BWP U907 ( .A1(\rx_side/N223 ), .A2(n369), .B(n445), .Z(n441) );
  OAI21D1BWP U908 ( .A1(n446), .A2(n447), .B(n448), .ZN(n264) );
  OA21D1BWP U909 ( .A1(\rx_side/N230 ), .A2(n757), .B(n450), .Z(n446) );
  OAI21D1BWP U910 ( .A1(n452), .A2(n453), .B(n454), .ZN(n272) );
  OA21D1BWP U911 ( .A1(\rx_side/N222 ), .A2(n369), .B(n456), .Z(n452) );
  OAI21D1BWP U912 ( .A1(\rx_side/N449 ), .A2(n756), .B(n476), .ZN(n475) );
  OAI21D1BWP U913 ( .A1(\rx_side/N442 ), .A2(n756), .B(n484), .ZN(n483) );
  OAI211D1BWP U914 ( .A1(\rx_side/N633 ), .A2(n535), .B(n536), .C(n537), .ZN(
        n261) );
  IND2D1BWP U915 ( .A1(n591), .B1(\rx_side/N633 ), .ZN(n537) );
  AOI22D1BWP U916 ( .A1(\rx_side/N471 ), .A2(n755), .B1(\rx_side/N236 ), .B2(
        n362), .ZN(n553) );
  OA21D1BWP U917 ( .A1(n554), .A2(\rx_side/N471 ), .B(n557), .Z(n552) );
  AOI22D1BWP U918 ( .A1(\rx_side/N628 ), .A2(n754), .B1(\rx_side/N228 ), .B2(
        n364), .ZN(n560) );
  IND2D1BWP U919 ( .A1(n569), .B1(n570), .ZN(n568) );
  OAI21D1BWP U920 ( .A1(\rx_side/N225 ), .A2(n369), .B(n571), .ZN(n570) );
  IND2D1BWP U921 ( .A1(n576), .B1(n577), .ZN(n575) );
  OAI21D1BWP U922 ( .A1(\rx_side/N232 ), .A2(n757), .B(n578), .ZN(n577) );
  IND2D1BWP U923 ( .A1(n591), .B1(\rx_side/N216 ), .ZN(n588) );
  IND2D1BWP U924 ( .A1(n591), .B1(\rx_side/N427 ), .ZN(n597) );
  IND2D1BWP U925 ( .A1(n363), .B1(\rx_side/N428 ), .ZN(n600) );
  OAI21D1BWP U926 ( .A1(\rx_side/N208 ), .A2(n609), .B(n610), .ZN(n608) );
  MUX2D1BWP U927 ( .I0(n611), .I1(n692), .S(\rx_side/N208 ), .Z(n606) );
  OAI21D1BWP U928 ( .A1(\rx_side/N439 ), .A2(n756), .B(n366), .ZN(n615) );
  ND3D1BWP U929 ( .A1(n612), .A2(n613), .A3(n614), .ZN(n290) );
  MUX2D1BWP U930 ( .I0(n616), .I1(n363), .S(\rx_side/N439 ), .Z(n613) );
  OAI21D1BWP U931 ( .A1(\rx_side/N432 ), .A2(n756), .B(n366), .ZN(n618) );
  AOI22D1BWP U932 ( .A1(n665), .A2(RX_Data[10]), .B1(\rx_side/N200 ), .B2(n666), .ZN(n664) );
  OAI21D1BWP U933 ( .A1(\rx_side/N200 ), .A2(n757), .B(n366), .ZN(n665) );
  OAI21D1BWP U934 ( .A1(\rx_side/N435 ), .A2(n663), .B(n664), .ZN(n662) );
  OAI22D1BWP U935 ( .A1(\rx_side/N218 ), .A2(n751), .B1(\rx_side/N618 ), .B2(
        n756), .ZN(n680) );
  AOI22D1BWP U936 ( .A1(n754), .A2(\rx_side/N618 ), .B1(\rx_side/N218 ), .B2(
        n361), .ZN(n681) );
  AOI21D1BWP U937 ( .A1(\rx_side/N446 ), .A2(n364), .B(n687), .ZN(n686) );
  OAI21D1BWP U938 ( .A1(\rx_side/N446 ), .A2(n688), .B(n689), .ZN(n687) );
  MUX2D1BWP U939 ( .I0(n691), .I1(n692), .S(\rx_side/N611 ), .Z(n684) );
  MUX2D1BWP U940 ( .I0(n690), .I1(n363), .S(\rx_side/N446 ), .Z(n685) );
  ND3D1BWP U941 ( .A1(n686), .A2(n684), .A3(n685), .ZN(n283) );
  AOI21D1BWP U942 ( .A1(\rx_side/N210 ), .A2(n364), .B(n696), .ZN(n695) );
  OAI21D1BWP U943 ( .A1(\rx_side/N210 ), .A2(n697), .B(n698), .ZN(n696) );
  MUX2D1BWP U944 ( .I0(n700), .I1(n692), .S(\rx_side/N610 ), .Z(n693) );
  MUX2D1BWP U945 ( .I0(n699), .I1(n363), .S(\rx_side/N210 ), .Z(n694) );
  ND3D1BWP U946 ( .A1(n695), .A2(n693), .A3(n694), .ZN(n284) );
  NR2XD0BWP U947 ( .A1(n744), .A2(n708), .ZN(\rx_side/N201 ) );
  NR2XD0BWP U948 ( .A1(n736), .A2(n744), .ZN(\rx_side/N633 ) );
  AOI22D1BWP U949 ( .A1(n754), .A2(\rx_side/N619 ), .B1(\rx_side/N454 ), .B2(
        n361), .ZN(n767) );
  OAI22D1BWP U950 ( .A1(\rx_side/N454 ), .A2(n751), .B1(\rx_side/N619 ), .B2(
        n756), .ZN(n766) );
  NR2XD0BWP U951 ( .A1(n706), .A2(n744), .ZN(\rx_side/N619 ) );
  AOI22D1BWP U952 ( .A1(n386), .A2(\rx_side/N627 ), .B1(\rx_side/N462 ), .B2(
        n361), .ZN(n772) );
  NR2XD0BWP U953 ( .A1(n737), .A2(n743), .ZN(\rx_side/N627 ) );
  AOI22D1BWP U954 ( .A1(n755), .A2(\rx_side/N634 ), .B1(\rx_side/N469 ), .B2(
        n361), .ZN(n777) );
  NR2XD0BWP U955 ( .A1(n744), .A2(n718), .ZN(\rx_side/N199 ) );
  NR3D0BWP U956 ( .A1(\rx_side/counter[3] ), .A2(n729), .A3(n739), .ZN(n741)
         );
endmodule

