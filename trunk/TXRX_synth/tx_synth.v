
module trans_protocol ( TX_Data, start, rst, clk, ready, S_Data );
  input [54:0] TX_Data;
  input start, rst, clk;
  output ready, S_Data;
  wire   next_ready, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13,
         n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55,
         n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69,
         n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83,
         n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97,
         n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109,
         n110, n111, n112, n113, n114, n115, n116, n117, n118, n119, n120,
         n121, n122, n123, n124, n125, n126, n127, n128, n129, n130, n131,
         n132, n133, n134, n135, n136, n137, n138, n139, n140, n141, n142,
         n143, n144, n145, n146, n147, n148, n149, n150, n151, n152, n153,
         n154, n155, n156, n157, n158, n159, n160, n161, n162, n163, n164,
         n165, n166, n167, n168, n169, n170, n171, n172, n173, n174, n175,
         n176, n177, n178, n179, n180, n181, n182, n183, n184, n185, n186,
         n187, n188, n189, n190, n191, n192, n193, n194, n195, n196, n197,
         n198, n199, n200, n201, n202, n203, n204, n205, n206, n207, n208,
         n209, n210, n211, n212, n213, n214, n215, n216, n217, n218, n219,
         n220, n221, n222, n223, n224, n225, n226, n227, n228, n229, n230,
         n231, n232, n233, n234;
  wire   [5:0] counter;
  wire   [3:0] state;
  wire   [2:0] next_state;
  wire   [5:0] next_counter;

  FD2QM8P \counter_reg[1]  ( .D(next_counter[1]), .CP(clk), .CD(n234), .Q(
        counter[1]) );
  FD2QM8P \counter_reg[2]  ( .D(next_counter[2]), .CP(clk), .CD(n234), .Q(n232) );
  FD2QM8P \counter_reg[5]  ( .D(next_counter[5]), .CP(clk), .CD(n234), .Q(
        counter[5]) );
  FD4QM8P \counter_reg[0]  ( .D(next_counter[0]), .CP(clk), .SD(n234), .Q(
        counter[0]) );
  FD2QM3P S_Data_reg ( .D(n233), .CP(clk), .CD(n234), .Q(S_Data) );
  FD4QM8P \state_reg[1]  ( .D(next_state[1]), .CP(clk), .SD(n234), .Q(state[1]) );
  FD2QM1P ready_reg ( .D(next_ready), .CP(clk), .CD(n234), .Q(ready) );
  FD4QM8P \state_reg[2]  ( .D(next_state[2]), .CP(clk), .SD(n234), .Q(state[2]) );
  FD2QM3P \state_reg[0]  ( .D(next_state[0]), .CP(clk), .CD(n234), .Q(state[0]) );
  FD2QM3P \counter_reg[3]  ( .D(next_counter[3]), .CP(clk), .CD(n234), .Q(
        counter[3]) );
  FD2QM8P \counter_reg[4]  ( .D(next_counter[4]), .CP(clk), .CD(n234), .Q(
        counter[4]) );
  NR2M2P U3 ( .A(n214), .B(n8), .Z(n57) );
  NR2M2P U4 ( .A(counter[3]), .B(n8), .Z(n200) );
  ND2FM4P U5 ( .A(n205), .B(n54), .Z(n230) );
  ND2FM6P U6 ( .A(n218), .B(n205), .Z(n227) );
  N1M6P U7 ( .A(n217), .Z(n205) );
  N1M1P U8 ( .A(n205), .Z(n1) );
  ND2FM2P U9 ( .A(n200), .B(n201), .Z(n217) );
  ND2FM1P U10 ( .A(n218), .B(n1), .Z(n221) );
  NR2FM1P U11 ( .A(n14), .B(n129), .Z(n130) );
  AOI22M2P U12 ( .A(TX_Data[5]), .B(n131), .C(TX_Data[1]), .D(n179), .Z(n30)
         );
  ND2BNM4P U13 ( .B(n17), .A(n28), .Z(n98) );
  N1M3P U14 ( .A(n105), .Z(n88) );
  ND2M2P U15 ( .A(n156), .B(n155), .Z(n159) );
  NR3M3P U16 ( .A(n158), .B(n219), .C(n159), .Z(n161) );
  N1M6P U17 ( .A(n186), .Z(n219) );
  NR2FM1P U18 ( .A(n178), .B(n157), .Z(n158) );
  ENFM2P U19 ( .A(counter[0]), .B(counter[1]), .Z(n41) );
  NR2M3P U20 ( .A(n15), .B(n67), .Z(n68) );
  ND2FM3P U21 ( .A(n117), .B(n116), .Z(n198) );
  ND2M3P U22 ( .A(n62), .B(n61), .Z(n222) );
  ND2FM3P U23 ( .A(n151), .B(n18), .Z(n152) );
  ND2M2P U24 ( .A(n59), .B(n58), .Z(n208) );
  N1M8P U25 ( .A(n207), .Z(n118) );
  ND4DNFM4P U26 ( .D(counter[1]), .A(n20), .B(n48), .C(n6), .Z(n47) );
  N1M10P U27 ( .A(counter[0]), .Z(n20) );
  N1M4P U28 ( .A(counter[3]), .Z(n48) );
  N1M8P U29 ( .A(n232), .Z(n6) );
  MUX21LFM2P U30 ( .A(n71), .B(n70), .S(n18), .Z(n74) );
  N1M6P U31 ( .A(n10), .Z(n167) );
  AND2M10P U32 ( .A(n23), .B(n16), .Z(n10) );
  NR2M3P U33 ( .A(n167), .B(n166), .Z(n168) );
  NR2FM2P U34 ( .A(n140), .B(n24), .Z(n27) );
  NR2M2P U35 ( .A(n141), .B(n66), .Z(n69) );
  N1M3P U36 ( .A(n21), .Z(n54) );
  ND2M2P U37 ( .A(n153), .B(n65), .Z(n140) );
  ND2M3P U38 ( .A(n23), .B(n20), .Z(n61) );
  N1M8P U39 ( .A(n20), .Z(n21) );
  NR2M4P U40 ( .A(n15), .B(n60), .Z(n64) );
  OAI21M2P U41 ( .A(n188), .B(n187), .C(n186), .Z(n191) );
  ND2M2P U42 ( .A(n112), .B(n9), .Z(n113) );
  ND3M2P U43 ( .A(n132), .B(n133), .C(n134), .Z(n135) );
  NR2M4P U44 ( .A(n98), .B(n97), .Z(n101) );
  ND2M2P U45 ( .A(n61), .B(n13), .Z(n59) );
  N1M6P U46 ( .A(n6), .Z(n13) );
  OAI22CDNM1P U47 ( .A(n178), .B(n142), .C(n181), .D(TX_Data[4]), .Z(n143) );
  N1M3P U48 ( .A(n23), .Z(n3) );
  N1M2P U49 ( .A(n232), .Z(n2) );
  OAI21M6P U50 ( .A(n23), .B(n13), .C(n21), .Z(n153) );
  N1M3P U51 ( .A(n21), .Z(n7) );
  N1M4P U52 ( .A(n15), .Z(n179) );
  AND2M2P U53 ( .A(n54), .B(n151), .Z(n192) );
  N1M2P U54 ( .A(n118), .Z(n9) );
  NR2M2P U55 ( .A(n165), .B(n164), .Z(n169) );
  N1M3P U56 ( .A(n153), .Z(n165) );
  N1M8P U57 ( .A(counter[1]), .Z(n23) );
  NR2M1P U58 ( .A(n14), .B(n32), .Z(n37) );
  AND3M2P U59 ( .A(n20), .B(n22), .C(n6), .Z(n50) );
  AND2M10P U60 ( .A(n153), .B(n65), .Z(n4) );
  OAI21M3P U61 ( .A(n2), .B(n3), .C(n20), .Z(n65) );
  N1M1P U62 ( .A(n16), .Z(n17) );
  NR2M1P U63 ( .A(counter[5]), .B(counter[3]), .Z(n51) );
  N1M6P U64 ( .A(n214), .Z(n203) );
  NR3M2P U65 ( .A(n170), .B(n169), .C(n168), .Z(n173) );
  N1M1P U66 ( .A(n115), .Z(n116) );
  NR3M1P U67 ( .A(n215), .B(n5), .C(n209), .Z(n210) );
  N1M2P U68 ( .A(rst), .Z(n234) );
  OAI21M2P U69 ( .A(n213), .B(n212), .C(n211), .Z(next_counter[2]) );
  ND2BNM10P U70 ( .B(n202), .A(n203), .Z(n228) );
  ND2FM4P U71 ( .A(n203), .B(n202), .Z(n204) );
  N1M4P U72 ( .A(n228), .Z(n231) );
  OAI21M1P U73 ( .A(n213), .B(n206), .C(n227), .Z(next_counter[5]) );
  ND2BNM4P U74 ( .B(n228), .A(n230), .Z(n220) );
  N1M4P U75 ( .A(n223), .Z(n213) );
  ND2FM4P U76 ( .A(n220), .B(n204), .Z(n223) );
  N1M4P U77 ( .A(n204), .Z(n218) );
  BUFM1P U78 ( .A(state[0]), .Z(n5) );
  N1M2P U79 ( .A(n58), .Z(n49) );
  N1M4P U80 ( .A(n206), .Z(n119) );
  NR2M1P U81 ( .A(n105), .B(n104), .Z(n108) );
  ND2FM3P U82 ( .A(n41), .B(n40), .Z(n105) );
  ND2BNM4P U83 ( .B(n38), .A(n118), .Z(n43) );
  ND2FM4P U84 ( .A(n214), .B(n202), .Z(n52) );
  NR2FM1P U85 ( .A(n178), .B(n72), .Z(n73) );
  N1M4P U86 ( .A(counter[4]), .Z(n22) );
  OAI22M3P U87 ( .A(n165), .B(n103), .C(n167), .D(n102), .Z(n109) );
  N1M2P U88 ( .A(n23), .Z(n8) );
  AOI21M1P U89 ( .A(n173), .B(n172), .C(counter[5]), .Z(n175) );
  N1M3P U90 ( .A(n152), .Z(n174) );
  NR2FM1P U91 ( .A(n105), .B(n25), .Z(n26) );
  OAI21M1P U92 ( .A(n144), .B(n143), .C(n18), .Z(n145) );
  N1M4P U93 ( .A(n176), .Z(n151) );
  N1M4P U94 ( .A(n6), .Z(n16) );
  AOI21M3P U95 ( .A(n31), .B(n30), .C(n119), .Z(n46) );
  ND2BNM3P U96 ( .B(n87), .A(n4), .Z(n93) );
  ND2BNM3P U97 ( .B(n79), .A(n4), .Z(n84) );
  N1M6P U98 ( .A(state[1]), .Z(n209) );
  ND2FM1P U99 ( .A(state[1]), .B(state[0]), .Z(n53) );
  ND2I1M8P U100 ( .A(n41), .B(n40), .Z(n178) );
  OAI21M3P U101 ( .A(n74), .B(n73), .C(n118), .Z(n75) );
  MUX21LFM2P U102 ( .A(n110), .B(n111), .S(n54), .Z(n112) );
  MUX21LM3P U103 ( .A(n96), .B(n95), .S(n18), .Z(n114) );
  AOI21M1P U104 ( .A(n221), .B(n220), .C(n219), .Z(next_counter[3]) );
  NR2M1P U105 ( .A(n178), .B(n177), .Z(n188) );
  NR3M2P U106 ( .A(n108), .B(n109), .C(n107), .Z(n110) );
  OR2M2P U107 ( .A(n20), .B(n23), .Z(n62) );
  ND2BNM10P U108 ( .B(state[0]), .A(n209), .Z(n214) );
  OAI21M8P U109 ( .A(n47), .B(counter[4]), .C(counter[5]), .Z(n206) );
  N1M4P U110 ( .A(n141), .Z(n181) );
  ND2FM6P U111 ( .A(n29), .B(n2), .Z(n163) );
  BUFM1P U112 ( .A(n222), .Z(n11) );
  ND2BNM2P U113 ( .B(n6), .A(n29), .Z(n141) );
  OAI21M1P U114 ( .A(n213), .B(n9), .C(n227), .Z(next_counter[4]) );
  OAI211M3P U115 ( .A(state[2]), .B(n7), .C(n53), .D(n52), .Z(n55) );
  AOI21M3P U116 ( .A(n46), .B(n45), .C(n44), .Z(n77) );
  AND2M2P U117 ( .A(n222), .B(TX_Data[51]), .Z(n63) );
  N1M2P U118 ( .A(n41), .Z(n28) );
  AND2M2P U119 ( .A(n51), .B(n50), .Z(n56) );
  AOI21M4P U120 ( .A(n56), .B(n57), .C(n55), .Z(n150) );
  NR3M6P U121 ( .A(n118), .B(n26), .C(n27), .Z(n31) );
  N1M2P U122 ( .A(n165), .Z(n12) );
  ND2BNM3P U123 ( .B(n148), .A(n147), .Z(n197) );
  MUX21LFM2P U124 ( .A(n136), .B(n135), .S(n18), .Z(n146) );
  EOFM4P U125 ( .A(counter[0]), .B(counter[1]), .Z(n29) );
  ND3M3P U126 ( .A(n195), .B(n194), .C(n193), .Z(n196) );
  AOI21M3P U127 ( .A(n191), .B(n192), .C(n190), .Z(n193) );
  NR3M2P U128 ( .A(n16), .B(counter[5]), .C(counter[4]), .Z(n201) );
  ND3BCNM2P U129 ( .B(counter[1]), .C(n232), .A(n20), .Z(n58) );
  BUFM12P U130 ( .A(n163), .Z(n14) );
  BUFM10P U131 ( .A(n163), .Z(n15) );
  N1M8P U132 ( .A(n19), .Z(n18) );
  ND3M1P U133 ( .A(n229), .B(n228), .C(n227), .Z(next_state[2]) );
  ND3M1P U134 ( .A(n216), .B(n227), .C(n229), .Z(next_counter[0]) );
  ND2BNM4P U135 ( .B(n210), .A(n227), .Z(n225) );
  N1I1M8P U136 ( .A(n21), .Z(n19) );
  ND2FM4P U137 ( .A(n149), .B(n150), .Z(n176) );
  ND3M3P U138 ( .A(n149), .B(n228), .C(n150), .Z(n189) );
  OAI211M2P U139 ( .A(n140), .B(n185), .C(n184), .D(n183), .Z(n187) );
  AOI211M3P U140 ( .A(TX_Data[53]), .B(n208), .C(n64), .D(n63), .Z(n71) );
  AOI211M3P U141 ( .A(n4), .B(TX_Data[50]), .C(n68), .D(n69), .Z(n70) );
  MUX21LFM2P U142 ( .A(n114), .B(n113), .S(n219), .Z(n117) );
  OAI21M1P U143 ( .A(n140), .B(n139), .C(n138), .Z(n144) );
  ND2BNM2P U144 ( .B(n171), .A(n88), .Z(n172) );
  MUX21LFM2P U145 ( .A(n146), .B(n145), .S(n219), .Z(n147) );
  AOI211M3P U146 ( .A(TX_Data[35]), .B(n4), .C(n101), .D(n100), .Z(n111) );
  NR2BNM1P U147 ( .B(n207), .A(n176), .Z(n160) );
  OAI22M2P U148 ( .A(n77), .B(n76), .C(n75), .D(n115), .Z(n199) );
  ND3BCNM1P U149 ( .B(n119), .C(n118), .A(n189), .Z(n148) );
  ND3BCNM1P U150 ( .B(n18), .C(n186), .A(n189), .Z(n76) );
  OAI21M8P U151 ( .A(n49), .B(n48), .C(n47), .Z(n186) );
  N1M4P U152 ( .A(n98), .Z(n131) );
  ND3BCNM4P U153 ( .B(state[2]), .C(n49), .A(n59), .Z(n149) );
  ENFM4P U154 ( .A(n22), .B(n47), .Z(n207) );
  N1M2P U155 ( .A(TX_Data[3]), .Z(n24) );
  OAI22CDNM2P U156 ( .A(n232), .B(counter[0]), .C(n232), .D(counter[0]), .Z(
        n40) );
  N1M2P U157 ( .A(TX_Data[7]), .Z(n25) );
  N1M2P U158 ( .A(TX_Data[17]), .Z(n32) );
  N1M2P U159 ( .A(TX_Data[19]), .Z(n33) );
  ND2BNM2P U160 ( .B(n33), .A(n4), .Z(n36) );
  N1M2P U161 ( .A(TX_Data[21]), .Z(n34) );
  ND2BNM2P U162 ( .B(n34), .A(n181), .Z(n35) );
  ND4DNFM4P U163 ( .D(n37), .A(n36), .B(n118), .C(n35), .Z(n45) );
  N1M2P U164 ( .A(TX_Data[23]), .Z(n38) );
  N1M2P U165 ( .A(TX_Data[39]), .Z(n39) );
  ND2BNM2P U166 ( .B(n39), .A(counter[5]), .Z(n42) );
  AOI21M3P U167 ( .A(n43), .B(n42), .C(n178), .Z(n44) );
  N1M2P U168 ( .A(state[2]), .Z(n202) );
  ND2BNM2P U169 ( .B(n206), .A(n189), .Z(n115) );
  N1M2P U170 ( .A(TX_Data[49]), .Z(n60) );
  N1M2P U171 ( .A(TX_Data[52]), .Z(n66) );
  N1M2P U172 ( .A(TX_Data[48]), .Z(n67) );
  N1M2P U173 ( .A(TX_Data[54]), .Z(n72) );
  N1M2P U174 ( .A(TX_Data[41]), .Z(n78) );
  NR2FM1P U175 ( .A(n14), .B(n78), .Z(n85) );
  N1M2P U176 ( .A(TX_Data[43]), .Z(n79) );
  N1M2P U177 ( .A(TX_Data[47]), .Z(n80) );
  ND2BNM2P U178 ( .B(n80), .A(n88), .Z(n83) );
  N1M2P U179 ( .A(TX_Data[45]), .Z(n81) );
  ND2BNM2P U180 ( .B(n81), .A(n181), .Z(n82) );
  ND4DNFM4P U181 ( .D(n85), .A(n84), .B(n83), .C(n82), .Z(n96) );
  N1M2P U182 ( .A(TX_Data[40]), .Z(n86) );
  NR2FM1P U183 ( .A(n14), .B(n86), .Z(n94) );
  N1M2P U184 ( .A(TX_Data[42]), .Z(n87) );
  N1M2P U185 ( .A(TX_Data[46]), .Z(n89) );
  ND2BNM2P U186 ( .B(n89), .A(n88), .Z(n92) );
  N1M2P U187 ( .A(TX_Data[44]), .Z(n90) );
  ND2BNM2P U188 ( .B(n90), .A(n181), .Z(n91) );
  ND4DNFM4P U189 ( .D(n94), .A(n93), .B(n92), .C(n91), .Z(n95) );
  N1M2P U190 ( .A(TX_Data[37]), .Z(n97) );
  N1M2P U191 ( .A(TX_Data[33]), .Z(n99) );
  NR2FM1P U192 ( .A(n14), .B(n99), .Z(n100) );
  N1M2P U193 ( .A(TX_Data[34]), .Z(n103) );
  N1M2P U194 ( .A(TX_Data[36]), .Z(n102) );
  N1M2P U195 ( .A(TX_Data[38]), .Z(n104) );
  N1M2P U196 ( .A(TX_Data[32]), .Z(n106) );
  NR2FM1P U197 ( .A(n14), .B(n106), .Z(n107) );
  N1M2P U198 ( .A(TX_Data[11]), .Z(n120) );
  ND2BNM2P U199 ( .B(n120), .A(n4), .Z(n126) );
  N1M2P U200 ( .A(TX_Data[15]), .Z(n121) );
  ND2BNM2P U201 ( .B(n121), .A(n88), .Z(n125) );
  N1M2P U202 ( .A(TX_Data[9]), .Z(n122) );
  NR2FM1P U203 ( .A(n14), .B(n122), .Z(n123) );
  AOI21M3P U204 ( .A(TX_Data[13]), .B(n131), .C(n123), .Z(n124) );
  ND3M2P U205 ( .A(n124), .B(n125), .C(n126), .Z(n136) );
  N1M2P U206 ( .A(TX_Data[10]), .Z(n127) );
  ND2BNM2P U207 ( .B(n127), .A(n4), .Z(n134) );
  N1M2P U208 ( .A(TX_Data[14]), .Z(n128) );
  ND2BNM2P U209 ( .B(n128), .A(n88), .Z(n133) );
  N1M2P U210 ( .A(TX_Data[8]), .Z(n129) );
  AOI21M3P U211 ( .A(TX_Data[12]), .B(n131), .C(n130), .Z(n132) );
  N1M2P U212 ( .A(TX_Data[2]), .Z(n139) );
  N1M2P U213 ( .A(TX_Data[0]), .Z(n137) );
  ND2BNM2P U214 ( .B(n137), .A(n179), .Z(n138) );
  N1M2P U215 ( .A(TX_Data[6]), .Z(n142) );
  AOI22M3P U216 ( .A(TX_Data[26]), .B(n12), .C(TX_Data[28]), .D(n10), .Z(n156)
         );
  N1M2P U217 ( .A(TX_Data[24]), .Z(n154) );
  ND2BNM2P U218 ( .B(n154), .A(n179), .Z(n155) );
  N1M2P U219 ( .A(TX_Data[30]), .Z(n157) );
  AOI21M2P U220 ( .A(n174), .B(n161), .C(n160), .Z(n195) );
  N1M2P U221 ( .A(TX_Data[16]), .Z(n162) );
  NR2FM1P U222 ( .A(n14), .B(n162), .Z(n170) );
  N1M2P U223 ( .A(TX_Data[18]), .Z(n164) );
  N1M2P U224 ( .A(TX_Data[20]), .Z(n166) );
  N1M2P U225 ( .A(TX_Data[22]), .Z(n171) );
  ND3BCNM2P U226 ( .B(n175), .C(n186), .A(n174), .Z(n194) );
  N1M2P U227 ( .A(TX_Data[31]), .Z(n177) );
  N1M2P U228 ( .A(TX_Data[27]), .Z(n185) );
  N1M2P U229 ( .A(TX_Data[25]), .Z(n180) );
  ND2BNM2P U230 ( .B(n180), .A(n179), .Z(n184) );
  N1M2P U231 ( .A(TX_Data[29]), .Z(n182) );
  ND2BNM2P U232 ( .B(n182), .A(n181), .Z(n183) );
  N1M1P U233 ( .A(n189), .Z(n190) );
  ND4DNFM4P U234 ( .D(n199), .A(n198), .B(n197), .C(n196), .Z(n233) );
  N1M1P U235 ( .A(n208), .Z(n212) );
  ND2M2P U236 ( .A(start), .B(state[2]), .Z(n215) );
  N1M1P U237 ( .A(n225), .Z(n211) );
  OAI21M1P U238 ( .A(n231), .B(n218), .C(n19), .Z(n216) );
  OAI21M3P U239 ( .A(n5), .B(n215), .C(n214), .Z(n229) );
  ND2M2P U240 ( .A(n223), .B(n11), .Z(n224) );
  ND2BNM2P U241 ( .B(n225), .A(n224), .Z(next_counter[1]) );
  ND2M1P U242 ( .A(n5), .B(state[2]), .Z(n226) );
  NR2FM1P U243 ( .A(state[1]), .B(n226), .Z(next_ready) );
  N1M1P U244 ( .A(n229), .Z(next_state[1]) );
  NR2BNM2P U245 ( .B(n231), .A(n230), .Z(next_state[0]) );
