
module transmitter ( TX_Data, TX_Data_Valid, Clk_S, Rst_n, TX_Ready, S_Data );
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
         n166, n167, n168, n169, n170, n171, n172;
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
  DFCNQD1BWP \protocol/counter_reg[2]  ( .D(\protocol/next_counter[2] ), .CP(
        Clk_S), .CDN(Rst_n), .Q(\protocol/counter[2] ) );
  DFCNQD1BWP \protocol/counter_reg[4]  ( .D(\protocol/next_counter[4] ), .CP(
        Clk_S), .CDN(Rst_n), .Q(\protocol/counter[4] ) );
  DFCNQD1BWP \protocol/counter_reg[5]  ( .D(\protocol/next_counter[5] ), .CP(
        Clk_S), .CDN(Rst_n), .Q(\protocol/counter[5] ) );
  DFCNQD1BWP \protocol/S_Data_reg  ( .D(\protocol/next_S_Data ), .CP(Clk_S), 
        .CDN(Rst_n), .Q(S_Data) );
  DFSND1BWP \protocol/state_reg[2]  ( .D(\protocol/next_state[2] ), .CP(Clk_S), 
        .SDN(Rst_n), .Q(\protocol/state[2] ), .QN(n169) );
  DFSND1BWP \protocol/counter_reg[0]  ( .D(\protocol/next_counter[0] ), .CP(
        Clk_S), .SDN(Rst_n), .Q(\protocol/counter[0] ), .QN(n145) );
  INR2D2BWP U94 ( .A1(n154), .B1(n91), .ZN(n127) );
  INR2D1BWP U95 ( .A1(\protocol/counter[2] ), .B1(n112), .ZN(n91) );
  INR2D1BWP U96 ( .A1(n112), .B1(\protocol/counter[2] ), .ZN(n89) );
  MUX2ND0BWP U97 ( .I0(\protocol/counter[4] ), .I1(n144), .S(n104), .ZN(n163)
         );
  MUX2ND0BWP U98 ( .I0(\protocol/counter[3] ), .I1(n90), .S(n89), .ZN(n162) );
  IND2D1BWP U99 ( .A1(n150), .B1(n169), .ZN(n160) );
  AO21D1BWP U100 ( .A1(\protocol/state[2] ), .A2(n151), .B(n150), .Z(n166) );
  INVD1BWP U101 ( .I(\protocol/state[0] ), .ZN(n168) );
  CKND0BWP U102 ( .I(n163), .ZN(n79) );
  CKND0BWP U103 ( .I(n114), .ZN(n80) );
  OAI22D0BWP U104 ( .A1(n145), .A2(n115), .B1(\protocol/counter[0] ), .B2(n116), .ZN(n81) );
  AOI211D0BWP U105 ( .A1(n110), .A2(n111), .B(n109), .C(n130), .ZN(n82) );
  OAI32D0BWP U106 ( .A1(n79), .A2(n80), .A3(n81), .B1(n163), .B2(n82), .ZN(
        n117) );
  AN3D0BWP U107 ( .A1(n126), .A2(n162), .A3(n145), .Z(n135) );
  OA21D0BWP U108 ( .A1(n104), .A2(\protocol/counter[4] ), .B(
        \protocol/counter[5] ), .Z(n122) );
  AOI22D0BWP U109 ( .A1(n87), .A2(TX_Data[43]), .B1(TX_Data[45]), .B2(n136), 
        .ZN(n83) );
  AOI22D0BWP U110 ( .A1(TX_Data[47]), .A2(n126), .B1(TX_Data[41]), .B2(n127), 
        .ZN(n84) );
  AOI32D0BWP U111 ( .A1(n83), .A2(n117), .A3(n84), .B1(n137), .B2(n117), .ZN(
        n118) );
  NR4D0BWP U112 ( .A1(\protocol/counter[1] ), .A2(\protocol/counter[2] ), .A3(
        \protocol/counter[3] ), .A4(\protocol/counter[5] ), .ZN(n85) );
  CKND2D0BWP U113 ( .A1(n144), .A2(n85), .ZN(n149) );
  CKND2D0BWP U114 ( .A1(\protocol/state[2] ), .A2(start), .ZN(n86) );
  AOI21D0BWP U115 ( .A1(n86), .A2(n167), .B(\protocol/state[0] ), .ZN(n1) );
  NR2XD1BWP U116 ( .A1(n113), .A2(n154), .ZN(n87) );
  AOI211D1BWP U117 ( .A1(n135), .A2(TX_Data[39]), .B(n119), .C(n118), .ZN(n120) );
  AOI32D0BWP U118 ( .A1(n96), .A2(n130), .A3(n95), .B1(n162), .B2(n94), .ZN(
        n103) );
  AOI211D0BWP U119 ( .A1(TX_Data[20]), .A2(n136), .B(n145), .C(n129), .ZN(n131) );
  AOI211D0BWP U120 ( .A1(TX_Data[36]), .A2(n136), .B(n145), .C(n108), .ZN(n109) );
  AN2XD1BWP U121 ( .A1(n93), .A2(n92), .Z(n94) );
  AOI22D0BWP U122 ( .A1(n136), .A2(TX_Data[4]), .B1(n87), .B2(TX_Data[2]), 
        .ZN(n92) );
  AOI21D0BWP U123 ( .A1(n87), .A2(TX_Data[35]), .B(\protocol/counter[0] ), 
        .ZN(n110) );
  AOI22D0BWP U124 ( .A1(n136), .A2(TX_Data[12]), .B1(n87), .B2(TX_Data[10]), 
        .ZN(n95) );
  AOI21D0BWP U125 ( .A1(n87), .A2(TX_Data[19]), .B(\protocol/counter[0] ), 
        .ZN(n132) );
  INVD1BWP U126 ( .I(n122), .ZN(n165) );
  CKND1BWP U127 ( .I(n157), .ZN(n151) );
  INVD1BWP U128 ( .I(n163), .ZN(n164) );
  NR2D1BWP U129 ( .A1(n157), .A2(n171), .ZN(\protocol/next_state[0] ) );
  AOI22D0BWP U130 ( .A1(n127), .A2(TX_Data[8]), .B1(n126), .B2(TX_Data[14]), 
        .ZN(n96) );
  CKND2D1BWP U131 ( .A1(n126), .A2(TX_Data[54]), .ZN(n114) );
  AOI222D0BWP U132 ( .A1(n113), .A2(TX_Data[53]), .B1(TX_Data[49]), .B2(n127), 
        .C1(n112), .C2(TX_Data[51]), .ZN(n116) );
  AOI22D0BWP U133 ( .A1(n127), .A2(TX_Data[1]), .B1(n126), .B2(TX_Data[7]), 
        .ZN(n98) );
  ND2D1BWP U134 ( .A1(n145), .A2(n130), .ZN(n137) );
  AOI22D0BWP U135 ( .A1(n127), .A2(TX_Data[16]), .B1(n126), .B2(TX_Data[22]), 
        .ZN(n128) );
  AOI22D0BWP U136 ( .A1(n127), .A2(TX_Data[0]), .B1(n126), .B2(TX_Data[6]), 
        .ZN(n93) );
  INVD1BWP U137 ( .I(n152), .ZN(n170) );
  ND2D0BWP U138 ( .A1(n158), .A2(n157), .ZN(n159) );
  INVD1BWP U139 ( .I(n158), .ZN(n171) );
  CKND1BWP U140 ( .I(n172), .ZN(n3) );
  AOI22D0BWP U141 ( .A1(n136), .A2(TX_Data[37]), .B1(n127), .B2(TX_Data[33]), 
        .ZN(n111) );
  INVD1BWP U142 ( .I(n162), .ZN(n130) );
  ND2D1BWP U143 ( .A1(n161), .A2(n145), .ZN(n157) );
  NR2D1BWP U144 ( .A1(n160), .A2(n149), .ZN(n152) );
  AOI22D0BWP U145 ( .A1(n136), .A2(TX_Data[21]), .B1(n127), .B2(TX_Data[17]), 
        .ZN(n133) );
  NR2D2BWP U146 ( .A1(n154), .A2(n156), .ZN(n126) );
  ND2D1BWP U147 ( .A1(n89), .A2(n90), .ZN(n104) );
  NR2D1BWP U148 ( .A1(n89), .A2(n91), .ZN(n156) );
  CKND1BWP U149 ( .I(n149), .ZN(n161) );
  ND2D1BWP U150 ( .A1(n77), .A2(TX_Data_Valid), .ZN(n172) );
  NR2D1BWP U151 ( .A1(n169), .A2(n150), .ZN(n158) );
  AN2D1BWP U152 ( .A1(n91), .A2(n154), .Z(n136) );
  AN2XD1BWP U153 ( .A1(state[0]), .A2(n88), .Z(n77) );
  ND2D1BWP U154 ( .A1(n2), .A2(n168), .ZN(n150) );
  INVD1BWP U155 ( .I(n2), .ZN(n167) );
  INVD1BWP U156 ( .I(state[1]), .ZN(n88) );
  NR2D0BWP U157 ( .A1(\protocol/state[0] ), .A2(n2), .ZN(n153) );
  NR2D1BWP U158 ( .A1(\protocol/counter[1] ), .A2(\protocol/counter[0] ), .ZN(
        n112) );
  INVD1BWP U159 ( .I(\protocol/counter[4] ), .ZN(n144) );
  NR2D1BWP U160 ( .A1(state[1]), .A2(TX_Data_Valid), .ZN(next_state[0]) );
  INVD1BWP U161 ( .I(\protocol/counter[3] ), .ZN(n90) );
  ND2D0BWP U162 ( .A1(\protocol/counter[3] ), .A2(\protocol/counter[0] ), .ZN(
        n123) );
  CKND0BWP U163 ( .I(n156), .ZN(n113) );
  OAI31D1BWP U164 ( .A1(state[0]), .A2(ready), .A3(n88), .B(n172), .ZN(
        next_state[1]) );
  ND3D1BWP U165 ( .A1(n1), .A2(n171), .A3(n170), .ZN(\protocol/next_state[2] )
         );
  OAI211D1BWP U166 ( .A1(\protocol/counter[0] ), .A2(n150), .B(n1), .C(n170), 
        .ZN(\protocol/next_counter[0] ) );
  OAI21D1BWP U167 ( .A1(n154), .A2(n166), .B(n155), .ZN(
        \protocol/next_counter[1] ) );
  OAI21D1BWP U168 ( .A1(n156), .A2(n166), .B(n155), .ZN(
        \protocol/next_counter[2] ) );
  AOI31D1BWP U169 ( .A1(n153), .A2(\protocol/state[2] ), .A3(start), .B(n152), 
        .ZN(n155) );
  OAI32D1BWP U170 ( .A1(n162), .A2(n161), .A3(n160), .B1(n159), .B2(n162), 
        .ZN(\protocol/next_counter[3] ) );
  OAI21D1BWP U171 ( .A1(n166), .A2(n165), .B(n170), .ZN(
        \protocol/next_counter[5] ) );
  OAI21D1BWP U172 ( .A1(n164), .A2(n166), .B(n170), .ZN(
        \protocol/next_counter[4] ) );
  OAI211D1BWP U173 ( .A1(n148), .A2(n171), .B(n147), .C(n146), .ZN(
        \protocol/next_S_Data ) );
  OAI31D1BWP U174 ( .A1(\protocol/counter[0] ), .A2(n156), .A3(n150), .B(n169), 
        .ZN(n146) );
  AOI32D1BWP U175 ( .A1(n2), .A2(n168), .A3(n151), .B1(n167), .B2(
        \protocol/state[0] ), .ZN(n147) );
  OAI32D1BWP U176 ( .A1(n143), .A2(n142), .A3(n141), .B1(n163), .B2(n143), 
        .ZN(n148) );
  AOI32D1BWP U177 ( .A1(n140), .A2(n139), .A3(n138), .B1(n137), .B2(n139), 
        .ZN(n141) );
  AOI22D1BWP U178 ( .A1(n136), .A2(TX_Data[29]), .B1(n87), .B2(TX_Data[27]), 
        .ZN(n138) );
  AOI22D1BWP U179 ( .A1(TX_Data[23]), .A2(n135), .B1(n134), .B2(n165), .ZN(
        n139) );
  AOI211XD0BWP U180 ( .A1(n133), .A2(n132), .B(n131), .C(n130), .ZN(n134) );
  IOA21D1BWP U181 ( .A1(n87), .A2(TX_Data[18]), .B(n128), .ZN(n129) );
  AOI22D1BWP U182 ( .A1(n127), .A2(TX_Data[25]), .B1(n126), .B2(TX_Data[31]), 
        .ZN(n140) );
  AOI21D1BWP U183 ( .A1(n125), .A2(n124), .B(n123), .ZN(n142) );
  AOI22D1BWP U184 ( .A1(n136), .A2(TX_Data[28]), .B1(n87), .B2(TX_Data[26]), 
        .ZN(n124) );
  AOI22D1BWP U185 ( .A1(n127), .A2(TX_Data[24]), .B1(n126), .B2(TX_Data[30]), 
        .ZN(n125) );
  OAI32D1BWP U186 ( .A1(n122), .A2(n121), .A3(n163), .B1(n120), .B2(n165), 
        .ZN(n143) );
  AOI222D1BWP U187 ( .A1(n136), .A2(TX_Data[52]), .B1(n87), .B2(TX_Data[50]), 
        .C1(n127), .C2(TX_Data[48]), .ZN(n115) );
  IOA21D1BWP U188 ( .A1(n87), .A2(TX_Data[34]), .B(n107), .ZN(n108) );
  AOI22D1BWP U189 ( .A1(n127), .A2(TX_Data[32]), .B1(n126), .B2(TX_Data[38]), 
        .ZN(n107) );
  AOI21D1BWP U190 ( .A1(n106), .A2(n105), .B(n123), .ZN(n119) );
  AOI22D1BWP U191 ( .A1(n136), .A2(TX_Data[44]), .B1(n87), .B2(TX_Data[42]), 
        .ZN(n105) );
  AOI22D1BWP U192 ( .A1(n127), .A2(TX_Data[40]), .B1(n126), .B2(TX_Data[46]), 
        .ZN(n106) );
  AOI211XD0BWP U193 ( .A1(\protocol/counter[0] ), .A2(n103), .B(n102), .C(n101), .ZN(n121) );
  AOI21D1BWP U194 ( .A1(n100), .A2(n99), .B(n137), .ZN(n101) );
  AOI22D1BWP U195 ( .A1(n136), .A2(TX_Data[13]), .B1(n87), .B2(TX_Data[11]), 
        .ZN(n99) );
  AOI22D1BWP U196 ( .A1(n127), .A2(TX_Data[9]), .B1(n126), .B2(TX_Data[15]), 
        .ZN(n100) );
  AOI211XD0BWP U197 ( .A1(n98), .A2(n97), .B(\protocol/counter[0] ), .C(n130), 
        .ZN(n102) );
  AOI22D1BWP U198 ( .A1(n136), .A2(TX_Data[5]), .B1(n87), .B2(TX_Data[3]), 
        .ZN(n97) );
  AOI21D1BWP U199 ( .A1(\protocol/counter[0] ), .A2(\protocol/counter[1] ), 
        .B(n112), .ZN(n154) );
  NR3D0BWP U200 ( .A1(n169), .A2(n168), .A3(n167), .ZN(\protocol/next_ready )
         );
endmodule

