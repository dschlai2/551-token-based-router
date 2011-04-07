
module trans_protocol_synth ( TX_Data, start, rst, clk, ready, S_Data );
  input [54:0] TX_Data;
  input start, rst, clk;
  output ready, S_Data;
  wire   next_S_Data, next_ready, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74;
  wire   [5:0] counter;
  wire   [5:0] counter_1;
  wire   [3:0] state;
  wire   [2:0] next_state;
  wire   [5:0] next_counter;

  FD4QM1P \state_reg[1]  ( .D(next_state[1]), .CP(clk), .SD(n74), .Q(state[1])
         );
  FD4QM1P \state_reg[2]  ( .D(next_state[2]), .CP(clk), .SD(n74), .Q(state[2])
         );
  FD4QM1P \counter_reg[0]  ( .D(next_counter[0]), .CP(clk), .SD(n74), .Q(
        counter[0]) );
  FD2QM1P ready_reg ( .D(next_ready), .CP(clk), .CD(n74), .Q(ready) );
  FD2QM1P \state_reg[0]  ( .D(next_state[0]), .CP(clk), .CD(n74), .Q(state[0])
         );
  FD2QM1P \counter_reg[3]  ( .D(next_counter[3]), .CP(clk), .CD(n74), .Q(
        counter[3]) );
  FD2QM1P \counter_reg[5]  ( .D(next_counter[5]), .CP(clk), .CD(n74), .Q(
        counter[5]) );
  FD2QM1P \counter_reg[4]  ( .D(next_counter[4]), .CP(clk), .CD(n74), .Q(
        counter[4]) );
  FD2QM1P \counter_reg[2]  ( .D(next_counter[2]), .CP(clk), .CD(n74), .Q(
        counter[2]) );
  FD2QM1P \counter_reg[1]  ( .D(next_counter[1]), .CP(clk), .CD(n74), .Q(
        counter[1]) );
  FD2QM1P S_Data_reg ( .D(next_S_Data), .CP(clk), .CD(n74), .Q(S_Data) );
  NR2M2P U3 ( .A(n21), .B(n19), .Z(n45) );
  NR2FM1P U4 ( .A(counter_1[1]), .B(counter_1[2]), .Z(n44) );
  NR2M2P U5 ( .A(n19), .B(counter_1[1]), .Z(n42) );
  NR2M2P U6 ( .A(n21), .B(counter_1[2]), .Z(n43) );
  N1M1P U7 ( .A(counter[0]), .Z(counter_1[0]) );
  ND2BNM1P U8 ( .B(counter[1]), .A(counter_1[0]), .Z(n1) );
  AO21CNM1P U9 ( .A(counter[0]), .B(counter[1]), .C(n1), .Z(counter_1[1]) );
  OR2M1P U10 ( .A(n1), .B(counter[2]), .Z(n2) );
  AO21CNM1P U11 ( .A(n1), .B(counter[2]), .C(n2), .Z(counter_1[2]) );
  OR2M1P U12 ( .A(n2), .B(counter[3]), .Z(n3) );
  AO21CNM1P U13 ( .A(n2), .B(counter[3]), .C(n3), .Z(counter_1[3]) );
  ENFM1P U14 ( .A(counter[4]), .B(n3), .Z(counter_1[4]) );
  NR2M1P U15 ( .A(counter[4]), .B(n3), .Z(n4) );
  EOFM1P U16 ( .A(counter[5]), .B(n4), .Z(counter_1[5]) );
  ND3M1P U17 ( .A(n5), .B(n6), .C(n7), .Z(next_state[2]) );
  N1M1P U18 ( .A(n6), .Z(next_state[1]) );
  NR3M1P U19 ( .A(n8), .B(state[1]), .C(n9), .Z(next_ready) );
  OAI21M1P U20 ( .A(n10), .B(n11), .C(n7), .Z(next_counter[5]) );
  N1M1P U21 ( .A(counter_1[5]), .Z(n11) );
  OAI21M1P U22 ( .A(n10), .B(n12), .C(n7), .Z(next_counter[4]) );
  NR2M1P U23 ( .A(n13), .B(n14), .Z(next_counter[3]) );
  AOI22M1P U24 ( .A(n15), .B(n16), .C(n17), .D(n18), .Z(n13) );
  OAI21M1P U25 ( .A(n10), .B(n19), .C(n20), .Z(next_counter[2]) );
  OAI21M1P U26 ( .A(n10), .B(n21), .C(n20), .Z(next_counter[1]) );
  AND2M1P U27 ( .A(n7), .B(n22), .Z(n20) );
  ND4M1P U28 ( .A(state[1]), .B(start), .C(state[2]), .D(n8), .Z(n22) );
  N1M1P U29 ( .A(state[0]), .Z(n8) );
  AOI21M1P U30 ( .A(n16), .B(n15), .C(n17), .Z(n10) );
  ND4DNM1P U31 ( .D(next_state[0]), .A(n23), .B(n7), .C(n6), .Z(
        next_counter[0]) );
  AOI21M1P U32 ( .A(n24), .B(state[1]), .C(state[0]), .Z(n6) );
  ND2M1P U33 ( .A(state[2]), .B(start), .Z(n24) );
  ND2M1P U34 ( .A(n17), .B(n25), .Z(n7) );
  OAI21M1P U35 ( .A(n17), .B(n15), .C(counter_1[0]), .Z(n23) );
  NR2BNM1P U36 ( .B(n26), .A(state[2]), .Z(n17) );
  NR2M1P U37 ( .A(n5), .B(n16), .Z(next_state[0]) );
  N1M1P U38 ( .A(n27), .Z(n16) );
  AO2222M1P U39 ( .A(state[0]), .B(state[1]), .C(n28), .D(n9), .E(n15), .F(n29), .G(n27), .H(n26), .Z(next_S_Data) );
  NR2M1P U40 ( .A(n18), .B(counter[0]), .Z(n27) );
  N1M1P U41 ( .A(n25), .Z(n18) );
  NR3M1P U42 ( .A(counter[2]), .B(counter[1]), .C(n30), .Z(n25) );
  OR3M1P U43 ( .A(counter[5]), .B(counter[4]), .C(counter[3]), .Z(n30) );
  AO21M1P U44 ( .A(counter_1[4]), .B(n31), .C(n32), .Z(n29) );
  MUX21LM1P U45 ( .A(n33), .B(n34), .S(counter_1[5]), .Z(n32) );
  AOI211M1P U46 ( .A(TX_Data[39]), .B(n35), .C(n36), .D(n37), .Z(n34) );
  OA21M1P U47 ( .A(n38), .B(n39), .C(counter_1[3]), .Z(n37) );
  AOI21M1P U48 ( .A(n40), .B(n41), .C(counter[0]), .Z(n39) );
  AOI22M1P U49 ( .A(TX_Data[45]), .B(n42), .C(TX_Data[43]), .D(n43), .Z(n41)
         );
  AOI22M1P U50 ( .A(TX_Data[41]), .B(n44), .C(TX_Data[47]), .D(n45), .Z(n40)
         );
  AOI21M1P U51 ( .A(n46), .B(n47), .C(counter_1[0]), .Z(n38) );
  AOI22M1P U52 ( .A(TX_Data[44]), .B(n42), .C(TX_Data[42]), .D(n43), .Z(n47)
         );
  AOI22M1P U53 ( .A(TX_Data[40]), .B(n44), .C(TX_Data[46]), .D(n45), .Z(n46)
         );
  MUX21LM1P U54 ( .A(n48), .B(n49), .S(counter_1[4]), .Z(n36) );
  AOI21M1P U55 ( .A(TX_Data[54]), .B(n45), .C(n50), .Z(n49) );
  OAI22M1P U56 ( .A(counter_1[0]), .B(n51), .C(counter[0]), .D(n52), .Z(n50)
         );
  AOI222M1P U57 ( .A(TX_Data[53]), .B(counter_1[2]), .C(TX_Data[49]), .D(n44), 
        .E(TX_Data[51]), .F(counter_1[1]), .Z(n52) );
  AOI222M1P U58 ( .A(TX_Data[48]), .B(n44), .C(TX_Data[52]), .D(n42), .E(
        TX_Data[50]), .F(n43), .Z(n51) );
  OAI21M1P U59 ( .A(n53), .B(n54), .C(n14), .Z(n48) );
  AOI21M1P U60 ( .A(n55), .B(n56), .C(counter_1[0]), .Z(n54) );
  AOI22M1P U61 ( .A(TX_Data[36]), .B(n42), .C(TX_Data[34]), .D(n43), .Z(n56)
         );
  AOI22M1P U62 ( .A(TX_Data[32]), .B(n44), .C(TX_Data[38]), .D(n45), .Z(n55)
         );
  NR2M1P U63 ( .A(counter[0]), .B(n57), .Z(n53) );
  AOI222M1P U64 ( .A(TX_Data[33]), .B(n44), .C(TX_Data[37]), .D(n42), .E(
        TX_Data[35]), .F(n43), .Z(n57) );
  MUX31HM2P U65 ( .D0(n58), .D1(n59), .D2(n60), .A(counter_1[4]), .B(
        counter_1[3]), .Z(n33) );
  OAI21M1P U66 ( .A(n61), .B(n62), .C(n12), .Z(n60) );
  N1M1P U67 ( .A(counter_1[4]), .Z(n12) );
  AOI21M1P U68 ( .A(n63), .B(n64), .C(counter_1[0]), .Z(n62) );
  AOI22M1P U69 ( .A(TX_Data[12]), .B(n42), .C(TX_Data[10]), .D(n43), .Z(n64)
         );
  AOI22M1P U70 ( .A(TX_Data[8]), .B(n44), .C(TX_Data[14]), .D(n45), .Z(n63) );
  AOI21M1P U71 ( .A(n65), .B(n66), .C(counter[0]), .Z(n61) );
  AOI22M1P U72 ( .A(TX_Data[13]), .B(n42), .C(TX_Data[11]), .D(n43), .Z(n66)
         );
  AOI22M1P U73 ( .A(TX_Data[9]), .B(n44), .C(TX_Data[15]), .D(n45), .Z(n65) );
  AOI22M1P U74 ( .A(counter_1[0]), .B(n67), .C(counter[0]), .D(n68), .Z(n59)
         );
  AO2222M1P U75 ( .A(TX_Data[22]), .B(n45), .C(TX_Data[16]), .D(n44), .E(
        TX_Data[18]), .F(n43), .G(TX_Data[20]), .H(n42), .Z(n68) );
  AO222M2P U76 ( .A(TX_Data[19]), .B(n43), .C(TX_Data[21]), .D(n42), .E(
        TX_Data[17]), .F(n44), .Z(n67) );
  AOI22M1P U77 ( .A(n69), .B(counter_1[0]), .C(n70), .D(counter[0]), .Z(n58)
         );
  AO2222M1P U78 ( .A(TX_Data[6]), .B(n45), .C(TX_Data[0]), .D(n44), .E(
        TX_Data[2]), .F(n43), .G(TX_Data[4]), .H(n42), .Z(n70) );
  AO2222M1P U79 ( .A(TX_Data[7]), .B(n45), .C(TX_Data[1]), .D(n44), .E(
        TX_Data[3]), .F(n43), .G(TX_Data[5]), .H(n42), .Z(n69) );
  OAI22CDNM1P U80 ( .A(n71), .B(n14), .C(TX_Data[23]), .D(n35), .Z(n31) );
  NR3CNM1P U81 ( .C(n45), .A(counter[0]), .B(counter_1[3]), .Z(n35) );
  N1M1P U82 ( .A(counter_1[3]), .Z(n14) );
  AOI22M1P U83 ( .A(n72), .B(counter_1[0]), .C(n73), .D(counter[0]), .Z(n71)
         );
  AO2222M1P U84 ( .A(TX_Data[30]), .B(n45), .C(TX_Data[24]), .D(n44), .E(
        TX_Data[26]), .F(n43), .G(TX_Data[28]), .H(n42), .Z(n73) );
  AO2222M1P U85 ( .A(TX_Data[31]), .B(n45), .C(TX_Data[25]), .D(n44), .E(
        TX_Data[27]), .F(n43), .G(TX_Data[29]), .H(n42), .Z(n72) );
  N1M1P U86 ( .A(counter_1[2]), .Z(n19) );
  N1M1P U87 ( .A(counter_1[1]), .Z(n21) );
  N1M1P U88 ( .A(n5), .Z(n15) );
  ND2M1P U89 ( .A(state[2]), .B(n26), .Z(n5) );
  N1M1P U90 ( .A(state[2]), .Z(n9) );
  ND3M1P U91 ( .A(counter_1[2]), .B(n26), .C(counter_1[0]), .Z(n28) );
  NR2M1P U92 ( .A(state[0]), .B(state[1]), .Z(n26) );
  N1M1P U93 ( .A(rst), .Z(n74) );
