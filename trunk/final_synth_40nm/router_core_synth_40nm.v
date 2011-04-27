
module router_core_synthed ( RX_Data, Clk_R, Rst_n, RX_Data_Valid, TX_Data_Ready, 
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
         n583, n584, n585, n586, n587, n588, n589, n590, n591, n595, n596,
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
         n1054, n1055;
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
  DFCNQD1BWP \ever_versetile/out_reg[21]  ( .D(n927), .CP(Clk_R), .CDN(Rst_n), 
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
  EDFCNQD1BWP \ever_versetile/out_reg[53]  ( .D(n957), .E(n101), .CP(Clk_R), 
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
  DFCNQD1BWP \ever_versetile/out_reg[22]  ( .D(n451), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[22]) );
  DFCNQD1BWP \main_control/state_reg[0]  ( .D(n5), .CP(Clk_R), .CDN(Rst_n), 
        .Q(n6) );
  DFCND1BWP \rHandshake/state_reg[0]  ( .D(\rHandshake/next_state[0] ), .CP(
        Clk_R), .CDN(Rst_n), .Q(\rHandshake/state[0] ), .QN(n1045) );
  NR2XD3BWP U569 ( .A1(n520), .A2(n774), .ZN(n521) );
  MAOI222D1BWP U570 ( .A(n711), .B(n710), .C(n709), .ZN(n712) );
  XNR2D1BWP U571 ( .A1(n874), .A2(n873), .ZN(n875) );
  INVD1BWP U572 ( .I(\main_control/state[1] ), .ZN(n940) );
  NR2XD0BWP U573 ( .A1(n6), .A2(\main_control/state[2] ), .ZN(n995) );
  IND2D1BWP U574 ( .A1(\main_control/state[3] ), .B1(\main_control/state[1] ), 
        .ZN(n619) );
  ND2D1BWP U575 ( .A1(\main_control/state[2] ), .A2(n940), .ZN(n1050) );
  ND2D1BWP U576 ( .A1(n517), .A2(n624), .ZN(n627) );
  ND2D2BWP U577 ( .A1(n518), .A2(n954), .ZN(n519) );
  NR2XD3BWP U578 ( .A1(n651), .A2(n770), .ZN(n650) );
  ND3D2BWP U579 ( .A1(n541), .A2(n681), .A3(\dec_logic/checksum/check[14] ), 
        .ZN(n523) );
  INVD1BWP U580 ( .I(n650), .ZN(n685) );
  INVD1BWP U581 ( .I(n745), .ZN(n734) );
  ND2D2BWP U582 ( .A1(n729), .A2(n730), .ZN(n747) );
  ND2D3BWP U583 ( .A1(n507), .A2(n639), .ZN(n509) );
  CKND2BWP U584 ( .I(n553), .ZN(n507) );
  ND2D2BWP U585 ( .A1(n846), .A2(\enc_logic/checksum[20] ), .ZN(n849) );
  ND2D2BWP U586 ( .A1(n860), .A2(n856), .ZN(n864) );
  MUX2ND0BWP U587 ( .I0(n739), .I1(n738), .S(n746), .ZN(n740) );
  ND2D1BWP U588 ( .A1(n747), .A2(n530), .ZN(n748) );
  ND2D1BWP U589 ( .A1(n530), .A2(\dec_logic/three_six_load[9] ), .ZN(n750) );
  OAI21D2BWP U590 ( .A1(n853), .A2(n852), .B(n964), .ZN(n860) );
  ND2D1BWP U591 ( .A1(n531), .A2(n590), .ZN(n532) );
  INVD1BWP U592 ( .I(n907), .ZN(n903) );
  NR2XD1BWP U593 ( .A1(n779), .A2(n623), .ZN(n788) );
  NR3D0BWP U594 ( .A1(\enc_logic/checksum[27] ), .A2(\enc_logic/checksum[26] ), 
        .A3(n1041), .ZN(n1038) );
  NR3D0BWP U595 ( .A1(\enc_logic/checksum[24] ), .A2(\enc_logic/checksum[23] ), 
        .A3(n1041), .ZN(n1033) );
  NR3D0BWP U596 ( .A1(\enc_logic/checksum[21] ), .A2(\enc_logic/checksum[20] ), 
        .A3(n1041), .ZN(n1029) );
  ND2D1BWP U597 ( .A1(n895), .A2(n894), .ZN(n909) );
  NR2XD0BWP U598 ( .A1(n941), .A2(n1050), .ZN(n621) );
  INVD1BWP U599 ( .I(n6), .ZN(n941) );
  MOAI22D0BWP U600 ( .A1(n982), .A2(n617), .B1(buf_to_mux[20]), .B2(n510), 
        .ZN(data_to_tx[20]) );
  MOAI22D0BWP U601 ( .A1(n976), .A2(n617), .B1(buf_to_mux[10]), .B2(n510), 
        .ZN(data_to_tx[10]) );
  MOAI22D0BWP U602 ( .A1(n1021), .A2(n595), .B1(\dec_logic/raw[13] ), .B2(n975), .ZN(data_to_tx[13]) );
  MOAI22D0BWP U603 ( .A1(n977), .A2(n617), .B1(buf_to_mux[16]), .B2(n510), 
        .ZN(data_to_tx[16]) );
  MOAI22D0BWP U604 ( .A1(n1023), .A2(n595), .B1(\dec_logic/raw[19] ), .B2(n618), .ZN(data_to_tx[19]) );
  MOAI22D0BWP U605 ( .A1(n979), .A2(n617), .B1(buf_to_mux[21]), .B2(n510), 
        .ZN(data_to_tx[21]) );
  MOAI22D0BWP U606 ( .A1(n984), .A2(n617), .B1(buf_to_mux[22]), .B2(n510), 
        .ZN(data_to_tx[22]) );
  MOAI22D0BWP U607 ( .A1(n980), .A2(n617), .B1(buf_to_mux[23]), .B2(n510), 
        .ZN(data_to_tx[23]) );
  MOAI22D0BWP U608 ( .A1(n956), .A2(n617), .B1(buf_to_mux[25]), .B2(n510), 
        .ZN(data_to_tx[25]) );
  MOAI22D0BWP U609 ( .A1(n955), .A2(n617), .B1(buf_to_mux[26]), .B2(n510), 
        .ZN(data_to_tx[26]) );
  MOAI22D0BWP U610 ( .A1(n969), .A2(n617), .B1(buf_to_mux[27]), .B2(n510), 
        .ZN(data_to_tx[27]) );
  MOAI22D0BWP U611 ( .A1(n954), .A2(n617), .B1(buf_to_mux[30]), .B2(n510), 
        .ZN(data_to_tx[30]) );
  MOAI22D0BWP U612 ( .A1(n953), .A2(n617), .B1(buf_to_mux[38]), .B2(n510), 
        .ZN(data_to_tx[38]) );
  MOAI22D0BWP U613 ( .A1(n952), .A2(n617), .B1(buf_to_mux[39]), .B2(n510), 
        .ZN(data_to_tx[39]) );
  MOAI22D0BWP U614 ( .A1(n951), .A2(n617), .B1(buf_to_mux[40]), .B2(n510), 
        .ZN(data_to_tx[40]) );
  MOAI22D0BWP U615 ( .A1(n950), .A2(n617), .B1(buf_to_mux[41]), .B2(n510), 
        .ZN(data_to_tx[41]) );
  MOAI22D0BWP U616 ( .A1(n949), .A2(n617), .B1(buf_to_mux[42]), .B2(n510), 
        .ZN(data_to_tx[42]) );
  MOAI22D0BWP U617 ( .A1(n948), .A2(n617), .B1(buf_to_mux[43]), .B2(n510), 
        .ZN(data_to_tx[43]) );
  MOAI22D0BWP U618 ( .A1(n947), .A2(n617), .B1(buf_to_mux[44]), .B2(n510), 
        .ZN(data_to_tx[44]) );
  MOAI22D0BWP U619 ( .A1(n990), .A2(n617), .B1(buf_to_mux[4]), .B2(n510), .ZN(
        data_to_tx[4]) );
  MOAI22D0BWP U620 ( .A1(n1019), .A2(n595), .B1(\dec_logic/raw[7] ), .B2(n618), 
        .ZN(data_to_tx[7]) );
  INVD1BWP U621 ( .I(n929), .ZN(n101) );
  MOAI22D0BWP U622 ( .A1(n922), .A2(n1041), .B1(n929), .B2(buf_to_mux[11]), 
        .ZN(n462) );
  MOAI22D0BWP U623 ( .A1(n968), .A2(n1041), .B1(n929), .B2(buf_to_mux[9]), 
        .ZN(n464) );
  NR4D0BWP U624 ( .A1(\main_control/state[3] ), .A2(n1050), .A3(n941), .A4(
        n1055), .ZN(n475) );
  AOI21D0BWP U625 ( .A1(n934), .A2(n941), .B(n475), .ZN(n476) );
  IOA21D0BWP U626 ( .A1(n938), .A2(n931), .B(n476), .ZN(n582) );
  IND2D0BWP U627 ( .A1(n662), .B1(n659), .ZN(n677) );
  INR2D0BWP U628 ( .A1(n813), .B1(n812), .ZN(n884) );
  AO21D0BWP U629 ( .A1(n775), .A2(n941), .B(n1001), .Z(n612) );
  OAI22D0BWP U630 ( .A1(address[2]), .A2(n1006), .B1(address[0]), .B2(n1005), 
        .ZN(n477) );
  AOI22D0BWP U631 ( .A1(n1008), .A2(address[3]), .B1(address[1]), .B2(n1007), 
        .ZN(n478) );
  OAI221D0BWP U632 ( .A1(n1008), .A2(address[3]), .B1(address[1]), .B2(n1007), 
        .C(n478), .ZN(n479) );
  AOI22D0BWP U633 ( .A1(address[2]), .A2(n1006), .B1(address[0]), .B2(n1005), 
        .ZN(n480) );
  OAI31D0BWP U634 ( .A1(\dec_logic/token ), .A2(data_type[1]), .A3(
        data_type[0]), .B(n480), .ZN(n481) );
  OR4D0BWP U635 ( .A1(n1011), .A2(n477), .A3(n479), .A4(n481), .Z(n999) );
  CKND0BWP U636 ( .I(\dec_logic/checksum/check[18] ), .ZN(n482) );
  MOAI22D0BWP U637 ( .A1(n771), .A2(n482), .B1(n685), .B2(n652), .ZN(n483) );
  OAI21D1BWP U638 ( .A1(\dec_logic/checksum/check[17] ), .A2(
        \dec_logic/checksum/check[18] ), .B(n483), .ZN(n688) );
  CKND2D0BWP U639 ( .A1(\enc_logic/checksum[5] ), .A2(\enc_logic/checksum[6] ), 
        .ZN(n484) );
  OAI211D1BWP U640 ( .A1(\enc_logic/checksum[5] ), .A2(\enc_logic/checksum[6] ), .B(n784), .C(n484), .ZN(n485) );
  AN3XD1BWP U641 ( .A1(n783), .A2(n1024), .A3(n485), .Z(n797) );
  IND2D0BWP U642 ( .A1(n817), .B1(n910), .ZN(n486) );
  AOI22D0BWP U643 ( .A1(\enc_logic/checksum[15] ), .A2(n817), .B1(
        \enc_logic/checksum[16] ), .B2(n486), .ZN(n487) );
  INR2D0BWP U644 ( .A1(n819), .B1(n487), .ZN(n888) );
  XNR4D0BWP U645 ( .A1(n774), .A2(n773), .A3(\dec_logic/checksum/check[10] ), 
        .A4(\dec_logic/checksum/check[15] ), .ZN(n571) );
  CKND2D0BWP U646 ( .A1(n942), .A2(n775), .ZN(n488) );
  MAOI22D0BWP U647 ( .A1(n997), .A2(n488), .B1(\main_control/state[3] ), .B2(
        \main_control/state[1] ), .ZN(n1015) );
  IND2D0BWP U648 ( .A1(n702), .B1(n703), .ZN(n705) );
  CKND0BWP U649 ( .I(n809), .ZN(n489) );
  AN2D0BWP U650 ( .A1(n811), .A2(n489), .Z(n490) );
  OAI222D0BWP U651 ( .A1(n489), .A2(n811), .B1(n1024), .B2(n968), .C1(n490), 
        .C2(n810), .ZN(n883) );
  XOR4D0BWP U652 ( .A1(\dec_logic/checksum/check[16] ), .A2(
        \dec_logic/checksum/check[19] ), .A3(\dec_logic/checksum/check[20] ), 
        .A4(\dec_logic/checksum/check[21] ), .Z(n491) );
  CKND2D0BWP U653 ( .A1(n772), .A2(n491), .ZN(n492) );
  OAI211D0BWP U654 ( .A1(n772), .A2(n491), .B(n517), .C(n492), .ZN(n573) );
  IND2D0BWP U655 ( .A1(\enc_logic/checksum[14] ), .B1(n912), .ZN(n915) );
  INR2D0BWP U656 ( .A1(n934), .B1(n941), .ZN(n933) );
  INR2D0BWP U657 ( .A1(n909), .B1(\enc_logic/checksum[27] ), .ZN(n493) );
  AOI22D0BWP U658 ( .A1(buf_to_mux[20]), .A2(n929), .B1(n913), .B2(n615), .ZN(
        n494) );
  OAI211D0BWP U659 ( .A1(n493), .A2(n911), .B(n914), .C(n494), .ZN(n453) );
  NR2D0BWP U660 ( .A1(n693), .A2(n692), .ZN(n495) );
  AOI31D0BWP U661 ( .A1(\dec_logic/checksum/encoder/N25 ), .A2(
        \dec_logic/checksum/check[7] ), .A3(n691), .B(n495), .ZN(n496) );
  CKND0BWP U662 ( .I(n690), .ZN(n497) );
  AOI32D0BWP U663 ( .A1(n692), .A2(n496), .A3(n497), .B1(n689), .B2(n496), 
        .ZN(n704) );
  MOAI22D0BWP U664 ( .A1(n528), .A2(n676), .B1(n527), .B2(n675), .ZN(n715) );
  IND2D0BWP U665 ( .A1(n530), .B1(n979), .ZN(n751) );
  CKND0BWP U666 ( .I(\dec_logic/three_six_load[5] ), .ZN(n498) );
  MUX2ND0BWP U667 ( .I0(\dec_logic/three_six_load[4] ), .I1(n976), .S(
        \dec_logic/raw[7] ), .ZN(n499) );
  XOR4D0BWP U668 ( .A1(\dec_logic/three_six_load[3] ), .A2(\dec_logic/raw[8] ), 
        .A3(\dec_logic/raw[6] ), .A4(n499), .Z(n500) );
  MUX2ND0BWP U669 ( .I0(n498), .I1(\dec_logic/three_six_load[5] ), .S(n500), 
        .ZN(n572) );
  CKND0BWP U670 ( .I(n886), .ZN(n501) );
  OAI21D0BWP U671 ( .A1(n888), .A2(n501), .B(n887), .ZN(n502) );
  INR2D0BWP U672 ( .A1(n881), .B1(n882), .ZN(n503) );
  OAI21D0BWP U673 ( .A1(n884), .A2(n885), .B(n883), .ZN(n504) );
  CKND2D0BWP U674 ( .A1(n503), .A2(n504), .ZN(n505) );
  OAI211D0BWP U675 ( .A1(n503), .A2(n504), .B(n502), .C(n505), .ZN(n901) );
  INR2D0BWP U676 ( .A1(n995), .B1(n619), .ZN(n622) );
  INR2D0BWP U677 ( .A1(n933), .B1(n1011), .ZN(n931) );
  CKND0BWP U678 ( .I(n913), .ZN(n506) );
  OAI222D0BWP U679 ( .A1(n506), .A2(n914), .B1(n1041), .B2(n915), .C1(n101), 
        .C2(n1023), .ZN(n454) );
  CKND2BWP U680 ( .I(n644), .ZN(n639) );
  NR2D3BWP U681 ( .A1(\enc_logic/encode_type ), .A2(n929), .ZN(n928) );
  OAI21D4BWP U682 ( .A1(n630), .A2(n629), .B(n769), .ZN(n636) );
  OAI21D4BWP U683 ( .A1(n520), .A2(n597), .B(n598), .ZN(n630) );
  XNR2D2BWP U684 ( .A1(n720), .A2(n719), .ZN(n590) );
  ND2D1BWP U685 ( .A1(n718), .A2(n717), .ZN(n719) );
  DCCKND4BWP U686 ( .I(n831), .ZN(n835) );
  IND3D4BWP U687 ( .A1(n967), .B1(n589), .B2(n828), .ZN(n831) );
  XNR2D2BWP U688 ( .A1(n900), .A2(n896), .ZN(n906) );
  XOR3D1BWP U689 ( .A1(n692), .A2(n690), .A3(n689), .Z(n614) );
  CKND4BWP U690 ( .I(n794), .ZN(n795) );
  ND2D2BWP U691 ( .A1(n794), .A2(n912), .ZN(n807) );
  XNR2D2BWP U692 ( .A1(n908), .A2(n907), .ZN(n603) );
  DCCKND4BWP U693 ( .I(n871), .ZN(n874) );
  ND2D2BWP U694 ( .A1(n869), .A2(n868), .ZN(n876) );
  ND2D2BWP U695 ( .A1(n553), .A2(n644), .ZN(n508) );
  ND2D8BWP U696 ( .A1(n508), .A2(n509), .ZN(n517) );
  ND2D2BWP U697 ( .A1(n517), .A2(\dec_logic/checksum/check[10] ), .ZN(n692) );
  CKND4BWP U698 ( .I(n517), .ZN(n518) );
  NR2D3BWP U699 ( .A1(n961), .A2(n871), .ZN(n872) );
  ND2D2BWP U700 ( .A1(n548), .A2(n547), .ZN(n527) );
  NR2XD0BWP U701 ( .A1(n525), .A2(n688), .ZN(n711) );
  ND2D3BWP U702 ( .A1(n731), .A2(n747), .ZN(n745) );
  ND2D2BWP U703 ( .A1(n728), .A2(n725), .ZN(n726) );
  ND2D3BWP U704 ( .A1(n530), .A2(n749), .ZN(n731) );
  NR2XD0BWP U705 ( .A1(n865), .A2(n866), .ZN(n515) );
  ND2D2BWP U706 ( .A1(n859), .A2(n858), .ZN(n865) );
  XNR2D2BWP U707 ( .A1(n819), .A2(n818), .ZN(n843) );
  XNR2D2BWP U708 ( .A1(n701), .A2(n699), .ZN(n716) );
  ND2D3BWP U709 ( .A1(n680), .A2(n527), .ZN(n528) );
  OAI21D4BWP U710 ( .A1(n542), .A2(\dec_logic/checksum/check[16] ), .B(n772), 
        .ZN(n634) );
  ND3D8BWP U711 ( .A1(n632), .A2(n631), .A3(\dec_logic/checksum/check[15] ), 
        .ZN(n542) );
  ND3D3BWP U712 ( .A1(n564), .A2(n563), .A3(n562), .ZN(n736) );
  AOI21D4BWP U713 ( .A1(n846), .A2(n847), .B(\enc_logic/checksum[20] ), .ZN(
        n852) );
  NR3D3BWP U714 ( .A1(n552), .A2(n583), .A3(n516), .ZN(n5) );
  INVD1BWP U715 ( .I(n514), .ZN(\main_control/next_select_sig[0] ) );
  INR2D2BWP U716 ( .A1(n611), .B1(n552), .ZN(n514) );
  ND3D8BWP U717 ( .A1(n585), .A2(n759), .A3(n761), .ZN(n584) );
  CKND4BWP U718 ( .I(n760), .ZN(n585) );
  IND2D4BWP U719 ( .A1(n853), .B1(n511), .ZN(n856) );
  NR2D3BWP U720 ( .A1(n849), .A2(n848), .ZN(n853) );
  DCCKND4BWP U721 ( .I(n722), .ZN(n724) );
  OAI21D4BWP U722 ( .A1(n559), .A2(n675), .B(n948), .ZN(n560) );
  INR2D2BWP U723 ( .A1(\enc_logic/checksum[21] ), .B1(n852), .ZN(n511) );
  OAI22D1BWP U724 ( .A1(n842), .A2(n841), .B1(n966), .B2(n965), .ZN(n844) );
  ND2D3BWP U725 ( .A1(n721), .A2(n947), .ZN(n723) );
  XOR3D2BWP U726 ( .A1(n708), .A2(n711), .A3(n709), .Z(n699) );
  AOI21D4BWP U727 ( .A1(n754), .A2(n753), .B(n752), .ZN(n759) );
  NR2XD0BWP U728 ( .A1(n749), .A2(\dec_logic/three_six_load[10] ), .ZN(n567)
         );
  XOR2D2BWP U729 ( .A1(n650), .A2(n524), .Z(n543) );
  ND2D4BWP U730 ( .A1(n838), .A2(\enc_logic/checksum[19] ), .ZN(n846) );
  ND2D4BWP U731 ( .A1(n556), .A2(n555), .ZN(n637) );
  ND3D3BWP U732 ( .A1(n651), .A2(n770), .A3(n635), .ZN(n556) );
  OAI211D2BWP U733 ( .A1(n665), .A2(n664), .B(n663), .C(
        \dec_logic/checksum/check[22] ), .ZN(n666) );
  XOR3D4BWP U734 ( .A1(n695), .A2(n544), .A3(n543), .Z(n525) );
  CKND2BWP U735 ( .I(n827), .ZN(n824) );
  CKND2BWP U736 ( .I(n830), .ZN(n828) );
  INVD1BWP U737 ( .I(n847), .ZN(n848) );
  CKND2BWP U738 ( .I(n629), .ZN(n632) );
  NR3D3BWP U739 ( .A1(n521), .A2(n773), .A3(n649), .ZN(n629) );
  CKND2BWP U740 ( .I(n630), .ZN(n631) );
  CKND2BWP U741 ( .I(n842), .ZN(n838) );
  ND2D4BWP U742 ( .A1(n795), .A2(\enc_logic/checksum[13] ), .ZN(n820) );
  ND2D2BWP U743 ( .A1(n627), .A2(n626), .ZN(n649) );
  ND2D3BWP U744 ( .A1(n653), .A2(\dec_logic/checksum/check[20] ), .ZN(n659) );
  CKND2BWP U745 ( .I(n653), .ZN(n670) );
  CKND2BWP U746 ( .I(n798), .ZN(n792) );
  ND2D3BWP U747 ( .A1(n807), .A2(\enc_logic/checksum[14] ), .ZN(n822) );
  ND2D2BWP U748 ( .A1(n737), .A2(n736), .ZN(n746) );
  ND2D2BWP U749 ( .A1(n655), .A2(n657), .ZN(n680) );
  CKND2BWP U750 ( .I(n659), .ZN(n671) );
  ND2D3BWP U751 ( .A1(n837), .A2(n836), .ZN(n842) );
  OAI21D4BWP U752 ( .A1(n834), .A2(n835), .B(n833), .ZN(n837) );
  CKND2BWP U753 ( .I(n832), .ZN(n834) );
  XOR3D2BWP U754 ( .A1(\dec_logic/checksum/check[9] ), .A2(
        \dec_logic/checksum/check[7] ), .A3(\dec_logic/checksum/check[8] ), 
        .Z(n553) );
  NR2XD0BWP U755 ( .A1(\enc_logic/checksum[24] ), .A2(n874), .ZN(n533) );
  NR2D4BWP U756 ( .A1(n909), .A2(n958), .ZN(n907) );
  CKND0BWP U757 ( .I(n872), .ZN(n868) );
  AOI31D2BWP U758 ( .A1(n751), .A2(n982), .A3(n750), .B(n753), .ZN(n752) );
  INVD1BWP U759 ( .I(n735), .ZN(n737) );
  ND2D3BWP U760 ( .A1(n659), .A2(n658), .ZN(n672) );
  AOI22D2BWP U761 ( .A1(n648), .A2(\dec_logic/checksum/check[11] ), .B1(n647), 
        .B2(\dec_logic/checksum/check[12] ), .ZN(n694) );
  ND2D4BWP U762 ( .A1(n542), .A2(n636), .ZN(n651) );
  XNR3D4BWP U763 ( .A1(\enc_logic/checksum[23] ), .A2(n963), .A3(n864), .ZN(
        n871) );
  IND3D4BWP U764 ( .A1(n539), .B1(n640), .B2(n641), .ZN(n538) );
  ND2D3BWP U765 ( .A1(n955), .A2(n956), .ZN(n641) );
  ND3D2BWP U766 ( .A1(n529), .A2(\dec_logic/checksum/check[25] ), .A3(n723), 
        .ZN(n718) );
  ND2D2BWP U767 ( .A1(n842), .A2(n966), .ZN(n847) );
  ND2D4BWP U768 ( .A1(n565), .A2(n736), .ZN(n530) );
  ND2D2BWP U769 ( .A1(n569), .A2(n568), .ZN(n531) );
  XNR2D2BWP U770 ( .A1(n529), .A2(n602), .ZN(n565) );
  IND2D1BWP U771 ( .A1(n835), .B1(n836), .ZN(n840) );
  IND3D2BWP U772 ( .A1(n833), .B1(n832), .B2(n831), .ZN(n836) );
  AOI31D2BWP U773 ( .A1(n670), .A2(\dec_logic/checksum/check[21] ), .A3(n951), 
        .B(\dec_logic/checksum/check[22] ), .ZN(n558) );
  ND2D2BWP U774 ( .A1(n670), .A2(n951), .ZN(n658) );
  ND2D3BWP U775 ( .A1(n560), .A2(n676), .ZN(n721) );
  OAI211D4BWP U776 ( .A1(n743), .A2(n742), .B(n741), .C(n740), .ZN(n760) );
  INVD1BWP U777 ( .I(n673), .ZN(n559) );
  OAI21D2BWP U778 ( .A1(n531), .A2(n512), .B(n532), .ZN(n550) );
  ND2D2BWP U779 ( .A1(n523), .A2(n681), .ZN(n524) );
  NR2D4BWP U780 ( .A1(n721), .A2(n947), .ZN(n722) );
  OAI21D4BWP U781 ( .A1(n734), .A2(n590), .B(n733), .ZN(n741) );
  ND2D2BWP U782 ( .A1(n599), .A2(n600), .ZN(n598) );
  OAI21D4BWP U783 ( .A1(n537), .A2(\dec_logic/checksum/encoder/N25 ), .B(n538), 
        .ZN(n644) );
  ND2D4BWP U784 ( .A1(n788), .A2(\enc_logic/check/N25 ), .ZN(n1024) );
  INR2XD4BWP U785 ( .A1(n550), .B1(n584), .ZN(n757) );
  XNR2D2BWP U786 ( .A1(n525), .A2(n688), .ZN(n526) );
  AN2D4BWP U787 ( .A1(n551), .A2(n580), .Z(n552) );
  ND2D2BWP U788 ( .A1(n522), .A2(\dec_logic/checksum/check[13] ), .ZN(n681) );
  IND2D2BWP U789 ( .A1(n570), .B1(n513), .ZN(n512) );
  CKND2BWP U790 ( .I(n674), .ZN(n675) );
  OAI21D4BWP U791 ( .A1(n672), .A2(n950), .B(n669), .ZN(n674) );
  ND2D2BWP U792 ( .A1(n662), .A2(n661), .ZN(n663) );
  NR2XD1BWP U793 ( .A1(n533), .A2(n872), .ZN(n889) );
  AOI21D2BWP U794 ( .A1(n668), .A2(n667), .B(n666), .ZN(n669) );
  XNR3D2BWP U795 ( .A1(n892), .A2(n894), .A3(n880), .ZN(n908) );
  ND2D1BWP U796 ( .A1(n892), .A2(n891), .ZN(n893) );
  ND2D2BWP U797 ( .A1(n889), .A2(\enc_logic/checksum[25] ), .ZN(n892) );
  XNR2D2BWP U798 ( .A1(n528), .A2(n549), .ZN(n529) );
  CKND2BWP U799 ( .I(n879), .ZN(n894) );
  NR2XD3BWP U800 ( .A1(n875), .A2(n959), .ZN(n879) );
  NR2XD1BWP U801 ( .A1(n521), .A2(n649), .ZN(n522) );
  INR2D4BWP U802 ( .A1(n664), .B1(n662), .ZN(n653) );
  OAI21D4BWP U803 ( .A1(n638), .A2(n637), .B(n952), .ZN(n664) );
  NR3D2BWP U804 ( .A1(n638), .A2(n637), .A3(n952), .ZN(n662) );
  NR3D2BWP U805 ( .A1(n650), .A2(n634), .A3(n633), .ZN(n638) );
  IND3D2BWP U806 ( .A1(n760), .B1(n759), .B2(n550), .ZN(n551) );
  AOI21D2BWP U807 ( .A1(n820), .A2(n807), .B(\enc_logic/checksum[14] ), .ZN(
        n827) );
  OAI21D2BWP U808 ( .A1(n830), .A2(n829), .B(n967), .ZN(n832) );
  NR3D2BWP U809 ( .A1(n827), .A2(n826), .A3(n825), .ZN(n830) );
  CKND2BWP U810 ( .I(n806), .ZN(n826) );
  ND2D1BWP U811 ( .A1(n907), .A2(n609), .ZN(n608) );
  NR2XD0BWP U812 ( .A1(n636), .A2(\dec_logic/checksum/check[16] ), .ZN(n633)
         );
  XNR3D4BWP U813 ( .A1(n793), .A2(n797), .A3(n792), .ZN(n794) );
  ND2D3BWP U814 ( .A1(n519), .A2(n692), .ZN(n520) );
  NR3D2BWP U815 ( .A1(n729), .A2(n735), .A3(n944), .ZN(n749) );
  CKND2BWP U816 ( .I(n736), .ZN(n729) );
  NR2D4BWP U817 ( .A1(n957), .A2(n929), .ZN(n615) );
  INVD3BWP U818 ( .I(n757), .ZN(n758) );
  ND2D1BWP U819 ( .A1(n903), .A2(n928), .ZN(n911) );
  INVD0BWP U820 ( .I(n677), .ZN(n545) );
  CKND1BWP U821 ( .I(n656), .ZN(n546) );
  CKND2D1BWP U822 ( .A1(n705), .A2(n704), .ZN(n706) );
  NR2D0BWP U823 ( .A1(\dec_logic/checksum/check[21] ), .A2(n662), .ZN(n667) );
  CKND2D1BWP U824 ( .A1(n519), .A2(n627), .ZN(n599) );
  OR3XD1BWP U825 ( .A1(n933), .A2(n1001), .A3(n1009), .Z(
        \main_control/next_select_sig[2] ) );
  CKND2D1BWP U826 ( .A1(n971), .A2(n972), .ZN(data_to_tx[52]) );
  CKND2D1BWP U827 ( .A1(n973), .A2(n972), .ZN(data_to_tx[53]) );
  AO22D0BWP U828 ( .A1(\dec_logic/three_six_load[0] ), .A2(n618), .B1(
        buf_to_mux[3]), .B2(n510), .Z(data_to_tx[3]) );
  AO22D0BWP U829 ( .A1(\dec_logic/raw[2] ), .A2(n618), .B1(buf_to_mux[2]), 
        .B2(n510), .Z(data_to_tx[2]) );
  AOI22D0BWP U830 ( .A1(data_type[0]), .A2(n618), .B1(n510), .B2(
        buf_to_mux[52]), .ZN(n971) );
  AO22D0BWP U831 ( .A1(\dec_logic/raw[1] ), .A2(n618), .B1(buf_to_mux[1]), 
        .B2(n510), .Z(data_to_tx[1]) );
  AO22D0BWP U832 ( .A1(\dec_logic/checksum/encoder/N25 ), .A2(n618), .B1(
        buf_to_mux[24]), .B2(n510), .Z(data_to_tx[24]) );
  AO22D0BWP U833 ( .A1(\dec_logic/raw[0] ), .A2(n618), .B1(buf_to_mux[0]), 
        .B2(n510), .Z(data_to_tx[0]) );
  AOI22D0BWP U834 ( .A1(data_type[1]), .A2(n618), .B1(n510), .B2(
        buf_to_mux[53]), .ZN(n973) );
  AO22D0BWP U835 ( .A1(\dec_logic/three_six_load[8] ), .A2(n618), .B1(
        buf_to_mux[17]), .B2(n510), .Z(data_to_tx[17]) );
  AO22D0BWP U836 ( .A1(\dec_logic/three_six_load[2] ), .A2(n618), .B1(
        buf_to_mux[5]), .B2(n510), .Z(data_to_tx[5]) );
  AO22D0BWP U837 ( .A1(\dec_logic/three_six_load[5] ), .A2(n618), .B1(
        buf_to_mux[11]), .B2(n510), .Z(data_to_tx[11]) );
  AO22D0BWP U838 ( .A1(\dec_logic/raw[12] ), .A2(n618), .B1(buf_to_mux[12]), 
        .B2(n510), .Z(data_to_tx[12]) );
  AO22D0BWP U839 ( .A1(\dec_logic/three_six_load[3] ), .A2(n618), .B1(
        buf_to_mux[9]), .B2(n510), .Z(data_to_tx[9]) );
  AO22D0BWP U840 ( .A1(\dec_logic/raw[18] ), .A2(n618), .B1(buf_to_mux[18]), 
        .B2(n510), .Z(data_to_tx[18]) );
  AO22D0BWP U841 ( .A1(\dec_logic/raw[14] ), .A2(n618), .B1(buf_to_mux[14]), 
        .B2(n510), .Z(data_to_tx[14]) );
  AO22D0BWP U842 ( .A1(\dec_logic/raw[6] ), .A2(n618), .B1(buf_to_mux[6]), 
        .B2(n510), .Z(data_to_tx[6]) );
  AO22D0BWP U843 ( .A1(\dec_logic/raw[8] ), .A2(n618), .B1(buf_to_mux[8]), 
        .B2(n510), .Z(data_to_tx[8]) );
  AO22D0BWP U844 ( .A1(\dec_logic/three_six_load[6] ), .A2(n618), .B1(
        buf_to_mux[15]), .B2(n510), .Z(data_to_tx[15]) );
  BUFFD2BWP U845 ( .I(n975), .Z(n618) );
  INVD4BWP U846 ( .I(n595), .ZN(n510) );
  ND2D1BWP U847 ( .A1(n945), .A2(\dec_logic/checksum/check[25] ), .ZN(n727) );
  INVD1BWP U848 ( .I(n749), .ZN(n753) );
  CKND0BWP U849 ( .I(n732), .ZN(n743) );
  CKND2D1BWP U850 ( .A1(n529), .A2(n722), .ZN(n717) );
  CKND2D0BWP U851 ( .A1(n857), .A2(n856), .ZN(n858) );
  CKXOR2D1BWP U852 ( .A1(n542), .A2(n694), .Z(n544) );
  INVD1BWP U853 ( .I(n618), .ZN(n616) );
  INVD2BWP U854 ( .I(n975), .ZN(n617) );
  OR3D1BWP U855 ( .A1(n970), .A2(tx_data_select[0]), .A3(tx_data_select[1]), 
        .Z(n595) );
  CKND2D1BWP U856 ( .A1(n628), .A2(n773), .ZN(n597) );
  INVD1BWP U857 ( .I(n774), .ZN(n628) );
  CKND2D1BWP U858 ( .A1(n815), .A2(n910), .ZN(n816) );
  NR2D4BWP U859 ( .A1(n755), .A2(data_type[0]), .ZN(n761) );
  INVD1BWP U860 ( .I(\dec_logic/checksum/check[16] ), .ZN(n770) );
  XNR2D1BWP U861 ( .A1(\dec_logic/checksum/check[12] ), .A2(
        \dec_logic/checksum/check[11] ), .ZN(n774) );
  INVD1BWP U862 ( .I(\dec_logic/checksum/check[15] ), .ZN(n769) );
  INVD1BWP U863 ( .I(\dec_logic/checksum/check[19] ), .ZN(n952) );
  INVD1BWP U864 ( .I(\dec_logic/checksum/check[24] ), .ZN(n947) );
  INVD1BWP U865 ( .I(\dec_logic/checksum/check[10] ), .ZN(n954) );
  INVD1BWP U866 ( .I(\enc_logic/encode_type ), .ZN(n957) );
  INVD2BWP U867 ( .I(n757), .ZN(n591) );
  OAI21D1BWP U868 ( .A1(n728), .A2(n727), .B(n726), .ZN(n735) );
  ND2D1BWP U869 ( .A1(n724), .A2(n723), .ZN(n728) );
  XOR2D1BWP U870 ( .A1(n714), .A2(n980), .Z(n744) );
  CKND1BWP U871 ( .I(n723), .ZN(n561) );
  XOR2D1BWP U872 ( .A1(n716), .A2(n715), .Z(n720) );
  CKND1BWP U873 ( .I(n660), .ZN(n668) );
  CKND2D0BWP U874 ( .A1(n685), .A2(n542), .ZN(n686) );
  CKND2D0BWP U875 ( .A1(n651), .A2(n770), .ZN(n652) );
  CKND2D0BWP U876 ( .A1(n520), .A2(n765), .ZN(n647) );
  CKND2D1BWP U877 ( .A1(n518), .A2(n625), .ZN(n626) );
  AOI21D0BWP U878 ( .A1(\enc_logic/check/N25 ), .A2(n789), .B(n788), .ZN(n926)
         );
  INVD1BWP U879 ( .I(\tHandshake/state[0] ), .ZN(n1055) );
  CKND0BWP U880 ( .I(n640), .ZN(n691) );
  INVD1BWP U881 ( .I(\dec_logic/checksum/check[20] ), .ZN(n951) );
  XOR2D1BWP U882 ( .A1(\dec_logic/checksum/check[17] ), .A2(
        \dec_logic/checksum/check[18] ), .Z(n772) );
  XNR2D1BWP U883 ( .A1(\dec_logic/checksum/check[14] ), .A2(
        \dec_logic/checksum/check[13] ), .ZN(n773) );
  INVD1BWP U884 ( .I(\dec_logic/checksum/check[5] ), .ZN(n956) );
  INVD1BWP U885 ( .I(\dec_logic/checksum/check[23] ), .ZN(n948) );
  NR2D0BWP U886 ( .A1(n945), .A2(n762), .ZN(Packet_To_Node[22]) );
  NR2D0BWP U887 ( .A1(n944), .A2(n762), .ZN(Packet_To_Node[23]) );
  NR2D0BWP U888 ( .A1(n946), .A2(n762), .ZN(Packet_To_Node[21]) );
  AN2XD1BWP U889 ( .A1(n551), .A2(n761), .Z(n762) );
  CKND1BWP U890 ( .I(n744), .ZN(n742) );
  ND2D1BWP U891 ( .A1(n561), .A2(n946), .ZN(n562) );
  CKND0BWP U892 ( .I(n856), .ZN(n861) );
  ND2D1BWP U893 ( .A1(n680), .A2(n679), .ZN(n701) );
  ND2D0BWP U894 ( .A1(n676), .A2(n674), .ZN(n549) );
  CKND1BWP U895 ( .I(n526), .ZN(n678) );
  CKND2D1BWP U896 ( .A1(n658), .A2(\dec_logic/checksum/check[21] ), .ZN(n654)
         );
  CKND2D1BWP U897 ( .A1(n843), .A2(n840), .ZN(n886) );
  CKND2D1BWP U898 ( .A1(n799), .A2(n918), .ZN(n801) );
  OAI22D0BWP U899 ( .A1(n80), .A2(n595), .B1(n944), .B2(n617), .ZN(
        data_to_tx[47]) );
  OAI22D0BWP U900 ( .A1(n79), .A2(n595), .B1(n945), .B2(n617), .ZN(
        data_to_tx[46]) );
  OAI22D0BWP U901 ( .A1(n78), .A2(n595), .B1(n946), .B2(n617), .ZN(
        data_to_tx[45]) );
  NR2D1BWP U902 ( .A1(n974), .A2(tx_data_select[0]), .ZN(n975) );
  AOI21D0BWP U903 ( .A1(\dec_logic/checksum/encoder/N25 ), .A2(n641), .B(n691), 
        .ZN(n642) );
  CKND2D1BWP U904 ( .A1(n635), .A2(\dec_logic/checksum/check[16] ), .ZN(n554)
         );
  INVD1BWP U905 ( .I(tx_data_select[2]), .ZN(n970) );
  INVD1BWP U906 ( .I(buf_to_mux[25]), .ZN(n777) );
  INVD1BWP U907 ( .I(\dec_logic/checksum/encoder/N25 ), .ZN(n539) );
  INVD1BWP U908 ( .I(data_type[1]), .ZN(n755) );
  INVD1BWP U909 ( .I(\dec_logic/checksum/check[21] ), .ZN(n950) );
  INVD1BWP U910 ( .I(\dec_logic/checksum/check[27] ), .ZN(n944) );
  INVD1BWP U911 ( .I(\dec_logic/checksum/check[26] ), .ZN(n945) );
  INVD1BWP U912 ( .I(\dec_logic/checksum/check[25] ), .ZN(n946) );
  MOAI22D0BWP U913 ( .A1(n761), .A2(n763), .B1(n757), .B2(
        \dec_logic/checksum/check[17] ), .ZN(Packet_To_Node[13]) );
  MOAI22D0BWP U914 ( .A1(n761), .A2(n977), .B1(n757), .B2(
        \dec_logic/checksum/check[11] ), .ZN(Packet_To_Node[7]) );
  MOAI22D0BWP U915 ( .A1(n761), .A2(n756), .B1(n757), .B2(
        \dec_logic/checksum/check[12] ), .ZN(Packet_To_Node[8]) );
  ND3D1BWP U916 ( .A1(n724), .A2(\dec_logic/checksum/check[25] ), .A3(n723), 
        .ZN(n564) );
  XOR2D1BWP U917 ( .A1(n529), .A2(n602), .Z(n730) );
  AOI21D1BWP U918 ( .A1(n722), .A2(n946), .B(n945), .ZN(n563) );
  CKND1BWP U919 ( .I(n716), .ZN(n697) );
  CKND1BWP U920 ( .I(n657), .ZN(n547) );
  NR2D1BWP U921 ( .A1(n654), .A2(n671), .ZN(n657) );
  ND2D1BWP U922 ( .A1(n671), .A2(\dec_logic/checksum/check[21] ), .ZN(n557) );
  CKND1BWP U923 ( .I(n840), .ZN(n845) );
  CKND0BWP U924 ( .I(n681), .ZN(n684) );
  AOI21D0BWP U925 ( .A1(n820), .A2(n822), .B(n814), .ZN(n885) );
  CKND1BWP U926 ( .I(n822), .ZN(n796) );
  CKND0BWP U927 ( .I(n520), .ZN(n648) );
  ND2D0BWP U928 ( .A1(n1011), .A2(n933), .ZN(n1012) );
  INVD1BWP U929 ( .I(n1025), .ZN(n1026) );
  INVD1BWP U930 ( .I(n772), .ZN(n635) );
  CKND0BWP U931 ( .I(n661), .ZN(n665) );
  NR2D0BWP U932 ( .A1(n962), .A2(n961), .ZN(n1035) );
  INVD1BWP U933 ( .I(\dec_logic/three_six_load[11] ), .ZN(n980) );
  INVD1BWP U934 ( .I(\enc_logic/checksum[7] ), .ZN(n968) );
  INVD1BWP U935 ( .I(\dec_logic/three_six_load[10] ), .ZN(n984) );
  OA21D1BWP U936 ( .A1(n906), .A2(n1040), .B(n607), .Z(n605) );
  XNR2D1BWP U937 ( .A1(n748), .A2(\dec_logic/three_six_load[9] ), .ZN(n754) );
  ND2D0BWP U938 ( .A1(n880), .A2(n892), .ZN(n878) );
  CKND0BWP U939 ( .I(n892), .ZN(n877) );
  NR2D1BWP U940 ( .A1(n744), .A2(n732), .ZN(n733) );
  AOI31D1BWP U941 ( .A1(n718), .A2(n717), .A3(n698), .B(n697), .ZN(n732) );
  ND2D1BWP U942 ( .A1(n713), .A2(n712), .ZN(n714) );
  INR2XD0BWP U943 ( .A1(n660), .B1(n662), .ZN(n656) );
  IND3D1BWP U944 ( .A1(n554), .B1(n542), .B2(n636), .ZN(n555) );
  CKND2D0BWP U945 ( .A1(n806), .A2(n820), .ZN(n805) );
  INVD1BWP U946 ( .I(n614), .ZN(n695) );
  AOI211D1BWP U947 ( .A1(n929), .A2(buf_to_mux[43]), .B(n1038), .C(n1037), 
        .ZN(n1039) );
  AOI32D1BWP U948 ( .A1(\enc_logic/checksum[22] ), .A2(n1036), .A3(n1035), 
        .B1(n1041), .B2(n1036), .ZN(n435) );
  CKND1BWP U949 ( .I(n930), .ZN(n516) );
  MOAI22D0BWP U950 ( .A1(n763), .A2(n616), .B1(n510), .B2(buf_to_mux[28]), 
        .ZN(data_to_tx[28]) );
  MOAI22D0BWP U951 ( .A1(n764), .A2(n616), .B1(n510), .B2(buf_to_mux[29]), 
        .ZN(data_to_tx[29]) );
  MOAI22D0BWP U952 ( .A1(n765), .A2(n616), .B1(n510), .B2(buf_to_mux[31]), 
        .ZN(data_to_tx[31]) );
  MOAI22D0BWP U953 ( .A1(n766), .A2(n616), .B1(n510), .B2(buf_to_mux[32]), 
        .ZN(data_to_tx[32]) );
  MOAI22D0BWP U954 ( .A1(n767), .A2(n616), .B1(n510), .B2(buf_to_mux[33]), 
        .ZN(data_to_tx[33]) );
  MOAI22D0BWP U955 ( .A1(n770), .A2(n616), .B1(n510), .B2(buf_to_mux[36]), 
        .ZN(data_to_tx[36]) );
  MOAI22D0BWP U956 ( .A1(n768), .A2(n616), .B1(n510), .B2(buf_to_mux[34]), 
        .ZN(data_to_tx[34]) );
  MOAI22D0BWP U957 ( .A1(n771), .A2(n616), .B1(n510), .B2(buf_to_mux[37]), 
        .ZN(data_to_tx[37]) );
  MOAI22D0BWP U958 ( .A1(n769), .A2(n616), .B1(n510), .B2(buf_to_mux[35]), 
        .ZN(data_to_tx[35]) );
  XNR2D0BWP U959 ( .A1(n798), .A2(n797), .ZN(n799) );
  ND2D8BWP U960 ( .A1(TX_Data_Valid), .A2(n1055), .ZN(\tHandshake/N12 ) );
  ND2D1BWP U961 ( .A1(tx_data_select[1]), .A2(n970), .ZN(n974) );
  NR2D0BWP U962 ( .A1(n965), .A2(n964), .ZN(n1030) );
  NR2D0BWP U963 ( .A1(n959), .A2(n958), .ZN(n1042) );
  CKND0BWP U964 ( .I(n787), .ZN(n789) );
  ND4D0BWP U965 ( .A1(n1008), .A2(n1007), .A3(n1006), .A4(n1005), .ZN(n1010)
         );
  INVD1BWP U966 ( .I(\enc_logic/checksum[9] ), .ZN(n922) );
  INVD1BWP U967 ( .I(\dec_logic/checksum/check[9] ), .ZN(n764) );
  INVD1BWP U968 ( .I(\dec_logic/checksum/check[8] ), .ZN(n763) );
  INVD1BWP U969 ( .I(\enc_logic/checksum[8] ), .ZN(n923) );
  INVD1BWP U970 ( .I(\dec_logic/checksum/check[13] ), .ZN(n767) );
  INVD1BWP U971 ( .I(\dec_logic/checksum/check[6] ), .ZN(n955) );
  NR2D1BWP U972 ( .A1(\dec_logic/checksum/check[21] ), .A2(
        \dec_logic/checksum/check[20] ), .ZN(n661) );
  INVD1BWP U973 ( .I(\enc_logic/checksum[21] ), .ZN(n964) );
  INVD1BWP U974 ( .I(\enc_logic/checksum[22] ), .ZN(n963) );
  INVD1BWP U975 ( .I(\dec_logic/three_six_load[9] ), .ZN(n979) );
  INVD1BWP U976 ( .I(\enc_logic/checksum[11] ), .ZN(n918) );
  INR2D0BWP U977 ( .A1(n928), .B1(n901), .ZN(n609) );
  CKND1BWP U978 ( .I(n590), .ZN(n513) );
  CKND0BWP U979 ( .I(n889), .ZN(n890) );
  CKND0BWP U980 ( .I(n846), .ZN(n839) );
  ND2D1BWP U981 ( .A1(n687), .A2(n686), .ZN(n708) );
  NR2XD0BWP U982 ( .A1(n826), .A2(n827), .ZN(n817) );
  ND2D1BWP U983 ( .A1(n540), .A2(n767), .ZN(n541) );
  IND2D1BWP U984 ( .A1(n582), .B1(n581), .ZN(n583) );
  AOI211D1BWP U985 ( .A1(n929), .A2(buf_to_mux[31]), .B(n1029), .C(n1028), 
        .ZN(n776) );
  AOI32D1BWP U986 ( .A1(\enc_logic/checksum[19] ), .A2(n1031), .A3(n1030), 
        .B1(n1041), .B2(n1031), .ZN(n441) );
  AOI32D1BWP U987 ( .A1(\enc_logic/checksum[25] ), .A2(n1043), .A3(n1042), 
        .B1(n1041), .B2(n1043), .ZN(n429) );
  OAI211D0BWP U988 ( .A1(n968), .A2(n923), .B(n615), .C(n922), .ZN(n924) );
  AO22D0BWP U989 ( .A1(n615), .A2(\enc_logic/checksum[10] ), .B1(n929), .B2(
        buf_to_mux[15]), .Z(n458) );
  AO22D0BWP U990 ( .A1(n615), .A2(\enc_logic/checksum[5] ), .B1(n929), .B2(
        buf_to_mux[4]), .Z(n469) );
  AO22D0BWP U991 ( .A1(n615), .A2(\enc_logic/check/N25 ), .B1(n929), .B2(
        buf_to_mux[3]), .Z(n470) );
  AO22D0BWP U992 ( .A1(n615), .A2(\enc_logic/checksum[12] ), .B1(n929), .B2(
        buf_to_mux[17]), .Z(n456) );
  AO22D0BWP U993 ( .A1(n615), .A2(\enc_logic/checksum[6] ), .B1(n929), .B2(
        buf_to_mux[5]), .Z(n468) );
  IND2D1BWP U994 ( .A1(\tHandshake/state[0] ), .B1(n936), .ZN(n581) );
  AO22D0BWP U995 ( .A1(n615), .A2(n926), .B1(n929), .B2(buf_to_mux[1]), .Z(
        n472) );
  INVD1BWP U996 ( .I(n938), .ZN(n1048) );
  CKND2D0BWP U997 ( .A1(n942), .A2(n6), .ZN(n997) );
  INR2D1BWP U998 ( .A1(n773), .B1(n628), .ZN(n600) );
  ND2D1BWP U999 ( .A1(\dec_logic/checksum/check[6] ), .A2(
        \dec_logic/checksum/check[5] ), .ZN(n640) );
  INVD1BWP U1000 ( .I(\dec_logic/three_six_load[4] ), .ZN(n976) );
  INVD1BWP U1001 ( .I(\dec_logic/three_six_load[1] ), .ZN(n990) );
  INVD1BWP U1002 ( .I(\enc_logic/checksum[17] ), .ZN(n967) );
  INVD1BWP U1003 ( .I(\enc_logic/checksum[19] ), .ZN(n966) );
  INVD1BWP U1004 ( .I(\enc_logic/checksum[26] ), .ZN(n959) );
  INVD1BWP U1005 ( .I(\enc_logic/checksum[13] ), .ZN(n912) );
  INVD1BWP U1006 ( .I(\enc_logic/checksum[15] ), .ZN(n910) );
  INVD1BWP U1007 ( .I(\dec_logic/checksum/check[7] ), .ZN(n969) );
  INVD1BWP U1008 ( .I(\dec_logic/checksum/check[14] ), .ZN(n768) );
  INVD1BWP U1009 ( .I(\dec_logic/checksum/check[22] ), .ZN(n949) );
  OAI21D1BWP U1010 ( .A1(n536), .A2(n1040), .B(n535), .ZN(n451) );
  IAO21D1BWP U1011 ( .A1(n607), .A2(n904), .B(n596), .ZN(n610) );
  AN2XD1BWP U1012 ( .A1(n745), .A2(n744), .Z(n570) );
  CKND0BWP U1013 ( .I(n896), .ZN(n899) );
  NR3D0BWP U1014 ( .A1(n746), .A2(n944), .A3(n984), .ZN(n566) );
  CKND1BWP U1015 ( .I(n867), .ZN(n869) );
  CKND0BWP U1016 ( .I(n715), .ZN(n698) );
  AOI31D0BWP U1017 ( .A1(\enc_logic/checksum[22] ), .A2(n856), .A3(n860), .B(
        n854), .ZN(n866) );
  AOI21D0BWP U1018 ( .A1(n864), .A2(n963), .B(n962), .ZN(n854) );
  OAI21D0BWP U1019 ( .A1(\enc_logic/checksum[23] ), .A2(
        \enc_logic/checksum[22] ), .B(n860), .ZN(n862) );
  AOI21D0BWP U1020 ( .A1(\enc_logic/checksum[20] ), .A2(n847), .B(n839), .ZN(
        n851) );
  CKND1BWP U1021 ( .I(n699), .ZN(n700) );
  OAI211D2BWP U1022 ( .A1(\dec_logic/checksum/check[21] ), .A2(n672), .B(n558), 
        .C(n557), .ZN(n673) );
  CKND1BWP U1023 ( .I(n855), .ZN(n857) );
  CKND1BWP U1024 ( .I(n708), .ZN(n710) );
  CKND1BWP U1025 ( .I(n523), .ZN(n683) );
  CKND1BWP U1026 ( .I(n696), .ZN(n682) );
  CKND0BWP U1027 ( .I(n522), .ZN(n540) );
  NR2D1BWP U1028 ( .A1(n695), .A2(n694), .ZN(n702) );
  ND2D1BWP U1029 ( .A1(n796), .A2(n820), .ZN(n806) );
  CKXOR2D1BWP U1030 ( .A1(n808), .A2(n810), .Z(n813) );
  AOI211D1BWP U1031 ( .A1(n929), .A2(buf_to_mux[37]), .B(n1033), .C(n1032), 
        .ZN(n1034) );
  OAI211D0BWP U1032 ( .A1(n784), .A2(n1040), .B(n782), .C(n781), .ZN(n449) );
  OAI211D0BWP U1033 ( .A1(n1019), .A2(n101), .B(n924), .C(n925), .ZN(n466) );
  OAI31D0BWP U1034 ( .A1(\main_control/state[1] ), .A2(n939), .A3(n997), .B(
        n935), .ZN(n998) );
  CKND2D1BWP U1035 ( .A1(n615), .A2(n910), .ZN(n914) );
  AOI31D0BWP U1036 ( .A1(n937), .A2(n939), .A3(n1010), .B(n1009), .ZN(n1014)
         );
  AO222D0BWP U1037 ( .A1(n929), .A2(buf_to_mux[33]), .B1(
        \enc_logic/checksum[19] ), .B2(n615), .C1(\enc_logic/checksum[13] ), 
        .C2(n928), .Z(n440) );
  AO222D0BWP U1038 ( .A1(n929), .A2(buf_to_mux[39]), .B1(
        \enc_logic/checksum[19] ), .B2(n928), .C1(n615), .C2(
        \enc_logic/checksum[22] ), .Z(n434) );
  AO222D0BWP U1039 ( .A1(n929), .A2(buf_to_mux[27]), .B1(
        \enc_logic/checksum[16] ), .B2(n615), .C1(\enc_logic/checksum[7] ), 
        .C2(n928), .Z(n446) );
  AO222D0BWP U1040 ( .A1(n929), .A2(buf_to_mux[40]), .B1(
        \enc_logic/checksum[20] ), .B2(n928), .C1(n615), .C2(
        \enc_logic/checksum[23] ), .Z(n433) );
  AO222D0BWP U1041 ( .A1(n929), .A2(buf_to_mux[28]), .B1(
        \enc_logic/checksum[17] ), .B2(n615), .C1(\enc_logic/checksum[8] ), 
        .C2(n928), .Z(n445) );
  ND3D0BWP U1042 ( .A1(n615), .A2(n780), .A3(n815), .ZN(n781) );
  AO222D0BWP U1043 ( .A1(n929), .A2(buf_to_mux[34]), .B1(
        \enc_logic/checksum[20] ), .B2(n615), .C1(\enc_logic/checksum[14] ), 
        .C2(n928), .Z(n439) );
  AO222D0BWP U1044 ( .A1(n929), .A2(buf_to_mux[35]), .B1(
        \enc_logic/checksum[21] ), .B2(n615), .C1(\enc_logic/checksum[15] ), 
        .C2(n928), .Z(n438) );
  AO222D0BWP U1045 ( .A1(n929), .A2(buf_to_mux[41]), .B1(
        \enc_logic/checksum[21] ), .B2(n928), .C1(n615), .C2(
        \enc_logic/checksum[24] ), .Z(n432) );
  AO222D0BWP U1046 ( .A1(n929), .A2(buf_to_mux[29]), .B1(
        \enc_logic/checksum[18] ), .B2(n615), .C1(\enc_logic/checksum[9] ), 
        .C2(n928), .Z(n444) );
  MAOI22D0BWP U1047 ( .A1(\tHandshake/state[0] ), .A2(n936), .B1(n619), .B2(
        n997), .ZN(n935) );
  ND3D0BWP U1048 ( .A1(n932), .A2(\main_control/state[3] ), .A3(n943), .ZN(
        n576) );
  CKND1BWP U1049 ( .I(n799), .ZN(n800) );
  OAI22D0BWP U1050 ( .A1(\main_control/state[3] ), .A2(n1050), .B1(n1017), 
        .B2(n1000), .ZN(n1009) );
  NR2D1BWP U1051 ( .A1(n1017), .A2(Packet_From_Node_Valid), .ZN(n936) );
  CKND2D0BWP U1052 ( .A1(n929), .A2(buf_to_mux[24]), .ZN(n782) );
  AOI22D0BWP U1053 ( .A1(n1055), .A2(n1053), .B1(n1054), .B2(n1052), .ZN(
        \tHandshake/next_state[0] ) );
  AO31D0BWP U1054 ( .A1(n934), .A2(n938), .A3(n941), .B(n1016), .Z(
        \main_control/next_state[3] ) );
  OA32D0BWP U1055 ( .A1(n1054), .A2(\tHandshake/state[0] ), .A3(TX_Data_Ready), 
        .B1(TX_Data_Valid), .B2(n1054), .Z(\tHandshake/next_state[1] ) );
  NR2D1BWP U1056 ( .A1(n1002), .A2(n999), .ZN(n932) );
  XNR2D1BWP U1057 ( .A1(n797), .A2(n968), .ZN(n802) );
  CKND0BWP U1058 ( .I(n797), .ZN(n786) );
  CKND0BWP U1059 ( .I(n622), .ZN(n1017) );
  NR2D1BWP U1060 ( .A1(n1003), .A2(n1002), .ZN(n1016) );
  NR2D8BWP U1061 ( .A1(n622), .A2(n621), .ZN(n929) );
  CKND2D1BWP U1062 ( .A1(n934), .A2(n1048), .ZN(n1013) );
  AOI21D0BWP U1063 ( .A1(n1051), .A2(n1050), .B(n1055), .ZN(n1054) );
  OAI21D0BWP U1064 ( .A1(\rHandshake/state[1] ), .A2(n1045), .B(n1048), .ZN(
        RX_Data_Ready) );
  XNR2D0BWP U1065 ( .A1(\dec_logic/checksum/check[7] ), .A2(n644), .ZN(n646)
         );
  INR2XD0BWP U1066 ( .A1(\main_control/state[2] ), .B1(n619), .ZN(n934) );
  NR2D0BWP U1067 ( .A1(n1049), .A2(n941), .ZN(Packet_To_Node_Valid) );
  CKND1BWP U1068 ( .I(n1049), .ZN(n775) );
  OAI31D0BWP U1069 ( .A1(\main_control/state[1] ), .A2(\main_control/state[3] ), .A3(n997), .B(n620), .ZN(n1001) );
  IAO21D0BWP U1070 ( .A1(\dec_logic/token ), .A2(tx_data_select[0]), .B(n974), 
        .ZN(data_to_tx[54]) );
  NR2D0BWP U1071 ( .A1(n1050), .A2(n6), .ZN(Core_Load_Ack) );
  AO21D0BWP U1072 ( .A1(n941), .A2(n1049), .B(\main_control/state[2] ), .Z(
        n1051) );
  CKND2D0BWP U1073 ( .A1(tx_data_select[0]), .A2(n970), .ZN(n972) );
  NR2D0BWP U1074 ( .A1(n942), .A2(n940), .ZN(n1046) );
  NR2D1BWP U1075 ( .A1(n1044), .A2(\rHandshake/state[0] ), .ZN(n938) );
  CKND0BWP U1076 ( .I(\main_control/state[3] ), .ZN(n939) );
  CKND2D0BWP U1077 ( .A1(\main_control/state[2] ), .A2(\main_control/state[3] ), .ZN(n620) );
  CKND2D0BWP U1078 ( .A1(\main_control/state[1] ), .A2(\main_control/state[3] ), .ZN(n1049) );
  INR2D0BWP U1079 ( .A1(n995), .B1(\main_control/state[1] ), .ZN(n937) );
  OAI21D0BWP U1080 ( .A1(n943), .A2(n996), .B(\main_control/state[3] ), .ZN(
        n1003) );
  NR2D1BWP U1081 ( .A1(n628), .A2(\dec_logic/checksum/check[10] ), .ZN(n625)
         );
  NR2D1BWP U1082 ( .A1(n954), .A2(n628), .ZN(n624) );
  XNR4D1BWP U1083 ( .A1(\dec_logic/three_six_load[6] ), .A2(
        \dec_logic/raw[12] ), .A3(\dec_logic/raw[14] ), .A4(n978), .ZN(n987)
         );
  XNR4D1BWP U1084 ( .A1(\dec_logic/three_six_load[0] ), .A2(\dec_logic/raw[0] ), .A3(\dec_logic/raw[2] ), .A4(n991), .ZN(n992) );
  CKND0BWP U1085 ( .I(\main_control/state[2] ), .ZN(n942) );
  CKND0BWP U1086 ( .I(TX_Data_Valid), .ZN(n1052) );
  AOI22D0BWP U1087 ( .A1(\dec_logic/checksum/check[25] ), .A2(
        \dec_logic/checksum/check[27] ), .B1(n944), .B2(n946), .ZN(n994) );
  NR2D1BWP U1088 ( .A1(\dec_logic/token ), .A2(n996), .ZN(n1011) );
  CKND1BWP U1089 ( .I(n825), .ZN(n823) );
  AOI22D0BWP U1090 ( .A1(\dec_logic/checksum/check[26] ), .A2(
        \dec_logic/checksum/check[22] ), .B1(n949), .B2(n945), .ZN(n988) );
  NR2D1BWP U1091 ( .A1(\dec_logic/checksum/check[25] ), .A2(
        \dec_logic/checksum/check[26] ), .ZN(n725) );
  NR2D1BWP U1092 ( .A1(\dec_logic/checksum/check[25] ), .A2(
        \dec_logic/checksum/check[24] ), .ZN(n601) );
  NR2D1BWP U1093 ( .A1(\enc_logic/checksum[18] ), .A2(\enc_logic/checksum[17] ), .ZN(n780) );
  NR2D1BWP U1094 ( .A1(\enc_logic/checksum[19] ), .A2(\enc_logic/checksum[20] ), .ZN(n841) );
  XNR2D1BWP U1095 ( .A1(\enc_logic/checksum[15] ), .A2(
        \enc_logic/checksum[16] ), .ZN(n825) );
  NR2D1BWP U1096 ( .A1(\enc_logic/checksum[8] ), .A2(\enc_logic/checksum[9] ), 
        .ZN(n785) );
  NR2D1BWP U1097 ( .A1(\enc_logic/checksum[5] ), .A2(\enc_logic/checksum[6] ), 
        .ZN(n787) );
  NR2D1BWP U1098 ( .A1(\dec_logic/checksum/check[27] ), .A2(
        \dec_logic/raw[20] ), .ZN(n739) );
  IND2D1BWP U1099 ( .A1(n515), .B1(n870), .ZN(n897) );
  ND2D1BWP U1100 ( .A1(n696), .A2(n524), .ZN(n703) );
  MUX2D1BWP U1101 ( .I0(n546), .I1(n545), .S(n526), .Z(n548) );
  MUX2D1BWP U1102 ( .I0(n656), .I1(n677), .S(n526), .Z(n655) );
  MUX2ND0BWP U1103 ( .I0(n984), .I1(n566), .S(n530), .ZN(n568) );
  INR2D1BWP U1104 ( .A1(n908), .B1(n903), .ZN(n534) );
  AOI22D1BWP U1105 ( .A1(n615), .A2(\enc_logic/checksum[14] ), .B1(n929), .B2(
        buf_to_mux[22]), .ZN(n535) );
  XNR2D1BWP U1106 ( .A1(n906), .A2(n534), .ZN(n536) );
  XOR2D1BWP U1107 ( .A1(\dec_logic/checksum/check[5] ), .A2(
        \dec_logic/checksum/check[6] ), .Z(n537) );
  MUX2ND0BWP U1108 ( .I0(\dec_logic/three_six_load[10] ), .I1(n567), .S(n747), 
        .ZN(n569) );
  OAI22D1BWP U1109 ( .A1(\dec_logic/three_six_load[8] ), .A2(n987), .B1(n985), 
        .B2(n986), .ZN(n574) );
  OAI22D1BWP U1110 ( .A1(n994), .A2(n993), .B1(\dec_logic/raw[1] ), .B2(n992), 
        .ZN(n575) );
  NR3D0BWP U1111 ( .A1(n573), .A2(n572), .A3(n571), .ZN(n577) );
  AOI221D1BWP U1112 ( .A1(\dec_logic/three_six_load[8] ), .A2(n987), .B1(n986), 
        .B2(n985), .C(n574), .ZN(n578) );
  AOI221D1BWP U1113 ( .A1(n994), .A2(n993), .B1(n992), .B2(\dec_logic/raw[1] ), 
        .C(n575), .ZN(n579) );
  AOI31D1BWP U1114 ( .A1(n579), .A2(n578), .A3(n577), .B(n576), .ZN(n580) );
  OAI22D1BWP U1115 ( .A1(n758), .A2(n769), .B1(n761), .B2(n980), .ZN(
        Packet_To_Node[11]) );
  OAI22D1BWP U1116 ( .A1(n758), .A2(n763), .B1(n761), .B2(n976), .ZN(
        Packet_To_Node[4]) );
  OAI22D1BWP U1117 ( .A1(n758), .A2(n951), .B1(n761), .B2(n768), .ZN(
        Packet_To_Node[16]) );
  OAI22D1BWP U1118 ( .A1(n758), .A2(n952), .B1(n761), .B2(n767), .ZN(
        Packet_To_Node[15]) );
  INVD1BWP U1119 ( .I(\dec_logic/three_six_load[3] ), .ZN(n586) );
  OAI22D1BWP U1120 ( .A1(n758), .A2(n969), .B1(n761), .B2(n586), .ZN(
        Packet_To_Node[3]) );
  OAI22D1BWP U1121 ( .A1(n758), .A2(n949), .B1(n761), .B2(n952), .ZN(
        Packet_To_Node[18]) );
  OAI22D1BWP U1122 ( .A1(n758), .A2(n950), .B1(n761), .B2(n769), .ZN(
        Packet_To_Node[17]) );
  INVD1BWP U1123 ( .I(\dec_logic/three_six_load[5] ), .ZN(n587) );
  OAI22D1BWP U1124 ( .A1(n758), .A2(n764), .B1(n761), .B2(n587), .ZN(
        Packet_To_Node[5]) );
  INVD1BWP U1125 ( .I(\dec_logic/three_six_load[6] ), .ZN(n588) );
  OAI22D1BWP U1126 ( .A1(n758), .A2(n954), .B1(n761), .B2(n588), .ZN(
        Packet_To_Node[6]) );
  OAI22D1BWP U1127 ( .A1(n758), .A2(n767), .B1(n761), .B2(n979), .ZN(
        Packet_To_Node[9]) );
  OA22D1BWP U1128 ( .A1(n824), .A2(n823), .B1(n822), .B2(n821), .Z(n589) );
  MAOI22D0BWP U1129 ( .A1(n757), .A2(n539), .B1(n761), .B2(
        \dec_logic/three_six_load[0] ), .ZN(Packet_To_Node[0]) );
  OAI22D1BWP U1130 ( .A1(n824), .A2(n823), .B1(n822), .B2(n821), .ZN(n829) );
  INVD1BWP U1131 ( .I(\enc_logic/checksum[5] ), .ZN(n779) );
  CKND2BWP U1132 ( .I(n615), .ZN(n1041) );
  IND3D2BWP U1133 ( .A1(n948), .B1(n674), .B2(n673), .ZN(n676) );
  ND2D1BWP U1134 ( .A1(n1048), .A2(n1047), .ZN(\rHandshake/next_state[1] ) );
  INVD1BWP U1135 ( .I(\dec_logic/checksum/check[12] ), .ZN(n766) );
  ND2D1BWP U1136 ( .A1(TX_Data_Ready), .A2(n1052), .ZN(n1053) );
  INVD1BWP U1137 ( .I(Packet_From_Node_Valid), .ZN(n1000) );
  INVD1BWP U1138 ( .I(buf_to_mux[7]), .ZN(n1019) );
  INVD1BWP U1139 ( .I(buf_to_mux[13]), .ZN(n1021) );
  ND2D1BWP U1140 ( .A1(\enc_logic/checksum[11] ), .A2(\enc_logic/checksum[10] ), .ZN(n916) );
  INVD1BWP U1141 ( .I(\enc_logic/checksum[12] ), .ZN(n919) );
  INVD1BWP U1142 ( .I(\enc_logic/checksum[10] ), .ZN(n920) );
  INVD1BWP U1143 ( .I(buf_to_mux[19]), .ZN(n1023) );
  ND2D1BWP U1144 ( .A1(\enc_logic/checksum[18] ), .A2(\enc_logic/checksum[17] ), .ZN(n1025) );
  ND2D1BWP U1145 ( .A1(\enc_logic/checksum[13] ), .A2(\enc_logic/checksum[14] ), .ZN(n913) );
  AN2XD1BWP U1146 ( .A1(n606), .A2(n906), .Z(n596) );
  INVD1BWP U1147 ( .I(n928), .ZN(n1040) );
  INVD1BWP U1148 ( .I(\enc_logic/checksum[27] ), .ZN(n958) );
  ND2D1BWP U1149 ( .A1(n893), .A2(n959), .ZN(n895) );
  ND2D1BWP U1150 ( .A1(n890), .A2(n960), .ZN(n891) );
  INVD1BWP U1151 ( .I(\enc_logic/checksum[25] ), .ZN(n960) );
  ND2D1BWP U1152 ( .A1(n870), .A2(n876), .ZN(n880) );
  ND2D1BWP U1153 ( .A1(n867), .A2(n872), .ZN(n870) );
  INVD1BWP U1154 ( .I(\enc_logic/checksum[24] ), .ZN(n961) );
  INVD1BWP U1155 ( .I(\enc_logic/checksum[23] ), .ZN(n962) );
  ND2D1BWP U1156 ( .A1(n855), .A2(n861), .ZN(n859) );
  INVD1BWP U1157 ( .I(\enc_logic/checksum[20] ), .ZN(n965) );
  INVD1BWP U1158 ( .I(\enc_logic/checksum[18] ), .ZN(n833) );
  ND2D1BWP U1159 ( .A1(n820), .A2(n825), .ZN(n821) );
  INVD1BWP U1160 ( .I(\enc_logic/checksum[16] ), .ZN(n815) );
  ND2D1BWP U1161 ( .A1(n803), .A2(\enc_logic/checksum[10] ), .ZN(n810) );
  ND2D1BWP U1162 ( .A1(n787), .A2(\enc_logic/check/N25 ), .ZN(n783) );
  INVD1BWP U1163 ( .I(\enc_logic/checksum[6] ), .ZN(n623) );
  INVD1BWP U1164 ( .I(\enc_logic/check/N25 ), .ZN(n784) );
  INVD1BWP U1165 ( .I(\dec_logic/three_six_load[8] ), .ZN(n756) );
  INVD1BWP U1166 ( .I(\dec_logic/three_six_load[2] ), .ZN(n613) );
  INVD1BWP U1167 ( .I(\dec_logic/checksum/check[18] ), .ZN(n953) );
  INVD1BWP U1168 ( .I(r_addr[3]), .ZN(n1008) );
  INVD1BWP U1169 ( .I(r_addr[1]), .ZN(n1007) );
  INVD1BWP U1170 ( .I(r_addr[2]), .ZN(n1006) );
  INVD1BWP U1171 ( .I(r_addr[0]), .ZN(n1005) );
  INVD1BWP U1172 ( .I(n937), .ZN(n1002) );
  INVD1BWP U1173 ( .I(\dec_logic/raw[20] ), .ZN(n982) );
  INVD1BWP U1174 ( .I(\dec_logic/three_six_load[7] ), .ZN(n977) );
  ND2D1BWP U1175 ( .A1(n701), .A2(n700), .ZN(n707) );
  ND2D1BWP U1176 ( .A1(n678), .A2(n677), .ZN(n679) );
  INVD1BWP U1177 ( .I(\dec_logic/checksum/check[17] ), .ZN(n771) );
  INVD1BWP U1178 ( .I(\dec_logic/checksum/check[11] ), .ZN(n765) );
  ND2D1BWP U1179 ( .A1(n764), .A2(n763), .ZN(n645) );
  INVD1BWP U1180 ( .I(n693), .ZN(n690) );
  ND2D1BWP U1181 ( .A1(n639), .A2(\dec_logic/checksum/check[7] ), .ZN(n643) );
  INVD1BWP U1182 ( .I(\rHandshake/state[1] ), .ZN(n1044) );
  ND2D1BWP U1183 ( .A1(data_type[0]), .A2(data_type[1]), .ZN(n996) );
  INVD1BWP U1184 ( .I(\dec_logic/token ), .ZN(n943) );
  OAI211D1BWP U1185 ( .A1(n1046), .A2(n1045), .B(RX_Data_Valid), .C(n1044), 
        .ZN(\rHandshake/next_state[0] ) );
  AOI32D1BWP U1186 ( .A1(\rHandshake/state[0] ), .A2(RX_Data_Valid), .A3(n1046), .B1(\rHandshake/state[1] ), .B2(RX_Data_Valid), .ZN(n1047) );
  AO22D1BWP U1187 ( .A1(address[1]), .A2(n618), .B1(n510), .B2(buf_to_mux[49]), 
        .Z(data_to_tx[49]) );
  AO22D1BWP U1188 ( .A1(address[2]), .A2(n618), .B1(n510), .B2(buf_to_mux[50]), 
        .Z(data_to_tx[50]) );
  AO22D1BWP U1189 ( .A1(address[0]), .A2(n618), .B1(n510), .B2(buf_to_mux[48]), 
        .Z(data_to_tx[48]) );
  AO22D1BWP U1190 ( .A1(address[3]), .A2(n618), .B1(n510), .B2(buf_to_mux[51]), 
        .Z(data_to_tx[51]) );
  IND4D1BWP U1191 ( .A1(n936), .B1(n930), .B2(n1004), .B3(n1013), .ZN(
        \main_control/next_state[1] ) );
  AOI211XD0BWP U1192 ( .A1(Core_Load_Ack), .A2(n939), .B(n932), .C(n931), .ZN(
        n1004) );
  AO21D1BWP U1193 ( .A1(n1016), .A2(n999), .B(n998), .Z(
        \main_control/next_select_sig[1] ) );
  IND4D1BWP U1194 ( .A1(n1015), .B1(n1014), .B2(n1013), .B3(n1012), .ZN(
        \main_control/next_state[2] ) );
  AO22D1BWP U1195 ( .A1(n929), .A2(buf_to_mux[2]), .B1(n615), .B2(n1024), .Z(
        n471) );
  OAI22D1BWP U1196 ( .A1(n1041), .A2(n917), .B1(n1021), .B2(n101), .ZN(n460)
         );
  AOI22D1BWP U1197 ( .A1(n919), .A2(n916), .B1(n920), .B2(n918), .ZN(n917) );
  MOAI22D0BWP U1198 ( .A1(\enc_logic/checksum[9] ), .A2(n925), .B1(n929), .B2(
        buf_to_mux[6]), .ZN(n467) );
  ND3D1BWP U1199 ( .A1(n615), .A2(n923), .A3(n968), .ZN(n925) );
  IOA21D1BWP U1200 ( .A1(buf_to_mux[12]), .A2(n929), .B(n921), .ZN(n461) );
  ND4D1BWP U1201 ( .A1(n615), .A2(n920), .A3(n919), .A4(n918), .ZN(n921) );
  AOI22D1BWP U1202 ( .A1(n929), .A2(buf_to_mux[32]), .B1(n928), .B2(
        \enc_logic/checksum[12] ), .ZN(n1031) );
  AOI22D1BWP U1203 ( .A1(n929), .A2(buf_to_mux[44]), .B1(n928), .B2(
        \enc_logic/checksum[24] ), .ZN(n1043) );
  MOAI22D0BWP U1204 ( .A1(n915), .A2(n914), .B1(n929), .B2(buf_to_mux[18]), 
        .ZN(n455) );
  AOI32D1BWP U1205 ( .A1(\enc_logic/checksum[16] ), .A2(n1027), .A3(n1026), 
        .B1(n1041), .B2(n1027), .ZN(n447) );
  AOI22D1BWP U1206 ( .A1(n929), .A2(buf_to_mux[26]), .B1(n928), .B2(
        \enc_logic/checksum[6] ), .ZN(n1027) );
  AOI22D1BWP U1207 ( .A1(n929), .A2(buf_to_mux[38]), .B1(n928), .B2(
        \enc_logic/checksum[18] ), .ZN(n1036) );
  MOAI22D0BWP U1208 ( .A1(n923), .A2(n1041), .B1(n929), .B2(buf_to_mux[10]), 
        .ZN(n463) );
  MOAI22D0BWP U1209 ( .A1(n918), .A2(n1041), .B1(n929), .B2(buf_to_mux[16]), 
        .ZN(n457) );
  AO21D1BWP U1210 ( .A1(n929), .A2(buf_to_mux[0]), .B(n1018), .Z(n473) );
  OAI222D1BWP U1211 ( .A1(n779), .A2(n1040), .B1(n1041), .B2(n778), .C1(n101), 
        .C2(n777), .ZN(n448) );
  AOI21D1BWP U1212 ( .A1(n1025), .A2(n815), .B(n780), .ZN(n778) );
  AO21D1BWP U1213 ( .A1(n929), .A2(buf_to_mux[14]), .B(n1022), .Z(n459) );
  AOI31D1BWP U1214 ( .A1(\enc_logic/checksum[12] ), .A2(
        \enc_logic/checksum[11] ), .A3(\enc_logic/checksum[10] ), .B(n1041), 
        .ZN(n1022) );
  AO21D1BWP U1215 ( .A1(n929), .A2(buf_to_mux[8]), .B(n1020), .Z(n465) );
  AOI31D1BWP U1216 ( .A1(\enc_logic/checksum[9] ), .A2(\enc_logic/checksum[8] ), .A3(\enc_logic/checksum[7] ), .B(n1041), .ZN(n1020) );
  AO222D1BWP U1217 ( .A1(n960), .A2(n1038), .B1(n928), .B2(
        \enc_logic/checksum[22] ), .C1(n929), .C2(buf_to_mux[42]), .Z(n431) );
  AO222D1BWP U1218 ( .A1(n963), .A2(n1033), .B1(n928), .B2(
        \enc_logic/checksum[16] ), .C1(n929), .C2(buf_to_mux[36]), .Z(n437) );
  AO222D1BWP U1219 ( .A1(n966), .A2(n1029), .B1(n928), .B2(
        \enc_logic/checksum[10] ), .C1(n929), .C2(buf_to_mux[30]), .Z(n443) );
  OAI21D1BWP U1220 ( .A1(n1040), .A2(n967), .B(n1034), .ZN(n436) );
  AOI211XD0BWP U1221 ( .A1(\enc_logic/checksum[23] ), .A2(
        \enc_logic/checksum[24] ), .B(\enc_logic/checksum[22] ), .C(n1041), 
        .ZN(n1032) );
  OAI21D1BWP U1222 ( .A1(n1040), .A2(n962), .B(n1039), .ZN(n430) );
  AOI211XD0BWP U1223 ( .A1(\enc_logic/checksum[26] ), .A2(
        \enc_logic/checksum[27] ), .B(\enc_logic/checksum[25] ), .C(n1041), 
        .ZN(n1037) );
  OAI21D1BWP U1224 ( .A1(n1040), .A2(n918), .B(n776), .ZN(n442) );
  AOI211XD0BWP U1225 ( .A1(\enc_logic/checksum[20] ), .A2(
        \enc_logic/checksum[21] ), .B(\enc_logic/checksum[19] ), .C(n1041), 
        .ZN(n1028) );
  OAI21D1BWP U1226 ( .A1(n603), .A2(n1040), .B(n604), .ZN(n927) );
  AOI22D1BWP U1227 ( .A1(n615), .A2(\enc_logic/checksum[13] ), .B1(n929), .B2(
        buf_to_mux[21]), .ZN(n604) );
  OAI21D1BWP U1228 ( .A1(n605), .A2(n905), .B(n610), .ZN(n450) );
  INR2D1BWP U1229 ( .A1(n908), .B1(n608), .ZN(n606) );
  XOR2D1BWP U1230 ( .A1(n902), .A2(n901), .Z(n905) );
  AOI22D1BWP U1231 ( .A1(n900), .A2(n899), .B1(n898), .B2(n897), .ZN(n902) );
  OA211D1BWP U1232 ( .A1(n1040), .A2(n908), .B(n904), .C(n911), .Z(n607) );
  AOI22D1BWP U1233 ( .A1(n615), .A2(\enc_logic/checksum[15] ), .B1(n929), .B2(
        buf_to_mux[23]), .ZN(n904) );
  INR2D1BWP U1234 ( .A1(n935), .B1(n612), .ZN(n611) );
  AOI22D1BWP U1235 ( .A1(n878), .A2(n879), .B1(n877), .B2(n876), .ZN(n896) );
  XOR2D1BWP U1236 ( .A1(\enc_logic/checksum[25] ), .A2(
        \enc_logic/checksum[24] ), .Z(n873) );
  XOR2D1BWP U1237 ( .A1(n898), .A2(n897), .Z(n900) );
  XNR2D1BWP U1238 ( .A1(n865), .A2(n863), .ZN(n867) );
  OAI22D1BWP U1239 ( .A1(n862), .A2(n861), .B1(n963), .B2(n962), .ZN(n863) );
  XNR2D1BWP U1240 ( .A1(n882), .A2(n881), .ZN(n898) );
  OAI21D1BWP U1241 ( .A1(n851), .A2(n850), .B(n859), .ZN(n881) );
  XNR3D1BWP U1242 ( .A1(n845), .A2(n844), .A3(n843), .ZN(n855) );
  XOR2D1BWP U1243 ( .A1(n843), .A2(n845), .Z(n850) );
  XOR3D1BWP U1244 ( .A1(n888), .A2(n887), .A3(n886), .Z(n882) );
  AOI22D1BWP U1245 ( .A1(n817), .A2(n816), .B1(\enc_logic/checksum[16] ), .B2(
        \enc_logic/checksum[15] ), .ZN(n818) );
  XOR3D1BWP U1246 ( .A1(n884), .A2(n883), .A3(n885), .Z(n887) );
  XOR3D1BWP U1247 ( .A1(n808), .A2(n805), .A3(n804), .Z(n819) );
  XNR3D1BWP U1248 ( .A1(\enc_logic/checksum[8] ), .A2(\enc_logic/checksum[9] ), 
        .A3(n802), .ZN(n803) );
  AOI22D1BWP U1249 ( .A1(n801), .A2(\enc_logic/checksum[12] ), .B1(
        \enc_logic/checksum[11] ), .B2(n800), .ZN(n812) );
  XNR3D1BWP U1250 ( .A1(\enc_logic/checksum[10] ), .A2(n922), .A3(n791), .ZN(
        n798) );
  XNR2D1BWP U1251 ( .A1(\enc_logic/checksum[8] ), .A2(\enc_logic/checksum[7] ), 
        .ZN(n791) );
  XNR2D1BWP U1252 ( .A1(\enc_logic/checksum[12] ), .A2(
        \enc_logic/checksum[11] ), .ZN(n793) );
  XOR2D1BWP U1253 ( .A1(n809), .A2(n811), .Z(n808) );
  XNR2D1BWP U1254 ( .A1(n790), .A2(n926), .ZN(n811) );
  IND2D1BWP U1255 ( .A1(n968), .B1(n786), .ZN(n790) );
  OAI22D1BWP U1256 ( .A1(n802), .A2(n785), .B1(n922), .B2(n923), .ZN(n809) );
  OAI22D1BWP U1257 ( .A1(n591), .A2(n948), .B1(n761), .B2(n951), .ZN(
        Packet_To_Node[19]) );
  OAI22D1BWP U1258 ( .A1(n591), .A2(n947), .B1(n761), .B2(n950), .ZN(
        Packet_To_Node[20]) );
  OAI22D1BWP U1259 ( .A1(n591), .A2(n768), .B1(n761), .B2(n984), .ZN(
        Packet_To_Node[10]) );
  OAI22D1BWP U1260 ( .A1(n591), .A2(n955), .B1(n761), .B2(n613), .ZN(
        Packet_To_Node[2]) );
  OAI22D1BWP U1261 ( .A1(n591), .A2(n770), .B1(n761), .B2(n969), .ZN(
        Packet_To_Node[12]) );
  OAI22D1BWP U1262 ( .A1(n591), .A2(n956), .B1(n761), .B2(n990), .ZN(
        Packet_To_Node[1]) );
  OAI22D1BWP U1263 ( .A1(n591), .A2(n953), .B1(n761), .B2(n764), .ZN(
        Packet_To_Node[14]) );
  XOR2D1BWP U1264 ( .A1(\dec_logic/checksum/check[27] ), .A2(
        \dec_logic/raw[20] ), .Z(n738) );
  OAI22D1BWP U1265 ( .A1(n721), .A2(n601), .B1(n946), .B2(n947), .ZN(n602) );
  XNR2D1BWP U1266 ( .A1(n707), .A2(n706), .ZN(n713) );
  XNR3D1BWP U1267 ( .A1(n704), .A2(n702), .A3(n703), .ZN(n709) );
  XNR3D1BWP U1268 ( .A1(n684), .A2(n683), .A3(n682), .ZN(n687) );
  XNR2D1BWP U1269 ( .A1(n614), .A2(n694), .ZN(n696) );
  AOI22D1BWP U1270 ( .A1(n646), .A2(n645), .B1(\dec_logic/checksum/check[8] ), 
        .B2(\dec_logic/checksum/check[9] ), .ZN(n689) );
  XNR2D1BWP U1271 ( .A1(n643), .A2(n642), .ZN(n693) );
  IND2D1BWP U1272 ( .A1(n951), .B1(n664), .ZN(n660) );
  AOI21D1BWP U1273 ( .A1(n937), .A2(n1003), .B(n1015), .ZN(n930) );
  XNR2D1BWP U1274 ( .A1(n812), .A2(n810), .ZN(n804) );
  XOR2D1BWP U1275 ( .A1(n813), .A2(n812), .Z(n814) );
  MUX2ND0BWP U1276 ( .I0(\dec_logic/three_six_load[7] ), .I1(n977), .S(
        \dec_logic/raw[13] ), .ZN(n978) );
  MUX2ND0BWP U1277 ( .I0(n979), .I1(\dec_logic/three_six_load[9] ), .S(
        \dec_logic/raw[19] ), .ZN(n986) );
  MUX2ND0BWP U1278 ( .I0(n980), .I1(\dec_logic/three_six_load[11] ), .S(
        \dec_logic/raw[18] ), .ZN(n981) );
  MUX2ND0BWP U1279 ( .I0(n982), .I1(\dec_logic/raw[20] ), .S(n981), .ZN(n983)
         );
  MUX2ND0BWP U1280 ( .I0(n984), .I1(\dec_logic/three_six_load[10] ), .S(n983), 
        .ZN(n985) );
  MUX2ND0BWP U1281 ( .I0(n948), .I1(\dec_logic/checksum/check[23] ), .S(n988), 
        .ZN(n989) );
  MUX2ND0BWP U1282 ( .I0(n947), .I1(\dec_logic/checksum/check[24] ), .S(n989), 
        .ZN(n993) );
  MUX2ND0BWP U1283 ( .I0(\dec_logic/three_six_load[1] ), .I1(n990), .S(
        \dec_logic/three_six_load[2] ), .ZN(n991) );
  NR4D0BWP U1284 ( .A1(\enc_logic/checksum[5] ), .A2(\enc_logic/checksum[6] ), 
        .A3(\enc_logic/check/N25 ), .A4(n1041), .ZN(n1018) );
endmodule

