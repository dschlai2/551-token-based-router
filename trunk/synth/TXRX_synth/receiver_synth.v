
module receive_protocol_DW01_decode_0 ( A, B );
  input [6:0] A;
  output [127:0] B;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36;

  N1M1P U2 ( .A(A[6]), .Z(n9) );
  N1M1P U3 ( .A(A[4]), .Z(n8) );
  N1M1P U4 ( .A(A[1]), .Z(n4) );
  N1M1P U5 ( .A(A[2]), .Z(n6) );
  N1M1P U6 ( .A(A[3]), .Z(n7) );
  N1M1P U7 ( .A(n23), .Z(n5) );
  N1M1P U8 ( .A(n21), .Z(n3) );
  N1M1P U9 ( .A(n20), .Z(n2) );
  ND2M1P U10 ( .A(n1), .B(n7), .Z(n15) );
  ND2M1P U11 ( .A(A[3]), .B(n1), .Z(n12) );
  ND2M1P U12 ( .A(A[3]), .B(A[0]), .Z(n11) );
  ND2M1P U13 ( .A(A[0]), .B(n7), .Z(n14) );
  N1M1P U14 ( .A(A[0]), .Z(n1) );
  NR2M1P U15 ( .A(n10), .B(n11), .Z(B[9]) );
  NR2M1P U16 ( .A(n10), .B(n12), .Z(B[8]) );
  NR2M1P U17 ( .A(n13), .B(n14), .Z(B[7]) );
  NR2M1P U18 ( .A(n13), .B(n15), .Z(B[6]) );
  NR2M1P U19 ( .A(n14), .B(n16), .Z(B[5]) );
  NR2BNM1P U20 ( .B(n17), .A(n18), .Z(B[54]) );
  NR2M1P U21 ( .A(n2), .B(n19), .Z(B[53]) );
  NR2M1P U22 ( .A(n2), .B(n18), .Z(B[52]) );
  NR2M1P U23 ( .A(n19), .B(n3), .Z(B[51]) );
  NR2M1P U24 ( .A(n18), .B(n3), .Z(B[50]) );
  NR2M1P U25 ( .A(n15), .B(n16), .Z(B[4]) );
  NR2M1P U26 ( .A(n5), .B(n19), .Z(B[49]) );
  ND2M1P U27 ( .A(n22), .B(A[0]), .Z(n19) );
  NR2M1P U28 ( .A(n5), .B(n18), .Z(B[48]) );
  ND2M1P U29 ( .A(n22), .B(n1), .Z(n18) );
  AND4M1P U30 ( .A(A[5]), .B(A[4]), .C(n7), .D(n9), .Z(n22) );
  NR2M1P U31 ( .A(n11), .B(n24), .Z(B[47]) );
  NR2M1P U32 ( .A(n12), .B(n24), .Z(B[46]) );
  NR2M1P U33 ( .A(n11), .B(n25), .Z(B[45]) );
  NR2M1P U34 ( .A(n12), .B(n25), .Z(B[44]) );
  NR2M1P U35 ( .A(n11), .B(n26), .Z(B[43]) );
  NR2M1P U36 ( .A(n12), .B(n26), .Z(B[42]) );
  NR2M1P U37 ( .A(n11), .B(n27), .Z(B[41]) );
  NR2M1P U38 ( .A(n12), .B(n27), .Z(B[40]) );
  NR2M1P U39 ( .A(n14), .B(n28), .Z(B[3]) );
  NR2M1P U40 ( .A(n14), .B(n24), .Z(B[39]) );
  NR2M1P U41 ( .A(n15), .B(n24), .Z(B[38]) );
  ND2M1P U42 ( .A(n29), .B(n17), .Z(n24) );
  NR2M1P U43 ( .A(n14), .B(n25), .Z(B[37]) );
  NR2M1P U44 ( .A(n15), .B(n25), .Z(B[36]) );
  ND2M1P U45 ( .A(n29), .B(n20), .Z(n25) );
  NR2M1P U46 ( .A(n14), .B(n26), .Z(B[35]) );
  NR2M1P U47 ( .A(n15), .B(n26), .Z(B[34]) );
  ND2M1P U48 ( .A(n29), .B(n21), .Z(n26) );
  NR2M1P U49 ( .A(n14), .B(n27), .Z(B[33]) );
  NR2M1P U50 ( .A(n15), .B(n27), .Z(B[32]) );
  ND2M1P U51 ( .A(n29), .B(n23), .Z(n27) );
  AND3M1P U52 ( .A(n8), .B(n9), .C(A[5]), .Z(n29) );
  NR2M1P U53 ( .A(n11), .B(n30), .Z(B[31]) );
  NR2M1P U54 ( .A(n12), .B(n30), .Z(B[30]) );
  NR2M1P U55 ( .A(n15), .B(n28), .Z(B[2]) );
  NR2M1P U56 ( .A(n11), .B(n31), .Z(B[29]) );
  NR2M1P U57 ( .A(n12), .B(n31), .Z(B[28]) );
  NR2M1P U58 ( .A(n11), .B(n32), .Z(B[27]) );
  NR2M1P U59 ( .A(n12), .B(n32), .Z(B[26]) );
  NR2M1P U60 ( .A(n11), .B(n33), .Z(B[25]) );
  NR2M1P U61 ( .A(n12), .B(n33), .Z(B[24]) );
  NR2M1P U62 ( .A(n14), .B(n30), .Z(B[23]) );
  NR2M1P U63 ( .A(n15), .B(n30), .Z(B[22]) );
  ND2M1P U64 ( .A(n34), .B(n17), .Z(n30) );
  NR2M1P U65 ( .A(n14), .B(n31), .Z(B[21]) );
  NR2M1P U66 ( .A(n15), .B(n31), .Z(B[20]) );
  ND2M1P U67 ( .A(n34), .B(n20), .Z(n31) );
  NR2M1P U68 ( .A(n10), .B(n14), .Z(B[1]) );
  NR2M1P U69 ( .A(n14), .B(n32), .Z(B[19]) );
  NR2M1P U70 ( .A(n15), .B(n32), .Z(B[18]) );
  ND2M1P U71 ( .A(n34), .B(n21), .Z(n32) );
  NR2M1P U72 ( .A(n14), .B(n33), .Z(B[17]) );
  NR2M1P U73 ( .A(n15), .B(n33), .Z(B[16]) );
  ND2M1P U74 ( .A(n34), .B(n23), .Z(n33) );
  AND2M1P U75 ( .A(A[4]), .B(n35), .Z(n34) );
  NR2M1P U76 ( .A(n11), .B(n13), .Z(B[15]) );
  NR2M1P U77 ( .A(n12), .B(n13), .Z(B[14]) );
  ND2M1P U78 ( .A(n17), .B(n36), .Z(n13) );
  NR2M1P U79 ( .A(n6), .B(n4), .Z(n17) );
  NR2M1P U80 ( .A(n11), .B(n16), .Z(B[13]) );
  NR2M1P U81 ( .A(n12), .B(n16), .Z(B[12]) );
  ND2M1P U82 ( .A(n20), .B(n36), .Z(n16) );
  NR2M1P U83 ( .A(n6), .B(A[1]), .Z(n20) );
  NR2M1P U84 ( .A(n11), .B(n28), .Z(B[11]) );
  NR2M1P U85 ( .A(n12), .B(n28), .Z(B[10]) );
  ND2M1P U86 ( .A(n21), .B(n36), .Z(n28) );
  NR2M1P U87 ( .A(n4), .B(A[2]), .Z(n21) );
  NR2M1P U88 ( .A(n10), .B(n15), .Z(B[0]) );
  ND2M1P U89 ( .A(n36), .B(n23), .Z(n10) );
  NR2M1P U90 ( .A(A[1]), .B(A[2]), .Z(n23) );
  AND2M1P U91 ( .A(n35), .B(n8), .Z(n36) );
  NR2M1P U92 ( .A(A[5]), .B(A[6]), .Z(n35) );
