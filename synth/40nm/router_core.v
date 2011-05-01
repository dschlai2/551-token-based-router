
module router_core ( RX_Data, Clk_R, Rst_n, RX_Data_Valid, TX_Data_Ready, 
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
         \dec_logic/checksum/encoder/N25 , n5, n6, n79, n80, n81, n105, n436,
         n437, n438, n439, n440, n441, n442, n443, n444, n445, n446, n447,
         n448, n449, n450, n451, n452, n453, n454, n455, n456, n457, n458,
         n459, n460, n461, n462, n463, n464, n465, n466, n467, n468, n469,
         n470, n471, n472, n473, n474, n475, n476, n477, n478, n479, n480,
         n481, n482, n483, n485, n486, n487, n488, n489, n490, n491, n492,
         n493, n494, n495, n496, n497, n498, n499, n500, n501, n502, n503,
         n504, n505, n506, n507, n508, n509, n510, n511, n512, n513, n514,
         n515, n516, n517, n518, n519, n520, n521, n522, n523, n524, n525,
         n526, n527, n528, n529, n530, n531, n532, n533, n534, n535, n536,
         n537, n538, n539, n540, n541, n542, n546, n547, n548, n549, n550,
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
         n1062, n1063;
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
  DFCNQD1BWP \main_control/state_reg[2]  ( .D(\main_control/next_state[2] ), 
        .CP(Clk_R), .CDN(Rst_n), .Q(\main_control/state[2] ) );
  EDFCNQD1BWP \ever_versetile/out_reg[51]  ( .D(enc_to_buf[51]), .E(n105), 
        .CP(Clk_R), .CDN(Rst_n), .Q(buf_to_mux[51]) );
  EDFCNQD1BWP \ever_versetile/out_reg[50]  ( .D(enc_to_buf[50]), .E(n105), 
        .CP(Clk_R), .CDN(Rst_n), .Q(buf_to_mux[50]) );
  EDFCNQD1BWP \ever_versetile/out_reg[49]  ( .D(enc_to_buf[49]), .E(n105), 
        .CP(Clk_R), .CDN(Rst_n), .Q(buf_to_mux[49]) );
  EDFCNQD1BWP \ever_versetile/out_reg[48]  ( .D(enc_to_buf[48]), .E(n105), 
        .CP(Clk_R), .CDN(Rst_n), .Q(buf_to_mux[48]) );
  DFCNQD1BWP \ever_versetile/out_reg[1]  ( .D(n479), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[1]) );
  DFCNQD1BWP \ever_versetile/out_reg[0]  ( .D(n480), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[0]) );
  DFCNQD1BWP \ever_versetile/out_reg[2]  ( .D(n478), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[2]) );
  DFCNQD1BWP \ever_versetile/out_reg[3]  ( .D(n477), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[3]) );
  DFCNQD1BWP \ever_versetile/out_reg[4]  ( .D(n476), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[4]) );
  DFCNQD1BWP \ever_versetile/out_reg[5]  ( .D(n475), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[5]) );
  DFCNQD1BWP \ever_versetile/out_reg[6]  ( .D(n474), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[6]) );
  DFCNQD1BWP \ever_versetile/out_reg[7]  ( .D(n473), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[7]) );
  DFCNQD1BWP \ever_versetile/out_reg[8]  ( .D(n472), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[8]) );
  DFCNQD1BWP \ever_versetile/out_reg[9]  ( .D(n471), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[9]) );
  DFCNQD1BWP \ever_versetile/out_reg[10]  ( .D(n470), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[10]) );
  DFCNQD1BWP \ever_versetile/out_reg[11]  ( .D(n469), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[11]) );
  DFCNQD1BWP \ever_versetile/out_reg[12]  ( .D(n468), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[12]) );
  DFCNQD1BWP \ever_versetile/out_reg[13]  ( .D(n467), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[13]) );
  DFCNQD1BWP \ever_versetile/out_reg[14]  ( .D(n466), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[14]) );
  DFCNQD1BWP \ever_versetile/out_reg[15]  ( .D(n465), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[15]) );
  DFCNQD1BWP \ever_versetile/out_reg[16]  ( .D(n464), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[16]) );
  DFCNQD1BWP \ever_versetile/out_reg[17]  ( .D(n463), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[17]) );
  DFCNQD1BWP \ever_versetile/out_reg[18]  ( .D(n462), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[18]) );
  DFCNQD1BWP \ever_versetile/out_reg[19]  ( .D(n461), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[19]) );
  DFCNQD1BWP \ever_versetile/out_reg[20]  ( .D(n460), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[20]) );
  DFCNQD1BWP \ever_versetile/out_reg[21]  ( .D(n459), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[21]) );
  DFCNQD1BWP \ever_versetile/out_reg[22]  ( .D(n458), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[22]) );
  DFCNQD1BWP \ever_versetile/out_reg[24]  ( .D(n456), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[24]) );
  DFCNQD1BWP \ever_versetile/out_reg[25]  ( .D(n455), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[25]) );
  DFCNQD1BWP \ever_versetile/out_reg[26]  ( .D(n454), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[26]) );
  DFCNQD1BWP \ever_versetile/out_reg[27]  ( .D(n453), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[27]) );
  DFCNQD1BWP \ever_versetile/out_reg[28]  ( .D(n452), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[28]) );
  DFCNQD1BWP \ever_versetile/out_reg[29]  ( .D(n451), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[29]) );
  DFCNQD1BWP \ever_versetile/out_reg[30]  ( .D(n450), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[30]) );
  DFCNQD1BWP \ever_versetile/out_reg[31]  ( .D(n449), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[31]) );
  DFCNQD1BWP \ever_versetile/out_reg[32]  ( .D(n448), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[32]) );
  DFCNQD1BWP \ever_versetile/out_reg[33]  ( .D(n447), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[33]) );
  DFCNQD1BWP \ever_versetile/out_reg[34]  ( .D(n446), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[34]) );
  DFCNQD1BWP \ever_versetile/out_reg[35]  ( .D(n445), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[35]) );
  DFCNQD1BWP \ever_versetile/out_reg[36]  ( .D(n444), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[36]) );
  DFCNQD1BWP \ever_versetile/out_reg[37]  ( .D(n443), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[37]) );
  DFCNQD1BWP \ever_versetile/out_reg[38]  ( .D(n442), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[38]) );
  DFCNQD1BWP \ever_versetile/out_reg[39]  ( .D(n441), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[39]) );
  DFCNQD1BWP \ever_versetile/out_reg[40]  ( .D(n440), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[40]) );
  DFCNQD1BWP \ever_versetile/out_reg[41]  ( .D(n439), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[41]) );
  DFCNQD1BWP \ever_versetile/out_reg[42]  ( .D(n438), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[42]) );
  DFCNQD1BWP \ever_versetile/out_reg[43]  ( .D(n437), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[43]) );
  DFCNQD1BWP \ever_versetile/out_reg[44]  ( .D(n436), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[44]) );
  EDFCNQD1BWP \ever_versetile/out_reg[52]  ( .D(\enc_logic/encode_type ), .E(
        n105), .CP(Clk_R), .CDN(Rst_n), .Q(buf_to_mux[52]) );
  EDFCNQD1BWP \ever_versetile/out_reg[53]  ( .D(n967), .E(n105), .CP(Clk_R), 
        .CDN(Rst_n), .Q(buf_to_mux[53]) );
  DFCNQD1BWP \tHandshake/state_reg[0]  ( .D(\tHandshake/next_state[0] ), .CP(
        Clk_R), .CDN(Rst_n), .Q(\tHandshake/state[0] ) );
  DFCNQD1BWP \tHandshake/state_reg[1]  ( .D(\tHandshake/next_state[1] ), .CP(
        Clk_R), .CDN(Rst_n), .Q(TX_Data_Valid) );
  DFCNQD1BWP \main_control/select_sig_reg[1]  ( .D(n482), .CP(Clk_R), .CDN(
        Rst_n), .Q(tx_data_select[1]) );
  DFCNQD1BWP \main_control/select_sig_reg[2]  ( .D(n481), .CP(Clk_R), .CDN(
        Rst_n), .Q(tx_data_select[2]) );
  DFCNQD1BWP \main_control/select_sig_reg[0]  ( .D(n483), .CP(Clk_R), .CDN(
        Rst_n), .Q(tx_data_select[0]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[54]  ( .D(data_to_tx[54]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[54]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[4]  ( .D(data_to_tx[4]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[4]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[47]  ( .D(data_to_tx[47]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[47]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[46]  ( .D(data_to_tx[46]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[46]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[45]  ( .D(data_to_tx[45]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[45]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[44]  ( .D(data_to_tx[44]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[44]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[43]  ( .D(data_to_tx[43]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[43]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[42]  ( .D(data_to_tx[42]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[42]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[41]  ( .D(data_to_tx[41]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[41]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[40]  ( .D(data_to_tx[40]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[40]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[3]  ( .D(data_to_tx[3]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[3]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[39]  ( .D(data_to_tx[39]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[39]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[38]  ( .D(data_to_tx[38]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[38]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[37]  ( .D(data_to_tx[37]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[37]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[36]  ( .D(data_to_tx[36]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[36]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[35]  ( .D(data_to_tx[35]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[35]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[34]  ( .D(data_to_tx[34]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[34]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[33]  ( .D(data_to_tx[33]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[33]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[32]  ( .D(data_to_tx[32]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[32]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[31]  ( .D(data_to_tx[31]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[31]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[30]  ( .D(data_to_tx[30]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[30]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[29]  ( .D(data_to_tx[29]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[29]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[28]  ( .D(data_to_tx[28]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[28]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[27]  ( .D(data_to_tx[27]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[27]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[26]  ( .D(data_to_tx[26]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[26]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[25]  ( .D(data_to_tx[25]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[25]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[24]  ( .D(data_to_tx[24]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[24]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[23]  ( .D(data_to_tx[23]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[23]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[16]  ( .D(data_to_tx[16]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[16]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[10]  ( .D(data_to_tx[10]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[10]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[0]  ( .D(data_to_tx[0]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[0]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[11]  ( .D(data_to_tx[11]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[11]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[12]  ( .D(data_to_tx[12]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[12]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[13]  ( .D(data_to_tx[13]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[13]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[14]  ( .D(data_to_tx[14]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[14]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[15]  ( .D(data_to_tx[15]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[15]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[17]  ( .D(data_to_tx[17]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[17]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[18]  ( .D(data_to_tx[18]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[18]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[19]  ( .D(data_to_tx[19]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[19]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[1]  ( .D(data_to_tx[1]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[1]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[20]  ( .D(data_to_tx[20]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[20]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[21]  ( .D(data_to_tx[21]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[21]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[22]  ( .D(data_to_tx[22]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[22]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[2]  ( .D(data_to_tx[2]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[2]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[48]  ( .D(data_to_tx[48]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[48]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[49]  ( .D(data_to_tx[49]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[49]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[50]  ( .D(data_to_tx[50]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[50]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[51]  ( .D(data_to_tx[51]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[51]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[52]  ( .D(data_to_tx[52]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[52]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[53]  ( .D(data_to_tx[53]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[53]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[5]  ( .D(data_to_tx[5]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[5]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[6]  ( .D(data_to_tx[6]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[6]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[7]  ( .D(data_to_tx[7]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[7]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[8]  ( .D(data_to_tx[8]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[8]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[9]  ( .D(data_to_tx[9]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[9]) );
  EDFCND1BWP \ever_versetile/out_reg[45]  ( .D(\enc_logic/checksum[25] ), .E(
        n105), .CP(Clk_R), .CDN(Rst_n), .QN(n79) );
  EDFCND1BWP \ever_versetile/out_reg[46]  ( .D(\enc_logic/checksum[26] ), .E(
        n105), .CP(Clk_R), .CDN(Rst_n), .QN(n80) );
  EDFCND1BWP \ever_versetile/out_reg[47]  ( .D(\enc_logic/checksum[27] ), .E(
        n105), .CP(Clk_R), .CDN(Rst_n), .QN(n81) );
  DFCND1BWP \rHandshake/state_reg[0]  ( .D(\rHandshake/next_state[0] ), .CP(
        Clk_R), .CDN(Rst_n), .Q(\rHandshake/state[0] ), .QN(n951) );
  DFCND1BWP \main_control/state_reg[0]  ( .D(n5), .CP(Clk_R), .CDN(Rst_n), .Q(
        n6), .QN(n952) );
  DFCNQD1BWP \ever_versetile/out_reg[23]  ( .D(n457), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[23]) );
  IND3D2BWP U576 ( .A1(n957), .B1(n743), .B2(n742), .ZN(n744) );
  ND2D1BWP U577 ( .A1(n976), .A2(n792), .ZN(n632) );
  INVD1BWP U578 ( .I(n759), .ZN(n750) );
  IOA21D1BWP U579 ( .A1(\dec_logic/raw[20] ), .A2(n766), .B(n572), .ZN(n576)
         );
  CKND2BWP U580 ( .I(n790), .ZN(n534) );
  CKND2BWP U581 ( .I(n631), .ZN(n661) );
  INVD1BWP U582 ( .I(n852), .ZN(n598) );
  OAI21D2BWP U583 ( .A1(n693), .A2(n694), .B(n800), .ZN(n704) );
  INVD1BWP U584 ( .I(n743), .ZN(n552) );
  INVD1BWP U585 ( .I(n823), .ZN(n826) );
  ND2D1BWP U586 ( .A1(n837), .A2(\enc_logic/check/N25 ), .ZN(n594) );
  XNR2D1BWP U587 ( .A1(n835), .A2(\enc_logic/checksum[7] ), .ZN(n834) );
  ND2D2BWP U588 ( .A1(n747), .A2(n746), .ZN(n763) );
  ND2D2BWP U589 ( .A1(n765), .A2(\dec_logic/checksum/check[27] ), .ZN(n764) );
  XOR2D1BWP U590 ( .A1(n754), .A2(n755), .Z(n759) );
  ND2D1BWP U591 ( .A1(n632), .A2(n633), .ZN(n658) );
  IND2D1BWP U592 ( .A1(\main_control/state[3] ), .B1(\main_control/state[1] ), 
        .ZN(n642) );
  INVD1BWP U593 ( .I(\dec_logic/checksum/encoder/N25 ), .ZN(n768) );
  CKND2BWP U594 ( .I(n636), .ZN(n781) );
  INR2D2BWP U595 ( .A1(n534), .B1(n789), .ZN(n791) );
  INVD1BWP U596 ( .I(\main_control/state[2] ), .ZN(n953) );
  NR2XD0BWP U597 ( .A1(n981), .A2(tx_data_select[0]), .ZN(n982) );
  INVD1BWP U598 ( .I(\dec_logic/checksum/check[20] ), .ZN(n962) );
  INVD1BWP U599 ( .I(\dec_logic/checksum/check[22] ), .ZN(n960) );
  INVD1BWP U600 ( .I(\dec_logic/checksum/check[24] ), .ZN(n958) );
  INVD1BWP U601 ( .I(\dec_logic/checksum/check[25] ), .ZN(n957) );
  INVD1BWP U602 ( .I(\dec_logic/checksum/check[26] ), .ZN(n956) );
  INVD1BWP U603 ( .I(\tHandshake/state[0] ), .ZN(n954) );
  INVD1BWP U604 ( .I(\enc_logic/checksum[5] ), .ZN(n810) );
  XNR2D1BWP U605 ( .A1(n911), .A2(n590), .ZN(n913) );
  XNR2D1BWP U606 ( .A1(n589), .A2(n902), .ZN(n918) );
  NR2XD0BWP U607 ( .A1(n967), .A2(n634), .ZN(n635) );
  NR2D3BWP U608 ( .A1(n967), .A2(n634), .ZN(n941) );
  CKND2BWP U609 ( .I(n941), .ZN(n1050) );
  INR2D1BWP U610 ( .A1(n995), .B1(n642), .ZN(n944) );
  NR2XD0BWP U611 ( .A1(n952), .A2(n953), .ZN(n644) );
  MOAI22D0BWP U612 ( .A1(n1012), .A2(n639), .B1(buf_to_mux[22]), .B2(n638), 
        .ZN(data_to_tx[22]) );
  MOAI22D0BWP U613 ( .A1(n1009), .A2(n639), .B1(buf_to_mux[21]), .B2(n533), 
        .ZN(data_to_tx[21]) );
  MOAI22D0BWP U614 ( .A1(n1011), .A2(n639), .B1(buf_to_mux[20]), .B2(n533), 
        .ZN(data_to_tx[20]) );
  MOAI22D0BWP U615 ( .A1(n1031), .A2(n546), .B1(\dec_logic/raw[13] ), .B2(n982), .ZN(data_to_tx[13]) );
  MOAI22D0BWP U616 ( .A1(n1013), .A2(n639), .B1(buf_to_mux[10]), .B2(n533), 
        .ZN(data_to_tx[10]) );
  MOAI22D0BWP U617 ( .A1(n1015), .A2(n639), .B1(buf_to_mux[16]), .B2(n533), 
        .ZN(data_to_tx[16]) );
  MOAI22D0BWP U618 ( .A1(n1010), .A2(n639), .B1(buf_to_mux[23]), .B2(n638), 
        .ZN(data_to_tx[23]) );
  MOAI22D0BWP U619 ( .A1(n976), .A2(n639), .B1(buf_to_mux[27]), .B2(n638), 
        .ZN(data_to_tx[27]) );
  MOAI22D0BWP U620 ( .A1(n964), .A2(n639), .B1(buf_to_mux[38]), .B2(n638), 
        .ZN(data_to_tx[38]) );
  MOAI22D0BWP U621 ( .A1(n963), .A2(n639), .B1(buf_to_mux[39]), .B2(n638), 
        .ZN(data_to_tx[39]) );
  MOAI22D0BWP U622 ( .A1(n962), .A2(n639), .B1(buf_to_mux[40]), .B2(n638), 
        .ZN(data_to_tx[40]) );
  MOAI22D0BWP U623 ( .A1(n961), .A2(n639), .B1(buf_to_mux[41]), .B2(n638), 
        .ZN(data_to_tx[41]) );
  MOAI22D0BWP U624 ( .A1(n960), .A2(n639), .B1(buf_to_mux[42]), .B2(n533), 
        .ZN(data_to_tx[42]) );
  MOAI22D0BWP U625 ( .A1(n959), .A2(n639), .B1(buf_to_mux[43]), .B2(n638), 
        .ZN(data_to_tx[43]) );
  MOAI22D0BWP U626 ( .A1(n958), .A2(n639), .B1(buf_to_mux[44]), .B2(n638), 
        .ZN(data_to_tx[44]) );
  MOAI22D0BWP U627 ( .A1(n1008), .A2(n639), .B1(buf_to_mux[4]), .B2(n533), 
        .ZN(data_to_tx[4]) );
  INVD1BWP U628 ( .I(\enc_logic/encode_type ), .ZN(n967) );
  MOAI22D0BWP U629 ( .A1(n932), .A2(n1050), .B1(n634), .B2(buf_to_mux[16]), 
        .ZN(n464) );
  MOAI22D0BWP U630 ( .A1(\enc_logic/checksum[9] ), .A2(n937), .B1(
        buf_to_mux[6]), .B2(n634), .ZN(n474) );
  ND2D2BWP U631 ( .A1(n646), .A2(n645), .ZN(n105) );
  IND2D1BWP U632 ( .A1(\main_control/state[1] ), .B1(n644), .ZN(n645) );
  INVD1BWP U633 ( .I(n944), .ZN(n646) );
  AOI21D1BWP U634 ( .A1(n826), .A2(n822), .B(\enc_logic/checksum[20] ), .ZN(
        n485) );
  NR2XD0BWP U635 ( .A1(n825), .A2(n485), .ZN(n868) );
  CKND0BWP U636 ( .I(n856), .ZN(n486) );
  AOI22D0BWP U637 ( .A1(n857), .A2(n486), .B1(n867), .B2(n866), .ZN(n487) );
  OAI21D0BWP U638 ( .A1(n867), .A2(n866), .B(n487), .ZN(n888) );
  OA21D0BWP U639 ( .A1(n663), .A2(n797), .B(n689), .Z(n684) );
  XOR4D2BWP U640 ( .A1(n874), .A2(n606), .A3(n873), .A4(n871), .Z(n587) );
  CKND0BWP U641 ( .I(n864), .ZN(n488) );
  AOI21D0BWP U642 ( .A1(n863), .A2(n488), .B(n865), .ZN(n489) );
  OAI21D0BWP U643 ( .A1(n863), .A2(n488), .B(n489), .ZN(n891) );
  MUX2ND0BWP U644 ( .I0(n1010), .I1(\dec_logic/three_six_load[11] ), .S(
        \dec_logic/raw[18] ), .ZN(n490) );
  MUX2ND0BWP U645 ( .I0(n1011), .I1(\dec_logic/raw[20] ), .S(n490), .ZN(n491)
         );
  MUX2ND0BWP U646 ( .I0(n1012), .I1(\dec_logic/three_six_load[10] ), .S(n491), 
        .ZN(n492) );
  MUX2ND0BWP U647 ( .I0(n1009), .I1(\dec_logic/three_six_load[9] ), .S(
        \dec_logic/raw[19] ), .ZN(n493) );
  MUX2ND0BWP U648 ( .I0(\dec_logic/three_six_load[1] ), .I1(n1008), .S(
        \dec_logic/three_six_load[2] ), .ZN(n494) );
  XNR4D0BWP U649 ( .A1(\dec_logic/three_six_load[0] ), .A2(\dec_logic/raw[0] ), 
        .A3(n494), .A4(\dec_logic/raw[2] ), .ZN(n495) );
  AOI22D0BWP U650 ( .A1(\dec_logic/checksum/check[25] ), .A2(
        \dec_logic/checksum/check[27] ), .B1(n957), .B2(n955), .ZN(n496) );
  AOI22D0BWP U651 ( .A1(\dec_logic/checksum/check[26] ), .A2(
        \dec_logic/checksum/check[22] ), .B1(n960), .B2(n956), .ZN(n497) );
  MUX2ND0BWP U652 ( .I0(n959), .I1(\dec_logic/checksum/check[23] ), .S(n497), 
        .ZN(n498) );
  MUX2ND0BWP U653 ( .I0(n958), .I1(\dec_logic/checksum/check[24] ), .S(n498), 
        .ZN(n499) );
  OAI22D0BWP U654 ( .A1(n495), .A2(\dec_logic/raw[1] ), .B1(n496), .B2(n499), 
        .ZN(n500) );
  AOI221D0BWP U655 ( .A1(n495), .A2(\dec_logic/raw[1] ), .B1(n499), .B2(n496), 
        .C(n500), .ZN(n501) );
  OAI21D0BWP U656 ( .A1(n492), .A2(n493), .B(n501), .ZN(n502) );
  AOI211D0BWP U657 ( .A1(n492), .A2(n493), .B(n802), .C(n502), .ZN(n583) );
  NR2D0BWP U658 ( .A1(n678), .A2(n631), .ZN(n503) );
  CKND0BWP U659 ( .I(n795), .ZN(n504) );
  AOI222D1BWP U660 ( .A1(n503), .A2(\dec_logic/checksum/check[12] ), .B1(n503), 
        .B2(\dec_logic/checksum/check[11] ), .C1(
        \dec_logic/checksum/check[12] ), .C2(n504), .ZN(n674) );
  CKND0BWP U661 ( .I(n874), .ZN(n505) );
  AOI22D0BWP U662 ( .A1(n878), .A2(n876), .B1(n505), .B2(n871), .ZN(n506) );
  OAI21D0BWP U663 ( .A1(n505), .A2(n871), .B(n506), .ZN(n882) );
  CKND0BWP U664 ( .I(n860), .ZN(n507) );
  AOI21D0BWP U665 ( .A1(n861), .A2(n507), .B(n863), .ZN(n508) );
  NR2D0BWP U666 ( .A1(n1034), .A2(n975), .ZN(n509) );
  AOI211D0BWP U667 ( .A1(n860), .A2(n862), .B(n508), .C(n509), .ZN(n893) );
  XNR4D0BWP U668 ( .A1(n803), .A2(\dec_logic/checksum/check[10] ), .A3(
        \dec_logic/checksum/check[15] ), .A4(n804), .ZN(n581) );
  OA211D0BWP U669 ( .A1(\tHandshake/state[0] ), .A2(n1020), .B(n1005), .C(
        n1006), .Z(n510) );
  CKND2D0BWP U670 ( .A1(n1004), .A2(n510), .ZN(n1025) );
  CKND0BWP U671 ( .I(n1050), .ZN(n511) );
  IND3D0BWP U672 ( .A1(n968), .B1(\enc_logic/checksum[25] ), .B2(
        \enc_logic/checksum[27] ), .ZN(n512) );
  AO222D0BWP U673 ( .A1(n511), .A2(n512), .B1(n940), .B2(
        \enc_logic/checksum[24] ), .C1(n634), .C2(buf_to_mux[44]), .Z(n436) );
  IOA21D0BWP U674 ( .A1(n663), .A2(n797), .B(\dec_logic/checksum/check[14] ), 
        .ZN(n689) );
  CKND0BWP U675 ( .I(n717), .ZN(n513) );
  OAI21D1BWP U676 ( .A1(n513), .A2(n716), .B(n719), .ZN(n755) );
  MAOI222D0BWP U677 ( .A(n893), .B(n891), .C(n892), .ZN(n514) );
  MAOI222D0BWP U678 ( .A(n887), .B(n515), .C(n516), .ZN(n517) );
  CKND2D0BWP U679 ( .A1(n889), .A2(n890), .ZN(n518) );
  OAI21D0BWP U680 ( .A1(n514), .A2(n518), .B(n517), .ZN(n519) );
  AOI21D0BWP U681 ( .A1(n514), .A2(n518), .B(n519), .ZN(n895) );
  CKND0BWP U682 ( .I(n888), .ZN(n515) );
  CKND0BWP U683 ( .I(n886), .ZN(n516) );
  AOI22D0BWP U684 ( .A1(\dec_logic/checksum/check[21] ), .A2(n963), .B1(
        \dec_logic/checksum/check[19] ), .B2(n961), .ZN(n520) );
  XNR4D0BWP U685 ( .A1(n805), .A2(\dec_logic/checksum/check[16] ), .A3(
        \dec_logic/checksum/check[20] ), .A4(n520), .ZN(n580) );
  OAI21D0BWP U686 ( .A1(n6), .A2(\main_control/state[3] ), .B(n953), .ZN(n521)
         );
  INR3D0BWP U687 ( .A1(n983), .B1(n947), .B2(n521), .ZN(n1063) );
  IND3D0BWP U688 ( .A1(\enc_logic/checksum[8] ), .B1(n975), .B2(n635), .ZN(
        n937) );
  IND2D0BWP U689 ( .A1(Packet_From_Node_Valid), .B1(n944), .ZN(n1020) );
  CKND0BWP U690 ( .I(n1050), .ZN(n522) );
  IND3D0BWP U691 ( .A1(n972), .B1(\enc_logic/checksum[19] ), .B2(
        \enc_logic/checksum[20] ), .ZN(n523) );
  AO222D0BWP U692 ( .A1(n522), .A2(n523), .B1(n940), .B2(
        \enc_logic/checksum[12] ), .C1(n634), .C2(buf_to_mux[32]), .Z(n448) );
  IND2D0BWP U693 ( .A1(n857), .B1(n846), .ZN(n847) );
  CKND2D0BWP U694 ( .A1(n755), .A2(n565), .ZN(n524) );
  OAI21D0BWP U695 ( .A1(n752), .A2(n753), .B(n751), .ZN(n525) );
  CKXOR2D0BWP U696 ( .A1(n525), .A2(n524), .Z(n526) );
  MAOI222D0BWP U697 ( .A(n758), .B(n756), .C(n757), .ZN(n527) );
  NR2D0BWP U698 ( .A1(n526), .A2(n527), .ZN(n542) );
  IND2D0BWP U699 ( .A1(n762), .B1(n763), .ZN(n574) );
  CKND0BWP U700 ( .I(n889), .ZN(n528) );
  MUX2ND0BWP U701 ( .I0(n528), .I1(n889), .S(n890), .ZN(n883) );
  IND2D0BWP U702 ( .A1(data_type[0]), .B1(data_type[1]), .ZN(n790) );
  INR2D0BWP U703 ( .A1(\enc_logic/checksum[18] ), .B1(n974), .ZN(n1036) );
  CKND0BWP U704 ( .I(n837), .ZN(n529) );
  AO21D0BWP U705 ( .A1(\enc_logic/check/N25 ), .A2(n529), .B(n836), .Z(n938)
         );
  CKND2D0BWP U706 ( .A1(n946), .A2(n945), .ZN(n1019) );
  CKND0BWP U707 ( .I(\enc_logic/check/N25 ), .ZN(n530) );
  MOAI22D0BWP U708 ( .A1(n1049), .A2(n530), .B1(n634), .B2(buf_to_mux[24]), 
        .ZN(n531) );
  AO31D0BWP U709 ( .A1(n941), .A2(n841), .A3(n813), .B(n531), .Z(n456) );
  NR2XD4BWP U710 ( .A1(n659), .A2(\dec_logic/checksum/check[10] ), .ZN(n631)
         );
  NR3D3BWP U711 ( .A1(n678), .A2(n631), .A3(n662), .ZN(n664) );
  NR2D3BWP U712 ( .A1(n667), .A2(n666), .ZN(n670) );
  CKND8BWP U713 ( .I(n625), .ZN(n785) );
  OR3XD1BWP U714 ( .A1(tx_data_select[0]), .A2(tx_data_select[1]), .A3(n977), 
        .Z(n546) );
  CKND2BWP U715 ( .I(n546), .ZN(n533) );
  DEL025D1BWP U716 ( .I(n982), .Z(n640) );
  CKND3BWP U717 ( .I(\dec_logic/checksum/check[7] ), .ZN(n976) );
  CKND4BWP U718 ( .I(n690), .ZN(n703) );
  CKND2BWP U719 ( .I(\dec_logic/checksum/check[8] ), .ZN(n792) );
  CKND0BWP U720 ( .I(n1049), .ZN(n532) );
  NR2XD0BWP U721 ( .A1(\enc_logic/encode_type ), .A2(n942), .ZN(n940) );
  NR3D4BWP U722 ( .A1(n578), .A2(n577), .A3(n576), .ZN(n788) );
  CKND4BWP U723 ( .I(n541), .ZN(n578) );
  CKND2BWP U724 ( .I(n851), .ZN(n599) );
  IND3D4BWP U725 ( .A1(n819), .B1(n597), .B2(n845), .ZN(n851) );
  ND2D3BWP U726 ( .A1(n836), .A2(\enc_logic/check/N25 ), .ZN(n1034) );
  XNR2D2BWP U727 ( .A1(n828), .A2(n835), .ZN(n829) );
  CKND4BWP U728 ( .I(n802), .ZN(n659) );
  INVD1BWP U729 ( .I(n666), .ZN(n687) );
  NR2D3BWP U730 ( .A1(n671), .A2(n670), .ZN(n694) );
  CKND2BWP U731 ( .I(n586), .ZN(n603) );
  ND2D3BWP U732 ( .A1(n602), .A2(n972), .ZN(n586) );
  ND2D3BWP U733 ( .A1(n547), .A2(\enc_logic/checksum[27] ), .ZN(n917) );
  OAI22D4BWP U734 ( .A1(n661), .A2(n804), .B1(n802), .B2(n660), .ZN(n666) );
  CKND1BWP U735 ( .I(n881), .ZN(n607) );
  BUFFD4BWP U736 ( .I(n942), .Z(n634) );
  OAI22D0BWP U737 ( .A1(n81), .A2(n546), .B1(n955), .B2(n639), .ZN(
        data_to_tx[47]) );
  CKND2D1BWP U738 ( .A1(n829), .A2(n932), .ZN(n831) );
  ND2D8BWP U739 ( .A1(TX_Data_Valid), .A2(n954), .ZN(\tHandshake/N12 ) );
  INVD1BWP U740 ( .I(tx_data_select[2]), .ZN(n977) );
  XOR3D1BWP U741 ( .A1(\dec_logic/checksum/check[23] ), .A2(
        \dec_logic/checksum/check[21] ), .A3(n960), .Z(n732) );
  INVD1BWP U742 ( .I(n564), .ZN(n538) );
  ND2D3BWP U743 ( .A1(n551), .A2(n550), .ZN(n743) );
  XOR3D1BWP U744 ( .A1(n757), .A2(n756), .A3(n758), .Z(n754) );
  ND2D1BWP U745 ( .A1(n698), .A2(n697), .ZN(n758) );
  ND2D1BWP U746 ( .A1(n673), .A2(n672), .ZN(n757) );
  AO21D0BWP U747 ( .A1(n634), .A2(buf_to_mux[8]), .B(n1030), .Z(n472) );
  AO21D0BWP U748 ( .A1(n634), .A2(buf_to_mux[14]), .B(n1032), .Z(n466) );
  CKND0BWP U749 ( .I(n843), .ZN(n842) );
  IND2D1BWP U750 ( .A1(n1062), .B1(n624), .ZN(n623) );
  AOI22D1BWP U751 ( .A1(n635), .A2(n924), .B1(n634), .B2(buf_to_mux[20]), .ZN(
        n921) );
  ND2D1BWP U752 ( .A1(n941), .A2(n920), .ZN(n928) );
  MOAI22D0BWP U753 ( .A1(n793), .A2(n639), .B1(n638), .B2(buf_to_mux[29]), 
        .ZN(data_to_tx[29]) );
  MOAI22D0BWP U754 ( .A1(n797), .A2(n639), .B1(n638), .B2(buf_to_mux[33]), 
        .ZN(data_to_tx[33]) );
  AN4D1BWP U755 ( .A1(n999), .A2(n1000), .A3(n1007), .A4(n1005), .Z(n996) );
  MOAI22D0BWP U756 ( .A1(n798), .A2(n639), .B1(n638), .B2(buf_to_mux[34]), 
        .ZN(data_to_tx[34]) );
  MOAI22D0BWP U757 ( .A1(n792), .A2(n639), .B1(n638), .B2(buf_to_mux[28]), 
        .ZN(data_to_tx[28]) );
  MOAI22D0BWP U758 ( .A1(n796), .A2(n639), .B1(n638), .B2(buf_to_mux[32]), 
        .ZN(data_to_tx[32]) );
  MOAI22D0BWP U759 ( .A1(n795), .A2(n639), .B1(n638), .B2(buf_to_mux[31]), 
        .ZN(data_to_tx[31]) );
  MOAI22D0BWP U760 ( .A1(n794), .A2(n639), .B1(n638), .B2(buf_to_mux[30]), 
        .ZN(data_to_tx[30]) );
  MOAI22D0BWP U761 ( .A1(n801), .A2(n639), .B1(n533), .B2(buf_to_mux[37]), 
        .ZN(data_to_tx[37]) );
  MOAI22D0BWP U762 ( .A1(n966), .A2(n639), .B1(buf_to_mux[25]), .B2(n638), 
        .ZN(data_to_tx[25]) );
  MOAI22D0BWP U763 ( .A1(n965), .A2(n639), .B1(buf_to_mux[26]), .B2(n638), 
        .ZN(data_to_tx[26]) );
  CKND2D1BWP U764 ( .A1(n948), .A2(n985), .ZN(n1007) );
  AO22D0BWP U765 ( .A1(\dec_logic/raw[14] ), .A2(n982), .B1(buf_to_mux[14]), 
        .B2(n533), .Z(data_to_tx[14]) );
  AO22D0BWP U766 ( .A1(\dec_logic/three_six_load[6] ), .A2(n982), .B1(
        buf_to_mux[15]), .B2(n533), .Z(data_to_tx[15]) );
  AO22D0BWP U767 ( .A1(\dec_logic/three_six_load[8] ), .A2(n982), .B1(
        buf_to_mux[17]), .B2(n533), .Z(data_to_tx[17]) );
  AO22D0BWP U768 ( .A1(\dec_logic/raw[12] ), .A2(n982), .B1(buf_to_mux[12]), 
        .B2(n533), .Z(data_to_tx[12]) );
  INVD3BWP U769 ( .I(n982), .ZN(n639) );
  AO22D0BWP U770 ( .A1(\dec_logic/three_six_load[5] ), .A2(n982), .B1(
        buf_to_mux[11]), .B2(n533), .Z(data_to_tx[11]) );
  ND3D0BWP U771 ( .A1(n952), .A2(n949), .A3(n1054), .ZN(n1006) );
  NR2D1BWP U772 ( .A1(n534), .A2(\dec_logic/three_six_load[0] ), .ZN(n767) );
  NR2XD0BWP U773 ( .A1(n953), .A2(n950), .ZN(n1054) );
  CKND0BWP U774 ( .I(n1057), .ZN(n643) );
  ND2D1BWP U775 ( .A1(tx_data_select[1]), .A2(n977), .ZN(n981) );
  CKND1BWP U776 ( .I(n1036), .ZN(n1035) );
  CKND0BWP U777 ( .I(n897), .ZN(n896) );
  CKND2D1BWP U778 ( .A1(n790), .A2(\dec_logic/checksum/check[14] ), .ZN(n627)
         );
  CKND2D1BWP U779 ( .A1(n790), .A2(\dec_logic/three_six_load[2] ), .ZN(n628)
         );
  CKND2D1BWP U780 ( .A1(n790), .A2(\dec_logic/three_six_load[3] ), .ZN(n630)
         );
  CKND2D1BWP U781 ( .A1(n790), .A2(\dec_logic/three_six_load[5] ), .ZN(n629)
         );
  CKND2D1BWP U782 ( .A1(n790), .A2(\dec_logic/three_six_load[6] ), .ZN(n626)
         );
  NR2D1BWP U783 ( .A1(\main_control/state[2] ), .A2(n6), .ZN(n995) );
  IND2D1BWP U784 ( .A1(\rHandshake/state[0] ), .B1(\rHandshake/state[1] ), 
        .ZN(n1053) );
  CKND0BWP U785 ( .I(\main_control/state[3] ), .ZN(n949) );
  OR2D0BWP U786 ( .A1(n6), .A2(\main_control/state[1] ), .Z(n983) );
  IND2D0BWP U787 ( .A1(\main_control/state[2] ), .B1(n6), .ZN(n1057) );
  NR2D0BWP U788 ( .A1(n970), .A2(n1043), .ZN(n1044) );
  INVD1BWP U789 ( .I(n702), .ZN(n805) );
  CKND1BWP U790 ( .I(n803), .ZN(n665) );
  INVD1BWP U791 ( .I(\dec_logic/checksum/check[23] ), .ZN(n959) );
  INVD1BWP U792 ( .I(\dec_logic/checksum/check[13] ), .ZN(n797) );
  XNR2D1BWP U793 ( .A1(\dec_logic/checksum/check[13] ), .A2(
        \dec_logic/checksum/check[14] ), .ZN(n803) );
  INVD1BWP U794 ( .I(\dec_logic/checksum/check[21] ), .ZN(n961) );
  INVD1BWP U795 ( .I(\dec_logic/checksum/check[17] ), .ZN(n801) );
  INVD1BWP U796 ( .I(\dec_logic/checksum/check[18] ), .ZN(n964) );
  INVD12BWP U797 ( .I(\dec_logic/checksum/check[5] ), .ZN(n966) );
  INVD1BWP U798 ( .I(\dec_logic/checksum/check[9] ), .ZN(n793) );
  INVD1BWP U799 ( .I(\dec_logic/checksum/check[15] ), .ZN(n799) );
  INVD1BWP U800 ( .I(\enc_logic/checksum[11] ), .ZN(n932) );
  INVD1BWP U801 ( .I(\enc_logic/checksum[22] ), .ZN(n971) );
  INVD1BWP U802 ( .I(\enc_logic/checksum[23] ), .ZN(n970) );
  OAI31D1BWP U803 ( .A1(n794), .A2(n785), .A3(n781), .B(n626), .ZN(
        Packet_To_Node[6]) );
  OAI31D1BWP U804 ( .A1(n965), .A2(n785), .A3(n781), .B(n628), .ZN(
        Packet_To_Node[2]) );
  OAI31D1BWP U805 ( .A1(n793), .A2(n785), .A3(n781), .B(n629), .ZN(
        Packet_To_Node[5]) );
  OAI31D1BWP U806 ( .A1(n976), .A2(n785), .A3(n781), .B(n630), .ZN(
        Packet_To_Node[3]) );
  OAI31D1BWP U807 ( .A1(n962), .A2(n785), .A3(n781), .B(n627), .ZN(
        Packet_To_Node[16]) );
  INR2XD1BWP U808 ( .A1(n939), .B1(n623), .ZN(n5) );
  ND2D1BWP U809 ( .A1(n591), .A2(n910), .ZN(n619) );
  NR2D1BWP U810 ( .A1(n917), .A2(n918), .ZN(n914) );
  CKND1BWP U811 ( .I(n765), .ZN(n566) );
  NR2D1BWP U812 ( .A1(\enc_logic/checksum[27] ), .A2(n547), .ZN(n923) );
  INR2XD1BWP U813 ( .A1(n555), .B1(n746), .ZN(n765) );
  CKND1BWP U814 ( .I(n918), .ZN(n617) );
  ND2D3BWP U815 ( .A1(n539), .A2(n540), .ZN(n747) );
  CKND1BWP U816 ( .I(n590), .ZN(n615) );
  CKND1BWP U817 ( .I(n894), .ZN(n614) );
  CKND2D2BWP U818 ( .A1(n741), .A2(n538), .ZN(n539) );
  ND2D2BWP U819 ( .A1(n537), .A2(n564), .ZN(n540) );
  ND2D3BWP U820 ( .A1(n554), .A2(n744), .ZN(n745) );
  CKND2D1BWP U821 ( .A1(n759), .A2(n760), .ZN(n570) );
  CKND2D1BWP U822 ( .A1(n588), .A2(n882), .ZN(n884) );
  CKND2D2BWP U823 ( .A1(n744), .A2(n743), .ZN(n564) );
  CKND1BWP U824 ( .I(n903), .ZN(n904) );
  XNR2D1BWP U825 ( .A1(n900), .A2(\enc_logic/checksum[24] ), .ZN(n903) );
  NR2D1BWP U826 ( .A1(n1043), .A2(n900), .ZN(n881) );
  CKND1BWP U827 ( .I(n587), .ZN(n608) );
  ND2D2BWP U828 ( .A1(n722), .A2(n721), .ZN(n738) );
  CKND1BWP U829 ( .I(n734), .ZN(n548) );
  ND2D4BWP U830 ( .A1(n729), .A2(n715), .ZN(n728) );
  OAI211D1BWP U831 ( .A1(\enc_logic/checksum[22] ), .A2(n872), .B(n605), .C(
        n604), .ZN(n606) );
  CKND0BWP U832 ( .I(n754), .ZN(n565) );
  AOI21D1BWP U833 ( .A1(n603), .A2(n971), .B(n970), .ZN(n605) );
  NR2D2BWP U834 ( .A1(n971), .A2(n869), .ZN(n873) );
  CKND2BWP U835 ( .I(n733), .ZN(n715) );
  ND2D3BWP U836 ( .A1(n714), .A2(n962), .ZN(n729) );
  FCICIND1BWP U837 ( .CIN(n872), .A(n870), .B(n871), .CO(n890) );
  CKND1BWP U838 ( .I(n868), .ZN(n602) );
  CKND0BWP U839 ( .I(n825), .ZN(n827) );
  NR2D1BWP U840 ( .A1(\dec_logic/checksum/check[17] ), .A2(n695), .ZN(n696) );
  OAI22D2BWP U841 ( .A1(n699), .A2(n557), .B1(n964), .B2(n801), .ZN(n556) );
  NR2D1BWP U842 ( .A1(n685), .A2(n684), .ZN(n753) );
  XOR2D1BWP U843 ( .A1(n859), .A2(n858), .Z(n871) );
  XNR2D1BWP U844 ( .A1(n867), .A2(n850), .ZN(n859) );
  CKND1BWP U845 ( .I(n701), .ZN(n685) );
  NR2D1BWP U846 ( .A1(n675), .A2(n674), .ZN(n752) );
  CKND2D1BWP U847 ( .A1(n853), .A2(n974), .ZN(n855) );
  CKND1BWP U848 ( .I(n853), .ZN(n854) );
  OAI21D1BWP U849 ( .A1(n599), .A2(n598), .B(n820), .ZN(n601) );
  CKND2D1BWP U850 ( .A1(n856), .A2(n846), .ZN(n848) );
  CKXOR2D2BWP U851 ( .A1(n675), .A2(n674), .Z(n701) );
  CKND2D1BWP U852 ( .A1(n857), .A2(n866), .ZN(n849) );
  OAI211D0BWP U853 ( .A1(n1029), .A2(n105), .B(n936), .C(n937), .ZN(n473) );
  CKND1BWP U854 ( .I(n866), .ZN(n846) );
  OAI22D0BWP U855 ( .A1(n1050), .A2(n931), .B1(n1031), .B2(n105), .ZN(n467) );
  MAOI22D0BWP U856 ( .A1(n927), .A2(n941), .B1(n1033), .B2(n105), .ZN(n925) );
  AOI22D0BWP U857 ( .A1(n941), .A2(\enc_logic/checksum[14] ), .B1(n634), .B2(
        buf_to_mux[22]), .ZN(n915) );
  INVD3BWP U858 ( .I(n664), .ZN(n686) );
  CKND0BWP U859 ( .I(n677), .ZN(n683) );
  CKND2D1BWP U860 ( .A1(n943), .A2(n1027), .ZN(n481) );
  CKND1BWP U861 ( .I(n1025), .ZN(n641) );
  OAI32D0BWP U862 ( .A1(n1026), .A2(n948), .A3(n1025), .B1(tx_data_select[2]), 
        .B2(n1026), .ZN(n1027) );
  CKND1BWP U863 ( .I(n1026), .ZN(n1001) );
  NR2D3BWP U864 ( .A1(n592), .A2(\enc_logic/checksum[13] ), .ZN(n817) );
  NR2D1BWP U865 ( .A1(n1019), .A2(\dec_logic/token ), .ZN(n585) );
  OAI22D0BWP U866 ( .A1(n80), .A2(n546), .B1(n956), .B2(n639), .ZN(
        data_to_tx[46]) );
  OAI22D0BWP U867 ( .A1(n79), .A2(n546), .B1(n957), .B2(n639), .ZN(
        data_to_tx[45]) );
  OA32D0BWP U868 ( .A1(n1060), .A2(\tHandshake/state[0] ), .A3(TX_Data_Ready), 
        .B1(TX_Data_Valid), .B2(n1060), .Z(\tHandshake/next_state[1] ) );
  AOI22D0BWP U869 ( .A1(n954), .A2(n1059), .B1(n1060), .B2(n1058), .ZN(
        \tHandshake/next_state[0] ) );
  CKND1BWP U870 ( .I(n654), .ZN(n535) );
  CKND2BWP U871 ( .I(n815), .ZN(n592) );
  CKND1BWP U872 ( .I(n829), .ZN(n830) );
  AOI21D0BWP U873 ( .A1(n1057), .A2(n1056), .B(n954), .ZN(n1060) );
  AOI22D0BWP U874 ( .A1(n997), .A2(n948), .B1(Packet_From_Node_Valid), .B2(
        n944), .ZN(n998) );
  OAI22D0BWP U875 ( .A1(n1020), .A2(n954), .B1(n642), .B2(n1057), .ZN(n1024)
         );
  OAI21D0BWP U876 ( .A1(n6), .A2(n1055), .B(n943), .ZN(n807) );
  CKND0BWP U877 ( .I(n1006), .ZN(n984) );
  AOI22D0BWP U878 ( .A1(n947), .A2(n643), .B1(\main_control/state[2] ), .B2(
        \main_control/state[3] ), .ZN(n943) );
  INVD2BWP U879 ( .I(n546), .ZN(n638) );
  CKND2D0BWP U880 ( .A1(n947), .A2(n644), .ZN(n1061) );
  AO21D0BWP U881 ( .A1(n953), .A2(n1055), .B(n1054), .Z(n1056) );
  CKND2D1BWP U882 ( .A1(n946), .A2(n1003), .ZN(n1022) );
  INR2XD0BWP U883 ( .A1(n644), .B1(n642), .ZN(n948) );
  IAO21D0BWP U884 ( .A1(\dec_logic/token ), .A2(tx_data_select[0]), .B(n981), 
        .ZN(data_to_tx[54]) );
  CKND2D0BWP U885 ( .A1(\main_control/state[3] ), .A2(n950), .ZN(n1021) );
  CKND2D0BWP U886 ( .A1(tx_data_select[0]), .A2(n977), .ZN(n979) );
  NR2D0BWP U887 ( .A1(n983), .A2(n953), .ZN(Core_Load_Ack) );
  OAI21D0BWP U888 ( .A1(\rHandshake/state[1] ), .A2(n951), .B(n1053), .ZN(
        RX_Data_Ready) );
  NR2D0BWP U889 ( .A1(n1055), .A2(n952), .ZN(Packet_To_Node_Valid) );
  CKND2D0BWP U890 ( .A1(n995), .A2(n947), .ZN(n1005) );
  XNR4D1BWP U891 ( .A1(\dec_logic/three_six_load[3] ), .A2(\dec_logic/raw[6] ), 
        .A3(\dec_logic/raw[8] ), .A4(n1014), .ZN(n1018) );
  XNR4D1BWP U892 ( .A1(\dec_logic/three_six_load[6] ), .A2(\dec_logic/raw[12] ), .A3(\dec_logic/raw[14] ), .A4(n1016), .ZN(n1017) );
  CKND2D1BWP U893 ( .A1(n897), .A2(n1043), .ZN(n898) );
  CKND1BWP U894 ( .I(n732), .ZN(n731) );
  CKND1BWP U895 ( .I(\rHandshake/state[1] ), .ZN(n1051) );
  CKND2D0BWP U896 ( .A1(\main_control/state[3] ), .A2(\main_control/state[1] ), 
        .ZN(n1055) );
  CKND1BWP U897 ( .I(buf_to_mux[25]), .ZN(n812) );
  CKND0BWP U898 ( .I(TX_Data_Valid), .ZN(n1058) );
  CKND0BWP U899 ( .I(\main_control/state[1] ), .ZN(n950) );
  CKND2D1BWP U900 ( .A1(n968), .A2(n969), .ZN(n897) );
  CKND1BWP U901 ( .I(n927), .ZN(n929) );
  CKND1BWP U902 ( .I(n924), .ZN(n926) );
  CKND0BWP U903 ( .I(n985), .ZN(n997) );
  NR2D1BWP U904 ( .A1(\dec_logic/checksum/check[17] ), .A2(
        \dec_logic/checksum/check[18] ), .ZN(n557) );
  NR2D1BWP U905 ( .A1(\dec_logic/checksum/check[23] ), .A2(
        \dec_logic/checksum/check[22] ), .ZN(n562) );
  NR2D1BWP U906 ( .A1(\enc_logic/checksum[17] ), .A2(\enc_logic/checksum[18] ), 
        .ZN(n813) );
  NR2D1BWP U907 ( .A1(\dec_logic/checksum/check[9] ), .A2(
        \dec_logic/checksum/check[8] ), .ZN(n655) );
  NR2D1BWP U908 ( .A1(\enc_logic/checksum[8] ), .A2(\enc_logic/checksum[9] ), 
        .ZN(n833) );
  INVD2BWP U909 ( .I(\dec_logic/checksum/check[16] ), .ZN(n800) );
  INVD6BWP U910 ( .I(\dec_logic/checksum/check[6] ), .ZN(n965) );
  INVD2BWP U911 ( .I(\dec_logic/checksum/check[19] ), .ZN(n963) );
  NR2D1BWP U912 ( .A1(\dec_logic/checksum/check[27] ), .A2(\dec_logic/raw[20] ), .ZN(n568) );
  NR2XD2BWP U913 ( .A1(\dec_logic/checksum/check[6] ), .A2(
        \dec_logic/checksum/check[5] ), .ZN(n651) );
  NR2D1BWP U914 ( .A1(\enc_logic/checksum[14] ), .A2(\enc_logic/checksum[13] ), 
        .ZN(n927) );
  MOAI22D0BWP U915 ( .A1(n1033), .A2(n546), .B1(\dec_logic/raw[19] ), .B2(n640), .ZN(data_to_tx[19]) );
  MOAI22D0BWP U916 ( .A1(n1029), .A2(n546), .B1(\dec_logic/raw[7] ), .B2(n640), 
        .ZN(data_to_tx[7]) );
  NR3D2BWP U917 ( .A1(n818), .A2(n817), .A3(n816), .ZN(n839) );
  OAI211D2BWP U918 ( .A1(n1049), .A2(n617), .B(n910), .C(n922), .ZN(n620) );
  XNR2D1BWP U919 ( .A1(n616), .A2(n895), .ZN(n591) );
  CKND0BWP U920 ( .I(n713), .ZN(n536) );
  CKND2BWP U921 ( .I(n711), .ZN(n713) );
  ND2D4BWP U922 ( .A1(n788), .A2(n787), .ZN(n806) );
  IOA21D2BWP U923 ( .A1(n743), .A2(n744), .B(n741), .ZN(n761) );
  XNR2D2BWP U924 ( .A1(n739), .A2(n563), .ZN(n741) );
  INVD1BWP U925 ( .I(n806), .ZN(n789) );
  IND2D2BWP U926 ( .A1(n589), .B1(n610), .ZN(n590) );
  ND2D2BWP U927 ( .A1(n588), .A2(n609), .ZN(n589) );
  NR2XD3BWP U928 ( .A1(n745), .A2(n956), .ZN(n746) );
  ND2D2BWP U929 ( .A1(n713), .A2(n712), .ZN(n714) );
  XOR3D4BWP U930 ( .A1(n750), .A2(n749), .A3(n748), .Z(n787) );
  CKND2BWP U931 ( .I(n761), .ZN(n740) );
  CKND2BWP U932 ( .I(n737), .ZN(n551) );
  NR2XD3BWP U933 ( .A1(n732), .A2(n728), .ZN(n737) );
  NR2XD1BWP U934 ( .A1(n810), .A2(n647), .ZN(n836) );
  ND3D3BWP U935 ( .A1(n806), .A2(n585), .A3(n584), .ZN(n939) );
  CKND4BWP U936 ( .I(n705), .ZN(n717) );
  CKND2BWP U937 ( .I(n729), .ZN(n730) );
  CKND2BWP U938 ( .I(n706), .ZN(n708) );
  NR2D4BWP U939 ( .A1(n747), .A2(n746), .ZN(n762) );
  AN2D4BWP U940 ( .A1(n787), .A2(n534), .Z(n625) );
  CKND2BWP U941 ( .I(n741), .ZN(n537) );
  AOI21D4BWP U942 ( .A1(n669), .A2(n668), .B(\dec_logic/checksum/check[15] ), 
        .ZN(n693) );
  AOI21D4BWP U943 ( .A1(n844), .A2(n596), .B(\enc_logic/checksum[14] ), .ZN(
        n840) );
  CKND2BWP U944 ( .I(n818), .ZN(n844) );
  CKND2BWP U945 ( .I(n817), .ZN(n596) );
  OAI21D4BWP U946 ( .A1(n553), .A2(n552), .B(n957), .ZN(n554) );
  OAI21D4BWP U947 ( .A1(n666), .A2(n664), .B(n803), .ZN(n669) );
  ND2D2BWP U948 ( .A1(n686), .A2(n665), .ZN(n667) );
  NR3D2BWP U949 ( .A1(n549), .A2(n548), .A3(n958), .ZN(n550) );
  CKND2BWP U950 ( .I(n735), .ZN(n549) );
  INR2XD2BWP U951 ( .A1(\dec_logic/checksum/check[21] ), .B1(n728), .ZN(n720)
         );
  INVD1BWP U952 ( .I(n694), .ZN(n692) );
  XOR3D2BWP U953 ( .A1(n1010), .A2(n542), .A3(n575), .Z(n541) );
  ND2D2BWP U954 ( .A1(n587), .A2(n881), .ZN(n588) );
  CKND2BWP U955 ( .I(n840), .ZN(n597) );
  OAI22D4BWP U956 ( .A1(n649), .A2(\dec_logic/checksum/encoder/N25 ), .B1(n648), .B2(n768), .ZN(n657) );
  AOI21D4BWP U957 ( .A1(n704), .A2(n703), .B(n805), .ZN(n706) );
  OAI22D2BWP U958 ( .A1(n738), .A2(n562), .B1(n959), .B2(n960), .ZN(n563) );
  ND2D2BWP U959 ( .A1(n586), .A2(n872), .ZN(n869) );
  ND3D2BWP U960 ( .A1(n876), .A2(\enc_logic/checksum[23] ), .A3(n875), .ZN(
        n878) );
  CKND2BWP U961 ( .I(n873), .ZN(n876) );
  ND2D2BWP U962 ( .A1(n917), .A2(n940), .ZN(n922) );
  OAI211D4BWP U963 ( .A1(\enc_logic/check/N25 ), .A2(n593), .B(n1034), .C(n594), .ZN(n835) );
  ND2D2BWP U964 ( .A1(n561), .A2(n560), .ZN(n718) );
  ND2D2BWP U965 ( .A1(n717), .A2(n716), .ZN(n561) );
  CKND2BWP U966 ( .I(n670), .ZN(n668) );
  ND2D2BWP U967 ( .A1(n704), .A2(n703), .ZN(n699) );
  INR2XD2BWP U968 ( .A1(\dec_logic/checksum/check[10] ), .B1(n802), .ZN(n678)
         );
  XOR3D4BWP U969 ( .A1(\dec_logic/checksum/check[9] ), .A2(n658), .A3(n657), 
        .Z(n802) );
  ND2D2BWP U970 ( .A1(n868), .A2(\enc_logic/checksum[21] ), .ZN(n872) );
  NR2XD1BWP U971 ( .A1(n718), .A2(n720), .ZN(n723) );
  ND2D2BWP U972 ( .A1(n879), .A2(n878), .ZN(n900) );
  NR2XD1BWP U973 ( .A1(n824), .A2(n823), .ZN(n825) );
  NR2XD1BWP U974 ( .A1(n821), .A2(n973), .ZN(n823) );
  OAI21D2BWP U975 ( .A1(n839), .A2(n840), .B(n819), .ZN(n852) );
  CKND2D0BWP U976 ( .A1(n703), .A2(n692), .ZN(n672) );
  CKND0BWP U977 ( .I(n679), .ZN(n650) );
  MOAI22D0BWP U978 ( .A1(n938), .A2(n1050), .B1(n634), .B2(buf_to_mux[1]), 
        .ZN(n479) );
  MOAI22D0BWP U979 ( .A1(n929), .A2(n928), .B1(n634), .B2(buf_to_mux[18]), 
        .ZN(n462) );
  MOAI22D0BWP U980 ( .A1(n975), .A2(n1050), .B1(n634), .B2(buf_to_mux[9]), 
        .ZN(n471) );
  INVD1BWP U981 ( .I(n105), .ZN(n942) );
  ND2D2BWP U982 ( .A1(n709), .A2(n963), .ZN(n712) );
  XOR3D2BWP U983 ( .A1(n692), .A2(n691), .A3(n690), .Z(n700) );
  CKBD4BWP U984 ( .I(n788), .Z(n637) );
  CKBD4BWP U985 ( .I(n788), .Z(n636) );
  CKND2BWP U986 ( .I(n764), .ZN(n766) );
  IND2D2BWP U987 ( .A1(n723), .B1(n719), .ZN(n739) );
  IND3D2BWP U988 ( .A1(n702), .B1(n703), .B2(n704), .ZN(n707) );
  NR3D2BWP U989 ( .A1(n693), .A2(n694), .A3(n800), .ZN(n690) );
  MOAI22D0BWP U990 ( .A1(n800), .A2(n639), .B1(n533), .B2(buf_to_mux[36]), 
        .ZN(data_to_tx[36]) );
  AOI22D2BWP U991 ( .A1(n727), .A2(n726), .B1(n725), .B2(n724), .ZN(n760) );
  ND2D2BWP U992 ( .A1(n708), .A2(n707), .ZN(n709) );
  NR2XD3BWP U993 ( .A1(n966), .A2(n965), .ZN(n679) );
  INR2D2BWP U994 ( .A1(\enc_logic/checksum[13] ), .B1(n815), .ZN(n818) );
  OAI21D2BWP U995 ( .A1(n737), .A2(n736), .B(n958), .ZN(n742) );
  CKND0BWP U996 ( .I(n657), .ZN(n654) );
  NR2XD1BWP U997 ( .A1(n651), .A2(n679), .ZN(n648) );
  XOR3D2BWP U998 ( .A1(n595), .A2(n835), .A3(n828), .Z(n815) );
  XOR3D2BWP U999 ( .A1(\dec_logic/three_six_load[10] ), .A2(n760), .A3(n740), 
        .Z(n749) );
  IND2D2BWP U1000 ( .A1(n731), .B1(n730), .ZN(n735) );
  NR2XD1BWP U1001 ( .A1(n710), .A2(n711), .ZN(n733) );
  NR2XD1BWP U1002 ( .A1(n709), .A2(n963), .ZN(n711) );
  XOR3D2BWP U1003 ( .A1(n701), .A2(n556), .A3(n700), .Z(n705) );
  XNR2D2BWP U1004 ( .A1(\dec_logic/checksum/check[11] ), .A2(
        \dec_logic/checksum/check[12] ), .ZN(n662) );
  ND2D1BWP U1005 ( .A1(n1053), .A2(n1052), .ZN(\rHandshake/next_state[1] ) );
  ND2D1BWP U1006 ( .A1(TX_Data_Ready), .A2(n1058), .ZN(n1059) );
  ND2D1BWP U1007 ( .A1(n980), .A2(n979), .ZN(data_to_tx[53]) );
  ND2D1BWP U1008 ( .A1(n978), .A2(n979), .ZN(data_to_tx[52]) );
  INVD1BWP U1009 ( .I(\dec_logic/checksum/check[14] ), .ZN(n798) );
  INVD1BWP U1010 ( .I(\dec_logic/checksum/check[12] ), .ZN(n796) );
  INVD1BWP U1011 ( .I(buf_to_mux[13]), .ZN(n1031) );
  ND2D1BWP U1012 ( .A1(\enc_logic/checksum[10] ), .A2(\enc_logic/checksum[11] ), .ZN(n930) );
  INVD1BWP U1013 ( .I(buf_to_mux[19]), .ZN(n1033) );
  INVD1BWP U1014 ( .I(buf_to_mux[7]), .ZN(n1029) );
  INVD1BWP U1015 ( .I(\enc_logic/checksum[12] ), .ZN(n933) );
  INVD1BWP U1016 ( .I(\enc_logic/checksum[10] ), .ZN(n934) );
  ND2D1BWP U1017 ( .A1(\enc_logic/checksum[13] ), .A2(\enc_logic/checksum[14] ), .ZN(n924) );
  ND2D1BWP U1018 ( .A1(n637), .A2(\dec_logic/checksum/check[13] ), .ZN(n774)
         );
  ND2D1BWP U1019 ( .A1(n637), .A2(\dec_logic/checksum/check[15] ), .ZN(n776)
         );
  ND2D1BWP U1020 ( .A1(n637), .A2(\dec_logic/checksum/check[11] ), .ZN(n771)
         );
  ND2D1BWP U1021 ( .A1(n636), .A2(\dec_logic/checksum/check[8] ), .ZN(n770) );
  ND2D1BWP U1022 ( .A1(n636), .A2(\dec_logic/checksum/check[14] ), .ZN(n775)
         );
  INVD1BWP U1023 ( .I(\dec_logic/three_six_load[8] ), .ZN(n772) );
  ND2D1BWP U1024 ( .A1(n636), .A2(\dec_logic/checksum/check[12] ), .ZN(n773)
         );
  ND2D1BWP U1025 ( .A1(n916), .A2(n915), .ZN(n458) );
  ND2D1BWP U1026 ( .A1(n911), .A2(n914), .ZN(n912) );
  ND2D1BWP U1027 ( .A1(n637), .A2(\dec_logic/checksum/check[5] ), .ZN(n769) );
  ND2D1BWP U1028 ( .A1(n637), .A2(\dec_logic/checksum/check[17] ), .ZN(n778)
         );
  ND2D1BWP U1029 ( .A1(n637), .A2(\dec_logic/checksum/check[24] ), .ZN(n786)
         );
  ND2D1BWP U1030 ( .A1(n637), .A2(\dec_logic/checksum/check[21] ), .ZN(n782)
         );
  ND2D1BWP U1031 ( .A1(n637), .A2(\dec_logic/checksum/check[22] ), .ZN(n783)
         );
  ND2D1BWP U1032 ( .A1(n637), .A2(\dec_logic/checksum/check[23] ), .ZN(n784)
         );
  ND2D1BWP U1033 ( .A1(n636), .A2(\dec_logic/checksum/check[18] ), .ZN(n779)
         );
  ND2D1BWP U1034 ( .A1(n636), .A2(\dec_logic/checksum/check[19] ), .ZN(n780)
         );
  ND2D1BWP U1035 ( .A1(n636), .A2(\dec_logic/checksum/check[16] ), .ZN(n777)
         );
  ND2D1BWP U1036 ( .A1(n939), .A2(n808), .ZN(n483) );
  ND2D1BWP U1037 ( .A1(n884), .A2(n883), .ZN(n894) );
  INVD1BWP U1038 ( .I(n940), .ZN(n1049) );
  ND2D1BWP U1039 ( .A1(n907), .A2(n611), .ZN(n610) );
  ND2D1BWP U1040 ( .A1(n612), .A2(\enc_logic/checksum[26] ), .ZN(n611) );
  INVD1BWP U1041 ( .I(n588), .ZN(n880) );
  ND2D1BWP U1042 ( .A1(n867), .A2(n866), .ZN(n892) );
  INVD1BWP U1043 ( .I(\enc_logic/checksum[7] ), .ZN(n975) );
  INVD1BWP U1044 ( .I(\dec_logic/checksum/check[10] ), .ZN(n794) );
  AN2XD1BWP U1045 ( .A1(n909), .A2(n908), .Z(n547) );
  ND2D1BWP U1046 ( .A1(n905), .A2(n968), .ZN(n909) );
  ND2D1BWP U1047 ( .A1(n907), .A2(n906), .ZN(n905) );
  ND2D1BWP U1048 ( .A1(n904), .A2(n969), .ZN(n906) );
  ND2D1BWP U1049 ( .A1(n903), .A2(\enc_logic/checksum[25] ), .ZN(n907) );
  INVD1BWP U1050 ( .I(\enc_logic/checksum[25] ), .ZN(n969) );
  INVD1BWP U1051 ( .I(\enc_logic/checksum[26] ), .ZN(n968) );
  ND2D1BWP U1052 ( .A1(n608), .A2(n607), .ZN(n609) );
  ND2D1BWP U1053 ( .A1(n877), .A2(n970), .ZN(n879) );
  ND2D1BWP U1054 ( .A1(n876), .A2(n875), .ZN(n877) );
  ND2D1BWP U1055 ( .A1(n869), .A2(n971), .ZN(n875) );
  INVD1BWP U1056 ( .I(\enc_logic/checksum[24] ), .ZN(n1043) );
  INVD1BWP U1057 ( .I(\enc_logic/checksum[21] ), .ZN(n972) );
  INVD1BWP U1058 ( .I(\enc_logic/checksum[17] ), .ZN(n974) );
  ND2D1BWP U1059 ( .A1(n852), .A2(n851), .ZN(n853) );
  ND2D1BWP U1060 ( .A1(n845), .A2(n844), .ZN(n866) );
  ND2D1BWP U1061 ( .A1(n843), .A2(\enc_logic/checksum[15] ), .ZN(n857) );
  INVD1BWP U1062 ( .I(\enc_logic/checksum[16] ), .ZN(n841) );
  INVD1BWP U1063 ( .I(\enc_logic/checksum[15] ), .ZN(n920) );
  ND2D1BWP U1064 ( .A1(n835), .A2(\enc_logic/checksum[7] ), .ZN(n838) );
  ND2D1BWP U1065 ( .A1(\enc_logic/checksum[8] ), .A2(\enc_logic/checksum[9] ), 
        .ZN(n861) );
  ND2D1BWP U1066 ( .A1(n832), .A2(\enc_logic/checksum[10] ), .ZN(n863) );
  ND2D1BWP U1067 ( .A1(n827), .A2(n826), .ZN(n870) );
  ND2D1BWP U1068 ( .A1(n822), .A2(\enc_logic/checksum[20] ), .ZN(n824) );
  ND2D1BWP U1069 ( .A1(n821), .A2(n973), .ZN(n822) );
  INVD1BWP U1070 ( .I(\enc_logic/checksum[19] ), .ZN(n973) );
  ND2D1BWP U1071 ( .A1(n601), .A2(n600), .ZN(n821) );
  INVD1BWP U1072 ( .I(n839), .ZN(n845) );
  INVD1BWP U1073 ( .I(\enc_logic/checksum[14] ), .ZN(n816) );
  INVD1BWP U1074 ( .I(\enc_logic/checksum[6] ), .ZN(n647) );
  INVD1BWP U1075 ( .I(\dec_logic/three_six_load[7] ), .ZN(n1015) );
  INVD1BWP U1076 ( .I(\dec_logic/three_six_load[4] ), .ZN(n1013) );
  INVD1BWP U1077 ( .I(\dec_logic/three_six_load[11] ), .ZN(n1010) );
  INVD1BWP U1078 ( .I(\dec_logic/raw[20] ), .ZN(n1011) );
  INVD1BWP U1079 ( .I(\dec_logic/three_six_load[10] ), .ZN(n1012) );
  INVD1BWP U1080 ( .I(\dec_logic/three_six_load[9] ), .ZN(n1009) );
  INVD1BWP U1081 ( .I(\dec_logic/checksum/check[27] ), .ZN(n955) );
  INVD1BWP U1082 ( .I(\dec_logic/three_six_load[1] ), .ZN(n1008) );
  INVD1BWP U1083 ( .I(r_addr[0]), .ZN(n990) );
  INVD1BWP U1084 ( .I(r_addr[2]), .ZN(n991) );
  INVD1BWP U1085 ( .I(r_addr[3]), .ZN(n987) );
  INVD1BWP U1086 ( .I(r_addr[1]), .ZN(n988) );
  INVD1BWP U1087 ( .I(n723), .ZN(n725) );
  INVD1BWP U1088 ( .I(n739), .ZN(n727) );
  ND2D1BWP U1089 ( .A1(n745), .A2(n956), .ZN(n555) );
  INVD1BWP U1090 ( .I(n742), .ZN(n553) );
  ND2D1BWP U1091 ( .A1(n735), .A2(n734), .ZN(n736) );
  ND2D1BWP U1092 ( .A1(n733), .A2(n732), .ZN(n734) );
  ND2D1BWP U1093 ( .A1(n728), .A2(n961), .ZN(n721) );
  INVD1BWP U1094 ( .I(n720), .ZN(n722) );
  ND2D1BWP U1095 ( .A1(n718), .A2(n720), .ZN(n719) );
  ND2D1BWP U1096 ( .A1(n705), .A2(n559), .ZN(n560) );
  ND2D1BWP U1097 ( .A1(n712), .A2(\dec_logic/checksum/check[20] ), .ZN(n710)
         );
  INVD1BWP U1098 ( .I(n699), .ZN(n695) );
  ND2D1BWP U1099 ( .A1(n689), .A2(n688), .ZN(n691) );
  ND2D1BWP U1100 ( .A1(n687), .A2(n686), .ZN(n663) );
  ND2D1BWP U1101 ( .A1(n662), .A2(\dec_logic/checksum/check[10] ), .ZN(n660)
         );
  INVD1BWP U1102 ( .I(n662), .ZN(n804) );
  INVD1BWP U1103 ( .I(\dec_logic/checksum/check[11] ), .ZN(n795) );
  INVD1BWP U1104 ( .I(n678), .ZN(n682) );
  ND2D1BWP U1105 ( .A1(\dec_logic/checksum/check[7] ), .A2(
        \dec_logic/checksum/check[8] ), .ZN(n633) );
  OAI211D1BWP U1106 ( .A1(n1054), .A2(n951), .B(RX_Data_Valid), .C(n1051), 
        .ZN(\rHandshake/next_state[0] ) );
  AOI32D1BWP U1107 ( .A1(\rHandshake/state[0] ), .A2(RX_Data_Valid), .A3(n1054), .B1(\rHandshake/state[1] ), .B2(RX_Data_Valid), .ZN(n1052) );
  OAI21D1BWP U1108 ( .A1(n1006), .A2(n1053), .B(n1022), .ZN(
        \main_control/next_state[3] ) );
  AO22D1BWP U1109 ( .A1(\dec_logic/raw[6] ), .A2(n640), .B1(buf_to_mux[6]), 
        .B2(n533), .Z(data_to_tx[6]) );
  AO22D1BWP U1110 ( .A1(\dec_logic/raw[0] ), .A2(n640), .B1(buf_to_mux[0]), 
        .B2(n533), .Z(data_to_tx[0]) );
  AO22D1BWP U1111 ( .A1(\dec_logic/raw[1] ), .A2(n640), .B1(buf_to_mux[1]), 
        .B2(n533), .Z(data_to_tx[1]) );
  AO22D1BWP U1112 ( .A1(\dec_logic/three_six_load[0] ), .A2(n640), .B1(
        buf_to_mux[3]), .B2(n533), .Z(data_to_tx[3]) );
  AO22D1BWP U1113 ( .A1(\dec_logic/raw[2] ), .A2(n640), .B1(buf_to_mux[2]), 
        .B2(n533), .Z(data_to_tx[2]) );
  AO22D1BWP U1114 ( .A1(\dec_logic/three_six_load[3] ), .A2(n640), .B1(
        buf_to_mux[9]), .B2(n533), .Z(data_to_tx[9]) );
  AO22D1BWP U1115 ( .A1(\dec_logic/checksum/encoder/N25 ), .A2(n640), .B1(
        buf_to_mux[24]), .B2(n533), .Z(data_to_tx[24]) );
  AO22D1BWP U1116 ( .A1(\dec_logic/raw[8] ), .A2(n640), .B1(buf_to_mux[8]), 
        .B2(n533), .Z(data_to_tx[8]) );
  AO22D1BWP U1117 ( .A1(\dec_logic/raw[18] ), .A2(n640), .B1(buf_to_mux[18]), 
        .B2(n533), .Z(data_to_tx[18]) );
  AO22D1BWP U1118 ( .A1(\dec_logic/three_six_load[2] ), .A2(n640), .B1(
        buf_to_mux[5]), .B2(n533), .Z(data_to_tx[5]) );
  AO22D1BWP U1119 ( .A1(address[0]), .A2(n640), .B1(n533), .B2(buf_to_mux[48]), 
        .Z(data_to_tx[48]) );
  AO22D1BWP U1120 ( .A1(address[1]), .A2(n640), .B1(n638), .B2(buf_to_mux[49]), 
        .Z(data_to_tx[49]) );
  AO22D1BWP U1121 ( .A1(address[3]), .A2(n640), .B1(n533), .B2(buf_to_mux[51]), 
        .Z(data_to_tx[51]) );
  AO22D1BWP U1122 ( .A1(address[2]), .A2(n640), .B1(n638), .B2(buf_to_mux[50]), 
        .Z(data_to_tx[50]) );
  AO22D1BWP U1123 ( .A1(n941), .A2(\enc_logic/checksum[9] ), .B1(n634), .B2(
        buf_to_mux[11]), .Z(n469) );
  AOI22D1BWP U1124 ( .A1(data_type[1]), .A2(n640), .B1(n533), .B2(
        buf_to_mux[53]), .ZN(n980) );
  AOI22D1BWP U1125 ( .A1(data_type[0]), .A2(n640), .B1(n533), .B2(
        buf_to_mux[52]), .ZN(n978) );
  MOAI22D0BWP U1126 ( .A1(n799), .A2(n639), .B1(n638), .B2(buf_to_mux[35]), 
        .ZN(data_to_tx[35]) );
  AOI22D1BWP U1127 ( .A1(n933), .A2(n930), .B1(n934), .B2(n932), .ZN(n931) );
  AO22D1BWP U1128 ( .A1(n634), .A2(buf_to_mux[2]), .B1(n941), .B2(n1034), .Z(
        n478) );
  OAI21D1BWP U1129 ( .A1(n926), .A2(n928), .B(n925), .ZN(n461) );
  AO21D1BWP U1130 ( .A1(n634), .A2(buf_to_mux[0]), .B(n1028), .Z(n480) );
  ND4D1BWP U1131 ( .A1(n996), .A2(n1019), .A3(n1020), .A4(n1004), .ZN(
        \main_control/next_state[1] ) );
  AOI31D1BWP U1132 ( .A1(\enc_logic/checksum[9] ), .A2(\enc_logic/checksum[8] ), .A3(\enc_logic/checksum[7] ), .B(n1050), .ZN(n1030) );
  AOI31D1BWP U1133 ( .A1(\enc_logic/checksum[12] ), .A2(
        \enc_logic/checksum[11] ), .A3(\enc_logic/checksum[10] ), .B(n1050), 
        .ZN(n1032) );
  AO22D1BWP U1134 ( .A1(n941), .A2(\enc_logic/checksum[8] ), .B1(n634), .B2(
        buf_to_mux[10]), .Z(n470) );
  AO22D1BWP U1135 ( .A1(n941), .A2(\enc_logic/checksum[12] ), .B1(n634), .B2(
        buf_to_mux[17]), .Z(n463) );
  OAI211D1BWP U1136 ( .A1(n1002), .A2(n1005), .B(n1001), .C(n1000), .ZN(
        \main_control/next_state[2] ) );
  AOI21D1BWP U1137 ( .A1(n984), .A2(n1053), .B(n1063), .ZN(n1000) );
  AO22D1BWP U1138 ( .A1(n941), .A2(\enc_logic/checksum[6] ), .B1(n634), .B2(
        buf_to_mux[5]), .Z(n475) );
  AO22D1BWP U1139 ( .A1(n941), .A2(\enc_logic/check/N25 ), .B1(n634), .B2(
        buf_to_mux[3]), .Z(n477) );
  AO22D1BWP U1140 ( .A1(n635), .A2(\enc_logic/checksum[10] ), .B1(n634), .B2(
        buf_to_mux[15]), .Z(n465) );
  AO211D1BWP U1141 ( .A1(\enc_logic/checksum[7] ), .A2(\enc_logic/checksum[8] ), .B(n1050), .C(\enc_logic/checksum[9] ), .Z(n936) );
  OAI21D1BWP U1142 ( .A1(n1049), .A2(n974), .B(n1042), .ZN(n443) );
  AOI211XD0BWP U1143 ( .A1(n634), .A2(buf_to_mux[37]), .B(n1041), .C(n1040), 
        .ZN(n1042) );
  AOI211XD0BWP U1144 ( .A1(\enc_logic/checksum[23] ), .A2(
        \enc_logic/checksum[24] ), .B(\enc_logic/checksum[22] ), .C(n1050), 
        .ZN(n1040) );
  OAI21D1BWP U1145 ( .A1(n1049), .A2(n970), .B(n1048), .ZN(n437) );
  AOI211XD0BWP U1146 ( .A1(n634), .A2(buf_to_mux[43]), .B(n1047), .C(n1046), 
        .ZN(n1048) );
  AOI211XD0BWP U1147 ( .A1(\enc_logic/checksum[26] ), .A2(
        \enc_logic/checksum[27] ), .B(\enc_logic/checksum[25] ), .C(n1050), 
        .ZN(n1046) );
  AO22D1BWP U1148 ( .A1(n635), .A2(\enc_logic/checksum[5] ), .B1(n634), .B2(
        buf_to_mux[4]), .Z(n476) );
  ND3D1BWP U1149 ( .A1(n999), .A2(n998), .A3(n1061), .ZN(n1026) );
  AOI22D1BWP U1150 ( .A1(n948), .A2(n1053), .B1(Core_Load_Ack), .B2(n949), 
        .ZN(n999) );
  IOA21D1BWP U1151 ( .A1(buf_to_mux[12]), .A2(n634), .B(n935), .ZN(n468) );
  ND4D1BWP U1152 ( .A1(n635), .A2(n934), .A3(n933), .A4(n932), .ZN(n935) );
  AO211D1BWP U1153 ( .A1(tx_data_select[1]), .A2(n1062), .B(n1024), .C(n1023), 
        .Z(n482) );
  OAI22D1BWP U1154 ( .A1(n945), .A2(n1022), .B1(n1021), .B2(n1057), .ZN(n1023)
         );
  ND3D1BWP U1155 ( .A1(data_type[1]), .A2(data_type[0]), .A3(\dec_logic/token ), .ZN(n1003) );
  AO222D1BWP U1156 ( .A1(n969), .A2(n1047), .B1(n532), .B2(
        \enc_logic/checksum[22] ), .C1(n634), .C2(buf_to_mux[42]), .Z(n438) );
  OAI222D1BWP U1157 ( .A1(n812), .A2(n105), .B1(n1050), .B2(n811), .C1(n810), 
        .C2(n1049), .ZN(n455) );
  AOI21D1BWP U1158 ( .A1(n1035), .A2(n841), .B(n813), .ZN(n811) );
  AO222D1BWP U1159 ( .A1(n634), .A2(buf_to_mux[33]), .B1(
        \enc_logic/checksum[19] ), .B2(n941), .C1(\enc_logic/checksum[13] ), 
        .C2(n532), .Z(n447) );
  AO222D1BWP U1160 ( .A1(n634), .A2(buf_to_mux[27]), .B1(
        \enc_logic/checksum[16] ), .B2(n941), .C1(\enc_logic/checksum[7] ), 
        .C2(n532), .Z(n453) );
  AO222D1BWP U1161 ( .A1(n634), .A2(buf_to_mux[35]), .B1(
        \enc_logic/checksum[21] ), .B2(n941), .C1(\enc_logic/checksum[15] ), 
        .C2(n940), .Z(n445) );
  AO222D1BWP U1162 ( .A1(n634), .A2(buf_to_mux[39]), .B1(
        \enc_logic/checksum[22] ), .B2(n635), .C1(\enc_logic/checksum[19] ), 
        .C2(n532), .Z(n441) );
  AOI32D1BWP U1163 ( .A1(\enc_logic/checksum[16] ), .A2(n1037), .A3(n1036), 
        .B1(n1050), .B2(n1037), .ZN(n454) );
  AOI22D1BWP U1164 ( .A1(n634), .A2(buf_to_mux[26]), .B1(n940), .B2(
        \enc_logic/checksum[6] ), .ZN(n1037) );
  AO222D1BWP U1165 ( .A1(n971), .A2(n1041), .B1(n532), .B2(
        \enc_logic/checksum[16] ), .C1(n634), .C2(buf_to_mux[36]), .Z(n444) );
  AO222D1BWP U1166 ( .A1(n973), .A2(n1039), .B1(n532), .B2(
        \enc_logic/checksum[10] ), .C1(n634), .C2(buf_to_mux[30]), .Z(n450) );
  AO222D1BWP U1167 ( .A1(n634), .A2(buf_to_mux[41]), .B1(
        \enc_logic/checksum[24] ), .B2(n941), .C1(\enc_logic/checksum[21] ), 
        .C2(n940), .Z(n439) );
  AO222D1BWP U1168 ( .A1(n634), .A2(buf_to_mux[29]), .B1(
        \enc_logic/checksum[18] ), .B2(n941), .C1(\enc_logic/checksum[9] ), 
        .C2(n940), .Z(n451) );
  AO222D1BWP U1169 ( .A1(n634), .A2(buf_to_mux[34]), .B1(
        \enc_logic/checksum[20] ), .B2(n635), .C1(\enc_logic/checksum[14] ), 
        .C2(n532), .Z(n446) );
  AO222D1BWP U1170 ( .A1(n634), .A2(buf_to_mux[40]), .B1(
        \enc_logic/checksum[23] ), .B2(n635), .C1(\enc_logic/checksum[20] ), 
        .C2(n532), .Z(n440) );
  AO222D1BWP U1171 ( .A1(n634), .A2(buf_to_mux[28]), .B1(
        \enc_logic/checksum[17] ), .B2(n635), .C1(\enc_logic/checksum[8] ), 
        .C2(n532), .Z(n452) );
  OAI21D1BWP U1172 ( .A1(n1049), .A2(n932), .B(n809), .ZN(n449) );
  AOI211XD0BWP U1173 ( .A1(n634), .A2(buf_to_mux[31]), .B(n1039), .C(n1038), 
        .ZN(n809) );
  AOI211XD0BWP U1174 ( .A1(\enc_logic/checksum[20] ), .A2(
        \enc_logic/checksum[21] ), .B(\enc_logic/checksum[19] ), .C(n1050), 
        .ZN(n1038) );
  AOI32D1BWP U1175 ( .A1(\enc_logic/checksum[22] ), .A2(n1045), .A3(n1044), 
        .B1(n1050), .B2(n1045), .ZN(n442) );
  AOI22D1BWP U1176 ( .A1(n634), .A2(buf_to_mux[38]), .B1(n940), .B2(
        \enc_logic/checksum[18] ), .ZN(n1045) );
  OAI211D1BWP U1177 ( .A1(n923), .A2(n922), .B(n921), .C(n928), .ZN(n460) );
  OAI22D1BWP U1178 ( .A1(n774), .A2(n785), .B1(n534), .B2(n1009), .ZN(
        Packet_To_Node[9]) );
  OAI22D1BWP U1179 ( .A1(n776), .A2(n785), .B1(n534), .B2(n1010), .ZN(
        Packet_To_Node[11]) );
  OAI22D1BWP U1180 ( .A1(n771), .A2(n785), .B1(n534), .B2(n1015), .ZN(
        Packet_To_Node[7]) );
  OAI22D1BWP U1181 ( .A1(n770), .A2(n785), .B1(n534), .B2(n1013), .ZN(
        Packet_To_Node[4]) );
  OAI22D1BWP U1182 ( .A1(n775), .A2(n785), .B1(n534), .B2(n1012), .ZN(
        Packet_To_Node[10]) );
  OAI22D1BWP U1183 ( .A1(n773), .A2(n785), .B1(n534), .B2(n772), .ZN(
        Packet_To_Node[8]) );
  OAI211D1BWP U1184 ( .A1(n914), .A2(n913), .B(n532), .C(n912), .ZN(n916) );
  OAI22D1BWP U1185 ( .A1(n769), .A2(n785), .B1(n534), .B2(n1008), .ZN(
        Packet_To_Node[1]) );
  OAI22D1BWP U1186 ( .A1(n778), .A2(n785), .B1(n534), .B2(n792), .ZN(
        Packet_To_Node[13]) );
  OAI22D1BWP U1187 ( .A1(n786), .A2(n785), .B1(n534), .B2(n961), .ZN(
        Packet_To_Node[20]) );
  OAI22D1BWP U1188 ( .A1(n782), .A2(n785), .B1(n534), .B2(n799), .ZN(
        Packet_To_Node[17]) );
  OAI22D1BWP U1189 ( .A1(n783), .A2(n785), .B1(n534), .B2(n963), .ZN(
        Packet_To_Node[18]) );
  OAI22D1BWP U1190 ( .A1(n784), .A2(n785), .B1(n534), .B2(n962), .ZN(
        Packet_To_Node[19]) );
  OAI22D1BWP U1191 ( .A1(n779), .A2(n785), .B1(n534), .B2(n793), .ZN(
        Packet_To_Node[14]) );
  OAI22D1BWP U1192 ( .A1(n780), .A2(n785), .B1(n534), .B2(n797), .ZN(
        Packet_To_Node[15]) );
  OAI22D1BWP U1193 ( .A1(n777), .A2(n785), .B1(n534), .B2(n976), .ZN(
        Packet_To_Node[12]) );
  INR2D1BWP U1194 ( .A1(\dec_logic/checksum/check[27] ), .B1(n791), .ZN(
        Packet_To_Node[23]) );
  INR2D1BWP U1195 ( .A1(\dec_logic/checksum/check[25] ), .B1(n791), .ZN(
        Packet_To_Node[21]) );
  AOI211XD0BWP U1196 ( .A1(n1062), .A2(tx_data_select[0]), .B(n1024), .C(n807), 
        .ZN(n808) );
  AOI22D1BWP U1197 ( .A1(n621), .A2(n913), .B1(n620), .B2(n619), .ZN(n622) );
  AOI22D1BWP U1198 ( .A1(n941), .A2(\enc_logic/checksum[15] ), .B1(n634), .B2(
        buf_to_mux[23]), .ZN(n910) );
  NR4D0BWP U1199 ( .A1(n618), .A2(n918), .A3(n917), .A4(n1049), .ZN(n621) );
  XOR2D1BWP U1200 ( .A1(n895), .A2(n894), .Z(n618) );
  AOI21D1BWP U1201 ( .A1(n885), .A2(n615), .B(n614), .ZN(n616) );
  XNR2D1BWP U1202 ( .A1(n900), .A2(n613), .ZN(n612) );
  XOR2D1BWP U1203 ( .A1(\enc_logic/checksum[24] ), .A2(
        \enc_logic/checksum[25] ), .Z(n613) );
  XOR2D1BWP U1204 ( .A1(n885), .A2(n880), .Z(n911) );
  XNR2D1BWP U1205 ( .A1(n883), .A2(n882), .ZN(n885) );
  XOR3D1BWP U1206 ( .A1(n888), .A2(n887), .A3(n886), .Z(n889) );
  XOR3D1BWP U1207 ( .A1(n893), .A2(n891), .A3(n892), .Z(n886) );
  NR2XD0BWP U1208 ( .A1(n859), .A2(n858), .ZN(n887) );
  AO222D1BWP U1209 ( .A1(n919), .A2(n532), .B1(n634), .B2(buf_to_mux[21]), 
        .C1(\enc_logic/checksum[13] ), .C2(n635), .Z(n459) );
  ND3D1BWP U1210 ( .A1(n907), .A2(n906), .A3(\enc_logic/checksum[26] ), .ZN(
        n908) );
  AOI21D1BWP U1211 ( .A1(n901), .A2(n900), .B(n899), .ZN(n902) );
  OAI22D1BWP U1212 ( .A1(n900), .A2(n898), .B1(n968), .B2(n969), .ZN(n899) );
  NR2XD0BWP U1213 ( .A1(n1043), .A2(n896), .ZN(n901) );
  ND3D1BWP U1214 ( .A1(n586), .A2(n872), .A3(\enc_logic/checksum[22] ), .ZN(
        n604) );
  AOI22D1BWP U1215 ( .A1(n855), .A2(\enc_logic/checksum[18] ), .B1(n854), .B2(
        \enc_logic/checksum[17] ), .ZN(n858) );
  OAI211D1BWP U1216 ( .A1(n856), .A2(n849), .B(n848), .C(n847), .ZN(n850) );
  AOI21D1BWP U1217 ( .A1(n842), .A2(n920), .B(n841), .ZN(n856) );
  NR2XD0BWP U1218 ( .A1(n840), .A2(n839), .ZN(n843) );
  XOR3D1BWP U1219 ( .A1(n865), .A2(n863), .A3(n864), .Z(n867) );
  XOR2D1BWP U1220 ( .A1(n862), .A2(n860), .Z(n864) );
  XNR2D1BWP U1221 ( .A1(n838), .A2(n938), .ZN(n860) );
  OAI21D1BWP U1222 ( .A1(n834), .A2(n833), .B(n861), .ZN(n862) );
  XNR3D1BWP U1223 ( .A1(\enc_logic/checksum[8] ), .A2(\enc_logic/checksum[9] ), 
        .A3(n834), .ZN(n832) );
  AOI22D1BWP U1224 ( .A1(n831), .A2(\enc_logic/checksum[12] ), .B1(
        \enc_logic/checksum[11] ), .B2(n830), .ZN(n865) );
  XOR2D1BWP U1225 ( .A1(n872), .A2(n870), .Z(n874) );
  IND3D1BWP U1226 ( .A1(n820), .B1(n852), .B2(n851), .ZN(n600) );
  XNR2D1BWP U1227 ( .A1(\enc_logic/checksum[17] ), .A2(
        \enc_logic/checksum[18] ), .ZN(n820) );
  XNR3D1BWP U1228 ( .A1(\enc_logic/checksum[8] ), .A2(\enc_logic/checksum[7] ), 
        .A3(n814), .ZN(n828) );
  XNR2D1BWP U1229 ( .A1(\enc_logic/checksum[10] ), .A2(\enc_logic/checksum[9] ), .ZN(n814) );
  NR2XD0BWP U1230 ( .A1(\enc_logic/checksum[6] ), .A2(\enc_logic/checksum[5] ), 
        .ZN(n837) );
  XNR2D1BWP U1231 ( .A1(\enc_logic/checksum[12] ), .A2(
        \enc_logic/checksum[11] ), .ZN(n595) );
  XNR2D1BWP U1232 ( .A1(\enc_logic/checksum[15] ), .A2(
        \enc_logic/checksum[16] ), .ZN(n819) );
  NR2XD0BWP U1233 ( .A1(n956), .A2(n791), .ZN(Packet_To_Node[22]) );
  IAO21D1BWP U1234 ( .A1(n1061), .A2(n954), .B(n1063), .ZN(n624) );
  OAI21D1BWP U1235 ( .A1(n1007), .A2(n1053), .B(n641), .ZN(n1062) );
  ND4D1BWP U1236 ( .A1(data_type[1]), .A2(data_type[0]), .A3(\dec_logic/token ), .A4(n946), .ZN(n1004) );
  NR2XD0BWP U1237 ( .A1(\main_control/state[3] ), .A2(\main_control/state[1] ), 
        .ZN(n947) );
  ND4D1BWP U1238 ( .A1(n583), .A2(n582), .A3(n581), .A4(n580), .ZN(n584) );
  AOI221D1BWP U1239 ( .A1(\dec_logic/three_six_load[5] ), .A2(n1018), .B1(
        \dec_logic/three_six_load[8] ), .B2(n1017), .C(n579), .ZN(n582) );
  OAI22D1BWP U1240 ( .A1(\dec_logic/three_six_load[5] ), .A2(n1018), .B1(n1017), .B2(\dec_logic/three_six_load[8] ), .ZN(n579) );
  INR3D0BWP U1241 ( .A1(n985), .B1(n994), .B2(n993), .ZN(n945) );
  OAI31D1BWP U1242 ( .A1(data_type[1]), .A2(data_type[0]), .A3(
        \dec_logic/token ), .B(n992), .ZN(n993) );
  AOI221D1BWP U1243 ( .A1(n991), .A2(address[2]), .B1(address[0]), .B2(n990), 
        .C(n989), .ZN(n992) );
  OAI22D1BWP U1244 ( .A1(n991), .A2(address[2]), .B1(n990), .B2(address[0]), 
        .ZN(n989) );
  OAI221D1BWP U1245 ( .A1(n988), .A2(address[1]), .B1(n987), .B2(address[3]), 
        .C(n986), .ZN(n994) );
  AOI22D1BWP U1246 ( .A1(address[1]), .A2(n988), .B1(address[3]), .B2(n987), 
        .ZN(n986) );
  IND3D1BWP U1247 ( .A1(\dec_logic/token ), .B1(data_type[0]), .B2(
        data_type[1]), .ZN(n985) );
  NR3D0BWP U1248 ( .A1(n983), .A2(\main_control/state[2] ), .A3(n949), .ZN(
        n946) );
  MUX2ND0BWP U1249 ( .I0(n568), .I1(n567), .S(n566), .ZN(n572) );
  XOR2D1BWP U1250 ( .A1(\dec_logic/checksum/check[27] ), .A2(
        \dec_logic/raw[20] ), .Z(n567) );
  XNR2D1BWP U1251 ( .A1(n574), .A2(n573), .ZN(n577) );
  XOR2D1BWP U1252 ( .A1(n766), .A2(\dec_logic/three_six_load[9] ), .Z(n573) );
  AOI21D1BWP U1253 ( .A1(n571), .A2(n570), .B(n569), .ZN(n575) );
  NR2XD0BWP U1254 ( .A1(n738), .A2(n960), .ZN(n724) );
  AOI21D1BWP U1255 ( .A1(n738), .A2(n960), .B(n959), .ZN(n726) );
  OAI21D1BWP U1256 ( .A1(n762), .A2(n764), .B(n763), .ZN(n571) );
  NR2XD0BWP U1257 ( .A1(n536), .A2(n733), .ZN(n716) );
  XNR2D1BWP U1258 ( .A1(\dec_logic/checksum/check[17] ), .A2(
        \dec_logic/checksum/check[18] ), .ZN(n702) );
  XNR2D1BWP U1259 ( .A1(n700), .A2(n701), .ZN(n698) );
  ND3D1BWP U1260 ( .A1(n687), .A2(n686), .A3(\dec_logic/checksum/check[13] ), 
        .ZN(n688) );
  XNR3D1BWP U1261 ( .A1(n752), .A2(n751), .A3(n753), .ZN(n756) );
  IND2D1BWP U1262 ( .A1(n799), .B1(n669), .ZN(n671) );
  XNR2D1BWP U1263 ( .A1(n701), .A2(n684), .ZN(n673) );
  OAI211D1BWP U1264 ( .A1(n683), .A2(n682), .B(n681), .C(n680), .ZN(n751) );
  ND3D1BWP U1265 ( .A1(n679), .A2(\dec_logic/checksum/encoder/N25 ), .A3(
        \dec_logic/checksum/check[7] ), .ZN(n680) );
  XOR3D1BWP U1266 ( .A1(n677), .A2(n676), .A3(n682), .Z(n675) );
  OAI22D1BWP U1267 ( .A1(n656), .A2(n655), .B1(n792), .B2(n793), .ZN(n676) );
  XNR2D1BWP U1268 ( .A1(n654), .A2(n976), .ZN(n656) );
  XNR2D1BWP U1269 ( .A1(n653), .A2(n652), .ZN(n677) );
  OAI21D1BWP U1270 ( .A1(n651), .A2(n768), .B(n650), .ZN(n652) );
  OAI21D1BWP U1271 ( .A1(\dec_logic/checksum/check[20] ), .A2(
        \dec_logic/checksum/check[19] ), .B(n707), .ZN(n558) );
  OAI22D1BWP U1272 ( .A1(n558), .A2(n706), .B1(n963), .B2(n962), .ZN(n559) );
  AOI21D1BWP U1273 ( .A1(n761), .A2(n760), .B(n759), .ZN(n569) );
  OAI31D1BWP U1274 ( .A1(n913), .A2(n1049), .A3(n591), .B(n622), .ZN(n457) );
  XNR2D1BWP U1275 ( .A1(\enc_logic/checksum[5] ), .A2(\enc_logic/checksum[6] ), 
        .ZN(n593) );
  XOR2D1BWP U1276 ( .A1(n918), .A2(n917), .Z(n919) );
  XNR2D1BWP U1277 ( .A1(\dec_logic/checksum/check[6] ), .A2(
        \dec_logic/checksum/check[5] ), .ZN(n649) );
  OAI22D1BWP U1278 ( .A1(n696), .A2(n964), .B1(n801), .B2(n699), .ZN(n697) );
  AOI21D1BWP U1279 ( .A1(n763), .A2(n764), .B(n762), .ZN(n748) );
  OAI21D1BWP U1280 ( .A1(n678), .A2(n677), .B(n676), .ZN(n681) );
  AOI31D1BWP U1281 ( .A1(n625), .A2(n637), .A3(n768), .B(n767), .ZN(
        Packet_To_Node[0]) );
  IND2D1BWP U1282 ( .A1(n976), .B1(n535), .ZN(n653) );
  NR4D0BWP U1283 ( .A1(r_addr[3]), .A2(r_addr[1]), .A3(r_addr[2]), .A4(
        r_addr[0]), .ZN(n1002) );
  MUX2ND0BWP U1284 ( .I0(\dec_logic/three_six_load[4] ), .I1(n1013), .S(
        \dec_logic/raw[7] ), .ZN(n1014) );
  MUX2ND0BWP U1285 ( .I0(\dec_logic/three_six_load[7] ), .I1(n1015), .S(
        \dec_logic/raw[13] ), .ZN(n1016) );
  NR4D0BWP U1286 ( .A1(\enc_logic/checksum[5] ), .A2(\enc_logic/checksum[6] ), 
        .A3(\enc_logic/check/N25 ), .A4(n1050), .ZN(n1028) );
  NR3D0BWP U1287 ( .A1(\enc_logic/checksum[21] ), .A2(\enc_logic/checksum[20] ), .A3(n1050), .ZN(n1039) );
  NR3D0BWP U1288 ( .A1(\enc_logic/checksum[24] ), .A2(\enc_logic/checksum[23] ), .A3(n1050), .ZN(n1041) );
  NR3D0BWP U1289 ( .A1(\enc_logic/checksum[27] ), .A2(\enc_logic/checksum[26] ), .A3(n1050), .ZN(n1047) );
endmodule

