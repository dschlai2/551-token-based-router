
module transmitter_synthed ( TX_Data, TX_Data_Valid, Clk_S, Rst_n, TX_Ready, S_Data );
  input [54:0] TX_Data;
  input TX_Data_Valid, Clk_S, Rst_n;
  output TX_Ready, S_Data;
  wire   start, ready, \protocol/next_ready , \protocol/next_counter[5] ,
         \protocol/next_counter[4] , \protocol/next_counter[3] ,
         \protocol/next_counter[2] , \protocol/next_counter[1] ,
         \protocol/next_counter[0] , \protocol/next_state[2] ,
         \protocol/next_state[0] , \protocol/next_S_Data , \protocol/state[0] ,
         \protocol/state[2] , \protocol/counter[0] , \protocol/counter[1] ,
         \protocol/counter[2] , \protocol/counter[3] , \protocol/counter[4] ,
         \protocol/counter[5] , n1, n2, n3, n77, n79, n80, n81, n82, n83, n84,
         n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98,
         n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143,
         n144, n145, n146, n147, n148, n149, n150, n151, n152, n153, n154,
         n155, n156, n157, n158, n159, n160, n161, n162, n163, n164, n165,
         n166, n167, n168, n169, n170, n171, n172, n173, n174, n175, n176,
         n177, n178, n179, n180, n181, n182;
  wire   [1:0] state;
  wire   [1:0] next_state;

  DFCNQD1BWP \protocol/ready_reg  ( .D(\protocol/next_ready ), .CP(Clk_S), 
        .CDN(Rst_n), .Q(ready) );
  DFCNQD1BWP \state_reg[1]  ( .D(next_state[1]), .CP(Clk_S), .CDN(Rst_n), .Q(
        state[1]) );
  DFCNQD1BWP \state_reg[0]  ( .D(next_state[0]), .CP(Clk_S), .CDN(Rst_n), .Q(
        state[0]) );
  DFCNQD1BWP TX_Ready_reg ( .D(n77), .CP(Clk_S), .CDN(Rst_n), .Q(TX_Ready) );
  DFCNQD1BWP start_reg ( .D(n3), .CP(Clk_S), .CDN(Rst_n), .Q(start) );
  DFCNQD1BWP \protocol/counter_reg[1]  ( .D(\protocol/next_counter[1] ), .CP(
        Clk_S), .CDN(Rst_n), .Q(\protocol/counter[1] ) );
  DFCNQD1BWP \protocol/state_reg[0]  ( .D(\protocol/next_state[0] ), .CP(Clk_S), .CDN(Rst_n), .Q(\protocol/state[0] ) );
  DFCNQD1BWP \protocol/state_reg[1]  ( .D(n1), .CP(Clk_S), .CDN(Rst_n), .Q(n2)
         );
  DFCNQD1BWP \protocol/counter_reg[3]  ( .D(\protocol/next_counter[3] ), .CP(
        Clk_S), .CDN(Rst_n), .Q(\protocol/counter[3] ) );
  DFCNQD1BWP \protocol/counter_reg[4]  ( .D(\protocol/next_counter[4] ), .CP(
        Clk_S), .CDN(Rst_n), .Q(\protocol/counter[4] ) );
  DFCNQD1BWP \protocol/counter_reg[5]  ( .D(\protocol/next_counter[5] ), .CP(
        Clk_S), .CDN(Rst_n), .Q(\protocol/counter[5] ) );
  DFCNQD1BWP \protocol/S_Data_reg  ( .D(\protocol/next_S_Data ), .CP(Clk_S), 
        .CDN(Rst_n), .Q(S_Data) );
  DFCNQD1BWP \protocol/counter_reg[2]  ( .D(\protocol/next_counter[2] ), .CP(
        Clk_S), .CDN(Rst_n), .Q(\protocol/counter[2] ) );
  DFSNQD4BWP \protocol/counter_reg[0]  ( .D(\protocol/next_counter[0] ), .CP(
        Clk_S), .SDN(Rst_n), .Q(\protocol/counter[0] ) );
  DFSND1BWP \protocol/state_reg[2]  ( .D(\protocol/next_state[2] ), .CP(Clk_S), 
        .SDN(Rst_n), .Q(\protocol/state[2] ), .QN(n170) );
  CKND2BWP U94 ( .I(n94), .ZN(n96) );
  IOA21D1BWP U95 ( .A1(n143), .A2(TX_Data[7]), .B(n134), .ZN(n135) );
  AOI22D1BWP U96 ( .A1(n88), .A2(TX_Data[24]), .B1(n141), .B2(TX_Data[28]), 
        .ZN(n123) );
  AOI22D1BWP U97 ( .A1(n88), .A2(TX_Data[25]), .B1(n141), .B2(TX_Data[29]), 
        .ZN(n127) );
  ND2D1BWP U98 ( .A1(n143), .A2(TX_Data[31]), .ZN(n125) );
  INVD1BWP U99 ( .I(n166), .ZN(n147) );
  INVD1BWP U100 ( .I(\protocol/counter[4] ), .ZN(n171) );
  IND2D1BWP U101 ( .A1(\protocol/state[0] ), .B1(n2), .ZN(n175) );
  OR2XD1BWP U102 ( .A1(n178), .A2(n174), .Z(n89) );
  XNR2D1BWP U103 ( .A1(n102), .A2(\protocol/counter[3] ), .ZN(n166) );
  INVD1BWP U104 ( .I(n175), .ZN(n164) );
  IND2D1BWP U105 ( .A1(n174), .B1(n155), .ZN(n177) );
  ND2D1BWP U106 ( .A1(n164), .A2(\protocol/state[2] ), .ZN(n181) );
  INVD1BWP U107 ( .I(n98), .ZN(n167) );
  OAI21D1BWP U108 ( .A1(n177), .A2(n170), .B(n164), .ZN(n180) );
  CKND2D0BWP U109 ( .A1(TX_Data[43]), .A2(n142), .ZN(n79) );
  AOI222D1BWP U110 ( .A1(n88), .A2(TX_Data[41]), .B1(n143), .B2(TX_Data[47]), 
        .C1(n141), .C2(TX_Data[45]), .ZN(n80) );
  AOI21D0BWP U111 ( .A1(n79), .A2(n80), .B(n144), .ZN(n108) );
  IND2D0BWP U112 ( .A1(\protocol/counter[3] ), .B1(n102), .ZN(n90) );
  AOI22D0BWP U113 ( .A1(n143), .A2(TX_Data[14]), .B1(n142), .B2(TX_Data[10]), 
        .ZN(n81) );
  AOI22D0BWP U114 ( .A1(n88), .A2(TX_Data[8]), .B1(n141), .B2(TX_Data[12]), 
        .ZN(n82) );
  CKND2D0BWP U115 ( .A1(n81), .A2(n82), .ZN(n146) );
  NR4D0BWP U116 ( .A1(\protocol/counter[1] ), .A2(\protocol/counter[2] ), .A3(
        \protocol/counter[3] ), .A4(\protocol/counter[5] ), .ZN(n83) );
  CKND2D0BWP U117 ( .A1(n171), .A2(n83), .ZN(n174) );
  AOI222D1BWP U118 ( .A1(n88), .A2(TX_Data[9]), .B1(n143), .B2(TX_Data[15]), 
        .C1(n141), .C2(TX_Data[13]), .ZN(n84) );
  CKND2D0BWP U119 ( .A1(TX_Data[11]), .A2(n142), .ZN(n85) );
  AOI21D0BWP U120 ( .A1(n85), .A2(n84), .B(n144), .ZN(n145) );
  INR3D0BWP U121 ( .A1(\protocol/state[2] ), .B1(\protocol/state[0] ), .B2(n2), 
        .ZN(n86) );
  MAOI22D0BWP U122 ( .A1(n86), .A2(start), .B1(n174), .B2(n178), .ZN(n176) );
  CKND0BWP U123 ( .I(n156), .ZN(n87) );
  OAI21D0BWP U124 ( .A1(n180), .A2(n87), .B(n176), .ZN(
        \protocol/next_counter[2] ) );
  OA21D2BWP U125 ( .A1(n95), .A2(n102), .B(n98), .Z(n143) );
  NR2D3BWP U126 ( .A1(n98), .A2(n95), .ZN(n88) );
  AOI211D1BWP U127 ( .A1(n159), .A2(n164), .B(n158), .C(n157), .ZN(n160) );
  CKND2D1BWP U128 ( .A1(n142), .A2(TX_Data[42]), .ZN(n104) );
  CKND1BWP U129 ( .I(n177), .ZN(n159) );
  AOI31D1BWP U130 ( .A1(n132), .A2(n179), .A3(n166), .B(n131), .ZN(n133) );
  CKND2D1BWP U131 ( .A1(n140), .A2(n166), .ZN(n150) );
  ND2D1BWP U132 ( .A1(n142), .A2(TX_Data[26]), .ZN(n122) );
  ND2D1BWP U133 ( .A1(n142), .A2(TX_Data[27]), .ZN(n126) );
  CKND1BWP U134 ( .I(n179), .ZN(n154) );
  NR2D1BWP U135 ( .A1(n166), .A2(n165), .ZN(\protocol/next_counter[3] ) );
  NR2D1BWP U136 ( .A1(n177), .A2(n181), .ZN(\protocol/next_state[0] ) );
  CKND1BWP U137 ( .I(n182), .ZN(n3) );
  ND2D1BWP U138 ( .A1(n77), .A2(TX_Data_Valid), .ZN(n182) );
  ND2D1BWP U139 ( .A1(n164), .A2(n170), .ZN(n178) );
  AN2XD1BWP U140 ( .A1(state[0]), .A2(n172), .Z(n77) );
  INVD1BWP U141 ( .I(state[1]), .ZN(n172) );
  CKND1BWP U142 ( .I(\protocol/state[0] ), .ZN(n168) );
  CKND1BWP U143 ( .I(\protocol/counter[2] ), .ZN(n91) );
  CKND2D1BWP U144 ( .A1(\protocol/state[2] ), .A2(start), .ZN(n173) );
  CKND1BWP U145 ( .I(n2), .ZN(n169) );
  NR2D1BWP U146 ( .A1(state[1]), .A2(TX_Data_Valid), .ZN(next_state[0]) );
  ND2D3BWP U147 ( .A1(n94), .A2(n93), .ZN(n98) );
  NR2XD3BWP U148 ( .A1(n98), .A2(n97), .ZN(n141) );
  ND2D8BWP U149 ( .A1(n92), .A2(n97), .ZN(n156) );
  CKND2BWP U150 ( .I(n102), .ZN(n92) );
  NR2D4BWP U151 ( .A1(n94), .A2(\protocol/counter[2] ), .ZN(n102) );
  OR2D4BWP U152 ( .A1(\protocol/counter[1] ), .A2(\protocol/counter[0] ), .Z(
        n94) );
  ND2D1BWP U153 ( .A1(\protocol/counter[1] ), .A2(\protocol/counter[0] ), .ZN(
        n93) );
  AOI211XD0BWP U154 ( .A1(n154), .A2(n153), .B(n152), .C(n151), .ZN(n161) );
  INVD1BWP U155 ( .I(n143), .ZN(n103) );
  ND2D2BWP U156 ( .A1(n147), .A2(n155), .ZN(n144) );
  NR2D4BWP U157 ( .A1(n91), .A2(n96), .ZN(n95) );
  CKND4BWP U158 ( .I(n95), .ZN(n97) );
  NR2XD4BWP U159 ( .A1(n156), .A2(n167), .ZN(n142) );
  CKND0BWP U160 ( .I(n181), .ZN(n163) );
  CKND0BWP U161 ( .I(n162), .ZN(n148) );
  CKND2D0BWP U162 ( .A1(n143), .A2(TX_Data[30]), .ZN(n124) );
  CKND2D0BWP U163 ( .A1(\protocol/counter[3] ), .A2(\protocol/counter[0] ), 
        .ZN(n121) );
  CKND2D0BWP U164 ( .A1(n143), .A2(TX_Data[46]), .ZN(n106) );
  CKND0BWP U165 ( .I(\protocol/counter[0] ), .ZN(n155) );
  XNR2D1BWP U166 ( .A1(n90), .A2(n171), .ZN(n162) );
  OAI31D1BWP U167 ( .A1(state[0]), .A2(ready), .A3(n172), .B(n182), .ZN(
        next_state[1]) );
  AOI22D1BWP U168 ( .A1(n174), .A2(n164), .B1(n163), .B2(\protocol/counter[0] ), .ZN(n165) );
  ND3D1BWP U169 ( .A1(n1), .A2(n181), .A3(n89), .ZN(\protocol/next_state[2] )
         );
  OAI211D1BWP U170 ( .A1(\protocol/counter[0] ), .A2(n175), .B(n1), .C(n89), 
        .ZN(\protocol/next_counter[0] ) );
  AOI21D1BWP U171 ( .A1(n169), .A2(n173), .B(\protocol/state[0] ), .ZN(n1) );
  OAI21D1BWP U172 ( .A1(n180), .A2(n162), .B(n89), .ZN(
        \protocol/next_counter[4] ) );
  OAI21D1BWP U173 ( .A1(n180), .A2(n179), .B(n89), .ZN(
        \protocol/next_counter[5] ) );
  OAI21D1BWP U174 ( .A1(n167), .A2(n180), .B(n176), .ZN(
        \protocol/next_counter[1] ) );
  AOI31D1BWP U175 ( .A1(n156), .A2(n164), .A3(n155), .B(\protocol/state[2] ), 
        .ZN(n157) );
  NR2XD0BWP U176 ( .A1(n168), .A2(n2), .ZN(n158) );
  AOI211XD0BWP U177 ( .A1(n150), .A2(n149), .B(n154), .C(n148), .ZN(n151) );
  AOI31D1BWP U178 ( .A1(n147), .A2(\protocol/counter[0] ), .A3(n146), .B(n145), 
        .ZN(n149) );
  MUX2ND0BWP U179 ( .I0(n139), .I1(n138), .S(\protocol/counter[0] ), .ZN(n140)
         );
  IOA21D1BWP U180 ( .A1(n143), .A2(TX_Data[6]), .B(n136), .ZN(n137) );
  AOI22D1BWP U181 ( .A1(n88), .A2(TX_Data[0]), .B1(n141), .B2(TX_Data[4]), 
        .ZN(n136) );
  AOI22D1BWP U182 ( .A1(n88), .A2(TX_Data[1]), .B1(n141), .B2(TX_Data[5]), 
        .ZN(n134) );
  NR2XD0BWP U183 ( .A1(n162), .A2(n133), .ZN(n152) );
  AO211D1BWP U184 ( .A1(n130), .A2(TX_Data[23]), .B(n129), .C(n128), .Z(n131)
         );
  AOI31D1BWP U185 ( .A1(n127), .A2(n126), .A3(n125), .B(n144), .ZN(n128) );
  AOI31D1BWP U186 ( .A1(n124), .A2(n123), .A3(n122), .B(n121), .ZN(n129) );
  AOI22D1BWP U187 ( .A1(n88), .A2(TX_Data[16]), .B1(n141), .B2(TX_Data[20]), 
        .ZN(n117) );
  OAI211D1BWP U188 ( .A1(n162), .A2(n116), .B(n115), .C(n114), .ZN(n153) );
  ND3D1BWP U189 ( .A1(n113), .A2(n166), .A3(n162), .ZN(n114) );
  MUX2ND0BWP U190 ( .I0(n112), .I1(n111), .S(\protocol/counter[0] ), .ZN(n113)
         );
  AOI22D1BWP U191 ( .A1(n88), .A2(TX_Data[32]), .B1(n141), .B2(TX_Data[36]), 
        .ZN(n109) );
  AOI211XD0BWP U192 ( .A1(n130), .A2(TX_Data[39]), .B(n108), .C(n107), .ZN(
        n115) );
  AOI31D1BWP U193 ( .A1(n106), .A2(n105), .A3(n104), .B(n121), .ZN(n107) );
  AOI22D1BWP U194 ( .A1(n88), .A2(TX_Data[40]), .B1(n141), .B2(TX_Data[44]), 
        .ZN(n105) );
  NR3D0BWP U195 ( .A1(n147), .A2(\protocol/counter[0] ), .A3(n103), .ZN(n130)
         );
  AOI21D1BWP U196 ( .A1(n143), .A2(TX_Data[54]), .B(n101), .ZN(n116) );
  MUX2ND0BWP U197 ( .I0(n100), .I1(n99), .S(\protocol/counter[0] ), .ZN(n101)
         );
  AOI222D1BWP U198 ( .A1(n156), .A2(TX_Data[53]), .B1(TX_Data[49]), .B2(n88), 
        .C1(n96), .C2(TX_Data[51]), .ZN(n100) );
  OAI21D1BWP U199 ( .A1(n90), .A2(\protocol/counter[4] ), .B(
        \protocol/counter[5] ), .ZN(n179) );
  MUX2ND0BWP U200 ( .I0(n120), .I1(n119), .S(\protocol/counter[0] ), .ZN(n132)
         );
  OAI21D1BWP U201 ( .A1(n161), .A2(n181), .B(n160), .ZN(\protocol/next_S_Data ) );
  AOI21D1BWP U202 ( .A1(n142), .A2(TX_Data[3]), .B(n135), .ZN(n139) );
  AOI21D1BWP U203 ( .A1(n142), .A2(TX_Data[2]), .B(n137), .ZN(n138) );
  IOA21D1BWP U204 ( .A1(n142), .A2(TX_Data[18]), .B(n117), .ZN(n118) );
  IOA21D1BWP U205 ( .A1(n142), .A2(TX_Data[34]), .B(n109), .ZN(n110) );
  AOI222D1BWP U206 ( .A1(n142), .A2(TX_Data[19]), .B1(n88), .B2(TX_Data[17]), 
        .C1(n141), .C2(TX_Data[21]), .ZN(n120) );
  AOI222D1BWP U207 ( .A1(n142), .A2(TX_Data[35]), .B1(n88), .B2(TX_Data[33]), 
        .C1(n141), .C2(TX_Data[37]), .ZN(n112) );
  AOI222D1BWP U208 ( .A1(n142), .A2(TX_Data[50]), .B1(n88), .B2(TX_Data[48]), 
        .C1(n141), .C2(TX_Data[52]), .ZN(n99) );
  AOI21D1BWP U209 ( .A1(n143), .A2(TX_Data[38]), .B(n110), .ZN(n111) );
  AOI21D1BWP U210 ( .A1(n143), .A2(TX_Data[22]), .B(n118), .ZN(n119) );
  NR3D0BWP U211 ( .A1(n170), .A2(n168), .A3(n169), .ZN(\protocol/next_ready )
         );
endmodule