endmodule


module receive_protocol ( S_Data, clk, rst, packet, ready );
  output [54:0] packet;
  input S_Data, clk, rst;
  output ready;
  wire   N190, N191, N192, N193, N194, N195, N196, N197, N198, N199, N200,
         N201, N202, N203, N204, N205, N206, N207, N208, N209, N210, N211,
         N212, N213, N214, N215, N216, N217, N218, N219, N220, N221, N222,
         N223, N224, N225, N226, N227, N228, N229, N230, N231, N232, N233,
         N234, N235, N236, N237, N238, N239, N240, N241, N242, N243, N244,
         N356, N357, N358, N359, N360, N361, n137, n138, n139, n140, n141,
         n142, n143, n144, n145, n146, n147, n148, n149, n150, n151, n152,
         n153, n154, n155, n156, n157, n158, n159, n160, n161, n162, n163,
         n164, n165, n166, n167, n168, n169, n170, n171, n172, n173, n174,
         n175, n176, n177, n178, n179, n180, n181, n182, n183, n184, n185,
         n186, n187, n188, n189, n190, n191, n192, n193, n194, n195, n196,
         n197, n198, n199, n200, n201, n202, n203, n204, n205, n206, n207,
         n208, n209, n210, n211, n212, n213, n214, n215, n216, n217, n218,
         n219, n220, n221, n222, n223, n224, n225, n226, n227, n228, n229,
         n230, n231, n232, n233, n234, n235, n236, n237, n238, n239, n240,
         n241, n242, n243, n244, n245, n246, n247, n248, n249, n250, n251,
         n252, n253, n254, n255, n256, n257, n258, n1, n2, n3, n4, n5, n6, n7,
         n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63,
         n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74;
  wire   [2:0] state;
  wire   [5:0] start_seq;
  wire   [6:0] counter;
  wire   [2:0] next_state;
  wire   [6:0] next_counter;
  wire   [5:0] next_start_seq;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, 
        SYNOPSYS_UNCONNECTED__14, SYNOPSYS_UNCONNECTED__15, 
        SYNOPSYS_UNCONNECTED__16, SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20, SYNOPSYS_UNCONNECTED__21, 
        SYNOPSYS_UNCONNECTED__22, SYNOPSYS_UNCONNECTED__23, 
        SYNOPSYS_UNCONNECTED__24, SYNOPSYS_UNCONNECTED__25, 
        SYNOPSYS_UNCONNECTED__26, SYNOPSYS_UNCONNECTED__27, 
        SYNOPSYS_UNCONNECTED__28, SYNOPSYS_UNCONNECTED__29, 
        SYNOPSYS_UNCONNECTED__30, SYNOPSYS_UNCONNECTED__31, 
        SYNOPSYS_UNCONNECTED__32, SYNOPSYS_UNCONNECTED__33, 
        SYNOPSYS_UNCONNECTED__34, SYNOPSYS_UNCONNECTED__35, 
        SYNOPSYS_UNCONNECTED__36, SYNOPSYS_UNCONNECTED__37, 
        SYNOPSYS_UNCONNECTED__38, SYNOPSYS_UNCONNECTED__39, 
        SYNOPSYS_UNCONNECTED__40, SYNOPSYS_UNCONNECTED__41, 
        SYNOPSYS_UNCONNECTED__42, SYNOPSYS_UNCONNECTED__43, 
        SYNOPSYS_UNCONNECTED__44, SYNOPSYS_UNCONNECTED__45, 
        SYNOPSYS_UNCONNECTED__46, SYNOPSYS_UNCONNECTED__47, 
        SYNOPSYS_UNCONNECTED__48, SYNOPSYS_UNCONNECTED__49, 
        SYNOPSYS_UNCONNECTED__50, SYNOPSYS_UNCONNECTED__51, 
        SYNOPSYS_UNCONNECTED__52, SYNOPSYS_UNCONNECTED__53, 
        SYNOPSYS_UNCONNECTED__54, SYNOPSYS_UNCONNECTED__55, 
        SYNOPSYS_UNCONNECTED__56, SYNOPSYS_UNCONNECTED__57, 
        SYNOPSYS_UNCONNECTED__58, SYNOPSYS_UNCONNECTED__59, 
        SYNOPSYS_UNCONNECTED__60, SYNOPSYS_UNCONNECTED__61, 
        SYNOPSYS_UNCONNECTED__62, SYNOPSYS_UNCONNECTED__63, 
        SYNOPSYS_UNCONNECTED__64, SYNOPSYS_UNCONNECTED__65, 
        SYNOPSYS_UNCONNECTED__66, SYNOPSYS_UNCONNECTED__67, 
        SYNOPSYS_UNCONNECTED__68, SYNOPSYS_UNCONNECTED__69, 
        SYNOPSYS_UNCONNECTED__70, SYNOPSYS_UNCONNECTED__71, 
        SYNOPSYS_UNCONNECTED__72;

  AO21CNM1P U201 ( .A(N360), .B(n138), .C(n5), .Z(next_counter[5]) );
  OR3M1P U202 ( .A(next_state[2]), .B(n4), .C(N359), .Z(next_counter[4]) );
  OR3M1P U203 ( .A(next_state[2]), .B(n4), .C(N357), .Z(next_counter[2]) );
  AO21CNM1P U204 ( .A(N356), .B(n138), .C(n5), .Z(next_counter[1]) );
  receive_protocol_DW01_decode_0 r228 ( .A(counter), .B({
        SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, 
        SYNOPSYS_UNCONNECTED__14, SYNOPSYS_UNCONNECTED__15, 
        SYNOPSYS_UNCONNECTED__16, SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20, SYNOPSYS_UNCONNECTED__21, 
        SYNOPSYS_UNCONNECTED__22, SYNOPSYS_UNCONNECTED__23, 
        SYNOPSYS_UNCONNECTED__24, SYNOPSYS_UNCONNECTED__25, 
        SYNOPSYS_UNCONNECTED__26, SYNOPSYS_UNCONNECTED__27, 
        SYNOPSYS_UNCONNECTED__28, SYNOPSYS_UNCONNECTED__29, 
        SYNOPSYS_UNCONNECTED__30, SYNOPSYS_UNCONNECTED__31, 
        SYNOPSYS_UNCONNECTED__32, SYNOPSYS_UNCONNECTED__33, 
        SYNOPSYS_UNCONNECTED__34, SYNOPSYS_UNCONNECTED__35, 
        SYNOPSYS_UNCONNECTED__36, SYNOPSYS_UNCONNECTED__37, 
        SYNOPSYS_UNCONNECTED__38, SYNOPSYS_UNCONNECTED__39, 
        SYNOPSYS_UNCONNECTED__40, SYNOPSYS_UNCONNECTED__41, 
        SYNOPSYS_UNCONNECTED__42, SYNOPSYS_UNCONNECTED__43, 
        SYNOPSYS_UNCONNECTED__44, SYNOPSYS_UNCONNECTED__45, 
        SYNOPSYS_UNCONNECTED__46, SYNOPSYS_UNCONNECTED__47, 
        SYNOPSYS_UNCONNECTED__48, SYNOPSYS_UNCONNECTED__49, 
        SYNOPSYS_UNCONNECTED__50, SYNOPSYS_UNCONNECTED__51, 
        SYNOPSYS_UNCONNECTED__52, SYNOPSYS_UNCONNECTED__53, 
        SYNOPSYS_UNCONNECTED__54, SYNOPSYS_UNCONNECTED__55, 
        SYNOPSYS_UNCONNECTED__56, SYNOPSYS_UNCONNECTED__57, 
        SYNOPSYS_UNCONNECTED__58, SYNOPSYS_UNCONNECTED__59, 
        SYNOPSYS_UNCONNECTED__60, SYNOPSYS_UNCONNECTED__61, 
        SYNOPSYS_UNCONNECTED__62, SYNOPSYS_UNCONNECTED__63, 
        SYNOPSYS_UNCONNECTED__64, SYNOPSYS_UNCONNECTED__65, 
        SYNOPSYS_UNCONNECTED__66, SYNOPSYS_UNCONNECTED__67, 
        SYNOPSYS_UNCONNECTED__68, SYNOPSYS_UNCONNECTED__69, 
        SYNOPSYS_UNCONNECTED__70, SYNOPSYS_UNCONNECTED__71, 
        SYNOPSYS_UNCONNECTED__72, N244, N243, N242, N241, N240, N239, N238, 
        N237, N236, N235, N234, N233, N232, N231, N230, N229, N228, N227, N226, 
        N225, N224, N223, N222, N221, N220, N219, N218, N217, N216, N215, N214, 
        N213, N212, N211, N210, N209, N208, N207, N206, N205, N204, N203, N202, 
        N201, N200, N199, N198, N197, N196, N195, N194, N193, N192, N191, N190}) );
  FD4QM1P \start_seq_reg[5]  ( .D(next_start_seq[5]), .CP(clk), .SD(rst), .Q(
        start_seq[5]) );
  FD4QM1P \start_seq_reg[4]  ( .D(next_start_seq[4]), .CP(clk), .SD(rst), .Q(
        start_seq[4]) );
  FD4QM1P \start_seq_reg[3]  ( .D(next_start_seq[3]), .CP(clk), .SD(rst), .Q(
        start_seq[3]) );
  FD4QM1P \start_seq_reg[0]  ( .D(next_start_seq[0]), .CP(clk), .SD(rst), .Q(
        start_seq[0]) );
  FD4QM1P \start_seq_reg[2]  ( .D(next_start_seq[2]), .CP(clk), .SD(rst), .Q(
        start_seq[2]) );
  FD4QM1P \start_seq_reg[1]  ( .D(next_start_seq[1]), .CP(clk), .SD(rst), .Q(
        start_seq[1]) );
  FD4QM1P \counter_reg[1]  ( .D(next_counter[1]), .CP(clk), .SD(rst), .Q(
        counter[1]) );
  FD4QM1P \state_reg[0]  ( .D(next_state[0]), .CP(clk), .SD(rst), .Q(state[0])
         );
  FD4QM1P \counter_reg[5]  ( .D(next_counter[5]), .CP(clk), .SD(rst), .Q(
        counter[5]) );
  FD4QM1P \counter_reg[2]  ( .D(next_counter[2]), .CP(clk), .SD(rst), .Q(
        counter[2]) );
  FD4QM1P \counter_reg[4]  ( .D(next_counter[4]), .CP(clk), .SD(rst), .Q(
        counter[4]) );
  FD2QM1P \state_reg[2]  ( .D(next_state[2]), .CP(clk), .CD(rst), .Q(state[2])
         );
  FD2QM1P \state_reg[1]  ( .D(next_state[1]), .CP(clk), .CD(rst), .Q(state[1])
         );
  FD2QM1P \counter_reg[0]  ( .D(next_counter[0]), .CP(clk), .CD(rst), .Q(
        counter[0]) );
  FD2QM1P \counter_reg[3]  ( .D(next_counter[3]), .CP(clk), .CD(rst), .Q(
        counter[3]) );
  FD2QM1P \packet_reg[14]  ( .D(n244), .CP(clk), .CD(rst), .Q(packet[14]) );
  FD2QM1P \packet_reg[7]  ( .D(n251), .CP(clk), .CD(rst), .Q(packet[7]) );
  FD2QM1P \packet_reg[6]  ( .D(n252), .CP(clk), .CD(rst), .Q(packet[6]) );
  FD2QM1P \packet_reg[9]  ( .D(n249), .CP(clk), .CD(rst), .Q(packet[9]) );
  FD2QM1P \packet_reg[8]  ( .D(n250), .CP(clk), .CD(rst), .Q(packet[8]) );
  FD2QM1P \packet_reg[53]  ( .D(n205), .CP(clk), .CD(rst), .Q(packet[53]) );
  FD2QM1P \packet_reg[51]  ( .D(n207), .CP(clk), .CD(rst), .Q(packet[51]) );
  FD2QM1P \packet_reg[50]  ( .D(n208), .CP(clk), .CD(rst), .Q(packet[50]) );
  FD2QM1P \packet_reg[52]  ( .D(n206), .CP(clk), .CD(rst), .Q(packet[52]) );
  FD2QM1P \packet_reg[54]  ( .D(n204), .CP(clk), .CD(rst), .Q(packet[54]) );
  FD2QM1P \packet_reg[49]  ( .D(n209), .CP(clk), .CD(rst), .Q(packet[49]) );
  FD2QM1P \packet_reg[15]  ( .D(n243), .CP(clk), .CD(rst), .Q(packet[15]) );
  FD2QM1P \packet_reg[45]  ( .D(n213), .CP(clk), .CD(rst), .Q(packet[45]) );
  FD2QM1P \packet_reg[44]  ( .D(n214), .CP(clk), .CD(rst), .Q(packet[44]) );
  FD2QM1P \packet_reg[43]  ( .D(n215), .CP(clk), .CD(rst), .Q(packet[43]) );
  FD2QM1P \packet_reg[42]  ( .D(n216), .CP(clk), .CD(rst), .Q(packet[42]) );
  FD2QM1P \packet_reg[41]  ( .D(n217), .CP(clk), .CD(rst), .Q(packet[41]) );
  FD2QM1P \packet_reg[40]  ( .D(n218), .CP(clk), .CD(rst), .Q(packet[40]) );
  FD2QM1P \packet_reg[37]  ( .D(n221), .CP(clk), .CD(rst), .Q(packet[37]) );
  FD2QM1P \packet_reg[36]  ( .D(n222), .CP(clk), .CD(rst), .Q(packet[36]) );
  FD2QM1P \packet_reg[35]  ( .D(n223), .CP(clk), .CD(rst), .Q(packet[35]) );
  FD2QM1P \packet_reg[34]  ( .D(n224), .CP(clk), .CD(rst), .Q(packet[34]) );
  FD2QM1P \packet_reg[33]  ( .D(n225), .CP(clk), .CD(rst), .Q(packet[33]) );
  FD2QM1P \packet_reg[32]  ( .D(n226), .CP(clk), .CD(rst), .Q(packet[32]) );
  FD2QM1P \packet_reg[29]  ( .D(n229), .CP(clk), .CD(rst), .Q(packet[29]) );
  FD2QM1P \packet_reg[28]  ( .D(n230), .CP(clk), .CD(rst), .Q(packet[28]) );
  FD2QM1P \packet_reg[27]  ( .D(n231), .CP(clk), .CD(rst), .Q(packet[27]) );
  FD2QM1P \packet_reg[26]  ( .D(n232), .CP(clk), .CD(rst), .Q(packet[26]) );
  FD2QM1P \packet_reg[25]  ( .D(n233), .CP(clk), .CD(rst), .Q(packet[25]) );
  FD2QM1P \packet_reg[24]  ( .D(n234), .CP(clk), .CD(rst), .Q(packet[24]) );
  FD2QM1P \packet_reg[21]  ( .D(n237), .CP(clk), .CD(rst), .Q(packet[21]) );
  FD2QM1P \packet_reg[20]  ( .D(n238), .CP(clk), .CD(rst), .Q(packet[20]) );
  FD2QM1P \packet_reg[19]  ( .D(n239), .CP(clk), .CD(rst), .Q(packet[19]) );
  FD2QM1P \packet_reg[18]  ( .D(n240), .CP(clk), .CD(rst), .Q(packet[18]) );
  FD2QM1P \packet_reg[17]  ( .D(n241), .CP(clk), .CD(rst), .Q(packet[17]) );
  FD2QM1P \packet_reg[16]  ( .D(n242), .CP(clk), .CD(rst), .Q(packet[16]) );
  FD2QM1P \packet_reg[47]  ( .D(n211), .CP(clk), .CD(rst), .Q(packet[47]) );
  FD2QM1P \packet_reg[46]  ( .D(n212), .CP(clk), .CD(rst), .Q(packet[46]) );
  FD2QM1P \packet_reg[39]  ( .D(n219), .CP(clk), .CD(rst), .Q(packet[39]) );
  FD2QM1P \packet_reg[38]  ( .D(n220), .CP(clk), .CD(rst), .Q(packet[38]) );
  FD2QM1P \packet_reg[31]  ( .D(n227), .CP(clk), .CD(rst), .Q(packet[31]) );
  FD2QM1P \packet_reg[30]  ( .D(n228), .CP(clk), .CD(rst), .Q(packet[30]) );
  FD2QM1P \packet_reg[23]  ( .D(n235), .CP(clk), .CD(rst), .Q(packet[23]) );
  FD2QM1P \packet_reg[22]  ( .D(n236), .CP(clk), .CD(rst), .Q(packet[22]) );
  FD2QM1P \packet_reg[48]  ( .D(n210), .CP(clk), .CD(rst), .Q(packet[48]) );
  FD2QM1P \packet_reg[11]  ( .D(n247), .CP(clk), .CD(rst), .Q(packet[11]) );
  FD2QM1P \packet_reg[10]  ( .D(n248), .CP(clk), .CD(rst), .Q(packet[10]) );
  FD2QM1P \packet_reg[13]  ( .D(n245), .CP(clk), .CD(rst), .Q(packet[13]) );
  FD2QM1P \packet_reg[12]  ( .D(n246), .CP(clk), .CD(rst), .Q(packet[12]) );
  FD2QM1P \packet_reg[4]  ( .D(n254), .CP(clk), .CD(rst), .Q(packet[4]) );
  FD2QM1P \packet_reg[5]  ( .D(n253), .CP(clk), .CD(rst), .Q(packet[5]) );
  FD2QM1P \packet_reg[3]  ( .D(n255), .CP(clk), .CD(rst), .Q(packet[3]) );
  FD2QM1P \packet_reg[2]  ( .D(n256), .CP(clk), .CD(rst), .Q(packet[2]) );
  FD2QM1P \packet_reg[1]  ( .D(n257), .CP(clk), .CD(rst), .Q(packet[1]) );
  FD2QM1P \packet_reg[0]  ( .D(n258), .CP(clk), .CD(rst), .Q(packet[0]) );
  FD2QM1P \counter_reg[6]  ( .D(next_counter[6]), .CP(clk), .CD(rst), .Q(
        counter[6]) );
  NR2M1P U3 ( .A(n137), .B(n141), .Z(n202) );
  N1M1P U4 ( .A(state[1]), .Z(n17) );
  BUFM2P U5 ( .A(n145), .Z(n1) );
  N1M2P U6 ( .A(n5), .Z(n3) );
  NR3M1P U7 ( .A(state[0]), .B(state[2]), .C(n17), .Z(n139) );
  AND3M1P U8 ( .A(n142), .B(n143), .C(n144), .Z(n140) );
  NR2M1P U9 ( .A(counter[6]), .B(counter[5]), .Z(n143) );
  NR2M1P U10 ( .A(counter[4]), .B(counter[3]), .Z(n142) );
  N1M1P U11 ( .A(counter[4]), .Z(n11) );
  N1M2P U12 ( .A(n5), .Z(n4) );
  ND3M1P U13 ( .A(n17), .B(n73), .C(state[0]), .Z(n137) );
  N1M1P U14 ( .A(n139), .Z(n15) );
  ND4M1P U15 ( .A(start_seq[3]), .B(start_seq[2]), .C(start_seq[4]), .D(n203), 
        .Z(n141) );
  NR3M1P U16 ( .A(n74), .B(start_seq[5]), .C(n14), .Z(n203) );
  ND2M1P U17 ( .A(n137), .B(n140), .Z(n138) );
  N1M1P U18 ( .A(start_seq[0]), .Z(n14) );
  N1M1P U19 ( .A(start_seq[1]), .Z(n74) );
  N1M1P U20 ( .A(n137), .Z(n16) );
  N1M1P U21 ( .A(state[2]), .Z(n73) );
  AND2M1P U22 ( .A(N361), .B(next_state[1]), .Z(next_counter[6]) );
  OAI21M1P U23 ( .A(n45), .B(n2), .C(n200), .Z(n258) );
  OAI21M1P U24 ( .A(n45), .B(n4), .C(packet[0]), .Z(n200) );
  N1M1P U25 ( .A(N190), .Z(n45) );
  OAI21M1P U26 ( .A(n23), .B(n2), .C(n199), .Z(n257) );
  OAI21M1P U27 ( .A(n23), .B(n4), .C(packet[1]), .Z(n199) );
  N1M1P U28 ( .A(N191), .Z(n23) );
  OAI21M1P U29 ( .A(n50), .B(n2), .C(n198), .Z(n256) );
  OAI21M1P U30 ( .A(n50), .B(n4), .C(packet[2]), .Z(n198) );
  N1M1P U31 ( .A(N192), .Z(n50) );
  OAI21M1P U32 ( .A(n30), .B(n2), .C(n197), .Z(n255) );
  OAI21M1P U33 ( .A(n30), .B(n4), .C(packet[3]), .Z(n197) );
  N1M1P U34 ( .A(N193), .Z(n30) );
  OAI21M1P U35 ( .A(n31), .B(n2), .C(n195), .Z(n253) );
  OAI21M1P U36 ( .A(n31), .B(n4), .C(packet[5]), .Z(n195) );
  N1M1P U37 ( .A(N195), .Z(n31) );
  OAI21M1P U38 ( .A(n55), .B(n2), .C(n196), .Z(n254) );
  OAI21M1P U39 ( .A(n55), .B(n4), .C(packet[4]), .Z(n196) );
  N1M1P U40 ( .A(N194), .Z(n55) );
  OAI21M1P U41 ( .A(n58), .B(n2), .C(n188), .Z(n246) );
  OAI21M1P U42 ( .A(n58), .B(n4), .C(packet[12]), .Z(n188) );
  N1M1P U43 ( .A(N202), .Z(n58) );
  OAI21M1P U44 ( .A(n34), .B(n2), .C(n187), .Z(n245) );
  OAI21M1P U45 ( .A(n34), .B(n4), .C(packet[13]), .Z(n187) );
  N1M1P U46 ( .A(N203), .Z(n34) );
  OAI21M1P U47 ( .A(n57), .B(n2), .C(n190), .Z(n248) );
  OAI21M1P U48 ( .A(n57), .B(n4), .C(packet[10]), .Z(n190) );
  N1M1P U49 ( .A(N200), .Z(n57) );
  OAI21M1P U50 ( .A(n33), .B(n2), .C(n189), .Z(n247) );
  OAI21M1P U51 ( .A(n33), .B(n4), .C(packet[11]), .Z(n189) );
  N1M1P U52 ( .A(N201), .Z(n33) );
  OAI21M1P U53 ( .A(n69), .B(n2), .C(n152), .Z(n210) );
  OAI21M1P U54 ( .A(n69), .B(n3), .C(packet[48]), .Z(n152) );
  N1M1P U55 ( .A(N238), .Z(n69) );
  OAI21M1P U56 ( .A(n49), .B(n1), .C(n178), .Z(n236) );
  OAI21M1P U57 ( .A(n49), .B(n4), .C(packet[22]), .Z(n178) );
  N1M1P U58 ( .A(N212), .Z(n49) );
  OAI21M1P U59 ( .A(n25), .B(n1), .C(n177), .Z(n235) );
  OAI21M1P U60 ( .A(n25), .B(n4), .C(packet[23]), .Z(n177) );
  N1M1P U61 ( .A(N213), .Z(n25) );
  OAI21M1P U62 ( .A(n63), .B(n1), .C(n170), .Z(n228) );
  OAI21M1P U63 ( .A(n63), .B(n4), .C(packet[30]), .Z(n170) );
  N1M1P U64 ( .A(N220), .Z(n63) );
  OAI21M1P U65 ( .A(n39), .B(n1), .C(n169), .Z(n227) );
  OAI21M1P U66 ( .A(n39), .B(n4), .C(packet[31]), .Z(n169) );
  N1M1P U67 ( .A(N221), .Z(n39) );
  OAI21M1P U68 ( .A(n54), .B(n1), .C(n162), .Z(n220) );
  OAI21M1P U69 ( .A(n54), .B(n3), .C(packet[38]), .Z(n162) );
  N1M1P U70 ( .A(N228), .Z(n54) );
  OAI21M1P U71 ( .A(n29), .B(n1), .C(n161), .Z(n219) );
  OAI21M1P U72 ( .A(n29), .B(n3), .C(packet[39]), .Z(n161) );
  N1M1P U73 ( .A(N229), .Z(n29) );
  OAI21M1P U74 ( .A(n67), .B(n2), .C(n154), .Z(n212) );
  OAI21M1P U75 ( .A(n67), .B(n3), .C(packet[46]), .Z(n154) );
  N1M1P U76 ( .A(N236), .Z(n67) );
  OAI21M1P U77 ( .A(n43), .B(n2), .C(n153), .Z(n211) );
  OAI21M1P U78 ( .A(n43), .B(n3), .C(packet[47]), .Z(n153) );
  N1M1P U79 ( .A(N237), .Z(n43) );
  OAI21M1P U80 ( .A(n46), .B(n2), .C(n184), .Z(n242) );
  OAI21M1P U81 ( .A(n46), .B(n3), .C(packet[16]), .Z(n184) );
  N1M1P U82 ( .A(N206), .Z(n46) );
  OAI21M1P U83 ( .A(n21), .B(n2), .C(n183), .Z(n241) );
  OAI21M1P U84 ( .A(n21), .B(n4), .C(packet[17]), .Z(n183) );
  N1M1P U85 ( .A(N207), .Z(n21) );
  OAI21M1P U86 ( .A(n47), .B(n1), .C(n182), .Z(n240) );
  OAI21M1P U87 ( .A(n47), .B(n3), .C(packet[18]), .Z(n182) );
  N1M1P U88 ( .A(N208), .Z(n47) );
  OAI21M1P U89 ( .A(n22), .B(n1), .C(n181), .Z(n239) );
  OAI21M1P U90 ( .A(n22), .B(n4), .C(packet[19]), .Z(n181) );
  N1M1P U91 ( .A(N209), .Z(n22) );
  OAI21M1P U92 ( .A(n48), .B(n1), .C(n180), .Z(n238) );
  OAI21M1P U93 ( .A(n48), .B(n3), .C(packet[20]), .Z(n180) );
  N1M1P U94 ( .A(N210), .Z(n48) );
  OAI21M1P U95 ( .A(n24), .B(n1), .C(n179), .Z(n237) );
  OAI21M1P U96 ( .A(n24), .B(next_state[0]), .C(packet[21]), .Z(n179) );
  N1M1P U97 ( .A(N211), .Z(n24) );
  OAI21M1P U98 ( .A(n60), .B(n1), .C(n176), .Z(n234) );
  OAI21M1P U99 ( .A(n60), .B(next_state[0]), .C(packet[24]), .Z(n176) );
  N1M1P U100 ( .A(N214), .Z(n60) );
  OAI21M1P U101 ( .A(n36), .B(n1), .C(n175), .Z(n233) );
  OAI21M1P U102 ( .A(n36), .B(next_state[0]), .C(packet[25]), .Z(n175) );
  N1M1P U103 ( .A(N215), .Z(n36) );
  OAI21M1P U104 ( .A(n61), .B(n1), .C(n174), .Z(n232) );
  OAI21M1P U105 ( .A(n61), .B(next_state[0]), .C(packet[26]), .Z(n174) );
  N1M1P U106 ( .A(N216), .Z(n61) );
  OAI21M1P U107 ( .A(n37), .B(n1), .C(n173), .Z(n231) );
  OAI21M1P U108 ( .A(n37), .B(n4), .C(packet[27]), .Z(n173) );
  N1M1P U109 ( .A(N217), .Z(n37) );
  OAI21M1P U110 ( .A(n62), .B(n1), .C(n172), .Z(n230) );
  OAI21M1P U111 ( .A(n62), .B(n3), .C(packet[28]), .Z(n172) );
  N1M1P U112 ( .A(N218), .Z(n62) );
  OAI21M1P U113 ( .A(n38), .B(n1), .C(n171), .Z(n229) );
  OAI21M1P U114 ( .A(n38), .B(n4), .C(packet[29]), .Z(n171) );
  N1M1P U115 ( .A(N219), .Z(n38) );
  OAI21M1P U116 ( .A(n51), .B(n1), .C(n168), .Z(n226) );
  OAI21M1P U117 ( .A(n51), .B(n3), .C(packet[32]), .Z(n168) );
  N1M1P U118 ( .A(N222), .Z(n51) );
  OAI21M1P U119 ( .A(n26), .B(n1), .C(n167), .Z(n225) );
  OAI21M1P U120 ( .A(n26), .B(n4), .C(packet[33]), .Z(n167) );
  N1M1P U121 ( .A(N223), .Z(n26) );
  OAI21M1P U122 ( .A(n52), .B(n1), .C(n166), .Z(n224) );
  OAI21M1P U123 ( .A(n52), .B(n3), .C(packet[34]), .Z(n166) );
  N1M1P U124 ( .A(N224), .Z(n52) );
  OAI21M1P U125 ( .A(n27), .B(n1), .C(n165), .Z(n223) );
  OAI21M1P U126 ( .A(n27), .B(n3), .C(packet[35]), .Z(n165) );
  N1M1P U127 ( .A(N225), .Z(n27) );
  OAI21M1P U128 ( .A(n53), .B(n1), .C(n164), .Z(n222) );
  OAI21M1P U129 ( .A(n53), .B(n3), .C(packet[36]), .Z(n164) );
  N1M1P U130 ( .A(N226), .Z(n53) );
  OAI21M1P U131 ( .A(n28), .B(n1), .C(n163), .Z(n221) );
  OAI21M1P U132 ( .A(n28), .B(n3), .C(packet[37]), .Z(n163) );
  N1M1P U133 ( .A(N227), .Z(n28) );
  OAI21M1P U134 ( .A(n64), .B(n2), .C(n160), .Z(n218) );
  OAI21M1P U135 ( .A(n64), .B(n3), .C(packet[40]), .Z(n160) );
  N1M1P U136 ( .A(N230), .Z(n64) );
  OAI21M1P U137 ( .A(n40), .B(n2), .C(n159), .Z(n217) );
  OAI21M1P U138 ( .A(n40), .B(n3), .C(packet[41]), .Z(n159) );
  N1M1P U139 ( .A(N231), .Z(n40) );
  OAI21M1P U140 ( .A(n65), .B(n2), .C(n158), .Z(n216) );
  OAI21M1P U141 ( .A(n65), .B(n4), .C(packet[42]), .Z(n158) );
  N1M1P U142 ( .A(N232), .Z(n65) );
  OAI21M1P U143 ( .A(n41), .B(n2), .C(n157), .Z(n215) );
  OAI21M1P U144 ( .A(n41), .B(n3), .C(packet[43]), .Z(n157) );
  N1M1P U145 ( .A(N233), .Z(n41) );
  OAI21M1P U146 ( .A(n66), .B(n2), .C(n156), .Z(n214) );
  OAI21M1P U147 ( .A(n66), .B(n3), .C(packet[44]), .Z(n156) );
  N1M1P U148 ( .A(N234), .Z(n66) );
  OAI21M1P U149 ( .A(n42), .B(n2), .C(n155), .Z(n213) );
  OAI21M1P U150 ( .A(n42), .B(n3), .C(packet[45]), .Z(n155) );
  N1M1P U151 ( .A(N235), .Z(n42) );
  OAI21M1P U152 ( .A(n35), .B(n2), .C(n185), .Z(n243) );
  OAI21M1P U153 ( .A(n35), .B(n3), .C(packet[15]), .Z(n185) );
  N1M1P U154 ( .A(N205), .Z(n35) );
  OAI21M1P U155 ( .A(n18), .B(n2), .C(n151), .Z(n209) );
  OAI21M1P U156 ( .A(n18), .B(n3), .C(packet[49]), .Z(n151) );
  N1M1P U157 ( .A(N239), .Z(n18) );
  OAI21M1P U158 ( .A(n72), .B(n2), .C(n146), .Z(n204) );
  OAI21M1P U159 ( .A(n72), .B(n3), .C(packet[54]), .Z(n146) );
  N1M1P U160 ( .A(N244), .Z(n72) );
  OAI21M1P U161 ( .A(n71), .B(n2), .C(n148), .Z(n206) );
  OAI21M1P U162 ( .A(n71), .B(n3), .C(packet[52]), .Z(n148) );
  N1M1P U163 ( .A(N242), .Z(n71) );
  OAI21M1P U164 ( .A(n70), .B(n2), .C(n150), .Z(n208) );
  OAI21M1P U165 ( .A(n70), .B(n3), .C(packet[50]), .Z(n150) );
  N1M1P U166 ( .A(N240), .Z(n70) );
  OAI21M1P U167 ( .A(n19), .B(n2), .C(n149), .Z(n207) );
  OAI21M1P U168 ( .A(n19), .B(n3), .C(packet[51]), .Z(n149) );
  N1M1P U169 ( .A(N241), .Z(n19) );
  OAI21M1P U170 ( .A(n20), .B(n2), .C(n147), .Z(n205) );
  OAI21M1P U171 ( .A(n20), .B(n3), .C(packet[53]), .Z(n147) );
  N1M1P U172 ( .A(N243), .Z(n20) );
  OAI21M1P U173 ( .A(n68), .B(n2), .C(n192), .Z(n250) );
  OAI21M1P U174 ( .A(n68), .B(n4), .C(packet[8]), .Z(n192) );
  N1M1P U175 ( .A(N198), .Z(n68) );
  OAI21M1P U176 ( .A(n44), .B(n2), .C(n191), .Z(n249) );
  OAI21M1P U177 ( .A(n44), .B(n4), .C(packet[9]), .Z(n191) );
  N1M1P U178 ( .A(N199), .Z(n44) );
  OAI21M1P U179 ( .A(n56), .B(n145), .C(n194), .Z(n252) );
  OAI21M1P U180 ( .A(n56), .B(n4), .C(packet[6]), .Z(n194) );
  N1M1P U181 ( .A(N196), .Z(n56) );
  OAI21M1P U182 ( .A(n32), .B(n145), .C(n193), .Z(n251) );
  OAI21M1P U183 ( .A(n32), .B(n4), .C(packet[7]), .Z(n193) );
  N1M1P U184 ( .A(N197), .Z(n32) );
  OAI21M1P U185 ( .A(n59), .B(n145), .C(n186), .Z(n244) );
  OAI21M1P U186 ( .A(n59), .B(n4), .C(packet[14]), .Z(n186) );
  N1M1P U187 ( .A(N204), .Z(n59) );
  AND2M1P U188 ( .A(N358), .B(next_state[1]), .Z(next_counter[3]) );
  AND2M1P U189 ( .A(n12), .B(next_state[1]), .Z(next_counter[0]) );
  OAI22M1P U190 ( .A(n137), .B(n141), .C(n140), .D(n15), .Z(next_state[1]) );
  AND2M1P U191 ( .A(n139), .B(n140), .Z(next_state[2]) );
  N1M1P U192 ( .A(n141), .Z(n13) );
  ND2M1P U193 ( .A(n137), .B(n15), .Z(n201) );
  ND2M1P U194 ( .A(n16), .B(n14), .Z(next_start_seq[1]) );
  ND2M1P U195 ( .A(n16), .B(n74), .Z(next_start_seq[2]) );
  ND2BNM1P U196 ( .B(S_Data), .A(n16), .Z(next_start_seq[0]) );
  ND2BNM1P U197 ( .B(start_seq[2]), .A(n16), .Z(next_start_seq[3]) );
  ND2BNM1P U198 ( .B(start_seq[3]), .A(n16), .Z(next_start_seq[4]) );
  ND2BNM1P U199 ( .B(start_seq[4]), .A(n16), .Z(next_start_seq[5]) );
  NR3M1P U200 ( .A(n73), .B(state[1]), .C(state[0]), .Z(ready) );
  OAI21M1P U205 ( .A(n202), .B(n139), .C(S_Data), .Z(n145) );
  N1M1P U206 ( .A(next_state[0]), .Z(n5) );
  OAI21M1P U207 ( .A(n13), .B(n137), .C(n201), .Z(next_state[0]) );
  BUFM2P U208 ( .A(n145), .Z(n2) );
  NR3M1P U209 ( .A(counter[0]), .B(counter[2]), .C(counter[1]), .Z(n144) );
  N1M1P U210 ( .A(counter[0]), .Z(n12) );
  ND2BNM1P U211 ( .B(counter[1]), .A(n12), .Z(n6) );
  AO21CNM1P U212 ( .A(counter[0]), .B(counter[1]), .C(n6), .Z(N356) );
  OR2M1P U213 ( .A(n6), .B(counter[2]), .Z(n7) );
  AO21CNM1P U214 ( .A(n6), .B(counter[2]), .C(n7), .Z(N357) );
  NR2M1P U215 ( .A(n7), .B(counter[3]), .Z(n8) );
  AO21M1P U216 ( .A(n7), .B(counter[3]), .C(n8), .Z(N358) );
  ND2M1P U217 ( .A(n8), .B(n11), .Z(n9) );
  OAI21M1P U218 ( .A(n8), .B(n11), .C(n9), .Z(N359) );
  ENFM1P U219 ( .A(counter[5]), .B(n9), .Z(N360) );
  NR2M1P U220 ( .A(counter[5]), .B(n9), .Z(n10) );
  EOFM1P U221 ( .A(counter[6]), .B(n10), .Z(N361) );