endmodule


module transmitter ( TX_Data, TX_Data_Valid, Clk_S, Rst_n, TX_Ready, S_Data );
  input [54:0] TX_Data;
  input TX_Data_Valid, Clk_S, Rst_n;
  output TX_Ready, S_Data;
  wire   start, ready, n4, n6, n7, n8, n9, n10, n11;
  wire   [1:0] state;
  wire   [1:0] next_state;

  trans_protocol protocol ( .TX_Data(TX_Data), .start(start), .rst(n4), .clk(
        Clk_S), .ready(ready), .S_Data(S_Data) );
  FD2QM1P TX_Ready_reg ( .D(n6), .CP(Clk_S), .CD(Rst_n), .Q(TX_Ready) );
  FD2QM1P \state_reg[1]  ( .D(next_state[1]), .CP(Clk_S), .CD(Rst_n), .Q(
        state[1]) );
  FD2QM1P start_reg ( .D(n11), .CP(Clk_S), .CD(Rst_n), .Q(start) );
  FD2QM3P \state_reg[0]  ( .D(next_state[0]), .CP(Clk_S), .CD(Rst_n), .Q(
        state[0]) );
  N1M1P U11 ( .A(Rst_n), .Z(n4) );
  NR2BNM1P U12 ( .B(state[0]), .A(state[1]), .Z(n6) );
  AOI21M1P U13 ( .A(state[1]), .B(n10), .C(TX_Data_Valid), .Z(next_state[0])
         );
  N1M1P U14 ( .A(state[0]), .Z(n10) );
  N1M2P U15 ( .A(state[1]), .Z(n8) );
  N1M2P U16 ( .A(TX_Data_Valid), .Z(n7) );
  ND2BNM2P U17 ( .B(n7), .A(state[0]), .Z(n9) );
  OAI21M3P U18 ( .A(ready), .B(n8), .C(n9), .Z(next_state[1]) );
  N1M1P U19 ( .A(n9), .Z(n11) );
endmodule

