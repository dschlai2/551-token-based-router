
module transmitter ( TX_Data, TX_Data_Valid, Clk_S, Rst_n, TX_Ready, S_Data );
  input [54:0] TX_Data;
  input TX_Data_Valid, Clk_S, Rst_n;
  output TX_Ready, S_Data;
  wire   ready, \protocol/next_ready , \protocol/next_counter[5] ,
         \protocol/next_counter[4] , \protocol/next_counter[3] ,
         \protocol/next_counter[2] , \protocol/next_counter[1] ,
         \protocol/next_state[0] , \protocol/next_S_Data , \protocol/state[0] ,
         \protocol/state[1] , \protocol/counter[1] , \protocol/counter[2] ,
         \protocol/counter[3] , \protocol/counter[4] , \protocol/counter[5] ,
         n1, n2, n3, n4, n5, n6, n135, n136, n138, n139, n140, n141, n142,
         n143, n144, n145, n146, n147, n148, n149, n150, n151, n152, n153,
         n154, n155, n156, n157, n158, n159, n160, n161, n162, n163, n164,
         n165, n166, n167, n168, n169, n170, n171, n172, n173, n174, n175,
         n176, n177, n178, n179, n180, n181, n182, n183, n184, n185, n186,
         n187, n188, n189, n190, n191, n192, n193, n194, n195, n196, n197,
         n198, n199, n200, n201, n202, n203, n204, n205, n206, n207, n208,
         n209, n210, n211, n212, n213, n214, n215, n216, n217, n218, n219,
         n220, n221, n222, n223, n224, n225, n226, n227;
  wire   [1:0] state;
  wire   [1:0] next_state;

  DFCNQD1BWP \protocol/ready_reg  ( .D(\protocol/next_ready ), .CP(Clk_S), 
        .CDN(Rst_n), .Q(ready) );
  DFCNQD1BWP \state_reg[1]  ( .D(next_state[1]), .CP(Clk_S), .CDN(Rst_n), .Q(
        state[1]) );
  DFCNQD1BWP \state_reg[0]  ( .D(next_state[0]), .CP(Clk_S), .CDN(Rst_n), .Q(
        state[0]) );
  DFCNQD1BWP TX_Ready_reg ( .D(n136), .CP(Clk_S), .CDN(Rst_n), .Q(TX_Ready) );
  DFSNQD1BWP start_reg ( .D(n135), .CP(Clk_S), .SDN(Rst_n), .Q(n5) );
  DFSNQD1BWP \protocol/state_reg[1]  ( .D(n6), .CP(Clk_S), .SDN(Rst_n), .Q(
        \protocol/state[1] ) );
  DFCNQD1BWP \protocol/counter_reg[1]  ( .D(\protocol/next_counter[1] ), .CP(
        Clk_S), .CDN(Rst_n), .Q(\protocol/counter[1] ) );
  DFCNQD1BWP \protocol/state_reg[0]  ( .D(\protocol/next_state[0] ), .CP(Clk_S), .CDN(Rst_n), .Q(\protocol/state[0] ) );
  DFCNQD1BWP \protocol/state_reg[2]  ( .D(n3), .CP(Clk_S), .CDN(Rst_n), .Q(n4)
         );
  DFCNQD1BWP \protocol/counter_reg[2]  ( .D(\protocol/next_counter[2] ), .CP(
        Clk_S), .CDN(Rst_n), .Q(\protocol/counter[2] ) );
  DFCNQD1BWP \protocol/counter_reg[4]  ( .D(\protocol/next_counter[4] ), .CP(
        Clk_S), .CDN(Rst_n), .Q(\protocol/counter[4] ) );
  DFCNQD1BWP \protocol/counter_reg[5]  ( .D(\protocol/next_counter[5] ), .CP(
        Clk_S), .CDN(Rst_n), .Q(\protocol/counter[5] ) );
  DFCNQD1BWP \protocol/counter_reg[3]  ( .D(\protocol/next_counter[3] ), .CP(
        Clk_S), .CDN(Rst_n), .Q(\protocol/counter[3] ) );
  DFCNQD1BWP \protocol/S_Data_reg  ( .D(\protocol/next_S_Data ), .CP(Clk_S), 
        .CDN(Rst_n), .Q(S_Data) );
  DFCNQD4BWP \protocol/counter_reg[0]  ( .D(n1), .CP(Clk_S), .CDN(Rst_n), .Q(
        n2) );
  NR2XD1BWP U152 ( .A1(n148), .A2(\protocol/counter[2] ), .ZN(n145) );
  XNR2D1BWP U153 ( .A1(n155), .A2(\protocol/counter[4] ), .ZN(n202) );
  XOR2D1BWP U154 ( .A1(\protocol/counter[1] ), .A2(n2), .Z(n146) );
  INVD1BWP U155 ( .I(n221), .ZN(n226) );
  CKND0BWP U156 ( .I(n207), .ZN(n138) );
  AO211D0BWP U157 ( .A1(TX_Data[0]), .A2(n138), .B(n215), .C(n227), .Z(n208)
         );
  IOA21D1BWP U158 ( .A1(n154), .A2(\protocol/counter[3] ), .B(n155), .ZN(n212)
         );
  IND2D0BWP U159 ( .A1(n155), .B1(n220), .ZN(n207) );
  INR3D0BWP U160 ( .A1(n193), .B1(n212), .B2(n160), .ZN(n179) );
  INR4D0BWP U161 ( .A1(n220), .B1(\protocol/counter[1] ), .B2(
        \protocol/counter[2] ), .B3(\protocol/counter[3] ), .ZN(n213) );
  IND2D0BWP U162 ( .A1(n4), .B1(n218), .ZN(n225) );
  AN3D0BWP U163 ( .A1(n139), .A2(n212), .A3(n218), .Z(
        \protocol/next_counter[3] ) );
  CKND0BWP U164 ( .I(n213), .ZN(n139) );
  NR2D1BWP U165 ( .A1(n207), .A2(n225), .ZN(\protocol/next_state[0] ) );
  INVD4BWP U166 ( .I(n150), .ZN(n215) );
  CKND2D1BWP U167 ( .A1(n160), .A2(\protocol/counter[3] ), .ZN(n196) );
  NR2D1BWP U168 ( .A1(n218), .A2(n224), .ZN(n6) );
  NR2D1BWP U169 ( .A1(\protocol/counter[5] ), .A2(\protocol/counter[4] ), .ZN(
        n220) );
  NR2D1BWP U170 ( .A1(\protocol/state[1] ), .A2(\protocol/state[0] ), .ZN(n218) );
  NR2D1BWP U171 ( .A1(state[1]), .A2(TX_Data_Valid), .ZN(next_state[0]) );
  OAI31D1BWP U172 ( .A1(n202), .A2(n212), .A3(n166), .B(n165), .ZN(n167) );
  CKND6BWP U173 ( .I(n142), .ZN(n195) );
  IND2D2BWP U174 ( .A1(n147), .B1(n217), .ZN(n142) );
  OAI211D2BWP U175 ( .A1(n225), .A2(n211), .B(n210), .C(n209), .ZN(
        \protocol/next_S_Data ) );
  NR2XD3BWP U176 ( .A1(n217), .A2(n215), .ZN(n193) );
  CKND4BWP U177 ( .I(n146), .ZN(n217) );
  NR2XD3BWP U178 ( .A1(n150), .A2(n217), .ZN(n192) );
  ND2D3BWP U179 ( .A1(n154), .A2(n147), .ZN(n150) );
  CKBD8BWP U180 ( .I(n194), .Z(n143) );
  IND2D4BWP U181 ( .A1(\protocol/counter[1] ), .B1(n2), .ZN(n148) );
  ND2D1BWP U182 ( .A1(n136), .A2(TX_Data_Valid), .ZN(n135) );
  AN2XD1BWP U183 ( .A1(state[0]), .A2(n219), .Z(n136) );
  INVD1BWP U184 ( .I(state[1]), .ZN(n219) );
  ND2D1BWP U185 ( .A1(n207), .A2(n218), .ZN(n222) );
  ND2D1BWP U186 ( .A1(n208), .A2(n4), .ZN(n209) );
  ND2D1BWP U187 ( .A1(n218), .A2(n2), .ZN(n227) );
  INVD1BWP U188 ( .I(n202), .ZN(n214) );
  ND2D1BWP U189 ( .A1(n186), .A2(n185), .ZN(n187) );
  ND2D1BWP U190 ( .A1(n184), .A2(n183), .ZN(n188) );
  ND2D1BWP U191 ( .A1(n182), .A2(n202), .ZN(n205) );
  ND2D1BWP U192 ( .A1(n170), .A2(n169), .ZN(n172) );
  ND2D1BWP U193 ( .A1(n212), .A2(n2), .ZN(n189) );
  INVD1BWP U194 ( .I(n2), .ZN(n160) );
  AN2XD1BWP U195 ( .A1(n157), .A2(n156), .Z(n141) );
  INVD1BWP U196 ( .I(n148), .ZN(n149) );
  ND2D1BWP U197 ( .A1(n148), .A2(\protocol/counter[2] ), .ZN(n147) );
  INVD1BWP U198 ( .I(n145), .ZN(n154) );
  ND2D1BWP U199 ( .A1(n145), .A2(n144), .ZN(n155) );
  INVD1BWP U200 ( .I(\protocol/counter[3] ), .ZN(n144) );
  OAI31D1BWP U201 ( .A1(ready), .A2(state[0]), .A3(n219), .B(n135), .ZN(
        next_state[1]) );
  OAI21D1BWP U202 ( .A1(n214), .A2(n222), .B(n221), .ZN(
        \protocol/next_counter[4] ) );
  OAI21D1BWP U203 ( .A1(n223), .A2(n222), .B(n221), .ZN(
        \protocol/next_counter[5] ) );
  OAI21D1BWP U204 ( .A1(n215), .A2(n222), .B(n216), .ZN(
        \protocol/next_counter[2] ) );
  OAI21D1BWP U205 ( .A1(n217), .A2(n222), .B(n216), .ZN(
        \protocol/next_counter[1] ) );
  AOI21D1BWP U206 ( .A1(n224), .A2(\protocol/state[1] ), .B(n226), .ZN(n216)
         );
  ND3D1BWP U207 ( .A1(n218), .A2(n213), .A3(n4), .ZN(n221) );
  AOI21D1BWP U208 ( .A1(\protocol/state[0] ), .A2(\protocol/state[1] ), .B(
        \protocol/next_state[0] ), .ZN(n210) );
  OA211D1BWP U209 ( .A1(n223), .A2(n206), .B(n205), .C(n204), .Z(n211) );
  ND3D1BWP U210 ( .A1(n203), .A2(n223), .A3(n214), .ZN(n204) );
  OAI211D1BWP U211 ( .A1(n212), .A2(n201), .B(n200), .C(n199), .ZN(n203) );
  AO21D1BWP U212 ( .A1(n198), .A2(n197), .B(n196), .Z(n199) );
  AOI22D1BWP U213 ( .A1(n195), .A2(TX_Data[12]), .B1(n143), .B2(TX_Data[8]), 
        .ZN(n197) );
  AOI22D1BWP U214 ( .A1(n193), .A2(TX_Data[14]), .B1(n192), .B2(TX_Data[10]), 
        .ZN(n198) );
  AO21D1BWP U215 ( .A1(n191), .A2(n190), .B(n189), .Z(n200) );
  AOI22D1BWP U216 ( .A1(n195), .A2(TX_Data[13]), .B1(n143), .B2(TX_Data[9]), 
        .ZN(n190) );
  AOI22D1BWP U217 ( .A1(n193), .A2(TX_Data[15]), .B1(n192), .B2(TX_Data[11]), 
        .ZN(n191) );
  MUX2ND0BWP U218 ( .I0(n188), .I1(n187), .S(n2), .ZN(n201) );
  AOI22D1BWP U219 ( .A1(n195), .A2(TX_Data[5]), .B1(n143), .B2(TX_Data[1]), 
        .ZN(n185) );
  AOI22D1BWP U220 ( .A1(n193), .A2(TX_Data[7]), .B1(n192), .B2(TX_Data[3]), 
        .ZN(n186) );
  AOI22D1BWP U221 ( .A1(n195), .A2(TX_Data[4]), .B1(n143), .B2(TX_Data[0]), 
        .ZN(n183) );
  AOI22D1BWP U222 ( .A1(n193), .A2(TX_Data[6]), .B1(n192), .B2(TX_Data[2]), 
        .ZN(n184) );
  AOI211XD0BWP U223 ( .A1(n179), .A2(TX_Data[23]), .B(n178), .C(n177), .ZN(
        n180) );
  AOI21D1BWP U224 ( .A1(n176), .A2(n175), .B(n189), .ZN(n177) );
  AOI22D1BWP U225 ( .A1(n195), .A2(TX_Data[29]), .B1(n143), .B2(TX_Data[25]), 
        .ZN(n175) );
  AOI22D1BWP U226 ( .A1(n193), .A2(TX_Data[31]), .B1(n192), .B2(TX_Data[27]), 
        .ZN(n176) );
  AOI21D1BWP U227 ( .A1(n174), .A2(n173), .B(n196), .ZN(n178) );
  AOI22D1BWP U228 ( .A1(n195), .A2(TX_Data[28]), .B1(n143), .B2(TX_Data[24]), 
        .ZN(n173) );
  AOI22D1BWP U229 ( .A1(n193), .A2(TX_Data[30]), .B1(n192), .B2(TX_Data[26]), 
        .ZN(n174) );
  AOI22D1BWP U230 ( .A1(n195), .A2(TX_Data[20]), .B1(n143), .B2(TX_Data[16]), 
        .ZN(n169) );
  AOI22D1BWP U231 ( .A1(n193), .A2(TX_Data[22]), .B1(n192), .B2(TX_Data[18]), 
        .ZN(n170) );
  AOI21D1BWP U232 ( .A1(n168), .A2(n202), .B(n167), .ZN(n206) );
  AOI211XD0BWP U233 ( .A1(n179), .A2(TX_Data[39]), .B(n164), .C(n163), .ZN(
        n165) );
  AOI21D1BWP U234 ( .A1(n162), .A2(n161), .B(n196), .ZN(n163) );
  AOI22D1BWP U235 ( .A1(n195), .A2(TX_Data[44]), .B1(n143), .B2(TX_Data[40]), 
        .ZN(n161) );
  AOI21D1BWP U236 ( .A1(n159), .A2(n158), .B(n189), .ZN(n164) );
  AOI22D1BWP U237 ( .A1(n195), .A2(TX_Data[45]), .B1(n143), .B2(TX_Data[41]), 
        .ZN(n158) );
  AOI22D1BWP U238 ( .A1(n193), .A2(TX_Data[47]), .B1(n192), .B2(TX_Data[43]), 
        .ZN(n159) );
  AOI22D1BWP U239 ( .A1(n195), .A2(TX_Data[36]), .B1(n143), .B2(TX_Data[32]), 
        .ZN(n156) );
  AOI22D1BWP U240 ( .A1(n193), .A2(TX_Data[38]), .B1(n192), .B2(TX_Data[34]), 
        .ZN(n157) );
  AOI222D1BWP U241 ( .A1(n143), .A2(TX_Data[33]), .B1(n192), .B2(TX_Data[35]), 
        .C1(TX_Data[37]), .C2(n195), .ZN(n140) );
  AO21D1BWP U242 ( .A1(n193), .A2(TX_Data[54]), .B(n153), .Z(n168) );
  AOI222D1BWP U243 ( .A1(n195), .A2(TX_Data[52]), .B1(n192), .B2(TX_Data[50]), 
        .C1(n143), .C2(TX_Data[48]), .ZN(n152) );
  INR2D1BWP U244 ( .A1(n147), .B1(n146), .ZN(n194) );
  OAI21D1BWP U245 ( .A1(n155), .A2(\protocol/counter[4] ), .B(
        \protocol/counter[5] ), .ZN(n223) );
  AOI22D1BWP U246 ( .A1(n193), .A2(TX_Data[46]), .B1(n192), .B2(TX_Data[42]), 
        .ZN(n162) );
  OAI31D1BWP U247 ( .A1(\protocol/counter[5] ), .A2(n212), .A3(n181), .B(n180), 
        .ZN(n182) );
  MUX2ND0BWP U248 ( .I0(n172), .I1(n171), .S(n2), .ZN(n181) );
  MUX2D1BWP U249 ( .I0(n140), .I1(n141), .S(n160), .Z(n166) );
  MUX2ND0BWP U250 ( .I0(n152), .I1(n151), .S(n2), .ZN(n153) );
  AOI222D1BWP U251 ( .A1(n150), .A2(TX_Data[53]), .B1(n143), .B2(TX_Data[49]), 
        .C1(n149), .C2(TX_Data[51]), .ZN(n151) );
  AO222D1BWP U252 ( .A1(n143), .A2(TX_Data[17]), .B1(n192), .B2(TX_Data[19]), 
        .C1(TX_Data[21]), .C2(n195), .Z(n171) );
  NR3D0BWP U253 ( .A1(\protocol/state[0] ), .A2(n4), .A3(n5), .ZN(n224) );
  INR3D0BWP U254 ( .A1(\protocol/state[0] ), .B1(\protocol/state[1] ), .B2(n4), 
        .ZN(\protocol/next_ready ) );
  INR3D0BWP U255 ( .A1(n225), .B1(n226), .B2(n6), .ZN(n3) );
  INR3D0BWP U256 ( .A1(n227), .B1(n226), .B2(n6), .ZN(n1) );
endmodule