endmodule


module receiver ( RX_Ready, Clk_S, Rst_n, S_Data, RX_Data_Valid, RX_Data );
  output [54:0] RX_Data;
  input RX_Ready, Clk_S, Rst_n, S_Data;
  output RX_Data_Valid;
  wire   good_data, \state[0] , n2, n3;
  wire   [1:0] nextState;

  OA21M1P U6 ( .A(\state[0] ), .B(RX_Data_Valid), .C(RX_Ready), .Z(
        nextState[1]) );
  receive_protocol rx_side ( .S_Data(S_Data), .clk(Clk_S), .rst(Rst_n), 
        .packet(RX_Data), .ready(good_data) );
  FD2QM1P \state_reg[1]  ( .D(nextState[1]), .CP(Clk_S), .CD(Rst_n), .Q(
        RX_Data_Valid) );
  FD2QM1P \state_reg[0]  ( .D(nextState[0]), .CP(Clk_S), .CD(Rst_n), .Q(
        \state[0] ) );
  OAI21M1P U7 ( .A(RX_Data_Valid), .B(n3), .C(n2), .Z(nextState[0]) );
  AOI22M1P U8 ( .A(RX_Ready), .B(RX_Data_Valid), .C(good_data), .D(n3), .Z(n2)
         );
  N1M1P U9 ( .A(\state[0] ), .Z(n3) );
endmodule

