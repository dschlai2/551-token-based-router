
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
         \main_control/next_select_sig[2] , \main_control/next_select_sig[1] ,
         \main_control/next_select_sig[0] , \main_control/next_state[3] ,
         \main_control/next_state[2] , \main_control/next_state[1] ,
         \main_control/state[1] , \main_control/state[2] ,
         \main_control/state[3] , \dec_logic/checksum/check[27] ,
         \dec_logic/checksum/check[26] , \dec_logic/checksum/check[25] ,
         \dec_logic/checksum/check[24] , \dec_logic/checksum/check[23] ,
         \dec_logic/checksum/check[22] , \dec_logic/checksum/check[21] ,
         \dec_logic/checksum/check[20] , \dec_logic/checksum/check[19] ,
         \dec_logic/checksum/check[18] , \dec_logic/checksum/check[17] ,
         \dec_logic/checksum/check[16] , \dec_logic/checksum/check[15] ,
         \dec_logic/checksum/check[14] , \dec_logic/checksum/check[13] ,
         \dec_logic/checksum/check[12] , \dec_logic/checksum/check[11] ,
         \dec_logic/checksum/check[10] , \dec_logic/checksum/check[9] ,
         \dec_logic/checksum/check[8] , \dec_logic/checksum/check[7] ,
         \dec_logic/checksum/check[6] , \dec_logic/checksum/check[5] ,
         \enc_logic/check/N25 , \dec_logic/checksum/encoder/N25 , n5, n6, n78,
         n79, n80, n101, n429, n430, n431, n432, n433, n434, n435, n436, n437,
         n438, n439, n440, n441, n442, n443, n444, n445, n446, n447, n448,
         n449, n450, n451, n453, n454, n455, n456, n457, n458, n459, n460,
         n461, n462, n463, n464, n465, n466, n467, n468, n469, n470, n471,
         n472, n473, n475, n476, n477, n478, n479, n480, n481, n482, n483,
         n484, n485, n486, n487, n488, n489, n490, n491, n492, n493, n494,
         n495, n496, n497, n498, n499, n500, n501, n502, n503, n504, n505,
         n506, n507, n508, n509, n510, n511, n512, n513, n514, n515, n516,
         n517, n518, n519, n520, n521, n522, n523, n524, n525, n526, n527,
         n528, n529, n530, n531, n532, n533, n534, n535, n536, n537, n538,
         n539, n540, n541, n542, n543, n544, n545, n546, n547, n548, n549,
         n550, n551, n552, n553, n554, n555, n556, n557, n558, n559, n560,
         n561, n562, n563, n564, n565, n566, n567, n568, n569, n570, n571,
         n572, n573, n574, n575, n576, n577, n578, n579, n580, n581, n582,
         n583, n584, n585, n586, n590, n591, n592, n593, n594, n595, n596,
         n597, n598, n599, n600, n601, n602, n603, n604, n605, n606, n607,
         n608, n609, n610, n611, n612, n613, n614, n615, n616, n617, n618,
         n619, n620, n621, n622, n623, n624, n625, n626, n627, n628, n629,
         n630, n631, n632, n633, n634, n635, n636, n637, n638, n639, n640,
         n641, n642, n643, n644, n645, n646, n647, n648, n649, n650, n651,
         n652, n653, n654, n655, n656, n657, n658, n659, n660, n661, n662,
         n663, n664, n665, n666, n667, n668, n669, n670, n671, n672, n673,
         n674, n675, n676, n677, n678, n679, n680, n681, n682, n683, n684,
         n685, n686, n687, n688, n689, n690, n691, n692, n693, n694, n695,
         n696, n697, n698, n699, n700, n701, n702, n703, n704, n705, n706,
         n707, n708, n709, n710, n711, n712, n713, n714, n715, n716, n717,
         n718, n719, n720, n721, n722, n723, n724, n725, n726, n727, n728,
         n729, n730, n731, n732, n733, n734, n735, n736, n737, n738, n739,
         n740, n741, n742, n743, n744, n745, n746, n747, n748, n749, n750,
         n751, n752, n753, n754, n755, n756, n757, n758, n759, n760, n761,
         n762, n763, n764, n765, n766, n767, n768, n769, n770, n771, n772,
         n773, n774, n775, n776, n777, n778, n779, n780, n781, n782, n783,
         n784, n785, n786, n787, n788, n789, n790, n791, n792, n793, n794,
         n795, n796, n797, n798, n799, n800, n801, n802, n803, n804, n805,
         n806, n807, n808, n809, n810, n811, n812, n813, n814, n815, n816,
         n817, n818, n819, n820, n821, n822, n823, n824, n825, n826, n827,
         n828, n829, n830, n831, n832, n833, n834, n835, n836, n837, n838,
         n839, n840, n841, n842, n843, n844, n845, n846, n847, n848, n849,
         n850, n851, n852, n853, n854, n855, n856, n857, n858, n859, n860,
         n861, n862, n863, n864, n865, n866, n867, n868, n869, n870, n871,
         n872, n873, n874, n875, n876, n877, n878, n879, n880, n881, n882,
         n883, n884, n885, n886, n887, n888, n889, n890, n891, n892, n893,
         n894, n895, n896, n897, n898, n899, n900, n901, n902, n903, n904,
         n905, n906, n907, n908, n909, n910, n911, n912, n913, n914, n915,
         n916, n917, n918, n919, n920, n921, n922, n923, n924, n925, n926,
         n927, n928, n929, n930, n931, n932, n933, n934, n935, n936, n937,
         n938, n939, n940, n941, n942, n943, n944, n945, n946, n947, n948,
         n949, n950, n951, n952, n953, n954, n955, n956, n957, n958, n959,
         n960, n961, n962, n963, n964, n965, n966, n967, n968, n969, n970,
         n971, n972, n973, n974, n975, n976, n977, n978, n979, n980, n981,
         n982, n983, n984, n985, n986, n987, n988, n989, n990, n991, n992,
         n993, n994, n995, n996, n997, n998, n999, n1000, n1001, n1002, n1003,
         n1004, n1005, n1006, n1007, n1008, n1009, n1010, n1011, n1012, n1013,
         n1014, n1015, n1016, n1017, n1018, n1019, n1020, n1021, n1022, n1023,
         n1024, n1025, n1026, n1027, n1028, n1029, n1030, n1031, n1032, n1033,
         n1034, n1035, n1036, n1037, n1038, n1039, n1040, n1041, n1042, n1043,
         n1044, n1045, n1046, n1047, n1048, n1049, n1050, n1051, n1052, n1053,
         n1054;
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
  DFCNQD1BWP \main_control/state_reg[2]  ( .D(\main_control/next_state[2] ), 
        .CP(Clk_R), .CDN(Rst_n), .Q(\main_control/state[2] ) );
  DFCNQD1BWP \rHandshake/state_reg[1]  ( .D(\rHandshake/next_state[1] ), .CP(
        Clk_R), .CDN(Rst_n), .Q(\rHandshake/state[1] ) );
  DFCNQD1BWP \ever_versetile/out_reg[1]  ( .D(n472), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[1]) );
  DFCNQD1BWP \ever_versetile/out_reg[0]  ( .D(n473), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[0]) );
  DFCNQD1BWP \ever_versetile/out_reg[2]  ( .D(n471), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[2]) );
  DFCNQD1BWP \ever_versetile/out_reg[3]  ( .D(n470), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[3]) );
  DFCNQD1BWP \ever_versetile/out_reg[4]  ( .D(n469), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[4]) );
  DFCNQD1BWP \ever_versetile/out_reg[5]  ( .D(n468), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[5]) );
  DFCNQD1BWP \ever_versetile/out_reg[6]  ( .D(n467), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[6]) );
  DFCNQD1BWP \ever_versetile/out_reg[7]  ( .D(n466), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[7]) );
  DFCNQD1BWP \ever_versetile/out_reg[8]  ( .D(n465), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[8]) );
  DFCNQD1BWP \ever_versetile/out_reg[9]  ( .D(n464), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[9]) );
  DFCNQD1BWP \ever_versetile/out_reg[10]  ( .D(n463), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[10]) );
  DFCNQD1BWP \ever_versetile/out_reg[11]  ( .D(n462), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[11]) );
  DFCNQD1BWP \ever_versetile/out_reg[12]  ( .D(n461), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[12]) );
  DFCNQD1BWP \ever_versetile/out_reg[13]  ( .D(n460), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[13]) );
  DFCNQD1BWP \ever_versetile/out_reg[14]  ( .D(n459), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[14]) );
  DFCNQD1BWP \ever_versetile/out_reg[15]  ( .D(n458), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[15]) );
  DFCNQD1BWP \ever_versetile/out_reg[16]  ( .D(n457), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[16]) );
  DFCNQD1BWP \ever_versetile/out_reg[17]  ( .D(n456), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[17]) );
  DFCNQD1BWP \ever_versetile/out_reg[18]  ( .D(n455), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[18]) );
  DFCNQD1BWP \ever_versetile/out_reg[19]  ( .D(n454), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[19]) );
  DFCNQD1BWP \ever_versetile/out_reg[20]  ( .D(n453), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[20]) );
  DFCNQD1BWP \ever_versetile/out_reg[21]  ( .D(n931), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[21]) );
  DFCNQD1BWP \ever_versetile/out_reg[23]  ( .D(n450), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[23]) );
  DFCNQD1BWP \ever_versetile/out_reg[24]  ( .D(n449), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[24]) );
  DFCNQD1BWP \ever_versetile/out_reg[25]  ( .D(n448), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[25]) );
  DFCNQD1BWP \ever_versetile/out_reg[26]  ( .D(n447), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[26]) );
  DFCNQD1BWP \ever_versetile/out_reg[27]  ( .D(n446), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[27]) );
  DFCNQD1BWP \ever_versetile/out_reg[28]  ( .D(n445), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[28]) );
  DFCNQD1BWP \ever_versetile/out_reg[29]  ( .D(n444), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[29]) );
  DFCNQD1BWP \ever_versetile/out_reg[30]  ( .D(n443), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[30]) );
  DFCNQD1BWP \ever_versetile/out_reg[31]  ( .D(n442), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[31]) );
  DFCNQD1BWP \ever_versetile/out_reg[32]  ( .D(n441), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[32]) );
  DFCNQD1BWP \ever_versetile/out_reg[33]  ( .D(n440), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[33]) );
  DFCNQD1BWP \ever_versetile/out_reg[34]  ( .D(n439), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[34]) );
  DFCNQD1BWP \ever_versetile/out_reg[35]  ( .D(n438), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[35]) );
  DFCNQD1BWP \ever_versetile/out_reg[36]  ( .D(n437), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[36]) );
  DFCNQD1BWP \ever_versetile/out_reg[37]  ( .D(n436), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[37]) );
  DFCNQD1BWP \ever_versetile/out_reg[38]  ( .D(n435), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[38]) );
  DFCNQD1BWP \ever_versetile/out_reg[39]  ( .D(n434), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[39]) );
  DFCNQD1BWP \ever_versetile/out_reg[40]  ( .D(n433), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[40]) );
  DFCNQD1BWP \ever_versetile/out_reg[41]  ( .D(n432), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[41]) );
  DFCNQD1BWP \ever_versetile/out_reg[42]  ( .D(n431), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[42]) );
  DFCNQD1BWP \ever_versetile/out_reg[43]  ( .D(n430), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[43]) );
  DFCNQD1BWP \ever_versetile/out_reg[44]  ( .D(n429), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[44]) );
  EDFCNQD1BWP \ever_versetile/out_reg[48]  ( .D(enc_to_buf[48]), .E(n101), 
        .CP(Clk_R), .CDN(Rst_n), .Q(buf_to_mux[48]) );
  EDFCNQD1BWP \ever_versetile/out_reg[49]  ( .D(enc_to_buf[49]), .E(n101), 
        .CP(Clk_R), .CDN(Rst_n), .Q(buf_to_mux[49]) );
  EDFCNQD1BWP \ever_versetile/out_reg[50]  ( .D(enc_to_buf[50]), .E(n101), 
        .CP(Clk_R), .CDN(Rst_n), .Q(buf_to_mux[50]) );
  EDFCNQD1BWP \ever_versetile/out_reg[51]  ( .D(enc_to_buf[51]), .E(n101), 
        .CP(Clk_R), .CDN(Rst_n), .Q(buf_to_mux[51]) );
  EDFCNQD1BWP \ever_versetile/out_reg[52]  ( .D(\enc_logic/encode_type ), .E(
        n101), .CP(Clk_R), .CDN(Rst_n), .Q(buf_to_mux[52]) );
  EDFCNQD1BWP \ever_versetile/out_reg[53]  ( .D(n960), .E(n101), .CP(Clk_R), 
        .CDN(Rst_n), .Q(buf_to_mux[53]) );
  DFCNQD1BWP \tHandshake/state_reg[0]  ( .D(\tHandshake/next_state[0] ), .CP(
        Clk_R), .CDN(Rst_n), .Q(\tHandshake/state[0] ) );
  DFCNQD1BWP \main_control/select_sig_reg[1]  ( .D(
        \main_control/next_select_sig[1] ), .CP(Clk_R), .CDN(Rst_n), .Q(
        tx_data_select[1]) );
  DFCNQD1BWP \main_control/select_sig_reg[0]  ( .D(
        \main_control/next_select_sig[0] ), .CP(Clk_R), .CDN(Rst_n), .Q(
        tx_data_select[0]) );
  DFCNQD1BWP \tHandshake/state_reg[1]  ( .D(\tHandshake/next_state[1] ), .CP(
        Clk_R), .CDN(Rst_n), .Q(TX_Data_Valid) );
  DFCNQD1BWP \main_control/select_sig_reg[2]  ( .D(
        \main_control/next_select_sig[2] ), .CP(Clk_R), .CDN(Rst_n), .Q(
        tx_data_select[2]) );
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
  EDFCNQD1BWP \tHandshake/TX_Data_reg[51]  ( .D(data_to_tx[51]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[51]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[50]  ( .D(data_to_tx[50]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[50]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[4]  ( .D(data_to_tx[4]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[4]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[49]  ( .D(data_to_tx[49]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[49]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[48]  ( .D(data_to_tx[48]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[48]) );
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
  EDFCNQD1BWP \tHandshake/TX_Data_reg[2]  ( .D(data_to_tx[2]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[2]) );
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
  EDFCNQD1BWP \tHandshake/TX_Data_reg[22]  ( .D(data_to_tx[22]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[22]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[21]  ( .D(data_to_tx[21]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[21]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[19]  ( .D(data_to_tx[19]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[19]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[18]  ( .D(data_to_tx[18]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[18]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[17]  ( .D(data_to_tx[17]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[17]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[16]  ( .D(data_to_tx[16]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[16]) );
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
  EDFCNQD1BWP \tHandshake/TX_Data_reg[10]  ( .D(data_to_tx[10]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[10]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[0]  ( .D(data_to_tx[0]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[0]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[1]  ( .D(data_to_tx[1]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[1]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[20]  ( .D(data_to_tx[20]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[20]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[45]  ( .D(data_to_tx[45]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[45]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[46]  ( .D(data_to_tx[46]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[46]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[47]  ( .D(data_to_tx[47]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[47]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[53]  ( .D(data_to_tx[53]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[53]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[52]  ( .D(data_to_tx[52]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[52]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[54]  ( .D(data_to_tx[54]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[54]) );
  EDFCND1BWP \ever_versetile/out_reg[45]  ( .D(\enc_logic/checksum[25] ), .E(
        n101), .CP(Clk_R), .CDN(Rst_n), .QN(n78) );
  EDFCND1BWP \ever_versetile/out_reg[46]  ( .D(\enc_logic/checksum[26] ), .E(
        n101), .CP(Clk_R), .CDN(Rst_n), .QN(n79) );
  EDFCND1BWP \ever_versetile/out_reg[47]  ( .D(\enc_logic/checksum[27] ), .E(
        n101), .CP(Clk_R), .CDN(Rst_n), .QN(n80) );
  DFCNQD1BWP \main_control/state_reg[0]  ( .D(n5), .CP(Clk_R), .CDN(Rst_n), 
        .Q(n6) );
  DFCND1BWP \rHandshake/state_reg[0]  ( .D(\rHandshake/next_state[0] ), .CP(
        Clk_R), .CDN(Rst_n), .Q(\rHandshake/state[0] ), .QN(n1044) );
  DFCNQD1BWP \ever_versetile/out_reg[22]  ( .D(n451), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[22]) );
  CKND2BWP U569 ( .I(n751), .ZN(n747) );
  OAI21D1BWP U570 ( .A1(n628), .A2(\dec_logic/checksum/check[16] ), .B(n775), 
        .ZN(n547) );
  ND2D2BWP U571 ( .A1(n676), .A2(n677), .ZN(n684) );
  NR3D2BWP U572 ( .A1(n747), .A2(n581), .A3(n948), .ZN(n757) );
  ND2D2BWP U573 ( .A1(n748), .A2(n747), .ZN(n756) );
  ND2D1BWP U574 ( .A1(n875), .A2(n882), .ZN(n886) );
  NR2XD3BWP U575 ( .A1(n881), .A2(n962), .ZN(n885) );
  XNR2D1BWP U576 ( .A1(n880), .A2(n879), .ZN(n881) );
  INVD1BWP U577 ( .I(\main_control/state[1] ), .ZN(n944) );
  NR2XD0BWP U578 ( .A1(n6), .A2(\main_control/state[2] ), .ZN(n998) );
  IND2D1BWP U579 ( .A1(\main_control/state[3] ), .B1(\main_control/state[1] ), 
        .ZN(n632) );
  ND2D1BWP U580 ( .A1(\main_control/state[2] ), .A2(n944), .ZN(n1049) );
  NR2D3BWP U581 ( .A1(n913), .A2(n961), .ZN(n911) );
  INVD1BWP U582 ( .I(n677), .ZN(n683) );
  NR2XD3BWP U583 ( .A1(n666), .A2(n773), .ZN(n665) );
  INVD1BWP U584 ( .I(n665), .ZN(n701) );
  CKND2BWP U585 ( .I(n642), .ZN(n643) );
  ND2D1BWP U586 ( .A1(n793), .A2(\enc_logic/check/N25 ), .ZN(n787) );
  INVD1BWP U587 ( .I(n743), .ZN(n739) );
  AOI21D2BWP U588 ( .A1(n552), .A2(n551), .B(n550), .ZN(n553) );
  ND2D1BWP U589 ( .A1(n746), .A2(n558), .ZN(n539) );
  NR2D3BWP U590 ( .A1(n736), .A2(n951), .ZN(n738) );
  ND2D1BWP U591 ( .A1(n959), .A2(n520), .ZN(n651) );
  NR2XD0BWP U592 ( .A1(n757), .A2(\dec_logic/three_six_load[10] ), .ZN(n533)
         );
  ND2D1BWP U593 ( .A1(n508), .A2(n757), .ZN(n749) );
  AOI22D1BWP U594 ( .A1(n604), .A2(n605), .B1(n607), .B2(n606), .ZN(n763) );
  OAI21D1BWP U595 ( .A1(n871), .A2(n870), .B(n875), .ZN(n903) );
  NR2XD0BWP U596 ( .A1(\enc_logic/checksum[5] ), .A2(\enc_logic/checksum[6] ), 
        .ZN(n793) );
  NR2XD0BWP U597 ( .A1(n977), .A2(tx_data_select[0]), .ZN(n978) );
  CKND4BWP U598 ( .I(n590), .ZN(n513) );
  NR3D0BWP U599 ( .A1(\enc_logic/checksum[27] ), .A2(\enc_logic/checksum[26] ), 
        .A3(n1042), .ZN(n1039) );
  NR3D0BWP U600 ( .A1(\enc_logic/checksum[24] ), .A2(\enc_logic/checksum[23] ), 
        .A3(n1042), .ZN(n1034) );
  NR3D0BWP U601 ( .A1(\enc_logic/checksum[21] ), .A2(\enc_logic/checksum[20] ), 
        .A3(n1042), .ZN(n1030) );
  INVD1BWP U602 ( .I(\enc_logic/checksum[9] ), .ZN(n926) );
  NR2XD0BWP U603 ( .A1(n945), .A2(n1049), .ZN(n634) );
  INVD1BWP U604 ( .I(n6), .ZN(n945) );
  MOAI22D0BWP U605 ( .A1(n985), .A2(n631), .B1(buf_to_mux[20]), .B2(n513), 
        .ZN(data_to_tx[20]) );
  MOAI22D0BWP U606 ( .A1(n979), .A2(n631), .B1(buf_to_mux[10]), .B2(n513), 
        .ZN(data_to_tx[10]) );
  MOAI22D0BWP U607 ( .A1(n1024), .A2(n590), .B1(\dec_logic/raw[13] ), .B2(n630), .ZN(data_to_tx[13]) );
  MOAI22D0BWP U608 ( .A1(n980), .A2(n631), .B1(buf_to_mux[16]), .B2(n513), 
        .ZN(data_to_tx[16]) );
  MOAI22D0BWP U609 ( .A1(n1026), .A2(n590), .B1(\dec_logic/raw[19] ), .B2(n978), .ZN(data_to_tx[19]) );
  MOAI22D0BWP U610 ( .A1(n982), .A2(n631), .B1(buf_to_mux[21]), .B2(n513), 
        .ZN(data_to_tx[21]) );
  MOAI22D0BWP U611 ( .A1(n987), .A2(n631), .B1(buf_to_mux[22]), .B2(n513), 
        .ZN(data_to_tx[22]) );
  MOAI22D0BWP U612 ( .A1(n983), .A2(n631), .B1(buf_to_mux[23]), .B2(n513), 
        .ZN(data_to_tx[23]) );
  MOAI22D0BWP U613 ( .A1(n520), .A2(n631), .B1(buf_to_mux[25]), .B2(n513), 
        .ZN(data_to_tx[25]) );
  MOAI22D0BWP U614 ( .A1(n959), .A2(n631), .B1(buf_to_mux[26]), .B2(n513), 
        .ZN(data_to_tx[26]) );
  MOAI22D0BWP U615 ( .A1(n972), .A2(n631), .B1(buf_to_mux[27]), .B2(n513), 
        .ZN(data_to_tx[27]) );
  MOAI22D0BWP U616 ( .A1(n958), .A2(n631), .B1(buf_to_mux[30]), .B2(n513), 
        .ZN(data_to_tx[30]) );
  MOAI22D0BWP U617 ( .A1(n957), .A2(n631), .B1(buf_to_mux[38]), .B2(n513), 
        .ZN(data_to_tx[38]) );
  MOAI22D0BWP U618 ( .A1(n956), .A2(n631), .B1(buf_to_mux[39]), .B2(n513), 
        .ZN(data_to_tx[39]) );
  MOAI22D0BWP U619 ( .A1(n955), .A2(n631), .B1(buf_to_mux[40]), .B2(n513), 
        .ZN(data_to_tx[40]) );
  MOAI22D0BWP U620 ( .A1(n954), .A2(n631), .B1(buf_to_mux[41]), .B2(n513), 
        .ZN(data_to_tx[41]) );
  MOAI22D0BWP U621 ( .A1(n953), .A2(n631), .B1(buf_to_mux[42]), .B2(n513), 
        .ZN(data_to_tx[42]) );
  MOAI22D0BWP U622 ( .A1(n952), .A2(n631), .B1(buf_to_mux[43]), .B2(n513), 
        .ZN(data_to_tx[43]) );
  MOAI22D0BWP U623 ( .A1(n951), .A2(n631), .B1(buf_to_mux[44]), .B2(n513), 
        .ZN(data_to_tx[44]) );
  MOAI22D0BWP U624 ( .A1(n993), .A2(n631), .B1(buf_to_mux[4]), .B2(n513), .ZN(
        data_to_tx[4]) );
  MOAI22D0BWP U625 ( .A1(n1022), .A2(n590), .B1(\dec_logic/raw[7] ), .B2(n978), 
        .ZN(data_to_tx[7]) );
  INVD1BWP U626 ( .I(n933), .ZN(n101) );
  OAI21D1BWP U627 ( .A1(n611), .A2(n909), .B(n612), .ZN(n450) );
  OA21D1BWP U628 ( .A1(n910), .A2(n1041), .B(n616), .Z(n611) );
  XNR2D1BWP U629 ( .A1(n912), .A2(n911), .ZN(n624) );
  MOAI22D0BWP U630 ( .A1(n922), .A2(n1042), .B1(n933), .B2(buf_to_mux[16]), 
        .ZN(n457) );
  MOAI22D0BWP U631 ( .A1(n926), .A2(n1042), .B1(n933), .B2(buf_to_mux[11]), 
        .ZN(n462) );
  MOAI22D0BWP U632 ( .A1(n927), .A2(n1042), .B1(n933), .B2(buf_to_mux[10]), 
        .ZN(n463) );
  MOAI22D0BWP U633 ( .A1(n971), .A2(n1042), .B1(n933), .B2(buf_to_mux[9]), 
        .ZN(n464) );
  CKND2D0BWP U634 ( .A1(n824), .A2(n810), .ZN(n475) );
  XNR4D0BWP U635 ( .A1(n816), .A2(n814), .A3(n812), .A4(n475), .ZN(n823) );
  NR4D0BWP U636 ( .A1(\main_control/state[3] ), .A2(n1049), .A3(n945), .A4(
        n1054), .ZN(n476) );
  AOI21D0BWP U637 ( .A1(n938), .A2(n945), .B(n476), .ZN(n477) );
  IOA21D0BWP U638 ( .A1(n942), .A2(n935), .B(n477), .ZN(n622) );
  INR2D0BWP U639 ( .A1(n817), .B1(n816), .ZN(n890) );
  OAI22D0BWP U640 ( .A1(address[2]), .A2(n1009), .B1(address[0]), .B2(n1008), 
        .ZN(n478) );
  AOI22D0BWP U641 ( .A1(n1011), .A2(address[3]), .B1(address[1]), .B2(n1010), 
        .ZN(n479) );
  OAI221D0BWP U642 ( .A1(n1011), .A2(address[3]), .B1(address[1]), .B2(n1010), 
        .C(n479), .ZN(n480) );
  AOI22D0BWP U643 ( .A1(address[2]), .A2(n1009), .B1(address[0]), .B2(n1008), 
        .ZN(n481) );
  OAI31D0BWP U644 ( .A1(\dec_logic/token ), .A2(data_type[1]), .A3(
        data_type[0]), .B(n481), .ZN(n482) );
  OR4D0BWP U645 ( .A1(n1014), .A2(n478), .A3(n480), .A4(n482), .Z(n1002) );
  AOI22D0BWP U646 ( .A1(n933), .A2(buf_to_mux[44]), .B1(
        \enc_logic/checksum[24] ), .B2(n932), .ZN(n483) );
  NR2D0BWP U647 ( .A1(n962), .A2(n961), .ZN(n484) );
  AOI32D0BWP U648 ( .A1(\enc_logic/checksum[25] ), .A2(n483), .A3(n484), .B1(
        n1042), .B2(n483), .ZN(n429) );
  NR2D0BWP U649 ( .A1(n708), .A2(n709), .ZN(n485) );
  AOI31D0BWP U650 ( .A1(\dec_logic/checksum/encoder/N25 ), .A2(
        \dec_logic/checksum/check[7] ), .A3(n707), .B(n485), .ZN(n486) );
  AOI32D0BWP U651 ( .A1(n708), .A2(n486), .A3(n709), .B1(n706), .B2(n486), 
        .ZN(n720) );
  IND2D0BWP U652 ( .A1(n821), .B1(n914), .ZN(n487) );
  AOI22D0BWP U653 ( .A1(\enc_logic/checksum[15] ), .A2(n821), .B1(
        \enc_logic/checksum[16] ), .B2(n487), .ZN(n488) );
  INR2D0BWP U654 ( .A1(n823), .B1(n488), .ZN(n894) );
  CKND2D0BWP U655 ( .A1(n946), .A2(n779), .ZN(n489) );
  MAOI22D0BWP U656 ( .A1(n1000), .A2(n489), .B1(\main_control/state[3] ), .B2(
        \main_control/state[1] ), .ZN(n1018) );
  AOI22D0BWP U657 ( .A1(n933), .A2(buf_to_mux[26]), .B1(
        \enc_logic/checksum[6] ), .B2(n932), .ZN(n490) );
  CKND0BWP U658 ( .I(n1028), .ZN(n491) );
  AOI32D0BWP U659 ( .A1(\enc_logic/checksum[16] ), .A2(n490), .A3(n491), .B1(
        n1042), .B2(n490), .ZN(n447) );
  IND2D0BWP U660 ( .A1(n716), .B1(n717), .ZN(n722) );
  CKND0BWP U661 ( .I(n813), .ZN(n492) );
  AN2D0BWP U662 ( .A1(n815), .A2(n492), .Z(n493) );
  OAI222D0BWP U663 ( .A1(n492), .A2(n815), .B1(n1027), .B2(n971), .C1(n493), 
        .C2(n814), .ZN(n889) );
  XOR4D0BWP U664 ( .A1(\dec_logic/checksum/check[16] ), .A2(
        \dec_logic/checksum/check[19] ), .A3(\dec_logic/checksum/check[20] ), 
        .A4(\dec_logic/checksum/check[21] ), .Z(n494) );
  CKND2D0BWP U665 ( .A1(n775), .A2(n494), .ZN(n495) );
  OAI211D0BWP U666 ( .A1(n775), .A2(n494), .B(n776), .C(n495), .ZN(n569) );
  IND2D0BWP U667 ( .A1(\enc_logic/checksum[14] ), .B1(n916), .ZN(n919) );
  INR2D0BWP U668 ( .A1(n938), .B1(n945), .ZN(n937) );
  INR2D0BWP U669 ( .A1(n913), .B1(\enc_logic/checksum[27] ), .ZN(n496) );
  AOI22D0BWP U670 ( .A1(buf_to_mux[20]), .A2(n933), .B1(n917), .B2(n629), .ZN(
        n497) );
  OAI211D0BWP U671 ( .A1(n496), .A2(n915), .B(n918), .C(n497), .ZN(n453) );
  CKND0BWP U672 ( .I(n719), .ZN(n498) );
  OAI21D0BWP U673 ( .A1(n718), .A2(n498), .B(n720), .ZN(n721) );
  MOAI22D0BWP U674 ( .A1(n689), .A2(n688), .B1(n687), .B2(n514), .ZN(n730) );
  CKND0BWP U675 ( .I(\dec_logic/three_six_load[5] ), .ZN(n499) );
  MUX2ND0BWP U676 ( .I0(\dec_logic/three_six_load[4] ), .I1(n979), .S(
        \dec_logic/raw[7] ), .ZN(n500) );
  XOR4D0BWP U677 ( .A1(\dec_logic/three_six_load[3] ), .A2(\dec_logic/raw[8] ), 
        .A3(\dec_logic/raw[6] ), .A4(n500), .Z(n501) );
  MUX2ND0BWP U678 ( .I0(n499), .I1(\dec_logic/three_six_load[5] ), .S(n501), 
        .ZN(n568) );
  CKND0BWP U679 ( .I(n892), .ZN(n502) );
  OAI21D0BWP U680 ( .A1(n894), .A2(n502), .B(n893), .ZN(n503) );
  INR2D0BWP U681 ( .A1(n887), .B1(n888), .ZN(n504) );
  OAI21D0BWP U682 ( .A1(n890), .A2(n891), .B(n889), .ZN(n505) );
  CKND2D0BWP U683 ( .A1(n504), .A2(n505), .ZN(n506) );
  OAI211D0BWP U684 ( .A1(n504), .A2(n505), .B(n503), .C(n506), .ZN(n907) );
  INR2D0BWP U685 ( .A1(n998), .B1(n632), .ZN(n635) );
  INR2D0BWP U686 ( .A1(n937), .B1(n1014), .ZN(n935) );
  CKND0BWP U687 ( .I(n917), .ZN(n507) );
  OAI222D0BWP U688 ( .A1(n507), .A2(n918), .B1(n1042), .B2(n919), .C1(n101), 
        .C2(n1026), .ZN(n454) );
  ND2D8BWP U689 ( .A1(n509), .A2(n510), .ZN(n512) );
  CKND4BWP U690 ( .I(n545), .ZN(n509) );
  CKND4BWP U691 ( .I(n776), .ZN(n637) );
  ND2D2BWP U692 ( .A1(n639), .A2(n638), .ZN(n525) );
  ND2D8BWP U693 ( .A1(n646), .A2(n628), .ZN(n666) );
  CKND2BWP U694 ( .I(n641), .ZN(n644) );
  OAI21D4BWP U695 ( .A1(n641), .A2(n642), .B(n772), .ZN(n646) );
  CKND12BWP U696 ( .I(\dec_logic/checksum/check[5] ), .ZN(n520) );
  NR3D2BWP U697 ( .A1(n660), .A2(n777), .A3(n661), .ZN(n641) );
  OAI21D2BWP U698 ( .A1(n657), .A2(n527), .B(n526), .ZN(n642) );
  CKND3BWP U699 ( .I(n654), .ZN(n510) );
  CKBD2BWP U700 ( .I(n978), .Z(n630) );
  INVD1BWP U701 ( .I(n877), .ZN(n873) );
  NR2XD1BWP U702 ( .A1(n964), .A2(n876), .ZN(n877) );
  NR2D3BWP U703 ( .A1(\enc_logic/encode_type ), .A2(n933), .ZN(n932) );
  IND2D2BWP U704 ( .A1(n755), .B1(n536), .ZN(n538) );
  INR2D2BWP U705 ( .A1(n753), .B1(n755), .ZN(n565) );
  ND2D2BWP U706 ( .A1(n776), .A2(n523), .ZN(n638) );
  ND3D8BWP U707 ( .A1(n644), .A2(n643), .A3(\dec_logic/checksum/check[15] ), 
        .ZN(n628) );
  NR3D1BWP U708 ( .A1(n831), .A2(n830), .A3(n829), .ZN(n835) );
  IND3D1BWP U709 ( .A1(n970), .B1(n833), .B2(n832), .ZN(n836) );
  ND2D3BWP U710 ( .A1(n557), .A2(n688), .ZN(n736) );
  NR3D1BWP U711 ( .A1(n519), .A2(n621), .A3(n516), .ZN(n5) );
  CKND4BWP U712 ( .I(n543), .ZN(n544) );
  OAI22D2BWP U713 ( .A1(n544), .A2(n952), .B1(n764), .B2(n955), .ZN(
        Packet_To_Node[19]) );
  CKND4BWP U714 ( .I(n543), .ZN(n762) );
  ND2D1BWP U715 ( .A1(n898), .A2(n897), .ZN(n899) );
  AOI21D2BWP U716 ( .A1(n824), .A2(n811), .B(\enc_logic/checksum[14] ), .ZN(
        n831) );
  ND2D2BWP U717 ( .A1(n800), .A2(n916), .ZN(n811) );
  OAI22D1BWP U718 ( .A1(n847), .A2(n846), .B1(n969), .B2(n968), .ZN(n849) );
  INR2D4BWP U719 ( .A1(n912), .B1(n620), .ZN(n619) );
  NR2D4BWP U720 ( .A1(n878), .A2(n877), .ZN(n895) );
  INVD1BWP U721 ( .I(n895), .ZN(n896) );
  ND2D2BWP U722 ( .A1(n895), .A2(\enc_logic/checksum[25] ), .ZN(n898) );
  XNR2D2BWP U723 ( .A1(n906), .A2(n902), .ZN(n910) );
  XOR3D2BWP U724 ( .A1(n898), .A2(n885), .A3(n886), .Z(n912) );
  NR2D3BWP U725 ( .A1(\enc_logic/checksum[24] ), .A2(n880), .ZN(n878) );
  ND2D1BWP U726 ( .A1(n862), .A2(n861), .ZN(n863) );
  ND2D3BWP U727 ( .A1(n1027), .A2(n787), .ZN(n788) );
  ND2D2BWP U728 ( .A1(n545), .A2(n654), .ZN(n511) );
  ND2D8BWP U729 ( .A1(n511), .A2(n512), .ZN(n776) );
  XNR3D4BWP U730 ( .A1(\enc_logic/checksum[23] ), .A2(n966), .A3(n869), .ZN(
        n876) );
  CKND2BWP U731 ( .I(n810), .ZN(n830) );
  CKND2D0BWP U732 ( .A1(n701), .A2(n628), .ZN(n702) );
  CKND0BWP U733 ( .I(n835), .ZN(n832) );
  XOR3D2BWP U734 ( .A1(\dec_logic/checksum/check[9] ), .A2(
        \dec_logic/checksum/check[7] ), .A3(\dec_logic/checksum/check[8] ), 
        .Z(n545) );
  ND2D3BWP U735 ( .A1(n694), .A2(n687), .ZN(n689) );
  CKND2BWP U736 ( .I(n680), .ZN(n649) );
  OAI21D4BWP U737 ( .A1(n840), .A2(n839), .B(n838), .ZN(n842) );
  CKND4BWP U738 ( .I(n847), .ZN(n843) );
  ND2D4BWP U739 ( .A1(n671), .A2(\dec_logic/checksum/check[20] ), .ZN(n677) );
  INR2XD4BWP U740 ( .A1(n681), .B1(n680), .ZN(n671) );
  NR2XD3BWP U741 ( .A1(n657), .A2(n778), .ZN(n660) );
  ND2D4BWP U742 ( .A1(n842), .A2(n841), .ZN(n847) );
  XOR2D2BWP U743 ( .A1(n665), .A2(n712), .Z(n595) );
  ND2D2BWP U744 ( .A1(n739), .A2(n950), .ZN(n740) );
  ND2D3BWP U745 ( .A1(n530), .A2(n529), .ZN(n647) );
  ND2D4BWP U746 ( .A1(n843), .A2(\enc_logic/checksum[19] ), .ZN(n851) );
  DCCKND4BWP U747 ( .I(n804), .ZN(n798) );
  ND3D2BWP U748 ( .A1(n744), .A2(n743), .A3(\dec_logic/checksum/check[25] ), 
        .ZN(n742) );
  CKND4BWP U749 ( .I(n738), .ZN(n744) );
  XOR3D2BWP U750 ( .A1(n723), .A2(n726), .A3(n724), .Z(n716) );
  ND2D2BWP U751 ( .A1(n864), .A2(n863), .ZN(n870) );
  ND2D1BWP U752 ( .A1(n860), .A2(n866), .ZN(n864) );
  ND2D2BWP U753 ( .A1(n673), .A2(n675), .ZN(n694) );
  INVD1BWP U754 ( .I(n704), .ZN(n584) );
  AOI22D4BWP U755 ( .A1(n670), .A2(\dec_logic/checksum/check[18] ), .B1(n669), 
        .B2(\dec_logic/checksum/check[17] ), .ZN(n704) );
  ND2D2BWP U756 ( .A1(n600), .A2(n599), .ZN(n687) );
  ND2D2BWP U757 ( .A1(n847), .A2(n969), .ZN(n852) );
  ND2D4BWP U758 ( .A1(n801), .A2(\enc_logic/checksum[13] ), .ZN(n824) );
  CKND4BWP U759 ( .I(n686), .ZN(n514) );
  XNR2D2BWP U760 ( .A1(\enc_logic/checksum[8] ), .A2(\enc_logic/checksum[7] ), 
        .ZN(n797) );
  CKND4BWP U761 ( .I(n885), .ZN(n900) );
  XNR3D4BWP U762 ( .A1(\enc_logic/checksum[10] ), .A2(n926), .A3(n797), .ZN(
        n804) );
  ND2D1BWP U763 ( .A1(n886), .A2(n898), .ZN(n884) );
  INVD1BWP U764 ( .I(n837), .ZN(n839) );
  DCCKND4BWP U765 ( .I(n866), .ZN(n861) );
  ND2D2BWP U766 ( .A1(n682), .A2(n955), .ZN(n676) );
  CKND2BWP U767 ( .I(n671), .ZN(n682) );
  ND2D2BWP U768 ( .A1(n872), .A2(n877), .ZN(n875) );
  NR2D3BWP U769 ( .A1(\dec_logic/checksum/check[21] ), .A2(n582), .ZN(n551) );
  CKND2BWP U770 ( .I(n649), .ZN(n582) );
  CKND4BWP U771 ( .I(n876), .ZN(n880) );
  NR2XD1BWP U772 ( .A1(n661), .A2(n660), .ZN(n662) );
  ND3D2BWP U773 ( .A1(n666), .A2(n773), .A3(n645), .ZN(n530) );
  XNR2D2BWP U774 ( .A1(n737), .A2(n603), .ZN(n531) );
  XOR2D1BWP U775 ( .A1(n737), .A2(n603), .Z(n748) );
  ND2D2BWP U776 ( .A1(n525), .A2(n524), .ZN(n526) );
  ND2D2BWP U777 ( .A1(n638), .A2(n594), .ZN(n661) );
  CKND2BWP U778 ( .I(n685), .ZN(n556) );
  CKND2BWP U779 ( .I(n826), .ZN(n802) );
  OAI22D2BWP U780 ( .A1(n828), .A2(n827), .B1(n826), .B2(n825), .ZN(n834) );
  ND2D2BWP U781 ( .A1(n811), .A2(\enc_logic/checksum[14] ), .ZN(n826) );
  ND2D4BWP U782 ( .A1(n708), .A2(n639), .ZN(n657) );
  ND2D4BWP U783 ( .A1(n637), .A2(n958), .ZN(n639) );
  ND2D3BWP U784 ( .A1(n865), .A2(n861), .ZN(n869) );
  IND2D1BWP U785 ( .A1(n840), .B1(n841), .ZN(n845) );
  IND3D2BWP U786 ( .A1(n838), .B1(n837), .B2(n836), .ZN(n841) );
  OAI21D4BWP U787 ( .A1(n684), .A2(n954), .B(n553), .ZN(n686) );
  XOR3D4BWP U788 ( .A1(n711), .A2(n596), .A3(n595), .Z(n705) );
  ND2D2BWP U789 ( .A1(n851), .A2(\enc_logic/checksum[20] ), .ZN(n854) );
  ND2D2BWP U790 ( .A1(n696), .A2(n695), .ZN(n712) );
  ND3D3BWP U791 ( .A1(n695), .A2(n664), .A3(\dec_logic/checksum/check[14] ), 
        .ZN(n696) );
  OAI211D2BWP U792 ( .A1(\dec_logic/checksum/check[21] ), .A2(n684), .B(n555), 
        .C(n554), .ZN(n685) );
  OAI21D4BWP U793 ( .A1(n556), .A2(n514), .B(n952), .ZN(n557) );
  ND2D4BWP U794 ( .A1(n794), .A2(\enc_logic/check/N25 ), .ZN(n1027) );
  NR2D3BWP U795 ( .A1(n783), .A2(n636), .ZN(n794) );
  ND2D2BWP U796 ( .A1(n744), .A2(n743), .ZN(n746) );
  ND2D3BWP U797 ( .A1(n585), .A2(n586), .ZN(n690) );
  ND2D2BWP U798 ( .A1(n583), .A2(n584), .ZN(n586) );
  NR3D2BWP U799 ( .A1(n648), .A2(n647), .A3(n956), .ZN(n680) );
  ND2D4BWP U800 ( .A1(n531), .A2(n751), .ZN(n508) );
  ND2D2BWP U801 ( .A1(n901), .A2(n900), .ZN(n913) );
  CKND2BWP U802 ( .I(n911), .ZN(n620) );
  OAI21D4BWP U803 ( .A1(n522), .A2(\dec_logic/checksum/encoder/N25 ), .B(n521), 
        .ZN(n654) );
  ND3D3BWP U804 ( .A1(n651), .A2(n650), .A3(\dec_logic/checksum/encoder/N25 ), 
        .ZN(n521) );
  ND2D2BWP U805 ( .A1(n559), .A2(n751), .ZN(n540) );
  XNR2D2BWP U806 ( .A1(n689), .A2(n601), .ZN(n737) );
  ND2D2BWP U807 ( .A1(n776), .A2(\dec_logic/checksum/check[10] ), .ZN(n708) );
  CKND2BWP U808 ( .I(n836), .ZN(n840) );
  OAI21D1BWP U809 ( .A1(\enc_logic/checksum[23] ), .A2(
        \enc_logic/checksum[22] ), .B(n865), .ZN(n867) );
  OAI21D2BWP U810 ( .A1(n858), .A2(n857), .B(n967), .ZN(n865) );
  OAI21D4BWP U811 ( .A1(n648), .A2(n647), .B(n956), .ZN(n681) );
  NR3D2BWP U812 ( .A1(n665), .A2(n547), .A3(n546), .ZN(n648) );
  NR3D3BWP U813 ( .A1(n857), .A2(n858), .A3(n967), .ZN(n866) );
  NR2D3BWP U814 ( .A1(n854), .A2(n853), .ZN(n858) );
  ND2D1BWP U815 ( .A1(n688), .A2(n686), .ZN(n601) );
  IND3D2BWP U816 ( .A1(n952), .B1(n686), .B2(n685), .ZN(n688) );
  ND3D3BWP U817 ( .A1(n742), .A2(n741), .A3(n740), .ZN(n751) );
  XNR3D4BWP U818 ( .A1(n799), .A2(n803), .A3(n798), .ZN(n800) );
  AOI21D4BWP U819 ( .A1(n790), .A2(n789), .B(n788), .ZN(n803) );
  IND3D2BWP U820 ( .A1(n542), .B1(n763), .B2(n518), .ZN(n592) );
  IND3D4BWP U821 ( .A1(n542), .B1(n764), .B2(n763), .ZN(n578) );
  OAI21D2BWP U822 ( .A1(n565), .A2(n564), .B(n563), .ZN(n542) );
  AOI21D2BWP U823 ( .A1(n851), .A2(n852), .B(\enc_logic/checksum[20] ), .ZN(
        n857) );
  XOR2D1BWP U824 ( .A1(n628), .A2(n710), .Z(n596) );
  XNR2D1BWP U825 ( .A1(n803), .A2(n971), .ZN(n808) );
  NR2D4BWP U826 ( .A1(n960), .A2(n933), .ZN(n629) );
  INVD1BWP U827 ( .I(n757), .ZN(n758) );
  AOI31D0BWP U828 ( .A1(\dec_logic/three_six_load[9] ), .A2(n508), .A3(n756), 
        .B(n610), .ZN(n604) );
  NR2XD0BWP U829 ( .A1(n508), .A2(\dec_logic/three_six_load[9] ), .ZN(n610) );
  CKND1BWP U830 ( .I(n691), .ZN(n597) );
  CKND0BWP U831 ( .I(n674), .ZN(n598) );
  INR2XD0BWP U832 ( .A1(n678), .B1(n582), .ZN(n674) );
  INVD1BWP U833 ( .I(n845), .ZN(n850) );
  IND2D0BWP U834 ( .A1(n955), .B1(n681), .ZN(n678) );
  ND2D1BWP U835 ( .A1(n668), .A2(n774), .ZN(n670) );
  IND4D0BWP U836 ( .A1(n1018), .B1(n1017), .B2(n1016), .B3(n1015), .ZN(
        \main_control/next_state[2] ) );
  CKND2D0BWP U837 ( .A1(n1014), .A2(n937), .ZN(n1015) );
  CKND0BWP U838 ( .I(n941), .ZN(n1005) );
  INVD1BWP U839 ( .I(n1048), .ZN(n779) );
  NR2D4BWP U840 ( .A1(n759), .A2(data_type[0]), .ZN(n764) );
  NR2XD0BWP U841 ( .A1(\dec_logic/raw[20] ), .A2(n982), .ZN(n608) );
  ND2D1BWP U842 ( .A1(n819), .A2(n914), .ZN(n820) );
  NR2XD0BWP U843 ( .A1(\enc_logic/checksum[18] ), .A2(\enc_logic/checksum[17] ), .ZN(n784) );
  NR2XD0BWP U844 ( .A1(\dec_logic/checksum/check[25] ), .A2(
        \dec_logic/checksum/check[24] ), .ZN(n602) );
  INVD0BWP U845 ( .I(n750), .ZN(n562) );
  CKND2D1BWP U846 ( .A1(n692), .A2(n691), .ZN(n693) );
  MUX2D1BWP U847 ( .I0(n674), .I1(n691), .S(n690), .Z(n673) );
  CKND0BWP U848 ( .I(n690), .ZN(n692) );
  MUX2D1BWP U849 ( .I0(n598), .I1(n597), .S(n690), .Z(n600) );
  MAOI222D0BWP U850 ( .A(n726), .B(n725), .C(n724), .ZN(n727) );
  CKND2D1BWP U851 ( .A1(n677), .A2(n649), .ZN(n691) );
  ND2D0BWP U852 ( .A1(n848), .A2(n845), .ZN(n892) );
  CKND0BWP U853 ( .I(n696), .ZN(n699) );
  IND4D0BWP U854 ( .A1(n940), .B1(n934), .B2(n1007), .B3(n1016), .ZN(
        \main_control/next_state[1] ) );
  INVD1BWP U855 ( .I(n778), .ZN(n640) );
  ND2D1BWP U856 ( .A1(n949), .A2(\dec_logic/checksum/check[25] ), .ZN(n745) );
  CKND0BWP U857 ( .I(n679), .ZN(n549) );
  NR2XD0BWP U858 ( .A1(\enc_logic/checksum[19] ), .A2(\enc_logic/checksum[20] ), .ZN(n846) );
  INVD1BWP U859 ( .I(\dec_logic/checksum/check[10] ), .ZN(n958) );
  XNR2D1BWP U860 ( .A1(\dec_logic/checksum/check[12] ), .A2(
        \dec_logic/checksum/check[11] ), .ZN(n778) );
  INVD1BWP U861 ( .I(\dec_logic/checksum/check[19] ), .ZN(n956) );
  INVD1BWP U862 ( .I(\dec_logic/checksum/check[24] ), .ZN(n951) );
  CKND1BWP U863 ( .I(data_type[1]), .ZN(n759) );
  OAI21D1BWP U864 ( .A1(n538), .A2(n754), .B(n537), .ZN(n518) );
  CKND2D1BWP U865 ( .A1(n737), .A2(n738), .ZN(n732) );
  CKND2D1BWP U866 ( .A1(n824), .A2(n829), .ZN(n825) );
  NR2XD0BWP U867 ( .A1(n1006), .A2(n1005), .ZN(n1019) );
  CKND2D1BWP U868 ( .A1(n640), .A2(n777), .ZN(n527) );
  XNR2D1BWP U869 ( .A1(\dec_logic/checksum/check[14] ), .A2(
        \dec_logic/checksum/check[13] ), .ZN(n777) );
  INVD1BWP U870 ( .I(\dec_logic/checksum/check[15] ), .ZN(n772) );
  INVD1BWP U871 ( .I(\enc_logic/encode_type ), .ZN(n960) );
  INR2XD2BWP U872 ( .A1(n518), .B1(n578), .ZN(n543) );
  CKND2D1BWP U873 ( .A1(n753), .A2(n752), .ZN(n536) );
  XNR2D1BWP U874 ( .A1(n735), .A2(n734), .ZN(n755) );
  XOR2D1BWP U875 ( .A1(n729), .A2(n983), .Z(n752) );
  CKND0BWP U876 ( .I(n723), .ZN(n725) );
  IND2D1BWP U877 ( .A1(n515), .B1(n548), .ZN(n550) );
  CKND2D1BWP U878 ( .A1(n680), .A2(n679), .ZN(n548) );
  OR3D1BWP U879 ( .A1(n973), .A2(tx_data_select[0]), .A3(tx_data_select[1]), 
        .Z(n590) );
  CKND2D1BWP U880 ( .A1(n645), .A2(\dec_logic/checksum/check[16] ), .ZN(n528)
         );
  INVD1BWP U881 ( .I(\dec_logic/checksum/check[16] ), .ZN(n773) );
  NR2D0BWP U882 ( .A1(n949), .A2(n765), .ZN(Packet_To_Node[22]) );
  NR2D0BWP U883 ( .A1(n950), .A2(n765), .ZN(Packet_To_Node[21]) );
  NR2D0BWP U884 ( .A1(n948), .A2(n765), .ZN(Packet_To_Node[23]) );
  AN2XD1BWP U885 ( .A1(n592), .A2(n764), .Z(n765) );
  ND2D2BWP U886 ( .A1(n736), .A2(n951), .ZN(n743) );
  CKND2D1BWP U887 ( .A1(n705), .A2(n704), .ZN(n585) );
  XOR2D0BWP U888 ( .A1(n848), .A2(n850), .Z(n855) );
  OR3D1BWP U889 ( .A1(n937), .A2(n1004), .A3(n1012), .Z(
        \main_control/next_select_sig[2] ) );
  XOR2D1BWP U890 ( .A1(\dec_logic/checksum/check[17] ), .A2(
        \dec_logic/checksum/check[18] ), .Z(n775) );
  INVD1BWP U891 ( .I(\dec_logic/checksum/check[23] ), .ZN(n952) );
  INVD1BWP U892 ( .I(\dec_logic/checksum/check[20] ), .ZN(n955) );
  ND2D1BWP U893 ( .A1(n754), .A2(n755), .ZN(n537) );
  IND2D1BWP U894 ( .A1(n508), .B1(n608), .ZN(n607) );
  CKND2D1BWP U895 ( .A1(n676), .A2(\dec_logic/checksum/check[21] ), .ZN(n672)
         );
  ND2D1BWP U896 ( .A1(n683), .A2(\dec_logic/checksum/check[21] ), .ZN(n554) );
  AOI31D1BWP U897 ( .A1(n682), .A2(\dec_logic/checksum/check[21] ), .A3(n955), 
        .B(\dec_logic/checksum/check[22] ), .ZN(n555) );
  CKND2D0BWP U898 ( .A1(n666), .A2(n773), .ZN(n667) );
  CKND2D0BWP U899 ( .A1(n657), .A2(n768), .ZN(n658) );
  XNR2D0BWP U900 ( .A1(n654), .A2(\dec_logic/checksum/check[7] ), .ZN(n656) );
  INVD1BWP U901 ( .I(\tHandshake/state[0] ), .ZN(n1054) );
  INVD1BWP U902 ( .I(\dec_logic/checksum/check[25] ), .ZN(n950) );
  CKND2D0BWP U903 ( .A1(n911), .A2(n615), .ZN(n614) );
  AOI21D1BWP U904 ( .A1(n752), .A2(n750), .B(n561), .ZN(n563) );
  ND2D1BWP U905 ( .A1(n535), .A2(n534), .ZN(n754) );
  IND2D1BWP U906 ( .A1(n752), .B1(n562), .ZN(n564) );
  CKND1BWP U907 ( .I(n731), .ZN(n714) );
  XNR2D1BWP U908 ( .A1(n717), .A2(n716), .ZN(n731) );
  OAI22D0BWP U909 ( .A1(n867), .A2(n866), .B1(n966), .B2(n965), .ZN(n868) );
  CKND1BWP U910 ( .I(n678), .ZN(n552) );
  NR2D1BWP U911 ( .A1(n646), .A2(\dec_logic/checksum/check[16] ), .ZN(n546) );
  AOI21D0BWP U912 ( .A1(\enc_logic/check/N25 ), .A2(n795), .B(n794), .ZN(n930)
         );
  AOI21D0BWP U913 ( .A1(\dec_logic/checksum/encoder/N25 ), .A2(n651), .B(n707), 
        .ZN(n652) );
  INVD1BWP U914 ( .I(n775), .ZN(n645) );
  CKND0BWP U915 ( .I(n650), .ZN(n707) );
  INVD1BWP U916 ( .I(\dec_logic/checksum/check[21] ), .ZN(n954) );
  INVD1BWP U917 ( .I(\dec_logic/checksum/check[26] ), .ZN(n949) );
  OA21D1BWP U918 ( .A1(n912), .A2(n1041), .B(n915), .Z(n616) );
  AOI21D1BWP U919 ( .A1(n738), .A2(n950), .B(n949), .ZN(n741) );
  XOR2D1BWP U920 ( .A1(n731), .A2(n730), .Z(n735) );
  ND2D1BWP U921 ( .A1(n694), .A2(n693), .ZN(n717) );
  CKND1BWP U922 ( .I(n675), .ZN(n599) );
  NR2D1BWP U923 ( .A1(n672), .A2(n683), .ZN(n675) );
  NR2D1BWP U924 ( .A1(n705), .A2(n704), .ZN(n726) );
  IND3D1BWP U925 ( .A1(n528), .B1(n628), .B2(n646), .ZN(n529) );
  INR2D1BWP U926 ( .A1(n939), .B1(n577), .ZN(n517) );
  CKND2D1BWP U927 ( .A1(n805), .A2(n922), .ZN(n807) );
  OAI22D0BWP U928 ( .A1(n78), .A2(n590), .B1(n950), .B2(n631), .ZN(
        data_to_tx[45]) );
  OAI22D0BWP U929 ( .A1(n80), .A2(n590), .B1(n948), .B2(n631), .ZN(
        data_to_tx[47]) );
  OAI22D0BWP U930 ( .A1(n79), .A2(n590), .B1(n949), .B2(n631), .ZN(
        data_to_tx[46]) );
  INVD3BWP U931 ( .I(n978), .ZN(n631) );
  INVD1BWP U932 ( .I(buf_to_mux[25]), .ZN(n781) );
  INVD1BWP U933 ( .I(tx_data_select[2]), .ZN(n973) );
  INVD1BWP U934 ( .I(\dec_logic/checksum/check[27] ), .ZN(n948) );
  INVD1BWP U935 ( .I(\dec_logic/three_six_load[10] ), .ZN(n987) );
  IND2D1BWP U936 ( .A1(n519), .B1(n517), .ZN(\main_control/next_select_sig[0] ) );
  MOAI22D0BWP U937 ( .A1(n764), .A2(n761), .B1(n543), .B2(
        \dec_logic/checksum/check[12] ), .ZN(Packet_To_Node[8]) );
  MOAI22D0BWP U938 ( .A1(n764), .A2(n766), .B1(n543), .B2(
        \dec_logic/checksum/check[17] ), .ZN(Packet_To_Node[13]) );
  MOAI22D0BWP U939 ( .A1(n764), .A2(n980), .B1(n543), .B2(
        \dec_logic/checksum/check[11] ), .ZN(Packet_To_Node[7]) );
  AOI21D1BWP U940 ( .A1(n508), .A2(n609), .B(n758), .ZN(n606) );
  OAI22D1BWP U941 ( .A1(n736), .A2(n602), .B1(n950), .B2(n951), .ZN(n603) );
  CKND1BWP U942 ( .I(n705), .ZN(n583) );
  CKND0BWP U943 ( .I(n657), .ZN(n659) );
  XOR3D1BWP U944 ( .A1(n708), .A2(n709), .A3(n706), .Z(n711) );
  CKND1BWP U945 ( .I(n800), .ZN(n801) );
  AO22D0BWP U946 ( .A1(\dec_logic/three_six_load[0] ), .A2(n978), .B1(
        buf_to_mux[3]), .B2(n513), .Z(data_to_tx[3]) );
  AO22D0BWP U947 ( .A1(\dec_logic/raw[2] ), .A2(n978), .B1(buf_to_mux[2]), 
        .B2(n513), .Z(data_to_tx[2]) );
  NR2D0BWP U948 ( .A1(n965), .A2(n964), .ZN(n1036) );
  INVD1BWP U949 ( .I(\enc_logic/checksum[22] ), .ZN(n966) );
  INVD1BWP U950 ( .I(\dec_logic/three_six_load[11] ), .ZN(n983) );
  INVD1BWP U951 ( .I(\enc_logic/checksum[17] ), .ZN(n970) );
  INVD1BWP U952 ( .I(\enc_logic/checksum[21] ), .ZN(n967) );
  INVD1BWP U953 ( .I(\enc_logic/checksum[7] ), .ZN(n971) );
  AN2XD1BWP U954 ( .A1(n592), .A2(n576), .Z(n519) );
  ND2D1BWP U955 ( .A1(n749), .A2(n756), .ZN(n753) );
  ND2D1BWP U956 ( .A1(n728), .A2(n727), .ZN(n729) );
  AOI31D1BWP U957 ( .A1(n732), .A2(n733), .A3(n715), .B(n714), .ZN(n750) );
  ND3D1BWP U958 ( .A1(n737), .A2(n743), .A3(\dec_logic/checksum/check[25] ), 
        .ZN(n733) );
  CKND1BWP U959 ( .I(n852), .ZN(n853) );
  CKND1BWP U960 ( .I(n668), .ZN(n669) );
  ND2D1BWP U961 ( .A1(n701), .A2(n667), .ZN(n668) );
  AOI21D0BWP U962 ( .A1(n824), .A2(n826), .B(n818), .ZN(n891) );
  CKND1BWP U963 ( .I(n934), .ZN(n516) );
  MOAI22D0BWP U964 ( .A1(n767), .A2(n631), .B1(n513), .B2(buf_to_mux[29]), 
        .ZN(data_to_tx[29]) );
  MOAI22D0BWP U965 ( .A1(n766), .A2(n631), .B1(n513), .B2(buf_to_mux[28]), 
        .ZN(data_to_tx[28]) );
  MOAI22D0BWP U966 ( .A1(n768), .A2(n631), .B1(n513), .B2(buf_to_mux[31]), 
        .ZN(data_to_tx[31]) );
  MOAI22D0BWP U967 ( .A1(n773), .A2(n631), .B1(n513), .B2(buf_to_mux[36]), 
        .ZN(data_to_tx[36]) );
  MOAI22D0BWP U968 ( .A1(n774), .A2(n631), .B1(n513), .B2(buf_to_mux[37]), 
        .ZN(data_to_tx[37]) );
  MOAI22D0BWP U969 ( .A1(n769), .A2(n631), .B1(n513), .B2(buf_to_mux[32]), 
        .ZN(data_to_tx[32]) );
  MOAI22D0BWP U970 ( .A1(n771), .A2(n631), .B1(n513), .B2(buf_to_mux[34]), 
        .ZN(data_to_tx[34]) );
  MOAI22D0BWP U971 ( .A1(n772), .A2(n631), .B1(n513), .B2(buf_to_mux[35]), 
        .ZN(data_to_tx[35]) );
  MOAI22D0BWP U972 ( .A1(n770), .A2(n631), .B1(n513), .B2(buf_to_mux[33]), 
        .ZN(data_to_tx[33]) );
  XNR2D0BWP U973 ( .A1(n804), .A2(n803), .ZN(n805) );
  ND2D8BWP U974 ( .A1(TX_Data_Valid), .A2(n1054), .ZN(\tHandshake/N12 ) );
  ND2D1BWP U975 ( .A1(tx_data_select[1]), .A2(n973), .ZN(n977) );
  NR2D0BWP U976 ( .A1(n968), .A2(n967), .ZN(n1031) );
  CKND0BWP U977 ( .I(n793), .ZN(n795) );
  ND4D0BWP U978 ( .A1(n1011), .A2(n1010), .A3(n1009), .A4(n1008), .ZN(n1013)
         );
  NR2D1BWP U979 ( .A1(\dec_logic/checksum/check[21] ), .A2(
        \dec_logic/checksum/check[20] ), .ZN(n679) );
  INVD1BWP U980 ( .I(\dec_logic/checksum/check[8] ), .ZN(n766) );
  INVD1BWP U981 ( .I(\dec_logic/checksum/check[9] ), .ZN(n767) );
  INVD1BWP U982 ( .I(\dec_logic/checksum/check[6] ), .ZN(n959) );
  INVD1BWP U983 ( .I(\dec_logic/checksum/check[13] ), .ZN(n770) );
  INVD1BWP U984 ( .I(\dec_logic/three_six_load[9] ), .ZN(n982) );
  INVD1BWP U985 ( .I(\enc_logic/checksum[11] ), .ZN(n922) );
  INVD1BWP U986 ( .I(\enc_logic/checksum[8] ), .ZN(n927) );
  OA21D1BWP U987 ( .A1(n756), .A2(\dec_logic/three_six_load[9] ), .B(n758), 
        .Z(n605) );
  OAI31D1BWP U988 ( .A1(\dec_logic/checksum/check[27] ), .A2(
        \dec_logic/raw[20] ), .A3(n540), .B(n541), .ZN(n561) );
  CKND0BWP U989 ( .I(n898), .ZN(n883) );
  OA21D1BWP U990 ( .A1(n745), .A2(n746), .B(n539), .Z(n559) );
  OAI21D1BWP U991 ( .A1(n746), .A2(n745), .B(n539), .ZN(n581) );
  ND2D1BWP U992 ( .A1(n703), .A2(n702), .ZN(n723) );
  CKND0BWP U993 ( .I(n695), .ZN(n700) );
  CKND1BWP U994 ( .I(n834), .ZN(n833) );
  NR2XD0BWP U995 ( .A1(n830), .A2(n831), .ZN(n821) );
  ND2D1BWP U996 ( .A1(n663), .A2(n770), .ZN(n664) );
  IND2D1BWP U997 ( .A1(n622), .B1(n623), .ZN(n621) );
  CKND0BWP U998 ( .I(n662), .ZN(n663) );
  ND2D1BWP U999 ( .A1(n662), .A2(\dec_logic/checksum/check[13] ), .ZN(n695) );
  AOI22D1BWP U1000 ( .A1(n659), .A2(\dec_logic/checksum/check[11] ), .B1(n658), 
        .B2(\dec_logic/checksum/check[12] ), .ZN(n710) );
  CKND1BWP U1001 ( .I(n711), .ZN(n697) );
  AOI32D1BWP U1002 ( .A1(\enc_logic/checksum[22] ), .A2(n1037), .A3(n1036), 
        .B1(n1042), .B2(n1037), .ZN(n435) );
  AOI21D1BWP U1003 ( .A1(n941), .A2(n1006), .B(n1018), .ZN(n934) );
  AO22D0BWP U1004 ( .A1(n629), .A2(n930), .B1(n933), .B2(buf_to_mux[1]), .Z(
        n472) );
  AO22D0BWP U1005 ( .A1(n629), .A2(\enc_logic/checksum[15] ), .B1(n933), .B2(
        buf_to_mux[23]), .Z(n591) );
  AO22D0BWP U1006 ( .A1(n629), .A2(\enc_logic/checksum[5] ), .B1(n933), .B2(
        buf_to_mux[4]), .Z(n469) );
  AO22D0BWP U1007 ( .A1(n629), .A2(\enc_logic/check/N25 ), .B1(n933), .B2(
        buf_to_mux[3]), .Z(n470) );
  AO22D0BWP U1008 ( .A1(n629), .A2(\enc_logic/checksum[6] ), .B1(n933), .B2(
        buf_to_mux[5]), .Z(n468) );
  AO22D0BWP U1009 ( .A1(n629), .A2(\enc_logic/checksum[10] ), .B1(n933), .B2(
        buf_to_mux[15]), .Z(n458) );
  IND2D1BWP U1010 ( .A1(\tHandshake/state[0] ), .B1(n940), .ZN(n623) );
  AO22D0BWP U1011 ( .A1(n629), .A2(\enc_logic/checksum[12] ), .B1(n933), .B2(
        buf_to_mux[17]), .Z(n456) );
  XNR2D1BWP U1012 ( .A1(n653), .A2(n652), .ZN(n709) );
  INVD1BWP U1013 ( .I(n942), .ZN(n1047) );
  CKND2D0BWP U1014 ( .A1(n946), .A2(n6), .ZN(n1000) );
  INR2D1BWP U1015 ( .A1(n777), .B1(n640), .ZN(n524) );
  INVD1BWP U1016 ( .I(\rHandshake/state[1] ), .ZN(n1043) );
  ND2D1BWP U1017 ( .A1(\dec_logic/checksum/check[6] ), .A2(
        \dec_logic/checksum/check[5] ), .ZN(n650) );
  INVD1BWP U1018 ( .I(\enc_logic/checksum[18] ), .ZN(n838) );
  INVD1BWP U1019 ( .I(\enc_logic/checksum[23] ), .ZN(n965) );
  INVD1BWP U1020 ( .I(\enc_logic/checksum[5] ), .ZN(n783) );
  INVD1BWP U1021 ( .I(\enc_logic/checksum[16] ), .ZN(n819) );
  INVD1BWP U1022 ( .I(\enc_logic/checksum[19] ), .ZN(n969) );
  INVD1BWP U1023 ( .I(\dec_logic/checksum/check[22] ), .ZN(n953) );
  INVD1BWP U1024 ( .I(\enc_logic/checksum[26] ), .ZN(n962) );
  INVD1BWP U1025 ( .I(\dec_logic/three_six_load[7] ), .ZN(n980) );
  INVD1BWP U1026 ( .I(\enc_logic/checksum[15] ), .ZN(n914) );
  INVD1BWP U1027 ( .I(\enc_logic/checksum[13] ), .ZN(n916) );
  INVD1BWP U1028 ( .I(\dec_logic/three_six_load[4] ), .ZN(n979) );
  INVD1BWP U1029 ( .I(\dec_logic/checksum/check[7] ), .ZN(n972) );
  INVD1BWP U1030 ( .I(\dec_logic/checksum/check[18] ), .ZN(n957) );
  INVD1BWP U1031 ( .I(\dec_logic/three_six_load[1] ), .ZN(n993) );
  INVD1BWP U1032 ( .I(\dec_logic/checksum/check[14] ), .ZN(n771) );
  OAI21D1BWP U1033 ( .A1(n617), .A2(n1041), .B(n618), .ZN(n451) );
  CKND2D0BWP U1034 ( .A1(n620), .A2(n932), .ZN(n915) );
  CKND0BWP U1035 ( .I(n902), .ZN(n905) );
  IND2D1BWP U1036 ( .A1(n560), .B1(n540), .ZN(n541) );
  INR2D0BWP U1037 ( .A1(n932), .B1(n907), .ZN(n615) );
  CKND1BWP U1038 ( .I(n872), .ZN(n874) );
  CKND0BWP U1039 ( .I(n730), .ZN(n715) );
  AOI31D0BWP U1040 ( .A1(\enc_logic/checksum[22] ), .A2(n861), .A3(n865), .B(
        n859), .ZN(n871) );
  AOI21D0BWP U1041 ( .A1(n869), .A2(n966), .B(n965), .ZN(n859) );
  AOI21D0BWP U1042 ( .A1(\enc_logic/checksum[20] ), .A2(n852), .B(n844), .ZN(
        n856) );
  CKND1BWP U1043 ( .I(n860), .ZN(n862) );
  CKND0BWP U1044 ( .I(n851), .ZN(n844) );
  XNR2D1BWP U1045 ( .A1(n823), .A2(n822), .ZN(n848) );
  OAI21D1BWP U1046 ( .A1(n835), .A2(n834), .B(n970), .ZN(n837) );
  CKND1BWP U1047 ( .I(n713), .ZN(n698) );
  NR2D1BWP U1048 ( .A1(n711), .A2(n710), .ZN(n718) );
  CKND1BWP U1049 ( .I(n831), .ZN(n828) );
  CKXOR2D1BWP U1050 ( .A1(n812), .A2(n814), .Z(n817) );
  AOI211D1BWP U1051 ( .A1(n933), .A2(buf_to_mux[31]), .B(n1030), .C(n1029), 
        .ZN(n780) );
  AOI211D1BWP U1052 ( .A1(n933), .A2(buf_to_mux[37]), .B(n1034), .C(n1033), 
        .ZN(n1035) );
  AOI211D1BWP U1053 ( .A1(n933), .A2(buf_to_mux[43]), .B(n1039), .C(n1038), 
        .ZN(n1040) );
  OAI211D0BWP U1054 ( .A1(n789), .A2(n1041), .B(n786), .C(n785), .ZN(n449) );
  OAI31D0BWP U1055 ( .A1(\main_control/state[1] ), .A2(n943), .A3(n1000), .B(
        n939), .ZN(n1001) );
  OAI211D0BWP U1056 ( .A1(n1022), .A2(n101), .B(n928), .C(n929), .ZN(n466) );
  MAOI22D0BWP U1057 ( .A1(\tHandshake/state[0] ), .A2(n940), .B1(n632), .B2(
        n1000), .ZN(n939) );
  AO222D0BWP U1058 ( .A1(n933), .A2(buf_to_mux[27]), .B1(
        \enc_logic/checksum[16] ), .B2(n629), .C1(\enc_logic/checksum[7] ), 
        .C2(n932), .Z(n446) );
  AO222D0BWP U1059 ( .A1(n933), .A2(buf_to_mux[28]), .B1(
        \enc_logic/checksum[17] ), .B2(n629), .C1(\enc_logic/checksum[8] ), 
        .C2(n932), .Z(n445) );
  AO222D0BWP U1060 ( .A1(n933), .A2(buf_to_mux[33]), .B1(
        \enc_logic/checksum[19] ), .B2(n629), .C1(\enc_logic/checksum[13] ), 
        .C2(n932), .Z(n440) );
  AOI31D0BWP U1061 ( .A1(n941), .A2(n943), .A3(n1013), .B(n1012), .ZN(n1017)
         );
  AO222D0BWP U1062 ( .A1(n933), .A2(buf_to_mux[41]), .B1(
        \enc_logic/checksum[21] ), .B2(n932), .C1(n629), .C2(
        \enc_logic/checksum[24] ), .Z(n432) );
  CKND2D1BWP U1063 ( .A1(n629), .A2(n914), .ZN(n918) );
  AO222D0BWP U1064 ( .A1(n933), .A2(buf_to_mux[34]), .B1(
        \enc_logic/checksum[20] ), .B2(n629), .C1(\enc_logic/checksum[14] ), 
        .C2(n932), .Z(n439) );
  AO222D0BWP U1065 ( .A1(n933), .A2(buf_to_mux[29]), .B1(
        \enc_logic/checksum[18] ), .B2(n629), .C1(\enc_logic/checksum[9] ), 
        .C2(n932), .Z(n444) );
  AO222D0BWP U1066 ( .A1(n933), .A2(buf_to_mux[35]), .B1(
        \enc_logic/checksum[21] ), .B2(n629), .C1(\enc_logic/checksum[15] ), 
        .C2(n932), .Z(n438) );
  AO222D0BWP U1067 ( .A1(n933), .A2(buf_to_mux[39]), .B1(
        \enc_logic/checksum[19] ), .B2(n932), .C1(n629), .C2(
        \enc_logic/checksum[22] ), .Z(n434) );
  ND3D0BWP U1068 ( .A1(n629), .A2(n784), .A3(n819), .ZN(n785) );
  AO222D0BWP U1069 ( .A1(n933), .A2(buf_to_mux[40]), .B1(
        \enc_logic/checksum[20] ), .B2(n932), .C1(n629), .C2(
        \enc_logic/checksum[23] ), .Z(n433) );
  CKND1BWP U1070 ( .I(n805), .ZN(n806) );
  ND3D0BWP U1071 ( .A1(n936), .A2(\main_control/state[3] ), .A3(n947), .ZN(
        n572) );
  CKND2D0BWP U1072 ( .A1(n933), .A2(buf_to_mux[24]), .ZN(n786) );
  AO31D0BWP U1073 ( .A1(n938), .A2(n942), .A3(n945), .B(n1019), .Z(
        \main_control/next_state[3] ) );
  AOI22D0BWP U1074 ( .A1(n1054), .A2(n1052), .B1(n1053), .B2(n1051), .ZN(
        \tHandshake/next_state[0] ) );
  NR2D1BWP U1075 ( .A1(n1020), .A2(Packet_From_Node_Valid), .ZN(n940) );
  OAI22D0BWP U1076 ( .A1(\main_control/state[3] ), .A2(n1049), .B1(n1020), 
        .B2(n1003), .ZN(n1012) );
  OA32D0BWP U1077 ( .A1(n1053), .A2(\tHandshake/state[0] ), .A3(TX_Data_Ready), 
        .B1(TX_Data_Valid), .B2(n1053), .Z(\tHandshake/next_state[1] ) );
  CKND0BWP U1078 ( .I(n803), .ZN(n792) );
  NR2D1BWP U1079 ( .A1(n1005), .A2(n1002), .ZN(n936) );
  CKND0BWP U1080 ( .I(n635), .ZN(n1020) );
  AO21D0BWP U1081 ( .A1(n779), .A2(n945), .B(n1004), .Z(n577) );
  CKND2D1BWP U1082 ( .A1(n938), .A2(n1047), .ZN(n1016) );
  AOI21D0BWP U1083 ( .A1(n1050), .A2(n1049), .B(n1054), .ZN(n1053) );
  OAI21D0BWP U1084 ( .A1(\rHandshake/state[1] ), .A2(n1044), .B(n1047), .ZN(
        RX_Data_Ready) );
  NR2D8BWP U1085 ( .A1(n635), .A2(n634), .ZN(n933) );
  IAO21D0BWP U1086 ( .A1(\dec_logic/token ), .A2(tx_data_select[0]), .B(n977), 
        .ZN(data_to_tx[54]) );
  AO21D0BWP U1087 ( .A1(n945), .A2(n1048), .B(\main_control/state[2] ), .Z(
        n1050) );
  OAI31D0BWP U1088 ( .A1(\main_control/state[1] ), .A2(\main_control/state[3] ), .A3(n1000), .B(n633), .ZN(n1004) );
  INR2XD0BWP U1089 ( .A1(\main_control/state[2] ), .B1(n632), .ZN(n938) );
  NR2D0BWP U1090 ( .A1(n1048), .A2(n945), .ZN(Packet_To_Node_Valid) );
  NR2D0BWP U1091 ( .A1(n1049), .A2(n6), .ZN(Core_Load_Ack) );
  CKND0BWP U1092 ( .I(\main_control/state[3] ), .ZN(n943) );
  INR2D0BWP U1093 ( .A1(n998), .B1(\main_control/state[1] ), .ZN(n941) );
  CKND2D0BWP U1094 ( .A1(tx_data_select[0]), .A2(n973), .ZN(n975) );
  OAI21D0BWP U1095 ( .A1(n947), .A2(n999), .B(\main_control/state[3] ), .ZN(
        n1006) );
  NR2D0BWP U1096 ( .A1(n946), .A2(n944), .ZN(n1045) );
  CKND2D0BWP U1097 ( .A1(\main_control/state[1] ), .A2(\main_control/state[3] ), .ZN(n1048) );
  NR2D1BWP U1098 ( .A1(n1043), .A2(\rHandshake/state[0] ), .ZN(n942) );
  CKND2D0BWP U1099 ( .A1(\main_control/state[2] ), .A2(\main_control/state[3] ), .ZN(n633) );
  XNR4D1BWP U1100 ( .A1(\dec_logic/three_six_load[0] ), .A2(\dec_logic/raw[0] ), .A3(\dec_logic/raw[2] ), .A4(n994), .ZN(n995) );
  XNR4D1BWP U1101 ( .A1(\dec_logic/three_six_load[6] ), .A2(
        \dec_logic/raw[12] ), .A3(\dec_logic/raw[14] ), .A4(n981), .ZN(n990)
         );
  NR2D1BWP U1102 ( .A1(n958), .A2(n640), .ZN(n523) );
  NR2D1BWP U1103 ( .A1(n640), .A2(\dec_logic/checksum/check[10] ), .ZN(n593)
         );
  CKND0BWP U1104 ( .I(\main_control/state[2] ), .ZN(n946) );
  CKND0BWP U1105 ( .I(TX_Data_Valid), .ZN(n1051) );
  CKND1BWP U1106 ( .I(n829), .ZN(n827) );
  NR2D1BWP U1107 ( .A1(\dec_logic/token ), .A2(n999), .ZN(n1014) );
  XOR3D0BWP U1108 ( .A1(n566), .A2(n778), .A3(n777), .Z(n567) );
  AOI22D0BWP U1109 ( .A1(\dec_logic/checksum/check[26] ), .A2(
        \dec_logic/checksum/check[22] ), .B1(n953), .B2(n949), .ZN(n991) );
  AOI22D0BWP U1110 ( .A1(\dec_logic/checksum/check[25] ), .A2(
        \dec_logic/checksum/check[27] ), .B1(n948), .B2(n950), .ZN(n997) );
  NR2D1BWP U1111 ( .A1(\enc_logic/checksum[8] ), .A2(\enc_logic/checksum[9] ), 
        .ZN(n791) );
  NR2D1BWP U1112 ( .A1(\dec_logic/checksum/check[25] ), .A2(
        \dec_logic/checksum/check[26] ), .ZN(n558) );
  NR2D1BWP U1113 ( .A1(\dec_logic/raw[20] ), .A2(\dec_logic/three_six_load[9] ), .ZN(n609) );
  XNR2D1BWP U1114 ( .A1(\enc_logic/checksum[15] ), .A2(
        \enc_logic/checksum[16] ), .ZN(n829) );
  MAOI22D0BWP U1115 ( .A1(n543), .A2(n760), .B1(n764), .B2(
        \dec_logic/three_six_load[0] ), .ZN(Packet_To_Node[0]) );
  OAI21D1BWP U1116 ( .A1(n681), .A2(n549), .B(\dec_logic/checksum/check[22] ), 
        .ZN(n515) );
  XNR2D1BWP U1117 ( .A1(n520), .A2(\dec_logic/checksum/check[6] ), .ZN(n522)
         );
  NR3D0BWP U1118 ( .A1(n540), .A2(n948), .A3(n987), .ZN(n532) );
  MUX2ND0BWP U1119 ( .I0(n987), .I1(n532), .S(n508), .ZN(n534) );
  MUX2ND0BWP U1120 ( .I0(\dec_logic/three_six_load[10] ), .I1(n533), .S(n756), 
        .ZN(n535) );
  OAI22D1BWP U1121 ( .A1(n544), .A2(n771), .B1(n764), .B2(n987), .ZN(
        Packet_To_Node[10]) );
  OAI22D1BWP U1122 ( .A1(n544), .A2(n772), .B1(n764), .B2(n983), .ZN(
        Packet_To_Node[11]) );
  OAI22D1BWP U1123 ( .A1(n544), .A2(n954), .B1(n764), .B2(n772), .ZN(
        Packet_To_Node[17]) );
  OAI22D1BWP U1124 ( .A1(n544), .A2(n766), .B1(n764), .B2(n979), .ZN(
        Packet_To_Node[4]) );
  OAI22D1BWP U1125 ( .A1(n762), .A2(n951), .B1(n764), .B2(n954), .ZN(
        Packet_To_Node[20]) );
  OAI22D1BWP U1126 ( .A1(n544), .A2(n767), .B1(n764), .B2(n579), .ZN(
        Packet_To_Node[5]) );
  OAI22D1BWP U1127 ( .A1(n544), .A2(n958), .B1(n764), .B2(n580), .ZN(
        Packet_To_Node[6]) );
  XNR2D1BWP U1128 ( .A1(\dec_logic/checksum/check[27] ), .A2(
        \dec_logic/raw[20] ), .ZN(n560) );
  XNR2D1BWP U1129 ( .A1(\dec_logic/checksum/check[15] ), .A2(
        \dec_logic/checksum/check[10] ), .ZN(n566) );
  OAI22D1BWP U1130 ( .A1(\dec_logic/three_six_load[8] ), .A2(n990), .B1(n988), 
        .B2(n989), .ZN(n570) );
  OAI22D1BWP U1131 ( .A1(n997), .A2(n996), .B1(\dec_logic/raw[1] ), .B2(n995), 
        .ZN(n571) );
  NR3D0BWP U1132 ( .A1(n569), .A2(n568), .A3(n567), .ZN(n573) );
  AOI221D1BWP U1133 ( .A1(\dec_logic/three_six_load[8] ), .A2(n990), .B1(n989), 
        .B2(n988), .C(n570), .ZN(n574) );
  AOI221D1BWP U1134 ( .A1(n997), .A2(n996), .B1(n995), .B2(\dec_logic/raw[1] ), 
        .C(n571), .ZN(n575) );
  AOI31D1BWP U1135 ( .A1(n575), .A2(n574), .A3(n573), .B(n572), .ZN(n576) );
  INVD1BWP U1136 ( .I(\dec_logic/three_six_load[5] ), .ZN(n579) );
  INVD1BWP U1137 ( .I(\dec_logic/three_six_load[6] ), .ZN(n580) );
  CKND2BWP U1138 ( .I(n629), .ZN(n1042) );
  ND2D1BWP U1139 ( .A1(n1047), .A2(n1046), .ZN(\rHandshake/next_state[1] ) );
  ND2D1BWP U1140 ( .A1(TX_Data_Ready), .A2(n1051), .ZN(n1052) );
  INVD1BWP U1141 ( .I(\dec_logic/checksum/check[12] ), .ZN(n769) );
  INVD1BWP U1142 ( .I(Packet_From_Node_Valid), .ZN(n1003) );
  INVD1BWP U1143 ( .I(buf_to_mux[7]), .ZN(n1022) );
  ND2D1BWP U1144 ( .A1(\enc_logic/checksum[11] ), .A2(\enc_logic/checksum[10] ), .ZN(n920) );
  INVD1BWP U1145 ( .I(buf_to_mux[13]), .ZN(n1024) );
  ND2D1BWP U1146 ( .A1(n976), .A2(n975), .ZN(data_to_tx[53]) );
  ND2D1BWP U1147 ( .A1(n974), .A2(n975), .ZN(data_to_tx[52]) );
  INVD1BWP U1148 ( .I(\enc_logic/checksum[12] ), .ZN(n923) );
  INVD1BWP U1149 ( .I(\enc_logic/checksum[10] ), .ZN(n924) );
  INVD1BWP U1150 ( .I(buf_to_mux[19]), .ZN(n1026) );
  ND2D1BWP U1151 ( .A1(\enc_logic/checksum[18] ), .A2(\enc_logic/checksum[17] ), .ZN(n1028) );
  ND2D1BWP U1152 ( .A1(\enc_logic/checksum[13] ), .A2(\enc_logic/checksum[14] ), .ZN(n917) );
  INVD1BWP U1153 ( .I(\dec_logic/checksum/encoder/N25 ), .ZN(n760) );
  INVD1BWP U1154 ( .I(\dec_logic/three_six_load[8] ), .ZN(n761) );
  INVD1BWP U1155 ( .I(n932), .ZN(n1041) );
  INVD1BWP U1156 ( .I(\enc_logic/checksum[27] ), .ZN(n961) );
  ND2D1BWP U1157 ( .A1(n899), .A2(n962), .ZN(n901) );
  ND2D1BWP U1158 ( .A1(n896), .A2(n963), .ZN(n897) );
  INVD1BWP U1159 ( .I(\enc_logic/checksum[25] ), .ZN(n963) );
  ND2D1BWP U1160 ( .A1(n874), .A2(n873), .ZN(n882) );
  INVD1BWP U1161 ( .I(\enc_logic/checksum[24] ), .ZN(n964) );
  INVD1BWP U1162 ( .I(\enc_logic/checksum[20] ), .ZN(n968) );
  ND2D1BWP U1163 ( .A1(n809), .A2(\enc_logic/checksum[10] ), .ZN(n814) );
  ND2D1BWP U1164 ( .A1(n802), .A2(n824), .ZN(n810) );
  INVD1BWP U1165 ( .I(\enc_logic/checksum[6] ), .ZN(n636) );
  INVD1BWP U1166 ( .I(\enc_logic/check/N25 ), .ZN(n789) );
  INVD1BWP U1167 ( .I(\dec_logic/three_six_load[2] ), .ZN(n626) );
  INVD1BWP U1168 ( .I(\dec_logic/three_six_load[3] ), .ZN(n627) );
  INVD1BWP U1169 ( .I(r_addr[3]), .ZN(n1011) );
  INVD1BWP U1170 ( .I(r_addr[1]), .ZN(n1010) );
  INVD1BWP U1171 ( .I(r_addr[2]), .ZN(n1009) );
  INVD1BWP U1172 ( .I(r_addr[0]), .ZN(n1008) );
  INVD1BWP U1173 ( .I(\dec_logic/raw[20] ), .ZN(n985) );
  ND2D1BWP U1174 ( .A1(n733), .A2(n732), .ZN(n734) );
  ND2D1BWP U1175 ( .A1(n713), .A2(n712), .ZN(n719) );
  INVD1BWP U1176 ( .I(\dec_logic/checksum/check[17] ), .ZN(n774) );
  INVD1BWP U1177 ( .I(\dec_logic/checksum/check[11] ), .ZN(n768) );
  ND2D1BWP U1178 ( .A1(n767), .A2(n766), .ZN(n655) );
  ND2D1BWP U1179 ( .A1(n510), .A2(\dec_logic/checksum/check[7] ), .ZN(n653) );
  ND2D1BWP U1180 ( .A1(n637), .A2(n593), .ZN(n594) );
  ND2D1BWP U1181 ( .A1(data_type[0]), .A2(data_type[1]), .ZN(n999) );
  INVD1BWP U1182 ( .I(\dec_logic/token ), .ZN(n947) );
  OAI211D1BWP U1183 ( .A1(n1045), .A2(n1044), .B(RX_Data_Valid), .C(n1043), 
        .ZN(\rHandshake/next_state[0] ) );
  AOI32D1BWP U1184 ( .A1(\rHandshake/state[0] ), .A2(RX_Data_Valid), .A3(n1045), .B1(\rHandshake/state[1] ), .B2(RX_Data_Valid), .ZN(n1046) );
  AOI211XD0BWP U1185 ( .A1(Core_Load_Ack), .A2(n943), .B(n936), .C(n935), .ZN(
        n1007) );
  AO22D1BWP U1186 ( .A1(\dec_logic/raw[8] ), .A2(n630), .B1(buf_to_mux[8]), 
        .B2(n513), .Z(data_to_tx[8]) );
  AO22D1BWP U1187 ( .A1(\dec_logic/three_six_load[3] ), .A2(n630), .B1(
        buf_to_mux[9]), .B2(n513), .Z(data_to_tx[9]) );
  AO22D1BWP U1188 ( .A1(\dec_logic/raw[0] ), .A2(n630), .B1(buf_to_mux[0]), 
        .B2(n513), .Z(data_to_tx[0]) );
  AO22D1BWP U1189 ( .A1(\dec_logic/three_six_load[2] ), .A2(n630), .B1(
        buf_to_mux[5]), .B2(n513), .Z(data_to_tx[5]) );
  AO22D1BWP U1190 ( .A1(\dec_logic/raw[6] ), .A2(n630), .B1(buf_to_mux[6]), 
        .B2(n513), .Z(data_to_tx[6]) );
  AO22D1BWP U1191 ( .A1(address[3]), .A2(n630), .B1(n513), .B2(buf_to_mux[51]), 
        .Z(data_to_tx[51]) );
  AO22D1BWP U1192 ( .A1(address[1]), .A2(n630), .B1(n513), .B2(buf_to_mux[49]), 
        .Z(data_to_tx[49]) );
  AO22D1BWP U1193 ( .A1(address[0]), .A2(n630), .B1(n513), .B2(buf_to_mux[48]), 
        .Z(data_to_tx[48]) );
  AO22D1BWP U1194 ( .A1(address[2]), .A2(n630), .B1(n513), .B2(buf_to_mux[50]), 
        .Z(data_to_tx[50]) );
  AO21D1BWP U1195 ( .A1(n1019), .A2(n1002), .B(n1001), .Z(
        \main_control/next_select_sig[1] ) );
  OAI211D1BWP U1196 ( .A1(n971), .A2(n927), .B(n629), .C(n926), .ZN(n928) );
  AO22D1BWP U1197 ( .A1(n933), .A2(buf_to_mux[2]), .B1(n629), .B2(n1027), .Z(
        n471) );
  AO22D1BWP U1198 ( .A1(\dec_logic/raw[12] ), .A2(n630), .B1(buf_to_mux[12]), 
        .B2(n513), .Z(data_to_tx[12]) );
  AO22D1BWP U1199 ( .A1(\dec_logic/three_six_load[6] ), .A2(n630), .B1(
        buf_to_mux[15]), .B2(n513), .Z(data_to_tx[15]) );
  AO22D1BWP U1200 ( .A1(\dec_logic/three_six_load[5] ), .A2(n630), .B1(
        buf_to_mux[11]), .B2(n513), .Z(data_to_tx[11]) );
  AO22D1BWP U1201 ( .A1(\dec_logic/raw[14] ), .A2(n630), .B1(buf_to_mux[14]), 
        .B2(n513), .Z(data_to_tx[14]) );
  AO22D1BWP U1202 ( .A1(\dec_logic/three_six_load[8] ), .A2(n630), .B1(
        buf_to_mux[17]), .B2(n513), .Z(data_to_tx[17]) );
  AO22D1BWP U1203 ( .A1(\dec_logic/raw[18] ), .A2(n630), .B1(buf_to_mux[18]), 
        .B2(n513), .Z(data_to_tx[18]) );
  AO22D1BWP U1204 ( .A1(\dec_logic/checksum/encoder/N25 ), .A2(n630), .B1(
        buf_to_mux[24]), .B2(n513), .Z(data_to_tx[24]) );
  AO22D1BWP U1205 ( .A1(\dec_logic/raw[1] ), .A2(n630), .B1(buf_to_mux[1]), 
        .B2(n513), .Z(data_to_tx[1]) );
  OAI22D1BWP U1206 ( .A1(n1042), .A2(n921), .B1(n1024), .B2(n101), .ZN(n460)
         );
  AOI22D1BWP U1207 ( .A1(n923), .A2(n920), .B1(n924), .B2(n922), .ZN(n921) );
  AOI22D1BWP U1208 ( .A1(data_type[1]), .A2(n630), .B1(n513), .B2(
        buf_to_mux[53]), .ZN(n976) );
  AOI22D1BWP U1209 ( .A1(data_type[0]), .A2(n630), .B1(n513), .B2(
        buf_to_mux[52]), .ZN(n974) );
  MOAI22D0BWP U1210 ( .A1(\enc_logic/checksum[9] ), .A2(n929), .B1(n933), .B2(
        buf_to_mux[6]), .ZN(n467) );
  ND3D1BWP U1211 ( .A1(n629), .A2(n927), .A3(n971), .ZN(n929) );
  IOA21D1BWP U1212 ( .A1(buf_to_mux[12]), .A2(n933), .B(n925), .ZN(n461) );
  ND4D1BWP U1213 ( .A1(n629), .A2(n924), .A3(n923), .A4(n922), .ZN(n925) );
  AOI32D1BWP U1214 ( .A1(\enc_logic/checksum[19] ), .A2(n1032), .A3(n1031), 
        .B1(n1042), .B2(n1032), .ZN(n441) );
  AOI22D1BWP U1215 ( .A1(n933), .A2(buf_to_mux[32]), .B1(n932), .B2(
        \enc_logic/checksum[12] ), .ZN(n1032) );
  MOAI22D0BWP U1216 ( .A1(n919), .A2(n918), .B1(n933), .B2(buf_to_mux[18]), 
        .ZN(n455) );
  AOI22D1BWP U1217 ( .A1(n933), .A2(buf_to_mux[38]), .B1(n932), .B2(
        \enc_logic/checksum[18] ), .ZN(n1037) );
  AO21D1BWP U1218 ( .A1(n933), .A2(buf_to_mux[0]), .B(n1021), .Z(n473) );
  OAI222D1BWP U1219 ( .A1(n783), .A2(n1041), .B1(n1042), .B2(n782), .C1(n101), 
        .C2(n781), .ZN(n448) );
  AOI21D1BWP U1220 ( .A1(n1028), .A2(n819), .B(n784), .ZN(n782) );
  AO21D1BWP U1221 ( .A1(n933), .A2(buf_to_mux[8]), .B(n1023), .Z(n465) );
  AOI31D1BWP U1222 ( .A1(\enc_logic/checksum[9] ), .A2(\enc_logic/checksum[8] ), .A3(\enc_logic/checksum[7] ), .B(n1042), .ZN(n1023) );
  AO21D1BWP U1223 ( .A1(n933), .A2(buf_to_mux[14]), .B(n1025), .Z(n459) );
  AOI31D1BWP U1224 ( .A1(\enc_logic/checksum[12] ), .A2(
        \enc_logic/checksum[11] ), .A3(\enc_logic/checksum[10] ), .B(n1042), 
        .ZN(n1025) );
  AO222D1BWP U1225 ( .A1(n963), .A2(n1039), .B1(n932), .B2(
        \enc_logic/checksum[22] ), .C1(n933), .C2(buf_to_mux[42]), .Z(n431) );
  AO222D1BWP U1226 ( .A1(n966), .A2(n1034), .B1(n932), .B2(
        \enc_logic/checksum[16] ), .C1(n933), .C2(buf_to_mux[36]), .Z(n437) );
  AO222D1BWP U1227 ( .A1(n969), .A2(n1030), .B1(n932), .B2(
        \enc_logic/checksum[10] ), .C1(n933), .C2(buf_to_mux[30]), .Z(n443) );
  OAI21D1BWP U1228 ( .A1(n1041), .A2(n965), .B(n1040), .ZN(n430) );
  AOI211XD0BWP U1229 ( .A1(\enc_logic/checksum[26] ), .A2(
        \enc_logic/checksum[27] ), .B(\enc_logic/checksum[25] ), .C(n1042), 
        .ZN(n1038) );
  OAI21D1BWP U1230 ( .A1(n1041), .A2(n970), .B(n1035), .ZN(n436) );
  AOI211XD0BWP U1231 ( .A1(\enc_logic/checksum[23] ), .A2(
        \enc_logic/checksum[24] ), .B(\enc_logic/checksum[22] ), .C(n1042), 
        .ZN(n1033) );
  OAI21D1BWP U1232 ( .A1(n1041), .A2(n922), .B(n780), .ZN(n442) );
  AOI211XD0BWP U1233 ( .A1(\enc_logic/checksum[20] ), .A2(
        \enc_logic/checksum[21] ), .B(\enc_logic/checksum[19] ), .C(n1042), 
        .ZN(n1029) );
  OAI21D1BWP U1234 ( .A1(n624), .A2(n1041), .B(n625), .ZN(n931) );
  AOI22D1BWP U1235 ( .A1(n629), .A2(\enc_logic/checksum[13] ), .B1(n933), .B2(
        buf_to_mux[21]), .ZN(n625) );
  AOI21D1BWP U1236 ( .A1(n910), .A2(n613), .B(n591), .ZN(n612) );
  INR2D1BWP U1237 ( .A1(n912), .B1(n614), .ZN(n613) );
  XOR2D1BWP U1238 ( .A1(n908), .A2(n907), .Z(n909) );
  AOI22D1BWP U1239 ( .A1(n906), .A2(n905), .B1(n904), .B2(n903), .ZN(n908) );
  AOI22D1BWP U1240 ( .A1(n629), .A2(\enc_logic/checksum[14] ), .B1(n933), .B2(
        buf_to_mux[22]), .ZN(n618) );
  AOI22D1BWP U1241 ( .A1(n884), .A2(n885), .B1(n883), .B2(n882), .ZN(n902) );
  XOR2D1BWP U1242 ( .A1(\enc_logic/checksum[25] ), .A2(
        \enc_logic/checksum[24] ), .Z(n879) );
  XOR2D1BWP U1243 ( .A1(n904), .A2(n903), .Z(n906) );
  XNR2D1BWP U1244 ( .A1(n870), .A2(n868), .ZN(n872) );
  XNR2D1BWP U1245 ( .A1(n888), .A2(n887), .ZN(n904) );
  OAI21D1BWP U1246 ( .A1(n856), .A2(n855), .B(n864), .ZN(n887) );
  XNR3D1BWP U1247 ( .A1(n850), .A2(n849), .A3(n848), .ZN(n860) );
  XOR3D1BWP U1248 ( .A1(n894), .A2(n893), .A3(n892), .Z(n888) );
  AOI22D1BWP U1249 ( .A1(n821), .A2(n820), .B1(\enc_logic/checksum[16] ), .B2(
        \enc_logic/checksum[15] ), .ZN(n822) );
  XOR3D1BWP U1250 ( .A1(n890), .A2(n889), .A3(n891), .Z(n893) );
  XNR3D1BWP U1251 ( .A1(\enc_logic/checksum[8] ), .A2(\enc_logic/checksum[9] ), 
        .A3(n808), .ZN(n809) );
  AOI22D1BWP U1252 ( .A1(n807), .A2(\enc_logic/checksum[12] ), .B1(
        \enc_logic/checksum[11] ), .B2(n806), .ZN(n816) );
  XNR2D1BWP U1253 ( .A1(\enc_logic/checksum[12] ), .A2(
        \enc_logic/checksum[11] ), .ZN(n799) );
  XOR2D1BWP U1254 ( .A1(n813), .A2(n815), .Z(n812) );
  XNR2D1BWP U1255 ( .A1(n796), .A2(n930), .ZN(n815) );
  IND2D1BWP U1256 ( .A1(n971), .B1(n792), .ZN(n796) );
  OAI22D1BWP U1257 ( .A1(n808), .A2(n791), .B1(n926), .B2(n927), .ZN(n813) );
  XOR2D1BWP U1258 ( .A1(\enc_logic/checksum[5] ), .A2(\enc_logic/checksum[6] ), 
        .Z(n790) );
  OAI22D1BWP U1259 ( .A1(n544), .A2(n959), .B1(n764), .B2(n626), .ZN(
        Packet_To_Node[2]) );
  OAI22D1BWP U1260 ( .A1(n762), .A2(n770), .B1(n764), .B2(n982), .ZN(
        Packet_To_Node[9]) );
  OAI22D1BWP U1261 ( .A1(n762), .A2(n972), .B1(n764), .B2(n627), .ZN(
        Packet_To_Node[3]) );
  OAI22D1BWP U1262 ( .A1(n762), .A2(n520), .B1(n764), .B2(n993), .ZN(
        Packet_To_Node[1]) );
  OAI22D1BWP U1263 ( .A1(n762), .A2(n773), .B1(n764), .B2(n972), .ZN(
        Packet_To_Node[12]) );
  OAI22D1BWP U1264 ( .A1(n762), .A2(n953), .B1(n764), .B2(n956), .ZN(
        Packet_To_Node[18]) );
  OAI22D1BWP U1265 ( .A1(n762), .A2(n957), .B1(n764), .B2(n767), .ZN(
        Packet_To_Node[14]) );
  OAI22D1BWP U1266 ( .A1(n762), .A2(n956), .B1(n764), .B2(n770), .ZN(
        Packet_To_Node[15]) );
  OAI22D1BWP U1267 ( .A1(n762), .A2(n955), .B1(n764), .B2(n771), .ZN(
        Packet_To_Node[16]) );
  XNR2D1BWP U1268 ( .A1(n722), .A2(n721), .ZN(n728) );
  XNR3D1BWP U1269 ( .A1(n720), .A2(n718), .A3(n719), .ZN(n724) );
  XNR3D1BWP U1270 ( .A1(n700), .A2(n699), .A3(n698), .ZN(n703) );
  XNR2D1BWP U1271 ( .A1(n697), .A2(n710), .ZN(n713) );
  AOI22D1BWP U1272 ( .A1(n656), .A2(n655), .B1(\dec_logic/checksum/check[8] ), 
        .B2(\dec_logic/checksum/check[9] ), .ZN(n706) );
  XNR2D1BWP U1273 ( .A1(n910), .A2(n619), .ZN(n617) );
  XOR2D1BWP U1274 ( .A1(n817), .A2(n816), .Z(n818) );
  MUX2ND0BWP U1275 ( .I0(\dec_logic/three_six_load[7] ), .I1(n980), .S(
        \dec_logic/raw[13] ), .ZN(n981) );
  MUX2ND0BWP U1276 ( .I0(n982), .I1(\dec_logic/three_six_load[9] ), .S(
        \dec_logic/raw[19] ), .ZN(n989) );
  MUX2ND0BWP U1277 ( .I0(n983), .I1(\dec_logic/three_six_load[11] ), .S(
        \dec_logic/raw[18] ), .ZN(n984) );
  MUX2ND0BWP U1278 ( .I0(n985), .I1(\dec_logic/raw[20] ), .S(n984), .ZN(n986)
         );
  MUX2ND0BWP U1279 ( .I0(n987), .I1(\dec_logic/three_six_load[10] ), .S(n986), 
        .ZN(n988) );
  MUX2ND0BWP U1280 ( .I0(n952), .I1(\dec_logic/checksum/check[23] ), .S(n991), 
        .ZN(n992) );
  MUX2ND0BWP U1281 ( .I0(n951), .I1(\dec_logic/checksum/check[24] ), .S(n992), 
        .ZN(n996) );
  MUX2ND0BWP U1282 ( .I0(\dec_logic/three_six_load[1] ), .I1(n993), .S(
        \dec_logic/three_six_load[2] ), .ZN(n994) );
  NR4D0BWP U1283 ( .A1(\enc_logic/checksum[5] ), .A2(\enc_logic/checksum[6] ), 
        .A3(\enc_logic/check/N25 ), .A4(n1042), .ZN(n1021) );
endmodule

