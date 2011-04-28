
module router_core ( RX_Data, Clk_R, Rst_n, RX_Data_Valid, TX_Data_Ready, 
        Packet_From_Node_Valid, Packet_From_Node, Core_Load_Ack, 
        Packet_To_Node_Valid, RX_Data_Ready, TX_Data_Valid, TX_Data, 
        Packet_To_Node );
  input [54:0] RX_Data;
  input [28:0] Packet_From_Node;
  output [54:0] TX_Data;
  output [23:0] Packet_To_Node;
  input Clk_R, Rst_n, RX_Data_Valid, TX_Data_Ready, Packet_From_Node_Valid;
  output Core_Load_Ack, Packet_To_Node_Valid, RX_Data_Ready, TX_Data_Valid;
  wire   \tHandshake/next_state[1] , \dec_logic/token ,
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
         \main_control/next_select_sig[2] , \main_control/next_select_sig[0] ,
         \main_control/next_state[0] , \main_control/state[0] ,
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
         \dec_logic/checksum/encoder/N25 , n1, n2, n3, n4, n5, n6, n7, n8, n9,
         n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23,
         n24, n25, n26, n27, n29, n30, n31, n32, n62, n63, n68, n69, n74, n75,
         n80, n81, n114, n115, n116, n117, n118, n119, n120, n121, n122, n123,
         n124, n125, n126, n132, n133, n514, n515, n516, n517, n518, n519,
         n520, n521, n522, n523, n524, n525, n526, n527, n528, n529, n530,
         n531, n532, n533, n534, n535, n536, n537, n538, n539, n544, n545,
         n550, n551, n556, n557, n560, n561, n562, n563, n564, n565, n566,
         n567, n568, n569, n570, n571, n572, n573, n574, n575, n576, n577,
         n578, n579, n580, n581, n582, n583, n584, n585, n586, n587, n588,
         n589, n590, n591, n592, n593, n594, n595, n596, n597, n598, n599,
         n600, n601, n602, n603, n604, n605, n606, n607, n608, n609, n610,
         n611, n612, n613, n614, n615, n616, n617, n618, n619, n620, n621,
         n622, n623, n624, n625, n626, n627, n628, n629, n630, n631, n632,
         n633, n634, n635, n636, n637, n638, n639, n640, n641, n642, n643,
         n644, n645, n646, n647, n648, n649, n650, n651, n652, n653, n654,
         n655, n656, n657, n658, n659, n660, n661, n662, n663, n664, n665,
         n666, n667, n668, n669, n670, n671, n672, n673, n674, n675, n676,
         n677, n678, n679, n680, n681, n682, n683, n684, n685, n686, n687,
         n688, n689, n690, n691, n692, n693, n694, n695, n696, n697, n698,
         n699, n700, n701, n702, n703, n704, n705, n706, n707, n708, n709,
         n710, n711, n712, n713, n714, n715, n716, n717, n718, n719, n720,
         n721, n722, n723, n724, n725, n726, n727, n728, n729, n730, n731,
         n732, n733, n734, n735, n736, n737, n738, n739, n740, n741, n742,
         n743, n744, n745, n746, n747, n748, n749, n750, n751, n752, n753,
         n754, n755, n756, n757, n758, n759, n760, n761, n762, n763, n764,
         n765, n766, n767, n768, n769, n770, n771, n772, n773, n774, n775,
         n776, n777, n778, n779, n780, n781, n782, n783, n784, n785, n786,
         n787, n788, n789, n790, n791, n792, n793, n794, n795, n796, n797,
         n798, n799, n800, n801, n802, n803, n804, n805, n806, n807, n808,
         n809, n810, n811, n812, n813, n814, n815, n816, n817, n818, n819,
         n820, n821, n822, n823, n824, n825, n826, n827, n828, n829, n830,
         n831, n832, n833, n834, n835, n836, n837, n838, n839, n840, n841,
         n842, n843, n844, n845, n846, n847, n848, n849, n850, n851, n852,
         n853, n854, n855, n856, n857, n858, n859, n860, n861, n862, n863,
         n864, n865, n866, n867, n868, n869, n870, n871, n872, n873, n874,
         n875, n876, n877, n878, n879, n880, n881, n882, n883, n884, n885,
         n886, n887, n888, n889, n890, n891, n892, n893, n894, n895, n896,
         n897, n898, n899, n900, n901, n902, n903, n904, n905, n906, n907,
         n908, n909, n910, n911, n912, n913, n914, n915, n916, n917, n918,
         n919, n920, n921, n922, n923, n924, n925, n926, n927, n928, n929,
         n930, n931, n932, n933, n934, n935, n936, n937, n938, n939, n940,
         n941, n942, n943, n944, n945, n946, n947, n948, n949, n950, n951,
         n952, n953, n954, n955, n956, n957, n958, n959, n960, n961, n962,
         n963, n964, n965, n966, n967, n968, n969, n970, n971, n972, n973,
         n974, n975, n976, n977, n978;
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

  FD4QM1P \main_control/state_reg[0]  ( .D(\main_control/next_state[0] ), .CP(
        Clk_R), .SD(Rst_n), .Q(\main_control/state[0] ) );
  FD4QM1P \main_control/state_reg[2]  ( .D(n22), .CP(Clk_R), .SD(Rst_n), .Q(
        n23) );
  FD4QM1P \rHandshake/state_reg[0]  ( .D(n20), .CP(Clk_R), .SD(Rst_n), .Q(n21)
         );
  FD4QM1P \rHandshake/state_reg[1]  ( .D(n18), .CP(Clk_R), .SD(Rst_n), .Q(n19)
         );
  FD2QM1P \ever_versetile/out_reg[44]  ( .D(n514), .CP(Clk_R), .CD(Rst_n), .Q(
        buf_to_mux[44]) );
  FD2QM1P \ever_versetile/out_reg[42]  ( .D(n516), .CP(Clk_R), .CD(Rst_n), .Q(
        buf_to_mux[42]) );
  FD2QM1P \ever_versetile/out_reg[43]  ( .D(n515), .CP(Clk_R), .CD(Rst_n), .Q(
        buf_to_mux[43]) );
  FD2QM1P \ever_versetile/out_reg[41]  ( .D(n517), .CP(Clk_R), .CD(Rst_n), .Q(
        buf_to_mux[41]) );
  FD2QM1P \ever_versetile/out_reg[40]  ( .D(n518), .CP(Clk_R), .CD(Rst_n), .Q(
        buf_to_mux[40]) );
  FD2QM1P \ever_versetile/out_reg[39]  ( .D(n519), .CP(Clk_R), .CD(Rst_n), .Q(
        buf_to_mux[39]) );
  FD2QM1P \ever_versetile/out_reg[35]  ( .D(n523), .CP(Clk_R), .CD(Rst_n), .Q(
        buf_to_mux[35]) );
  FD2QM1P \ever_versetile/out_reg[34]  ( .D(n524), .CP(Clk_R), .CD(Rst_n), .Q(
        buf_to_mux[34]) );
  FD2QM1P \ever_versetile/out_reg[33]  ( .D(n525), .CP(Clk_R), .CD(Rst_n), .Q(
        buf_to_mux[33]) );
  FD2QM1P \ever_versetile/out_reg[29]  ( .D(n529), .CP(Clk_R), .CD(Rst_n), .Q(
        buf_to_mux[29]) );
  FD2QM1P \ever_versetile/out_reg[28]  ( .D(n530), .CP(Clk_R), .CD(Rst_n), .Q(
        buf_to_mux[28]) );
  FD2QM1P \ever_versetile/out_reg[27]  ( .D(n531), .CP(Clk_R), .CD(Rst_n), .Q(
        buf_to_mux[27]) );
  FD2QM1P \ever_versetile/out_reg[21]  ( .D(n537), .CP(Clk_R), .CD(Rst_n), .Q(
        buf_to_mux[21]) );
  FD2QM1P \ever_versetile/out_reg[14]  ( .D(n544), .CP(Clk_R), .CD(Rst_n), .Q(
        buf_to_mux[14]) );
  FD2QM1P \ever_versetile/out_reg[8]  ( .D(n550), .CP(Clk_R), .CD(Rst_n), .Q(
        buf_to_mux[8]) );
  FD2QM1P \ever_versetile/out_reg[1]  ( .D(n557), .CP(Clk_R), .CD(Rst_n), .Q(
        buf_to_mux[1]) );
  FD2QM1P \ever_versetile/out_reg[2]  ( .D(n556), .CP(Clk_R), .CD(Rst_n), .Q(
        buf_to_mux[2]) );
  FD2QM1P \ever_versetile/out_reg[7]  ( .D(n551), .CP(Clk_R), .CD(Rst_n), .Q(
        buf_to_mux[7]) );
  FD2QM1P \ever_versetile/out_reg[13]  ( .D(n545), .CP(Clk_R), .CD(Rst_n), .Q(
        buf_to_mux[13]) );
  FD2QM1P \ever_versetile/out_reg[19]  ( .D(n539), .CP(Clk_R), .CD(Rst_n), .Q(
        buf_to_mux[19]) );
  FD2QM1P \ever_versetile/out_reg[20]  ( .D(n538), .CP(Clk_R), .CD(Rst_n), .Q(
        buf_to_mux[20]) );
  FD2QM1P \ever_versetile/out_reg[22]  ( .D(n536), .CP(Clk_R), .CD(Rst_n), .Q(
        buf_to_mux[22]) );
  FD2QM1P \ever_versetile/out_reg[23]  ( .D(n535), .CP(Clk_R), .CD(Rst_n), .Q(
        buf_to_mux[23]) );
  FD2QM1P \ever_versetile/out_reg[24]  ( .D(n534), .CP(Clk_R), .CD(Rst_n), .Q(
        buf_to_mux[24]) );
  FD2QM1P \ever_versetile/out_reg[26]  ( .D(n532), .CP(Clk_R), .CD(Rst_n), .Q(
        buf_to_mux[26]) );
  FD2QM1P \ever_versetile/out_reg[25]  ( .D(n533), .CP(Clk_R), .CD(Rst_n), .Q(
        buf_to_mux[25]) );
  FD2QM1P \ever_versetile/out_reg[30]  ( .D(n528), .CP(Clk_R), .CD(Rst_n), .Q(
        buf_to_mux[30]) );
  FD2QM1P \ever_versetile/out_reg[32]  ( .D(n526), .CP(Clk_R), .CD(Rst_n), .Q(
        buf_to_mux[32]) );
  FD2QM1P \ever_versetile/out_reg[31]  ( .D(n527), .CP(Clk_R), .CD(Rst_n), .Q(
        buf_to_mux[31]) );
  FD2QM1P \ever_versetile/out_reg[36]  ( .D(n522), .CP(Clk_R), .CD(Rst_n), .Q(
        buf_to_mux[36]) );
  FD2QM1P \ever_versetile/out_reg[38]  ( .D(n520), .CP(Clk_R), .CD(Rst_n), .Q(
        buf_to_mux[38]) );
  FD2QM1P \ever_versetile/out_reg[37]  ( .D(n521), .CP(Clk_R), .CD(Rst_n), .Q(
        buf_to_mux[37]) );
  FD4QM1P \ever_versetile/out_reg[0]  ( .D(n16), .CP(Clk_R), .SD(Rst_n), .Q(
        n114) );
  FD4QM1P \ever_versetile/out_reg[3]  ( .D(n15), .CP(Clk_R), .SD(Rst_n), .Q(
        n115) );
  FD4QM1P \ever_versetile/out_reg[4]  ( .D(n14), .CP(Clk_R), .SD(Rst_n), .Q(
        n116) );
  FD4QM1P \ever_versetile/out_reg[5]  ( .D(n13), .CP(Clk_R), .SD(Rst_n), .Q(
        n117) );
  FD4QM1P \ever_versetile/out_reg[6]  ( .D(n12), .CP(Clk_R), .SD(Rst_n), .Q(
        n118) );
  FD4QM1P \ever_versetile/out_reg[9]  ( .D(n11), .CP(Clk_R), .SD(Rst_n), .Q(
        n119) );
  FD4QM1P \ever_versetile/out_reg[10]  ( .D(n10), .CP(Clk_R), .SD(Rst_n), .Q(
        n120) );
  FD4QM1P \ever_versetile/out_reg[11]  ( .D(n9), .CP(Clk_R), .SD(Rst_n), .Q(
        n121) );
  FD4QM1P \ever_versetile/out_reg[12]  ( .D(n8), .CP(Clk_R), .SD(Rst_n), .Q(
        n122) );
  FD4QM1P \ever_versetile/out_reg[15]  ( .D(n7), .CP(Clk_R), .SD(Rst_n), .Q(
        n123) );
  FD4QM1P \ever_versetile/out_reg[16]  ( .D(n6), .CP(Clk_R), .SD(Rst_n), .Q(
        n124) );
  FD4QM1P \ever_versetile/out_reg[17]  ( .D(n5), .CP(Clk_R), .SD(Rst_n), .Q(
        n125) );
  FD4QM1P \ever_versetile/out_reg[18]  ( .D(n4), .CP(Clk_R), .SD(Rst_n), .Q(
        n126) );
  FD4QM1P \tHandshake/state_reg[0]  ( .D(n2), .CP(Clk_R), .SD(Rst_n), .Q(n3)
         );
  FD2QM1P \tHandshake/state_reg[1]  ( .D(\tHandshake/next_state[1] ), .CP(
        Clk_R), .CD(Rst_n), .Q(TX_Data_Valid) );
  FD2QM1P \main_control/select_sig_reg[2]  ( .D(
        \main_control/next_select_sig[2] ), .CP(Clk_R), .CD(Rst_n), .Q(
        tx_data_select[2]) );
  FD4QM1P \main_control/select_sig_reg[1]  ( .D(n1), .CP(Clk_R), .SD(Rst_n), 
        .Q(n132) );
  FD2QM1P \main_control/select_sig_reg[0]  ( .D(
        \main_control/next_select_sig[0] ), .CP(Clk_R), .CD(Rst_n), .Q(
        tx_data_select[0]) );
  FD4QM1P \main_control/state_reg[1]  ( .D(n24), .CP(Clk_R), .SD(Rst_n), .Q(
        n25) );
  FD4QM1P \main_control/state_reg[3]  ( .D(n26), .CP(Clk_R), .SD(Rst_n), .Q(
        n27) );
  FD2LQM1P \tHandshake/TX_Data_reg[54]  ( .D(data_to_tx[54]), .LD(n560), .CP(
        Clk_R), .CD(Rst_n), .Q(TX_Data[54]) );
  FD2LQM1P \tHandshake/TX_Data_reg[19]  ( .D(n63), .LD(n560), .CP(Clk_R), .CD(
        Rst_n), .Q(TX_Data[19]) );
  FD2LQM1P \tHandshake/TX_Data_reg[18]  ( .D(data_to_tx[18]), .LD(n560), .CP(
        Clk_R), .CD(Rst_n), .Q(TX_Data[18]) );
  FD2LQM1P \tHandshake/TX_Data_reg[2]  ( .D(n80), .LD(n560), .CP(Clk_R), .CD(
        Rst_n), .Q(TX_Data[2]) );
  FD2LQM1P \tHandshake/TX_Data_reg[1]  ( .D(n81), .LD(n560), .CP(Clk_R), .CD(
        Rst_n), .Q(TX_Data[1]) );
  FD2LQM1P \tHandshake/TX_Data_reg[51]  ( .D(n29), .LD(n560), .CP(Clk_R), .CD(
        Rst_n), .Q(TX_Data[51]) );
  FD2LQM1P \tHandshake/TX_Data_reg[50]  ( .D(n30), .LD(n560), .CP(Clk_R), .CD(
        Rst_n), .Q(TX_Data[50]) );
  FD2LQM1P \tHandshake/TX_Data_reg[49]  ( .D(n31), .LD(n560), .CP(Clk_R), .CD(
        Rst_n), .Q(TX_Data[49]) );
  FD2LQM1P \tHandshake/TX_Data_reg[48]  ( .D(n32), .LD(n560), .CP(Clk_R), .CD(
        Rst_n), .Q(TX_Data[48]) );
  FD2LQM1P \tHandshake/TX_Data_reg[53]  ( .D(data_to_tx[53]), .LD(n560), .CP(
        Clk_R), .CD(Rst_n), .Q(TX_Data[53]) );
  FD2LQM1P \tHandshake/TX_Data_reg[52]  ( .D(data_to_tx[52]), .LD(n560), .CP(
        Clk_R), .CD(Rst_n), .Q(TX_Data[52]) );
  FD2LQM1P \tHandshake/TX_Data_reg[47]  ( .D(data_to_tx[47]), .LD(n560), .CP(
        Clk_R), .CD(Rst_n), .Q(TX_Data[47]) );
  FD2LQM1P \tHandshake/TX_Data_reg[46]  ( .D(data_to_tx[46]), .LD(n560), .CP(
        Clk_R), .CD(Rst_n), .Q(TX_Data[46]) );
  FD2LQM1P \tHandshake/TX_Data_reg[45]  ( .D(data_to_tx[45]), .LD(n560), .CP(
        Clk_R), .CD(Rst_n), .Q(TX_Data[45]) );
  FD2LQM1P \tHandshake/TX_Data_reg[44]  ( .D(data_to_tx[44]), .LD(n560), .CP(
        Clk_R), .CD(Rst_n), .Q(TX_Data[44]) );
  FD2LQM1P \tHandshake/TX_Data_reg[43]  ( .D(data_to_tx[43]), .LD(n560), .CP(
        Clk_R), .CD(Rst_n), .Q(TX_Data[43]) );
  FD2LQM1P \tHandshake/TX_Data_reg[42]  ( .D(data_to_tx[42]), .LD(n560), .CP(
        Clk_R), .CD(Rst_n), .Q(TX_Data[42]) );
  FD2LQM1P \tHandshake/TX_Data_reg[41]  ( .D(data_to_tx[41]), .LD(n560), .CP(
        Clk_R), .CD(Rst_n), .Q(TX_Data[41]) );
  FD2LQM1P \tHandshake/TX_Data_reg[40]  ( .D(data_to_tx[40]), .LD(n560), .CP(
        Clk_R), .CD(Rst_n), .Q(TX_Data[40]) );
  FD2LQM1P \tHandshake/TX_Data_reg[39]  ( .D(data_to_tx[39]), .LD(n560), .CP(
        Clk_R), .CD(Rst_n), .Q(TX_Data[39]) );
  FD2LQM1P \tHandshake/TX_Data_reg[38]  ( .D(data_to_tx[38]), .LD(n560), .CP(
        Clk_R), .CD(Rst_n), .Q(TX_Data[38]) );
  FD2LQM1P \tHandshake/TX_Data_reg[37]  ( .D(data_to_tx[37]), .LD(n560), .CP(
        Clk_R), .CD(Rst_n), .Q(TX_Data[37]) );
  FD2LQM1P \tHandshake/TX_Data_reg[36]  ( .D(data_to_tx[36]), .LD(n560), .CP(
        Clk_R), .CD(Rst_n), .Q(TX_Data[36]) );
  FD2LQM1P \tHandshake/TX_Data_reg[35]  ( .D(data_to_tx[35]), .LD(n560), .CP(
        Clk_R), .CD(Rst_n), .Q(TX_Data[35]) );
  FD2LQM1P \tHandshake/TX_Data_reg[34]  ( .D(data_to_tx[34]), .LD(n560), .CP(
        Clk_R), .CD(Rst_n), .Q(TX_Data[34]) );
  FD2LQM1P \tHandshake/TX_Data_reg[33]  ( .D(data_to_tx[33]), .LD(n560), .CP(
        Clk_R), .CD(Rst_n), .Q(TX_Data[33]) );
  FD2LQM1P \tHandshake/TX_Data_reg[32]  ( .D(data_to_tx[32]), .LD(n560), .CP(
        Clk_R), .CD(Rst_n), .Q(TX_Data[32]) );
  FD2LQM1P \tHandshake/TX_Data_reg[31]  ( .D(data_to_tx[31]), .LD(n560), .CP(
        Clk_R), .CD(Rst_n), .Q(TX_Data[31]) );
  FD2LQM1P \tHandshake/TX_Data_reg[30]  ( .D(data_to_tx[30]), .LD(n560), .CP(
        Clk_R), .CD(Rst_n), .Q(TX_Data[30]) );
  FD2LQM1P \tHandshake/TX_Data_reg[29]  ( .D(data_to_tx[29]), .LD(n560), .CP(
        Clk_R), .CD(Rst_n), .Q(TX_Data[29]) );
  FD2LQM1P \tHandshake/TX_Data_reg[28]  ( .D(data_to_tx[28]), .LD(n560), .CP(
        Clk_R), .CD(Rst_n), .Q(TX_Data[28]) );
  FD2LQM1P \tHandshake/TX_Data_reg[27]  ( .D(data_to_tx[27]), .LD(n560), .CP(
        Clk_R), .CD(Rst_n), .Q(TX_Data[27]) );
  FD2LQM1P \tHandshake/TX_Data_reg[26]  ( .D(data_to_tx[26]), .LD(n560), .CP(
        Clk_R), .CD(Rst_n), .Q(TX_Data[26]) );
  FD2LQM1P \tHandshake/TX_Data_reg[25]  ( .D(data_to_tx[25]), .LD(n560), .CP(
        Clk_R), .CD(Rst_n), .Q(TX_Data[25]) );
  FD2LQM1P \tHandshake/TX_Data_reg[24]  ( .D(data_to_tx[24]), .LD(n560), .CP(
        Clk_R), .CD(Rst_n), .Q(TX_Data[24]) );
  FD2LQM1P \tHandshake/TX_Data_reg[23]  ( .D(data_to_tx[23]), .LD(n560), .CP(
        Clk_R), .CD(Rst_n), .Q(TX_Data[23]) );
  FD2LQM1P \tHandshake/TX_Data_reg[22]  ( .D(data_to_tx[22]), .LD(n560), .CP(
        Clk_R), .CD(Rst_n), .Q(TX_Data[22]) );
  FD2LQM1P \tHandshake/TX_Data_reg[21]  ( .D(data_to_tx[21]), .LD(n560), .CP(
        Clk_R), .CD(Rst_n), .Q(TX_Data[21]) );
  FD2LQM1P \tHandshake/TX_Data_reg[8]  ( .D(n74), .LD(n560), .CP(Clk_R), .CD(
        Rst_n), .Q(TX_Data[8]) );
  FD2LQM1P \tHandshake/TX_Data_reg[7]  ( .D(n75), .LD(n560), .CP(Clk_R), .CD(
        Rst_n), .Q(TX_Data[7]) );
  FD2LQM1P \tHandshake/TX_Data_reg[20]  ( .D(n62), .LD(n560), .CP(Clk_R), .CD(
        Rst_n), .Q(TX_Data[20]) );
  FD2LQM1P \tHandshake/TX_Data_reg[14]  ( .D(n68), .LD(n560), .CP(Clk_R), .CD(
        Rst_n), .Q(TX_Data[14]) );
  FD2LQM1P \tHandshake/TX_Data_reg[13]  ( .D(n69), .LD(n560), .CP(Clk_R), .CD(
        Rst_n), .Q(TX_Data[13]) );
  FD2LQM1P \tHandshake/TX_Data_reg[17]  ( .D(data_to_tx[17]), .LD(n560), .CP(
        Clk_R), .CD(Rst_n), .Q(TX_Data[17]) );
  FD2LQM1P \tHandshake/TX_Data_reg[16]  ( .D(data_to_tx[16]), .LD(n560), .CP(
        Clk_R), .CD(Rst_n), .Q(TX_Data[16]) );
  FD2LQM1P \tHandshake/TX_Data_reg[15]  ( .D(data_to_tx[15]), .LD(n560), .CP(
        Clk_R), .CD(Rst_n), .Q(TX_Data[15]) );
  FD2LQM1P \tHandshake/TX_Data_reg[12]  ( .D(data_to_tx[12]), .LD(n560), .CP(
        Clk_R), .CD(Rst_n), .Q(TX_Data[12]) );
  FD2LQM1P \tHandshake/TX_Data_reg[11]  ( .D(data_to_tx[11]), .LD(n560), .CP(
        Clk_R), .CD(Rst_n), .Q(TX_Data[11]) );
  FD2LQM1P \tHandshake/TX_Data_reg[10]  ( .D(data_to_tx[10]), .LD(n560), .CP(
        Clk_R), .CD(Rst_n), .Q(TX_Data[10]) );
  FD2LQM1P \tHandshake/TX_Data_reg[9]  ( .D(data_to_tx[9]), .LD(n560), .CP(
        Clk_R), .CD(Rst_n), .Q(TX_Data[9]) );
  FD2LQM1P \tHandshake/TX_Data_reg[6]  ( .D(data_to_tx[6]), .LD(n560), .CP(
        Clk_R), .CD(Rst_n), .Q(TX_Data[6]) );
  FD2LQM1P \tHandshake/TX_Data_reg[5]  ( .D(data_to_tx[5]), .LD(n560), .CP(
        Clk_R), .CD(Rst_n), .Q(TX_Data[5]) );
  FD2LQM1P \tHandshake/TX_Data_reg[4]  ( .D(data_to_tx[4]), .LD(n560), .CP(
        Clk_R), .CD(Rst_n), .Q(TX_Data[4]) );
  FD2LQM1P \tHandshake/TX_Data_reg[3]  ( .D(data_to_tx[3]), .LD(n560), .CP(
        Clk_R), .CD(Rst_n), .Q(TX_Data[3]) );
  FD2LQM1P \tHandshake/TX_Data_reg[0]  ( .D(data_to_tx[0]), .LD(n560), .CP(
        Clk_R), .CD(Rst_n), .Q(TX_Data[0]) );
  FD2LQM1P \ever_versetile/out_reg[53]  ( .D(n17), .LD(n569), .CP(Clk_R), .CD(
        Rst_n), .Q(buf_to_mux[53]) );
  FD2LQM1P \ever_versetile/out_reg[52]  ( .D(\enc_logic/encode_type ), .LD(
        n569), .CP(Clk_R), .CD(Rst_n), .Q(buf_to_mux[52]) );
  FD2LQM1P \ever_versetile/out_reg[51]  ( .D(enc_to_buf[51]), .LD(n569), .CP(
        Clk_R), .CD(Rst_n), .Q(buf_to_mux[51]) );
  FD2LQM1P \ever_versetile/out_reg[50]  ( .D(enc_to_buf[50]), .LD(n569), .CP(
        Clk_R), .CD(Rst_n), .Q(buf_to_mux[50]) );
  FD2LQM1P \ever_versetile/out_reg[49]  ( .D(enc_to_buf[49]), .LD(n569), .CP(
        Clk_R), .CD(Rst_n), .Q(buf_to_mux[49]) );
  FD2LQM1P \ever_versetile/out_reg[48]  ( .D(enc_to_buf[48]), .LD(n569), .CP(
        Clk_R), .CD(Rst_n), .Q(buf_to_mux[48]) );
  FD2LQM1P \ever_versetile/out_reg[47]  ( .D(\enc_logic/checksum[27] ), .LD(
        n569), .CP(Clk_R), .CD(Rst_n), .Q(buf_to_mux[47]) );
  FD2LQM1P \ever_versetile/out_reg[46]  ( .D(\enc_logic/checksum[26] ), .LD(
        n569), .CP(Clk_R), .CD(Rst_n), .Q(buf_to_mux[46]) );
  FD2LQM1P \ever_versetile/out_reg[45]  ( .D(\enc_logic/checksum[25] ), .LD(
        n569), .CP(Clk_R), .CD(Rst_n), .Q(buf_to_mux[45]) );
  ND2I1M8P U634 ( .A(n3), .B(TX_Data_Valid), .Z(n560) );
  OAI21M2P U635 ( .A(n579), .B(\dec_logic/checksum/check[13] ), .C(n591), .Z(
        n580) );
  NR2M3P U636 ( .A(n580), .B(n717), .Z(n619) );
  OAI21M1P U637 ( .A(\enc_logic/checksum[25] ), .B(n801), .C(n818), .Z(n802)
         );
  NR2M1P U638 ( .A(n574), .B(n759), .Z(n672) );
  N1M2P U639 ( .A(n672), .Z(n673) );
  N1M1P U640 ( .A(\dec_logic/checksum/check[14] ), .Z(n717) );
  OA21M3P U641 ( .A(\main_control/state[0] ), .B(n922), .C(n776), .Z(n133) );
  N1M2P U642 ( .A(n913), .Z(n968) );
  N1M2P U643 ( .A(n133), .Z(n569) );
  AO21M1P U644 ( .A(n800), .B(n917), .C(n848), .Z(n561) );
  AOI21M1P U645 ( .A(n920), .B(n561), .C(n847), .Z(n801) );
  N1M1P U646 ( .A(n850), .Z(n562) );
  AOI22CDNM1P U647 ( .A(n851), .B(n852), .C(n852), .D(n851), .Z(n563) );
  MUX21LM1P U648 ( .A(n562), .B(n850), .S(n563), .Z(n868) );
  N1M1P U649 ( .A(n654), .Z(n564) );
  OAI21M1P U650 ( .A(n657), .B(n564), .C(n604), .Z(n638) );
  ND2BNM1P U651 ( .B(data_type[0]), .A(data_type[1]), .Z(n574) );
  AOI22M1P U652 ( .A(n968), .B(\enc_logic/checksum[14] ), .C(buf_to_mux[22]), 
        .D(n133), .Z(n565) );
  AOI22CDNM1P U653 ( .A(n869), .B(n868), .C(n868), .D(n869), .Z(n566) );
  AOI21M1P U654 ( .A(n867), .B(n566), .C(n921), .Z(n567) );
  OAI21M1P U655 ( .A(n867), .B(n566), .C(n567), .Z(n568) );
  ND2M1P U656 ( .A(n565), .B(n568), .Z(n536) );
  N1M1P U657 ( .A(n934), .Z(n570) );
  N1M1P U658 ( .A(n934), .Z(n571) );
  AOI211M2P U659 ( .A(n917), .B(n800), .C(n848), .D(n920), .Z(n847) );
  AOI21M1P U660 ( .A(n910), .B(n802), .C(n826), .Z(n803) );
  AO21M1P U661 ( .A(n903), .B(n794), .C(n842), .Z(n795) );
  OAI21M1P U662 ( .A(\enc_logic/checksum[10] ), .B(n786), .C(n810), .Z(n787)
         );
  OA211M1P U663 ( .A(n21), .B(n960), .C(n19), .D(RX_Data_Valid), .Z(n20) );
  N1M3P U664 ( .A(n940), .Z(n572) );
  N1M2P U665 ( .A(n574), .Z(n573) );
  NR3M3P U666 ( .A(tx_data_select[0]), .B(tx_data_select[2]), .C(n132), .Z(
        n940) );
  ND2M2P U667 ( .A(n569), .B(\enc_logic/encode_type ), .Z(n913) );
  NR2M3P U668 ( .A(\enc_logic/encode_type ), .B(n133), .Z(n911) );
  ND3M3P U669 ( .A(tx_data_select[2]), .B(n132), .C(n684), .Z(n934) );
  AOI211M2P U670 ( .A(n882), .B(n793), .C(n838), .D(n903), .Z(n842) );
  AOI211M2P U671 ( .A(n667), .B(n666), .C(n665), .D(n664), .Z(n669) );
  MUX21LFM2P U672 ( .A(n720), .B(\dec_logic/three_six_load[9] ), .S(n657), .Z(
        n663) );
  OAI21M2P U673 ( .A(n656), .B(n655), .C(n604), .Z(n657) );
  AOI211M3P U674 ( .A(n598), .B(n688), .C(n606), .D(n689), .Z(n605) );
  NR2M4P U675 ( .A(n598), .B(n688), .Z(n606) );
  AOI211M3P U676 ( .A(n580), .B(n717), .C(n619), .D(n715), .Z(n623) );
  AOI211M3P U677 ( .A(n577), .B(n711), .C(n618), .D(n712), .Z(n617) );
  NR2M4P U678 ( .A(n577), .B(n711), .Z(n618) );
  NR2M2P U679 ( .A(n910), .B(n802), .Z(n826) );
  OAI21M2P U680 ( .A(n597), .B(\dec_logic/checksum/check[21] ), .C(n596), .Z(
        n598) );
  NR2M2P U681 ( .A(n583), .B(n697), .Z(n625) );
  ND2M1P U682 ( .A(n582), .B(\dec_logic/checksum/check[16] ), .Z(n592) );
  AOI21M2P U683 ( .A(n581), .B(n715), .C(n623), .Z(n582) );
  ND2M1P U684 ( .A(n579), .B(\dec_logic/checksum/check[13] ), .Z(n591) );
  AOI21M2P U685 ( .A(n578), .B(n712), .C(n617), .Z(n579) );
  AO21M1P U686 ( .A(n892), .B(n788), .C(n833), .Z(n789) );
  ND2M1P U687 ( .A(n585), .B(\dec_logic/checksum/check[19] ), .Z(n593) );
  AOI21M2P U688 ( .A(n584), .B(n698), .C(n626), .Z(n585) );
  AOI211M2P U689 ( .A(n889), .B(n787), .C(n834), .D(n892), .Z(n833) );
  MUX21LM1P U690 ( .A(\dec_logic/three_six_load[11] ), .B(n718), .S(n652), .Z(
        n670) );
  NR2M1P U691 ( .A(n595), .B(n596), .Z(n644) );
  OAI21M2P U692 ( .A(n585), .B(\dec_logic/checksum/check[19] ), .C(n593), .Z(
        n586) );
  MUX21LM1P U693 ( .A(n642), .B(n633), .S(n632), .Z(n634) );
  AOI21M2P U694 ( .A(n586), .B(n703), .C(n628), .Z(n597) );
  NR2M2P U695 ( .A(n906), .B(n795), .Z(n841) );
  AND2M1P U696 ( .A(n660), .B(\dec_logic/checksum/check[27] ), .Z(n654) );
  AOI21M1P U697 ( .A(n638), .B(n653), .C(n637), .Z(n671) );
  FA1AM1P U698 ( .A(\dec_logic/checksum/check[9] ), .B(
        \dec_logic/checksum/check[8] ), .CI(n587), .CO(n613), .S(n752) );
  AOI211M2P U699 ( .A(n583), .B(n697), .C(n625), .D(n698), .Z(n626) );
  N1M1P U700 ( .A(n594), .Z(n595) );
  NR2M2P U701 ( .A(n586), .B(n703), .Z(n628) );
  N1M1P U702 ( .A(n27), .Z(n765) );
  N1M1P U703 ( .A(n911), .Z(n921) );
  NR2M2P U704 ( .A(n917), .B(n800), .Z(n848) );
  NR2M2P U705 ( .A(n896), .B(n797), .Z(n845) );
  NR2M2P U706 ( .A(n882), .B(n793), .Z(n838) );
  NR2M2P U707 ( .A(n894), .B(n789), .Z(n836) );
  NR2M2P U708 ( .A(n889), .B(n787), .Z(n834) );
  ND2M1P U709 ( .A(n686), .B(n25), .Z(n922) );
  OAI21M3P U710 ( .A(n752), .B(\dec_logic/checksum/check[10] ), .C(n588), .Z(
        n577) );
  ND2M2P U711 ( .A(n752), .B(\dec_logic/checksum/check[10] ), .Z(n588) );
  N1M1P U712 ( .A(\dec_logic/checksum/check[12] ), .Z(n712) );
  N1M1P U713 ( .A(\dec_logic/checksum/check[15] ), .Z(n715) );
  N1M1P U714 ( .A(\dec_logic/checksum/check[11] ), .Z(n711) );
  N1M1P U715 ( .A(\dec_logic/checksum/check[20] ), .Z(n703) );
  N1M1P U716 ( .A(\dec_logic/checksum/check[17] ), .Z(n697) );
  ND3M1P U717 ( .A(n23), .B(\main_control/state[0] ), .C(n685), .Z(n776) );
  N1M1P U718 ( .A(n934), .Z(n575) );
  N1M1P U719 ( .A(tx_data_select[0]), .Z(n684) );
  AND2M2P U720 ( .A(n821), .B(n820), .Z(n867) );
  N1M1P U721 ( .A(\enc_logic/checksum[11] ), .Z(n889) );
  N1M1P U722 ( .A(\enc_logic/checksum[12] ), .Z(n892) );
  N1M1P U723 ( .A(\enc_logic/checksum[13] ), .Z(n894) );
  N1M1P U724 ( .A(\enc_logic/checksum[16] ), .Z(n882) );
  N1M1P U725 ( .A(\enc_logic/checksum[17] ), .Z(n903) );
  N1M1P U726 ( .A(\enc_logic/checksum[18] ), .Z(n906) );
  N1M1P U727 ( .A(\enc_logic/checksum[23] ), .Z(n917) );
  N1M1P U728 ( .A(\enc_logic/checksum[24] ), .Z(n920) );
  N1M1P U729 ( .A(n23), .Z(n686) );
  OAI211M6P U730 ( .A(n671), .B(n670), .C(n669), .D(n668), .Z(n759) );
  AOI211M4P U731 ( .A(n602), .B(n691), .C(n608), .D(n695), .Z(n655) );
  NR2M2P U732 ( .A(n602), .B(n691), .Z(n608) );
  OAI21M2P U733 ( .A(n601), .B(\dec_logic/checksum/check[24] ), .C(n600), .Z(
        n602) );
  AOI21M2P U734 ( .A(n599), .B(n689), .C(n605), .Z(n601) );
  ND2M2P U735 ( .A(n597), .B(\dec_logic/checksum/check[21] ), .Z(n596) );
  OAI21M3P U736 ( .A(n582), .B(\dec_logic/checksum/check[16] ), .C(n592), .Z(
        n583) );
  ND2M2P U737 ( .A(\dec_logic/checksum/check[7] ), .B(n576), .Z(n589) );
  N1M1P U738 ( .A(\dec_logic/three_six_load[11] ), .Z(n718) );
  N1M1P U739 ( .A(\dec_logic/checksum/check[13] ), .Z(n713) );
  N1M1P U740 ( .A(\dec_logic/checksum/check[18] ), .Z(n698) );
  N1M1P U741 ( .A(\dec_logic/checksum/check[19] ), .Z(n699) );
  N1M1P U742 ( .A(\dec_logic/checksum/check[21] ), .Z(n701) );
  N1M1P U743 ( .A(\dec_logic/checksum/check[25] ), .Z(n691) );
  N1M1P U744 ( .A(\dec_logic/checksum/check[27] ), .Z(n693) );
  N1M1P U745 ( .A(\dec_logic/checksum/check[26] ), .Z(n695) );
  N1M1P U746 ( .A(\dec_logic/checksum/check[22] ), .Z(n688) );
  N1M1P U747 ( .A(\dec_logic/checksum/check[23] ), .Z(n689) );
  N1M1P U748 ( .A(n819), .Z(n820) );
  FA1AM1P U749 ( .A(n826), .B(n825), .CI(n824), .CO(n869), .S(n821) );
  AOI211M1P U750 ( .A(n959), .B(n958), .C(n952), .D(n951), .Z(n24) );
  ND2M1P U751 ( .A(n950), .B(n949), .Z(n951) );
  AOI211M1P U752 ( .A(n770), .B(n943), .C(n957), .D(n769), .Z(n950) );
  NR2M1P U753 ( .A(\dec_logic/token ), .B(n762), .Z(n769) );
  ND2M1P U754 ( .A(n601), .B(\dec_logic/checksum/check[24] ), .Z(n600) );
  N1M1P U755 ( .A(\main_control/state[0] ), .Z(n772) );
  NR2M1P U756 ( .A(n772), .B(n922), .Z(Core_Load_Ack) );
  OA21M1P U757 ( .A(\dec_logic/checksum/check[7] ), .B(n576), .C(n589), .Z(
        n587) );
  AO21M1P U758 ( .A(n577), .B(n711), .C(n618), .Z(n578) );
  AO21M1P U759 ( .A(n580), .B(n717), .C(n619), .Z(n581) );
  AO21M1P U760 ( .A(n583), .B(n697), .C(n625), .Z(n584) );
  N1M1P U761 ( .A(n588), .Z(n612) );
  FA1AM1P U762 ( .A(\dec_logic/checksum/check[6] ), .B(
        \dec_logic/checksum/check[5] ), .CI(\dec_logic/checksum/encoder/N25 ), 
        .CO(n590), .S(n576) );
  ENFM1P U763 ( .A(n590), .B(n589), .Z(n611) );
  N1M1P U764 ( .A(n591), .Z(n620) );
  N1M1P U765 ( .A(n592), .Z(n622) );
  N1M1P U766 ( .A(n593), .Z(n629) );
  AOI21M1P U767 ( .A(n596), .B(n595), .C(n644), .Z(n607) );
  AO21M1P U768 ( .A(n598), .B(n688), .C(n606), .Z(n599) );
  N1M1P U769 ( .A(n600), .Z(n609) );
  ND2M1P U770 ( .A(n656), .B(n655), .Z(n604) );
  AO21M1P U771 ( .A(n602), .B(n691), .C(n608), .Z(n603) );
  AOI21M1P U772 ( .A(n603), .B(n695), .C(n655), .Z(n660) );
  FA1AM1P U773 ( .A(n607), .B(n606), .CI(n605), .CO(n636), .S(n610) );
  FA1AM1P U774 ( .A(n610), .B(n609), .CI(n608), .CO(n635), .S(n656) );
  FA1AM1P U775 ( .A(n613), .B(n612), .CI(n611), .CO(n615), .S(n616) );
  ND4M1P U776 ( .A(\dec_logic/checksum/encoder/N25 ), .B(
        \dec_logic/checksum/check[7] ), .C(\dec_logic/checksum/check[5] ), .D(
        \dec_logic/checksum/check[6] ), .Z(n614) );
  ND2BNM1P U777 ( .B(n615), .A(n614), .Z(n641) );
  FA1AM1P U778 ( .A(n618), .B(n617), .CI(n616), .CO(n640), .S(n621) );
  FA1AM1P U779 ( .A(n621), .B(n620), .CI(n619), .CO(n639), .S(n624) );
  FA1AM1P U780 ( .A(n624), .B(n623), .CI(n622), .CO(n646), .S(n627) );
  FA1AM1P U781 ( .A(n627), .B(n626), .CI(n625), .CO(n645), .S(n630) );
  N1M1P U782 ( .A(n642), .Z(n633) );
  FA1AM1P U783 ( .A(n630), .B(n629), .CI(n628), .CO(n643), .S(n594) );
  ND3M1P U784 ( .A(n644), .B(n630), .C(n629), .Z(n631) );
  OAI21M1P U785 ( .A(n643), .B(n644), .C(n631), .Z(n632) );
  FA1AM1P U786 ( .A(n636), .B(n635), .CI(n634), .CO(n637), .S(n653) );
  FA1AM1P U787 ( .A(n641), .B(n640), .CI(n639), .CO(n651), .S(n647) );
  OAI21M1P U788 ( .A(n644), .B(n643), .C(n642), .Z(n650) );
  FA1AM1P U789 ( .A(n647), .B(n646), .CI(n645), .CO(n649), .S(n642) );
  NR2M1P U790 ( .A(n651), .B(n650), .Z(n648) );
  AOI211M1P U791 ( .A(n651), .B(n650), .C(n649), .D(n648), .Z(n652) );
  AOI22CDNM1P U792 ( .A(n653), .B(\dec_logic/three_six_load[10] ), .C(n653), 
        .D(\dec_logic/three_six_load[10] ), .Z(n667) );
  MAJN3M1P U793 ( .A(n656), .B(n655), .C(n654), .Z(n666) );
  N1M1P U794 ( .A(\dec_logic/three_six_load[9] ), .Z(n720) );
  ND2M1P U795 ( .A(n693), .B(\dec_logic/raw[20] ), .Z(n658) );
  OAI211M1P U796 ( .A(n663), .B(\dec_logic/raw[20] ), .C(n660), .D(n658), .Z(
        n662) );
  OAI211M1P U797 ( .A(\dec_logic/raw[20] ), .B(n693), .C(n663), .D(n658), .Z(
        n659) );
  ND2BNM1P U798 ( .B(n660), .A(n659), .Z(n661) );
  OAI211M1P U799 ( .A(n663), .B(\dec_logic/checksum/check[27] ), .C(n662), .D(
        n661), .Z(n665) );
  NR2M1P U800 ( .A(n667), .B(n666), .Z(n664) );
  ND2M1P U801 ( .A(n670), .B(n671), .Z(n668) );
  N1M1P U802 ( .A(\dec_logic/checksum/encoder/N25 ), .Z(n675) );
  N1M1P U803 ( .A(\dec_logic/three_six_load[0] ), .Z(n738) );
  AOI22M1P U804 ( .A(n672), .B(n675), .C(n738), .D(n574), .Z(Packet_To_Node[0]) );
  N1M1P U805 ( .A(\dec_logic/three_six_load[10] ), .Z(n719) );
  OAI22M1P U806 ( .A(n573), .B(n719), .C(n673), .D(n717), .Z(
        Packet_To_Node[10]) );
  OAI22M1P U807 ( .A(n573), .B(n718), .C(n673), .D(n715), .Z(
        Packet_To_Node[11]) );
  N1M1P U808 ( .A(\dec_logic/checksum/check[7] ), .Z(n678) );
  N1M1P U809 ( .A(\dec_logic/checksum/check[16] ), .Z(n696) );
  OAI22M1P U810 ( .A(n573), .B(n678), .C(n673), .D(n696), .Z(
        Packet_To_Node[12]) );
  N1M1P U811 ( .A(\dec_logic/checksum/check[8] ), .Z(n679) );
  OAI22M1P U812 ( .A(n573), .B(n679), .C(n673), .D(n697), .Z(
        Packet_To_Node[13]) );
  N1M1P U813 ( .A(\dec_logic/checksum/check[9] ), .Z(n680) );
  OAI22M1P U814 ( .A(n573), .B(n680), .C(n673), .D(n698), .Z(
        Packet_To_Node[14]) );
  OAI22M1P U815 ( .A(n573), .B(n713), .C(n673), .D(n699), .Z(
        Packet_To_Node[15]) );
  OAI22M1P U816 ( .A(n573), .B(n717), .C(n673), .D(n703), .Z(
        Packet_To_Node[16]) );
  OAI22M1P U817 ( .A(n573), .B(n715), .C(n673), .D(n701), .Z(
        Packet_To_Node[17]) );
  OAI22M1P U818 ( .A(n573), .B(n699), .C(n673), .D(n688), .Z(
        Packet_To_Node[18]) );
  OAI22M1P U819 ( .A(n573), .B(n703), .C(n673), .D(n689), .Z(
        Packet_To_Node[19]) );
  N1M1P U820 ( .A(\dec_logic/three_six_load[1] ), .Z(n739) );
  N1M1P U821 ( .A(\dec_logic/checksum/check[5] ), .Z(n676) );
  OAI22M1P U822 ( .A(n573), .B(n739), .C(n676), .D(n673), .Z(Packet_To_Node[1]) );
  N1M1P U823 ( .A(\dec_logic/checksum/check[24] ), .Z(n690) );
  OAI22M1P U824 ( .A(n573), .B(n701), .C(n673), .D(n690), .Z(
        Packet_To_Node[20]) );
  AOI21M1P U825 ( .A(n573), .B(n759), .C(n691), .Z(Packet_To_Node[21]) );
  AOI21M1P U826 ( .A(n573), .B(n759), .C(n695), .Z(Packet_To_Node[22]) );
  AOI21M1P U827 ( .A(n573), .B(n759), .C(n693), .Z(Packet_To_Node[23]) );
  N1M1P U828 ( .A(\dec_logic/three_six_load[2] ), .Z(n736) );
  N1M1P U829 ( .A(\dec_logic/checksum/check[6] ), .Z(n677) );
  OAI22M1P U830 ( .A(n573), .B(n736), .C(n677), .D(n673), .Z(Packet_To_Node[2]) );
  N1M1P U831 ( .A(\dec_logic/three_six_load[3] ), .Z(n735) );
  OAI22M1P U832 ( .A(n573), .B(n735), .C(n678), .D(n673), .Z(Packet_To_Node[3]) );
  N1M1P U833 ( .A(\dec_logic/three_six_load[4] ), .Z(n732) );
  OAI22M1P U834 ( .A(n573), .B(n732), .C(n679), .D(n673), .Z(Packet_To_Node[4]) );
  N1M1P U835 ( .A(\dec_logic/three_six_load[5] ), .Z(n730) );
  OAI22M1P U836 ( .A(n573), .B(n730), .C(n680), .D(n673), .Z(Packet_To_Node[5]) );
  N1M1P U837 ( .A(\dec_logic/three_six_load[6] ), .Z(n726) );
  N1M1P U838 ( .A(\dec_logic/checksum/check[10] ), .Z(n710) );
  OAI22M1P U839 ( .A(n573), .B(n726), .C(n673), .D(n710), .Z(Packet_To_Node[6]) );
  N1M1P U840 ( .A(\dec_logic/three_six_load[7] ), .Z(n725) );
  OAI22M1P U841 ( .A(n573), .B(n725), .C(n673), .D(n711), .Z(Packet_To_Node[7]) );
  N1M1P U842 ( .A(\dec_logic/three_six_load[8] ), .Z(n723) );
  OAI22M1P U843 ( .A(n573), .B(n723), .C(n673), .D(n712), .Z(Packet_To_Node[8]) );
  OAI22M1P U844 ( .A(n573), .B(n720), .C(n673), .D(n713), .Z(Packet_To_Node[9]) );
  NR2M1P U845 ( .A(n25), .B(n27), .Z(n768) );
  NR2BNM1P U846 ( .B(n768), .A(\main_control/state[0] ), .Z(
        Packet_To_Node_Valid) );
  N1M1P U847 ( .A(n19), .Z(n674) );
  ND2M1P U848 ( .A(n674), .B(n21), .Z(n958) );
  OAI21M1P U849 ( .A(n21), .B(n674), .C(n958), .Z(RX_Data_Ready) );
  N1M1P U850 ( .A(\dec_logic/raw[0] ), .Z(n737) );
  OAI22M1P U851 ( .A(n114), .B(n934), .C(n737), .D(n572), .Z(data_to_tx[0]) );
  OAI22M1P U852 ( .A(n120), .B(n934), .C(n732), .D(n572), .Z(data_to_tx[10])
         );
  OAI22M1P U853 ( .A(n121), .B(n934), .C(n730), .D(n572), .Z(data_to_tx[11])
         );
  N1M1P U854 ( .A(\dec_logic/raw[12] ), .Z(n724) );
  OAI22M1P U855 ( .A(n122), .B(n934), .C(n724), .D(n572), .Z(data_to_tx[12])
         );
  OAI22M1P U856 ( .A(n123), .B(n934), .C(n726), .D(n572), .Z(data_to_tx[15])
         );
  OAI22M1P U857 ( .A(n124), .B(n934), .C(n725), .D(n572), .Z(data_to_tx[16])
         );
  OAI22M1P U858 ( .A(n125), .B(n934), .C(n723), .D(n572), .Z(data_to_tx[17])
         );
  OAI22CDNM1P U859 ( .A(n126), .B(n934), .C(\dec_logic/raw[18] ), .D(n940), 
        .Z(data_to_tx[18]) );
  OAI22CDNM1P U860 ( .A(n720), .B(n572), .C(buf_to_mux[21]), .D(n570), .Z(
        data_to_tx[21]) );
  OAI22CDNM1P U861 ( .A(n719), .B(n572), .C(buf_to_mux[22]), .D(n571), .Z(
        data_to_tx[22]) );
  OAI22CDNM1P U862 ( .A(n718), .B(n572), .C(buf_to_mux[23]), .D(n571), .Z(
        data_to_tx[23]) );
  OAI22CDNM1P U863 ( .A(n675), .B(n572), .C(buf_to_mux[24]), .D(n571), .Z(
        data_to_tx[24]) );
  OAI22CDNM1P U864 ( .A(n676), .B(n572), .C(buf_to_mux[25]), .D(n571), .Z(
        data_to_tx[25]) );
  OAI22CDNM1P U865 ( .A(n677), .B(n572), .C(buf_to_mux[26]), .D(n571), .Z(
        data_to_tx[26]) );
  OAI22CDNM1P U866 ( .A(n678), .B(n572), .C(buf_to_mux[27]), .D(n575), .Z(
        data_to_tx[27]) );
  OAI22CDNM1P U867 ( .A(n679), .B(n572), .C(buf_to_mux[28]), .D(n575), .Z(
        data_to_tx[28]) );
  OAI22CDNM1P U868 ( .A(n680), .B(n572), .C(buf_to_mux[29]), .D(n575), .Z(
        data_to_tx[29]) );
  OAI22CDNM1P U869 ( .A(n710), .B(n572), .C(buf_to_mux[30]), .D(n575), .Z(
        data_to_tx[30]) );
  OAI22CDNM1P U870 ( .A(n711), .B(n572), .C(buf_to_mux[31]), .D(n575), .Z(
        data_to_tx[31]) );
  OAI22CDNM1P U871 ( .A(n712), .B(n572), .C(buf_to_mux[32]), .D(n575), .Z(
        data_to_tx[32]) );
  OAI22CDNM1P U872 ( .A(n713), .B(n572), .C(buf_to_mux[33]), .D(n570), .Z(
        data_to_tx[33]) );
  OAI22CDNM1P U873 ( .A(n717), .B(n572), .C(buf_to_mux[34]), .D(n570), .Z(
        data_to_tx[34]) );
  OAI22CDNM1P U874 ( .A(n715), .B(n572), .C(buf_to_mux[35]), .D(n570), .Z(
        data_to_tx[35]) );
  OAI22CDNM1P U875 ( .A(n696), .B(n572), .C(buf_to_mux[36]), .D(n570), .Z(
        data_to_tx[36]) );
  OAI22CDNM1P U876 ( .A(n697), .B(n572), .C(buf_to_mux[37]), .D(n570), .Z(
        data_to_tx[37]) );
  OAI22CDNM1P U877 ( .A(n698), .B(n572), .C(buf_to_mux[38]), .D(n570), .Z(
        data_to_tx[38]) );
  OAI22CDNM1P U878 ( .A(n699), .B(n572), .C(buf_to_mux[39]), .D(n570), .Z(
        data_to_tx[39]) );
  OAI22M1P U879 ( .A(n115), .B(n934), .C(n738), .D(n572), .Z(data_to_tx[3]) );
  OAI22CDNM1P U880 ( .A(n703), .B(n572), .C(buf_to_mux[40]), .D(n570), .Z(
        data_to_tx[40]) );
  OAI22CDNM1P U881 ( .A(n701), .B(n572), .C(buf_to_mux[41]), .D(n570), .Z(
        data_to_tx[41]) );
  OAI22CDNM1P U882 ( .A(n688), .B(n572), .C(buf_to_mux[42]), .D(n570), .Z(
        data_to_tx[42]) );
  OAI22CDNM1P U883 ( .A(n689), .B(n572), .C(buf_to_mux[43]), .D(n570), .Z(
        data_to_tx[43]) );
  OAI22CDNM1P U884 ( .A(n690), .B(n572), .C(buf_to_mux[44]), .D(n570), .Z(
        data_to_tx[44]) );
  OAI22CDNM1P U885 ( .A(n691), .B(n572), .C(n571), .D(buf_to_mux[45]), .Z(
        data_to_tx[45]) );
  OAI22CDNM1P U886 ( .A(n695), .B(n572), .C(n570), .D(buf_to_mux[46]), .Z(
        data_to_tx[46]) );
  OAI22CDNM1P U887 ( .A(n693), .B(n572), .C(n570), .D(buf_to_mux[47]), .Z(
        data_to_tx[47]) );
  OAI22M1P U888 ( .A(n116), .B(n934), .C(n739), .D(n572), .Z(data_to_tx[4]) );
  AOI22M1P U889 ( .A(data_type[0]), .B(n940), .C(n571), .D(buf_to_mux[52]), 
        .Z(n681) );
  OR2M1P U890 ( .A(tx_data_select[2]), .B(n684), .Z(n682) );
  ND2M1P U891 ( .A(n681), .B(n682), .Z(data_to_tx[52]) );
  AOI22M1P U892 ( .A(data_type[1]), .B(n940), .C(n571), .D(buf_to_mux[53]), 
        .Z(n683) );
  ND2M1P U893 ( .A(n683), .B(n682), .Z(data_to_tx[53]) );
  N1M1P U894 ( .A(\dec_logic/token ), .Z(n767) );
  AOI211M1P U895 ( .A(n767), .B(n684), .C(tx_data_select[2]), .D(n132), .Z(
        data_to_tx[54]) );
  OAI22M1P U896 ( .A(n117), .B(n934), .C(n736), .D(n572), .Z(data_to_tx[5]) );
  N1M1P U897 ( .A(\dec_logic/raw[6] ), .Z(n731) );
  OAI22M1P U898 ( .A(n118), .B(n934), .C(n731), .D(n572), .Z(data_to_tx[6]) );
  OAI22M1P U899 ( .A(n119), .B(n934), .C(n735), .D(n572), .Z(data_to_tx[9]) );
  NR2M1P U900 ( .A(n25), .B(n765), .Z(n685) );
  NR2M1P U901 ( .A(Packet_From_Node_Valid), .B(n776), .Z(n952) );
  N1M1P U902 ( .A(n3), .Z(n973) );
  NR3M1P U903 ( .A(n25), .B(n686), .C(n765), .Z(n687) );
  AOI22M1P U904 ( .A(n952), .B(n973), .C(n687), .D(n772), .Z(n974) );
  AOI22M1P U905 ( .A(\dec_logic/checksum/check[22] ), .B(
        \dec_logic/checksum/check[23] ), .C(n689), .D(n688), .Z(n709) );
  AOI22M1P U906 ( .A(\dec_logic/checksum/check[24] ), .B(
        \dec_logic/checksum/check[25] ), .C(n691), .D(n690), .Z(n692) );
  MUX21LM1P U907 ( .A(n693), .B(\dec_logic/checksum/check[27] ), .S(n692), .Z(
        n694) );
  MUX21LM1P U908 ( .A(n695), .B(\dec_logic/checksum/check[26] ), .S(n694), .Z(
        n708) );
  AOI22M1P U909 ( .A(\dec_logic/checksum/check[16] ), .B(
        \dec_logic/checksum/check[17] ), .C(n697), .D(n696), .Z(n705) );
  AOI22M1P U910 ( .A(\dec_logic/checksum/check[18] ), .B(
        \dec_logic/checksum/check[19] ), .C(n699), .D(n698), .Z(n700) );
  MUX21LM1P U911 ( .A(n701), .B(\dec_logic/checksum/check[21] ), .S(n700), .Z(
        n702) );
  MUX21LM1P U912 ( .A(n703), .B(\dec_logic/checksum/check[20] ), .S(n702), .Z(
        n704) );
  OR2M1P U913 ( .A(n705), .B(n704), .Z(n707) );
  AOI22M1P U914 ( .A(n709), .B(n708), .C(n705), .D(n704), .Z(n706) );
  OAI211M1P U915 ( .A(n709), .B(n708), .C(n707), .D(n706), .Z(n761) );
  AOI22M1P U916 ( .A(\dec_logic/checksum/check[10] ), .B(
        \dec_logic/checksum/check[11] ), .C(n711), .D(n710), .Z(n755) );
  AOI22M1P U917 ( .A(\dec_logic/checksum/check[12] ), .B(
        \dec_logic/checksum/check[13] ), .C(n713), .D(n712), .Z(n714) );
  MUX21LM1P U918 ( .A(n715), .B(\dec_logic/checksum/check[15] ), .S(n714), .Z(
        n716) );
  MUX21LM1P U919 ( .A(n717), .B(\dec_logic/checksum/check[14] ), .S(n716), .Z(
        n754) );
  AOI22M1P U920 ( .A(\dec_logic/three_six_load[11] ), .B(
        \dec_logic/three_six_load[10] ), .C(n719), .D(n718), .Z(n722) );
  N1M1P U921 ( .A(\dec_logic/raw[20] ), .Z(n936) );
  AOI22M1P U922 ( .A(\dec_logic/three_six_load[9] ), .B(n936), .C(
        \dec_logic/raw[20] ), .D(n720), .Z(n721) );
  EN3M1P U923 ( .A(\dec_logic/raw[19] ), .B(n722), .C(n721), .Z(n750) );
  AOI22M1P U924 ( .A(\dec_logic/three_six_load[8] ), .B(\dec_logic/raw[12] ), 
        .C(n724), .D(n723), .Z(n729) );
  N1M1P U925 ( .A(\dec_logic/raw[13] ), .Z(n930) );
  AOI22M1P U926 ( .A(\dec_logic/three_six_load[7] ), .B(\dec_logic/raw[13] ), 
        .C(n930), .D(n725), .Z(n728) );
  N1M1P U927 ( .A(\dec_logic/raw[14] ), .Z(n932) );
  AOI22M1P U928 ( .A(\dec_logic/three_six_load[6] ), .B(\dec_logic/raw[14] ), 
        .C(n932), .D(n726), .Z(n727) );
  EN3M1P U929 ( .A(n729), .B(n728), .C(n727), .Z(n748) );
  AOI22M1P U930 ( .A(\dec_logic/three_six_load[5] ), .B(\dec_logic/raw[6] ), 
        .C(n731), .D(n730), .Z(n746) );
  N1M1P U931 ( .A(\dec_logic/raw[8] ), .Z(n928) );
  N1M1P U932 ( .A(\dec_logic/raw[7] ), .Z(n927) );
  AOI22M1P U933 ( .A(\dec_logic/three_six_load[4] ), .B(\dec_logic/raw[7] ), 
        .C(n927), .D(n732), .Z(n733) );
  MUX21LM1P U934 ( .A(n928), .B(\dec_logic/raw[8] ), .S(n733), .Z(n734) );
  MUX21LM1P U935 ( .A(n735), .B(\dec_logic/three_six_load[3] ), .S(n734), .Z(
        n745) );
  AOI22M1P U936 ( .A(\dec_logic/three_six_load[2] ), .B(\dec_logic/raw[0] ), 
        .C(n737), .D(n736), .Z(n741) );
  AOI22M1P U937 ( .A(\dec_logic/three_six_load[0] ), .B(n739), .C(
        \dec_logic/three_six_load[1] ), .D(n738), .Z(n740) );
  EN3M1P U938 ( .A(\dec_logic/raw[2] ), .B(n741), .C(n740), .Z(n742) );
  OR2M1P U939 ( .A(n742), .B(\dec_logic/raw[1] ), .Z(n744) );
  AOI22M1P U940 ( .A(n746), .B(n745), .C(\dec_logic/raw[1] ), .D(n742), .Z(
        n743) );
  OAI211M1P U941 ( .A(n746), .B(n745), .C(n744), .D(n743), .Z(n747) );
  AOI211M1P U942 ( .A(\dec_logic/raw[18] ), .B(n750), .C(n748), .D(n747), .Z(
        n749) );
  OAI21M1P U943 ( .A(\dec_logic/raw[18] ), .B(n750), .C(n749), .Z(n751) );
  AOI21M1P U944 ( .A(n755), .B(n754), .C(n751), .Z(n753) );
  OAI211M1P U945 ( .A(n755), .B(n754), .C(n753), .D(n752), .Z(n760) );
  NR3M1P U946 ( .A(data_type[0]), .B(data_type[1]), .C(\dec_logic/token ), .Z(
        n756) );
  NR3M1P U947 ( .A(n756), .B(address[2]), .C(address[0]), .Z(n758) );
  ND3M1P U948 ( .A(n767), .B(data_type[1]), .C(data_type[0]), .Z(n955) );
  N1M1P U949 ( .A(n955), .Z(n771) );
  NR3M1P U950 ( .A(n771), .B(address[3]), .C(address[1]), .Z(n757) );
  ND2M1P U951 ( .A(n758), .B(n757), .Z(n977) );
  ND3M1P U952 ( .A(n23), .B(\main_control/state[0] ), .C(n25), .Z(n944) );
  NR3M1P U953 ( .A(n27), .B(n977), .C(n944), .Z(n947) );
  OAI211M1P U954 ( .A(n761), .B(n760), .C(n947), .D(n759), .Z(n762) );
  ND3M1P U955 ( .A(n23), .B(n25), .C(n772), .Z(n975) );
  AOI22M1P U956 ( .A(n27), .B(n975), .C(n23), .D(n765), .Z(n764) );
  AOI211M1P U957 ( .A(n768), .B(\main_control/state[0] ), .C(n769), .D(n764), 
        .Z(n763) );
  ND2M1P U958 ( .A(n974), .B(n763), .Z(\main_control/next_select_sig[0] ) );
  N1M1P U959 ( .A(n922), .Z(n773) );
  AOI22DNM1P U960 ( .A(n27), .B(n773), .D(n776), .C(Packet_From_Node_Valid), 
        .Z(n953) );
  NR3M1P U961 ( .A(n23), .B(n25), .C(n765), .Z(n959) );
  ND2M1P U962 ( .A(n959), .B(n772), .Z(n954) );
  ND3CNM1P U963 ( .C(n764), .A(n953), .B(n954), .Z(
        \main_control/next_select_sig[2] ) );
  N1M1P U964 ( .A(n944), .Z(n770) );
  ND2M1P U965 ( .A(data_type[0]), .B(data_type[1]), .Z(n766) );
  OAI21M1P U966 ( .A(n767), .B(n766), .C(n765), .Z(n943) );
  OAI21M1P U967 ( .A(n768), .B(n772), .C(n23), .Z(n923) );
  AOI21M1P U968 ( .A(n25), .B(n27), .C(n923), .Z(n957) );
  N1M1P U969 ( .A(n958), .Z(n945) );
  NR2M1P U970 ( .A(n771), .B(n954), .Z(n948) );
  AOI22M1P U971 ( .A(n945), .B(n948), .C(n3), .D(n952), .Z(n775) );
  ND4M1P U972 ( .A(n27), .B(n773), .C(n772), .D(n973), .Z(n774) );
  ND2M1P U973 ( .A(\main_control/state[0] ), .B(n959), .Z(n942) );
  ND4M1P U974 ( .A(n950), .B(n775), .C(n774), .D(n942), .Z(
        \main_control/next_state[0] ) );
  N1M1P U975 ( .A(buf_to_mux[1]), .Z(n925) );
  OAI22M1P U976 ( .A(n809), .B(n913), .C(n569), .D(n925), .Z(n557) );
  AND3M1P U977 ( .A(\enc_logic/check/N25 ), .B(\enc_logic/checksum[5] ), .C(
        \enc_logic/checksum[6] ), .Z(n831) );
  N1M1P U978 ( .A(buf_to_mux[2]), .Z(n926) );
  OAI22M1P U979 ( .A(n831), .B(n913), .C(n569), .D(n926), .Z(n556) );
  NR3M1P U980 ( .A(\enc_logic/checksum[9] ), .B(\enc_logic/checksum[8] ), .C(
        n913), .Z(n965) );
  AOI211M1P U981 ( .A(\enc_logic/checksum[9] ), .B(\enc_logic/checksum[8] ), 
        .C(\enc_logic/checksum[7] ), .D(n913), .Z(n777) );
  AO211M1P U982 ( .A(n133), .B(buf_to_mux[7]), .C(n965), .D(n777), .Z(n551) );
  N1M1P U983 ( .A(\enc_logic/checksum[7] ), .Z(n964) );
  ND2M1P U984 ( .A(\enc_logic/checksum[9] ), .B(\enc_logic/checksum[8] ), .Z(
        n778) );
  OAI21M1P U985 ( .A(n964), .B(n778), .C(n968), .Z(n779) );
  AO21CNM1P U986 ( .A(n133), .B(buf_to_mux[8]), .C(n779), .Z(n550) );
  N1M1P U987 ( .A(buf_to_mux[13]), .Z(n929) );
  ND3M1P U988 ( .A(n968), .B(n892), .C(n889), .Z(n966) );
  N1M1P U989 ( .A(\enc_logic/checksum[10] ), .Z(n781) );
  OAI211M1P U990 ( .A(n889), .B(n892), .C(n968), .D(n781), .Z(n780) );
  OAI211M1P U991 ( .A(n569), .B(n929), .C(n966), .D(n780), .Z(n545) );
  NR3M1P U992 ( .A(n892), .B(n889), .C(n781), .Z(n782) );
  N1M1P U993 ( .A(buf_to_mux[14]), .Z(n931) );
  OAI22M1P U994 ( .A(n782), .B(n913), .C(n569), .D(n931), .Z(n544) );
  N1M1P U995 ( .A(buf_to_mux[19]), .Z(n933) );
  N1M1P U996 ( .A(\enc_logic/checksum[14] ), .Z(n791) );
  ND3CNM1P U997 ( .C(\enc_logic/checksum[15] ), .A(n968), .B(n791), .Z(n969)
         );
  ND2M1P U998 ( .A(\enc_logic/checksum[15] ), .B(\enc_logic/checksum[14] ), 
        .Z(n784) );
  ND3M1P U999 ( .A(n968), .B(n894), .C(n784), .Z(n783) );
  OAI211M1P U1000 ( .A(n569), .B(n933), .C(n969), .D(n783), .Z(n539) );
  N1M1P U1001 ( .A(buf_to_mux[20]), .Z(n935) );
  OAI21M1P U1002 ( .A(n894), .B(n784), .C(n968), .Z(n805) );
  N1M1P U1003 ( .A(\enc_logic/checksum[26] ), .Z(n910) );
  N1M1P U1004 ( .A(\enc_logic/checksum[21] ), .Z(n898) );
  N1M1P U1005 ( .A(\enc_logic/checksum[20] ), .Z(n896) );
  FA1AM1P U1006 ( .A(\enc_logic/checksum[6] ), .B(\enc_logic/check/N25 ), .CI(
        \enc_logic/checksum[5] ), .CO(n809), .S(n785) );
  ND2M1P U1007 ( .A(\enc_logic/checksum[7] ), .B(n785), .Z(n807) );
  OA21M1P U1008 ( .A(\enc_logic/checksum[7] ), .B(n785), .C(n807), .Z(n806) );
  ND2M1P U1009 ( .A(\enc_logic/checksum[10] ), .B(n786), .Z(n810) );
  AO21M1P U1010 ( .A(n889), .B(n787), .C(n834), .Z(n788) );
  AO21M1P U1011 ( .A(n894), .B(n789), .C(n836), .Z(n790) );
  AOI211M1P U1012 ( .A(n894), .B(n789), .C(n836), .D(n791), .Z(n835) );
  AOI21M1P U1013 ( .A(n791), .B(n790), .C(n835), .Z(n792) );
  ND2M1P U1014 ( .A(\enc_logic/checksum[15] ), .B(n792), .Z(n811) );
  OAI21M1P U1015 ( .A(\enc_logic/checksum[15] ), .B(n792), .C(n811), .Z(n793)
         );
  AO21M1P U1016 ( .A(n882), .B(n793), .C(n838), .Z(n794) );
  AOI21M1P U1017 ( .A(n906), .B(n795), .C(n841), .Z(n796) );
  ND2M1P U1018 ( .A(\enc_logic/checksum[19] ), .B(n796), .Z(n814) );
  OAI21M1P U1019 ( .A(\enc_logic/checksum[19] ), .B(n796), .C(n814), .Z(n797)
         );
  AO21M1P U1020 ( .A(n896), .B(n797), .C(n845), .Z(n798) );
  AOI211M1P U1021 ( .A(n896), .B(n797), .C(n845), .D(n898), .Z(n844) );
  AOI21M1P U1022 ( .A(n898), .B(n798), .C(n844), .Z(n799) );
  ND2M1P U1023 ( .A(\enc_logic/checksum[22] ), .B(n799), .Z(n816) );
  OAI21M1P U1024 ( .A(\enc_logic/checksum[22] ), .B(n799), .C(n816), .Z(n800)
         );
  ND2M1P U1025 ( .A(\enc_logic/checksum[25] ), .B(n801), .Z(n818) );
  ND2M1P U1026 ( .A(\enc_logic/checksum[27] ), .B(n803), .Z(n819) );
  OAI211M1P U1027 ( .A(\enc_logic/checksum[27] ), .B(n803), .C(n911), .D(n819), 
        .Z(n804) );
  OAI211M1P U1028 ( .A(n569), .B(n935), .C(n805), .D(n804), .Z(n538) );
  FA1AM1P U1029 ( .A(\enc_logic/checksum[8] ), .B(\enc_logic/checksum[9] ), 
        .CI(n806), .CO(n829), .S(n786) );
  N1M1P U1030 ( .A(n809), .Z(n808) );
  MUX21LM1P U1031 ( .A(n809), .B(n808), .S(n807), .Z(n828) );
  N1M1P U1032 ( .A(n810), .Z(n827) );
  N1M1P U1033 ( .A(n811), .Z(n839) );
  N1M1P U1034 ( .A(n812), .Z(n813) );
  NR2M1P U1035 ( .A(n813), .B(n814), .Z(n856) );
  AOI21M1P U1036 ( .A(n814), .B(n813), .C(n856), .Z(n846) );
  N1M1P U1037 ( .A(n815), .Z(n817) );
  NR2M1P U1038 ( .A(n817), .B(n816), .Z(n852) );
  AOI21M1P U1039 ( .A(n817), .B(n816), .C(n852), .Z(n849) );
  N1M1P U1040 ( .A(n818), .Z(n824) );
  OAI21M1P U1041 ( .A(n821), .B(n820), .C(n911), .Z(n823) );
  AOI22M1P U1042 ( .A(n133), .B(buf_to_mux[21]), .C(\enc_logic/checksum[13] ), 
        .D(n968), .Z(n822) );
  OAI21M1P U1043 ( .A(n867), .B(n823), .C(n822), .Z(n537) );
  FA1AM1P U1044 ( .A(n829), .B(n828), .CI(n827), .CO(n830), .S(n832) );
  AO21M1P U1045 ( .A(n831), .B(\enc_logic/checksum[7] ), .C(n830), .Z(n855) );
  FA1AM1P U1046 ( .A(n834), .B(n833), .CI(n832), .CO(n854), .S(n837) );
  FA1AM1P U1047 ( .A(n837), .B(n836), .CI(n835), .CO(n853), .S(n840) );
  FA1AM1P U1048 ( .A(n840), .B(n839), .CI(n838), .CO(n861), .S(n843) );
  FA1AM1P U1049 ( .A(n843), .B(n842), .CI(n841), .CO(n860), .S(n812) );
  FA1AM1P U1050 ( .A(n846), .B(n845), .CI(n844), .CO(n857), .S(n815) );
  FA1AM1P U1051 ( .A(n849), .B(n848), .CI(n847), .CO(n851), .S(n825) );
  OAI21M1P U1052 ( .A(n852), .B(n851), .C(n850), .Z(n872) );
  FA1AM1P U1053 ( .A(n855), .B(n854), .CI(n853), .CO(n866), .S(n862) );
  FA1AM1P U1054 ( .A(n858), .B(n857), .CI(n856), .CO(n859), .S(n850) );
  N1M1P U1055 ( .A(n859), .Z(n865) );
  FA1AM1P U1056 ( .A(n862), .B(n861), .CI(n860), .CO(n863), .S(n858) );
  AOI21M1P U1057 ( .A(n866), .B(n865), .C(n863), .Z(n864) );
  OAI21M1P U1058 ( .A(n866), .B(n865), .C(n864), .Z(n871) );
  MAJN3M1P U1059 ( .A(n869), .B(n868), .C(n867), .Z(n870) );
  EN3M1P U1060 ( .A(n872), .B(n871), .C(n870), .Z(n874) );
  AOI22M1P U1061 ( .A(n133), .B(buf_to_mux[23]), .C(\enc_logic/checksum[15] ), 
        .D(n968), .Z(n873) );
  OAI21M1P U1062 ( .A(n874), .B(n921), .C(n873), .Z(n535) );
  ND3M1P U1063 ( .A(n968), .B(n906), .C(n903), .Z(n877) );
  AOI22M1P U1064 ( .A(n133), .B(buf_to_mux[24]), .C(n911), .D(
        \enc_logic/check/N25 ), .Z(n875) );
  OAI21M1P U1065 ( .A(\enc_logic/checksum[16] ), .B(n877), .C(n875), .Z(n534)
         );
  AOI22M1P U1066 ( .A(n133), .B(buf_to_mux[25]), .C(n911), .D(
        \enc_logic/checksum[5] ), .Z(n878) );
  OAI211M1P U1067 ( .A(n903), .B(n906), .C(n968), .D(n882), .Z(n876) );
  ND3M1P U1068 ( .A(n878), .B(n877), .C(n876), .Z(n533) );
  NR3M1P U1069 ( .A(n906), .B(n903), .C(n882), .Z(n880) );
  AOI22M1P U1070 ( .A(n133), .B(buf_to_mux[26]), .C(n911), .D(
        \enc_logic/checksum[6] ), .Z(n879) );
  OAI21M1P U1071 ( .A(n880), .B(n913), .C(n879), .Z(n532) );
  AOI22M1P U1072 ( .A(n133), .B(buf_to_mux[27]), .C(n911), .D(
        \enc_logic/checksum[7] ), .Z(n881) );
  OAI21M1P U1073 ( .A(n882), .B(n913), .C(n881), .Z(n531) );
  AOI22M1P U1074 ( .A(n133), .B(buf_to_mux[28]), .C(n911), .D(
        \enc_logic/checksum[8] ), .Z(n883) );
  OAI21M1P U1075 ( .A(n903), .B(n913), .C(n883), .Z(n530) );
  AOI22M1P U1076 ( .A(n133), .B(buf_to_mux[29]), .C(n911), .D(
        \enc_logic/checksum[9] ), .Z(n884) );
  OAI21M1P U1077 ( .A(n906), .B(n913), .C(n884), .Z(n529) );
  ND3M1P U1078 ( .A(n968), .B(n898), .C(n896), .Z(n887) );
  AOI22M1P U1079 ( .A(n133), .B(buf_to_mux[30]), .C(n911), .D(
        \enc_logic/checksum[10] ), .Z(n885) );
  OAI21M1P U1080 ( .A(\enc_logic/checksum[19] ), .B(n887), .C(n885), .Z(n528)
         );
  AOI211M1P U1081 ( .A(\enc_logic/checksum[20] ), .B(\enc_logic/checksum[21] ), 
        .C(\enc_logic/checksum[19] ), .D(n913), .Z(n886) );
  AOI21M1P U1082 ( .A(buf_to_mux[31]), .B(n133), .C(n886), .Z(n888) );
  OAI211M1P U1083 ( .A(n889), .B(n921), .C(n888), .D(n887), .Z(n527) );
  ND3M1P U1084 ( .A(\enc_logic/checksum[21] ), .B(\enc_logic/checksum[20] ), 
        .C(\enc_logic/checksum[19] ), .Z(n890) );
  AOI22M1P U1085 ( .A(n133), .B(buf_to_mux[32]), .C(n968), .D(n890), .Z(n891)
         );
  OAI21M1P U1086 ( .A(n921), .B(n892), .C(n891), .Z(n526) );
  AOI22M1P U1087 ( .A(n133), .B(buf_to_mux[33]), .C(\enc_logic/checksum[19] ), 
        .D(n968), .Z(n893) );
  OAI21M1P U1088 ( .A(n921), .B(n894), .C(n893), .Z(n525) );
  AOI22M1P U1089 ( .A(n133), .B(buf_to_mux[34]), .C(n911), .D(
        \enc_logic/checksum[14] ), .Z(n895) );
  OAI21M1P U1090 ( .A(n896), .B(n913), .C(n895), .Z(n524) );
  AOI22M1P U1091 ( .A(n133), .B(buf_to_mux[35]), .C(n911), .D(
        \enc_logic/checksum[15] ), .Z(n897) );
  OAI21M1P U1092 ( .A(n898), .B(n913), .C(n897), .Z(n523) );
  ND3M1P U1093 ( .A(n968), .B(n920), .C(n917), .Z(n901) );
  AOI22M1P U1094 ( .A(n133), .B(buf_to_mux[36]), .C(n911), .D(
        \enc_logic/checksum[16] ), .Z(n899) );
  OAI21M1P U1095 ( .A(\enc_logic/checksum[22] ), .B(n901), .C(n899), .Z(n522)
         );
  AOI211M1P U1096 ( .A(\enc_logic/checksum[24] ), .B(\enc_logic/checksum[23] ), 
        .C(\enc_logic/checksum[22] ), .D(n913), .Z(n900) );
  AOI21M1P U1097 ( .A(buf_to_mux[37]), .B(n133), .C(n900), .Z(n902) );
  OAI211M1P U1098 ( .A(n903), .B(n921), .C(n902), .D(n901), .Z(n521) );
  ND3M1P U1099 ( .A(\enc_logic/checksum[22] ), .B(\enc_logic/checksum[24] ), 
        .C(\enc_logic/checksum[23] ), .Z(n904) );
  AOI22M1P U1100 ( .A(n133), .B(buf_to_mux[38]), .C(n968), .D(n904), .Z(n905)
         );
  OAI21M1P U1101 ( .A(n921), .B(n906), .C(n905), .Z(n520) );
  AOI22M1P U1102 ( .A(n133), .B(buf_to_mux[39]), .C(n911), .D(
        \enc_logic/checksum[19] ), .Z(n907) );
  AO21CNM1P U1103 ( .A(\enc_logic/checksum[22] ), .B(n968), .C(n907), .Z(n519)
         );
  AOI22M1P U1104 ( .A(n133), .B(buf_to_mux[40]), .C(n911), .D(
        \enc_logic/checksum[20] ), .Z(n908) );
  OAI21M1P U1105 ( .A(n917), .B(n913), .C(n908), .Z(n518) );
  AOI22M1P U1106 ( .A(n133), .B(buf_to_mux[41]), .C(n911), .D(
        \enc_logic/checksum[21] ), .Z(n909) );
  OAI21M1P U1107 ( .A(n920), .B(n913), .C(n909), .Z(n517) );
  ND3CNM1P U1108 ( .C(\enc_logic/checksum[27] ), .A(n968), .B(n910), .Z(n915)
         );
  AOI22M1P U1109 ( .A(n133), .B(buf_to_mux[42]), .C(n911), .D(
        \enc_logic/checksum[22] ), .Z(n912) );
  OAI21M1P U1110 ( .A(\enc_logic/checksum[25] ), .B(n915), .C(n912), .Z(n516)
         );
  AOI211M1P U1111 ( .A(\enc_logic/checksum[26] ), .B(\enc_logic/checksum[27] ), 
        .C(\enc_logic/checksum[25] ), .D(n913), .Z(n914) );
  AOI21M1P U1112 ( .A(buf_to_mux[43]), .B(n133), .C(n914), .Z(n916) );
  OAI211M1P U1113 ( .A(n917), .B(n921), .C(n916), .D(n915), .Z(n515) );
  ND3M1P U1114 ( .A(\enc_logic/checksum[27] ), .B(\enc_logic/checksum[26] ), 
        .C(\enc_logic/checksum[25] ), .Z(n918) );
  AOI22M1P U1115 ( .A(n133), .B(buf_to_mux[44]), .C(n968), .D(n918), .Z(n919)
         );
  OAI21M1P U1116 ( .A(n921), .B(n920), .C(n919), .Z(n514) );
  ND2M1P U1117 ( .A(n923), .B(n922), .Z(n971) );
  OAI21M1P U1118 ( .A(TX_Data_Valid), .B(n971), .C(n973), .Z(n924) );
  AO21CNM1P U1119 ( .A(TX_Data_Valid), .B(TX_Data_Ready), .C(n924), .Z(
        \tHandshake/next_state[1] ) );
  OAI22CDNM1P U1120 ( .A(n925), .B(n934), .C(\dec_logic/raw[1] ), .D(n940), 
        .Z(n81) );
  OAI22CDNM1P U1121 ( .A(n926), .B(n934), .C(\dec_logic/raw[2] ), .D(n940), 
        .Z(n80) );
  OAI22CDNM1P U1122 ( .A(n927), .B(n572), .C(buf_to_mux[7]), .D(n571), .Z(n75)
         );
  OAI22CDNM1P U1123 ( .A(n928), .B(n572), .C(buf_to_mux[8]), .D(n575), .Z(n74)
         );
  OAI22M1P U1124 ( .A(n930), .B(n572), .C(n929), .D(n934), .Z(n69) );
  OAI22M1P U1125 ( .A(n932), .B(n572), .C(n931), .D(n934), .Z(n68) );
  OAI22CDNM1P U1126 ( .A(n933), .B(n934), .C(\dec_logic/raw[19] ), .D(n940), 
        .Z(n63) );
  OAI22M1P U1127 ( .A(n936), .B(n572), .C(n935), .D(n934), .Z(n62) );
  AOI22M1P U1128 ( .A(address[0]), .B(n940), .C(n571), .D(buf_to_mux[48]), .Z(
        n937) );
  N1M1P U1129 ( .A(n937), .Z(n32) );
  AOI22M1P U1130 ( .A(address[1]), .B(n940), .C(n571), .D(buf_to_mux[49]), .Z(
        n938) );
  N1M1P U1131 ( .A(n938), .Z(n31) );
  AOI22M1P U1132 ( .A(address[2]), .B(n940), .C(n571), .D(buf_to_mux[50]), .Z(
        n939) );
  N1M1P U1133 ( .A(n939), .Z(n30) );
  AOI22M1P U1134 ( .A(address[3]), .B(n940), .C(n571), .D(buf_to_mux[51]), .Z(
        n941) );
  N1M1P U1135 ( .A(n941), .Z(n29) );
  N1M1P U1136 ( .A(n942), .Z(n946) );
  NR2M1P U1137 ( .A(n944), .B(n943), .Z(n978) );
  AOI21M1P U1138 ( .A(n946), .B(n945), .C(n978), .Z(n26) );
  AOI211M1P U1139 ( .A(n27), .B(Core_Load_Ack), .C(n948), .D(n947), .Z(n949)
         );
  OAI21M1P U1140 ( .A(n955), .B(n954), .C(n953), .Z(n956) );
  AOI211M1P U1141 ( .A(n959), .B(n958), .C(n957), .D(n956), .Z(n22) );
  NR2M1P U1142 ( .A(n23), .B(n25), .Z(n960) );
  N1M1P U1143 ( .A(n960), .Z(n961) );
  OAI21M1P U1144 ( .A(n21), .B(n961), .C(n19), .Z(n962) );
  OAI21M1P U1145 ( .A(n21), .B(RX_Data_Valid), .C(n962), .Z(n18) );
  N1M1P U1146 ( .A(\enc_logic/encode_type ), .Z(n17) );
  NR3M1P U1147 ( .A(\enc_logic/check/N25 ), .B(\enc_logic/checksum[5] ), .C(
        \enc_logic/checksum[6] ), .Z(n963) );
  AOI22CDNM1P U1148 ( .A(n968), .B(n963), .C(n114), .D(n569), .Z(n16) );
  AOI22CDNM1P U1149 ( .A(n968), .B(\enc_logic/check/N25 ), .C(n115), .D(n569), 
        .Z(n15) );
  AOI22CDNM1P U1150 ( .A(n968), .B(\enc_logic/checksum[5] ), .C(n116), .D(n569), .Z(n14) );
  AOI22CDNM1P U1151 ( .A(n968), .B(\enc_logic/checksum[6] ), .C(n117), .D(n569), .Z(n13) );
  AOI22CDNM1P U1152 ( .A(n965), .B(n964), .C(n118), .D(n569), .Z(n12) );
  AOI22CDNM1P U1153 ( .A(n968), .B(\enc_logic/checksum[7] ), .C(n119), .D(n569), .Z(n11) );
  AOI22CDNM1P U1154 ( .A(n968), .B(\enc_logic/checksum[8] ), .C(n120), .D(n569), .Z(n10) );
  AOI22CDNM1P U1155 ( .A(n968), .B(\enc_logic/checksum[9] ), .C(n121), .D(n569), .Z(n9) );
  OAI22M1P U1156 ( .A(\enc_logic/checksum[10] ), .B(n966), .C(n122), .D(n569), 
        .Z(n967) );
  N1M1P U1157 ( .A(n967), .Z(n8) );
  AOI22CDNM1P U1158 ( .A(\enc_logic/checksum[10] ), .B(n968), .C(n123), .D(
        n569), .Z(n7) );
  AOI22CDNM1P U1159 ( .A(\enc_logic/checksum[11] ), .B(n968), .C(n124), .D(
        n569), .Z(n6) );
  AOI22CDNM1P U1160 ( .A(\enc_logic/checksum[12] ), .B(n968), .C(n125), .D(
        n569), .Z(n5) );
  OAI22M1P U1161 ( .A(\enc_logic/checksum[13] ), .B(n969), .C(n126), .D(n569), 
        .Z(n970) );
  N1M1P U1162 ( .A(n970), .Z(n4) );
  ND3CNM1P U1163 ( .C(TX_Data_Valid), .A(n973), .B(n971), .Z(n972) );
  OAI211M1P U1164 ( .A(TX_Data_Ready), .B(n973), .C(n972), .D(n560), .Z(n2) );
  OAI21M1P U1165 ( .A(n27), .B(n975), .C(n974), .Z(n976) );
  AOI21M1P U1166 ( .A(n978), .B(n977), .C(n976), .Z(n1) );
endmodule

