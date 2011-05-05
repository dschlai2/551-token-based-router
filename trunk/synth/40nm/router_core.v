
module router_core_ps ( RX_Data, Clk_R, Rst_n, RX_Data_Valid, TX_Data_Ready, 
        Packet_From_Node_Valid, Packet_From_Node, r_addr, Core_Load_Ack, 
        Packet_To_Node_Valid, RX_Data_Ready, TX_Data_Valid, TX_Data, 
        Packet_To_Node );
  input [54:0] RX_Data;
  input [28:0] Packet_From_Node;
  input [3:0] r_addr;
  output [54:0] TX_Data;
  output [23:0] Packet_To_Node;
  input Clk_R, Rst_n, RX_Data_Valid, TX_Data_Ready, Packet_From_Node_Valid;
  output Core_Load_Ack, Packet_To_Node_Valid, RX_Data_Ready, TX_Data_Valid;
  wire   \rHandshake/next_state[1] , \rHandshake/next_state[0] ,
         \rHandshake/state[0] , \rHandshake/state[1] , \tHandshake/N12 ,
         \tHandshake/next_state[1] , \tHandshake/next_state[0] ,
         \tHandshake/state[0] , \dec_logic/token ,
         \dec_logic/three_six_load[11] , \dec_logic/three_six_load[10] ,
         \dec_logic/three_six_load[9] , \dec_logic/three_six_load[8] ,
         \dec_logic/three_six_load[7] , \dec_logic/three_six_load[6] ,
         \dec_logic/three_six_load[5] , \dec_logic/three_six_load[4] ,
         \dec_logic/three_six_load[3] , \dec_logic/three_six_load[2] ,
         \dec_logic/three_six_load[1] , \dec_logic/three_six_load[0] ,
         \dec_logic/raw[0] , \dec_logic/raw[1] , \dec_logic/raw[2] ,
         \dec_logic/raw[6] , \dec_logic/raw[7] , \dec_logic/raw[8] ,
         \dec_logic/raw[12] , \dec_logic/raw[13] , \dec_logic/raw[14] ,
         \dec_logic/raw[18] , \dec_logic/raw[19] , \dec_logic/raw[20] ,
         \enc_logic/checksum[27] , \enc_logic/checksum[26] ,
         \enc_logic/checksum[25] , \enc_logic/checksum[24] ,
         \enc_logic/checksum[23] , \enc_logic/checksum[22] ,
         \enc_logic/checksum[21] , \enc_logic/checksum[20] ,
         \enc_logic/checksum[19] , \enc_logic/checksum[18] ,
         \enc_logic/checksum[17] , \enc_logic/checksum[16] ,
         \enc_logic/checksum[15] , \enc_logic/checksum[14] ,
         \enc_logic/checksum[13] , \enc_logic/checksum[12] ,
         \enc_logic/checksum[11] , \enc_logic/checksum[10] ,
         \enc_logic/checksum[9] , \enc_logic/checksum[8] ,
         \enc_logic/checksum[7] , \enc_logic/checksum[6] ,
         \enc_logic/checksum[5] , \enc_logic/encode_type ,
         \main_control/next_state[3] , \main_control/next_state[2] ,
         \main_control/next_state[1] , \main_control/state[1] ,
         \main_control/state[2] , \main_control/state[3] ,
         \dec_logic/checksum/check[27] , \dec_logic/checksum/check[26] ,
         \dec_logic/checksum/check[25] , \dec_logic/checksum/check[24] ,
         \dec_logic/checksum/check[23] , \dec_logic/checksum/check[22] ,
         \dec_logic/checksum/check[21] , \dec_logic/checksum/check[20] ,
         \dec_logic/checksum/check[19] , \dec_logic/checksum/check[18] ,
         \dec_logic/checksum/check[17] , \dec_logic/checksum/check[16] ,
         \dec_logic/checksum/check[15] , \dec_logic/checksum/check[14] ,
         \dec_logic/checksum/check[13] , \dec_logic/checksum/check[12] ,
         \dec_logic/checksum/check[11] , \dec_logic/checksum/check[10] ,
         \dec_logic/checksum/check[9] , \dec_logic/checksum/check[8] ,
         \dec_logic/checksum/check[7] , \dec_logic/checksum/check[6] ,
         \dec_logic/checksum/check[5] , \enc_logic/check/N25 ,
         \dec_logic/checksum/encoder/N25 , n4, n5, n78, n79, n80, n86, n432,
         n433, n434, n435, n436, n437, n438, n439, n440, n441, n442, n443,
         n444, n445, n446, n447, n448, n449, n450, n451, n452, n453, n454,
         n455, n456, n457, n458, n459, n460, n461, n462, n463, n464, n465,
         n466, n467, n468, n469, n470, n471, n472, n473, n474, n475, n476,
         n477, n478, n479, n480, n482, n483, n484, n485, n486, n487, n488,
         n489, n490, n491, n492, n493, n494, n495, n496, n497, n498, n499,
         n500, n501, n502, n503, n504, n505, n506, n507, n508, n509, n510,
         n511, n512, n513, n514, n515, n516, n517, n518, n519, n520, n521,
         n522, n523, n524, n525, n526, n527, n528, n529, n530, n531, n532,
         n533, n534, n535, n536, n537, n538, n539, n540, n541, n542, n543,
         n544, n545, n546, n547, n548, n549, n550, n551, n552, n553, n554,
         n555, n556, n557, n558, n559, n560, n561, n562, n563, n564, n565,
         n566, n567, n568, n569, n570, n571, n572, n573, n574, n575, n576,
         n577, n578, n579, n580, n581, n585, n586, n587, n588, n589, n590,
         n591, n592, n593, n594, n595, n596, n597, n598, n599, n600, n601,
         n602, n603, n604, n605, n606, n607, n608, n609, n610, n611, n612,
         n613, n614, n615, n616, n617, n618, n619, n620, n621, n622, n623,
         n624, n625, n626, n627, n628, n629, n630, n631, n632, n633, n634,
         n635, n636, n637, n638, n639, n640, n641, n642, n643, n644, n645,
         n646, n647, n648, n649, n650, n651, n652, n653, n654, n655, n656,
         n657, n658, n659, n660, n661, n662, n663, n664, n665, n666, n667,
         n668, n669, n670, n671, n672, n673, n674, n675, n676, n677, n678,
         n679, n680, n681, n682, n683, n684, n685, n686, n687, n688, n689,
         n690, n691, n692, n693, n694, n695, n696, n697, n698, n699, n700,
         n701, n702, n703, n704, n705, n706, n707, n708, n709, n710, n711,
         n712, n713, n714, n715, n716, n717, n718, n719, n720, n721, n722,
         n723, n724, n725, n726, n727, n728, n729, n730, n731, n732, n733,
         n734, n735, n736, n737, n738, n739, n740, n741, n742, n743, n744,
         n745, n746, n747, n748, n749, n750, n751, n752, n753, n754, n755,
         n756, n757, n758, n759, n760, n761, n762, n763, n764, n765, n766,
         n767, n768, n769, n770, n771, n772, n773, n774, n775, n776, n777,
         n778, n779, n780, n781, n782, n783, n784, n785, n786, n787, n788,
         n789, n790, n791, n792, n793, n794, n795, n796, n797, n798, n799,
         n800, n801, n802, n803, n804, n805, n806, n807, n808, n809, n810,
         n811, n812, n813, n814, n815, n816, n817, n818, n819, n820, n821,
         n822, n823, n824, n825, n826, n827, n828, n829, n830, n831, n832,
         n833, n834, n835, n836, n837, n838, n839, n840, n841, n842, n843,
         n844, n845, n846, n847, n848, n849, n850, n851, n852, n853, n854,
         n855, n856, n857, n858, n859, n860, n861, n862, n863, n864, n865,
         n866, n867, n868, n869, n870, n871, n872, n873, n874, n875, n876,
         n877, n878, n879, n880, n881, n882, n883, n884, n885, n886, n887,
         n888, n889, n890, n891, n892, n893, n894, n895, n896, n897, n898,
         n899, n900, n901, n902, n903, n904, n905, n906, n907, n908, n909,
         n910, n911, n912, n913, n914, n915, n916, n917, n918, n919, n920,
         n921, n922, n923, n924, n925, n926, n927, n928, n929, n930, n931,
         n932, n933, n934, n935, n936, n937, n938, n939, n940, n941, n942,
         n943, n944, n945, n946, n947, n948, n949, n950, n951, n952, n953,
         n954, n955, n956, n957, n958, n959, n960, n961, n962, n963, n964,
         n965, n966, n967, n968, n969, n970, n971, n972, n973, n974, n975,
         n976, n977, n978, n979, n980, n981, n982, n983, n984, n985, n986,
         n987, n988, n989, n990, n991, n992, n993, n994, n995, n996, n997,
         n998, n999, n1000, n1001, n1002, n1003, n1004, n1005, n1006, n1007,
         n1008, n1009, n1010, n1011, n1012, n1013, n1014, n1015, n1016, n1017,
         n1018, n1019, n1020, n1021, n1022, n1023, n1024, n1025, n1026, n1027,
         n1028, n1029, n1030, n1031, n1032, n1033, n1034, n1035, n1036, n1037,
         n1038, n1039, n1040, n1041, n1042, n1043, n1044, n1045, n1046, n1047,
         n1048, n1049, n1050, n1051, n1052, n1053, n1054, n1055, n1056, n1057,
         n1058, n1059, n1060, n1061, n1062, n1063, n1064, n1065, n1066, n1067,
         n1068, n1069, n1070, n1071, n1072, n1073, n1074, n1075, n1076, n1077,
         n1078, n1079, n1080, n1081, n1082, n1083, n1084, n1085, n1086, n1087,
         n1088, n1089, n1090, n1091, n1092, n1093, n1094, n1095, n1096, n1097,
         n1098, n1099, n1100, n1101, n1102, n1103, n1104, n1105, n1106, n1107,
         n1108, n1109, n1110, n1111, n1112, n1113, n1114, n1115, n1116, n1117,
         n1118, n1119;
  wire   [54:0] data_to_tx;
  wire   [3:0] address;
  wire   [2:0] data_type;
  wire   [54:0] enc_to_buf;
  wire   [54:0] buf_to_mux;
  wire   [2:0] tx_data_select;
  assign address[3] = RX_Data[51];
  assign address[2] = RX_Data[50];
  assign address[1] = RX_Data[49];
  assign address[0] = RX_Data[48];
  assign data_type[1] = RX_Data[53];
  assign data_type[0] = RX_Data[52];
  assign enc_to_buf[51] = Packet_From_Node[28];
  assign enc_to_buf[50] = Packet_From_Node[27];
  assign enc_to_buf[49] = Packet_From_Node[26];
  assign enc_to_buf[48] = Packet_From_Node[25];
  assign \dec_logic/token  = RX_Data[54];
  assign \dec_logic/three_six_load[11]  = RX_Data[23];
  assign \dec_logic/three_six_load[10]  = RX_Data[22];
  assign \dec_logic/three_six_load[9]  = RX_Data[21];
  assign \dec_logic/three_six_load[8]  = RX_Data[17];
  assign \dec_logic/three_six_load[7]  = RX_Data[16];
  assign \dec_logic/three_six_load[6]  = RX_Data[15];
  assign \dec_logic/three_six_load[5]  = RX_Data[11];
  assign \dec_logic/three_six_load[4]  = RX_Data[10];
  assign \dec_logic/three_six_load[3]  = RX_Data[9];
  assign \dec_logic/three_six_load[2]  = RX_Data[5];
  assign \dec_logic/three_six_load[1]  = RX_Data[4];
  assign \dec_logic/three_six_load[0]  = RX_Data[3];
  assign \dec_logic/raw[0]  = RX_Data[0];
  assign \dec_logic/raw[1]  = RX_Data[1];
  assign \dec_logic/raw[2]  = RX_Data[2];
  assign \dec_logic/raw[6]  = RX_Data[6];
  assign \dec_logic/raw[7]  = RX_Data[7];
  assign \dec_logic/raw[8]  = RX_Data[8];
  assign \dec_logic/raw[12]  = RX_Data[12];
  assign \dec_logic/raw[13]  = RX_Data[13];
  assign \dec_logic/raw[14]  = RX_Data[14];
  assign \dec_logic/raw[18]  = RX_Data[18];
  assign \dec_logic/raw[19]  = RX_Data[19];
  assign \dec_logic/raw[20]  = RX_Data[20];
  assign \enc_logic/checksum[27]  = Packet_From_Node[23];
  assign \enc_logic/checksum[26]  = Packet_From_Node[22];
  assign \enc_logic/checksum[25]  = Packet_From_Node[21];
  assign \enc_logic/checksum[24]  = Packet_From_Node[20];
  assign \enc_logic/checksum[23]  = Packet_From_Node[19];
  assign \enc_logic/checksum[22]  = Packet_From_Node[18];
  assign \enc_logic/checksum[21]  = Packet_From_Node[17];
  assign \enc_logic/checksum[20]  = Packet_From_Node[16];
  assign \enc_logic/checksum[19]  = Packet_From_Node[15];
  assign \enc_logic/checksum[18]  = Packet_From_Node[14];
  assign \enc_logic/checksum[17]  = Packet_From_Node[13];
  assign \enc_logic/checksum[16]  = Packet_From_Node[12];
  assign \enc_logic/checksum[15]  = Packet_From_Node[11];
  assign \enc_logic/checksum[14]  = Packet_From_Node[10];
  assign \enc_logic/checksum[13]  = Packet_From_Node[9];
  assign \enc_logic/checksum[12]  = Packet_From_Node[8];
  assign \enc_logic/checksum[11]  = Packet_From_Node[7];
  assign \enc_logic/checksum[10]  = Packet_From_Node[6];
  assign \enc_logic/checksum[9]  = Packet_From_Node[5];
  assign \enc_logic/checksum[8]  = Packet_From_Node[4];
  assign \enc_logic/checksum[7]  = Packet_From_Node[3];
  assign \enc_logic/checksum[6]  = Packet_From_Node[2];
  assign \enc_logic/checksum[5]  = Packet_From_Node[1];
  assign \enc_logic/encode_type  = Packet_From_Node[24];
  assign \dec_logic/checksum/check[27]  = RX_Data[47];
  assign \dec_logic/checksum/check[26]  = RX_Data[46];
  assign \dec_logic/checksum/check[25]  = RX_Data[45];
  assign \dec_logic/checksum/check[24]  = RX_Data[44];
  assign \dec_logic/checksum/check[23]  = RX_Data[43];
  assign \dec_logic/checksum/check[22]  = RX_Data[42];
  assign \dec_logic/checksum/check[21]  = RX_Data[41];
  assign \dec_logic/checksum/check[20]  = RX_Data[40];
  assign \dec_logic/checksum/check[19]  = RX_Data[39];
  assign \dec_logic/checksum/check[18]  = RX_Data[38];
  assign \dec_logic/checksum/check[17]  = RX_Data[37];
  assign \dec_logic/checksum/check[16]  = RX_Data[36];
  assign \dec_logic/checksum/check[15]  = RX_Data[35];
  assign \dec_logic/checksum/check[14]  = RX_Data[34];
  assign \dec_logic/checksum/check[13]  = RX_Data[33];
  assign \dec_logic/checksum/check[12]  = RX_Data[32];
  assign \dec_logic/checksum/check[11]  = RX_Data[31];
  assign \dec_logic/checksum/check[10]  = RX_Data[30];
  assign \dec_logic/checksum/check[9]  = RX_Data[29];
  assign \dec_logic/checksum/check[8]  = RX_Data[28];
  assign \dec_logic/checksum/check[7]  = RX_Data[27];
  assign \dec_logic/checksum/check[6]  = RX_Data[26];
  assign \dec_logic/checksum/check[5]  = RX_Data[25];
  assign \enc_logic/check/N25  = Packet_From_Node[0];
  assign \dec_logic/checksum/encoder/N25  = RX_Data[24];

  DFCNQD1BWP \main_control/state_reg[3]  ( .D(\main_control/next_state[3] ), 
        .CP(Clk_R), .CDN(Rst_n), .Q(\main_control/state[3] ) );
  DFCNQD1BWP \main_control/state_reg[2]  ( .D(\main_control/next_state[2] ), 
        .CP(Clk_R), .CDN(Rst_n), .Q(\main_control/state[2] ) );
  DFCNQD1BWP \main_control/state_reg[1]  ( .D(\main_control/next_state[1] ), 
        .CP(Clk_R), .CDN(Rst_n), .Q(\main_control/state[1] ) );
  DFCNQD1BWP \rHandshake/state_reg[1]  ( .D(\rHandshake/next_state[1] ), .CP(
        Clk_R), .CDN(Rst_n), .Q(\rHandshake/state[1] ) );
  DFCNQD1BWP \tHandshake/state_reg[0]  ( .D(\tHandshake/next_state[0] ), .CP(
        Clk_R), .CDN(Rst_n), .Q(\tHandshake/state[0] ) );
  DFCNQD1BWP \tHandshake/state_reg[1]  ( .D(\tHandshake/next_state[1] ), .CP(
        Clk_R), .CDN(Rst_n), .Q(TX_Data_Valid) );
  EDFCNQD1BWP \ever_versetile/out_reg[51]  ( .D(enc_to_buf[51]), .E(n86), .CP(
        Clk_R), .CDN(Rst_n), .Q(buf_to_mux[51]) );
  EDFCNQD1BWP \ever_versetile/out_reg[50]  ( .D(enc_to_buf[50]), .E(n86), .CP(
        Clk_R), .CDN(Rst_n), .Q(buf_to_mux[50]) );
  EDFCNQD1BWP \ever_versetile/out_reg[49]  ( .D(enc_to_buf[49]), .E(n86), .CP(
        Clk_R), .CDN(Rst_n), .Q(buf_to_mux[49]) );
  EDFCNQD1BWP \ever_versetile/out_reg[48]  ( .D(enc_to_buf[48]), .E(n86), .CP(
        Clk_R), .CDN(Rst_n), .Q(buf_to_mux[48]) );
  DFCNQD1BWP \ever_versetile/out_reg[53]  ( .D(n432), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[53]) );
  DFCNQD1BWP \ever_versetile/out_reg[44]  ( .D(n433), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[44]) );
  DFCNQD1BWP \ever_versetile/out_reg[43]  ( .D(n434), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[43]) );
  DFCNQD1BWP \ever_versetile/out_reg[42]  ( .D(n435), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[42]) );
  DFCNQD1BWP \ever_versetile/out_reg[36]  ( .D(n441), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[36]) );
  DFCNQD1BWP \ever_versetile/out_reg[30]  ( .D(n447), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[30]) );
  DFCNQD1BWP \ever_versetile/out_reg[24]  ( .D(n453), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[24]) );
  DFCNQD1BWP \ever_versetile/out_reg[17]  ( .D(n460), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[17]) );
  DFCNQD1BWP \ever_versetile/out_reg[16]  ( .D(n461), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[16]) );
  DFCNQD1BWP \ever_versetile/out_reg[15]  ( .D(n462), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[15]) );
  DFCNQD1BWP \ever_versetile/out_reg[14]  ( .D(n463), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[14]) );
  DFCNQD1BWP \ever_versetile/out_reg[11]  ( .D(n466), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[11]) );
  DFCNQD1BWP \ever_versetile/out_reg[10]  ( .D(n467), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[10]) );
  DFCNQD1BWP \ever_versetile/out_reg[9]  ( .D(n468), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[9]) );
  DFCNQD1BWP \ever_versetile/out_reg[8]  ( .D(n469), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[8]) );
  DFCNQD1BWP \ever_versetile/out_reg[5]  ( .D(n472), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[5]) );
  DFCNQD1BWP \ever_versetile/out_reg[4]  ( .D(n473), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[4]) );
  DFCNQD1BWP \ever_versetile/out_reg[3]  ( .D(n474), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[3]) );
  DFCNQD1BWP \ever_versetile/out_reg[2]  ( .D(n475), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[2]) );
  DFCNQD1BWP \ever_versetile/out_reg[0]  ( .D(n477), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[0]) );
  DFCNQD1BWP \ever_versetile/out_reg[7]  ( .D(n470), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[7]) );
  DFCNQD1BWP \ever_versetile/out_reg[6]  ( .D(n471), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[6]) );
  DFCNQD1BWP \ever_versetile/out_reg[13]  ( .D(n464), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[13]) );
  DFCNQD1BWP \ever_versetile/out_reg[12]  ( .D(n465), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[12]) );
  DFCNQD1BWP \ever_versetile/out_reg[18]  ( .D(n459), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[18]) );
  DFCNQD1BWP \ever_versetile/out_reg[19]  ( .D(n458), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[19]) );
  DFCNQD1BWP \ever_versetile/out_reg[21]  ( .D(n456), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[21]) );
  DFCNQD1BWP \ever_versetile/out_reg[26]  ( .D(n451), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[26]) );
  DFCNQD1BWP \ever_versetile/out_reg[25]  ( .D(n452), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[25]) );
  DFCNQD1BWP \ever_versetile/out_reg[27]  ( .D(n450), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[27]) );
  DFCNQD1BWP \ever_versetile/out_reg[28]  ( .D(n449), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[28]) );
  DFCNQD1BWP \ever_versetile/out_reg[29]  ( .D(n448), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[29]) );
  DFCNQD1BWP \ever_versetile/out_reg[32]  ( .D(n445), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[32]) );
  DFCNQD1BWP \ever_versetile/out_reg[31]  ( .D(n446), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[31]) );
  DFCNQD1BWP \ever_versetile/out_reg[33]  ( .D(n444), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[33]) );
  DFCNQD1BWP \ever_versetile/out_reg[34]  ( .D(n443), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[34]) );
  DFCNQD1BWP \ever_versetile/out_reg[35]  ( .D(n442), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[35]) );
  DFCNQD1BWP \ever_versetile/out_reg[38]  ( .D(n439), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[38]) );
  DFCNQD1BWP \ever_versetile/out_reg[37]  ( .D(n440), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[37]) );
  DFCNQD1BWP \ever_versetile/out_reg[39]  ( .D(n438), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[39]) );
  DFCNQD1BWP \ever_versetile/out_reg[40]  ( .D(n437), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[40]) );
  DFCNQD1BWP \ever_versetile/out_reg[41]  ( .D(n436), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[41]) );
  EDFCNQD1BWP \ever_versetile/out_reg[52]  ( .D(\enc_logic/encode_type ), .E(
        n86), .CP(Clk_R), .CDN(Rst_n), .Q(buf_to_mux[52]) );
  DFCNQD1BWP \ever_versetile/out_reg[1]  ( .D(n476), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[1]) );
  DFCNQD1BWP \ever_versetile/out_reg[20]  ( .D(n457), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[20]) );
  DFCNQD1BWP \main_control/select_sig_reg[2]  ( .D(n478), .CP(Clk_R), .CDN(
        Rst_n), .Q(tx_data_select[2]) );
  DFCNQD1BWP \main_control/select_sig_reg[1]  ( .D(n479), .CP(Clk_R), .CDN(
        Rst_n), .Q(tx_data_select[1]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[54]  ( .D(data_to_tx[54]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[54]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[9]  ( .D(data_to_tx[9]), .E(n511), .CP(
        Clk_R), .CDN(Rst_n), .Q(TX_Data[9]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[8]  ( .D(data_to_tx[8]), .E(n511), .CP(
        Clk_R), .CDN(Rst_n), .Q(TX_Data[8]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[7]  ( .D(data_to_tx[7]), .E(n511), .CP(
        Clk_R), .CDN(Rst_n), .Q(TX_Data[7]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[6]  ( .D(data_to_tx[6]), .E(n511), .CP(
        Clk_R), .CDN(Rst_n), .Q(TX_Data[6]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[5]  ( .D(data_to_tx[5]), .E(n511), .CP(
        Clk_R), .CDN(Rst_n), .Q(TX_Data[5]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[53]  ( .D(data_to_tx[53]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[53]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[52]  ( .D(data_to_tx[52]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[52]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[51]  ( .D(data_to_tx[51]), .E(n511), 
        .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[51]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[50]  ( .D(data_to_tx[50]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[50]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[49]  ( .D(data_to_tx[49]), .E(n511), 
        .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[49]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[48]  ( .D(data_to_tx[48]), .E(n511), 
        .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[48]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[2]  ( .D(data_to_tx[2]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[2]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[23]  ( .D(data_to_tx[23]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[23]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[22]  ( .D(data_to_tx[22]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[22]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[21]  ( .D(data_to_tx[21]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[21]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[20]  ( .D(data_to_tx[20]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[20]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[1]  ( .D(data_to_tx[1]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[1]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[19]  ( .D(data_to_tx[19]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[19]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[18]  ( .D(data_to_tx[18]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[18]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[17]  ( .D(data_to_tx[17]), .E(n511), 
        .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[17]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[15]  ( .D(data_to_tx[15]), .E(n511), 
        .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[15]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[14]  ( .D(data_to_tx[14]), .E(n511), 
        .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[14]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[13]  ( .D(data_to_tx[13]), .E(n511), 
        .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[13]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[12]  ( .D(data_to_tx[12]), .E(n511), 
        .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[12]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[11]  ( .D(data_to_tx[11]), .E(n511), 
        .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[11]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[0]  ( .D(data_to_tx[0]), .E(n511), .CP(
        Clk_R), .CDN(Rst_n), .Q(TX_Data[0]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[10]  ( .D(data_to_tx[10]), .E(n511), 
        .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[10]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[16]  ( .D(data_to_tx[16]), .E(n511), 
        .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[16]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[24]  ( .D(data_to_tx[24]), .E(n511), 
        .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[24]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[25]  ( .D(data_to_tx[25]), .E(n511), 
        .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[25]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[26]  ( .D(data_to_tx[26]), .E(n511), 
        .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[26]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[27]  ( .D(data_to_tx[27]), .E(n511), 
        .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[27]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[28]  ( .D(data_to_tx[28]), .E(n511), 
        .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[28]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[29]  ( .D(data_to_tx[29]), .E(n511), 
        .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[29]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[30]  ( .D(data_to_tx[30]), .E(n511), 
        .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[30]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[31]  ( .D(data_to_tx[31]), .E(n511), 
        .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[31]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[32]  ( .D(data_to_tx[32]), .E(n511), 
        .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[32]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[33]  ( .D(data_to_tx[33]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[33]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[34]  ( .D(data_to_tx[34]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[34]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[35]  ( .D(data_to_tx[35]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[35]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[36]  ( .D(data_to_tx[36]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[36]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[37]  ( .D(data_to_tx[37]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[37]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[38]  ( .D(data_to_tx[38]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[38]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[39]  ( .D(data_to_tx[39]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[39]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[3]  ( .D(data_to_tx[3]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[3]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[40]  ( .D(data_to_tx[40]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[40]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[41]  ( .D(data_to_tx[41]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[41]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[42]  ( .D(data_to_tx[42]), .E(n511), 
        .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[42]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[43]  ( .D(data_to_tx[43]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[43]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[44]  ( .D(data_to_tx[44]), .E(n511), 
        .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[44]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[45]  ( .D(data_to_tx[45]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[45]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[46]  ( .D(data_to_tx[46]), .E(n511), 
        .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[46]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[47]  ( .D(data_to_tx[47]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[47]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[4]  ( .D(data_to_tx[4]), .E(n511), .CP(
        Clk_R), .CDN(Rst_n), .Q(TX_Data[4]) );
  EDFCND1BWP \ever_versetile/out_reg[47]  ( .D(\enc_logic/checksum[27] ), .E(
        n86), .CP(Clk_R), .CDN(Rst_n), .QN(n80) );
  EDFCND1BWP \ever_versetile/out_reg[45]  ( .D(\enc_logic/checksum[25] ), .E(
        n86), .CP(Clk_R), .CDN(Rst_n), .QN(n78) );
  EDFCND1BWP \ever_versetile/out_reg[46]  ( .D(\enc_logic/checksum[26] ), .E(
        n86), .CP(Clk_R), .CDN(Rst_n), .QN(n79) );
  DFCNQD1BWP \main_control/select_sig_reg[0]  ( .D(n480), .CP(Clk_R), .CDN(
        Rst_n), .Q(tx_data_select[0]) );
  DFCNQD1BWP \main_control/state_reg[0]  ( .D(n4), .CP(Clk_R), .CDN(Rst_n), 
        .Q(n5) );
  DFCND1BWP \rHandshake/state_reg[0]  ( .D(\rHandshake/next_state[0] ), .CP(
        Clk_R), .CDN(Rst_n), .Q(\rHandshake/state[0] ), .QN(n1108) );
  DFCNQD1BWP \ever_versetile/out_reg[22]  ( .D(n455), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[22]) );
  DFCNQD1BWP \ever_versetile/out_reg[23]  ( .D(n454), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[23]) );
  XNR2D1BWP U573 ( .A1(n799), .A2(n798), .ZN(n818) );
  INVD1BWP U574 ( .I(n821), .ZN(n826) );
  NR2XD0BWP U575 ( .A1(n833), .A2(n836), .ZN(n814) );
  NR2XD1BWP U576 ( .A1(n809), .A2(data_type[0]), .ZN(n839) );
  INVD1BWP U577 ( .I(data_type[1]), .ZN(n809) );
  XOR2D1BWP U578 ( .A1(\dec_logic/checksum/check[13] ), .A2(
        \dec_logic/checksum/check[14] ), .Z(n708) );
  INVD1BWP U579 ( .I(n773), .ZN(n774) );
  NR2D4BWP U580 ( .A1(n778), .A2(n580), .ZN(n512) );
  XOR2D1BWP U581 ( .A1(n595), .A2(n721), .Z(n596) );
  CKND2D0BWP U582 ( .A1(n775), .A2(n1016), .ZN(n534) );
  INVD1BWP U583 ( .I(n869), .ZN(n870) );
  INVD1BWP U584 ( .I(n674), .ZN(n676) );
  ND2D1BWP U585 ( .A1(n796), .A2(n1012), .ZN(n784) );
  ND2D1BWP U586 ( .A1(n597), .A2(n676), .ZN(n800) );
  XNR2D1BWP U587 ( .A1(n899), .A2(n1031), .ZN(n901) );
  ND2D1BWP U588 ( .A1(n804), .A2(n797), .ZN(n816) );
  ND2D1BWP U589 ( .A1(n804), .A2(n796), .ZN(n815) );
  XOR3D2BWP U590 ( .A1(\dec_logic/checksum/check[6] ), .A2(
        \dec_logic/checksum/check[5] ), .A3(\dec_logic/checksum/encoder/N25 ), 
        .Z(n579) );
  CKND2BWP U591 ( .I(n598), .ZN(n827) );
  MUX2D1BWP U592 ( .I0(n813), .I1(n812), .S(n811), .Z(n836) );
  INVD1BWP U593 ( .I(n810), .ZN(n811) );
  OR2XD1BWP U594 ( .A1(n922), .A2(n921), .Z(n587) );
  INR2D1BWP U595 ( .A1(n825), .B1(n822), .ZN(n636) );
  INVD1BWP U596 ( .I(tx_data_select[2]), .ZN(n1034) );
  ND2D1BWP U597 ( .A1(n883), .A2(n882), .ZN(n884) );
  INVD1BWP U598 ( .I(n960), .ZN(n942) );
  INVD1BWP U599 ( .I(n5), .ZN(n1049) );
  NR2XD0BWP U600 ( .A1(n1049), .A2(\main_control/state[3] ), .ZN(n1056) );
  INVD1BWP U601 ( .I(n839), .ZN(n833) );
  AN2XD1BWP U602 ( .A1(n521), .A2(n839), .Z(n586) );
  NR2XD0BWP U603 ( .A1(\main_control/state[3] ), .A2(n5), .ZN(n1006) );
  INVD1BWP U604 ( .I(\dec_logic/checksum/check[26] ), .ZN(n1011) );
  INVD1BWP U605 ( .I(\dec_logic/checksum/check[25] ), .ZN(n1012) );
  INVD1BWP U606 ( .I(\dec_logic/checksum/check[24] ), .ZN(n1013) );
  INVD1BWP U607 ( .I(\dec_logic/checksum/check[22] ), .ZN(n1015) );
  INVD1BWP U608 ( .I(\dec_logic/checksum/check[15] ), .ZN(n843) );
  CKND2BWP U609 ( .I(n684), .ZN(n508) );
  NR2XD0BWP U610 ( .A1(n1038), .A2(tx_data_select[0]), .ZN(n1039) );
  CKBD2BWP U611 ( .I(n1039), .Z(n684) );
  INVD1BWP U612 ( .I(\main_control/state[1] ), .ZN(n1008) );
  ND2D1BWP U613 ( .A1(n1000), .A2(n909), .ZN(n983) );
  INVD1BWP U614 ( .I(\enc_logic/checksum[7] ), .ZN(n1031) );
  CKND2BWP U615 ( .I(n1105), .ZN(n1000) );
  ND2D2BWP U616 ( .A1(n86), .A2(\enc_logic/encode_type ), .ZN(n1105) );
  CKND4BWP U617 ( .I(n86), .ZN(n1001) );
  ND2D1BWP U618 ( .A1(n1056), .A2(n1008), .ZN(n688) );
  INVD1BWP U619 ( .I(\tHandshake/state[0] ), .ZN(n1009) );
  INVD1BWP U620 ( .I(n682), .ZN(n831) );
  MOAI22D0BWP U621 ( .A1(n1069), .A2(n508), .B1(buf_to_mux[4]), .B2(n510), 
        .ZN(data_to_tx[4]) );
  MOAI22D0BWP U622 ( .A1(n1013), .A2(n508), .B1(buf_to_mux[44]), .B2(n683), 
        .ZN(data_to_tx[44]) );
  MOAI22D0BWP U623 ( .A1(n1014), .A2(n508), .B1(buf_to_mux[43]), .B2(n683), 
        .ZN(data_to_tx[43]) );
  MOAI22D0BWP U624 ( .A1(n1015), .A2(n508), .B1(buf_to_mux[42]), .B2(n683), 
        .ZN(data_to_tx[42]) );
  MOAI22D0BWP U625 ( .A1(n1016), .A2(n508), .B1(buf_to_mux[41]), .B2(n510), 
        .ZN(data_to_tx[41]) );
  MOAI22D0BWP U626 ( .A1(n1017), .A2(n508), .B1(buf_to_mux[40]), .B2(n683), 
        .ZN(data_to_tx[40]) );
  MOAI22D0BWP U627 ( .A1(n1018), .A2(n508), .B1(buf_to_mux[39]), .B2(n683), 
        .ZN(data_to_tx[39]) );
  MOAI22D0BWP U628 ( .A1(n1019), .A2(n508), .B1(buf_to_mux[30]), .B2(n683), 
        .ZN(data_to_tx[30]) );
  MOAI22D0BWP U629 ( .A1(n849), .A2(n508), .B1(n510), .B2(buf_to_mux[28]), 
        .ZN(data_to_tx[28]) );
  MOAI22D0BWP U630 ( .A1(n1033), .A2(n508), .B1(buf_to_mux[27]), .B2(n683), 
        .ZN(data_to_tx[27]) );
  MOAI22D0BWP U631 ( .A1(n1020), .A2(n508), .B1(buf_to_mux[26]), .B2(n683), 
        .ZN(data_to_tx[26]) );
  MOAI22D0BWP U632 ( .A1(n1058), .A2(n508), .B1(buf_to_mux[16]), .B2(n510), 
        .ZN(data_to_tx[16]) );
  MOAI22D0BWP U633 ( .A1(n1085), .A2(n585), .B1(\dec_logic/raw[13] ), .B2(
        n1039), .ZN(data_to_tx[13]) );
  MOAI22D0BWP U634 ( .A1(n1087), .A2(n585), .B1(\dec_logic/raw[19] ), .B2(n684), .ZN(data_to_tx[19]) );
  MOAI22D0BWP U635 ( .A1(n1062), .A2(n508), .B1(buf_to_mux[20]), .B2(n510), 
        .ZN(data_to_tx[20]) );
  MOAI22D0BWP U636 ( .A1(n1065), .A2(n508), .B1(buf_to_mux[21]), .B2(n510), 
        .ZN(data_to_tx[21]) );
  MOAI22D0BWP U637 ( .A1(n1064), .A2(n508), .B1(buf_to_mux[22]), .B2(n683), 
        .ZN(data_to_tx[22]) );
  MOAI22D0BWP U638 ( .A1(n1060), .A2(n508), .B1(buf_to_mux[23]), .B2(n683), 
        .ZN(data_to_tx[23]) );
  MOAI22D0BWP U639 ( .A1(n1083), .A2(n585), .B1(\dec_logic/raw[7] ), .B2(n1039), .ZN(data_to_tx[7]) );
  CKBD3BWP U640 ( .I(\tHandshake/N12 ), .Z(n511) );
  ND2D2BWP U641 ( .A1(n688), .A2(n1081), .ZN(n86) );
  AOI21D0BWP U642 ( .A1(n928), .A2(n927), .B(n939), .ZN(n482) );
  OAI21D0BWP U643 ( .A1(n928), .A2(n927), .B(n482), .ZN(n957) );
  IND3D0BWP U644 ( .A1(\main_control/state[2] ), .B1(\main_control/state[3] ), 
        .B2(\main_control/state[1] ), .ZN(n1113) );
  INVD1BWP U645 ( .I(n905), .ZN(n483) );
  AO21D1BWP U646 ( .A1(n906), .A2(n483), .B(n861), .Z(n863) );
  CKND0BWP U647 ( .I(\main_control/state[1] ), .ZN(n484) );
  AOI211D0BWP U648 ( .A1(n1040), .A2(n484), .B(n1006), .C(
        \main_control/state[2] ), .ZN(n1119) );
  IND2D0BWP U649 ( .A1(\enc_logic/checksum[14] ), .B1(n981), .ZN(n984) );
  IIND4D0BWP U650 ( .A1(n1104), .A2(n675), .B1(n980), .B2(n977), .ZN(n485) );
  IOA21D1BWP U651 ( .A1(n973), .A2(n974), .B(n972), .ZN(n486) );
  OAI211D1BWP U652 ( .A1(n978), .A2(n485), .B(n976), .C(n486), .ZN(n454) );
  IND2D1BWP U653 ( .A1(n704), .B1(n706), .ZN(n701) );
  IND2D0BWP U654 ( .A1(n935), .B1(n936), .ZN(n947) );
  CKND0BWP U655 ( .I(r_addr[0]), .ZN(n487) );
  CKND0BWP U656 ( .I(r_addr[2]), .ZN(n488) );
  OAI22D0BWP U657 ( .A1(n487), .A2(address[0]), .B1(n488), .B2(address[2]), 
        .ZN(n489) );
  AOI221D0BWP U658 ( .A1(n487), .A2(address[0]), .B1(address[2]), .B2(n488), 
        .C(n489), .ZN(n490) );
  CKND0BWP U659 ( .I(r_addr[1]), .ZN(n491) );
  CKND0BWP U660 ( .I(r_addr[3]), .ZN(n492) );
  OAI22D0BWP U661 ( .A1(n491), .A2(address[1]), .B1(n492), .B2(address[3]), 
        .ZN(n493) );
  AOI221D0BWP U662 ( .A1(n491), .A2(address[1]), .B1(address[3]), .B2(n492), 
        .C(n493), .ZN(n494) );
  AN3D0BWP U663 ( .A1(n1050), .A2(n490), .A3(n494), .Z(n495) );
  OAI31D0BWP U664 ( .A1(\dec_logic/token ), .A2(data_type[1]), .A3(
        data_type[0]), .B(n495), .ZN(n1070) );
  IND3D0BWP U665 ( .A1(\main_control/state[2] ), .B1(\main_control/state[1] ), 
        .B2(n1006), .ZN(n1081) );
  INR2D0BWP U666 ( .A1(n888), .B1(\enc_logic/checksum[27] ), .ZN(n496) );
  AOI22D0BWP U667 ( .A1(buf_to_mux[20]), .A2(n1001), .B1(n982), .B2(n1000), 
        .ZN(n497) );
  OAI211D0BWP U668 ( .A1(n496), .A2(n971), .B(n983), .C(n497), .ZN(n457) );
  CKND2D0BWP U669 ( .A1(\dec_logic/checksum/check[7] ), .A2(
        \dec_logic/checksum/encoder/N25 ), .ZN(n498) );
  MOAI22D0BWP U670 ( .A1(n743), .A2(n498), .B1(n499), .B2(n742), .ZN(n500) );
  CKND0BWP U671 ( .I(n744), .ZN(n499) );
  OAI32D0BWP U672 ( .A1(n500), .A2(n742), .A3(n499), .B1(n745), .B2(n500), 
        .ZN(n753) );
  INR2D0BWP U673 ( .A1(n937), .B1(n938), .ZN(n950) );
  AOI22D0BWP U674 ( .A1(\dec_logic/checksum/check[26] ), .A2(
        \dec_logic/checksum/check[22] ), .B1(n1015), .B2(n1011), .ZN(n501) );
  MUX2ND0BWP U675 ( .I0(n1014), .I1(\dec_logic/checksum/check[23] ), .S(n501), 
        .ZN(n502) );
  XNR4D0BWP U676 ( .A1(\dec_logic/checksum/check[24] ), .A2(
        \dec_logic/checksum/check[25] ), .A3(n502), .A4(
        \dec_logic/checksum/check[27] ), .ZN(n566) );
  CKND0BWP U677 ( .I(\dec_logic/checksum/check[5] ), .ZN(n503) );
  MOAI22D0BWP U678 ( .A1(n508), .A2(n503), .B1(n683), .B2(buf_to_mux[25]), 
        .ZN(data_to_tx[25]) );
  CKND0BWP U679 ( .I(n982), .ZN(n504) );
  OAI222D0BWP U680 ( .A1(n504), .A2(n983), .B1(n1105), .B2(n984), .C1(n1087), 
        .C2(n86), .ZN(n458) );
  OAI21D0BWP U681 ( .A1(n1074), .A2(n1050), .B(n1053), .ZN(n505) );
  AOI21D0BWP U682 ( .A1(n1051), .A2(n505), .B(n1071), .ZN(n506) );
  OAI21D0BWP U683 ( .A1(n1007), .A2(n1117), .B(n506), .ZN(
        \main_control/next_state[3] ) );
  ND2D4BWP U684 ( .A1(n714), .A2(n593), .ZN(n711) );
  ND2D4BWP U685 ( .A1(n631), .A2(n1014), .ZN(n788) );
  ND2D3BWP U686 ( .A1(n514), .A2(n801), .ZN(n631) );
  IND3D2BWP U687 ( .A1(n1010), .B1(n782), .B2(n781), .ZN(n786) );
  CKND2BWP U688 ( .I(n824), .ZN(n825) );
  OR3XD1BWP U689 ( .A1(tx_data_select[0]), .A2(tx_data_select[1]), .A3(n1034), 
        .Z(n585) );
  CKND2BWP U690 ( .I(n585), .ZN(n510) );
  INVD1BWP U691 ( .I(n699), .ZN(n850) );
  INVD1BWP U692 ( .I(\dec_logic/checksum/check[20] ), .ZN(n1017) );
  INVD1BWP U693 ( .I(\dec_logic/checksum/check[23] ), .ZN(n1014) );
  ND2D3BWP U694 ( .A1(n600), .A2(n814), .ZN(n507) );
  CKND6BWP U695 ( .I(\enc_logic/checksum[6] ), .ZN(n689) );
  NR2XD3BWP U696 ( .A1(n528), .A2(n527), .ZN(n592) );
  NR2XD1BWP U697 ( .A1(n739), .A2(n738), .ZN(n765) );
  XOR3D2BWP U698 ( .A1(n753), .A2(n756), .A3(n758), .Z(n764) );
  NR2XD0BWP U699 ( .A1(n751), .A2(n750), .ZN(n758) );
  ND2D3BWP U700 ( .A1(n920), .A2(n612), .ZN(n875) );
  NR3D2BWP U701 ( .A1(n588), .A2(n850), .A3(\dec_logic/checksum/check[10] ), 
        .ZN(n700) );
  DCCKND4BWP U702 ( .I(n588), .ZN(n589) );
  DCCKND4BWP U703 ( .I(n674), .ZN(n535) );
  NR2XD3BWP U704 ( .A1(\enc_logic/checksum[5] ), .A2(\enc_logic/checksum[6] ), 
        .ZN(n889) );
  OAI21D4BWP U705 ( .A1(n867), .A2(n866), .B(n865), .ZN(n869) );
  ND2D3BWP U706 ( .A1(n706), .A2(n705), .ZN(n709) );
  ND2D4BWP U707 ( .A1(n718), .A2(n717), .ZN(n719) );
  ND2D3BWP U708 ( .A1(n1088), .A2(n851), .ZN(n852) );
  NR2XD0BWP U709 ( .A1(n903), .A2(n905), .ZN(n935) );
  AOI31D4BWP U710 ( .A1(n788), .A2(n515), .A3(n544), .B(n543), .ZN(n546) );
  NR2XD3BWP U711 ( .A1(n785), .A2(n797), .ZN(n792) );
  ND2D2BWP U712 ( .A1(n797), .A2(n1011), .ZN(n781) );
  NR2XD3BWP U713 ( .A1(n805), .A2(n796), .ZN(n797) );
  INVD1BWP U714 ( .I(n793), .ZN(n658) );
  OAI22D2BWP U715 ( .A1(n655), .A2(n517), .B1(n598), .B2(n825), .ZN(n659) );
  CKND6BWP U716 ( .I(n517), .ZN(n518) );
  NR2XD3BWP U717 ( .A1(n792), .A2(n516), .ZN(n517) );
  ND2D4BWP U718 ( .A1(n537), .A2(n768), .ZN(n513) );
  AOI21D4BWP U719 ( .A1(n772), .A2(n673), .B(n771), .ZN(n539) );
  NR3D4BWP U720 ( .A1(n531), .A2(n512), .A3(n1016), .ZN(n674) );
  CKND4BWP U721 ( .I(n768), .ZN(n531) );
  NR2D4BWP U722 ( .A1(n857), .A2(\enc_logic/checksum[11] ), .ZN(n858) );
  ND2D8BWP U723 ( .A1(n536), .A2(n535), .ZN(n801) );
  NR3D4BWP U724 ( .A1(n720), .A2(n719), .A3(n1018), .ZN(n776) );
  NR2XD1BWP U725 ( .A1(n837), .A2(n520), .ZN(n639) );
  OAI21D4BWP U726 ( .A1(n913), .A2(n873), .B(n872), .ZN(n917) );
  OAI21D4BWP U727 ( .A1(n871), .A2(n870), .B(n873), .ZN(n872) );
  AOI21D4BWP U728 ( .A1(n853), .A2(n999), .B(n852), .ZN(n899) );
  ND2D3BWP U729 ( .A1(n600), .A2(n814), .ZN(n682) );
  XNR2D1BWP U730 ( .A1(n968), .A2(n967), .ZN(n978) );
  OAI22D2BWP U731 ( .A1(n626), .A2(n625), .B1(n964), .B2(n942), .ZN(n967) );
  INVD1BWP U732 ( .I(n522), .ZN(n574) );
  ND2D1BWP U733 ( .A1(n835), .A2(\dec_logic/checksum/check[12] ), .ZN(n832) );
  CKND4BWP U734 ( .I(n834), .ZN(n835) );
  ND2D2BWP U735 ( .A1(n780), .A2(\dec_logic/checksum/check[25] ), .ZN(n805) );
  NR2D2BWP U736 ( .A1(\dec_logic/checksum/check[26] ), .A2(n632), .ZN(n791) );
  ND3D2BWP U737 ( .A1(n774), .A2(\dec_logic/checksum/check[20] ), .A3(
        \dec_logic/checksum/check[21] ), .ZN(n789) );
  NR2D1BWP U738 ( .A1(n981), .A2(n677), .ZN(n907) );
  OAI211D1BWP U739 ( .A1(n999), .A2(n1104), .B(n998), .C(n997), .ZN(n453) );
  OAI211D1BWP U740 ( .A1(n1083), .A2(n86), .B(n990), .C(n989), .ZN(n470) );
  MOAI22D0BWP U741 ( .A1(n984), .A2(n983), .B1(n1001), .B2(buf_to_mux[18]), 
        .ZN(n459) );
  MOAI22D0BWP U742 ( .A1(\enc_logic/checksum[9] ), .A2(n989), .B1(n1001), .B2(
        buf_to_mux[6]), .ZN(n471) );
  INVD6BWP U743 ( .I(n1104), .ZN(n509) );
  CKND2D1BWP U744 ( .A1(n1035), .A2(n1036), .ZN(data_to_tx[52]) );
  CKND2D1BWP U745 ( .A1(n1037), .A2(n1036), .ZN(data_to_tx[53]) );
  ND2D2BWP U746 ( .A1(n86), .A2(n690), .ZN(n1104) );
  AOI22D0BWP U747 ( .A1(data_type[1]), .A2(n684), .B1(n510), .B2(
        buf_to_mux[53]), .ZN(n1037) );
  AOI22D0BWP U748 ( .A1(data_type[0]), .A2(n684), .B1(n510), .B2(
        buf_to_mux[52]), .ZN(n1035) );
  AO22D0BWP U749 ( .A1(\dec_logic/raw[0] ), .A2(n1039), .B1(buf_to_mux[0]), 
        .B2(n510), .Z(data_to_tx[0]) );
  AO22D0BWP U750 ( .A1(\dec_logic/three_six_load[0] ), .A2(n1039), .B1(
        buf_to_mux[3]), .B2(n510), .Z(data_to_tx[3]) );
  AO22D0BWP U751 ( .A1(\dec_logic/raw[2] ), .A2(n1039), .B1(buf_to_mux[2]), 
        .B2(n510), .Z(data_to_tx[2]) );
  AO22D0BWP U752 ( .A1(\dec_logic/raw[6] ), .A2(n1039), .B1(buf_to_mux[6]), 
        .B2(n510), .Z(data_to_tx[6]) );
  AOI31D0BWP U753 ( .A1(n1113), .A2(n1112), .A3(n1111), .B(n1009), .ZN(n1116)
         );
  ND2D1BWP U754 ( .A1(n833), .A2(\dec_logic/three_six_load[6] ), .ZN(n671) );
  ND2D1BWP U755 ( .A1(n833), .A2(\dec_logic/three_six_load[5] ), .ZN(n665) );
  ND2D1BWP U756 ( .A1(n833), .A2(\dec_logic/three_six_load[4] ), .ZN(n666) );
  ND2D1BWP U757 ( .A1(n833), .A2(\dec_logic/checksum/check[14] ), .ZN(n669) );
  ND2D1BWP U758 ( .A1(n833), .A2(\dec_logic/checksum/check[15] ), .ZN(n668) );
  ND2D1BWP U759 ( .A1(n833), .A2(\dec_logic/three_six_load[3] ), .ZN(n670) );
  ND2D1BWP U760 ( .A1(n833), .A2(\dec_logic/three_six_load[2] ), .ZN(n667) );
  ND2D1BWP U761 ( .A1(\main_control/state[3] ), .A2(n1042), .ZN(n1047) );
  ND2D3BWP U762 ( .A1(TX_Data_Valid), .A2(n1009), .ZN(\tHandshake/N12 ) );
  CKND1BWP U763 ( .I(\main_control/state[3] ), .ZN(n1007) );
  ND2D1BWP U764 ( .A1(tx_data_select[1]), .A2(n1034), .ZN(n1038) );
  ND2D2BWP U765 ( .A1(n890), .A2(\enc_logic/check/N25 ), .ZN(n1088) );
  INVD1BWP U766 ( .I(\rHandshake/state[1] ), .ZN(n1109) );
  NR2D0BWP U767 ( .A1(n1022), .A2(n1021), .ZN(n1106) );
  NR2D0BWP U768 ( .A1(n1025), .A2(n1024), .ZN(n1099) );
  CKND2D1BWP U769 ( .A1(n987), .A2(n994), .ZN(n985) );
  CKND1BWP U770 ( .I(n715), .ZN(n713) );
  INVD1BWP U771 ( .I(\dec_logic/checksum/check[10] ), .ZN(n1019) );
  XNR2D1BWP U772 ( .A1(\dec_logic/checksum/check[11] ), .A2(
        \dec_logic/checksum/check[12] ), .ZN(n699) );
  INVD1BWP U773 ( .I(\dec_logic/checksum/check[21] ), .ZN(n1016) );
  XOR2D1BWP U774 ( .A1(\dec_logic/checksum/check[17] ), .A2(
        \dec_logic/checksum/check[18] ), .Z(n715) );
  INVD4BWP U775 ( .I(\dec_logic/checksum/check[19] ), .ZN(n1018) );
  INVD1BWP U776 ( .I(\dec_logic/checksum/check[9] ), .ZN(n848) );
  INVD1BWP U777 ( .I(\dec_logic/checksum/check[8] ), .ZN(n849) );
  INVD1BWP U778 ( .I(\dec_logic/checksum/check[13] ), .ZN(n845) );
  INVD1BWP U779 ( .I(\enc_logic/encode_type ), .ZN(n690) );
  INVD1BWP U780 ( .I(\enc_logic/checksum[26] ), .ZN(n1022) );
  INVD1BWP U781 ( .I(\enc_logic/checksum[22] ), .ZN(n1026) );
  INVD1BWP U782 ( .I(\enc_logic/checksum[24] ), .ZN(n1024) );
  INVD1BWP U783 ( .I(\dec_logic/checksum/check[27] ), .ZN(n1010) );
  INVD1BWP U784 ( .I(\dec_logic/three_six_load[10] ), .ZN(n1064) );
  INVD1BWP U785 ( .I(\dec_logic/three_six_load[11] ), .ZN(n1060) );
  NR2D1BWP U786 ( .A1(n1010), .A2(n586), .ZN(Packet_To_Node[23]) );
  NR2D1BWP U787 ( .A1(n1012), .A2(n586), .ZN(Packet_To_Node[21]) );
  NR2D1BWP U788 ( .A1(n1011), .A2(n586), .ZN(Packet_To_Node[22]) );
  CKND2D2BWP U789 ( .A1(n521), .A2(n571), .ZN(n522) );
  CKND2D1BWP U790 ( .A1(n980), .A2(n977), .ZN(n634) );
  INVD4BWP U791 ( .I(n834), .ZN(n581) );
  CKND1BWP U792 ( .I(n977), .ZN(n979) );
  IND2D2BWP U793 ( .A1(n550), .B1(n600), .ZN(n521) );
  CKND1BWP U794 ( .I(n974), .ZN(n975) );
  ND2D8BWP U795 ( .A1(n838), .A2(n639), .ZN(n834) );
  ND2D1BWP U796 ( .A1(n838), .A2(n549), .ZN(n550) );
  IND2D4BWP U797 ( .A1(n636), .B1(n637), .ZN(n838) );
  CKND1BWP U798 ( .I(n828), .ZN(n635) );
  CKND2D1BWP U799 ( .A1(n824), .A2(n821), .ZN(n655) );
  ND2D2BWP U800 ( .A1(n518), .A2(\dec_logic/three_six_load[9] ), .ZN(n519) );
  NR2D2BWP U801 ( .A1(n884), .A2(n1023), .ZN(n960) );
  NR2D2BWP U802 ( .A1(n792), .A2(n791), .ZN(n810) );
  IND2D1BWP U803 ( .A1(n817), .B1(n816), .ZN(n819) );
  CKND1BWP U804 ( .I(n944), .ZN(n625) );
  CKND2D4BWP U805 ( .A1(n516), .A2(n792), .ZN(n598) );
  ND2D2BWP U806 ( .A1(n962), .A2(n961), .ZN(n944) );
  NR2XD2BWP U807 ( .A1(n880), .A2(n1022), .ZN(n941) );
  NR2XD2BWP U808 ( .A1(n881), .A2(n1024), .ZN(n961) );
  ND2D2BWP U809 ( .A1(n879), .A2(n878), .ZN(n881) );
  NR2D2BWP U810 ( .A1(n614), .A2(n615), .ZN(n824) );
  CKND1BWP U811 ( .I(n804), .ZN(n806) );
  NR2D1BWP U812 ( .A1(n959), .A2(n958), .ZN(n969) );
  OAI21D1BWP U813 ( .A1(n767), .A2(n616), .B(n617), .ZN(n614) );
  CKND1BWP U814 ( .I(n940), .ZN(n923) );
  CKND1BWP U815 ( .I(n877), .ZN(n876) );
  CKND2D1BWP U816 ( .A1(n515), .A2(n801), .ZN(n795) );
  NR2D1BWP U817 ( .A1(n767), .A2(n799), .ZN(n615) );
  CKND1BWP U818 ( .I(n800), .ZN(n802) );
  CKND2D2BWP U819 ( .A1(n875), .A2(n1026), .ZN(n877) );
  CKND2D2BWP U820 ( .A1(n926), .A2(n925), .ZN(n946) );
  CKND1BWP U821 ( .I(n919), .ZN(n623) );
  CKND2BWP U822 ( .I(n596), .ZN(n597) );
  CKND1BWP U823 ( .I(n798), .ZN(n616) );
  XNR2D1BWP U824 ( .A1(n917), .A2(n611), .ZN(n874) );
  NR2D1BWP U825 ( .A1(n580), .A2(n512), .ZN(n721) );
  CKND1BWP U826 ( .I(n763), .ZN(n741) );
  CKND0BWP U827 ( .I(n953), .ZN(n956) );
  OAI21D2BWP U828 ( .A1(n775), .A2(n770), .B(n1015), .ZN(n771) );
  CKND1BWP U829 ( .I(n913), .ZN(n914) );
  CKND0BWP U830 ( .I(n761), .ZN(n621) );
  CKND2D1BWP U831 ( .A1(n913), .A2(n1030), .ZN(n915) );
  CKND1BWP U832 ( .I(n595), .ZN(n723) );
  BUFFD4BWP U833 ( .I(n776), .Z(n580) );
  CKND4BWP U834 ( .I(n776), .ZN(n775) );
  NR2D1BWP U835 ( .A1(n928), .A2(n927), .ZN(n953) );
  CKND0BWP U836 ( .I(n765), .ZN(n740) );
  NR2D1BWP U837 ( .A1(n841), .A2(n728), .ZN(n730) );
  CKND1BWP U838 ( .I(n954), .ZN(n955) );
  CKND2D0BWP U839 ( .A1(n910), .A2(n909), .ZN(n912) );
  CKND2D1BWP U840 ( .A1(n678), .A2(n756), .ZN(n755) );
  CKND0BWP U841 ( .I(n758), .ZN(n678) );
  CKND1BWP U842 ( .I(n862), .ZN(n867) );
  CKND2D1BWP U843 ( .A1(n758), .A2(n757), .ZN(n759) );
  INVD4BWP U844 ( .I(n711), .ZN(n728) );
  CKND0BWP U845 ( .I(n729), .ZN(n727) );
  XNR2D1BWP U846 ( .A1(n750), .A2(n605), .ZN(n726) );
  XOR2D1BWP U847 ( .A1(n937), .A2(n938), .Z(n928) );
  CKND1BWP U848 ( .I(n751), .ZN(n605) );
  CKND2D1BWP U849 ( .A1(n594), .A2(n842), .ZN(n729) );
  CKND1BWP U850 ( .I(n672), .ZN(n576) );
  CKND0BWP U851 ( .I(n947), .ZN(n949) );
  ND2D2BWP U852 ( .A1(n593), .A2(n712), .ZN(n594) );
  CKND1BWP U853 ( .I(n904), .ZN(n860) );
  CKND1BWP U854 ( .I(n863), .ZN(n866) );
  CKND1BWP U855 ( .I(n734), .ZN(n735) );
  INVD1BWP U856 ( .I(n737), .ZN(n672) );
  CKND1BWP U857 ( .I(n859), .ZN(n677) );
  NR2XD1BWP U858 ( .A1(n604), .A2(n736), .ZN(n734) );
  ND2D1BWP U859 ( .A1(n906), .A2(n859), .ZN(n904) );
  OAI21D0BWP U860 ( .A1(n1104), .A2(n1025), .B(n1103), .ZN(n434) );
  OAI21D0BWP U861 ( .A1(n1104), .A2(n993), .B(n892), .ZN(n446) );
  OAI21D0BWP U862 ( .A1(n1104), .A2(n1030), .B(n1098), .ZN(n440) );
  CKND0BWP U863 ( .I(n756), .ZN(n757) );
  CKND2D1BWP U864 ( .A1(n1001), .A2(buf_to_mux[24]), .ZN(n997) );
  AOI22D0BWP U865 ( .A1(tx_data_select[2]), .A2(n1077), .B1(n1076), .B2(n1075), 
        .ZN(n1079) );
  AOI22D0BWP U866 ( .A1(tx_data_select[1]), .A2(n1118), .B1(n1071), .B2(n1070), 
        .ZN(n1072) );
  AO22D1BWP U867 ( .A1(n1000), .A2(\enc_logic/checksum[14] ), .B1(n1001), .B2(
        buf_to_mux[22]), .Z(n578) );
  OAI222D0BWP U868 ( .A1(n895), .A2(n1104), .B1(n1105), .B2(n894), .C1(n86), 
        .C2(n893), .ZN(n452) );
  NR3D2BWP U869 ( .A1(n903), .A2(n858), .A3(n994), .ZN(n905) );
  INVD0BWP U870 ( .I(n701), .ZN(n603) );
  AOI211D1BWP U871 ( .A1(n570), .A2(n569), .B(\dec_logic/token ), .C(n568), 
        .ZN(n571) );
  OAI22D0BWP U872 ( .A1(n1105), .A2(n988), .B1(n86), .B2(n1085), .ZN(n464) );
  CKND2D0BWP U873 ( .A1(n1003), .A2(n1074), .ZN(n1077) );
  CKND1BWP U874 ( .I(n747), .ZN(n748) );
  XOR2D1BWP U875 ( .A1(n898), .A2(n897), .Z(n930) );
  INR2XD0BWP U876 ( .A1(\enc_logic/checksum[13] ), .B1(n1105), .ZN(n630) );
  AOI21D0BWP U877 ( .A1(\tHandshake/state[0] ), .A2(n687), .B(n686), .ZN(n1002) );
  AOI211D0BWP U878 ( .A1(\enc_logic/checksum[20] ), .A2(
        \enc_logic/checksum[21] ), .B(\enc_logic/checksum[19] ), .C(n1105), 
        .ZN(n1092) );
  AOI211D0BWP U879 ( .A1(\enc_logic/checksum[23] ), .A2(
        \enc_logic/checksum[24] ), .B(\enc_logic/checksum[22] ), .C(n1105), 
        .ZN(n1096) );
  AOI31D0BWP U880 ( .A1(\enc_logic/checksum[9] ), .A2(\enc_logic/checksum[8] ), 
        .A3(\enc_logic/checksum[7] ), .B(n1105), .ZN(n1084) );
  AOI31D0BWP U881 ( .A1(\enc_logic/checksum[12] ), .A2(
        \enc_logic/checksum[11] ), .A3(\enc_logic/checksum[10] ), .B(n1105), 
        .ZN(n1086) );
  OAI22D0BWP U882 ( .A1(n78), .A2(n585), .B1(n1012), .B2(n508), .ZN(
        data_to_tx[45]) );
  AOI211D0BWP U883 ( .A1(\enc_logic/checksum[26] ), .A2(
        \enc_logic/checksum[27] ), .B(\enc_logic/checksum[25] ), .C(n1105), 
        .ZN(n1101) );
  OAI22D0BWP U884 ( .A1(n79), .A2(n585), .B1(n1011), .B2(n508), .ZN(
        data_to_tx[46]) );
  CKND0BWP U885 ( .I(n753), .ZN(n754) );
  CKND2BWP U886 ( .I(n856), .ZN(n857) );
  CKND1BWP U887 ( .I(n1004), .ZN(n568) );
  NR2D0BWP U888 ( .A1(n1117), .A2(n1009), .ZN(n572) );
  CKND1BWP U889 ( .I(n1054), .ZN(n687) );
  NR2D1BWP U890 ( .A1(n1070), .A2(n1047), .ZN(n1004) );
  AOI211XD1BWP U891 ( .A1(n524), .A2(n590), .B(n850), .C(n708), .ZN(n527) );
  CKND2D2BWP U892 ( .A1(n693), .A2(n847), .ZN(n694) );
  CKND0BWP U893 ( .I(n899), .ZN(n896) );
  NR2D2BWP U894 ( .A1(n601), .A2(n699), .ZN(n591) );
  CKND1BWP U895 ( .I(n702), .ZN(n704) );
  OAI22D0BWP U896 ( .A1(n688), .A2(\main_control/state[2] ), .B1(n1007), .B2(
        n1057), .ZN(n1080) );
  CKND1BWP U897 ( .I(n1074), .ZN(n1076) );
  OA32D0BWP U898 ( .A1(n1116), .A2(\tHandshake/state[0] ), .A3(TX_Data_Ready), 
        .B1(TX_Data_Valid), .B2(n1116), .Z(\tHandshake/next_state[1] ) );
  AOI22D0BWP U899 ( .A1(n1009), .A2(n1115), .B1(n1116), .B2(n1114), .ZN(
        \tHandshake/next_state[0] ) );
  CKAN2D0BWP U900 ( .A1(n1006), .A2(n1032), .Z(Core_Load_Ack) );
  CKND2D1BWP U901 ( .A1(n1053), .A2(n1052), .ZN(n685) );
  OR2D0BWP U902 ( .A1(n1081), .A2(Packet_From_Node_Valid), .Z(n1054) );
  CKND2D1BWP U903 ( .A1(n5), .A2(n1032), .ZN(n1117) );
  NR2D1BWP U904 ( .A1(n1047), .A2(n1048), .ZN(n1055) );
  MAOI22D0BWP U905 ( .A1(n1110), .A2(n1109), .B1(RX_Data_Valid), .B2(n1108), 
        .ZN(\rHandshake/next_state[1] ) );
  INVD2BWP U906 ( .I(n585), .ZN(n683) );
  NR2D0BWP U907 ( .A1(n1040), .A2(n1008), .ZN(Packet_To_Node_Valid) );
  IAO21D0BWP U908 ( .A1(\dec_logic/token ), .A2(tx_data_select[0]), .B(n1038), 
        .ZN(data_to_tx[54]) );
  CKND2D0BWP U909 ( .A1(n1005), .A2(n1006), .ZN(n1053) );
  CKND2D1BWP U910 ( .A1(n1056), .A2(n1005), .ZN(n1074) );
  INR2XD0BWP U911 ( .A1(n1049), .B1(n1113), .ZN(n664) );
  CKND2D1BWP U912 ( .A1(n1051), .A2(n1050), .ZN(n1075) );
  XNR2D1BWP U913 ( .A1(n744), .A2(n742), .ZN(n746) );
  CKND0BWP U914 ( .I(n1088), .ZN(n929) );
  CKND1BWP U915 ( .I(n744), .ZN(n525) );
  CKND2D1BWP U916 ( .A1(n1005), .A2(\rHandshake/state[0] ), .ZN(n1110) );
  CKND1BWP U917 ( .I(n1005), .ZN(n1057) );
  CKND2D0BWP U918 ( .A1(n5), .A2(\main_control/state[3] ), .ZN(n1040) );
  OR2D0BWP U919 ( .A1(\main_control/state[2] ), .A2(n1049), .Z(n1112) );
  CKND2D1BWP U920 ( .A1(\main_control/state[2] ), .A2(n1008), .ZN(n1111) );
  NR2D1BWP U921 ( .A1(n1109), .A2(\rHandshake/state[0] ), .ZN(n1051) );
  CKND2D0BWP U922 ( .A1(\main_control/state[3] ), .A2(n1008), .ZN(n1073) );
  CKND2D0BWP U923 ( .A1(tx_data_select[0]), .A2(n1034), .ZN(n1036) );
  XNR4D1BWP U924 ( .A1(\dec_logic/three_six_load[0] ), .A2(\dec_logic/raw[0] ), 
        .A3(\dec_logic/raw[2] ), .A4(n556), .ZN(n562) );
  CKND1BWP U925 ( .I(n770), .ZN(n772) );
  XOR3D0BWP U926 ( .A1(n554), .A2(n850), .A3(n553), .Z(n558) );
  NR2D1BWP U927 ( .A1(n839), .A2(\dec_logic/three_six_load[0] ), .ZN(n829) );
  XNR4D1BWP U928 ( .A1(\dec_logic/three_six_load[6] ), .A2(\dec_logic/raw[12] ), .A3(\dec_logic/raw[14] ), .A4(n1059), .ZN(n1068) );
  CKND1BWP U929 ( .I(buf_to_mux[21]), .ZN(n629) );
  CKAN2D1BWP U930 ( .A1(\main_control/state[2] ), .A2(\main_control/state[1] ), 
        .Z(n1005) );
  CKND0BWP U931 ( .I(TX_Data_Valid), .ZN(n1114) );
  CKND1BWP U932 ( .I(buf_to_mux[25]), .ZN(n893) );
  AOI22D0BWP U933 ( .A1(\dec_logic/checksum/check[21] ), .A2(
        \dec_logic/checksum/check[19] ), .B1(n1018), .B2(n1016), .ZN(n551) );
  NR2D1BWP U934 ( .A1(n987), .A2(n986), .ZN(n988) );
  NR2D0BWP U935 ( .A1(n1028), .A2(n1027), .ZN(n1094) );
  NR2D1BWP U936 ( .A1(\dec_logic/checksum/check[16] ), .A2(n715), .ZN(n716) );
  CKND1BWP U937 ( .I(n1089), .ZN(n1090) );
  CKND1BWP U938 ( .I(n889), .ZN(n891) );
  CKND1BWP U939 ( .I(n710), .ZN(n608) );
  NR2D2BWP U940 ( .A1(n895), .A2(n689), .ZN(n890) );
  CKND1BWP U941 ( .I(n787), .ZN(n544) );
  NR2D1BWP U942 ( .A1(n1012), .A2(n1013), .ZN(n543) );
  NR2D1BWP U943 ( .A1(\dec_logic/checksum/check[9] ), .A2(
        \dec_logic/checksum/check[8] ), .ZN(n691) );
  XNR4D1BWP U944 ( .A1(\dec_logic/three_six_load[3] ), .A2(
        \dec_logic/three_six_load[4] ), .A3(\dec_logic/raw[7] ), .A4(
        \dec_logic/raw[8] ), .ZN(n560) );
  NR2D1BWP U945 ( .A1(\enc_logic/checksum[10] ), .A2(\enc_logic/checksum[11] ), 
        .ZN(n987) );
  NR2D1BWP U946 ( .A1(\dec_logic/checksum/check[6] ), .A2(
        \dec_logic/checksum/check[5] ), .ZN(n696) );
  NR2D1BWP U947 ( .A1(\dec_logic/checksum/check[17] ), .A2(
        \dec_logic/checksum/check[18] ), .ZN(n606) );
  NR2D1BWP U948 ( .A1(\enc_logic/checksum[8] ), .A2(\enc_logic/checksum[9] ), 
        .ZN(n900) );
  NR2D1BWP U949 ( .A1(\dec_logic/checksum/check[20] ), .A2(
        \dec_logic/checksum/check[21] ), .ZN(n777) );
  INVD2BWP U950 ( .I(\dec_logic/checksum/check[16] ), .ZN(n842) );
  NR2D1BWP U951 ( .A1(\dec_logic/checksum/check[27] ), .A2(\dec_logic/raw[20] ), .ZN(n813) );
  NR2D1BWP U952 ( .A1(\dec_logic/checksum/check[25] ), .A2(
        \dec_logic/checksum/check[24] ), .ZN(n787) );
  INVD2BWP U953 ( .I(\enc_logic/checksum[12] ), .ZN(n994) );
  INVD2BWP U954 ( .I(\enc_logic/checksum[5] ), .ZN(n895) );
  NR3D2BWP U955 ( .A1(n837), .A2(n520), .A3(n836), .ZN(n549) );
  CKND2BWP U956 ( .I(n512), .ZN(n537) );
  OAI211D4BWP U957 ( .A1(\dec_logic/checksum/check[21] ), .A2(n513), .B(n539), 
        .C(n789), .ZN(n514) );
  IND2D1BWP U958 ( .A1(n513), .B1(n538), .ZN(n540) );
  IND3D4BWP U959 ( .A1(n1014), .B1(n514), .B2(n801), .ZN(n515) );
  ND2D4BWP U960 ( .A1(n788), .A2(n515), .ZN(n790) );
  XOR3D2BWP U961 ( .A1(n597), .A2(n546), .A3(n545), .Z(n516) );
  OAI211D2BWP U962 ( .A1(n826), .A2(n517), .B(n825), .C(n598), .ZN(n638) );
  OAI22D2BWP U963 ( .A1(n517), .A2(n652), .B1(n598), .B2(n1064), .ZN(n599) );
  NR2D4BWP U964 ( .A1(n518), .A2(\dec_logic/three_six_load[9] ), .ZN(n828) );
  OAI22D2BWP U965 ( .A1(n518), .A2(\dec_logic/three_six_load[10] ), .B1(n827), 
        .B2(n653), .ZN(n793) );
  NR2XD1BWP U966 ( .A1(n519), .A2(n827), .ZN(n547) );
  AOI31D2BWP U967 ( .A1(n635), .A2(n519), .A3(n1062), .B(n826), .ZN(n837) );
  NR3D2BWP U968 ( .A1(n548), .A2(n547), .A3(n828), .ZN(n520) );
  IND2D1BWP U969 ( .A1(n662), .B1(n522), .ZN(n480) );
  NR2XD1BWP U970 ( .A1(n574), .A2(n573), .ZN(n4) );
  XNR2D1BWP U971 ( .A1(\dec_logic/checksum/check[7] ), .A2(
        \dec_logic/checksum/check[8] ), .ZN(n523) );
  XNR3D4BWP U972 ( .A1(\dec_logic/checksum/check[9] ), .A2(n523), .A3(n579), 
        .ZN(n588) );
  AN3D4BWP U973 ( .A1(n588), .A2(n699), .A3(\dec_logic/checksum/check[10] ), 
        .Z(n707) );
  CKND2BWP U974 ( .I(n707), .ZN(n524) );
  CKND2BWP U975 ( .I(n591), .ZN(n526) );
  NR3D2BWP U976 ( .A1(n526), .A2(n525), .A3(n708), .ZN(n528) );
  ND3D4BWP U977 ( .A1(n709), .A2(n592), .A3(\dec_logic/checksum/check[15] ), 
        .ZN(n712) );
  NR2D4BWP U978 ( .A1(n737), .A2(n842), .ZN(n714) );
  OAI21D2BWP U979 ( .A1(n712), .A2(\dec_logic/checksum/check[16] ), .B(n715), 
        .ZN(n529) );
  NR2XD1BWP U980 ( .A1(n593), .A2(\dec_logic/checksum/check[16] ), .ZN(n530)
         );
  NR3D4BWP U981 ( .A1(n728), .A2(n530), .A3(n529), .ZN(n720) );
  IND2D4BWP U982 ( .A1(\dec_logic/checksum/check[20] ), .B1(n773), .ZN(n768)
         );
  ND2D1BWP U983 ( .A1(n673), .A2(n777), .ZN(n532) );
  AOI21D1BWP U984 ( .A1(n776), .A2(n777), .B(n1015), .ZN(n533) );
  OA211D4BWP U985 ( .A1(n534), .A2(n778), .B(n533), .C(n532), .Z(n536) );
  AN2XD1BWP U986 ( .A1(n1016), .A2(\dec_logic/checksum/check[23] ), .Z(n538)
         );
  AOI21D1BWP U987 ( .A1(n789), .A2(n539), .B(n1014), .ZN(n541) );
  IND3D1BWP U988 ( .A1(n541), .B1(n540), .B2(n801), .ZN(n542) );
  XNR2D1BWP U989 ( .A1(n676), .A2(n542), .ZN(n545) );
  OAI21D1BWP U990 ( .A1(n598), .A2(\dec_logic/three_six_load[9] ), .B(n826), 
        .ZN(n548) );
  XOR3D1BWP U991 ( .A1(\dec_logic/checksum/check[16] ), .A2(
        \dec_logic/checksum/check[17] ), .A3(n551), .Z(n552) );
  XNR2D1BWP U992 ( .A1(\dec_logic/checksum/check[15] ), .A2(
        \dec_logic/checksum/check[14] ), .ZN(n553) );
  XNR2D1BWP U993 ( .A1(\dec_logic/checksum/check[10] ), .A2(
        \dec_logic/checksum/check[13] ), .ZN(n554) );
  OAI22D1BWP U994 ( .A1(\dec_logic/three_six_load[8] ), .A2(n1068), .B1(n1066), 
        .B2(n1067), .ZN(n555) );
  MUX2ND0BWP U995 ( .I0(\dec_logic/three_six_load[1] ), .I1(n1069), .S(
        \dec_logic/three_six_load[2] ), .ZN(n556) );
  XOR3D1BWP U996 ( .A1(\dec_logic/checksum/check[18] ), .A2(
        \dec_logic/checksum/check[20] ), .A3(n552), .Z(n557) );
  XNR2D1BWP U997 ( .A1(\dec_logic/raw[6] ), .A2(\dec_logic/three_six_load[5] ), 
        .ZN(n559) );
  AOI21D1BWP U998 ( .A1(n1067), .A2(n1066), .B(n555), .ZN(n561) );
  ND2D1BWP U999 ( .A1(n558), .A2(n557), .ZN(n563) );
  XNR2D1BWP U1000 ( .A1(n560), .A2(n559), .ZN(n564) );
  IOA21D1BWP U1001 ( .A1(n1068), .A2(\dec_logic/three_six_load[8] ), .B(n561), 
        .ZN(n565) );
  XNR2D1BWP U1002 ( .A1(n562), .A2(\dec_logic/raw[1] ), .ZN(n567) );
  NR3D0BWP U1003 ( .A1(n565), .A2(n564), .A3(n563), .ZN(n569) );
  NR3D0BWP U1004 ( .A1(n567), .A2(n589), .A3(n566), .ZN(n570) );
  OR3XD1BWP U1005 ( .A1(n1118), .A2(n572), .A3(n1119), .Z(n573) );
  OAI211D2BWP U1006 ( .A1(n824), .A2(n823), .B(n822), .C(n638), .ZN(n637) );
  AOI22D2BWP U1007 ( .A1(n695), .A2(\dec_logic/checksum/check[11] ), .B1(n694), 
        .B2(\dec_logic/checksum/check[12] ), .ZN(n747) );
  XNR3D2BWP U1008 ( .A1(n765), .A2(n764), .A3(n763), .ZN(n798) );
  ND2D2BWP U1009 ( .A1(n794), .A2(n724), .ZN(n799) );
  ND2D2BWP U1010 ( .A1(n784), .A2(n783), .ZN(n785) );
  AN2XD1BWP U1011 ( .A1(n656), .A2(n823), .Z(n575) );
  MUX2D4BWP U1012 ( .I0(n660), .I1(n661), .S(n575), .Z(n600) );
  OAI21D4BWP U1013 ( .A1(n903), .A2(n858), .B(n994), .ZN(n906) );
  CKND2D0BWP U1014 ( .A1(n904), .A2(n981), .ZN(n908) );
  CKND2BWP U1015 ( .I(n905), .ZN(n859) );
  CKND4BWP U1016 ( .I(n712), .ZN(n737) );
  NR2XD1BWP U1017 ( .A1(n845), .A2(n701), .ZN(n736) );
  NR2XD1BWP U1018 ( .A1(n733), .A2(n732), .ZN(n763) );
  ND2D4BWP U1019 ( .A1(n602), .A2(n843), .ZN(n593) );
  XOR3D1BWP U1020 ( .A1(n943), .A2(n633), .A3(n944), .Z(n968) );
  AOI21D1BWP U1021 ( .A1(n968), .A2(n967), .B(n966), .ZN(n970) );
  AOI31D2BWP U1022 ( .A1(n618), .A2(n799), .A3(n619), .B(n620), .ZN(n617) );
  ND3D2BWP U1023 ( .A1(n975), .A2(n978), .A3(n509), .ZN(n976) );
  AO21D1BWP U1024 ( .A1(n577), .A2(n509), .B(n578), .Z(n455) );
  XOR2D1BWP U1025 ( .A1(n978), .A2(n634), .Z(n577) );
  AOI21D1BWP U1026 ( .A1(n917), .A2(n1029), .B(n1028), .ZN(n916) );
  OAI31D2BWP U1027 ( .A1(n792), .A2(n1010), .A3(n791), .B(n1064), .ZN(n653) );
  IAO21D2BWP U1028 ( .A1(n917), .A2(n1029), .B(n916), .ZN(n924) );
  CKND2BWP U1029 ( .I(n941), .ZN(n964) );
  OAI21D4BWP U1030 ( .A1(n720), .A2(n719), .B(n1018), .ZN(n769) );
  IND2D2BWP U1031 ( .A1(n1017), .B1(n769), .ZN(n778) );
  CKND0BWP U1032 ( .I(n721), .ZN(n722) );
  NR2XD1BWP U1033 ( .A1(n736), .A2(n734), .ZN(n751) );
  CKND0BWP U1034 ( .I(n780), .ZN(n779) );
  ND2D2BWP U1035 ( .A1(n790), .A2(n1013), .ZN(n780) );
  ND2D2BWP U1036 ( .A1(n658), .A2(n657), .ZN(n660) );
  ND3D2BWP U1037 ( .A1(n810), .A2(\dec_logic/checksum/check[27] ), .A3(
        \dec_logic/three_six_load[10] ), .ZN(n652) );
  NR3D1BWP U1038 ( .A1(n793), .A2(n659), .A3(n599), .ZN(n661) );
  MOAI22D0BWP U1039 ( .A1(n832), .A2(n507), .B1(\dec_logic/three_six_load[8] ), 
        .B2(n833), .ZN(Packet_To_Node[8]) );
  ND2D3BWP U1040 ( .A1(n775), .A2(n769), .ZN(n773) );
  ND3D2BWP U1041 ( .A1(n714), .A2(n593), .A3(n713), .ZN(n718) );
  ND2D2BWP U1042 ( .A1(n594), .A2(n716), .ZN(n717) );
  CKND2BWP U1043 ( .I(n918), .ZN(n920) );
  CKND2BWP U1044 ( .I(n921), .ZN(n878) );
  ND2D2BWP U1045 ( .A1(n592), .A2(n709), .ZN(n602) );
  OA21D1BWP U1046 ( .A1(n720), .A2(n719), .B(n1018), .Z(n673) );
  XNR2D2BWP U1047 ( .A1(n579), .A2(\dec_logic/checksum/check[7] ), .ZN(n692)
         );
  NR2XD3BWP U1048 ( .A1(n790), .A2(n1013), .ZN(n796) );
  ND2D2BWP U1049 ( .A1(n868), .A2(n869), .ZN(n913) );
  ND2D2BWP U1050 ( .A1(n911), .A2(n864), .ZN(n868) );
  XNR3D2BWP U1051 ( .A1(n963), .A2(n964), .A3(n965), .ZN(n980) );
  INR2XD2BWP U1052 ( .A1(\enc_logic/checksum[11] ), .B1(n856), .ZN(n903) );
  NR2XD0BWP U1053 ( .A1(n707), .A2(n700), .ZN(n702) );
  NR2XD1BWP U1054 ( .A1(n786), .A2(n792), .ZN(n821) );
  XOR3D2BWP U1055 ( .A1(n745), .A2(n747), .A3(n746), .Z(n750) );
  NR2XD1BWP U1056 ( .A1(n613), .A2(n922), .ZN(n921) );
  CKND2BWP U1057 ( .I(n590), .ZN(n601) );
  ND2D3BWP U1058 ( .A1(n589), .A2(n1019), .ZN(n590) );
  NR2XD1BWP U1059 ( .A1(n874), .A2(n1027), .ZN(n918) );
  OAI21D2BWP U1060 ( .A1(n820), .A2(n819), .B(n818), .ZN(n822) );
  NR2XD1BWP U1061 ( .A1(n704), .A2(n703), .ZN(n705) );
  MOAI22D0BWP U1062 ( .A1(n840), .A2(n508), .B1(n683), .B2(buf_to_mux[38]), 
        .ZN(data_to_tx[38]) );
  MOAI22D0BWP U1063 ( .A1(n848), .A2(n508), .B1(n683), .B2(buf_to_mux[29]), 
        .ZN(data_to_tx[29]) );
  MOAI22D0BWP U1064 ( .A1(n842), .A2(n508), .B1(n683), .B2(buf_to_mux[36]), 
        .ZN(data_to_tx[36]) );
  MOAI22D0BWP U1065 ( .A1(n844), .A2(n508), .B1(n683), .B2(buf_to_mux[34]), 
        .ZN(data_to_tx[34]) );
  MOAI22D0BWP U1066 ( .A1(n1031), .A2(n1105), .B1(n1001), .B2(buf_to_mux[9]), 
        .ZN(n468) );
  MOAI22D0BWP U1067 ( .A1(n993), .A2(n1105), .B1(n1001), .B2(buf_to_mux[16]), 
        .ZN(n461) );
  MOAI22D0BWP U1068 ( .A1(n992), .A2(n1105), .B1(n1001), .B2(buf_to_mux[11]), 
        .ZN(n466) );
  MOAI22D0BWP U1069 ( .A1(n994), .A2(n1105), .B1(n1001), .B2(buf_to_mux[17]), 
        .ZN(n460) );
  MOAI22D0BWP U1070 ( .A1(n991), .A2(n1105), .B1(n1001), .B2(buf_to_mux[10]), 
        .ZN(n467) );
  MOAI22D0BWP U1071 ( .A1(n985), .A2(n1105), .B1(n1001), .B2(buf_to_mux[12]), 
        .ZN(n465) );
  CKND2D0BWP U1072 ( .A1(n579), .A2(\dec_logic/checksum/check[7] ), .ZN(n698)
         );
  NR2XD1BWP U1073 ( .A1(n875), .A2(n1026), .ZN(n922) );
  XNR2D2BWP U1074 ( .A1(n803), .A2(n795), .ZN(n804) );
  NR2XD1BWP U1075 ( .A1(n888), .A2(n1021), .ZN(n977) );
  IND2D2BWP U1076 ( .A1(n808), .B1(n807), .ZN(n823) );
  ND2D2BWP U1077 ( .A1(n588), .A2(\dec_logic/checksum/check[10] ), .ZN(n744)
         );
  XOR3D2BWP U1078 ( .A1(n855), .A2(n854), .A3(n899), .Z(n856) );
  ND2D1BWP U1079 ( .A1(TX_Data_Ready), .A2(n1114), .ZN(n1115) );
  INVD1BWP U1080 ( .I(\dec_logic/checksum/check[18] ), .ZN(n840) );
  INVD1BWP U1081 ( .I(\dec_logic/checksum/check[14] ), .ZN(n844) );
  INVD1BWP U1082 ( .I(\dec_logic/checksum/check[12] ), .ZN(n846) );
  INVD1BWP U1083 ( .I(buf_to_mux[13]), .ZN(n1085) );
  INVD1BWP U1084 ( .I(buf_to_mux[7]), .ZN(n1083) );
  INVD1BWP U1085 ( .I(buf_to_mux[19]), .ZN(n1087) );
  INVD1BWP U1086 ( .I(\enc_logic/checksum[16] ), .ZN(n996) );
  INVD1BWP U1087 ( .I(\enc_logic/checksum[18] ), .ZN(n995) );
  INVD1BWP U1088 ( .I(\enc_logic/checksum[11] ), .ZN(n993) );
  ND2D1BWP U1089 ( .A1(\enc_logic/checksum[13] ), .A2(\enc_logic/checksum[14] ), .ZN(n982) );
  INVD1BWP U1090 ( .I(\dec_logic/checksum/check[6] ), .ZN(n1020) );
  ND2D1BWP U1091 ( .A1(\enc_logic/checksum[18] ), .A2(\enc_logic/checksum[17] ), .ZN(n1089) );
  INVD1BWP U1092 ( .I(\dec_logic/checksum/check[7] ), .ZN(n1033) );
  ND2D1BWP U1093 ( .A1(n581), .A2(\dec_logic/checksum/check[16] ), .ZN(n649)
         );
  ND2D1BWP U1094 ( .A1(n581), .A2(\dec_logic/checksum/check[17] ), .ZN(n641)
         );
  ND2D1BWP U1095 ( .A1(n581), .A2(\dec_logic/checksum/check[19] ), .ZN(n642)
         );
  ND2D1BWP U1096 ( .A1(n835), .A2(\dec_logic/checksum/check[5] ), .ZN(n646) );
  ND2D1BWP U1097 ( .A1(n581), .A2(\dec_logic/checksum/check[13] ), .ZN(n650)
         );
  ND2D1BWP U1098 ( .A1(n835), .A2(\dec_logic/checksum/check[14] ), .ZN(n640)
         );
  ND2D1BWP U1099 ( .A1(n581), .A2(\dec_logic/checksum/check[15] ), .ZN(n651)
         );
  ND2D1BWP U1100 ( .A1(n835), .A2(\dec_logic/checksum/check[23] ), .ZN(n648)
         );
  ND2D1BWP U1101 ( .A1(n581), .A2(\dec_logic/checksum/check[24] ), .ZN(n647)
         );
  ND2D1BWP U1102 ( .A1(n835), .A2(\dec_logic/checksum/check[18] ), .ZN(n644)
         );
  ND2D1BWP U1103 ( .A1(n581), .A2(\dec_logic/checksum/check[22] ), .ZN(n645)
         );
  ND2D1BWP U1104 ( .A1(n835), .A2(\dec_logic/checksum/check[11] ), .ZN(n643)
         );
  INVD1BWP U1105 ( .I(n1111), .ZN(n1032) );
  ND2D1BWP U1106 ( .A1(n1042), .A2(n1007), .ZN(n1052) );
  INVD1BWP U1107 ( .I(\dec_logic/three_six_load[9] ), .ZN(n1065) );
  INVD1BWP U1108 ( .I(\dec_logic/raw[20] ), .ZN(n1062) );
  INVD1BWP U1109 ( .I(\dec_logic/three_six_load[7] ), .ZN(n1058) );
  INVD1BWP U1110 ( .I(\dec_logic/three_six_load[1] ), .ZN(n1069) );
  INVD1BWP U1111 ( .I(n599), .ZN(n657) );
  INVD1BWP U1112 ( .I(n815), .ZN(n820) );
  ND2D1BWP U1113 ( .A1(n1017), .A2(\dec_logic/checksum/check[21] ), .ZN(n770)
         );
  ND2D1BWP U1114 ( .A1(n794), .A2(n800), .ZN(n803) );
  ND2D1BWP U1115 ( .A1(n723), .A2(n722), .ZN(n724) );
  ND2D1BWP U1116 ( .A1(n596), .A2(n674), .ZN(n794) );
  ND2D1BWP U1117 ( .A1(\dec_logic/checksum/check[18] ), .A2(
        \dec_logic/checksum/check[17] ), .ZN(n710) );
  ND2D1BWP U1118 ( .A1(n760), .A2(n759), .ZN(n761) );
  ND2D1BWP U1119 ( .A1(n755), .A2(n754), .ZN(n760) );
  ND2D1BWP U1120 ( .A1(n749), .A2(n748), .ZN(n756) );
  ND2D1BWP U1121 ( .A1(n741), .A2(n740), .ZN(n752) );
  INVD1BWP U1122 ( .I(\dec_logic/checksum/check[17] ), .ZN(n841) );
  ND2D1BWP U1123 ( .A1(n711), .A2(n672), .ZN(n725) );
  INVD1BWP U1124 ( .I(n708), .ZN(n703) );
  ND2D1BWP U1125 ( .A1(n591), .A2(n744), .ZN(n706) );
  ND2D1BWP U1126 ( .A1(\dec_logic/checksum/check[6] ), .A2(
        \dec_logic/checksum/check[5] ), .ZN(n743) );
  INVD1BWP U1127 ( .I(\dec_logic/checksum/encoder/N25 ), .ZN(n830) );
  INVD1BWP U1128 ( .I(\dec_logic/checksum/check[11] ), .ZN(n847) );
  INVD1BWP U1129 ( .I(n693), .ZN(n695) );
  ND2D1BWP U1130 ( .A1(n744), .A2(n590), .ZN(n693) );
  ND2D1BWP U1131 ( .A1(n979), .A2(n509), .ZN(n971) );
  ND2D1BWP U1132 ( .A1(n946), .A2(n945), .ZN(n952) );
  INVD1BWP U1133 ( .I(\enc_logic/checksum[27] ), .ZN(n1021) );
  ND2D1BWP U1134 ( .A1(n964), .A2(n887), .ZN(n888) );
  ND2D1BWP U1135 ( .A1(n886), .A2(n1022), .ZN(n887) );
  ND2D1BWP U1136 ( .A1(n942), .A2(n885), .ZN(n886) );
  ND2D1BWP U1137 ( .A1(n884), .A2(n1023), .ZN(n885) );
  INVD1BWP U1138 ( .I(n962), .ZN(n963) );
  INVD1BWP U1139 ( .I(\enc_logic/checksum[25] ), .ZN(n1023) );
  ND2D1BWP U1140 ( .A1(n881), .A2(n1024), .ZN(n882) );
  INVD1BWP U1141 ( .I(n961), .ZN(n883) );
  INVD1BWP U1142 ( .I(\enc_logic/checksum[23] ), .ZN(n1025) );
  XNR2D2BWP U1143 ( .A1(n940), .A2(n587), .ZN(n962) );
  ND2D1BWP U1144 ( .A1(n923), .A2(n587), .ZN(n943) );
  ND2D1BWP U1145 ( .A1(n877), .A2(\enc_logic/checksum[23] ), .ZN(n613) );
  ND2D1BWP U1146 ( .A1(n874), .A2(n1027), .ZN(n612) );
  ND2D1BWP U1147 ( .A1(n926), .A2(n624), .ZN(n940) );
  ND2D1BWP U1148 ( .A1(n623), .A2(n920), .ZN(n624) );
  ND2D1BWP U1149 ( .A1(n919), .A2(n918), .ZN(n926) );
  INVD1BWP U1150 ( .I(\enc_logic/checksum[21] ), .ZN(n1027) );
  INVD1BWP U1151 ( .I(\enc_logic/checksum[15] ), .ZN(n909) );
  INVD1BWP U1152 ( .I(\enc_logic/checksum[13] ), .ZN(n981) );
  ND2D1BWP U1153 ( .A1(n902), .A2(\enc_logic/checksum[10] ), .ZN(n934) );
  INVD1BWP U1154 ( .I(\enc_logic/checksum[9] ), .ZN(n992) );
  INVD1BWP U1155 ( .I(\enc_logic/checksum[8] ), .ZN(n991) );
  INVD1BWP U1156 ( .I(\enc_logic/checksum[20] ), .ZN(n1028) );
  INVD1BWP U1157 ( .I(\enc_logic/checksum[19] ), .ZN(n1029) );
  INVD1BWP U1158 ( .I(n868), .ZN(n871) );
  INVD1BWP U1159 ( .I(n939), .ZN(n680) );
  INVD1BWP U1160 ( .I(\enc_logic/checksum[17] ), .ZN(n1030) );
  INVD1BWP U1161 ( .I(n864), .ZN(n865) );
  INVD1BWP U1162 ( .I(n910), .ZN(n911) );
  ND2D1BWP U1163 ( .A1(n862), .A2(n863), .ZN(n910) );
  ND2D1BWP U1164 ( .A1(n860), .A2(n861), .ZN(n862) );
  ND2D1BWP U1165 ( .A1(n889), .A2(\enc_logic/check/N25 ), .ZN(n851) );
  INVD1BWP U1166 ( .I(\enc_logic/check/N25 ), .ZN(n999) );
  AO21D1BWP U1167 ( .A1(n1109), .A2(\rHandshake/state[0] ), .B(n1051), .Z(
        RX_Data_Ready) );
  OAI211D1BWP U1168 ( .A1(n1005), .A2(n1108), .B(RX_Data_Valid), .C(n1109), 
        .ZN(\rHandshake/next_state[0] ) );
  OAI211D1BWP U1169 ( .A1(n1050), .A2(n1074), .B(n1046), .C(n1045), .ZN(
        \main_control/next_state[2] ) );
  OA211D1BWP U1170 ( .A1(n1044), .A2(n1052), .B(n1078), .C(n1117), .Z(n1045)
         );
  AO22D1BWP U1171 ( .A1(\dec_logic/three_six_load[3] ), .A2(n684), .B1(
        buf_to_mux[9]), .B2(n510), .Z(data_to_tx[9]) );
  AO22D1BWP U1172 ( .A1(\dec_logic/raw[8] ), .A2(n684), .B1(buf_to_mux[8]), 
        .B2(n510), .Z(data_to_tx[8]) );
  AO22D1BWP U1173 ( .A1(\dec_logic/three_six_load[2] ), .A2(n684), .B1(
        buf_to_mux[5]), .B2(n510), .Z(data_to_tx[5]) );
  AO22D1BWP U1174 ( .A1(address[2]), .A2(n684), .B1(n510), .B2(buf_to_mux[50]), 
        .Z(data_to_tx[50]) );
  AO22D1BWP U1175 ( .A1(address[1]), .A2(n684), .B1(n683), .B2(buf_to_mux[49]), 
        .Z(data_to_tx[49]) );
  AO22D1BWP U1176 ( .A1(address[3]), .A2(n684), .B1(n510), .B2(buf_to_mux[51]), 
        .Z(data_to_tx[51]) );
  AO22D1BWP U1177 ( .A1(address[0]), .A2(n684), .B1(n683), .B2(buf_to_mux[48]), 
        .Z(data_to_tx[48]) );
  MOAI22D0BWP U1178 ( .A1(n841), .A2(n508), .B1(n683), .B2(buf_to_mux[37]), 
        .ZN(data_to_tx[37]) );
  MOAI22D0BWP U1179 ( .A1(n847), .A2(n508), .B1(n683), .B2(buf_to_mux[31]), 
        .ZN(data_to_tx[31]) );
  MOAI22D0BWP U1180 ( .A1(n845), .A2(n508), .B1(n683), .B2(buf_to_mux[33]), 
        .ZN(data_to_tx[33]) );
  MOAI22D0BWP U1181 ( .A1(n843), .A2(n508), .B1(n683), .B2(buf_to_mux[35]), 
        .ZN(data_to_tx[35]) );
  MOAI22D0BWP U1182 ( .A1(n846), .A2(n508), .B1(n683), .B2(buf_to_mux[32]), 
        .ZN(data_to_tx[32]) );
  ND4D1BWP U1183 ( .A1(n1046), .A2(n1043), .A3(n1054), .A4(n1052), .ZN(
        \main_control/next_state[1] ) );
  AOI211XD0BWP U1184 ( .A1(n1076), .A2(n1050), .B(n1055), .C(n1004), .ZN(n1043) );
  AOI211XD0BWP U1185 ( .A1(n1032), .A2(n1049), .B(n1041), .C(n1119), .ZN(n1046) );
  IND4D1BWP U1186 ( .A1(n1080), .B1(n1079), .B2(n1078), .B3(n1111), .ZN(n478)
         );
  IND2D1BWP U1187 ( .A1(n1081), .B1(Packet_From_Node_Valid), .ZN(n1078) );
  OAI211D1BWP U1188 ( .A1(n1112), .A2(n1073), .B(n1002), .C(n1072), .ZN(n479)
         );
  INR2D1BWP U1189 ( .A1(n1048), .B1(n1047), .ZN(n1071) );
  AOI21D1BWP U1190 ( .A1(\enc_logic/checksum[11] ), .A2(
        \enc_logic/checksum[10] ), .B(\enc_logic/checksum[12] ), .ZN(n986) );
  AO22D1BWP U1191 ( .A1(\dec_logic/three_six_load[5] ), .A2(n684), .B1(
        buf_to_mux[11]), .B2(n510), .Z(data_to_tx[11]) );
  AO22D1BWP U1192 ( .A1(\dec_logic/three_six_load[4] ), .A2(n684), .B1(
        buf_to_mux[10]), .B2(n510), .Z(data_to_tx[10]) );
  AO22D1BWP U1193 ( .A1(\dec_logic/three_six_load[8] ), .A2(n684), .B1(
        buf_to_mux[17]), .B2(n510), .Z(data_to_tx[17]) );
  AO22D1BWP U1194 ( .A1(\dec_logic/checksum/encoder/N25 ), .A2(n684), .B1(
        buf_to_mux[24]), .B2(n510), .Z(data_to_tx[24]) );
  AO22D1BWP U1195 ( .A1(\dec_logic/raw[1] ), .A2(n684), .B1(buf_to_mux[1]), 
        .B2(n510), .Z(data_to_tx[1]) );
  AO22D1BWP U1196 ( .A1(\dec_logic/raw[12] ), .A2(n684), .B1(buf_to_mux[12]), 
        .B2(n510), .Z(data_to_tx[12]) );
  AO22D1BWP U1197 ( .A1(\dec_logic/raw[18] ), .A2(n684), .B1(buf_to_mux[18]), 
        .B2(n510), .Z(data_to_tx[18]) );
  AO22D1BWP U1198 ( .A1(\dec_logic/raw[14] ), .A2(n684), .B1(buf_to_mux[14]), 
        .B2(n510), .Z(data_to_tx[14]) );
  AO22D1BWP U1199 ( .A1(\dec_logic/three_six_load[6] ), .A2(n684), .B1(
        buf_to_mux[15]), .B2(n510), .Z(data_to_tx[15]) );
  OAI211D1BWP U1200 ( .A1(n1031), .A2(n991), .B(n1000), .C(n992), .ZN(n990) );
  OAI22D1BWP U1201 ( .A1(n80), .A2(n585), .B1(n1010), .B2(n508), .ZN(
        data_to_tx[47]) );
  ND4D1BWP U1202 ( .A1(n1000), .A2(n1030), .A3(n996), .A4(n995), .ZN(n998) );
  AO21D1BWP U1203 ( .A1(n1001), .A2(buf_to_mux[14]), .B(n1086), .Z(n463) );
  AO21D1BWP U1204 ( .A1(n1001), .A2(buf_to_mux[0]), .B(n1082), .Z(n477) );
  AO21D1BWP U1205 ( .A1(n1001), .A2(buf_to_mux[8]), .B(n1084), .Z(n469) );
  AO22D1BWP U1206 ( .A1(n1000), .A2(n897), .B1(n1001), .B2(buf_to_mux[1]), .Z(
        n476) );
  AO22D1BWP U1207 ( .A1(n1000), .A2(\enc_logic/checksum[10] ), .B1(n1001), 
        .B2(buf_to_mux[15]), .Z(n462) );
  AO22D1BWP U1208 ( .A1(n1001), .A2(buf_to_mux[2]), .B1(n1000), .B2(n1088), 
        .Z(n475) );
  AOI22D1BWP U1209 ( .A1(n1030), .A2(n995), .B1(n996), .B2(n1089), .ZN(n894)
         );
  ND3D1BWP U1210 ( .A1(n1000), .A2(n991), .A3(n1031), .ZN(n989) );
  AO22D1BWP U1211 ( .A1(n1000), .A2(\enc_logic/checksum[6] ), .B1(n1001), .B2(
        buf_to_mux[5]), .Z(n472) );
  AO22D1BWP U1212 ( .A1(n1000), .A2(\enc_logic/checksum[5] ), .B1(n1001), .B2(
        buf_to_mux[4]), .Z(n473) );
  AO22D1BWP U1213 ( .A1(n1000), .A2(\enc_logic/check/N25 ), .B1(n1001), .B2(
        buf_to_mux[3]), .Z(n474) );
  AOI211XD0BWP U1214 ( .A1(n1001), .A2(buf_to_mux[43]), .B(n1102), .C(n1101), 
        .ZN(n1103) );
  AOI211XD0BWP U1215 ( .A1(n1001), .A2(buf_to_mux[37]), .B(n1097), .C(n1096), 
        .ZN(n1098) );
  AOI211XD0BWP U1216 ( .A1(n1001), .A2(buf_to_mux[31]), .B(n1093), .C(n1092), 
        .ZN(n892) );
  AO21D1BWP U1217 ( .A1(n1001), .A2(buf_to_mux[53]), .B(n509), .Z(n432) );
  AO222D1BWP U1218 ( .A1(n1026), .A2(n1097), .B1(n509), .B2(
        \enc_logic/checksum[16] ), .C1(n1001), .C2(buf_to_mux[36]), .Z(n441)
         );
  AO222D1BWP U1219 ( .A1(n1029), .A2(n1093), .B1(n509), .B2(
        \enc_logic/checksum[10] ), .C1(n1001), .C2(buf_to_mux[30]), .Z(n447)
         );
  AO222D1BWP U1220 ( .A1(n1023), .A2(n1102), .B1(n509), .B2(
        \enc_logic/checksum[22] ), .C1(n1001), .C2(buf_to_mux[42]), .Z(n435)
         );
  AO222D1BWP U1221 ( .A1(n1001), .A2(buf_to_mux[39]), .B1(
        \enc_logic/checksum[19] ), .B2(n509), .C1(n1000), .C2(
        \enc_logic/checksum[22] ), .Z(n438) );
  AO222D1BWP U1222 ( .A1(n1001), .A2(buf_to_mux[41]), .B1(
        \enc_logic/checksum[21] ), .B2(n509), .C1(n1000), .C2(
        \enc_logic/checksum[24] ), .Z(n436) );
  AO222D1BWP U1223 ( .A1(n1001), .A2(buf_to_mux[40]), .B1(
        \enc_logic/checksum[20] ), .B2(n509), .C1(n1000), .C2(
        \enc_logic/checksum[23] ), .Z(n437) );
  AO222D1BWP U1224 ( .A1(n1001), .A2(buf_to_mux[28]), .B1(
        \enc_logic/checksum[17] ), .B2(n1000), .C1(\enc_logic/checksum[8] ), 
        .C2(n509), .Z(n449) );
  AO222D1BWP U1225 ( .A1(n1001), .A2(buf_to_mux[34]), .B1(
        \enc_logic/checksum[20] ), .B2(n1000), .C1(\enc_logic/checksum[14] ), 
        .C2(n509), .Z(n443) );
  AO222D1BWP U1226 ( .A1(n1001), .A2(buf_to_mux[29]), .B1(
        \enc_logic/checksum[18] ), .B2(n1000), .C1(\enc_logic/checksum[9] ), 
        .C2(n509), .Z(n448) );
  AO222D1BWP U1227 ( .A1(n1001), .A2(buf_to_mux[35]), .B1(
        \enc_logic/checksum[21] ), .B2(n1000), .C1(\enc_logic/checksum[15] ), 
        .C2(n509), .Z(n442) );
  AO222D1BWP U1228 ( .A1(n1001), .A2(buf_to_mux[27]), .B1(
        \enc_logic/checksum[16] ), .B2(n1000), .C1(\enc_logic/checksum[7] ), 
        .C2(n509), .Z(n450) );
  AO222D1BWP U1229 ( .A1(n1001), .A2(buf_to_mux[33]), .B1(
        \enc_logic/checksum[19] ), .B2(n1000), .C1(\enc_logic/checksum[13] ), 
        .C2(n509), .Z(n444) );
  OAI21D1BWP U1230 ( .A1(n627), .A2(n1104), .B(n628), .ZN(n456) );
  IAO21D1BWP U1231 ( .A1(n86), .A2(n629), .B(n630), .ZN(n628) );
  XNR2D1BWP U1232 ( .A1(n980), .A2(n977), .ZN(n627) );
  IOA21D1BWP U1233 ( .A1(n1118), .A2(tx_data_select[0]), .B(n663), .ZN(n662)
         );
  INR3D0BWP U1234 ( .A1(n1002), .B1(n664), .B2(n1080), .ZN(n663) );
  NR3D0BWP U1235 ( .A1(n1112), .A2(\main_control/state[3] ), .A3(n1008), .ZN(
        n686) );
  AOI32D1BWP U1236 ( .A1(\enc_logic/checksum[25] ), .A2(n1107), .A3(n1106), 
        .B1(n1105), .B2(n1107), .ZN(n433) );
  AOI22D1BWP U1237 ( .A1(n1001), .A2(buf_to_mux[44]), .B1(n509), .B2(
        \enc_logic/checksum[24] ), .ZN(n1107) );
  AOI32D1BWP U1238 ( .A1(\enc_logic/checksum[22] ), .A2(n1100), .A3(n1099), 
        .B1(n1105), .B2(n1100), .ZN(n439) );
  AOI22D1BWP U1239 ( .A1(n1001), .A2(buf_to_mux[38]), .B1(n509), .B2(
        \enc_logic/checksum[18] ), .ZN(n1100) );
  AOI32D1BWP U1240 ( .A1(\enc_logic/checksum[19] ), .A2(n1095), .A3(n1094), 
        .B1(n1105), .B2(n1095), .ZN(n445) );
  AOI22D1BWP U1241 ( .A1(n1001), .A2(buf_to_mux[32]), .B1(n509), .B2(
        \enc_logic/checksum[12] ), .ZN(n1095) );
  AOI32D1BWP U1242 ( .A1(\enc_logic/checksum[16] ), .A2(n1091), .A3(n1090), 
        .B1(n1105), .B2(n1091), .ZN(n451) );
  AOI22D1BWP U1243 ( .A1(n1001), .A2(buf_to_mux[26]), .B1(n509), .B2(
        \enc_logic/checksum[6] ), .ZN(n1091) );
  OAI22D1BWP U1244 ( .A1(n507), .A2(n649), .B1(n839), .B2(n1033), .ZN(
        Packet_To_Node[12]) );
  OAI22D1BWP U1245 ( .A1(n682), .A2(n641), .B1(n839), .B2(n849), .ZN(
        Packet_To_Node[13]) );
  OAI22D1BWP U1246 ( .A1(n507), .A2(n642), .B1(n839), .B2(n845), .ZN(
        Packet_To_Node[15]) );
  OAI22D1BWP U1247 ( .A1(n682), .A2(n646), .B1(n839), .B2(n1069), .ZN(
        Packet_To_Node[1]) );
  OAI22D1BWP U1248 ( .A1(n682), .A2(n650), .B1(n839), .B2(n1065), .ZN(
        Packet_To_Node[9]) );
  OAI22D1BWP U1249 ( .A1(n507), .A2(n640), .B1(n839), .B2(n1064), .ZN(
        Packet_To_Node[10]) );
  OAI22D1BWP U1250 ( .A1(n682), .A2(n651), .B1(n839), .B2(n1060), .ZN(
        Packet_To_Node[11]) );
  OAI22D1BWP U1251 ( .A1(n648), .A2(n682), .B1(n839), .B2(n1017), .ZN(
        Packet_To_Node[19]) );
  OAI22D1BWP U1252 ( .A1(n507), .A2(n647), .B1(n839), .B2(n1016), .ZN(
        Packet_To_Node[20]) );
  OAI22D1BWP U1253 ( .A1(n644), .A2(n507), .B1(n839), .B2(n848), .ZN(
        Packet_To_Node[14]) );
  OAI22D1BWP U1254 ( .A1(n507), .A2(n645), .B1(n839), .B2(n1018), .ZN(
        Packet_To_Node[18]) );
  OAI22D1BWP U1255 ( .A1(n682), .A2(n643), .B1(n839), .B2(n1058), .ZN(
        Packet_To_Node[7]) );
  AOI211XD0BWP U1256 ( .A1(n687), .A2(n1009), .B(n1055), .C(n685), .ZN(n1003)
         );
  ND3D1BWP U1257 ( .A1(data_type[0]), .A2(data_type[1]), .A3(\dec_logic/token ), .ZN(n1048) );
  IND3D1BWP U1258 ( .A1(\dec_logic/token ), .B1(data_type[1]), .B2(
        data_type[0]), .ZN(n1050) );
  IOA21D1BWP U1259 ( .A1(n815), .A2(n816), .B(n654), .ZN(n656) );
  XNR3D1BWP U1260 ( .A1(\dec_logic/checksum/check[25] ), .A2(
        \dec_logic/checksum/check[24] ), .A3(n790), .ZN(n632) );
  XOR2D1BWP U1261 ( .A1(\dec_logic/checksum/check[27] ), .A2(
        \dec_logic/raw[20] ), .Z(n812) );
  AOI21D1BWP U1262 ( .A1(n790), .A2(n787), .B(n1011), .ZN(n783) );
  OAI211D1BWP U1263 ( .A1(n796), .A2(n779), .B(n1012), .C(n1011), .ZN(n782) );
  XNR2D1BWP U1264 ( .A1(n818), .A2(n817), .ZN(n807) );
  OAI21D1BWP U1265 ( .A1(n806), .A2(n805), .B(n815), .ZN(n808) );
  INR2D1BWP U1266 ( .A1(n1060), .B1(n766), .ZN(n620) );
  IND2D1BWP U1267 ( .A1(n621), .B1(n762), .ZN(n619) );
  XNR2D1BWP U1268 ( .A1(n726), .A2(n610), .ZN(n595) );
  IAO21D1BWP U1269 ( .A1(n761), .A2(n1060), .B(n798), .ZN(n618) );
  MUX2D1BWP U1270 ( .I0(n762), .I1(\dec_logic/three_six_load[11] ), .S(n761), 
        .Z(n767) );
  IND2D1BWP U1271 ( .A1(n1060), .B1(n766), .ZN(n762) );
  AOI22D1BWP U1272 ( .A1(n752), .A2(n764), .B1(n763), .B2(n765), .ZN(n766) );
  XOR2D1BWP U1273 ( .A1(n746), .A2(n745), .Z(n749) );
  XNR3D1BWP U1274 ( .A1(n736), .A2(n735), .A3(n750), .ZN(n739) );
  AOI22D1BWP U1275 ( .A1(n731), .A2(\dec_logic/checksum/check[18] ), .B1(n730), 
        .B2(n729), .ZN(n732) );
  XNR2D1BWP U1276 ( .A1(n726), .A2(n725), .ZN(n733) );
  OAI21D1BWP U1277 ( .A1(n603), .A2(\dec_logic/checksum/check[13] ), .B(
        \dec_logic/checksum/check[14] ), .ZN(n604) );
  XNR2D1BWP U1278 ( .A1(n698), .A2(n697), .ZN(n742) );
  OAI21D1BWP U1279 ( .A1(n696), .A2(n830), .B(n743), .ZN(n697) );
  OAI22D1BWP U1280 ( .A1(n692), .A2(n691), .B1(n848), .B2(n849), .ZN(n745) );
  OAI211D1BWP U1281 ( .A1(n1104), .A2(n980), .B(n973), .C(n971), .ZN(n972) );
  AOI22D1BWP U1282 ( .A1(n1000), .A2(\enc_logic/checksum[15] ), .B1(n1001), 
        .B2(buf_to_mux[23]), .ZN(n973) );
  XNR2D1BWP U1283 ( .A1(n966), .A2(n969), .ZN(n675) );
  AOI21D1BWP U1284 ( .A1(n957), .A2(n956), .B(n955), .ZN(n958) );
  XOR2D1BWP U1285 ( .A1(n952), .A2(n951), .Z(n959) );
  OAI21D1BWP U1286 ( .A1(n950), .A2(n949), .B(n948), .ZN(n951) );
  AOI21D1BWP U1287 ( .A1(n944), .A2(n943), .B(n681), .ZN(n966) );
  INR2D1BWP U1288 ( .A1(n883), .B1(n960), .ZN(n965) );
  XNR3D1BWP U1289 ( .A1(\enc_logic/checksum[25] ), .A2(n1024), .A3(n881), .ZN(
        n880) );
  OAI21D1BWP U1290 ( .A1(n876), .A2(n922), .B(n1025), .ZN(n879) );
  XNR3D1BWP U1291 ( .A1(n953), .A2(n954), .A3(n957), .ZN(n945) );
  XNR3D1BWP U1292 ( .A1(n948), .A2(n947), .A3(n950), .ZN(n954) );
  OAI21D1BWP U1293 ( .A1(n934), .A2(n933), .B(n932), .ZN(n948) );
  AOI22D1BWP U1294 ( .A1(n931), .A2(n930), .B1(n929), .B2(
        \enc_logic/checksum[7] ), .ZN(n932) );
  NR2XD0BWP U1295 ( .A1(n931), .A2(n930), .ZN(n933) );
  IND2D1BWP U1296 ( .A1(n924), .B1(n679), .ZN(n925) );
  XNR2D1BWP U1297 ( .A1(n622), .A2(n680), .ZN(n679) );
  XNR2D1BWP U1298 ( .A1(\enc_logic/checksum[19] ), .A2(
        \enc_logic/checksum[20] ), .ZN(n611) );
  XOR3D1BWP U1299 ( .A1(n680), .A2(n924), .A3(n622), .Z(n919) );
  XNR2D1BWP U1300 ( .A1(n928), .A2(n927), .ZN(n622) );
  AOI22D1BWP U1301 ( .A1(n908), .A2(\enc_logic/checksum[14] ), .B1(n907), .B2(
        n906), .ZN(n938) );
  XNR2D1BWP U1302 ( .A1(n936), .A2(n935), .ZN(n937) );
  XNR3D1BWP U1303 ( .A1(n930), .A2(n931), .A3(n934), .ZN(n936) );
  OAI22D1BWP U1304 ( .A1(n901), .A2(n900), .B1(n991), .B2(n992), .ZN(n931) );
  AOI21D1BWP U1305 ( .A1(\enc_logic/check/N25 ), .A2(n891), .B(n890), .ZN(n897) );
  IND2D1BWP U1306 ( .A1(n1031), .B1(n896), .ZN(n898) );
  XNR2D1BWP U1307 ( .A1(\enc_logic/checksum[17] ), .A2(
        \enc_logic/checksum[18] ), .ZN(n873) );
  AOI22D1BWP U1308 ( .A1(\enc_logic/checksum[18] ), .A2(n915), .B1(n914), .B2(
        \enc_logic/checksum[17] ), .ZN(n939) );
  XOR2D1BWP U1309 ( .A1(\enc_logic/checksum[16] ), .A2(
        \enc_logic/checksum[15] ), .Z(n864) );
  XOR2D1BWP U1310 ( .A1(\enc_logic/checksum[13] ), .A2(
        \enc_logic/checksum[14] ), .Z(n861) );
  XNR2D1BWP U1311 ( .A1(\enc_logic/checksum[10] ), .A2(\enc_logic/checksum[9] ), .ZN(n854) );
  XNR2D1BWP U1312 ( .A1(\enc_logic/checksum[8] ), .A2(\enc_logic/checksum[7] ), 
        .ZN(n855) );
  AOI21D1BWP U1313 ( .A1(n593), .A2(\dec_logic/checksum/check[16] ), .B(n576), 
        .ZN(n738) );
  AOI31D1BWP U1314 ( .A1(n594), .A2(n842), .A3(n710), .B(n606), .ZN(n607) );
  OAI21D1BWP U1315 ( .A1(n711), .A2(n608), .B(n607), .ZN(n609) );
  XNR2D1BWP U1316 ( .A1(n609), .A2(n725), .ZN(n610) );
  OAI22D1BWP U1317 ( .A1(n962), .A2(n961), .B1(n960), .B2(n941), .ZN(n626) );
  XOR2D1BWP U1318 ( .A1(n946), .A2(n945), .Z(n633) );
  XOR2D1BWP U1319 ( .A1(n818), .A2(n817), .Z(n654) );
  OAI31D1BWP U1320 ( .A1(n848), .A2(n834), .A3(n682), .B(n665), .ZN(
        Packet_To_Node[5]) );
  OAI31D1BWP U1321 ( .A1(n849), .A2(n834), .A3(n507), .B(n666), .ZN(
        Packet_To_Node[4]) );
  OAI31D1BWP U1322 ( .A1(n1020), .A2(n834), .A3(n507), .B(n667), .ZN(
        Packet_To_Node[2]) );
  OAI31D1BWP U1323 ( .A1(n1016), .A2(n834), .A3(n682), .B(n668), .ZN(
        Packet_To_Node[17]) );
  OAI31D1BWP U1324 ( .A1(n1017), .A2(n834), .A3(n682), .B(n669), .ZN(
        Packet_To_Node[16]) );
  OAI31D1BWP U1325 ( .A1(n1033), .A2(n834), .A3(n507), .B(n670), .ZN(
        Packet_To_Node[3]) );
  OAI31D1BWP U1326 ( .A1(n1019), .A2(n834), .A3(n507), .B(n671), .ZN(
        Packet_To_Node[6]) );
  OAI21D1BWP U1327 ( .A1(n727), .A2(n728), .B(n841), .ZN(n731) );
  AOI22D1BWP U1328 ( .A1(n912), .A2(\enc_logic/checksum[16] ), .B1(n911), .B2(
        \enc_logic/checksum[15] ), .ZN(n927) );
  XNR2D1BWP U1329 ( .A1(n946), .A2(n945), .ZN(n681) );
  OAI21D1BWP U1330 ( .A1(n1075), .A2(n1074), .B(n1003), .ZN(n1118) );
  XNR3D1BWP U1331 ( .A1(\enc_logic/checksum[8] ), .A2(\enc_logic/checksum[9] ), 
        .A3(n901), .ZN(n902) );
  XNR2D1BWP U1332 ( .A1(n970), .A2(n969), .ZN(n974) );
  XOR2D1BWP U1333 ( .A1(\enc_logic/checksum[5] ), .A2(\enc_logic/checksum[6] ), 
        .Z(n853) );
  AOI31D1BWP U1334 ( .A1(n831), .A2(n835), .A3(n830), .B(n829), .ZN(
        Packet_To_Node[0]) );
  OAI22D1BWP U1335 ( .A1(n803), .A2(n515), .B1(n802), .B2(n801), .ZN(n817) );
  NR3D0BWP U1336 ( .A1(\main_control/state[3] ), .A2(n1051), .A3(n1057), .ZN(
        n1041) );
  NR3D0BWP U1337 ( .A1(\main_control/state[1] ), .A2(n5), .A3(
        \main_control/state[2] ), .ZN(n1042) );
  NR4D0BWP U1338 ( .A1(r_addr[3]), .A2(r_addr[1]), .A3(r_addr[2]), .A4(
        r_addr[0]), .ZN(n1044) );
  MUX2ND0BWP U1339 ( .I0(\dec_logic/three_six_load[7] ), .I1(n1058), .S(
        \dec_logic/raw[13] ), .ZN(n1059) );
  MUX2ND0BWP U1340 ( .I0(n1060), .I1(\dec_logic/three_six_load[11] ), .S(
        \dec_logic/raw[18] ), .ZN(n1061) );
  MUX2ND0BWP U1341 ( .I0(n1062), .I1(\dec_logic/raw[20] ), .S(n1061), .ZN(
        n1063) );
  MUX2ND0BWP U1342 ( .I0(n1064), .I1(\dec_logic/three_six_load[10] ), .S(n1063), .ZN(n1067) );
  MUX2ND0BWP U1343 ( .I0(n1065), .I1(\dec_logic/three_six_load[9] ), .S(
        \dec_logic/raw[19] ), .ZN(n1066) );
  NR4D0BWP U1344 ( .A1(\enc_logic/checksum[5] ), .A2(\enc_logic/checksum[6] ), 
        .A3(\enc_logic/check/N25 ), .A4(n1105), .ZN(n1082) );
  NR3D0BWP U1345 ( .A1(\enc_logic/checksum[21] ), .A2(\enc_logic/checksum[20] ), .A3(n1105), .ZN(n1093) );
  NR3D0BWP U1346 ( .A1(\enc_logic/checksum[24] ), .A2(\enc_logic/checksum[23] ), .A3(n1105), .ZN(n1097) );
  NR3D0BWP U1347 ( .A1(\enc_logic/checksum[27] ), .A2(\enc_logic/checksum[26] ), .A3(n1105), .ZN(n1102) );
endmodule

