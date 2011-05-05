
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
         \dec_logic/checksum/encoder/N25 , n6, n81, n82, n83, n104, n442, n443,
         n444, n445, n446, n447, n448, n449, n450, n451, n452, n453, n454,
         n455, n456, n457, n458, n459, n460, n461, n462, n463, n464, n465,
         n466, n467, n468, n469, n470, n471, n472, n473, n474, n475, n476,
         n477, n478, n479, n480, n481, n482, n483, n484, n485, n486, n487,
         n488, n489, n491, n492, n493, n494, n495, n496, n497, n498, n499,
         n500, n501, n502, n503, n504, n505, n506, n507, n508, n509, n510,
         n511, n512, n513, n514, n515, n516, n517, n518, n519, n521, n522,
         n523, n524, n525, n526, n527, n528, n529, n530, n531, n532, n533,
         n534, n535, n536, n537, n538, n539, n540, n544, n545, n546, n547,
         n548, n549, n553, n554, n555, n556, n557, n558, n559, n560, n561,
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
         n804, n805, n806, n807, n808, n809, n810, n811, n812, n813, n814,
         n815, n816, n817, n818, n819, n820, n821, n822, n823, n824, n825,
         n826, n827, n828, n829, n830, n831, n832, n833, n834, n835, n836,
         n837, n838, n839, n840, n841, n842, n843, n844, n845, n846, n847,
         n848, n849, n850, n851, n852, n853, n854, n855, n856, n857, n858,
         n859, n860, n861, n862, n863, n864, n865, n866, n867, n868, n869,
         n870, n871, n872, n873, n874, n875, n876, n877, n878, n879, n880,
         n881, n882, n883, n884, n885, n886, n887, n888, n889, n890, n891,
         n892, n893, n894, n895, n896, n897, n898, n899, n900, n901, n902,
         n903, n904, n905, n906, n907, n908, n909, n910, n911, n912, n913,
         n914, n915, n916, n917, n918, n919, n920, n921, n922, n923, n924,
         n925, n926, n927, n928, n929, n930, n931, n932, n933, n934, n935,
         n936, n937, n938, n939, n940, n941, n942, n943, n944, n945, n946,
         n947, n948, n949, n950, n951, n952, n953, n954, n955, n956, n957,
         n958, n959, n960, n961, n962, n963, n964, n965, n966, n967, n968,
         n969, n970, n971, n972, n973, n974, n975, n976, n977, n978, n979,
         n980, n981, n982, n983, n984, n985, n986, n987, n988, n989, n990,
         n991, n992, n993, n994, n995, n996, n997, n998, n999, n1000, n1001,
         n1002, n1003, n1004, n1005, n1006, n1007, n1008, n1009, n1010, n1011,
         n1012, n1013, n1014, n1015, n1016, n1017, n1018, n1019, n1020, n1021,
         n1022, n1023, n1024, n1025, n1026, n1027, n1028, n1029, n1030, n1031,
         n1032, n1033, n1034, n1035, n1036, n1037, n1038, n1039, n1040, n1041,
         n1042, n1043, n1044, n1045, n1046, n1047, n1048, n1049, n1050, n1051,
         n1052, n1053, n1054, n1055, n1056, n1057, n1058, n1059, n1060, n1061,
         n1062, n1063, n1064, n1065, n1066, n1067, n1068, n1069, n1070, n1071,
         n1072, n1073, n1074, n1075, n1076, n1077, n1078, n1079, n1080, n1081,
         n1082, n1083, n1084, n1085, n1086, n1087, n1088, n1089, n1090, n1091,
         n1092, n1093, n1094, n1095, n1096, n1097, n1098;
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
  DFCNQD1BWP \main_control/state_reg[1]  ( .D(\main_control/next_state[1] ), 
        .CP(Clk_R), .CDN(Rst_n), .Q(\main_control/state[1] ) );
  DFCNQD1BWP \rHandshake/state_reg[1]  ( .D(\rHandshake/next_state[1] ), .CP(
        Clk_R), .CDN(Rst_n), .Q(\rHandshake/state[1] ) );
  DFCNQD1BWP \ever_versetile/out_reg[1]  ( .D(n485), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[1]) );
  DFCNQD1BWP \ever_versetile/out_reg[0]  ( .D(n486), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[0]) );
  DFCNQD1BWP \ever_versetile/out_reg[2]  ( .D(n484), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[2]) );
  DFCNQD1BWP \ever_versetile/out_reg[3]  ( .D(n483), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[3]) );
  DFCNQD1BWP \ever_versetile/out_reg[4]  ( .D(n482), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[4]) );
  DFCNQD1BWP \ever_versetile/out_reg[5]  ( .D(n481), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[5]) );
  DFCNQD1BWP \ever_versetile/out_reg[6]  ( .D(n480), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[6]) );
  DFCNQD1BWP \ever_versetile/out_reg[7]  ( .D(n479), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[7]) );
  DFCNQD1BWP \ever_versetile/out_reg[8]  ( .D(n478), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[8]) );
  DFCNQD1BWP \ever_versetile/out_reg[9]  ( .D(n477), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[9]) );
  DFCNQD1BWP \ever_versetile/out_reg[10]  ( .D(n476), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[10]) );
  DFCNQD1BWP \ever_versetile/out_reg[11]  ( .D(n475), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[11]) );
  DFCNQD1BWP \ever_versetile/out_reg[12]  ( .D(n474), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[12]) );
  DFCNQD1BWP \ever_versetile/out_reg[13]  ( .D(n473), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[13]) );
  DFCNQD1BWP \ever_versetile/out_reg[14]  ( .D(n472), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[14]) );
  DFCNQD1BWP \ever_versetile/out_reg[15]  ( .D(n471), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[15]) );
  DFCNQD1BWP \ever_versetile/out_reg[16]  ( .D(n470), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[16]) );
  DFCNQD1BWP \ever_versetile/out_reg[17]  ( .D(n469), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[17]) );
  DFCNQD1BWP \ever_versetile/out_reg[18]  ( .D(n468), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[18]) );
  DFCNQD1BWP \ever_versetile/out_reg[19]  ( .D(n467), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[19]) );
  DFCNQD1BWP \ever_versetile/out_reg[20]  ( .D(n466), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[20]) );
  DFCNQD1BWP \ever_versetile/out_reg[21]  ( .D(n465), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[21]) );
  DFCNQD1BWP \ever_versetile/out_reg[22]  ( .D(n464), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[22]) );
  DFCNQD1BWP \ever_versetile/out_reg[24]  ( .D(n462), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[24]) );
  DFCNQD1BWP \ever_versetile/out_reg[25]  ( .D(n461), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[25]) );
  DFCNQD1BWP \ever_versetile/out_reg[26]  ( .D(n460), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[26]) );
  DFCNQD1BWP \ever_versetile/out_reg[27]  ( .D(n459), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[27]) );
  DFCNQD1BWP \ever_versetile/out_reg[28]  ( .D(n458), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[28]) );
  DFCNQD1BWP \ever_versetile/out_reg[29]  ( .D(n457), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[29]) );
  DFCNQD1BWP \ever_versetile/out_reg[30]  ( .D(n456), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[30]) );
  DFCNQD1BWP \ever_versetile/out_reg[31]  ( .D(n455), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[31]) );
  DFCNQD1BWP \ever_versetile/out_reg[32]  ( .D(n454), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[32]) );
  DFCNQD1BWP \ever_versetile/out_reg[33]  ( .D(n453), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[33]) );
  DFCNQD1BWP \ever_versetile/out_reg[34]  ( .D(n452), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[34]) );
  DFCNQD1BWP \ever_versetile/out_reg[35]  ( .D(n451), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[35]) );
  DFCNQD1BWP \ever_versetile/out_reg[36]  ( .D(n450), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[36]) );
  DFCNQD1BWP \ever_versetile/out_reg[37]  ( .D(n449), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[37]) );
  DFCNQD1BWP \ever_versetile/out_reg[38]  ( .D(n448), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[38]) );
  DFCNQD1BWP \ever_versetile/out_reg[39]  ( .D(n447), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[39]) );
  DFCNQD1BWP \ever_versetile/out_reg[40]  ( .D(n446), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[40]) );
  DFCNQD1BWP \ever_versetile/out_reg[41]  ( .D(n445), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[41]) );
  DFCNQD1BWP \ever_versetile/out_reg[42]  ( .D(n444), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[42]) );
  DFCNQD1BWP \ever_versetile/out_reg[43]  ( .D(n443), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[43]) );
  DFCNQD1BWP \ever_versetile/out_reg[44]  ( .D(n442), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[44]) );
  EDFCNQD1BWP \ever_versetile/out_reg[48]  ( .D(enc_to_buf[48]), .E(n104), 
        .CP(Clk_R), .CDN(Rst_n), .Q(buf_to_mux[48]) );
  EDFCNQD1BWP \ever_versetile/out_reg[49]  ( .D(enc_to_buf[49]), .E(n104), 
        .CP(Clk_R), .CDN(Rst_n), .Q(buf_to_mux[49]) );
  EDFCNQD1BWP \ever_versetile/out_reg[50]  ( .D(enc_to_buf[50]), .E(n104), 
        .CP(Clk_R), .CDN(Rst_n), .Q(buf_to_mux[50]) );
  EDFCNQD1BWP \ever_versetile/out_reg[51]  ( .D(enc_to_buf[51]), .E(n104), 
        .CP(Clk_R), .CDN(Rst_n), .Q(buf_to_mux[51]) );
  EDFCNQD1BWP \ever_versetile/out_reg[52]  ( .D(\enc_logic/encode_type ), .E(
        n104), .CP(Clk_R), .CDN(Rst_n), .Q(buf_to_mux[52]) );
  EDFCNQD1BWP \ever_versetile/out_reg[53]  ( .D(n1000), .E(n104), .CP(Clk_R), 
        .CDN(Rst_n), .Q(buf_to_mux[53]) );
  DFCNQD1BWP \tHandshake/state_reg[0]  ( .D(\tHandshake/next_state[0] ), .CP(
        Clk_R), .CDN(Rst_n), .Q(\tHandshake/state[0] ) );
  DFCNQD1BWP \tHandshake/state_reg[1]  ( .D(\tHandshake/next_state[1] ), .CP(
        Clk_R), .CDN(Rst_n), .Q(TX_Data_Valid) );
  DFCNQD1BWP \main_control/select_sig_reg[2]  ( .D(n489), .CP(Clk_R), .CDN(
        Rst_n), .Q(tx_data_select[2]) );
  DFCNQD1BWP \main_control/select_sig_reg[0]  ( .D(n488), .CP(Clk_R), .CDN(
        Rst_n), .Q(tx_data_select[0]) );
  DFCNQD1BWP \main_control/select_sig_reg[1]  ( .D(n487), .CP(Clk_R), .CDN(
        Rst_n), .Q(tx_data_select[1]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[9]  ( .D(data_to_tx[9]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[9]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[8]  ( .D(data_to_tx[8]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[8]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[7]  ( .D(data_to_tx[7]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[7]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[6]  ( .D(data_to_tx[6]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[6]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[5]  ( .D(data_to_tx[5]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[5]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[53]  ( .D(data_to_tx[53]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[53]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[52]  ( .D(data_to_tx[52]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[52]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[51]  ( .D(data_to_tx[51]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[51]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[50]  ( .D(data_to_tx[50]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[50]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[49]  ( .D(data_to_tx[49]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[49]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[48]  ( .D(data_to_tx[48]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[48]) );
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
  EDFCNQD1BWP \tHandshake/TX_Data_reg[17]  ( .D(data_to_tx[17]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[17]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[15]  ( .D(data_to_tx[15]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[15]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[14]  ( .D(data_to_tx[14]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[14]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[13]  ( .D(data_to_tx[13]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[13]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[12]  ( .D(data_to_tx[12]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[12]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[11]  ( .D(data_to_tx[11]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[11]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[0]  ( .D(data_to_tx[0]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[0]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[10]  ( .D(data_to_tx[10]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[10]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[16]  ( .D(data_to_tx[16]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[16]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[24]  ( .D(data_to_tx[24]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[24]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[25]  ( .D(data_to_tx[25]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[25]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[26]  ( .D(data_to_tx[26]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[26]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[27]  ( .D(data_to_tx[27]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[27]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[28]  ( .D(data_to_tx[28]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[28]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[29]  ( .D(data_to_tx[29]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[29]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[30]  ( .D(data_to_tx[30]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[30]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[31]  ( .D(data_to_tx[31]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[31]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[32]  ( .D(data_to_tx[32]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[32]) );
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
  EDFCNQD1BWP \tHandshake/TX_Data_reg[42]  ( .D(data_to_tx[42]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[42]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[43]  ( .D(data_to_tx[43]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[43]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[44]  ( .D(data_to_tx[44]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[44]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[45]  ( .D(data_to_tx[45]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[45]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[46]  ( .D(data_to_tx[46]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[46]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[47]  ( .D(data_to_tx[47]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[47]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[4]  ( .D(data_to_tx[4]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[4]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[54]  ( .D(data_to_tx[54]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[54]) );
  EDFCND1BWP \ever_versetile/out_reg[45]  ( .D(\enc_logic/checksum[25] ), .E(
        n104), .CP(Clk_R), .CDN(Rst_n), .QN(n81) );
  EDFCND1BWP \ever_versetile/out_reg[46]  ( .D(\enc_logic/checksum[26] ), .E(
        n104), .CP(Clk_R), .CDN(Rst_n), .QN(n82) );
  EDFCND1BWP \ever_versetile/out_reg[47]  ( .D(\enc_logic/checksum[27] ), .E(
        n104), .CP(Clk_R), .CDN(Rst_n), .QN(n83) );
  DFCNQD1BWP \ever_versetile/out_reg[23]  ( .D(n463), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[23]) );
  DFCNQD1BWP \main_control/state_reg[2]  ( .D(\main_control/next_state[2] ), 
        .CP(Clk_R), .CDN(Rst_n), .Q(\main_control/state[2] ) );
  DFSND1BWP \main_control/state_reg[0]  ( .D(n635), .CP(Clk_R), .SDN(Rst_n), 
        .QN(n6) );
  DFCND1BWP \rHandshake/state_reg[0]  ( .D(\rHandshake/next_state[0] ), .CP(
        Clk_R), .CDN(Rst_n), .Q(\rHandshake/state[0] ), .QN(n986) );
  INVD1BWP U582 ( .I(n589), .ZN(n539) );
  IND3D2BWP U583 ( .A1(n808), .B1(n807), .B2(n577), .ZN(n824) );
  INVD1BWP U584 ( .I(n735), .ZN(n610) );
  ND2D1BWP U585 ( .A1(n796), .A2(n619), .ZN(n620) );
  INVD1BWP U586 ( .I(n785), .ZN(n521) );
  CKND2BWP U587 ( .I(n740), .ZN(n785) );
  ND2D1BWP U588 ( .A1(n824), .A2(n546), .ZN(n583) );
  INVD1BWP U589 ( .I(\tHandshake/state[0] ), .ZN(n987) );
  INR2D1BWP U590 ( .A1(n545), .B1(\main_control/state[1] ), .ZN(n978) );
  XNR2D1BWP U591 ( .A1(n725), .A2(\dec_logic/checksum/check[7] ), .ZN(n727) );
  ND2D2BWP U592 ( .A1(n744), .A2(n745), .ZN(n756) );
  AOI31D1BWP U593 ( .A1(n701), .A2(\dec_logic/checksum/check[21] ), .A3(n996), 
        .B(\dec_logic/checksum/check[22] ), .ZN(n597) );
  NR3D2BWP U594 ( .A1(n708), .A2(n991), .A3(\dec_logic/checksum/check[26] ), 
        .ZN(n607) );
  ND2D1BWP U595 ( .A1(n518), .A2(n610), .ZN(n777) );
  INR2D1BWP U596 ( .A1(\enc_logic/checksum[17] ), .B1(n866), .ZN(n573) );
  ND2D1BWP U597 ( .A1(n795), .A2(n794), .ZN(n782) );
  NR2XD0BWP U598 ( .A1(n748), .A2(n747), .ZN(n767) );
  XNR2D1BWP U599 ( .A1(n775), .A2(n774), .ZN(n792) );
  ND2D1BWP U600 ( .A1(\dec_logic/three_six_load[10] ), .A2(n785), .ZN(n523) );
  INVD1BWP U601 ( .I(n739), .ZN(n528) );
  CKND2BWP U602 ( .I(n554), .ZN(n790) );
  OAI211D1BWP U603 ( .A1(n949), .A2(n642), .B(n973), .C(n951), .ZN(n644) );
  NR3D0BWP U604 ( .A1(tx_data_select[0]), .A2(tx_data_select[2]), .A3(n1016), 
        .ZN(n1017) );
  NR2D3BWP U605 ( .A1(n833), .A2(n834), .ZN(n840) );
  NR2XD0BWP U606 ( .A1(n674), .A2(n6), .ZN(n980) );
  CKND2BWP U607 ( .I(n1086), .ZN(n974) );
  ND2D2BWP U608 ( .A1(n104), .A2(\enc_logic/encode_type ), .ZN(n1086) );
  CKND4BWP U609 ( .I(n104), .ZN(n975) );
  INVD1BWP U610 ( .I(n980), .ZN(n680) );
  CKND3BWP U611 ( .I(n694), .ZN(n718) );
  INVD1BWP U612 ( .I(n687), .ZN(n822) );
  ND2D1BWP U613 ( .A1(n583), .A2(n634), .ZN(n635) );
  MOAI22D0BWP U614 ( .A1(n1059), .A2(n669), .B1(buf_to_mux[4]), .B2(n667), 
        .ZN(data_to_tx[4]) );
  MOAI22D0BWP U615 ( .A1(n992), .A2(n669), .B1(buf_to_mux[44]), .B2(n667), 
        .ZN(data_to_tx[44]) );
  MOAI22D0BWP U616 ( .A1(n993), .A2(n669), .B1(buf_to_mux[43]), .B2(n668), 
        .ZN(data_to_tx[43]) );
  MOAI22D0BWP U617 ( .A1(n994), .A2(n669), .B1(buf_to_mux[42]), .B2(n667), 
        .ZN(data_to_tx[42]) );
  MOAI22D0BWP U618 ( .A1(n995), .A2(n669), .B1(buf_to_mux[41]), .B2(n668), 
        .ZN(data_to_tx[41]) );
  MOAI22D0BWP U619 ( .A1(n996), .A2(n669), .B1(buf_to_mux[40]), .B2(n668), 
        .ZN(data_to_tx[40]) );
  MOAI22D0BWP U620 ( .A1(n997), .A2(n669), .B1(buf_to_mux[39]), .B2(n668), 
        .ZN(data_to_tx[39]) );
  MOAI22D0BWP U621 ( .A1(n1011), .A2(n669), .B1(buf_to_mux[27]), .B2(n668), 
        .ZN(data_to_tx[27]) );
  MOAI22D0BWP U622 ( .A1(n998), .A2(n669), .B1(buf_to_mux[26]), .B2(n668), 
        .ZN(data_to_tx[26]) );
  MOAI22D0BWP U623 ( .A1(n1046), .A2(n669), .B1(buf_to_mux[16]), .B2(n667), 
        .ZN(data_to_tx[16]) );
  MOAI22D0BWP U624 ( .A1(n1057), .A2(n669), .B1(buf_to_mux[10]), .B2(n668), 
        .ZN(data_to_tx[10]) );
  MOAI22D0BWP U625 ( .A1(n1066), .A2(n544), .B1(\dec_logic/raw[13] ), .B2(n670), .ZN(data_to_tx[13]) );
  MOAI22D0BWP U626 ( .A1(n1068), .A2(n544), .B1(\dec_logic/raw[19] ), .B2(n670), .ZN(data_to_tx[19]) );
  MOAI22D0BWP U627 ( .A1(n1051), .A2(n669), .B1(buf_to_mux[20]), .B2(n667), 
        .ZN(data_to_tx[20]) );
  MOAI22D0BWP U628 ( .A1(n1048), .A2(n669), .B1(buf_to_mux[21]), .B2(n668), 
        .ZN(data_to_tx[21]) );
  MOAI22D0BWP U629 ( .A1(n1053), .A2(n669), .B1(buf_to_mux[22]), .B2(n668), 
        .ZN(data_to_tx[22]) );
  MOAI22D0BWP U630 ( .A1(n1049), .A2(n669), .B1(buf_to_mux[23]), .B2(n668), 
        .ZN(data_to_tx[23]) );
  MOAI22D0BWP U631 ( .A1(n1064), .A2(n544), .B1(\dec_logic/raw[7] ), .B2(n670), 
        .ZN(data_to_tx[7]) );
  ND2D2BWP U632 ( .A1(n680), .A2(n679), .ZN(n104) );
  INVD1BWP U633 ( .I(n978), .ZN(n679) );
  ND3D3BWP U634 ( .A1(n718), .A2(\dec_logic/checksum/check[16] ), .A3(n695), 
        .ZN(n696) );
  CKND0BWP U635 ( .I(n916), .ZN(n491) );
  AOI22D0BWP U636 ( .A1(n918), .A2(n917), .B1(n491), .B2(n915), .ZN(n492) );
  OAI21D0BWP U637 ( .A1(n491), .A2(n915), .B(n492), .ZN(n934) );
  CKND0BWP U638 ( .I(n1037), .ZN(n493) );
  AOI211D0BWP U639 ( .A1(n979), .A2(n493), .B(n1039), .C(n1040), .ZN(n494) );
  OA21D0BWP U640 ( .A1(n1045), .A2(\tHandshake/state[0] ), .B(n494), .Z(n977)
         );
  IND2D0BWP U641 ( .A1(n919), .B1(n920), .ZN(n939) );
  OAI22D0BWP U642 ( .A1(n1021), .A2(address[0]), .B1(address[2]), .B2(n1022), 
        .ZN(n495) );
  AOI22D0BWP U643 ( .A1(n1023), .A2(address[1]), .B1(address[3]), .B2(n1024), 
        .ZN(n496) );
  AOI22D0BWP U644 ( .A1(n1021), .A2(address[0]), .B1(address[2]), .B2(n1022), 
        .ZN(n497) );
  ND3D0BWP U645 ( .A1(n1095), .A2(n496), .A3(n497), .ZN(n498) );
  OAI22D0BWP U646 ( .A1(n1023), .A2(address[1]), .B1(address[3]), .B2(n1024), 
        .ZN(n499) );
  NR4D0BWP U647 ( .A1(n984), .A2(n495), .A3(n498), .A4(n499), .ZN(n983) );
  INR3D0BWP U648 ( .A1(n982), .B1(n6), .B2(\main_control/state[3] ), .ZN(n1039) );
  IND2D1BWP U649 ( .A1(n731), .B1(n812), .ZN(n733) );
  NR2D0BWP U650 ( .A1(n751), .A2(n752), .ZN(n500) );
  AOI31D0BWP U651 ( .A1(\dec_logic/checksum/encoder/N25 ), .A2(
        \dec_logic/checksum/check[7] ), .A3(n750), .B(n500), .ZN(n501) );
  AOI32D0BWP U652 ( .A1(n751), .A2(n501), .A3(n752), .B1(n749), .B2(n501), 
        .ZN(n759) );
  OR2D0BWP U653 ( .A1(n904), .A2(n905), .Z(n938) );
  XNR4D0BWP U654 ( .A1(n822), .A2(n823), .A3(\dec_logic/checksum/check[10] ), 
        .A4(\dec_logic/checksum/check[15] ), .ZN(n564) );
  IND2D0BWP U655 ( .A1(n954), .B1(n973), .ZN(n957) );
  ND3D0BWP U656 ( .A1(data_type[1]), .A2(data_type[0]), .A3(n988), .ZN(n1095)
         );
  IND2D0BWP U657 ( .A1(n755), .B1(n756), .ZN(n758) );
  IOA21D0BWP U658 ( .A1(n741), .A2(n517), .B(n743), .ZN(n775) );
  AO21D0BWP U659 ( .A1(n914), .A2(n913), .B(n916), .Z(n933) );
  IAO21D1BWP U660 ( .A1(n900), .A2(n899), .B(n922), .ZN(n928) );
  INR4D0BWP U661 ( .A1(\main_control/state[3] ), .B1(n6), .B2(
        \main_control/state[1] ), .B3(\main_control/state[2] ), .ZN(n979) );
  INR2D0BWP U662 ( .A1(n955), .B1(\enc_logic/checksum[27] ), .ZN(n502) );
  AOI22D0BWP U663 ( .A1(buf_to_mux[20]), .A2(n975), .B1(n960), .B2(n974), .ZN(
        n503) );
  OAI211D0BWP U664 ( .A1(n502), .A2(n957), .B(n961), .C(n503), .ZN(n466) );
  CKND0BWP U665 ( .I(n745), .ZN(n504) );
  MUX2ND0BWP U666 ( .I0(n745), .I1(n504), .S(n744), .ZN(n505) );
  CKND0BWP U667 ( .I(n732), .ZN(n506) );
  AOI22D0BWP U668 ( .A1(n718), .A2(n506), .B1(n755), .B2(n505), .ZN(n507) );
  OAI21D0BWP U669 ( .A1(n755), .A2(n505), .B(n507), .ZN(n765) );
  AOI22D0BWP U670 ( .A1(\dec_logic/checksum/check[21] ), .A2(
        \dec_logic/checksum/check[19] ), .B1(n997), .B2(n995), .ZN(n508) );
  XNR4D0BWP U671 ( .A1(n821), .A2(\dec_logic/checksum/check[16] ), .A3(
        \dec_logic/checksum/check[20] ), .A4(n508), .ZN(n565) );
  CKND0BWP U672 ( .I(n946), .ZN(n509) );
  OAI21D0BWP U673 ( .A1(n947), .A2(n509), .B(n945), .ZN(n510) );
  OAI31D0BWP U674 ( .A1(n947), .A2(n945), .A3(n509), .B(n510), .ZN(n647) );
  OA32D0BWP U675 ( .A1(n840), .A2(\enc_logic/checksum[6] ), .A3(
        \enc_logic/checksum[5] ), .B1(\enc_logic/check/N25 ), .B2(n840), .Z(
        n971) );
  MOAI22D0BWP U676 ( .A1(\main_control/state[2] ), .A2(n1096), .B1(n1061), 
        .B2(n979), .ZN(n511) );
  AO211D0BWP U677 ( .A1(n1098), .A2(tx_data_select[1]), .B(n1062), .C(n511), 
        .Z(n487) );
  CKND0BWP U678 ( .I(n1086), .ZN(n512) );
  IND3D0BWP U679 ( .A1(n1001), .B1(\enc_logic/checksum[25] ), .B2(
        \enc_logic/checksum[26] ), .ZN(n513) );
  AO222D0BWP U680 ( .A1(n512), .A2(n513), .B1(n973), .B2(
        \enc_logic/checksum[24] ), .C1(n975), .C2(buf_to_mux[44]), .Z(n442) );
  CKND0BWP U681 ( .I(n960), .ZN(n514) );
  OAI222D0BWP U682 ( .A1(n514), .A2(n961), .B1(n1086), .B2(n962), .C1(n1068), 
        .C2(n104), .ZN(n467) );
  CKND0BWP U683 ( .I(n966), .ZN(n515) );
  CKND2D0BWP U684 ( .A1(buf_to_mux[12]), .A2(n975), .ZN(n516) );
  OAI31D0BWP U685 ( .A1(\enc_logic/checksum[12] ), .A2(n1086), .A3(n515), .B(
        n516), .ZN(n474) );
  ND2D2BWP U686 ( .A1(n850), .A2(n913), .ZN(n915) );
  AOI21D4BWP U687 ( .A1(n838), .A2(n837), .B(n836), .ZN(n842) );
  CKND3BWP U688 ( .I(n706), .ZN(n705) );
  CKND12BWP U689 ( .I(\enc_logic/checksum[5] ), .ZN(n833) );
  XOR2D2BWP U690 ( .A1(n944), .A2(n943), .Z(n951) );
  XNR2D2BWP U691 ( .A1(n746), .A2(n747), .ZN(n517) );
  XNR2D1BWP U692 ( .A1(n746), .A2(n747), .ZN(n742) );
  ND2D8BWP U693 ( .A1(n731), .A2(\dec_logic/checksum/check[16] ), .ZN(n719) );
  NR2XD4BWP U694 ( .A1(n697), .A2(n694), .ZN(n731) );
  OR3XD1BWP U695 ( .A1(tx_data_select[0]), .A2(tx_data_select[1]), .A3(n1012), 
        .Z(n544) );
  CKBD2BWP U696 ( .I(n1017), .Z(n670) );
  CKND2BWP U697 ( .I(n1085), .ZN(n973) );
  ND2D1BWP U698 ( .A1(n104), .A2(n1000), .ZN(n1085) );
  CKND2BWP U699 ( .I(n779), .ZN(n600) );
  MUX2ND0BWP U700 ( .I0(n741), .I1(n614), .S(n742), .ZN(n518) );
  MUX2D2BWP U701 ( .I0(n1053), .I1(n621), .S(n789), .Z(n624) );
  INR2XD2BWP U702 ( .A1(n577), .B1(n653), .ZN(n519) );
  OA22D1BWP U703 ( .A1(n617), .A2(n773), .B1(n738), .B2(n618), .Z(n535) );
  ND2D2BWP U704 ( .A1(n554), .A2(n1053), .ZN(n621) );
  ND2D1BWP U705 ( .A1(n620), .A2(n521), .ZN(n522) );
  ND2D1BWP U706 ( .A1(n522), .A2(n523), .ZN(n787) );
  INVD3BWP U707 ( .I(n773), .ZN(n602) );
  CKND0BWP U708 ( .I(n776), .ZN(n736) );
  NR2XD2BWP U709 ( .A1(n631), .A2(n630), .ZN(n577) );
  ND2D4BWP U710 ( .A1(n716), .A2(\dec_logic/checksum/check[13] ), .ZN(n745) );
  XNR2D2BWP U711 ( .A1(n842), .A2(n1010), .ZN(n848) );
  NR2D4BWP U712 ( .A1(n918), .A2(n853), .ZN(n861) );
  DCCKND4BWP U713 ( .I(n692), .ZN(n587) );
  NR2XD4BWP U714 ( .A1(n693), .A2(n692), .ZN(n694) );
  ND2D4BWP U715 ( .A1(n691), .A2(\dec_logic/checksum/check[15] ), .ZN(n693) );
  XNR2D2BWP U716 ( .A1(n724), .A2(n723), .ZN(n752) );
  CKND0BWP U717 ( .I(n725), .ZN(n720) );
  ND2D3BWP U718 ( .A1(n705), .A2(n993), .ZN(n707) );
  CKND2BWP U719 ( .I(n584), .ZN(n660) );
  IND2D2BWP U720 ( .A1(n996), .B1(n540), .ZN(n712) );
  OAI22D1BWP U721 ( .A1(n738), .A2(n615), .B1(n991), .B2(n992), .ZN(n616) );
  NR3D4BWP U722 ( .A1(n601), .A2(n600), .A3(n992), .ZN(n773) );
  ND2D2BWP U723 ( .A1(n719), .A2(n756), .ZN(n613) );
  AOI21D4BWP U724 ( .A1(n913), .A2(n846), .B(\enc_logic/checksum[12] ), .ZN(
        n851) );
  ND2D8BWP U725 ( .A1(n738), .A2(n992), .ZN(n771) );
  ND2D4BWP U726 ( .A1(n779), .A2(n707), .ZN(n738) );
  ND2D3BWP U727 ( .A1(n743), .A2(n777), .ZN(n780) );
  ND2D2BWP U728 ( .A1(n779), .A2(n736), .ZN(n737) );
  ND2D4BWP U729 ( .A1(n602), .A2(n771), .ZN(n708) );
  NR3D4BWP U730 ( .A1(n713), .A2(n586), .A3(n585), .ZN(n692) );
  NR2D4BWP U731 ( .A1(n728), .A2(n687), .ZN(n713) );
  OA21D1BWP U732 ( .A1(n771), .A2(\dec_logic/checksum/check[25] ), .B(
        \dec_logic/checksum/check[26] ), .Z(n536) );
  IND2D4BWP U733 ( .A1(n991), .B1(n771), .ZN(n617) );
  ND2D8BWP U734 ( .A1(n751), .A2(n684), .ZN(n728) );
  ND2D3BWP U735 ( .A1(n690), .A2(n689), .ZN(n586) );
  CKND6BWP U736 ( .I(n578), .ZN(n533) );
  IND3D2BWP U737 ( .A1(n808), .B1(n807), .B2(n809), .ZN(n653) );
  AOI211D2BWP U738 ( .A1(n804), .A2(n803), .B(n802), .C(n548), .ZN(n808) );
  CKND1BWP U739 ( .I(n782), .ZN(n783) );
  ND2D1BWP U740 ( .A1(n863), .A2(n959), .ZN(n859) );
  AOI211D1BWP U741 ( .A1(n975), .A2(buf_to_mux[37]), .B(n1078), .C(n1077), 
        .ZN(n1079) );
  AOI211D1BWP U742 ( .A1(n975), .A2(buf_to_mux[43]), .B(n1083), .C(n1082), 
        .ZN(n1084) );
  AOI211D1BWP U743 ( .A1(n975), .A2(buf_to_mux[31]), .B(n1074), .C(n1073), 
        .ZN(n827) );
  AOI31D1BWP U744 ( .A1(\enc_logic/checksum[12] ), .A2(
        \enc_logic/checksum[11] ), .A3(\enc_logic/checksum[10] ), .B(n1086), 
        .ZN(n1067) );
  AOI211XD0BWP U745 ( .A1(\enc_logic/checksum[20] ), .A2(
        \enc_logic/checksum[21] ), .B(\enc_logic/checksum[19] ), .C(n1086), 
        .ZN(n1073) );
  AOI31D1BWP U746 ( .A1(\enc_logic/checksum[9] ), .A2(\enc_logic/checksum[8] ), 
        .A3(\enc_logic/checksum[7] ), .B(n1086), .ZN(n1065) );
  AOI211XD0BWP U747 ( .A1(\enc_logic/checksum[23] ), .A2(
        \enc_logic/checksum[24] ), .B(\enc_logic/checksum[22] ), .C(n1086), 
        .ZN(n1077) );
  AOI211XD0BWP U748 ( .A1(\enc_logic/checksum[26] ), .A2(
        \enc_logic/checksum[27] ), .B(\enc_logic/checksum[25] ), .C(n1086), 
        .ZN(n1082) );
  OAI22D0BWP U749 ( .A1(n988), .A2(n669), .B1(n1016), .B2(n1015), .ZN(
        data_to_tx[54]) );
  INR2XD0BWP U750 ( .A1(n1037), .B1(n983), .ZN(n1061) );
  ND2D8BWP U751 ( .A1(TX_Data_Valid), .A2(n987), .ZN(\tHandshake/N12 ) );
  NR2D0BWP U752 ( .A1(n1004), .A2(n1003), .ZN(n1080) );
  NR2XD3BWP U753 ( .A1(n791), .A2(data_type[0]), .ZN(n809) );
  INVD1BWP U754 ( .I(data_type[1]), .ZN(n791) );
  INVD1BWP U755 ( .I(\enc_logic/encode_type ), .ZN(n1000) );
  CKND8BWP U756 ( .I(\enc_logic/checksum[6] ), .ZN(n834) );
  ND2D4BWP U757 ( .A1(n535), .A2(n536), .ZN(n534) );
  XOR2D1BWP U758 ( .A1(n792), .A2(n547), .Z(n658) );
  INVD1BWP U759 ( .I(n792), .ZN(n793) );
  XOR2D1BWP U760 ( .A1(n892), .A2(n923), .Z(n925) );
  ND2D3BWP U761 ( .A1(n894), .A2(n1003), .ZN(n895) );
  ND2D3BWP U762 ( .A1(n877), .A2(\enc_logic/checksum[22] ), .ZN(n921) );
  CKND4BWP U763 ( .I(n719), .ZN(n732) );
  AOI32D1BWP U764 ( .A1(\enc_logic/checksum[22] ), .A2(n1081), .A3(n1080), 
        .B1(n1086), .B2(n1081), .ZN(n448) );
  AOI32D1BWP U765 ( .A1(\enc_logic/checksum[16] ), .A2(n1072), .A3(n1071), 
        .B1(n1086), .B2(n1072), .ZN(n460) );
  AOI32D1BWP U766 ( .A1(\enc_logic/checksum[19] ), .A2(n1076), .A3(n1075), 
        .B1(n1086), .B2(n1076), .ZN(n454) );
  OAI211D1BWP U767 ( .A1(n1064), .A2(n104), .B(n969), .C(n970), .ZN(n479) );
  ND2D1BWP U768 ( .A1(n1014), .A2(n1015), .ZN(data_to_tx[53]) );
  ND2D1BWP U769 ( .A1(n1013), .A2(n1015), .ZN(data_to_tx[52]) );
  IND2D1BWP U770 ( .A1(\main_control/state[2] ), .B1(n671), .ZN(n674) );
  INVD3BWP U771 ( .I(n1017), .ZN(n669) );
  ND2D2BWP U772 ( .A1(n1069), .A2(n835), .ZN(n836) );
  CKND1BWP U773 ( .I(n1089), .ZN(n1034) );
  ND2D0BWP U774 ( .A1(\main_control/state[2] ), .A2(n985), .ZN(n1025) );
  INVD1BWP U775 ( .I(\main_control/state[1] ), .ZN(n985) );
  IND2D1BWP U776 ( .A1(\rHandshake/state[0] ), .B1(\rHandshake/state[1] ), 
        .ZN(n1089) );
  INVD1BWP U777 ( .I(\main_control/state[3] ), .ZN(n1018) );
  AOI22D0BWP U778 ( .A1(n1009), .A2(n868), .B1(n830), .B2(n1070), .ZN(n829) );
  NR2XD0BWP U779 ( .A1(n1053), .A2(n989), .ZN(n619) );
  ND2D1BWP U780 ( .A1(n819), .A2(n820), .ZN(n726) );
  INVD1BWP U781 ( .I(\dec_logic/checksum/check[27] ), .ZN(n989) );
  INVD1BWP U782 ( .I(\dec_logic/three_six_load[9] ), .ZN(n1048) );
  INVD1BWP U783 ( .I(\dec_logic/checksum/check[16] ), .ZN(n812) );
  INVD1BWP U784 ( .I(\dec_logic/checksum/check[10] ), .ZN(n818) );
  INVD1BWP U785 ( .I(\dec_logic/three_six_load[10] ), .ZN(n1053) );
  MOAI22D1BWP U786 ( .A1(n809), .A2(n820), .B1(n519), .B2(
        \dec_logic/checksum/check[17] ), .ZN(Packet_To_Node[13]) );
  MOAI22D1BWP U787 ( .A1(n809), .A2(n1046), .B1(n519), .B2(
        \dec_logic/checksum/check[11] ), .ZN(Packet_To_Node[7]) );
  ND2D2BWP U788 ( .A1(n824), .A2(n809), .ZN(n810) );
  MOAI22D1BWP U789 ( .A1(n809), .A2(n819), .B1(n519), .B2(
        \dec_logic/checksum/check[18] ), .ZN(Packet_To_Node[14]) );
  MOAI22D1BWP U790 ( .A1(n809), .A2(n806), .B1(n578), .B2(
        \dec_logic/checksum/check[12] ), .ZN(Packet_To_Node[8]) );
  ND2D1BWP U791 ( .A1(n647), .A2(n942), .ZN(n649) );
  IND2D1BWP U792 ( .A1(n580), .B1(n574), .ZN(n804) );
  ND3D2BWP U793 ( .A1(n624), .A2(n786), .A3(n787), .ZN(n625) );
  AOI21D1BWP U794 ( .A1(n787), .A2(n624), .B(n786), .ZN(n628) );
  OAI31D1BWP U795 ( .A1(n646), .A2(n951), .A3(n645), .B(n644), .ZN(n648) );
  CKND2D1BWP U796 ( .A1(n788), .A2(n790), .ZN(n574) );
  NR2D1BWP U797 ( .A1(n788), .A2(\dec_logic/three_six_load[9] ), .ZN(n623) );
  CKND2BWP U798 ( .I(n796), .ZN(n797) );
  NR2D1BWP U799 ( .A1(n947), .A2(n948), .ZN(n642) );
  CKND1BWP U800 ( .I(n664), .ZN(n646) );
  NR2D2BWP U801 ( .A1(n658), .A2(n783), .ZN(n784) );
  CKND1BWP U802 ( .I(n943), .ZN(n641) );
  NR2D2BWP U803 ( .A1(n782), .A2(n781), .ZN(n801) );
  CKND4BWP U804 ( .I(n534), .ZN(n739) );
  AOI21D2BWP U805 ( .A1(n927), .A2(n926), .B(n925), .ZN(n943) );
  NR2D1BWP U806 ( .A1(n581), .A2(n897), .ZN(n582) );
  CKND0BWP U807 ( .I(n949), .ZN(n643) );
  CKXOR2D2BWP U808 ( .A1(n666), .A2(n616), .Z(n740) );
  CKND1BWP U809 ( .I(n898), .ZN(n896) );
  CKND1BWP U810 ( .I(n771), .ZN(n772) );
  CKND1BWP U811 ( .I(n927), .ZN(n581) );
  CKND2D1BWP U812 ( .A1(n946), .A2(n945), .ZN(n948) );
  NR2D1BWP U813 ( .A1(n946), .A2(n945), .ZN(n949) );
  AOI21D2BWP U814 ( .A1(n895), .A2(n923), .B(\enc_logic/checksum[25] ), .ZN(
        n897) );
  XNR2D2BWP U815 ( .A1(n780), .A2(n737), .ZN(n666) );
  ND2D2BWP U816 ( .A1(n903), .A2(n884), .ZN(n922) );
  CKND1BWP U817 ( .I(n884), .ZN(n885) );
  XNR2D1BWP U818 ( .A1(n931), .A2(n930), .ZN(n640) );
  CKND1BWP U819 ( .I(n903), .ZN(n886) );
  INVD1BWP U820 ( .I(n610), .ZN(n531) );
  CKND1BWP U821 ( .I(n874), .ZN(n875) );
  NR2XD2BWP U822 ( .A1(n702), .A2(n995), .ZN(n735) );
  CKND1BWP U823 ( .I(n774), .ZN(n757) );
  ND2D1BWP U824 ( .A1(n596), .A2(\dec_logic/checksum/check[21] ), .ZN(n598) );
  CKXOR2D1BWP U825 ( .A1(n901), .A2(n525), .Z(n873) );
  XOR2D1BWP U826 ( .A1(n902), .A2(n882), .Z(n877) );
  CKND1BWP U827 ( .I(n878), .ZN(n880) );
  CKND2D2BWP U828 ( .A1(n878), .A2(n869), .ZN(n920) );
  CKXOR2D2BWP U829 ( .A1(n611), .A2(n755), .Z(n746) );
  CKND1BWP U830 ( .I(n764), .ZN(n766) );
  CKND2D1BWP U831 ( .A1(n711), .A2(n703), .ZN(n592) );
  XNR2D1BWP U832 ( .A1(n904), .A2(n905), .ZN(n919) );
  INVD3BWP U833 ( .I(n711), .ZN(n709) );
  BUFFD4BWP U834 ( .I(n704), .Z(n540) );
  AOI22D2BWP U835 ( .A1(n734), .A2(n608), .B1(\dec_logic/checksum/check[18] ), 
        .B2(\dec_logic/checksum/check[17] ), .ZN(n747) );
  CKND1BWP U836 ( .I(n758), .ZN(n761) );
  IND2D2BWP U837 ( .A1(n867), .B1(n573), .ZN(n869) );
  CKND2D1BWP U838 ( .A1(n856), .A2(n956), .ZN(n858) );
  NR2D3BWP U839 ( .A1(n590), .A2(n732), .ZN(n700) );
  CKND1BWP U840 ( .I(n856), .ZN(n857) );
  INVD1BWP U841 ( .I(n859), .ZN(n860) );
  CKND1BWP U842 ( .I(n861), .ZN(n855) );
  OAI21D0BWP U843 ( .A1(n1085), .A2(n1004), .B(n1084), .ZN(n443) );
  OAI21D0BWP U844 ( .A1(n1085), .A2(n1009), .B(n1079), .ZN(n449) );
  OAI21D0BWP U845 ( .A1(n1085), .A2(n963), .B(n827), .ZN(n455) );
  OAI222D0BWP U846 ( .A1(n833), .A2(n1085), .B1(n1086), .B2(n829), .C1(n104), 
        .C2(n828), .ZN(n461) );
  OAI22D0BWP U847 ( .A1(n1086), .A2(n965), .B1(n104), .B2(n1066), .ZN(n473) );
  OAI32D0BWP U848 ( .A1(n1042), .A2(n549), .A3(n1041), .B1(tx_data_select[2]), 
        .B2(n1042), .ZN(n1043) );
  CKND1BWP U849 ( .I(n852), .ZN(n850) );
  NR2D1BWP U850 ( .A1(n754), .A2(n753), .ZN(n760) );
  OAI21D2BWP U851 ( .A1(n852), .A2(n851), .B(n958), .ZN(n854) );
  CKND1BWP U852 ( .I(n1027), .ZN(n1028) );
  CKND0BWP U853 ( .I(n977), .ZN(n1041) );
  NR2XD2BWP U854 ( .A1(n914), .A2(n847), .ZN(n852) );
  CKND1BWP U855 ( .I(n911), .ZN(n605) );
  ND2D2BWP U856 ( .A1(n846), .A2(\enc_logic/checksum[12] ), .ZN(n914) );
  CKND2BWP U857 ( .I(n847), .ZN(n913) );
  AOI31D1BWP U858 ( .A1(n572), .A2(n571), .A3(n570), .B(n569), .ZN(n546) );
  AN2XD1BWP U859 ( .A1(n690), .A2(n689), .Z(n661) );
  OAI211D0BWP U860 ( .A1(n680), .A2(n1095), .B(n1036), .C(n1035), .ZN(
        \main_control/next_state[3] ) );
  OAI211D0BWP U861 ( .A1(n6), .A2(n1025), .B(n1044), .C(n1045), .ZN(n1019) );
  OAI21D0BWP U862 ( .A1(n1045), .A2(n987), .B(n678), .ZN(n1062) );
  XNR2D1BWP U863 ( .A1(n841), .A2(n971), .ZN(n907) );
  ND2D2BWP U864 ( .A1(n845), .A2(n963), .ZN(n846) );
  AOI22D0BWP U865 ( .A1(\main_control/state[2] ), .A2(n1032), .B1(n979), .B2(
        n1037), .ZN(n1036) );
  CKND1BWP U866 ( .I(n1044), .ZN(n676) );
  OAI21D0BWP U867 ( .A1(n6), .A2(n1090), .B(n976), .ZN(n825) );
  AOI211D0BWP U868 ( .A1(n1096), .A2(n632), .B(n972), .C(n987), .ZN(n633) );
  ND2D0BWP U869 ( .A1(n672), .A2(n6), .ZN(n678) );
  CKND2D0BWP U870 ( .A1(n980), .A2(n981), .ZN(n1045) );
  ND2D2BWP U871 ( .A1(n526), .A2(n818), .ZN(n684) );
  XOR3D2BWP U872 ( .A1(n844), .A2(n843), .A3(n842), .Z(n845) );
  OAI22D0BWP U873 ( .A1(n82), .A2(n544), .B1(n990), .B2(n669), .ZN(
        data_to_tx[46]) );
  CKND2D0BWP U874 ( .A1(n978), .A2(n1095), .ZN(n632) );
  CKND0BWP U875 ( .I(n674), .ZN(n672) );
  OA32D0BWP U876 ( .A1(n1094), .A2(\tHandshake/state[0] ), .A3(TX_Data_Ready), 
        .B1(TX_Data_Valid), .B2(n1094), .Z(\tHandshake/next_state[1] ) );
  OAI22D0BWP U877 ( .A1(n81), .A2(n544), .B1(n991), .B2(n669), .ZN(
        data_to_tx[45]) );
  OAI22D0BWP U878 ( .A1(n83), .A2(n544), .B1(n989), .B2(n669), .ZN(
        data_to_tx[47]) );
  AOI22D0BWP U879 ( .A1(n972), .A2(n978), .B1(n982), .B2(
        \main_control/state[3] ), .ZN(n976) );
  AOI22D0BWP U880 ( .A1(n987), .A2(n1093), .B1(n1094), .B2(n1092), .ZN(
        \tHandshake/next_state[0] ) );
  XNR2D2BWP U881 ( .A1(n725), .A2(n537), .ZN(n584) );
  INVD2BWP U882 ( .I(n544), .ZN(n668) );
  CKND0BWP U883 ( .I(n979), .ZN(n1038) );
  INVD2BWP U884 ( .I(n544), .ZN(n667) );
  OAI32D0BWP U885 ( .A1(n987), .A2(n1091), .A3(n982), .B1(n1090), .B2(n987), 
        .ZN(n1094) );
  CKAN2D1BWP U886 ( .A1(n982), .A2(n545), .Z(n549) );
  NR2D1BWP U887 ( .A1(n1031), .A2(Packet_From_Node_Valid), .ZN(n981) );
  CKND0BWP U888 ( .I(n1069), .ZN(n906) );
  NR2D1BWP U889 ( .A1(\main_control/state[3] ), .A2(n985), .ZN(n671) );
  NR2D0BWP U890 ( .A1(n1030), .A2(n985), .ZN(Packet_To_Node_Valid) );
  OAI21D0BWP U891 ( .A1(\rHandshake/state[1] ), .A2(n986), .B(n1089), .ZN(
        RX_Data_Ready) );
  CKND1BWP U892 ( .I(n1030), .ZN(n675) );
  NR2D1BWP U893 ( .A1(n972), .A2(n985), .ZN(n982) );
  CKND2D1BWP U894 ( .A1(tx_data_select[0]), .A2(n1012), .ZN(n1015) );
  ND2D2BWP U895 ( .A1(n840), .A2(\enc_logic/check/N25 ), .ZN(n1069) );
  NR2D1BWP U896 ( .A1(n822), .A2(\dec_logic/checksum/check[10] ), .ZN(n688) );
  XNR4D1BWP U897 ( .A1(\dec_logic/three_six_load[0] ), .A2(\dec_logic/raw[0] ), 
        .A3(\dec_logic/raw[2] ), .A4(n557), .ZN(n563) );
  XNR4D1BWP U898 ( .A1(\dec_logic/three_six_load[6] ), .A2(\dec_logic/raw[12] ), .A3(\dec_logic/raw[14] ), .A4(n1047), .ZN(n1056) );
  XNR4D1BWP U899 ( .A1(\dec_logic/three_six_load[3] ), .A2(\dec_logic/raw[6] ), 
        .A3(\dec_logic/raw[8] ), .A4(n1058), .ZN(n1060) );
  NR2D1BWP U900 ( .A1(n818), .A2(n822), .ZN(n683) );
  CKND1BWP U901 ( .I(\rHandshake/state[1] ), .ZN(n1087) );
  IND3D0BWP U902 ( .A1(\main_control/state[2] ), .B1(\main_control/state[1] ), 
        .B2(\main_control/state[3] ), .ZN(n1090) );
  CKND1BWP U903 ( .I(\main_control/state[2] ), .ZN(n972) );
  CKND1BWP U904 ( .I(buf_to_mux[25]), .ZN(n828) );
  CKND2D0BWP U905 ( .A1(\main_control/state[3] ), .A2(n6), .ZN(n1030) );
  NR2D0BWP U906 ( .A1(n6), .A2(\main_control/state[2] ), .ZN(n1091) );
  CKND0BWP U907 ( .I(TX_Data_Valid), .ZN(n1092) );
  CKND1BWP U908 ( .I(n984), .ZN(n1033) );
  AOI22D0BWP U909 ( .A1(\dec_logic/checksum/check[26] ), .A2(
        \dec_logic/checksum/check[22] ), .B1(n994), .B2(n990), .ZN(n555) );
  CKND1BWP U910 ( .I(n1070), .ZN(n1071) );
  AOI22D0BWP U911 ( .A1(\dec_logic/checksum/check[25] ), .A2(n989), .B1(
        \dec_logic/checksum/check[27] ), .B2(n991), .ZN(n560) );
  NR2D1BWP U912 ( .A1(n1007), .A2(n1006), .ZN(n1075) );
  NR2D1BWP U913 ( .A1(n966), .A2(n964), .ZN(n965) );
  CKND0BWP U914 ( .I(n703), .ZN(n593) );
  XNR2D1BWP U915 ( .A1(n876), .A2(\enc_logic/checksum[21] ), .ZN(n882) );
  NR2D1BWP U916 ( .A1(\dec_logic/checksum/check[26] ), .A2(
        \dec_logic/checksum/check[25] ), .ZN(n606) );
  INVD2BWP U917 ( .I(\dec_logic/checksum/check[21] ), .ZN(n995) );
  INVD2BWP U918 ( .I(\dec_logic/checksum/check[20] ), .ZN(n996) );
  NR2D1BWP U919 ( .A1(\dec_logic/checksum/check[25] ), .A2(
        \dec_logic/checksum/check[24] ), .ZN(n615) );
  XOR2D1BWP U920 ( .A1(\dec_logic/checksum/check[17] ), .A2(
        \dec_logic/checksum/check[18] ), .Z(n821) );
  INVD2BWP U921 ( .I(\dec_logic/checksum/check[19] ), .ZN(n997) );
  NR2D1BWP U922 ( .A1(\dec_logic/checksum/check[21] ), .A2(
        \dec_logic/checksum/check[20] ), .ZN(n703) );
  INVD2BWP U923 ( .I(\dec_logic/checksum/check[25] ), .ZN(n991) );
  INVD2BWP U924 ( .I(\dec_logic/checksum/check[24] ), .ZN(n992) );
  INVD2BWP U925 ( .I(\dec_logic/checksum/check[23] ), .ZN(n993) );
  NR2D1BWP U926 ( .A1(\enc_logic/checksum[9] ), .A2(\enc_logic/checksum[8] ), 
        .ZN(n839) );
  XNR2D1BWP U927 ( .A1(\enc_logic/checksum[15] ), .A2(\enc_logic/checksum[16] ), .ZN(n862) );
  NR2D1BWP U928 ( .A1(\enc_logic/checksum[10] ), .A2(\enc_logic/checksum[11] ), 
        .ZN(n966) );
  NR2D1BWP U929 ( .A1(\dec_logic/checksum/check[27] ), .A2(\dec_logic/raw[20] ), .ZN(n799) );
  ND2D2BWP U930 ( .A1(n538), .A2(n531), .ZN(n743) );
  XNR2D1BWP U931 ( .A1(n901), .A2(n525), .ZN(n524) );
  XOR2D2BWP U932 ( .A1(n919), .A2(n920), .Z(n901) );
  ND2D4BWP U933 ( .A1(n584), .A2(\dec_logic/checksum/check[10] ), .ZN(n751) );
  NR2D4BWP U934 ( .A1(n686), .A2(n685), .ZN(n691) );
  OA22D1BWP U935 ( .A1(n636), .A2(n879), .B1(n1008), .B2(n1007), .Z(n525) );
  XOR2D1BWP U936 ( .A1(n665), .A2(n925), .Z(n664) );
  AOI21D4BWP U937 ( .A1(n587), .A2(n691), .B(\dec_logic/checksum/check[15] ), 
        .ZN(n697) );
  AOI211XD2BWP U938 ( .A1(n684), .A2(n690), .B(n822), .C(n823), .ZN(n685) );
  XNR2D1BWP U939 ( .A1(n725), .A2(n527), .ZN(n526) );
  XNR3D1BWP U940 ( .A1(\dec_logic/checksum/check[9] ), .A2(
        \dec_logic/checksum/check[7] ), .A3(\dec_logic/checksum/check[8] ), 
        .ZN(n527) );
  ND2D2BWP U941 ( .A1(n903), .A2(n637), .ZN(n931) );
  ND3D3BWP U942 ( .A1(n923), .A2(\enc_logic/checksum[25] ), .A3(n895), .ZN(
        n927) );
  CKND2BWP U943 ( .I(n708), .ZN(n529) );
  CKND2BWP U944 ( .I(n529), .ZN(n530) );
  ND2D2BWP U945 ( .A1(n660), .A2(n688), .ZN(n689) );
  ND2D2BWP U946 ( .A1(n524), .A2(n875), .ZN(n884) );
  ND2D3BWP U947 ( .A1(n706), .A2(\dec_logic/checksum/check[23] ), .ZN(n779) );
  NR3D2BWP U948 ( .A1(n728), .A2(n823), .A3(n687), .ZN(n686) );
  NR3D0BWP U949 ( .A1(n712), .A2(n711), .A3(\dec_logic/checksum/check[21] ), 
        .ZN(n595) );
  AN2D4BWP U950 ( .A1(n705), .A2(n993), .Z(n601) );
  OAI22D1BWP U951 ( .A1(n579), .A2(n993), .B1(n809), .B2(n996), .ZN(
        Packet_To_Node[19]) );
  INVD1BWP U952 ( .I(n790), .ZN(n532) );
  ND2D3BWP U953 ( .A1(n740), .A2(n739), .ZN(n789) );
  ND2D3BWP U954 ( .A1(n785), .A2(n528), .ZN(n788) );
  CKND6BWP U955 ( .I(n578), .ZN(n579) );
  AOI21D4BWP U956 ( .A1(n548), .A2(n802), .B(n800), .ZN(n807) );
  ND2D2BWP U957 ( .A1(n898), .A2(n927), .ZN(n926) );
  NR3D2BWP U958 ( .A1(n851), .A2(n852), .A3(n958), .ZN(n853) );
  ND2D2BWP U959 ( .A1(n854), .A2(\enc_logic/checksum[14] ), .ZN(n918) );
  ND2D2BWP U960 ( .A1(n854), .A2(n917), .ZN(n863) );
  INR2XD4BWP U961 ( .A1(n577), .B1(n653), .ZN(n578) );
  IND3D4BWP U962 ( .A1(n996), .B1(n540), .B2(n709), .ZN(n710) );
  IND3D4BWP U963 ( .A1(n868), .B1(n870), .B2(n869), .ZN(n878) );
  XOR3D2BWP U964 ( .A1(\dec_logic/checksum/check[9] ), .A2(
        \dec_logic/checksum/check[7] ), .A3(\dec_logic/checksum/check[8] ), 
        .Z(n537) );
  MUX2D1BWP U965 ( .I0(n741), .I1(n614), .S(n517), .Z(n538) );
  OAI211D2BWP U966 ( .A1(\dec_logic/checksum/check[16] ), .A2(n589), .B(n588), 
        .C(n821), .ZN(n590) );
  ND2D2BWP U967 ( .A1(n714), .A2(n661), .ZN(n715) );
  ND2D3BWP U968 ( .A1(n584), .A2(n683), .ZN(n690) );
  CKND2BWP U969 ( .I(n697), .ZN(n589) );
  AOI21D2BWP U970 ( .A1(n870), .A2(n869), .B(\enc_logic/checksum[18] ), .ZN(
        n879) );
  OAI21D2BWP U971 ( .A1(n867), .A2(n866), .B(n1009), .ZN(n870) );
  MAOI22D0BWP U972 ( .A1(n578), .A2(n805), .B1(n809), .B2(
        \dec_logic/three_six_load[0] ), .ZN(Packet_To_Node[0]) );
  CKND2BWP U973 ( .I(n893), .ZN(n894) );
  ND2D2BWP U974 ( .A1(n865), .A2(n864), .ZN(n866) );
  XOR3D2BWP U975 ( .A1(n928), .A2(n640), .A3(n929), .Z(n944) );
  NR2XD1BWP U976 ( .A1(n924), .A2(n923), .ZN(n929) );
  AOI21D4BWP U977 ( .A1(n530), .A2(n606), .B(n607), .ZN(n553) );
  ND2D2BWP U978 ( .A1(n701), .A2(n996), .ZN(n591) );
  OAI22D2BWP U979 ( .A1(n629), .A2(n628), .B1(n627), .B2(n532), .ZN(n631) );
  AN2D4BWP U980 ( .A1(n553), .A2(n534), .Z(n796) );
  CKND2BWP U981 ( .I(n710), .ZN(n596) );
  INR2XD2BWP U982 ( .A1(\enc_logic/checksum[11] ), .B1(n845), .ZN(n847) );
  OAI211D2BWP U983 ( .A1(\dec_logic/checksum/check[21] ), .A2(n702), .B(n598), 
        .C(n597), .ZN(n599) );
  ND2D2BWP U984 ( .A1(n591), .A2(n710), .ZN(n702) );
  ND2D2BWP U985 ( .A1(n873), .A2(n874), .ZN(n903) );
  NR2XD1BWP U986 ( .A1(n576), .A2(n625), .ZN(n629) );
  IAO21D2BWP U987 ( .A1(n613), .A2(n694), .B(n612), .ZN(n611) );
  CKND2BWP U988 ( .I(n715), .ZN(n716) );
  ND2D2BWP U989 ( .A1(n717), .A2(n745), .ZN(n744) );
  NR2D3BWP U990 ( .A1(n801), .A2(n784), .ZN(n786) );
  ND2D2BWP U991 ( .A1(n709), .A2(n540), .ZN(n701) );
  OAI21D1BWP U992 ( .A1(n922), .A2(n888), .B(n887), .ZN(n892) );
  NR2XD1BWP U993 ( .A1(n872), .A2(n1006), .ZN(n874) );
  NR2XD1BWP U994 ( .A1(n944), .A2(n641), .ZN(n947) );
  ND2D3BWP U995 ( .A1(n893), .A2(\enc_logic/checksum[24] ), .ZN(n923) );
  INR2D4BWP U996 ( .A1(n599), .B1(n776), .ZN(n706) );
  IND3D4BWP U997 ( .A1(n989), .B1(n534), .B2(n553), .ZN(n554) );
  CKND2BWP U998 ( .I(n853), .ZN(n917) );
  INR2D2BWP U999 ( .A1(\enc_logic/checksum[26] ), .B1(n897), .ZN(n898) );
  CKND2BWP U1000 ( .I(n879), .ZN(n871) );
  MOAI22D0BWP U1001 ( .A1(n999), .A2(n669), .B1(buf_to_mux[25]), .B2(n668), 
        .ZN(data_to_tx[25]) );
  OAI21D1BWP U1002 ( .A1(n582), .A2(\enc_logic/checksum[26] ), .B(n926), .ZN(
        n955) );
  INVD1BWP U1003 ( .I(n728), .ZN(n730) );
  INVD1BWP U1004 ( .I(n713), .ZN(n714) );
  ND2D1BWP U1005 ( .A1(n722), .A2(n721), .ZN(n681) );
  CKND2BWP U1006 ( .I(\dec_logic/checksum/check[5] ), .ZN(n999) );
  CKND2BWP U1007 ( .I(\dec_logic/checksum/check[6] ), .ZN(n998) );
  CKND2BWP U1008 ( .I(\dec_logic/checksum/check[6] ), .ZN(n662) );
  MOAI22D0BWP U1009 ( .A1(n1010), .A2(n1086), .B1(n975), .B2(buf_to_mux[9]), 
        .ZN(n477) );
  MOAI22D0BWP U1010 ( .A1(n971), .A2(n1086), .B1(n975), .B2(buf_to_mux[1]), 
        .ZN(n485) );
  MOAI22D0BWP U1011 ( .A1(n968), .A2(n1086), .B1(n975), .B2(buf_to_mux[10]), 
        .ZN(n476) );
  MOAI22D0BWP U1012 ( .A1(n963), .A2(n1086), .B1(n975), .B2(buf_to_mux[16]), 
        .ZN(n470) );
  MOAI22D0BWP U1013 ( .A1(n967), .A2(n1086), .B1(n975), .B2(buf_to_mux[11]), 
        .ZN(n475) );
  NR2XD1BWP U1014 ( .A1(n889), .A2(n900), .ZN(n899) );
  ND2D2BWP U1015 ( .A1(n871), .A2(n878), .ZN(n902) );
  CKND2D0BWP U1016 ( .A1(n777), .A2(n776), .ZN(n778) );
  NR2XD1BWP U1017 ( .A1(n899), .A2(n891), .ZN(n893) );
  NR3D1BWP U1018 ( .A1(n860), .A2(n861), .A3(n862), .ZN(n867) );
  AOI31D2BWP U1019 ( .A1(n795), .A2(n794), .A3(n547), .B(n793), .ZN(n802) );
  NR3D2BWP U1020 ( .A1(n735), .A2(n595), .A3(n594), .ZN(n776) );
  ND2D2BWP U1021 ( .A1(n998), .A2(n999), .ZN(n722) );
  MOAI22D0BWP U1022 ( .A1(n819), .A2(n669), .B1(n667), .B2(buf_to_mux[29]), 
        .ZN(data_to_tx[29]) );
  MOAI22D0BWP U1023 ( .A1(n820), .A2(n669), .B1(n667), .B2(buf_to_mux[28]), 
        .ZN(data_to_tx[28]) );
  MOAI22D0BWP U1024 ( .A1(n814), .A2(n669), .B1(n667), .B2(buf_to_mux[34]), 
        .ZN(data_to_tx[34]) );
  MOAI22D0BWP U1025 ( .A1(n818), .A2(n669), .B1(n667), .B2(buf_to_mux[30]), 
        .ZN(data_to_tx[30]) );
  MOAI22D0BWP U1026 ( .A1(n812), .A2(n669), .B1(n667), .B2(buf_to_mux[36]), 
        .ZN(data_to_tx[36]) );
  MOAI22D0BWP U1027 ( .A1(n609), .A2(n669), .B1(n667), .B2(buf_to_mux[38]), 
        .ZN(data_to_tx[38]) );
  MOAI22D0BWP U1028 ( .A1(n962), .A2(n961), .B1(n975), .B2(buf_to_mux[18]), 
        .ZN(n468) );
  MOAI22D0BWP U1029 ( .A1(\enc_logic/checksum[9] ), .A2(n970), .B1(n975), .B2(
        buf_to_mux[6]), .ZN(n480) );
  NR2XD1BWP U1030 ( .A1(n955), .A2(n1001), .ZN(n954) );
  NR2XD1BWP U1031 ( .A1(n626), .A2(n790), .ZN(n630) );
  NR3D2BWP U1032 ( .A1(n700), .A2(n699), .A3(n997), .ZN(n711) );
  MUX2ND4BWP U1033 ( .I0(n682), .I1(n681), .S(\dec_logic/checksum/encoder/N25 ), .ZN(n725) );
  XOR3D2BWP U1034 ( .A1(n765), .A2(n767), .A3(n764), .Z(n774) );
  OAI21D2BWP U1035 ( .A1(n700), .A2(n699), .B(n997), .ZN(n704) );
  OAI22D2BWP U1036 ( .A1(n731), .A2(n698), .B1(n539), .B2(n696), .ZN(n699) );
  ND2D1BWP U1037 ( .A1(n1089), .A2(n1088), .ZN(\rHandshake/next_state[1] ) );
  ND2D1BWP U1038 ( .A1(TX_Data_Ready), .A2(n1092), .ZN(n1093) );
  INVD1BWP U1039 ( .I(\dec_logic/checksum/check[12] ), .ZN(n816) );
  INVD1BWP U1040 ( .I(\dec_logic/checksum/check[17] ), .ZN(n811) );
  INVD1BWP U1041 ( .I(tx_data_select[2]), .ZN(n1012) );
  INVD1BWP U1042 ( .I(tx_data_select[1]), .ZN(n1016) );
  ND2D1BWP U1043 ( .A1(n976), .A2(n1043), .ZN(n489) );
  INVD1BWP U1044 ( .I(buf_to_mux[13]), .ZN(n1066) );
  INVD1BWP U1045 ( .I(buf_to_mux[7]), .ZN(n1064) );
  INVD1BWP U1046 ( .I(buf_to_mux[19]), .ZN(n1068) );
  ND2D1BWP U1047 ( .A1(n959), .A2(n958), .ZN(n962) );
  ND2D1BWP U1048 ( .A1(n832), .A2(n831), .ZN(n462) );
  INVD1BWP U1049 ( .I(\enc_logic/checksum[16] ), .ZN(n830) );
  INVD1BWP U1050 ( .I(\enc_logic/checksum[25] ), .ZN(n1002) );
  INVD1BWP U1051 ( .I(\enc_logic/checksum[22] ), .ZN(n1005) );
  INVD1BWP U1052 ( .I(\enc_logic/checksum[23] ), .ZN(n1004) );
  ND2D1BWP U1053 ( .A1(\enc_logic/checksum[18] ), .A2(\enc_logic/checksum[17] ), .ZN(n1070) );
  ND2D1BWP U1054 ( .A1(n974), .A2(n956), .ZN(n961) );
  ND2D1BWP U1055 ( .A1(\enc_logic/checksum[13] ), .A2(\enc_logic/checksum[14] ), .ZN(n960) );
  INVD1BWP U1056 ( .I(\dec_logic/checksum/encoder/N25 ), .ZN(n805) );
  AN2XD1BWP U1057 ( .A1(n810), .A2(\dec_logic/checksum/check[25] ), .Z(
        Packet_To_Node[21]) );
  AN2XD1BWP U1058 ( .A1(n810), .A2(\dec_logic/checksum/check[26] ), .Z(
        Packet_To_Node[22]) );
  AN2XD1BWP U1059 ( .A1(n810), .A2(\dec_logic/checksum/check[27] ), .Z(
        Packet_To_Node[23]) );
  ND2D1BWP U1060 ( .A1(n583), .A2(n826), .ZN(n488) );
  INVD1BWP U1061 ( .I(\dec_logic/three_six_load[8] ), .ZN(n806) );
  INVD1BWP U1062 ( .I(\dec_logic/three_six_load[5] ), .ZN(n654) );
  INVD1BWP U1063 ( .I(\dec_logic/checksum/check[15] ), .ZN(n813) );
  INVD1BWP U1064 ( .I(\dec_logic/three_six_load[2] ), .ZN(n656) );
  INVD1BWP U1065 ( .I(\dec_logic/three_six_load[3] ), .ZN(n657) );
  INVD1BWP U1066 ( .I(\dec_logic/checksum/check[7] ), .ZN(n1011) );
  INVD1BWP U1067 ( .I(\dec_logic/three_six_load[6] ), .ZN(n655) );
  ND2D1BWP U1068 ( .A1(n664), .A2(n954), .ZN(n950) );
  ND2D1BWP U1069 ( .A1(n941), .A2(n940), .ZN(n945) );
  ND2D1BWP U1070 ( .A1(n931), .A2(n930), .ZN(n936) );
  INVD1BWP U1071 ( .I(\enc_logic/checksum[27] ), .ZN(n1001) );
  AN2XD1BWP U1072 ( .A1(n896), .A2(n927), .Z(n665) );
  INVD1BWP U1073 ( .I(\enc_logic/checksum[24] ), .ZN(n1003) );
  INVD1BWP U1074 ( .I(n921), .ZN(n900) );
  ND2D1BWP U1075 ( .A1(n921), .A2(n889), .ZN(n888) );
  ND2D1BWP U1076 ( .A1(n890), .A2(\enc_logic/checksum[23] ), .ZN(n889) );
  INVD1BWP U1077 ( .I(\enc_logic/checksum[21] ), .ZN(n1006) );
  INVD1BWP U1078 ( .I(\enc_logic/checksum[20] ), .ZN(n1007) );
  INVD1BWP U1079 ( .I(\enc_logic/checksum[19] ), .ZN(n1008) );
  INVD1BWP U1080 ( .I(\enc_logic/checksum[17] ), .ZN(n1009) );
  ND2D1BWP U1081 ( .A1(n861), .A2(n862), .ZN(n865) );
  INVD1BWP U1082 ( .I(\enc_logic/checksum[18] ), .ZN(n868) );
  INVD1BWP U1083 ( .I(\enc_logic/checksum[15] ), .ZN(n956) );
  ND2D1BWP U1084 ( .A1(n855), .A2(n859), .ZN(n856) );
  INVD1BWP U1085 ( .I(\enc_logic/checksum[14] ), .ZN(n959) );
  INVD1BWP U1086 ( .I(\enc_logic/checksum[8] ), .ZN(n968) );
  INVD1BWP U1087 ( .I(\enc_logic/checksum[9] ), .ZN(n967) );
  INVD1BWP U1088 ( .I(\enc_logic/checksum[13] ), .ZN(n958) );
  ND2D1BWP U1089 ( .A1(n849), .A2(\enc_logic/checksum[10] ), .ZN(n911) );
  INVD1BWP U1090 ( .I(\enc_logic/checksum[7] ), .ZN(n1010) );
  INVD1BWP U1091 ( .I(\enc_logic/checksum[11] ), .ZN(n963) );
  INVD1BWP U1092 ( .I(\enc_logic/check/N25 ), .ZN(n837) );
  ND2D1BWP U1093 ( .A1(n977), .A2(n677), .ZN(n1098) );
  ND2D1BWP U1094 ( .A1(n676), .A2(n1034), .ZN(n677) );
  ND2D1BWP U1095 ( .A1(n549), .A2(n984), .ZN(n1044) );
  AN2XD1BWP U1096 ( .A1(n6), .A2(n1018), .Z(n545) );
  INVD1BWP U1097 ( .I(n1095), .ZN(n1031) );
  ND2D1BWP U1098 ( .A1(n789), .A2(n788), .ZN(n622) );
  XNR2D2BWP U1099 ( .A1(n770), .A2(\dec_logic/three_six_load[11] ), .ZN(n548)
         );
  ND2D1BWP U1100 ( .A1(n769), .A2(n768), .ZN(n770) );
  ND2D1BWP U1101 ( .A1(n775), .A2(n757), .ZN(n763) );
  INVD1BWP U1102 ( .I(n801), .ZN(n803) );
  INVD1BWP U1103 ( .I(n746), .ZN(n748) );
  ND2D1BWP U1104 ( .A1(n666), .A2(n773), .ZN(n794) );
  INVD1BWP U1105 ( .I(n789), .ZN(n580) );
  ND2D1BWP U1106 ( .A1(n991), .A2(\dec_logic/checksum/check[24] ), .ZN(n618)
         );
  INVD1BWP U1107 ( .I(\dec_logic/checksum/check[18] ), .ZN(n609) );
  ND2D1BWP U1108 ( .A1(n728), .A2(n817), .ZN(n729) );
  INVD1BWP U1109 ( .I(\dec_logic/checksum/check[11] ), .ZN(n817) );
  INVD1BWP U1110 ( .I(\dec_logic/checksum/check[8] ), .ZN(n820) );
  INVD1BWP U1111 ( .I(\dec_logic/checksum/check[9] ), .ZN(n819) );
  INVD1BWP U1112 ( .I(n721), .ZN(n750) );
  ND2D1BWP U1113 ( .A1(n720), .A2(\dec_logic/checksum/check[7] ), .ZN(n724) );
  INVD1BWP U1114 ( .I(\dec_logic/checksum/check[14] ), .ZN(n814) );
  INVD1BWP U1115 ( .I(\dec_logic/checksum/check[13] ), .ZN(n815) );
  ND2D1BWP U1116 ( .A1(n710), .A2(n709), .ZN(n741) );
  ND2D1BWP U1117 ( .A1(n695), .A2(n812), .ZN(n698) );
  INVD1BWP U1118 ( .I(n821), .ZN(n695) );
  ND2D1BWP U1119 ( .A1(n694), .A2(n812), .ZN(n588) );
  INVD1BWP U1120 ( .I(n823), .ZN(n585) );
  INVD1BWP U1121 ( .I(r_addr[3]), .ZN(n1024) );
  INVD1BWP U1122 ( .I(r_addr[1]), .ZN(n1023) );
  INVD1BWP U1123 ( .I(r_addr[2]), .ZN(n1022) );
  INVD1BWP U1124 ( .I(r_addr[0]), .ZN(n1021) );
  INVD1BWP U1125 ( .I(\dec_logic/token ), .ZN(n988) );
  INVD1BWP U1126 ( .I(\dec_logic/raw[1] ), .ZN(n562) );
  INVD1BWP U1127 ( .I(\dec_logic/three_six_load[1] ), .ZN(n1059) );
  XNR2D2BWP U1128 ( .A1(\dec_logic/checksum/check[11] ), .A2(
        \dec_logic/checksum/check[12] ), .ZN(n687) );
  XOR2D2BWP U1129 ( .A1(\dec_logic/checksum/check[13] ), .A2(
        \dec_logic/checksum/check[14] ), .Z(n823) );
  ND2D1BWP U1130 ( .A1(\dec_logic/checksum/check[6] ), .A2(
        \dec_logic/checksum/check[5] ), .ZN(n721) );
  ND2D1BWP U1131 ( .A1(\dec_logic/three_six_load[5] ), .A2(n1060), .ZN(n559)
         );
  INVD1BWP U1132 ( .I(\dec_logic/three_six_load[11] ), .ZN(n1049) );
  INVD1BWP U1133 ( .I(\dec_logic/raw[20] ), .ZN(n1051) );
  INVD1BWP U1134 ( .I(\dec_logic/checksum/check[26] ), .ZN(n990) );
  INVD1BWP U1135 ( .I(\dec_logic/checksum/check[22] ), .ZN(n994) );
  INVD1BWP U1136 ( .I(\dec_logic/three_six_load[7] ), .ZN(n1046) );
  INVD1BWP U1137 ( .I(\dec_logic/three_six_load[4] ), .ZN(n1057) );
  OAI211D1BWP U1138 ( .A1(n982), .A2(n986), .B(RX_Data_Valid), .C(n1087), .ZN(
        \rHandshake/next_state[0] ) );
  AOI32D1BWP U1139 ( .A1(n982), .A2(RX_Data_Valid), .A3(\rHandshake/state[0] ), 
        .B1(\rHandshake/state[1] ), .B2(RX_Data_Valid), .ZN(n1088) );
  AO22D1BWP U1140 ( .A1(\dec_logic/three_six_load[8] ), .A2(n670), .B1(
        buf_to_mux[17]), .B2(n667), .Z(data_to_tx[17]) );
  AO22D1BWP U1141 ( .A1(\dec_logic/raw[14] ), .A2(n670), .B1(buf_to_mux[14]), 
        .B2(n668), .Z(data_to_tx[14]) );
  AO22D1BWP U1142 ( .A1(\dec_logic/raw[18] ), .A2(n670), .B1(buf_to_mux[18]), 
        .B2(n667), .Z(data_to_tx[18]) );
  AO22D1BWP U1143 ( .A1(\dec_logic/raw[6] ), .A2(n670), .B1(buf_to_mux[6]), 
        .B2(n667), .Z(data_to_tx[6]) );
  AO22D1BWP U1144 ( .A1(\dec_logic/raw[8] ), .A2(n670), .B1(buf_to_mux[8]), 
        .B2(n668), .Z(data_to_tx[8]) );
  AO22D1BWP U1145 ( .A1(\dec_logic/raw[2] ), .A2(n670), .B1(buf_to_mux[2]), 
        .B2(n668), .Z(data_to_tx[2]) );
  AO22D1BWP U1146 ( .A1(\dec_logic/three_six_load[5] ), .A2(n670), .B1(
        buf_to_mux[11]), .B2(n667), .Z(data_to_tx[11]) );
  AO22D1BWP U1147 ( .A1(\dec_logic/three_six_load[3] ), .A2(n670), .B1(
        buf_to_mux[9]), .B2(n667), .Z(data_to_tx[9]) );
  AO22D1BWP U1148 ( .A1(address[0]), .A2(n670), .B1(n667), .B2(buf_to_mux[48]), 
        .Z(data_to_tx[48]) );
  AO22D1BWP U1149 ( .A1(\dec_logic/three_six_load[2] ), .A2(n670), .B1(
        buf_to_mux[5]), .B2(n668), .Z(data_to_tx[5]) );
  AO22D1BWP U1150 ( .A1(address[1]), .A2(n670), .B1(n667), .B2(buf_to_mux[49]), 
        .Z(data_to_tx[49]) );
  AO22D1BWP U1151 ( .A1(\dec_logic/three_six_load[6] ), .A2(n670), .B1(
        buf_to_mux[15]), .B2(n667), .Z(data_to_tx[15]) );
  AO22D1BWP U1152 ( .A1(\dec_logic/raw[12] ), .A2(n670), .B1(buf_to_mux[12]), 
        .B2(n668), .Z(data_to_tx[12]) );
  AO22D1BWP U1153 ( .A1(\dec_logic/raw[1] ), .A2(n670), .B1(buf_to_mux[1]), 
        .B2(n668), .Z(data_to_tx[1]) );
  AO22D1BWP U1154 ( .A1(address[3]), .A2(n670), .B1(n667), .B2(buf_to_mux[51]), 
        .Z(data_to_tx[51]) );
  AO22D1BWP U1155 ( .A1(address[2]), .A2(n670), .B1(n667), .B2(buf_to_mux[50]), 
        .Z(data_to_tx[50]) );
  AO22D1BWP U1156 ( .A1(\dec_logic/checksum/encoder/N25 ), .A2(n670), .B1(
        buf_to_mux[24]), .B2(n667), .Z(data_to_tx[24]) );
  AO22D1BWP U1157 ( .A1(\dec_logic/three_six_load[0] ), .A2(n670), .B1(
        buf_to_mux[3]), .B2(n668), .Z(data_to_tx[3]) );
  AO22D1BWP U1158 ( .A1(\dec_logic/raw[0] ), .A2(n670), .B1(buf_to_mux[0]), 
        .B2(n667), .Z(data_to_tx[0]) );
  MOAI22D0BWP U1159 ( .A1(n816), .A2(n669), .B1(n668), .B2(buf_to_mux[32]), 
        .ZN(data_to_tx[32]) );
  MOAI22D0BWP U1160 ( .A1(n817), .A2(n669), .B1(n668), .B2(buf_to_mux[31]), 
        .ZN(data_to_tx[31]) );
  MOAI22D0BWP U1161 ( .A1(n813), .A2(n669), .B1(n668), .B2(buf_to_mux[35]), 
        .ZN(data_to_tx[35]) );
  MOAI22D0BWP U1162 ( .A1(n815), .A2(n669), .B1(n668), .B2(buf_to_mux[33]), 
        .ZN(data_to_tx[33]) );
  MOAI22D0BWP U1163 ( .A1(n811), .A2(n669), .B1(n668), .B2(buf_to_mux[37]), 
        .ZN(data_to_tx[37]) );
  AOI22D1BWP U1164 ( .A1(data_type[1]), .A2(n670), .B1(n668), .B2(
        buf_to_mux[53]), .ZN(n1014) );
  AOI22D1BWP U1165 ( .A1(data_type[0]), .A2(n670), .B1(n667), .B2(
        buf_to_mux[52]), .ZN(n1013) );
  AOI32D1BWP U1166 ( .A1(n549), .A2(n1034), .A3(n1033), .B1(n1039), .B2(n1034), 
        .ZN(n1035) );
  IOA21D1BWP U1167 ( .A1(n978), .A2(n1031), .B(n1096), .ZN(n1032) );
  OAI211D1BWP U1168 ( .A1(n1061), .A2(n1038), .B(n1027), .C(n1020), .ZN(
        \main_control/next_state[1] ) );
  AOI211XD0BWP U1169 ( .A1(n549), .A2(n1089), .B(n1040), .C(n1019), .ZN(n1020)
         );
  AO211D1BWP U1170 ( .A1(n1040), .A2(n1029), .B(n1042), .C(n1028), .Z(
        \main_control/next_state[2] ) );
  AOI21D1BWP U1171 ( .A1(n1039), .A2(n1089), .B(n1097), .ZN(n1027) );
  ND4D1BWP U1172 ( .A1(n1024), .A2(n1023), .A3(n1022), .A4(n1021), .ZN(n1029)
         );
  OAI211D1BWP U1173 ( .A1(n981), .A2(n680), .B(n1026), .C(n1025), .ZN(n1042)
         );
  OAI21D1BWP U1174 ( .A1(n1033), .A2(n1089), .B(n549), .ZN(n1026) );
  AOI21D1BWP U1175 ( .A1(\enc_logic/checksum[11] ), .A2(
        \enc_logic/checksum[10] ), .B(\enc_logic/checksum[12] ), .ZN(n964) );
  OAI211D1BWP U1176 ( .A1(n1010), .A2(n968), .B(n974), .C(n967), .ZN(n969) );
  AO21D1BWP U1177 ( .A1(n975), .A2(buf_to_mux[14]), .B(n1067), .Z(n472) );
  AO21D1BWP U1178 ( .A1(n975), .A2(buf_to_mux[8]), .B(n1065), .Z(n478) );
  AO21D1BWP U1179 ( .A1(n975), .A2(buf_to_mux[0]), .B(n1063), .Z(n486) );
  AO22D1BWP U1180 ( .A1(n974), .A2(\enc_logic/checksum[12] ), .B1(n975), .B2(
        buf_to_mux[17]), .Z(n469) );
  AO22D1BWP U1181 ( .A1(n974), .A2(\enc_logic/checksum[10] ), .B1(n975), .B2(
        buf_to_mux[15]), .Z(n471) );
  AO22D1BWP U1182 ( .A1(n975), .A2(buf_to_mux[2]), .B1(n974), .B2(n1069), .Z(
        n484) );
  ND3D1BWP U1183 ( .A1(n974), .A2(n1010), .A3(n968), .ZN(n970) );
  AO22D1BWP U1184 ( .A1(n974), .A2(\enc_logic/checksum[5] ), .B1(n975), .B2(
        buf_to_mux[4]), .Z(n482) );
  AO22D1BWP U1185 ( .A1(n974), .A2(\enc_logic/check/N25 ), .B1(n975), .B2(
        buf_to_mux[3]), .Z(n483) );
  AO22D1BWP U1186 ( .A1(n974), .A2(\enc_logic/checksum[6] ), .B1(n975), .B2(
        buf_to_mux[5]), .Z(n481) );
  AOI22D1BWP U1187 ( .A1(n973), .A2(\enc_logic/check/N25 ), .B1(n975), .B2(
        buf_to_mux[24]), .ZN(n831) );
  ND4D1BWP U1188 ( .A1(n974), .A2(n830), .A3(n1009), .A4(n868), .ZN(n832) );
  AO222D1BWP U1189 ( .A1(n975), .A2(buf_to_mux[41]), .B1(
        \enc_logic/checksum[21] ), .B2(n973), .C1(n974), .C2(
        \enc_logic/checksum[24] ), .Z(n445) );
  AO222D1BWP U1190 ( .A1(n975), .A2(buf_to_mux[39]), .B1(
        \enc_logic/checksum[19] ), .B2(n973), .C1(n974), .C2(
        \enc_logic/checksum[22] ), .Z(n447) );
  AO222D1BWP U1191 ( .A1(n975), .A2(buf_to_mux[40]), .B1(
        \enc_logic/checksum[20] ), .B2(n973), .C1(n974), .C2(
        \enc_logic/checksum[23] ), .Z(n446) );
  AO222D1BWP U1192 ( .A1(n975), .A2(buf_to_mux[28]), .B1(
        \enc_logic/checksum[17] ), .B2(n974), .C1(\enc_logic/checksum[8] ), 
        .C2(n973), .Z(n458) );
  AO222D1BWP U1193 ( .A1(n975), .A2(buf_to_mux[27]), .B1(
        \enc_logic/checksum[16] ), .B2(n974), .C1(\enc_logic/checksum[7] ), 
        .C2(n973), .Z(n459) );
  AO222D1BWP U1194 ( .A1(n975), .A2(buf_to_mux[33]), .B1(
        \enc_logic/checksum[19] ), .B2(n974), .C1(\enc_logic/checksum[13] ), 
        .C2(n973), .Z(n453) );
  AO222D1BWP U1195 ( .A1(n975), .A2(buf_to_mux[34]), .B1(
        \enc_logic/checksum[20] ), .B2(n974), .C1(\enc_logic/checksum[14] ), 
        .C2(n973), .Z(n452) );
  AO222D1BWP U1196 ( .A1(n975), .A2(buf_to_mux[35]), .B1(
        \enc_logic/checksum[21] ), .B2(n974), .C1(\enc_logic/checksum[15] ), 
        .C2(n973), .Z(n451) );
  AO222D1BWP U1197 ( .A1(n975), .A2(buf_to_mux[29]), .B1(
        \enc_logic/checksum[18] ), .B2(n974), .C1(\enc_logic/checksum[9] ), 
        .C2(n973), .Z(n457) );
  AO222D1BWP U1198 ( .A1(n1002), .A2(n1083), .B1(n973), .B2(
        \enc_logic/checksum[22] ), .C1(n975), .C2(buf_to_mux[42]), .Z(n444) );
  AO222D1BWP U1199 ( .A1(n1005), .A2(n1078), .B1(n973), .B2(
        \enc_logic/checksum[16] ), .C1(n975), .C2(buf_to_mux[36]), .Z(n450) );
  AO222D1BWP U1200 ( .A1(n1008), .A2(n1074), .B1(n973), .B2(
        \enc_logic/checksum[10] ), .C1(n975), .C2(buf_to_mux[30]), .Z(n456) );
  AOI22D1BWP U1201 ( .A1(n975), .A2(buf_to_mux[32]), .B1(n973), .B2(
        \enc_logic/checksum[12] ), .ZN(n1076) );
  AOI22D1BWP U1202 ( .A1(n975), .A2(buf_to_mux[38]), .B1(n973), .B2(
        \enc_logic/checksum[18] ), .ZN(n1081) );
  AOI22D1BWP U1203 ( .A1(n975), .A2(buf_to_mux[26]), .B1(n973), .B2(
        \enc_logic/checksum[6] ), .ZN(n1072) );
  OAI21D1BWP U1204 ( .A1(n651), .A2(n1085), .B(n652), .ZN(n465) );
  AOI22D1BWP U1205 ( .A1(n974), .A2(\enc_logic/checksum[13] ), .B1(n975), .B2(
        buf_to_mux[21]), .ZN(n652) );
  AOI211XD0BWP U1206 ( .A1(n1098), .A2(tx_data_select[0]), .B(n1062), .C(n825), 
        .ZN(n826) );
  OAI22D1BWP U1207 ( .A1(n533), .A2(n996), .B1(n809), .B2(n814), .ZN(
        Packet_To_Node[16]) );
  OAI22D1BWP U1208 ( .A1(n533), .A2(n815), .B1(n809), .B2(n1048), .ZN(
        Packet_To_Node[9]) );
  OAI22D1BWP U1209 ( .A1(n533), .A2(n814), .B1(n809), .B2(n1053), .ZN(
        Packet_To_Node[10]) );
  OAI22D1BWP U1210 ( .A1(n579), .A2(n813), .B1(n809), .B2(n1049), .ZN(
        Packet_To_Node[11]) );
  OAI22D1BWP U1211 ( .A1(n579), .A2(n812), .B1(n809), .B2(n1011), .ZN(
        Packet_To_Node[12]) );
  OAI22D1BWP U1212 ( .A1(n533), .A2(n820), .B1(n809), .B2(n1057), .ZN(
        Packet_To_Node[4]) );
  OAI22D1BWP U1213 ( .A1(n533), .A2(n819), .B1(n809), .B2(n654), .ZN(
        Packet_To_Node[5]) );
  OAI22D1BWP U1214 ( .A1(n533), .A2(n997), .B1(n809), .B2(n815), .ZN(
        Packet_To_Node[15]) );
  OAI22D1BWP U1215 ( .A1(n579), .A2(n992), .B1(n809), .B2(n995), .ZN(
        Packet_To_Node[20]) );
  OAI22D1BWP U1216 ( .A1(n533), .A2(n995), .B1(n809), .B2(n813), .ZN(
        Packet_To_Node[17]) );
  OAI22D1BWP U1217 ( .A1(n533), .A2(n994), .B1(n809), .B2(n997), .ZN(
        Packet_To_Node[18]) );
  OAI22D1BWP U1218 ( .A1(n579), .A2(n999), .B1(n809), .B2(n1059), .ZN(
        Packet_To_Node[1]) );
  OAI22D1BWP U1219 ( .A1(n579), .A2(n998), .B1(n809), .B2(n656), .ZN(
        Packet_To_Node[2]) );
  OAI22D1BWP U1220 ( .A1(n579), .A2(n1011), .B1(n809), .B2(n657), .ZN(
        Packet_To_Node[3]) );
  OAI22D1BWP U1221 ( .A1(n579), .A2(n818), .B1(n809), .B2(n655), .ZN(
        Packet_To_Node[6]) );
  OAI21D1BWP U1222 ( .A1(n953), .A2(n1085), .B(n952), .ZN(n464) );
  AOI22D1BWP U1223 ( .A1(n974), .A2(\enc_logic/checksum[14] ), .B1(n975), .B2(
        buf_to_mux[22]), .ZN(n952) );
  XNR2D1BWP U1224 ( .A1(n951), .A2(n950), .ZN(n953) );
  ND4D1BWP U1225 ( .A1(n643), .A2(n948), .A3(n954), .A4(n973), .ZN(n645) );
  AO21D1BWP U1226 ( .A1(n939), .A2(n938), .B(n937), .Z(n940) );
  XNR2D1BWP U1227 ( .A1(n936), .A2(n935), .ZN(n941) );
  IOA21D1BWP U1228 ( .A1(n934), .A2(n933), .B(n932), .ZN(n935) );
  OAI21D1BWP U1229 ( .A1(n928), .A2(n929), .B(n663), .ZN(n946) );
  XNR3D1BWP U1230 ( .A1(n938), .A2(n937), .A3(n939), .ZN(n930) );
  XNR3D1BWP U1231 ( .A1(n932), .A2(n933), .A3(n934), .ZN(n937) );
  XOR2D1BWP U1232 ( .A1(n912), .A2(n911), .Z(n916) );
  OAI21D1BWP U1233 ( .A1(n911), .A2(n910), .B(n909), .ZN(n932) );
  AOI22D1BWP U1234 ( .A1(n908), .A2(n907), .B1(n906), .B2(
        \enc_logic/checksum[7] ), .ZN(n909) );
  NR2XD0BWP U1235 ( .A1(n908), .A2(n907), .ZN(n910) );
  IND2D1BWP U1236 ( .A1(n901), .B1(n638), .ZN(n637) );
  OAI22D1BWP U1237 ( .A1(n639), .A2(n1007), .B1(n902), .B2(n1008), .ZN(n638)
         );
  INR2D1BWP U1238 ( .A1(n902), .B1(\enc_logic/checksum[19] ), .ZN(n639) );
  OAI211D1BWP U1239 ( .A1(n1085), .A2(n664), .B(n942), .C(n957), .ZN(n650) );
  AOI22D1BWP U1240 ( .A1(n974), .A2(\enc_logic/checksum[15] ), .B1(n975), .B2(
        buf_to_mux[23]), .ZN(n942) );
  AOI21D1BWP U1241 ( .A1(n921), .A2(n890), .B(\enc_logic/checksum[23] ), .ZN(
        n891) );
  OAI21D1BWP U1242 ( .A1(n886), .A2(n885), .B(n888), .ZN(n887) );
  IND2D1BWP U1243 ( .A1(\enc_logic/checksum[22] ), .B1(n883), .ZN(n890) );
  XOR2D1BWP U1244 ( .A1(n902), .A2(n876), .Z(n872) );
  XOR2D1BWP U1245 ( .A1(\enc_logic/checksum[20] ), .A2(
        \enc_logic/checksum[19] ), .Z(n876) );
  ND3D1BWP U1246 ( .A1(n863), .A2(n959), .A3(n862), .ZN(n864) );
  AOI22D1BWP U1247 ( .A1(n858), .A2(\enc_logic/checksum[16] ), .B1(n857), .B2(
        \enc_logic/checksum[15] ), .ZN(n905) );
  XOR3D1BWP U1248 ( .A1(n603), .A2(n861), .A3(n604), .Z(n904) );
  XNR2D1BWP U1249 ( .A1(n917), .A2(n912), .ZN(n604) );
  XOR2D1BWP U1250 ( .A1(n908), .A2(n907), .Z(n912) );
  IND2D1BWP U1251 ( .A1(n1010), .B1(n659), .ZN(n841) );
  AO21D1BWP U1252 ( .A1(n838), .A2(n837), .B(n836), .Z(n659) );
  OAI22D1BWP U1253 ( .A1(n848), .A2(n839), .B1(n967), .B2(n968), .ZN(n908) );
  XNR3D1BWP U1254 ( .A1(\enc_logic/checksum[9] ), .A2(\enc_logic/checksum[8] ), 
        .A3(n848), .ZN(n849) );
  ND3D1BWP U1255 ( .A1(n834), .A2(n833), .A3(\enc_logic/check/N25 ), .ZN(n835)
         );
  XNR2D1BWP U1256 ( .A1(\enc_logic/checksum[8] ), .A2(\enc_logic/checksum[10] ), .ZN(n843) );
  XNR2D1BWP U1257 ( .A1(\enc_logic/checksum[7] ), .A2(\enc_logic/checksum[9] ), 
        .ZN(n844) );
  NR3D0BWP U1258 ( .A1(n1098), .A2(n633), .A3(n1097), .ZN(n634) );
  ND3D1BWP U1259 ( .A1(n678), .A2(n1090), .A3(n673), .ZN(n1097) );
  IND2D1BWP U1260 ( .A1(\main_control/state[2] ), .B1(n675), .ZN(n673) );
  IND2D1BWP U1261 ( .A1(\main_control/state[1] ), .B1(n675), .ZN(n1096) );
  ND3D1BWP U1262 ( .A1(data_type[0]), .A2(data_type[1]), .A3(\dec_logic/token ), .ZN(n1037) );
  XNR2D1BWP U1263 ( .A1(n622), .A2(n1048), .ZN(n626) );
  AOI211XD0BWP U1264 ( .A1(\dec_logic/three_six_load[9] ), .A2(n788), .B(n623), 
        .C(\dec_logic/raw[20] ), .ZN(n627) );
  INR2D1BWP U1265 ( .A1(n548), .B1(n575), .ZN(n576) );
  AOI21D1BWP U1266 ( .A1(n788), .A2(n790), .B(n580), .ZN(n575) );
  MUX2D1BWP U1267 ( .I0(n799), .I1(n798), .S(n797), .Z(n800) );
  XOR2D1BWP U1268 ( .A1(\dec_logic/checksum/check[27] ), .A2(
        \dec_logic/raw[20] ), .Z(n798) );
  FCICIND1BWP U1269 ( .CIN(n767), .A(n766), .B(n765), .CO(n768) );
  XNR2D1BWP U1270 ( .A1(n763), .A2(n762), .ZN(n769) );
  OAI21D1BWP U1271 ( .A1(n761), .A2(n760), .B(n759), .ZN(n762) );
  XNR2D1BWP U1272 ( .A1(n792), .A2(n547), .ZN(n781) );
  XNR3D1BWP U1273 ( .A1(n759), .A2(n760), .A3(n758), .ZN(n764) );
  OAI211D1BWP U1274 ( .A1(n593), .A2(n540), .B(n592), .C(
        \dec_logic/checksum/check[22] ), .ZN(n594) );
  IND2D1BWP U1275 ( .A1(\dec_logic/checksum/check[17] ), .B1(n609), .ZN(n608)
         );
  INR2D1BWP U1276 ( .A1(n733), .B1(n732), .ZN(n734) );
  XNR2D1BWP U1277 ( .A1(n754), .A2(n753), .ZN(n755) );
  AOI22D1BWP U1278 ( .A1(n730), .A2(\dec_logic/checksum/check[11] ), .B1(n729), 
        .B2(\dec_logic/checksum/check[12] ), .ZN(n753) );
  XOR3D1BWP U1279 ( .A1(n751), .A2(n752), .A3(n749), .Z(n754) );
  AOI22D1BWP U1280 ( .A1(n727), .A2(n726), .B1(\dec_logic/checksum/check[8] ), 
        .B2(\dec_logic/checksum/check[9] ), .ZN(n749) );
  AOI21D1BWP U1281 ( .A1(\dec_logic/checksum/encoder/N25 ), .A2(n722), .B(n750), .ZN(n723) );
  AOI21D1BWP U1282 ( .A1(n719), .A2(n718), .B(n756), .ZN(n612) );
  AOI21D1BWP U1283 ( .A1(n715), .A2(n815), .B(n814), .ZN(n717) );
  ND3D1BWP U1284 ( .A1(n979), .A2(n983), .A3(n988), .ZN(n569) );
  NR3D0BWP U1285 ( .A1(data_type[0]), .A2(data_type[1]), .A3(\dec_logic/token ), .ZN(n984) );
  XNR2D1BWP U1286 ( .A1(n563), .A2(n562), .ZN(n570) );
  NR3D0BWP U1287 ( .A1(n568), .A2(n567), .A3(n566), .ZN(n572) );
  OAI211D1BWP U1288 ( .A1(n1055), .A2(n1054), .B(n559), .C(n558), .ZN(n566) );
  AOI22D1BWP U1289 ( .A1(\dec_logic/three_six_load[8] ), .A2(n1056), .B1(n1054), .B2(n1055), .ZN(n558) );
  XNR2D1BWP U1290 ( .A1(n561), .A2(n560), .ZN(n567) );
  OAI22D1BWP U1291 ( .A1(\dec_logic/three_six_load[5] ), .A2(n1060), .B1(n1056), .B2(\dec_logic/three_six_load[8] ), .ZN(n568) );
  OA21D1BWP U1292 ( .A1(n780), .A2(n779), .B(n778), .Z(n547) );
  MUX2ND0BWP U1293 ( .I0(n993), .I1(\dec_logic/checksum/check[23] ), .S(n555), 
        .ZN(n556) );
  MUX2ND0BWP U1294 ( .I0(\dec_logic/three_six_load[1] ), .I1(n1059), .S(
        \dec_logic/three_six_load[2] ), .ZN(n557) );
  MUX2ND0BWP U1295 ( .I0(\dec_logic/checksum/check[24] ), .I1(n992), .S(n556), 
        .ZN(n561) );
  NR3D0BWP U1296 ( .A1(n660), .A2(n565), .A3(n564), .ZN(n571) );
  XNR2D1BWP U1297 ( .A1(n915), .A2(n605), .ZN(n603) );
  INR2D1BWP U1298 ( .A1(n712), .B1(n711), .ZN(n614) );
  OAI21D1BWP U1299 ( .A1(\enc_logic/checksum[20] ), .A2(
        \enc_logic/checksum[19] ), .B(n878), .ZN(n636) );
  AO21D1BWP U1300 ( .A1(n649), .A2(n650), .B(n648), .Z(n463) );
  XNR2D1BWP U1301 ( .A1(n664), .A2(n954), .ZN(n651) );
  XNR2D1BWP U1302 ( .A1(n662), .A2(\dec_logic/checksum/check[5] ), .ZN(n682)
         );
  XOR2D1BWP U1303 ( .A1(n931), .A2(n930), .Z(n663) );
  OAI21D1BWP U1304 ( .A1(n902), .A2(n882), .B(n881), .ZN(n883) );
  OAI21D1BWP U1305 ( .A1(n880), .A2(n879), .B(n882), .ZN(n881) );
  XNR2D1BWP U1306 ( .A1(n922), .A2(n921), .ZN(n924) );
  XOR2D1BWP U1307 ( .A1(\enc_logic/checksum[6] ), .A2(\enc_logic/checksum[5] ), 
        .Z(n838) );
  IND3D1BWP U1308 ( .A1(n772), .B1(\dec_logic/checksum/check[25] ), .B2(n666), 
        .ZN(n795) );
  NR3D0BWP U1309 ( .A1(n6), .A2(\main_control/state[3] ), .A3(n1025), .ZN(
        Core_Load_Ack) );
  NR4D0BWP U1310 ( .A1(\main_control/state[1] ), .A2(n6), .A3(
        \main_control/state[2] ), .A4(\main_control/state[3] ), .ZN(n1040) );
  MUX2ND0BWP U1311 ( .I0(\dec_logic/three_six_load[7] ), .I1(n1046), .S(
        \dec_logic/raw[13] ), .ZN(n1047) );
  MUX2ND0BWP U1312 ( .I0(\dec_logic/three_six_load[9] ), .I1(n1048), .S(
        \dec_logic/raw[19] ), .ZN(n1055) );
  MUX2ND0BWP U1313 ( .I0(n1049), .I1(\dec_logic/three_six_load[11] ), .S(
        \dec_logic/raw[18] ), .ZN(n1050) );
  MUX2ND0BWP U1314 ( .I0(n1051), .I1(\dec_logic/raw[20] ), .S(n1050), .ZN(
        n1052) );
  MUX2ND0BWP U1315 ( .I0(\dec_logic/three_six_load[10] ), .I1(n1053), .S(n1052), .ZN(n1054) );
  MUX2ND0BWP U1316 ( .I0(\dec_logic/three_six_load[4] ), .I1(n1057), .S(
        \dec_logic/raw[7] ), .ZN(n1058) );
  NR4D0BWP U1317 ( .A1(\enc_logic/checksum[5] ), .A2(\enc_logic/checksum[6] ), 
        .A3(\enc_logic/check/N25 ), .A4(n1086), .ZN(n1063) );
  NR3D0BWP U1318 ( .A1(\enc_logic/checksum[21] ), .A2(\enc_logic/checksum[20] ), .A3(n1086), .ZN(n1074) );
  NR3D0BWP U1319 ( .A1(\enc_logic/checksum[24] ), .A2(\enc_logic/checksum[23] ), .A3(n1086), .ZN(n1078) );
  NR3D0BWP U1320 ( .A1(\enc_logic/checksum[27] ), .A2(\enc_logic/checksum[26] ), .A3(n1086), .ZN(n1083) );
endmodule

