
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
         \enc_logic/check/N25 , \dec_logic/checksum/encoder/N25 , n5, n6, n75,
         n76, n77, n97, n420, n421, n422, n423, n424, n425, n426, n427, n428,
         n429, n430, n431, n432, n433, n434, n435, n436, n437, n438, n439,
         n440, n441, n442, n443, n444, n445, n446, n447, n448, n449, n450,
         n451, n452, n453, n454, n455, n456, n457, n458, n459, n460, n461,
         n462, n463, n464, n466, n467, n468, n469, n470, n471, n472, n473,
         n474, n475, n476, n477, n478, n479, n480, n481, n482, n483, n484,
         n485, n486, n487, n488, n489, n490, n491, n492, n493, n494, n495,
         n496, n497, n498, n499, n500, n501, n502, n503, n504, n505, n506,
         n507, n508, n509, n510, n511, n512, n513, n517, n518, n519, n520,
         n521, n522, n523, n524, n525, n526, n527, n528, n529, n530, n531,
         n532, n533, n534, n535, n536, n537, n538, n539, n540, n541, n542,
         n543, n544, n545, n546, n547, n548, n549, n550, n551, n552, n553,
         n554, n555, n556, n557, n558, n559, n560, n561, n562, n563, n564,
         n565, n566, n567, n568, n569, n570, n571, n572, n573, n574, n575,
         n576, n577, n578, n579, n580, n581, n582, n583, n584, n585, n586,
         n587, n588, n589, n590, n591, n592, n593, n594, n595, n596, n597,
         n598, n599, n600, n601, n602, n603, n604, n605, n606, n607, n608,
         n609, n610, n611, n612, n613, n614, n615, n616, n617, n618, n619,
         n620, n621, n622, n623, n624, n625, n626, n627, n628, n629, n630,
         n631, n632, n633, n634, n635, n636, n637, n638, n639, n640, n641,
         n642, n643, n644, n645, n646, n647, n648, n649, n650, n651, n652,
         n653, n654, n655, n656, n657, n658, n659, n660, n661, n662, n663,
         n664, n665, n666, n667, n668, n669, n670, n671, n672, n673, n674,
         n675, n676, n677, n678, n679, n680, n681, n682, n683, n684, n685,
         n686, n687, n688, n689, n690, n691, n692, n693, n694, n695, n696,
         n697, n698, n699, n700, n701, n702, n703, n704, n705, n706, n707,
         n708, n709, n710, n711, n712, n713, n714, n715, n716, n717, n718,
         n719, n720, n721, n722, n723, n724, n725, n726, n727, n728, n729,
         n730, n731, n732, n733, n734, n735, n736, n737, n738, n739, n740,
         n741, n742, n743, n744, n745, n746, n747, n748, n749, n750, n751,
         n752, n753, n754, n755, n756, n757, n758, n759, n760, n761, n762,
         n763, n764, n765, n766, n767, n768, n769, n770, n771, n772, n773,
         n774, n775, n776, n777, n778, n779, n780, n781, n782, n783, n784,
         n785, n786, n787, n788, n789, n790, n791, n792, n793, n794, n795,
         n796, n797, n798, n799, n800, n801, n802, n803, n804, n805, n806,
         n807, n808, n809, n810, n811, n812, n813, n814, n815, n816, n817,
         n818, n819, n820, n821, n822, n823, n824, n825, n826, n827, n828,
         n829, n830, n831, n832, n833, n834, n835, n836, n837, n838, n839,
         n840, n841, n842, n843, n844, n845, n846, n847, n848, n849, n850,
         n851, n852, n853, n854, n855, n856, n857, n858, n859, n860, n861,
         n862, n863, n864, n865, n866, n867, n868, n869, n870, n871, n872,
         n873, n874, n875, n876, n877, n878, n879, n880, n881, n882, n883,
         n884, n885, n886, n887, n888, n889, n890, n891, n892, n893, n894,
         n895, n896, n897, n898, n899, n900, n901, n902, n903, n904, n905,
         n906, n907, n908, n909, n910, n911, n912, n913, n914, n915, n916,
         n917, n918, n919, n920, n921, n922, n923, n924, n925, n926, n927,
         n928, n929;
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
  DFCNQD1BWP \ever_versetile/out_reg[1]  ( .D(n463), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[1]) );
  DFCNQD1BWP \ever_versetile/out_reg[0]  ( .D(n464), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[0]) );
  DFCNQD1BWP \ever_versetile/out_reg[2]  ( .D(n462), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[2]) );
  DFCNQD1BWP \ever_versetile/out_reg[3]  ( .D(n461), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[3]) );
  DFCNQD1BWP \ever_versetile/out_reg[4]  ( .D(n460), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[4]) );
  DFCNQD1BWP \ever_versetile/out_reg[5]  ( .D(n459), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[5]) );
  DFCNQD1BWP \ever_versetile/out_reg[6]  ( .D(n458), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[6]) );
  DFCNQD1BWP \ever_versetile/out_reg[7]  ( .D(n457), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[7]) );
  DFCNQD1BWP \ever_versetile/out_reg[8]  ( .D(n456), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[8]) );
  DFCNQD1BWP \ever_versetile/out_reg[9]  ( .D(n455), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[9]) );
  DFCNQD1BWP \ever_versetile/out_reg[10]  ( .D(n454), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[10]) );
  DFCNQD1BWP \ever_versetile/out_reg[11]  ( .D(n453), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[11]) );
  DFCNQD1BWP \ever_versetile/out_reg[12]  ( .D(n452), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[12]) );
  DFCNQD1BWP \ever_versetile/out_reg[13]  ( .D(n451), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[13]) );
  DFCNQD1BWP \ever_versetile/out_reg[14]  ( .D(n450), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[14]) );
  DFCNQD1BWP \ever_versetile/out_reg[15]  ( .D(n449), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[15]) );
  DFCNQD1BWP \ever_versetile/out_reg[16]  ( .D(n448), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[16]) );
  DFCNQD1BWP \ever_versetile/out_reg[17]  ( .D(n447), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[17]) );
  DFCNQD1BWP \ever_versetile/out_reg[18]  ( .D(n446), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[18]) );
  DFCNQD1BWP \ever_versetile/out_reg[19]  ( .D(n445), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[19]) );
  DFCNQD1BWP \ever_versetile/out_reg[20]  ( .D(n444), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[20]) );
  DFCNQD1BWP \ever_versetile/out_reg[21]  ( .D(n443), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[21]) );
  DFCNQD1BWP \ever_versetile/out_reg[22]  ( .D(n442), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[22]) );
  DFCNQD1BWP \ever_versetile/out_reg[23]  ( .D(n441), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[23]) );
  DFCNQD1BWP \ever_versetile/out_reg[24]  ( .D(n440), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[24]) );
  DFCNQD1BWP \ever_versetile/out_reg[25]  ( .D(n439), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[25]) );
  DFCNQD1BWP \ever_versetile/out_reg[26]  ( .D(n438), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[26]) );
  DFCNQD1BWP \ever_versetile/out_reg[27]  ( .D(n437), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[27]) );
  DFCNQD1BWP \ever_versetile/out_reg[28]  ( .D(n436), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[28]) );
  DFCNQD1BWP \ever_versetile/out_reg[29]  ( .D(n435), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[29]) );
  DFCNQD1BWP \ever_versetile/out_reg[30]  ( .D(n434), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[30]) );
  DFCNQD1BWP \ever_versetile/out_reg[31]  ( .D(n433), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[31]) );
  DFCNQD1BWP \ever_versetile/out_reg[32]  ( .D(n432), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[32]) );
  DFCNQD1BWP \ever_versetile/out_reg[33]  ( .D(n431), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[33]) );
  DFCNQD1BWP \ever_versetile/out_reg[34]  ( .D(n430), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[34]) );
  DFCNQD1BWP \ever_versetile/out_reg[35]  ( .D(n429), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[35]) );
  DFCNQD1BWP \ever_versetile/out_reg[36]  ( .D(n428), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[36]) );
  DFCNQD1BWP \ever_versetile/out_reg[37]  ( .D(n427), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[37]) );
  DFCNQD1BWP \ever_versetile/out_reg[38]  ( .D(n426), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[38]) );
  DFCNQD1BWP \ever_versetile/out_reg[39]  ( .D(n425), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[39]) );
  DFCNQD1BWP \ever_versetile/out_reg[40]  ( .D(n424), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[40]) );
  DFCNQD1BWP \ever_versetile/out_reg[41]  ( .D(n423), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[41]) );
  DFCNQD1BWP \ever_versetile/out_reg[42]  ( .D(n422), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[42]) );
  DFCNQD1BWP \ever_versetile/out_reg[43]  ( .D(n421), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[43]) );
  DFCNQD1BWP \ever_versetile/out_reg[44]  ( .D(n420), .CP(Clk_R), .CDN(Rst_n), 
        .Q(buf_to_mux[44]) );
  EDFCNQD1BWP \ever_versetile/out_reg[48]  ( .D(enc_to_buf[48]), .E(n97), .CP(
        Clk_R), .CDN(Rst_n), .Q(buf_to_mux[48]) );
  EDFCNQD1BWP \ever_versetile/out_reg[49]  ( .D(enc_to_buf[49]), .E(n97), .CP(
        Clk_R), .CDN(Rst_n), .Q(buf_to_mux[49]) );
  EDFCNQD1BWP \ever_versetile/out_reg[50]  ( .D(enc_to_buf[50]), .E(n97), .CP(
        Clk_R), .CDN(Rst_n), .Q(buf_to_mux[50]) );
  EDFCNQD1BWP \ever_versetile/out_reg[51]  ( .D(enc_to_buf[51]), .E(n97), .CP(
        Clk_R), .CDN(Rst_n), .Q(buf_to_mux[51]) );
  EDFCNQD1BWP \ever_versetile/out_reg[52]  ( .D(\enc_logic/encode_type ), .E(
        n97), .CP(Clk_R), .CDN(Rst_n), .Q(buf_to_mux[52]) );
  EDFCNQD1BWP \ever_versetile/out_reg[53]  ( .D(n822), .E(n97), .CP(Clk_R), 
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
  EDFCNQD1BWP \tHandshake/TX_Data_reg[9]  ( .D(data_to_tx[9]), .E(n513), .CP(
        Clk_R), .CDN(Rst_n), .Q(TX_Data[9]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[8]  ( .D(data_to_tx[8]), .E(n513), .CP(
        Clk_R), .CDN(Rst_n), .Q(TX_Data[8]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[7]  ( .D(data_to_tx[7]), .E(n513), .CP(
        Clk_R), .CDN(Rst_n), .Q(TX_Data[7]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[6]  ( .D(data_to_tx[6]), .E(n513), .CP(
        Clk_R), .CDN(Rst_n), .Q(TX_Data[6]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[5]  ( .D(data_to_tx[5]), .E(n513), .CP(
        Clk_R), .CDN(Rst_n), .Q(TX_Data[5]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[51]  ( .D(data_to_tx[51]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[51]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[50]  ( .D(data_to_tx[50]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[50]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[4]  ( .D(data_to_tx[4]), .E(n513), .CP(
        Clk_R), .CDN(Rst_n), .Q(TX_Data[4]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[49]  ( .D(data_to_tx[49]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[49]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[48]  ( .D(data_to_tx[48]), .E(n513), 
        .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[48]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[44]  ( .D(data_to_tx[44]), .E(n513), 
        .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[44]) );
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
  EDFCNQD1BWP \tHandshake/TX_Data_reg[36]  ( .D(data_to_tx[36]), .E(n513), 
        .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[36]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[35]  ( .D(data_to_tx[35]), .E(n513), 
        .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[35]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[34]  ( .D(data_to_tx[34]), .E(n513), 
        .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[34]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[33]  ( .D(data_to_tx[33]), .E(n513), 
        .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[33]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[32]  ( .D(data_to_tx[32]), .E(n513), 
        .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[32]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[31]  ( .D(data_to_tx[31]), .E(n513), 
        .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[31]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[30]  ( .D(data_to_tx[30]), .E(n513), 
        .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[30]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[2]  ( .D(data_to_tx[2]), .E(n513), .CP(
        Clk_R), .CDN(Rst_n), .Q(TX_Data[2]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[29]  ( .D(data_to_tx[29]), .E(n513), 
        .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[29]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[28]  ( .D(data_to_tx[28]), .E(n513), 
        .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[28]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[27]  ( .D(data_to_tx[27]), .E(n513), 
        .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[27]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[26]  ( .D(data_to_tx[26]), .E(n513), 
        .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[26]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[25]  ( .D(data_to_tx[25]), .E(n513), 
        .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[25]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[24]  ( .D(data_to_tx[24]), .E(n513), 
        .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[24]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[23]  ( .D(data_to_tx[23]), .E(n513), 
        .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[23]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[22]  ( .D(data_to_tx[22]), .E(n513), 
        .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[22]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[21]  ( .D(data_to_tx[21]), .E(n513), 
        .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[21]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[19]  ( .D(data_to_tx[19]), .E(n513), 
        .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[19]) );
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
  EDFCNQD1BWP \tHandshake/TX_Data_reg[1]  ( .D(data_to_tx[1]), .E(n513), .CP(
        Clk_R), .CDN(Rst_n), .Q(TX_Data[1]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[20]  ( .D(data_to_tx[20]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[20]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[45]  ( .D(data_to_tx[45]), .E(n513), 
        .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[45]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[46]  ( .D(data_to_tx[46]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[46]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[47]  ( .D(data_to_tx[47]), .E(n513), 
        .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[47]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[53]  ( .D(data_to_tx[53]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[53]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[52]  ( .D(data_to_tx[52]), .E(n513), 
        .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[52]) );
  EDFCNQD1BWP \tHandshake/TX_Data_reg[54]  ( .D(data_to_tx[54]), .E(
        \tHandshake/N12 ), .CP(Clk_R), .CDN(Rst_n), .Q(TX_Data[54]) );
  EDFCND1BWP \ever_versetile/out_reg[45]  ( .D(\enc_logic/checksum[25] ), .E(
        n97), .CP(Clk_R), .CDN(Rst_n), .QN(n75) );
  EDFCND1BWP \ever_versetile/out_reg[46]  ( .D(\enc_logic/checksum[26] ), .E(
        n97), .CP(Clk_R), .CDN(Rst_n), .QN(n76) );
  EDFCND1BWP \ever_versetile/out_reg[47]  ( .D(\enc_logic/checksum[27] ), .E(
        n97), .CP(Clk_R), .CDN(Rst_n), .QN(n77) );
  DFCNQD1BWP \main_control/state_reg[2]  ( .D(\main_control/next_state[2] ), 
        .CP(Clk_R), .CDN(Rst_n), .Q(\main_control/state[2] ) );
  DFCND1BWP \rHandshake/state_reg[0]  ( .D(\rHandshake/next_state[0] ), .CP(
        Clk_R), .CDN(Rst_n), .Q(\rHandshake/state[0] ), .QN(n802) );
  DFCND1BWP \main_control/state_reg[0]  ( .D(n5), .CP(Clk_R), .CDN(Rst_n), .Q(
        n6), .QN(n801) );
  ND2D1BWP U560 ( .A1(n583), .A2(n582), .ZN(n628) );
  INVD1BWP U561 ( .I(n547), .ZN(n546) );
  ND2D2BWP U562 ( .A1(n535), .A2(n815), .ZN(n536) );
  ND2D1BWP U563 ( .A1(n556), .A2(n806), .ZN(n558) );
  ND2D2BWP U564 ( .A1(n576), .A2(n550), .ZN(n551) );
  ND2D1BWP U565 ( .A1(n549), .A2(n809), .ZN(n550) );
  NR2D3BWP U566 ( .A1(n551), .A2(n808), .ZN(n584) );
  MAOI222D1BWP U567 ( .A(n623), .B(n622), .C(n621), .ZN(n624) );
  NR2XD1BWP U568 ( .A1(n836), .A2(n672), .ZN(n712) );
  XOR3D1BWP U569 ( .A1(\dec_logic/three_six_load[10] ), .A2(n615), .A3(n626), 
        .Z(n648) );
  CKND4BWP U570 ( .I(n517), .ZN(n511) );
  CKND4BWP U571 ( .I(n97), .ZN(n790) );
  MOAI22D0BWP U572 ( .A1(n859), .A2(n512), .B1(buf_to_mux[20]), .B2(n511), 
        .ZN(data_to_tx[20]) );
  MOAI22D0BWP U573 ( .A1(n861), .A2(n512), .B1(buf_to_mux[10]), .B2(n511), 
        .ZN(data_to_tx[10]) );
  MOAI22D0BWP U574 ( .A1(n890), .A2(n517), .B1(\dec_logic/raw[13] ), .B2(n522), 
        .ZN(data_to_tx[13]) );
  MOAI22D0BWP U575 ( .A1(n863), .A2(n512), .B1(buf_to_mux[16]), .B2(n511), 
        .ZN(data_to_tx[16]) );
  MOAI22D0BWP U576 ( .A1(n894), .A2(n517), .B1(\dec_logic/raw[19] ), .B2(n846), 
        .ZN(data_to_tx[19]) );
  MOAI22D0BWP U577 ( .A1(n857), .A2(n512), .B1(buf_to_mux[21]), .B2(n511), 
        .ZN(data_to_tx[21]) );
  MOAI22D0BWP U578 ( .A1(n860), .A2(n512), .B1(buf_to_mux[22]), .B2(n511), 
        .ZN(data_to_tx[22]) );
  MOAI22D0BWP U579 ( .A1(n858), .A2(n512), .B1(buf_to_mux[23]), .B2(n511), 
        .ZN(data_to_tx[23]) );
  MOAI22D0BWP U580 ( .A1(n821), .A2(n512), .B1(buf_to_mux[25]), .B2(n511), 
        .ZN(data_to_tx[25]) );
  MOAI22D0BWP U581 ( .A1(n820), .A2(n512), .B1(buf_to_mux[26]), .B2(n511), 
        .ZN(data_to_tx[26]) );
  MOAI22D0BWP U582 ( .A1(n840), .A2(n512), .B1(buf_to_mux[27]), .B2(n511), 
        .ZN(data_to_tx[27]) );
  MOAI22D0BWP U583 ( .A1(n819), .A2(n512), .B1(buf_to_mux[31]), .B2(n511), 
        .ZN(data_to_tx[31]) );
  MOAI22D0BWP U584 ( .A1(n818), .A2(n512), .B1(buf_to_mux[32]), .B2(n511), 
        .ZN(data_to_tx[32]) );
  MOAI22D0BWP U585 ( .A1(n817), .A2(n512), .B1(buf_to_mux[33]), .B2(n511), 
        .ZN(data_to_tx[33]) );
  MOAI22D0BWP U586 ( .A1(n816), .A2(n512), .B1(buf_to_mux[34]), .B2(n511), 
        .ZN(data_to_tx[34]) );
  MOAI22D0BWP U587 ( .A1(n815), .A2(n512), .B1(buf_to_mux[35]), .B2(n511), 
        .ZN(data_to_tx[35]) );
  MOAI22D0BWP U588 ( .A1(n814), .A2(n512), .B1(buf_to_mux[36]), .B2(n511), 
        .ZN(data_to_tx[36]) );
  MOAI22D0BWP U589 ( .A1(n813), .A2(n512), .B1(buf_to_mux[37]), .B2(n511), 
        .ZN(data_to_tx[37]) );
  MOAI22D0BWP U590 ( .A1(n812), .A2(n512), .B1(buf_to_mux[38]), .B2(n511), 
        .ZN(data_to_tx[38]) );
  MOAI22D0BWP U591 ( .A1(n811), .A2(n512), .B1(buf_to_mux[39]), .B2(n511), 
        .ZN(data_to_tx[39]) );
  MOAI22D0BWP U592 ( .A1(n810), .A2(n512), .B1(buf_to_mux[40]), .B2(n511), 
        .ZN(data_to_tx[40]) );
  MOAI22D0BWP U593 ( .A1(n809), .A2(n512), .B1(buf_to_mux[41]), .B2(n511), 
        .ZN(data_to_tx[41]) );
  MOAI22D0BWP U594 ( .A1(n808), .A2(n512), .B1(buf_to_mux[42]), .B2(n511), 
        .ZN(data_to_tx[42]) );
  MOAI22D0BWP U595 ( .A1(n807), .A2(n512), .B1(buf_to_mux[43]), .B2(n511), 
        .ZN(data_to_tx[43]) );
  MOAI22D0BWP U596 ( .A1(n806), .A2(n512), .B1(buf_to_mux[44]), .B2(n511), 
        .ZN(data_to_tx[44]) );
  MOAI22D0BWP U597 ( .A1(n852), .A2(n512), .B1(buf_to_mux[4]), .B2(n511), .ZN(
        data_to_tx[4]) );
  MOAI22D0BWP U598 ( .A1(n886), .A2(n517), .B1(\dec_logic/raw[7] ), .B2(n846), 
        .ZN(data_to_tx[7]) );
  ND2D2BWP U599 ( .A1(n884), .A2(n782), .ZN(n97) );
  MOAI22D0BWP U600 ( .A1(n835), .A2(n917), .B1(n790), .B2(buf_to_mux[17]), 
        .ZN(n447) );
  MOAI22D0BWP U601 ( .A1(\enc_logic/checksum[10] ), .A2(n889), .B1(n790), .B2(
        buf_to_mux[12]), .ZN(n452) );
  IND2D2BWP U602 ( .A1(n531), .B1(n817), .ZN(n532) );
  XOR3D0BWP U603 ( .A1(n614), .A2(n612), .A3(n613), .Z(n583) );
  CKND0BWP U604 ( .I(n588), .ZN(n466) );
  OAI21D0BWP U605 ( .A1(n587), .A2(n466), .B(n589), .ZN(n617) );
  IND2D1BWP U606 ( .A1(n734), .B1(n826), .ZN(n739) );
  XOR3D0BWP U607 ( .A1(n720), .A2(n722), .A3(n721), .Z(n700) );
  CKND0BWP U608 ( .I(n709), .ZN(n467) );
  AN2D0BWP U609 ( .A1(n710), .A2(n467), .Z(n468) );
  OA222D0BWP U610 ( .A1(n467), .A2(n710), .B1(n708), .B2(n468), .C1(n896), 
        .C2(n895), .Z(n725) );
  CKND0BWP U611 ( .I(n576), .ZN(n469) );
  OAI21D0BWP U612 ( .A1(n575), .A2(n469), .B(n589), .ZN(n585) );
  AN2D0BWP U613 ( .A1(n611), .A2(n610), .Z(n623) );
  OAI21D0BWP U614 ( .A1(n729), .A2(n732), .B(n730), .ZN(n738) );
  AO21D0BWP U615 ( .A1(n722), .A2(n721), .B(n720), .Z(n726) );
  CKND0BWP U616 ( .I(n592), .ZN(n470) );
  AOI21D0BWP U617 ( .A1(n590), .A2(n470), .B(n591), .ZN(n622) );
  CKND0BWP U618 ( .I(n584), .ZN(n471) );
  AO21D0BWP U619 ( .A1(n586), .A2(n471), .B(n585), .Z(n633) );
  IND2D1BWP U620 ( .A1(n690), .B1(n829), .ZN(n696) );
  IND2D0BWP U621 ( .A1(n738), .B1(n737), .ZN(n752) );
  CKND0BWP U622 ( .I(n705), .ZN(n472) );
  OA21D0BWP U623 ( .A1(n707), .A2(n472), .B(n706), .Z(n728) );
  AO22D0BWP U624 ( .A1(\main_control/state[3] ), .A2(\main_control/state[2] ), 
        .B1(n797), .B2(n874), .Z(n873) );
  CKND0BWP U625 ( .I(n633), .ZN(n473) );
  OA21D0BWP U626 ( .A1(n631), .A2(n473), .B(n632), .Z(n634) );
  MUX2ND0BWP U627 ( .I0(\dec_logic/three_six_load[1] ), .I1(n852), .S(
        \dec_logic/three_six_load[2] ), .ZN(n474) );
  XNR4D0BWP U628 ( .A1(\dec_logic/three_six_load[0] ), .A2(\dec_logic/raw[0] ), 
        .A3(n474), .A4(\dec_logic/raw[2] ), .ZN(n475) );
  MUX2ND0BWP U629 ( .I0(n858), .I1(\dec_logic/three_six_load[11] ), .S(
        \dec_logic/raw[18] ), .ZN(n476) );
  MUX2ND0BWP U630 ( .I0(n859), .I1(\dec_logic/raw[20] ), .S(n476), .ZN(n477)
         );
  MUX2ND0BWP U631 ( .I0(n860), .I1(\dec_logic/three_six_load[10] ), .S(n477), 
        .ZN(n478) );
  MUX2ND0BWP U632 ( .I0(n857), .I1(\dec_logic/three_six_load[9] ), .S(
        \dec_logic/raw[19] ), .ZN(n479) );
  AOI22D0BWP U633 ( .A1(\dec_logic/checksum/check[15] ), .A2(n817), .B1(
        \dec_logic/checksum/check[13] ), .B2(n815), .ZN(n480) );
  XOR4D0BWP U634 ( .A1(\dec_logic/checksum/check[10] ), .A2(n819), .A3(
        \dec_logic/checksum/check[12] ), .A4(\dec_logic/checksum/check[14] ), 
        .Z(n481) );
  AOI22D0BWP U635 ( .A1(\dec_logic/raw[1] ), .A2(n475), .B1(n856), .B2(n855), 
        .ZN(n482) );
  AOI22D0BWP U636 ( .A1(n478), .A2(n479), .B1(n850), .B2(n851), .ZN(n483) );
  OAI211D0BWP U637 ( .A1(n480), .A2(n481), .B(n483), .C(n482), .ZN(n484) );
  AOI21D0BWP U638 ( .A1(n480), .A2(n481), .B(n484), .ZN(n485) );
  OAI21D0BWP U639 ( .A1(n478), .A2(n479), .B(n485), .ZN(n486) );
  IAO21D0BWP U640 ( .A1(\dec_logic/raw[1] ), .A2(n475), .B(n486), .ZN(n662) );
  IAO21D1BWP U641 ( .A1(n749), .A2(n748), .B(n750), .ZN(n761) );
  NR4D0BWP U642 ( .A1(address[0]), .A2(address[1]), .A3(address[3]), .A4(
        address[2]), .ZN(n487) );
  OAI31D0BWP U643 ( .A1(\dec_logic/token ), .A2(data_type[0]), .A3(
        data_type[1]), .B(n487), .ZN(n488) );
  NR2D0BWP U644 ( .A1(n488), .A2(n880), .ZN(n796) );
  IND2D0BWP U645 ( .A1(n922), .B1(n6), .ZN(n782) );
  CKND0BWP U646 ( .I(n726), .ZN(n489) );
  MAOI222D0BWP U647 ( .A(n727), .B(n728), .C(n489), .ZN(n490) );
  MAOI222D0BWP U648 ( .A(n725), .B(n491), .C(n492), .ZN(n493) );
  CKND2D0BWP U649 ( .A1(n735), .A2(n736), .ZN(n494) );
  CKND2D0BWP U650 ( .A1(n493), .A2(n494), .ZN(n495) );
  OAI211D0BWP U651 ( .A1(n493), .A2(n494), .B(n490), .C(n495), .ZN(n764) );
  CKND0BWP U652 ( .I(n724), .ZN(n491) );
  CKND0BWP U653 ( .I(n723), .ZN(n492) );
  CKND0BWP U654 ( .I(n617), .ZN(n496) );
  CKND0BWP U655 ( .I(n619), .ZN(n497) );
  MAOI222D0BWP U656 ( .A(n618), .B(n620), .C(n497), .ZN(n498) );
  OAI21D0BWP U657 ( .A1(n616), .A2(n496), .B(n498), .ZN(n499) );
  OAI31D0BWP U658 ( .A1(n616), .A2(n498), .A3(n496), .B(n499), .ZN(n625) );
  CKND0BWP U659 ( .I(n641), .ZN(n500) );
  MAOI222D0BWP U660 ( .A(n500), .B(\dec_logic/raw[20] ), .C(
        \dec_logic/checksum/check[27] ), .ZN(n501) );
  OAI31D0BWP U661 ( .A1(n500), .A2(\dec_logic/raw[20] ), .A3(
        \dec_logic/checksum/check[27] ), .B(n501), .ZN(n644) );
  INR2D0BWP U662 ( .A1(\enc_logic/checksum[18] ), .B1(n830), .ZN(n901) );
  AOI21D0BWP U663 ( .A1(n752), .A2(n753), .B(n751), .ZN(n502) );
  AOI21D0BWP U664 ( .A1(n756), .A2(n754), .B(n502), .ZN(n763) );
  MAOI222D0BWP U665 ( .A(\enc_logic/checksum[6] ), .B(\enc_logic/check/N25 ), 
        .C(\enc_logic/checksum[5] ), .ZN(n781) );
  INR2D0BWP U666 ( .A1(n793), .B1(n880), .ZN(n791) );
  AOI22D0BWP U667 ( .A1(n790), .A2(buf_to_mux[44]), .B1(
        \enc_logic/checksum[24] ), .B2(n789), .ZN(n503) );
  AO31D0BWP U668 ( .A1(\enc_logic/checksum[25] ), .A2(\enc_logic/checksum[26] ), .A3(\enc_logic/checksum[27] ), .B(n917), .Z(n504) );
  CKND2D0BWP U669 ( .A1(n503), .A2(n504), .ZN(n420) );
  CKND0BWP U670 ( .I(\enc_logic/checksum[9] ), .ZN(n505) );
  MAOI222D0BWP U671 ( .A(n778), .B(n895), .C(n505), .ZN(n506) );
  OAI22D0BWP U672 ( .A1(n97), .A2(n886), .B1(n917), .B2(n506), .ZN(n457) );
  OR2XD1BWP U673 ( .A1(n822), .A2(n790), .Z(n508) );
  INVD1BWP U674 ( .I(n508), .ZN(n510) );
  INVD1BWP U675 ( .I(n916), .ZN(n507) );
  NR2XD0BWP U676 ( .A1(\enc_logic/encode_type ), .A2(n790), .ZN(n789) );
  CKND0BWP U677 ( .I(n508), .ZN(n509) );
  ND2D2BWP U678 ( .A1(n678), .A2(n834), .ZN(n679) );
  INVD1BWP U679 ( .I(n703), .ZN(n697) );
  ND3D3BWP U680 ( .A1(n590), .A2(n536), .A3(\dec_logic/checksum/check[16] ), 
        .ZN(n569) );
  XNR3D4BWP U681 ( .A1(\dec_logic/three_six_load[11] ), .A2(n638), .A3(n637), 
        .ZN(n647) );
  AOI21D2BWP U682 ( .A1(n636), .A2(n635), .B(n634), .ZN(n637) );
  CKND2BWP U683 ( .I(n695), .ZN(n707) );
  ND3D3BWP U684 ( .A1(n705), .A2(n683), .A3(\enc_logic/checksum[16] ), .ZN(
        n695) );
  OAI21D4BWP U685 ( .A1(n546), .A2(n545), .B(n810), .ZN(n548) );
  ND2D2BWP U686 ( .A1(n746), .A2(\enc_logic/checksum[25] ), .ZN(n759) );
  NR2XD1BWP U687 ( .A1(n748), .A2(n518), .ZN(n746) );
  XNR3D4BWP U688 ( .A1(\dec_logic/checksum/check[8] ), .A2(
        \dec_logic/checksum/check[9] ), .A3(n566), .ZN(n663) );
  XNR2D2BWP U689 ( .A1(n561), .A2(\dec_logic/checksum/check[7] ), .ZN(n566) );
  IND3D4BWP U690 ( .A1(n667), .B1(n666), .B2(n665), .ZN(n788) );
  NR3D8BWP U691 ( .A1(n648), .A2(n647), .A3(n646), .ZN(n667) );
  NR2D3BWP U692 ( .A1(n529), .A2(n567), .ZN(n599) );
  ND2D2BWP U693 ( .A1(n528), .A2(\dec_logic/checksum/check[12] ), .ZN(n529) );
  NR2D3BWP U694 ( .A1(n819), .A2(n527), .ZN(n567) );
  ND2D2BWP U695 ( .A1(n708), .A2(n671), .ZN(n672) );
  CKND1BWP U696 ( .I(n626), .ZN(n636) );
  AOI31D0BWP U697 ( .A1(\enc_logic/checksum[9] ), .A2(\enc_logic/checksum[8] ), 
        .A3(\enc_logic/checksum[7] ), .B(n917), .ZN(n887) );
  AOI31D0BWP U698 ( .A1(\enc_logic/checksum[12] ), .A2(
        \enc_logic/checksum[11] ), .A3(\enc_logic/checksum[10] ), .B(n917), 
        .ZN(n891) );
  IND4D0BWP U699 ( .A1(n795), .B1(n792), .B2(n876), .B3(n881), .ZN(n877) );
  AO22D0BWP U700 ( .A1(\dec_logic/raw[6] ), .A2(n522), .B1(buf_to_mux[6]), 
        .B2(n511), .Z(data_to_tx[6]) );
  AO22D0BWP U701 ( .A1(\dec_logic/three_six_load[2] ), .A2(n522), .B1(
        buf_to_mux[5]), .B2(n511), .Z(data_to_tx[5]) );
  AO22D0BWP U702 ( .A1(\dec_logic/checksum/encoder/N25 ), .A2(n522), .B1(
        buf_to_mux[24]), .B2(n511), .Z(data_to_tx[24]) );
  AO22D0BWP U703 ( .A1(\dec_logic/raw[8] ), .A2(n522), .B1(buf_to_mux[8]), 
        .B2(n511), .Z(data_to_tx[8]) );
  AO22D0BWP U704 ( .A1(\dec_logic/three_six_load[3] ), .A2(n522), .B1(
        buf_to_mux[9]), .B2(n511), .Z(data_to_tx[9]) );
  AO22D0BWP U705 ( .A1(\dec_logic/three_six_load[6] ), .A2(n522), .B1(
        buf_to_mux[15]), .B2(n511), .Z(data_to_tx[15]) );
  AO22D0BWP U706 ( .A1(\dec_logic/three_six_load[8] ), .A2(n522), .B1(
        buf_to_mux[17]), .B2(n511), .Z(data_to_tx[17]) );
  AO22D0BWP U707 ( .A1(\dec_logic/raw[18] ), .A2(n522), .B1(buf_to_mux[18]), 
        .B2(n511), .Z(data_to_tx[18]) );
  AO22D0BWP U708 ( .A1(address[2]), .A2(n522), .B1(n511), .B2(buf_to_mux[50]), 
        .Z(data_to_tx[50]) );
  AO22D0BWP U709 ( .A1(address[3]), .A2(n522), .B1(n511), .B2(buf_to_mux[51]), 
        .Z(data_to_tx[51]) );
  AO22D0BWP U710 ( .A1(address[1]), .A2(n522), .B1(n511), .B2(buf_to_mux[49]), 
        .Z(data_to_tx[49]) );
  AO22D0BWP U711 ( .A1(\dec_logic/raw[14] ), .A2(n522), .B1(buf_to_mux[14]), 
        .B2(n511), .Z(data_to_tx[14]) );
  AO22D0BWP U712 ( .A1(address[0]), .A2(n522), .B1(n511), .B2(buf_to_mux[48]), 
        .Z(data_to_tx[48]) );
  AO22D0BWP U713 ( .A1(\dec_logic/three_six_load[5] ), .A2(n522), .B1(
        buf_to_mux[11]), .B2(n511), .Z(data_to_tx[11]) );
  AO22D0BWP U714 ( .A1(\dec_logic/raw[1] ), .A2(n522), .B1(buf_to_mux[1]), 
        .B2(n511), .Z(data_to_tx[1]) );
  AO22D0BWP U715 ( .A1(\dec_logic/raw[12] ), .A2(n522), .B1(buf_to_mux[12]), 
        .B2(n511), .Z(data_to_tx[12]) );
  AO22D0BWP U716 ( .A1(\dec_logic/raw[0] ), .A2(n522), .B1(buf_to_mux[0]), 
        .B2(n511), .Z(data_to_tx[0]) );
  BUFFD2BWP U717 ( .I(n846), .Z(n522) );
  BUFFD3BWP U718 ( .I(\tHandshake/N12 ), .Z(n513) );
  CKND0BWP U719 ( .I(n594), .ZN(n598) );
  OR3XD1BWP U720 ( .A1(n841), .A2(tx_data_select[0]), .A3(tx_data_select[1]), 
        .Z(n517) );
  INVD1BWP U721 ( .I(n656), .ZN(n657) );
  INVD1BWP U722 ( .I(\tHandshake/state[0] ), .ZN(n928) );
  CKND2D1BWP U723 ( .A1(n779), .A2(n895), .ZN(n780) );
  INVD1BWP U724 ( .I(data_type[1]), .ZN(n649) );
  CKND1BWP U725 ( .I(n755), .ZN(n754) );
  INVD1BWP U726 ( .I(n712), .ZN(n673) );
  OAI211D0BWP U727 ( .A1(n796), .A2(n883), .B(n794), .C(n871), .ZN(
        \main_control/next_select_sig[1] ) );
  INVD3BWP U728 ( .I(n522), .ZN(n512) );
  NR2D0BWP U729 ( .A1(n921), .A2(n801), .ZN(Packet_To_Node_Valid) );
  ND2D1BWP U730 ( .A1(n523), .A2(n847), .ZN(n884) );
  CKND2D0BWP U731 ( .A1(n657), .A2(\dec_logic/three_six_load[6] ), .ZN(n520)
         );
  INR2D1BWP U732 ( .A1(\main_control/state[1] ), .B1(\main_control/state[3] ), 
        .ZN(n523) );
  NR2D4BWP U733 ( .A1(n649), .A2(data_type[0]), .ZN(n656) );
  INVD1BWP U734 ( .I(\dec_logic/checksum/check[11] ), .ZN(n819) );
  INVD1BWP U735 ( .I(\dec_logic/checksum/check[21] ), .ZN(n809) );
  INVD1BWP U736 ( .I(\dec_logic/checksum/check[22] ), .ZN(n808) );
  ND2D1BWP U737 ( .A1(n654), .A2(\dec_logic/checksum/check[10] ), .ZN(n519) );
  OAI22D1BWP U738 ( .A1(n521), .A2(n806), .B1(n656), .B2(n809), .ZN(
        Packet_To_Node[20]) );
  NR2D1BWP U739 ( .A1(n657), .A2(n667), .ZN(n658) );
  ND2D8BWP U740 ( .A1(n667), .A2(n656), .ZN(n521) );
  ND3D2BWP U741 ( .A1(n645), .A2(n644), .A3(n643), .ZN(n646) );
  OAI211D1BWP U742 ( .A1(n97), .A2(n777), .B(n776), .C(n775), .ZN(n444) );
  ND2D1BWP U743 ( .A1(n582), .A2(n581), .ZN(n641) );
  ND2D2BWP U744 ( .A1(n747), .A2(n823), .ZN(n757) );
  ND2D2BWP U745 ( .A1(n553), .A2(\dec_logic/checksum/check[23] ), .ZN(n554) );
  CKND2BWP U746 ( .I(n574), .ZN(n576) );
  CKND2D1BWP U747 ( .A1(n573), .A2(n572), .ZN(n588) );
  INVD1BWP U748 ( .I(n544), .ZN(n543) );
  CKND1BWP U749 ( .I(n685), .ZN(n686) );
  CKND1BWP U750 ( .I(n681), .ZN(n682) );
  ND2D2BWP U751 ( .A1(n677), .A2(\enc_logic/checksum[13] ), .ZN(n715) );
  CKND2D1BWP U752 ( .A1(n791), .A2(n785), .ZN(n786) );
  CKND2D1BWP U753 ( .A1(n844), .A2(n843), .ZN(data_to_tx[53]) );
  CKND2D1BWP U754 ( .A1(n842), .A2(n843), .ZN(data_to_tx[52]) );
  AOI22D0BWP U755 ( .A1(data_type[1]), .A2(n846), .B1(n511), .B2(
        buf_to_mux[53]), .ZN(n844) );
  AO22D0BWP U756 ( .A1(\dec_logic/raw[2] ), .A2(n846), .B1(buf_to_mux[2]), 
        .B2(n511), .Z(data_to_tx[2]) );
  AO22D0BWP U757 ( .A1(\dec_logic/three_six_load[0] ), .A2(n846), .B1(
        buf_to_mux[3]), .B2(n511), .Z(data_to_tx[3]) );
  AOI22D0BWP U758 ( .A1(data_type[0]), .A2(n846), .B1(n511), .B2(
        buf_to_mux[52]), .ZN(n842) );
  XNR3D0BWP U759 ( .A1(n710), .A2(n709), .A3(n708), .ZN(n714) );
  ND2D1BWP U760 ( .A1(\main_control/state[2] ), .A2(n800), .ZN(n922) );
  ND2D3BWP U761 ( .A1(TX_Data_Valid), .A2(n928), .ZN(\tHandshake/N12 ) );
  INR2D0BWP U762 ( .A1(\main_control/state[2] ), .B1(n800), .ZN(n919) );
  NR2D1BWP U763 ( .A1(n6), .A2(\main_control/state[2] ), .ZN(n847) );
  INR2XD0BWP U764 ( .A1(n6), .B1(\main_control/state[2] ), .ZN(n797) );
  INVD1BWP U765 ( .I(tx_data_select[2]), .ZN(n841) );
  INVD1BWP U766 ( .I(\main_control/state[1] ), .ZN(n800) );
  INVD1BWP U767 ( .I(\dec_logic/checksum/check[13] ), .ZN(n817) );
  INVD1BWP U768 ( .I(\dec_logic/checksum/check[17] ), .ZN(n813) );
  INVD1BWP U769 ( .I(\dec_logic/checksum/check[15] ), .ZN(n815) );
  INVD1BWP U770 ( .I(\dec_logic/checksum/check[19] ), .ZN(n811) );
  INVD1BWP U771 ( .I(\dec_logic/checksum/check[20] ), .ZN(n810) );
  INVD1BWP U772 ( .I(\dec_logic/checksum/check[23] ), .ZN(n807) );
  INVD1BWP U773 ( .I(\dec_logic/checksum/check[24] ), .ZN(n806) );
  INVD1BWP U774 ( .I(\dec_logic/checksum/check[25] ), .ZN(n805) );
  INVD1BWP U775 ( .I(\enc_logic/encode_type ), .ZN(n822) );
  CKND2D1BWP U776 ( .A1(n519), .A2(n520), .ZN(Packet_To_Node[6]) );
  MAOI22D0BWP U777 ( .A1(n650), .A2(n654), .B1(n656), .B2(
        \dec_logic/three_six_load[0] ), .ZN(Packet_To_Node[0]) );
  AN4XD1BWP U778 ( .A1(n788), .A2(n792), .A3(n787), .A4(n786), .Z(n5) );
  NR2D0BWP U779 ( .A1(n804), .A2(n658), .ZN(Packet_To_Node[22]) );
  CKND2BWP U780 ( .I(n521), .ZN(n654) );
  NR2D0BWP U781 ( .A1(n805), .A2(n658), .ZN(Packet_To_Node[21]) );
  NR2D0BWP U782 ( .A1(n803), .A2(n658), .ZN(Packet_To_Node[23]) );
  OAI211D0BWP U783 ( .A1(n768), .A2(n767), .B(n766), .C(n507), .ZN(n770) );
  CKND0BWP U784 ( .I(n642), .ZN(n630) );
  AO222D0BWP U785 ( .A1(n772), .A2(n507), .B1(\enc_logic/checksum[13] ), .B2(
        n510), .C1(n790), .C2(buf_to_mux[21]), .Z(n443) );
  ND2D2BWP U786 ( .A1(n629), .A2(n628), .ZN(n640) );
  NR2D2BWP U787 ( .A1(n803), .A2(n641), .ZN(n642) );
  OAI211D0BWP U788 ( .A1(\enc_logic/checksum[27] ), .A2(n774), .B(n773), .C(
        n789), .ZN(n776) );
  NR2D1BWP U789 ( .A1(n773), .A2(n771), .ZN(n768) );
  NR2D2BWP U790 ( .A1(n582), .A2(n583), .ZN(n627) );
  XOR3D1BWP U791 ( .A1(n633), .A2(n632), .A3(n631), .Z(n626) );
  CKND1BWP U792 ( .I(n579), .ZN(n580) );
  ND2D2BWP U793 ( .A1(n579), .A2(\dec_logic/checksum/check[26] ), .ZN(n582) );
  INR2XD0BWP U794 ( .A1(n760), .B1(n758), .ZN(n774) );
  CKND2D1BWP U795 ( .A1(n760), .A2(n759), .ZN(n762) );
  ND3D2BWP U796 ( .A1(n759), .A2(\enc_logic/checksum[26] ), .A3(n757), .ZN(
        n760) );
  NR2D3BWP U797 ( .A1(n559), .A2(n614), .ZN(n613) );
  CKND1BWP U798 ( .I(n746), .ZN(n747) );
  CKND1BWP U799 ( .I(n753), .ZN(n750) );
  CKND1BWP U800 ( .I(n558), .ZN(n557) );
  ND2D1BWP U801 ( .A1(n558), .A2(\dec_logic/checksum/check[25] ), .ZN(n559) );
  NR2D2BWP U802 ( .A1(n806), .A2(n556), .ZN(n614) );
  NR2XD1BWP U803 ( .A1(n745), .A2(n824), .ZN(n748) );
  ND2D1BWP U804 ( .A1(n744), .A2(n743), .ZN(n745) );
  NR2D2BWP U805 ( .A1(n554), .A2(n584), .ZN(n577) );
  OAI21D2BWP U806 ( .A1(n552), .A2(n584), .B(n807), .ZN(n555) );
  CKND2D1BWP U807 ( .A1(n743), .A2(n740), .ZN(n737) );
  CKND1BWP U808 ( .I(n739), .ZN(n742) );
  CKND1BWP U809 ( .I(n553), .ZN(n552) );
  CKND1BWP U810 ( .I(n740), .ZN(n741) );
  ND2D2BWP U811 ( .A1(n551), .A2(n808), .ZN(n553) );
  INR2XD0BWP U812 ( .A1(n733), .B1(n732), .ZN(n734) );
  NR2D2BWP U813 ( .A1(n827), .A2(n731), .ZN(n732) );
  NR2D2BWP U814 ( .A1(n549), .A2(n809), .ZN(n574) );
  CKND2D2BWP U815 ( .A1(n699), .A2(n702), .ZN(n731) );
  XNR3D0BWP U816 ( .A1(n703), .A2(n702), .A3(n700), .ZN(n729) );
  ND3D2BWP U817 ( .A1(n703), .A2(n696), .A3(\enc_logic/checksum[20] ), .ZN(
        n702) );
  ND3D2BWP U818 ( .A1(n572), .A2(n547), .A3(\dec_logic/checksum/check[20] ), 
        .ZN(n573) );
  CKND1BWP U819 ( .I(n696), .ZN(n698) );
  ND2D2BWP U820 ( .A1(n543), .A2(n811), .ZN(n547) );
  CKND1BWP U821 ( .I(n572), .ZN(n545) );
  CKND1BWP U822 ( .I(n700), .ZN(n701) );
  ND2D1BWP U823 ( .A1(n690), .A2(\enc_logic/checksum[19] ), .ZN(n703) );
  NR2D2BWP U824 ( .A1(n689), .A2(n688), .ZN(n690) );
  NR2D2BWP U825 ( .A1(n542), .A2(n541), .ZN(n544) );
  ND2D1BWP U826 ( .A1(n571), .A2(n570), .ZN(n611) );
  ND3D2BWP U827 ( .A1(n721), .A2(\enc_logic/checksum[18] ), .A3(n687), .ZN(
        n722) );
  ND2D1BWP U828 ( .A1(n686), .A2(n830), .ZN(n687) );
  ND2D2BWP U829 ( .A1(n539), .A2(n813), .ZN(n540) );
  ND2D1BWP U830 ( .A1(n685), .A2(\enc_logic/checksum[17] ), .ZN(n721) );
  CKND1BWP U831 ( .I(n538), .ZN(n539) );
  NR2D2BWP U832 ( .A1(n537), .A2(n592), .ZN(n538) );
  NR2D2BWP U833 ( .A1(n684), .A2(n707), .ZN(n685) );
  CKND2BWP U834 ( .I(n569), .ZN(n592) );
  XNR3D0BWP U835 ( .A1(n705), .A2(n695), .A3(n706), .ZN(n720) );
  ND2D1BWP U836 ( .A1(n682), .A2(n832), .ZN(n683) );
  INVD1BWP U837 ( .I(n534), .ZN(n535) );
  NR2D1BWP U838 ( .A1(n719), .A2(n718), .ZN(n723) );
  NR2D1BWP U839 ( .A1(n609), .A2(n608), .ZN(n618) );
  ND2D1BWP U840 ( .A1(n681), .A2(\enc_logic/checksum[15] ), .ZN(n705) );
  NR2D1BWP U841 ( .A1(n607), .A2(n606), .ZN(n608) );
  NR2D2BWP U842 ( .A1(n533), .A2(n606), .ZN(n534) );
  NR2D0BWP U843 ( .A1(n717), .A2(n716), .ZN(n718) );
  NR2D2BWP U844 ( .A1(n680), .A2(n716), .ZN(n681) );
  XNR3D0BWP U845 ( .A1(n715), .A2(n694), .A3(n719), .ZN(n706) );
  CKND2BWP U846 ( .I(n568), .ZN(n606) );
  ND3D2BWP U847 ( .A1(n532), .A2(\dec_logic/checksum/check[14] ), .A3(n605), 
        .ZN(n568) );
  AOI211D1BWP U848 ( .A1(n790), .A2(buf_to_mux[31]), .B(n904), .C(n903), .ZN(
        n905) );
  AOI211D1BWP U849 ( .A1(n790), .A2(buf_to_mux[37]), .B(n909), .C(n908), .ZN(
        n910) );
  AOI211D1BWP U850 ( .A1(n790), .A2(buf_to_mux[43]), .B(n914), .C(n913), .ZN(
        n915) );
  AOI31D0BWP U851 ( .A1(n509), .A2(n831), .A3(n898), .B(n897), .ZN(n899) );
  CKND0BWP U852 ( .I(n715), .ZN(n717) );
  CKND0BWP U853 ( .I(n605), .ZN(n607) );
  OAI211D0BWP U854 ( .A1(n97), .A2(n894), .B(n893), .C(n892), .ZN(n445) );
  OAI211D0BWP U855 ( .A1(n97), .A2(n890), .B(n889), .C(n888), .ZN(n451) );
  NR2D1BWP U856 ( .A1(n714), .A2(n713), .ZN(n724) );
  CKND1BWP U857 ( .I(n677), .ZN(n678) );
  CKND1BWP U858 ( .I(n604), .ZN(n609) );
  CKND2D1BWP U859 ( .A1(n601), .A2(n600), .ZN(n603) );
  AO222D0BWP U860 ( .A1(n790), .A2(buf_to_mux[27]), .B1(
        \enc_logic/checksum[16] ), .B2(n510), .C1(\enc_logic/checksum[7] ), 
        .C2(n789), .Z(n437) );
  OAI31D0BWP U861 ( .A1(n834), .A2(n833), .A3(n832), .B(n509), .ZN(n775) );
  AO222D0BWP U862 ( .A1(n790), .A2(buf_to_mux[33]), .B1(
        \enc_logic/checksum[19] ), .B2(n509), .C1(\enc_logic/checksum[13] ), 
        .C2(n789), .Z(n431) );
  AO222D0BWP U863 ( .A1(n790), .A2(buf_to_mux[40]), .B1(
        \enc_logic/checksum[20] ), .B2(n507), .C1(n510), .C2(
        \enc_logic/checksum[23] ), .Z(n424) );
  AO222D0BWP U864 ( .A1(n790), .A2(buf_to_mux[28]), .B1(
        \enc_logic/checksum[17] ), .B2(n510), .C1(\enc_logic/checksum[8] ), 
        .C2(n789), .Z(n436) );
  OAI211D0BWP U865 ( .A1(n833), .A2(n832), .B(n510), .C(n834), .ZN(n892) );
  AO222D0BWP U866 ( .A1(n790), .A2(buf_to_mux[41]), .B1(
        \enc_logic/checksum[21] ), .B2(n507), .C1(n509), .C2(
        \enc_logic/checksum[24] ), .Z(n423) );
  AO222D0BWP U867 ( .A1(n790), .A2(buf_to_mux[34]), .B1(
        \enc_logic/checksum[20] ), .B2(n509), .C1(\enc_logic/checksum[14] ), 
        .C2(n789), .Z(n430) );
  AO222D0BWP U868 ( .A1(n790), .A2(buf_to_mux[35]), .B1(
        \enc_logic/checksum[21] ), .B2(n509), .C1(\enc_logic/checksum[15] ), 
        .C2(n507), .Z(n429) );
  AO222D0BWP U869 ( .A1(n790), .A2(buf_to_mux[39]), .B1(
        \enc_logic/checksum[19] ), .B2(n507), .C1(n510), .C2(
        \enc_logic/checksum[22] ), .Z(n425) );
  AO222D0BWP U870 ( .A1(n790), .A2(buf_to_mux[29]), .B1(
        \enc_logic/checksum[18] ), .B2(n510), .C1(\enc_logic/checksum[9] ), 
        .C2(n507), .Z(n435) );
  OAI211D0BWP U871 ( .A1(n836), .A2(n835), .B(n510), .C(n837), .ZN(n888) );
  AOI22D0BWP U872 ( .A1(n790), .A2(buf_to_mux[25]), .B1(n507), .B2(
        \enc_logic/checksum[5] ), .ZN(n900) );
  CKND1BWP U873 ( .I(n789), .ZN(n916) );
  NR2D2BWP U874 ( .A1(n530), .A2(n599), .ZN(n531) );
  NR2D0BWP U875 ( .A1(n712), .A2(n711), .ZN(n713) );
  NR2D2BWP U876 ( .A1(n676), .A2(n711), .ZN(n677) );
  NR2D2BWP U877 ( .A1(n675), .A2(n712), .ZN(n711) );
  OAI22D0BWP U878 ( .A1(n77), .A2(n517), .B1(n803), .B2(n512), .ZN(
        data_to_tx[47]) );
  OAI22D0BWP U879 ( .A1(n75), .A2(n517), .B1(n805), .B2(n512), .ZN(
        data_to_tx[45]) );
  OAI22D0BWP U880 ( .A1(n76), .A2(n517), .B1(n804), .B2(n512), .ZN(
        data_to_tx[46]) );
  INVD1BWP U881 ( .I(n567), .ZN(n600) );
  CKND2D1BWP U882 ( .A1(n882), .A2(n881), .ZN(\main_control/next_state[2] ) );
  AOI21D0BWP U883 ( .A1(n795), .A2(n928), .B(n784), .ZN(n787) );
  NR2D1BWP U884 ( .A1(n876), .A2(\dec_logic/token ), .ZN(n666) );
  ND2D1BWP U885 ( .A1(n527), .A2(n819), .ZN(n528) );
  AOI22D0BWP U886 ( .A1(n795), .A2(\tHandshake/state[0] ), .B1(n523), .B2(n797), .ZN(n794) );
  AOI22D0BWP U887 ( .A1(n928), .A2(n925), .B1(n926), .B2(n924), .ZN(
        \tHandshake/next_state[0] ) );
  OA32D0BWP U888 ( .A1(n926), .A2(\tHandshake/state[0] ), .A3(TX_Data_Ready), 
        .B1(TX_Data_Valid), .B2(n926), .Z(\tHandshake/next_state[1] ) );
  OAI22D0BWP U889 ( .A1(n783), .A2(n782), .B1(n929), .B2(n6), .ZN(n784) );
  ND2D2BWP U890 ( .A1(n597), .A2(n526), .ZN(n527) );
  ND3D0BWP U891 ( .A1(n798), .A2(n796), .A3(\main_control/state[3] ), .ZN(n876) );
  NR2D1BWP U892 ( .A1(n874), .A2(n524), .ZN(n879) );
  NR2D0BWP U893 ( .A1(n884), .A2(Packet_From_Node_Valid), .ZN(n795) );
  NR2D1BWP U894 ( .A1(n929), .A2(n801), .ZN(n793) );
  AOI21D0BWP U895 ( .A1(n923), .A2(n922), .B(n928), .ZN(n926) );
  OAI22D0BWP U896 ( .A1(\main_control/state[3] ), .A2(n922), .B1(n884), .B2(
        n872), .ZN(n878) );
  OAI31D0BWP U897 ( .A1(n6), .A2(n929), .A3(n927), .B(n883), .ZN(
        \main_control/next_state[3] ) );
  CKND0BWP U898 ( .I(n597), .ZN(n595) );
  CKND2D0BWP U899 ( .A1(n799), .A2(\tHandshake/state[0] ), .ZN(n783) );
  IAO21D0BWP U900 ( .A1(n921), .A2(\main_control/state[2] ), .B(n797), .ZN(
        n524) );
  CKND2D0BWP U901 ( .A1(n523), .A2(\main_control/state[2] ), .ZN(n929) );
  AO21D0BWP U902 ( .A1(n801), .A2(n921), .B(\main_control/state[2] ), .Z(n923)
         );
  NR2D0BWP U903 ( .A1(n922), .A2(n6), .ZN(Core_Load_Ack) );
  NR2D1BWP U904 ( .A1(n845), .A2(tx_data_select[0]), .ZN(n846) );
  IAO21D0BWP U905 ( .A1(\dec_logic/token ), .A2(tx_data_select[0]), .B(n845), 
        .ZN(data_to_tx[54]) );
  CKND1BWP U906 ( .I(n663), .ZN(n525) );
  CKND1BWP U907 ( .I(n669), .ZN(n670) );
  OAI21D0BWP U908 ( .A1(\rHandshake/state[1] ), .A2(n802), .B(n927), .ZN(
        RX_Data_Ready) );
  CKND2D0BWP U909 ( .A1(\main_control/state[3] ), .A2(\main_control/state[1] ), 
        .ZN(n921) );
  CKND0BWP U910 ( .I(\main_control/state[3] ), .ZN(n799) );
  CKND1BWP U911 ( .I(n927), .ZN(n785) );
  CKND2D0BWP U912 ( .A1(tx_data_select[0]), .A2(n841), .ZN(n843) );
  OAI21D0BWP U913 ( .A1(n870), .A2(n869), .B(\main_control/state[3] ), .ZN(
        n875) );
  NR2D0BWP U914 ( .A1(\main_control/state[1] ), .A2(\main_control/state[3] ), 
        .ZN(n874) );
  ND3D0BWP U915 ( .A1(\main_control/state[3] ), .A2(n797), .A3(n800), .ZN(n871) );
  XNR4D1BWP U916 ( .A1(\dec_logic/three_six_load[6] ), .A2(\dec_logic/raw[12] ), .A3(\dec_logic/raw[14] ), .A4(n864), .ZN(n866) );
  XNR4D1BWP U917 ( .A1(\dec_logic/three_six_load[3] ), .A2(\dec_logic/raw[6] ), 
        .A3(\dec_logic/raw[8] ), .A4(n862), .ZN(n867) );
  CKND0BWP U918 ( .I(n901), .ZN(n898) );
  CKND0BWP U919 ( .I(TX_Data_Valid), .ZN(n924) );
  CKND1BWP U920 ( .I(\rHandshake/state[1] ), .ZN(n918) );
  CKND1BWP U921 ( .I(buf_to_mux[20]), .ZN(n777) );
  NR2D1BWP U922 ( .A1(\dec_logic/token ), .A2(n869), .ZN(n880) );
  CKND2D1BWP U923 ( .A1(n561), .A2(\dec_logic/checksum/check[7] ), .ZN(n564)
         );
  XNR2D1BWP U924 ( .A1(n691), .A2(\enc_logic/checksum[7] ), .ZN(n693) );
  CKND2D1BWP U925 ( .A1(n691), .A2(\enc_logic/checksum[7] ), .ZN(n692) );
  NR2D0BWP U926 ( .A1(n828), .A2(n827), .ZN(n906) );
  NR2D0BWP U927 ( .A1(n825), .A2(n824), .ZN(n911) );
  AOI22D0BWP U928 ( .A1(\dec_logic/checksum/check[20] ), .A2(
        \dec_logic/checksum/check[16] ), .B1(n814), .B2(n810), .ZN(n848) );
  AOI22D0BWP U929 ( .A1(\dec_logic/checksum/check[26] ), .A2(
        \dec_logic/checksum/check[22] ), .B1(n808), .B2(n804), .ZN(n853) );
  AOI22D0BWP U930 ( .A1(\dec_logic/checksum/check[25] ), .A2(
        \dec_logic/checksum/check[27] ), .B1(n803), .B2(n805), .ZN(n856) );
  AOI22D0BWP U931 ( .A1(\dec_logic/checksum/check[21] ), .A2(n811), .B1(
        \dec_logic/checksum/check[19] ), .B2(n809), .ZN(n851) );
  NR2D1BWP U932 ( .A1(\dec_logic/checksum/check[8] ), .A2(
        \dec_logic/checksum/check[9] ), .ZN(n565) );
  NR2D1BWP U933 ( .A1(\dec_logic/checksum/check[5] ), .A2(
        \dec_logic/checksum/check[6] ), .ZN(n562) );
  XOR3D1BWP U934 ( .A1(\dec_logic/checksum/encoder/N25 ), .A2(
        \dec_logic/checksum/check[5] ), .A3(\dec_logic/checksum/check[6] ), 
        .Z(n561) );
  XOR3D1BWP U935 ( .A1(\enc_logic/checksum[6] ), .A2(\enc_logic/check/N25 ), 
        .A3(\enc_logic/checksum[5] ), .Z(n691) );
  NR2D1BWP U936 ( .A1(\enc_logic/checksum[8] ), .A2(\enc_logic/checksum[9] ), 
        .ZN(n779) );
  CKND2BWP U937 ( .I(n627), .ZN(n629) );
  CKND2BWP U938 ( .I(n571), .ZN(n541) );
  ND3D2BWP U939 ( .A1(n540), .A2(n570), .A3(\dec_logic/checksum/check[18] ), 
        .ZN(n571) );
  ND2D3BWP U940 ( .A1(n555), .A2(n586), .ZN(n556) );
  ND2D2BWP U941 ( .A1(n548), .A2(n573), .ZN(n549) );
  ND2D2BWP U942 ( .A1(n538), .A2(\dec_logic/checksum/check[17] ), .ZN(n570) );
  XOR3D1BWP U943 ( .A1(n764), .A2(n763), .A3(n766), .Z(n765) );
  XNR2D1BWP U944 ( .A1(n610), .A2(n611), .ZN(n587) );
  MOAI22D0BWP U945 ( .A1(\enc_logic/checksum[13] ), .A2(n893), .B1(n790), .B2(
        buf_to_mux[18]), .ZN(n446) );
  MOAI22D0BWP U946 ( .A1(n836), .A2(n917), .B1(n790), .B2(buf_to_mux[16]), 
        .ZN(n448) );
  MOAI22D0BWP U947 ( .A1(n838), .A2(n917), .B1(n790), .B2(buf_to_mux[11]), 
        .ZN(n453) );
  MOAI22D0BWP U948 ( .A1(n837), .A2(n917), .B1(n790), .B2(buf_to_mux[15]), 
        .ZN(n449) );
  MOAI22D0BWP U949 ( .A1(n895), .A2(n917), .B1(n790), .B2(buf_to_mux[9]), .ZN(
        n455) );
  MOAI22D0BWP U950 ( .A1(n778), .A2(n917), .B1(n790), .B2(buf_to_mux[10]), 
        .ZN(n454) );
  MOAI22D0BWP U951 ( .A1(n780), .A2(n917), .B1(n790), .B2(buf_to_mux[6]), .ZN(
        n458) );
  CKND2BWP U952 ( .I(n509), .ZN(n917) );
  CKND2BWP U953 ( .I(n577), .ZN(n586) );
  ND2D2BWP U954 ( .A1(n544), .A2(\dec_logic/checksum/check[19] ), .ZN(n572) );
  MOAI22D0BWP U955 ( .A1(n660), .A2(n512), .B1(n511), .B2(buf_to_mux[29]), 
        .ZN(data_to_tx[29]) );
  MOAI22D0BWP U956 ( .A1(n659), .A2(n512), .B1(n511), .B2(buf_to_mux[28]), 
        .ZN(data_to_tx[28]) );
  MOAI22D0BWP U957 ( .A1(n661), .A2(n512), .B1(n511), .B2(buf_to_mux[30]), 
        .ZN(data_to_tx[30]) );
  CKND0BWP U958 ( .I(n599), .ZN(n601) );
  XNR2D1BWP U959 ( .A1(n736), .A2(n735), .ZN(n751) );
  IND2D1BWP U960 ( .A1(\rHandshake/state[0] ), .B1(\rHandshake/state[1] ), 
        .ZN(n927) );
  XNR2D1BWP U961 ( .A1(n617), .A2(n616), .ZN(n632) );
  INR2D2BWP U962 ( .A1(n560), .B1(n613), .ZN(n579) );
  ND2D2BWP U963 ( .A1(n534), .A2(\dec_logic/checksum/check[15] ), .ZN(n590) );
  ND2D2BWP U964 ( .A1(n531), .A2(\dec_logic/checksum/check[13] ), .ZN(n605) );
  ND2D2BWP U965 ( .A1(n663), .A2(\dec_logic/checksum/check[10] ), .ZN(n597) );
  ND2D1BWP U966 ( .A1(n927), .A2(n920), .ZN(\rHandshake/next_state[1] ) );
  ND2D1BWP U967 ( .A1(TX_Data_Ready), .A2(n924), .ZN(n925) );
  INVD1BWP U968 ( .I(Packet_From_Node_Valid), .ZN(n872) );
  ND2D1BWP U969 ( .A1(tx_data_select[1]), .A2(n841), .ZN(n845) );
  INVD1BWP U970 ( .I(buf_to_mux[7]), .ZN(n886) );
  INVD1BWP U971 ( .I(buf_to_mux[19]), .ZN(n894) );
  INVD1BWP U972 ( .I(\enc_logic/checksum[12] ), .ZN(n835) );
  INVD1BWP U973 ( .I(buf_to_mux[13]), .ZN(n890) );
  ND2D1BWP U974 ( .A1(n900), .A2(n899), .ZN(n439) );
  INVD1BWP U975 ( .I(\enc_logic/checksum[16] ), .ZN(n831) );
  INVD1BWP U976 ( .I(\enc_logic/checksum[14] ), .ZN(n833) );
  ND2D1BWP U977 ( .A1(n770), .A2(n769), .ZN(n442) );
  INVD1BWP U978 ( .I(\dec_logic/three_six_load[2] ), .ZN(n651) );
  INVD1BWP U979 ( .I(\dec_logic/three_six_load[3] ), .ZN(n652) );
  INVD1BWP U980 ( .I(\dec_logic/checksum/check[14] ), .ZN(n816) );
  INVD1BWP U981 ( .I(\dec_logic/checksum/check[7] ), .ZN(n840) );
  INVD1BWP U982 ( .I(\dec_logic/three_six_load[8] ), .ZN(n655) );
  INVD1BWP U983 ( .I(\dec_logic/checksum/check[12] ), .ZN(n818) );
  INVD1BWP U984 ( .I(\dec_logic/three_six_load[5] ), .ZN(n653) );
  ND2D1BWP U985 ( .A1(n767), .A2(n768), .ZN(n766) );
  ND2D1BWP U986 ( .A1(n774), .A2(\enc_logic/checksum[27] ), .ZN(n773) );
  INVD1BWP U987 ( .I(\enc_logic/checksum[25] ), .ZN(n823) );
  AN2XD1BWP U988 ( .A1(n745), .A2(n824), .Z(n518) );
  ND2D1BWP U989 ( .A1(n749), .A2(n748), .ZN(n753) );
  INVD1BWP U990 ( .I(\enc_logic/checksum[24] ), .ZN(n824) );
  INVD1BWP U991 ( .I(\enc_logic/checksum[23] ), .ZN(n825) );
  INVD1BWP U992 ( .I(\enc_logic/checksum[22] ), .ZN(n826) );
  ND2D1BWP U993 ( .A1(n734), .A2(\enc_logic/checksum[22] ), .ZN(n740) );
  ND2D1BWP U994 ( .A1(n731), .A2(n827), .ZN(n733) );
  INVD1BWP U995 ( .I(\enc_logic/checksum[7] ), .ZN(n895) );
  ND2D1BWP U996 ( .A1(n730), .A2(n704), .ZN(n736) );
  ND2D1BWP U997 ( .A1(n729), .A2(n732), .ZN(n730) );
  INVD1BWP U998 ( .I(\enc_logic/checksum[20] ), .ZN(n828) );
  INVD1BWP U999 ( .I(\enc_logic/checksum[21] ), .ZN(n827) );
  INVD1BWP U1000 ( .I(\enc_logic/checksum[8] ), .ZN(n778) );
  INVD1BWP U1001 ( .I(\enc_logic/checksum[9] ), .ZN(n838) );
  INVD1BWP U1002 ( .I(\enc_logic/checksum[19] ), .ZN(n829) );
  INVD1BWP U1003 ( .I(n722), .ZN(n688) );
  INVD1BWP U1004 ( .I(\enc_logic/checksum[17] ), .ZN(n830) );
  INVD1BWP U1005 ( .I(\enc_logic/checksum[15] ), .ZN(n832) );
  INVD1BWP U1006 ( .I(n694), .ZN(n716) );
  INVD1BWP U1007 ( .I(\enc_logic/checksum[13] ), .ZN(n834) );
  ND2D1BWP U1008 ( .A1(n674), .A2(\enc_logic/checksum[12] ), .ZN(n675) );
  ND2D1BWP U1009 ( .A1(n672), .A2(n836), .ZN(n674) );
  ND2D1BWP U1010 ( .A1(n670), .A2(n837), .ZN(n671) );
  INVD1BWP U1011 ( .I(\enc_logic/checksum[10] ), .ZN(n837) );
  ND2D1BWP U1012 ( .A1(n669), .A2(\enc_logic/checksum[10] ), .ZN(n708) );
  INVD1BWP U1013 ( .I(\enc_logic/checksum[11] ), .ZN(n836) );
  INVD1BWP U1014 ( .I(\dec_logic/token ), .ZN(n870) );
  INVD1BWP U1015 ( .I(\dec_logic/three_six_load[9] ), .ZN(n857) );
  INVD1BWP U1016 ( .I(\dec_logic/three_six_load[11] ), .ZN(n858) );
  INVD1BWP U1017 ( .I(\dec_logic/raw[20] ), .ZN(n859) );
  INVD1BWP U1018 ( .I(\dec_logic/three_six_load[10] ), .ZN(n860) );
  INVD1BWP U1019 ( .I(\dec_logic/three_six_load[1] ), .ZN(n852) );
  INVD1BWP U1020 ( .I(\dec_logic/three_six_load[7] ), .ZN(n863) );
  INVD1BWP U1021 ( .I(\dec_logic/three_six_load[4] ), .ZN(n861) );
  INVD1BWP U1022 ( .I(\dec_logic/checksum/check[16] ), .ZN(n814) );
  INVD1BWP U1023 ( .I(\dec_logic/checksum/check[18] ), .ZN(n812) );
  ND2D1BWP U1024 ( .A1(data_type[0]), .A2(data_type[1]), .ZN(n869) );
  ND2D1BWP U1025 ( .A1(n642), .A2(\dec_logic/raw[20] ), .ZN(n643) );
  ND2D1BWP U1026 ( .A1(n625), .A2(n624), .ZN(n638) );
  ND2D1BWP U1027 ( .A1(n603), .A2(n602), .ZN(n619) );
  ND2D1BWP U1028 ( .A1(n580), .A2(n804), .ZN(n581) );
  INVD1BWP U1029 ( .I(\dec_logic/checksum/check[26] ), .ZN(n804) );
  INVD1BWP U1030 ( .I(\dec_logic/checksum/check[27] ), .ZN(n803) );
  ND2D1BWP U1031 ( .A1(n575), .A2(n574), .ZN(n589) );
  INVD1BWP U1032 ( .I(\dec_logic/checksum/check[8] ), .ZN(n659) );
  INVD1BWP U1033 ( .I(\dec_logic/checksum/check[9] ), .ZN(n660) );
  INVD1BWP U1034 ( .I(\dec_logic/checksum/check[5] ), .ZN(n821) );
  INVD1BWP U1035 ( .I(\dec_logic/checksum/check[6] ), .ZN(n820) );
  INVD1BWP U1036 ( .I(\dec_logic/checksum/encoder/N25 ), .ZN(n650) );
  ND2D1BWP U1037 ( .A1(n525), .A2(n661), .ZN(n526) );
  INVD1BWP U1038 ( .I(\dec_logic/checksum/check[10] ), .ZN(n661) );
  OAI211D1BWP U1039 ( .A1(n919), .A2(n802), .B(RX_Data_Valid), .C(n918), .ZN(
        \rHandshake/next_state[0] ) );
  AOI32D1BWP U1040 ( .A1(\rHandshake/state[0] ), .A2(RX_Data_Valid), .A3(n919), 
        .B1(\rHandshake/state[1] ), .B2(RX_Data_Valid), .ZN(n920) );
  IND2D1BWP U1041 ( .A1(n875), .B1(n798), .ZN(n883) );
  OR3XD1BWP U1042 ( .A1(n793), .A2(n873), .A3(n878), .Z(
        \main_control/next_select_sig[2] ) );
  AOI211XD0BWP U1043 ( .A1(n880), .A2(n793), .B(n879), .C(n878), .ZN(n882) );
  AO211D1BWP U1044 ( .A1(Core_Load_Ack), .A2(n799), .B(n791), .C(n877), .Z(
        \main_control/next_state[1] ) );
  IND2D1BWP U1045 ( .A1(n929), .B1(n927), .ZN(n881) );
  AO22D1BWP U1046 ( .A1(n510), .A2(\enc_logic/check/N25 ), .B1(n790), .B2(
        buf_to_mux[3]), .Z(n461) );
  AO22D1BWP U1047 ( .A1(n510), .A2(\enc_logic/checksum[5] ), .B1(n790), .B2(
        buf_to_mux[4]), .Z(n460) );
  AO22D1BWP U1048 ( .A1(n509), .A2(n781), .B1(n790), .B2(buf_to_mux[1]), .Z(
        n463) );
  AO22D1BWP U1049 ( .A1(n510), .A2(\enc_logic/checksum[6] ), .B1(n790), .B2(
        buf_to_mux[5]), .Z(n459) );
  AO22D1BWP U1050 ( .A1(n790), .A2(buf_to_mux[2]), .B1(n509), .B2(n896), .Z(
        n462) );
  ND3D1BWP U1051 ( .A1(n509), .A2(n832), .A3(n833), .ZN(n893) );
  ND3D1BWP U1052 ( .A1(n509), .A2(n835), .A3(n836), .ZN(n889) );
  AOI32D1BWP U1053 ( .A1(\enc_logic/checksum[16] ), .A2(n902), .A3(n901), .B1(
        n917), .B2(n902), .ZN(n438) );
  AOI22D1BWP U1054 ( .A1(n790), .A2(buf_to_mux[26]), .B1(n789), .B2(
        \enc_logic/checksum[6] ), .ZN(n902) );
  AOI32D1BWP U1055 ( .A1(\enc_logic/checksum[19] ), .A2(n907), .A3(n906), .B1(
        n917), .B2(n907), .ZN(n432) );
  AOI22D1BWP U1056 ( .A1(n790), .A2(buf_to_mux[32]), .B1(n789), .B2(
        \enc_logic/checksum[12] ), .ZN(n907) );
  AO21D1BWP U1057 ( .A1(n790), .A2(buf_to_mux[0]), .B(n885), .Z(n464) );
  AO21D1BWP U1058 ( .A1(n790), .A2(buf_to_mux[14]), .B(n891), .Z(n450) );
  AO21D1BWP U1059 ( .A1(n790), .A2(buf_to_mux[8]), .B(n887), .Z(n456) );
  AOI32D1BWP U1060 ( .A1(\enc_logic/checksum[22] ), .A2(n912), .A3(n911), .B1(
        n917), .B2(n912), .ZN(n426) );
  AOI22D1BWP U1061 ( .A1(n790), .A2(buf_to_mux[38]), .B1(n789), .B2(
        \enc_logic/checksum[18] ), .ZN(n912) );
  AO222D1BWP U1062 ( .A1(n823), .A2(n914), .B1(n507), .B2(
        \enc_logic/checksum[22] ), .C1(n790), .C2(buf_to_mux[42]), .Z(n422) );
  AO222D1BWP U1063 ( .A1(n829), .A2(n904), .B1(n507), .B2(
        \enc_logic/checksum[10] ), .C1(n790), .C2(buf_to_mux[30]), .Z(n434) );
  AO222D1BWP U1064 ( .A1(n831), .A2(n897), .B1(n507), .B2(
        \enc_logic/check/N25 ), .C1(n790), .C2(buf_to_mux[24]), .Z(n440) );
  AO222D1BWP U1065 ( .A1(n826), .A2(n909), .B1(n507), .B2(
        \enc_logic/checksum[16] ), .C1(n790), .C2(buf_to_mux[36]), .Z(n428) );
  OAI21D1BWP U1066 ( .A1(n916), .A2(n825), .B(n915), .ZN(n421) );
  AOI211XD0BWP U1067 ( .A1(\enc_logic/checksum[26] ), .A2(
        \enc_logic/checksum[27] ), .B(\enc_logic/checksum[25] ), .C(n917), 
        .ZN(n913) );
  OAI21D1BWP U1068 ( .A1(n916), .A2(n830), .B(n910), .ZN(n427) );
  AOI211XD0BWP U1069 ( .A1(\enc_logic/checksum[23] ), .A2(
        \enc_logic/checksum[24] ), .B(\enc_logic/checksum[22] ), .C(n917), 
        .ZN(n908) );
  OAI21D1BWP U1070 ( .A1(n916), .A2(n836), .B(n905), .ZN(n433) );
  AOI211XD0BWP U1071 ( .A1(\enc_logic/checksum[20] ), .A2(
        \enc_logic/checksum[21] ), .B(\enc_logic/checksum[19] ), .C(n917), 
        .ZN(n903) );
  AOI22D1BWP U1072 ( .A1(n510), .A2(\enc_logic/checksum[14] ), .B1(n790), .B2(
        buf_to_mux[22]), .ZN(n769) );
  XOR2D1BWP U1073 ( .A1(n771), .A2(n773), .Z(n772) );
  ND3D1BWP U1074 ( .A1(n788), .A2(n794), .A3(n668), .ZN(
        \main_control/next_select_sig[0] ) );
  IAO21D1BWP U1075 ( .A1(n6), .A2(n921), .B(n873), .ZN(n668) );
  OAI22D1BWP U1076 ( .A1(n521), .A2(n820), .B1(n656), .B2(n651), .ZN(
        Packet_To_Node[2]) );
  OAI22D1BWP U1077 ( .A1(n521), .A2(n810), .B1(n656), .B2(n816), .ZN(
        Packet_To_Node[16]) );
  OAI22D1BWP U1078 ( .A1(n521), .A2(n819), .B1(n656), .B2(n863), .ZN(
        Packet_To_Node[7]) );
  OAI22D1BWP U1079 ( .A1(n521), .A2(n807), .B1(n656), .B2(n810), .ZN(
        Packet_To_Node[19]) );
  OAI22D1BWP U1080 ( .A1(n521), .A2(n840), .B1(n656), .B2(n652), .ZN(
        Packet_To_Node[3]) );
  OAI22D1BWP U1081 ( .A1(n521), .A2(n813), .B1(n656), .B2(n659), .ZN(
        Packet_To_Node[13]) );
  OAI22D1BWP U1082 ( .A1(n521), .A2(n816), .B1(n656), .B2(n860), .ZN(
        Packet_To_Node[10]) );
  OAI22D1BWP U1083 ( .A1(n521), .A2(n818), .B1(n656), .B2(n655), .ZN(
        Packet_To_Node[8]) );
  OAI22D1BWP U1084 ( .A1(n521), .A2(n660), .B1(n656), .B2(n653), .ZN(
        Packet_To_Node[5]) );
  OAI22D1BWP U1085 ( .A1(n521), .A2(n812), .B1(n656), .B2(n660), .ZN(
        Packet_To_Node[14]) );
  OAI22D1BWP U1086 ( .A1(n521), .A2(n809), .B1(n656), .B2(n815), .ZN(
        Packet_To_Node[17]) );
  OAI22D1BWP U1087 ( .A1(n521), .A2(n821), .B1(n656), .B2(n852), .ZN(
        Packet_To_Node[1]) );
  OAI22D1BWP U1088 ( .A1(n521), .A2(n659), .B1(n656), .B2(n861), .ZN(
        Packet_To_Node[4]) );
  OAI22D1BWP U1089 ( .A1(n521), .A2(n815), .B1(n656), .B2(n858), .ZN(
        Packet_To_Node[11]) );
  AO222D1BWP U1090 ( .A1(n790), .A2(buf_to_mux[23]), .B1(
        \enc_logic/checksum[15] ), .B2(n510), .C1(n765), .C2(n507), .Z(n441)
         );
  XNR2D1BWP U1091 ( .A1(n762), .A2(n761), .ZN(n771) );
  AOI21D1BWP U1092 ( .A1(n759), .A2(n757), .B(\enc_logic/checksum[26] ), .ZN(
        n758) );
  XNR2D1BWP U1093 ( .A1(n756), .A2(n755), .ZN(n767) );
  IOA21D1BWP U1094 ( .A1(n759), .A2(n760), .B(n761), .ZN(n755) );
  XNR3D1BWP U1095 ( .A1(n752), .A2(n751), .A3(n753), .ZN(n756) );
  OAI21D1BWP U1096 ( .A1(n742), .A2(n741), .B(n825), .ZN(n744) );
  XNR2D1BWP U1097 ( .A1(n738), .A2(n737), .ZN(n749) );
  ND3D1BWP U1098 ( .A1(n740), .A2(n739), .A3(\enc_logic/checksum[23] ), .ZN(
        n743) );
  XNR3D1BWP U1099 ( .A1(n728), .A2(n727), .A3(n726), .ZN(n735) );
  XNR3D1BWP U1100 ( .A1(n725), .A2(n724), .A3(n723), .ZN(n727) );
  ND3D1BWP U1101 ( .A1(\enc_logic/checksum[6] ), .A2(\enc_logic/checksum[5] ), 
        .A3(\enc_logic/check/N25 ), .ZN(n896) );
  IOA21D1BWP U1102 ( .A1(n703), .A2(n702), .B(n701), .ZN(n704) );
  OAI21D1BWP U1103 ( .A1(n698), .A2(n697), .B(n828), .ZN(n699) );
  XOR3D1BWP U1104 ( .A1(n712), .A2(n711), .A3(n714), .Z(n719) );
  OAI22D1BWP U1105 ( .A1(n693), .A2(n779), .B1(n838), .B2(n778), .ZN(n709) );
  XNR2D1BWP U1106 ( .A1(n692), .A2(n781), .ZN(n710) );
  AOI21D1BWP U1107 ( .A1(n721), .A2(n687), .B(\enc_logic/checksum[18] ), .ZN(
        n689) );
  AOI21D1BWP U1108 ( .A1(n705), .A2(n683), .B(\enc_logic/checksum[16] ), .ZN(
        n684) );
  ND3D1BWP U1109 ( .A1(n679), .A2(n715), .A3(\enc_logic/checksum[14] ), .ZN(
        n694) );
  AOI21D1BWP U1110 ( .A1(n715), .A2(n679), .B(\enc_logic/checksum[14] ), .ZN(
        n680) );
  AOI21D1BWP U1111 ( .A1(n673), .A2(n674), .B(\enc_logic/checksum[12] ), .ZN(
        n676) );
  XNR3D1BWP U1112 ( .A1(\enc_logic/checksum[8] ), .A2(\enc_logic/checksum[9] ), 
        .A3(n693), .ZN(n669) );
  AOI21D1BWP U1113 ( .A1(n875), .A2(n798), .B(n879), .ZN(n792) );
  AOI221D1BWP U1114 ( .A1(\dec_logic/three_six_load[5] ), .A2(n867), .B1(
        \dec_logic/three_six_load[8] ), .B2(n866), .C(n865), .ZN(n868) );
  OAI22D1BWP U1115 ( .A1(\dec_logic/three_six_load[5] ), .A2(n867), .B1(n866), 
        .B2(\dec_logic/three_six_load[8] ), .ZN(n865) );
  OAI22D1BWP U1116 ( .A1(n855), .A2(n856), .B1(n850), .B2(n851), .ZN(n664) );
  NR3D0BWP U1117 ( .A1(n6), .A2(\main_control/state[2] ), .A3(
        \main_control/state[1] ), .ZN(n798) );
  XNR2D1BWP U1118 ( .A1(n640), .A2(n639), .ZN(n645) );
  XNR2D1BWP U1119 ( .A1(n642), .A2(\dec_logic/three_six_load[9] ), .ZN(n639)
         );
  OAI21D1BWP U1120 ( .A1(n640), .A2(n630), .B(n629), .ZN(n635) );
  IAO21D1BWP U1121 ( .A1(n614), .A2(n613), .B(n612), .ZN(n631) );
  XNR3D1BWP U1122 ( .A1(n622), .A2(n621), .A3(n623), .ZN(n616) );
  XNR3D1BWP U1123 ( .A1(n620), .A2(n619), .A3(n618), .ZN(n621) );
  OAI211D1BWP U1124 ( .A1(n598), .A2(n597), .B(n596), .C(n839), .ZN(n620) );
  ND4D1BWP U1125 ( .A1(\dec_logic/checksum/encoder/N25 ), .A2(
        \dec_logic/checksum/check[7] ), .A3(\dec_logic/checksum/check[5] ), 
        .A4(\dec_logic/checksum/check[6] ), .ZN(n839) );
  OAI21D1BWP U1126 ( .A1(n595), .A2(n594), .B(n593), .ZN(n596) );
  OAI21D1BWP U1127 ( .A1(n627), .A2(n642), .B(n628), .ZN(n615) );
  XNR2D1BWP U1128 ( .A1(n585), .A2(n578), .ZN(n612) );
  NR2XD0BWP U1129 ( .A1(n584), .A2(n577), .ZN(n578) );
  XNR2D1BWP U1130 ( .A1(n587), .A2(n588), .ZN(n575) );
  XNR3D1BWP U1131 ( .A1(n590), .A2(n569), .A3(n591), .ZN(n610) );
  XNR3D1BWP U1132 ( .A1(n605), .A2(n568), .A3(n604), .ZN(n591) );
  XOR3D1BWP U1133 ( .A1(n567), .A2(n599), .A3(n602), .Z(n604) );
  XNR3D1BWP U1134 ( .A1(n594), .A2(n593), .A3(n597), .ZN(n602) );
  OAI22D1BWP U1135 ( .A1(n566), .A2(n565), .B1(n660), .B2(n659), .ZN(n593) );
  XNR2D1BWP U1136 ( .A1(n564), .A2(n563), .ZN(n594) );
  OAI22D1BWP U1137 ( .A1(n562), .A2(n650), .B1(n820), .B2(n821), .ZN(n563) );
  OAI21D1BWP U1138 ( .A1(n557), .A2(n614), .B(n805), .ZN(n560) );
  AOI21D1BWP U1139 ( .A1(n570), .A2(n540), .B(\dec_logic/checksum/check[18] ), 
        .ZN(n542) );
  AOI21D1BWP U1140 ( .A1(n590), .A2(n536), .B(\dec_logic/checksum/check[16] ), 
        .ZN(n537) );
  AOI21D1BWP U1141 ( .A1(n605), .A2(n532), .B(\dec_logic/checksum/check[14] ), 
        .ZN(n533) );
  AOI21D1BWP U1142 ( .A1(n600), .A2(n528), .B(\dec_logic/checksum/check[12] ), 
        .ZN(n530) );
  OAI22D1BWP U1143 ( .A1(n521), .A2(n817), .B1(n656), .B2(n857), .ZN(
        Packet_To_Node[9]) );
  OAI22D1BWP U1144 ( .A1(n521), .A2(n811), .B1(n656), .B2(n817), .ZN(
        Packet_To_Node[15]) );
  OAI22D1BWP U1145 ( .A1(n521), .A2(n808), .B1(n656), .B2(n811), .ZN(
        Packet_To_Node[18]) );
  OAI22D1BWP U1146 ( .A1(n521), .A2(n814), .B1(n656), .B2(n840), .ZN(
        Packet_To_Node[12]) );
  IND4D1BWP U1147 ( .A1(n664), .B1(n868), .B2(n663), .B3(n662), .ZN(n665) );
  MUX2ND0BWP U1148 ( .I0(n813), .I1(\dec_logic/checksum/check[17] ), .S(n848), 
        .ZN(n849) );
  MUX2ND0BWP U1149 ( .I0(\dec_logic/checksum/check[18] ), .I1(n812), .S(n849), 
        .ZN(n850) );
  MUX2ND0BWP U1150 ( .I0(n807), .I1(\dec_logic/checksum/check[23] ), .S(n853), 
        .ZN(n854) );
  MUX2ND0BWP U1151 ( .I0(n806), .I1(\dec_logic/checksum/check[24] ), .S(n854), 
        .ZN(n855) );
  MUX2ND0BWP U1152 ( .I0(\dec_logic/three_six_load[4] ), .I1(n861), .S(
        \dec_logic/raw[7] ), .ZN(n862) );
  MUX2ND0BWP U1153 ( .I0(\dec_logic/three_six_load[7] ), .I1(n863), .S(
        \dec_logic/raw[13] ), .ZN(n864) );
  NR4D0BWP U1154 ( .A1(\enc_logic/checksum[5] ), .A2(\enc_logic/checksum[6] ), 
        .A3(\enc_logic/check/N25 ), .A4(n917), .ZN(n885) );
  NR3D0BWP U1155 ( .A1(\enc_logic/checksum[18] ), .A2(\enc_logic/checksum[17] ), .A3(n917), .ZN(n897) );
  NR3D0BWP U1156 ( .A1(\enc_logic/checksum[21] ), .A2(\enc_logic/checksum[20] ), .A3(n917), .ZN(n904) );
  NR3D0BWP U1157 ( .A1(\enc_logic/checksum[24] ), .A2(\enc_logic/checksum[23] ), .A3(n917), .ZN(n909) );
  NR3D0BWP U1158 ( .A1(\enc_logic/checksum[27] ), .A2(\enc_logic/checksum[26] ), .A3(n917), .ZN(n914) );
endmodule