endmodule


module transmitter_synth ( TX_Data, TX_Data_Valid, Clk_S, Rst_n, TX_Ready, S_Data );
  input [54:0] TX_Data;
  input TX_Data_Valid, Clk_S, Rst_n;
  output TX_Ready, S_Data;
  wire   start, ready, n4, n5, n6, n7, n8, n9;
  wire   [1:0] state;
  wire   [1:0] next_state;

  trans_protocol_synth protocol ( .TX_Data(TX_Data), .start(start), .rst(n4), .clk(
        Clk_S), .ready(ready), .S_Data(S_Data) );
  FD2QM1P TX_Ready_reg ( .D(n6), .CP(Clk_S), .CD(Rst_n), .Q(TX_Ready) );
  FD2QM1P start_reg ( .D(n7), .CP(Clk_S), .CD(Rst_n), .Q(start) );
  FD2QM1P \state_reg[0]  ( .D(next_state[0]), .CP(Clk_S), .CD(Rst_n), .Q(
        state[0]) );
  FD2QM1P \state_reg[1]  ( .D(next_state[1]), .CP(Clk_S), .CD(Rst_n), .Q(
        state[1]) );
  ND2M1P U11 ( .A(state[0]), .B(TX_Data_Valid), .Z(n5) );
  N1M1P U12 ( .A(state[0]), .Z(n8) );
  N1M1P U13 ( .A(Rst_n), .Z(n4) );
  OAI21M1P U14 ( .A(ready), .B(n9), .C(n5), .Z(next_state[1]) );
  N1M1P U15 ( .A(state[1]), .Z(n9) );
  AOI21M1P U16 ( .A(state[1]), .B(n8), .C(TX_Data_Valid), .Z(next_state[0]) );
  N1M1P U17 ( .A(n5), .Z(n7) );
  NR2M1P U18 ( .A(state[1]), .B(n8), .Z(n6) );
endmodule

