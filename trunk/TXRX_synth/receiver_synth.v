
module receive_protocol_DW01_decode_1 ( A, B );
  input [6:0] A;
  output [127:0] B;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42;

  ND2FM4P U2 ( .A(n29), .B(n30), .Z(n25) );
  N1M6P U3 ( .A(n33), .Z(n29) );
  ND2BNM2P U4 ( .B(A[1]), .A(A[2]), .Z(n15) );
  NR2M2P U5 ( .A(n12), .B(n28), .Z(B[2]) );
  N1M4P U6 ( .A(n40), .Z(n39) );
  ND2M2P U7 ( .A(n41), .B(A[4]), .Z(n40) );
  ND2M2P U8 ( .A(n30), .B(n4), .Z(n1) );
  ND2M2P U9 ( .A(n30), .B(n4), .Z(n2) );
  BUFM2P U10 ( .A(n15), .Z(n6) );
  ND2BNM4P U11 ( .B(A[3]), .A(A[0]), .Z(n11) );
  ND2BNM4P U12 ( .B(A[0]), .A(n20), .Z(n14) );
  ND2BNM3P U13 ( .B(n13), .A(n29), .Z(n24) );
  ND2BNM4P U14 ( .B(n19), .A(n20), .Z(n16) );
  N1M3P U15 ( .A(n21), .Z(n20) );
  ND2BNM2P U16 ( .B(n18), .A(n4), .Z(n5) );
  OR2M10P U17 ( .A(A[2]), .B(A[1]), .Z(n18) );
  OR2M8P U18 ( .A(A[3]), .B(A[0]), .Z(n12) );
  ND2M3P U19 ( .A(n39), .B(n32), .Z(n38) );
  BUFM2P U20 ( .A(n17), .Z(n3) );
  BUFM10P U21 ( .A(n42), .Z(n4) );
  ND2M4P U22 ( .A(n29), .B(n32), .Z(n27) );
  N1M4P U23 ( .A(n18), .Z(n32) );
  ND2FM3P U24 ( .A(n39), .B(n30), .Z(n36) );
  ND2BNM3P U25 ( .B(n17), .A(n4), .Z(n28) );
  ND2BNM4P U26 ( .B(n13), .A(n4), .Z(n10) );
  NR3M8P U27 ( .A(A[6]), .B(A[4]), .C(A[5]), .Z(n42) );
  ND2FM4P U28 ( .A(n29), .B(n31), .Z(n26) );
  NR2FM2P U29 ( .A(A[6]), .B(A[5]), .Z(n41) );
  ND2M2P U30 ( .A(n34), .B(A[5]), .Z(n33) );
  N1M4P U31 ( .A(n15), .Z(n30) );
  ND2I1M8P U32 ( .A(A[3]), .B(A[0]), .Z(n8) );
  ND2BNM6P U33 ( .B(A[0]), .A(A[3]), .Z(n9) );
  ND2M4P U34 ( .A(n39), .B(n31), .Z(n37) );
  N1M2P U35 ( .A(n17), .Z(n31) );
  ND2BNM4P U36 ( .B(n13), .A(n39), .Z(n35) );
  N1M1P U37 ( .A(A[0]), .Z(n19) );
  NR2FM1P U38 ( .A(n7), .B(n8), .Z(B[9]) );
  NR2FM1P U39 ( .A(n5), .B(n9), .Z(B[8]) );
  NR2FM1P U40 ( .A(n10), .B(n11), .Z(B[7]) );
  NR2FM1P U41 ( .A(n10), .B(n12), .Z(B[6]) );
  NR2FM1P U42 ( .A(n11), .B(n1), .Z(B[5]) );
  NR2FM1P U43 ( .A(n13), .B(n14), .Z(B[54]) );
  NR2FM1P U44 ( .A(n6), .B(n16), .Z(B[53]) );
  NR2FM1P U45 ( .A(n6), .B(n14), .Z(B[52]) );
  NR2FM1P U46 ( .A(n16), .B(n3), .Z(B[51]) );
  NR2FM1P U47 ( .A(n14), .B(n3), .Z(B[50]) );
  NR2FM1P U48 ( .A(n12), .B(n2), .Z(B[4]) );
  NR2FM1P U49 ( .A(n18), .B(n16), .Z(B[49]) );
  NR2FM1P U50 ( .A(n18), .B(n14), .Z(B[48]) );
  ND2M2P U51 ( .A(n22), .B(n23), .Z(n21) );
  NR2FM1P U52 ( .A(A[6]), .B(A[3]), .Z(n23) );
  AND2M2P U53 ( .A(A[5]), .B(A[4]), .Z(n22) );
  NR2FM1P U54 ( .A(n8), .B(n24), .Z(B[47]) );
  NR2FM1P U55 ( .A(n9), .B(n24), .Z(B[46]) );
  NR2FM1P U56 ( .A(n8), .B(n25), .Z(B[45]) );
  NR2FM1P U57 ( .A(n9), .B(n25), .Z(B[44]) );
  NR2FM1P U58 ( .A(n8), .B(n26), .Z(B[43]) );
  NR2FM1P U59 ( .A(n9), .B(n26), .Z(B[42]) );
  NR2FM1P U60 ( .A(n8), .B(n27), .Z(B[41]) );
  NR2FM1P U61 ( .A(n9), .B(n27), .Z(B[40]) );
  NR2FM1P U62 ( .A(n11), .B(n28), .Z(B[3]) );
  NR2FM1P U63 ( .A(n11), .B(n24), .Z(B[39]) );
  NR2FM1P U64 ( .A(n12), .B(n24), .Z(B[38]) );
  NR2FM1P U65 ( .A(n25), .B(n11), .Z(B[37]) );
  NR2FM1P U66 ( .A(n25), .B(n12), .Z(B[36]) );
  NR2FM1P U67 ( .A(n11), .B(n26), .Z(B[35]) );
  NR2FM1P U68 ( .A(n12), .B(n26), .Z(B[34]) );
  NR2FM1P U69 ( .A(n11), .B(n27), .Z(B[33]) );
  NR2FM1P U70 ( .A(n12), .B(n27), .Z(B[32]) );
  NR2FM1P U71 ( .A(A[6]), .B(A[4]), .Z(n34) );
  NR2FM1P U72 ( .A(n8), .B(n35), .Z(B[31]) );
  NR2FM1P U73 ( .A(n9), .B(n35), .Z(B[30]) );
  NR2FM1P U74 ( .A(n8), .B(n36), .Z(B[29]) );
  NR2FM1P U75 ( .A(n9), .B(n36), .Z(B[28]) );
  NR2FM1P U76 ( .A(n8), .B(n37), .Z(B[27]) );
  NR2FM1P U77 ( .A(n9), .B(n37), .Z(B[26]) );
  NR2FM1P U78 ( .A(n8), .B(n38), .Z(B[25]) );
  NR2FM1P U79 ( .A(n9), .B(n38), .Z(B[24]) );
  NR2FM1P U80 ( .A(n11), .B(n35), .Z(B[23]) );
  NR2FM1P U81 ( .A(n12), .B(n35), .Z(B[22]) );
  NR2FM1P U82 ( .A(n11), .B(n36), .Z(B[21]) );
  NR2FM1P U83 ( .A(n12), .B(n36), .Z(B[20]) );
  NR2FM1P U84 ( .A(n5), .B(n11), .Z(B[1]) );
  NR2FM1P U85 ( .A(n11), .B(n37), .Z(B[19]) );
  NR2FM1P U86 ( .A(n12), .B(n37), .Z(B[18]) );
  NR2FM1P U87 ( .A(n11), .B(n38), .Z(B[17]) );
  NR2FM1P U88 ( .A(n12), .B(n38), .Z(B[16]) );
  NR2FM1P U89 ( .A(n8), .B(n10), .Z(B[15]) );
  NR2FM1P U90 ( .A(n9), .B(n10), .Z(B[14]) );
  ND2M2P U91 ( .A(A[2]), .B(A[1]), .Z(n13) );
  NR2FM1P U92 ( .A(n8), .B(n1), .Z(B[13]) );
  NR2FM1P U93 ( .A(n9), .B(n2), .Z(B[12]) );
  NR2FM1P U94 ( .A(n8), .B(n28), .Z(B[11]) );
  NR2FM1P U95 ( .A(n9), .B(n28), .Z(B[10]) );
  ND2BNM2P U96 ( .B(A[2]), .A(A[1]), .Z(n17) );
  NR2FM1P U97 ( .A(n7), .B(n12), .Z(B[0]) );
  ND2BNM2P U98 ( .B(n18), .A(n4), .Z(n7) );
endmodule


module receive_protocol_synth ( S_Data, clk, rst, packet, ready );
  output [54:0] packet;
  input S_Data, clk, rst;
  output ready;
  wire   N190, N191, N192, N193, N194, N195, N196, N197, N198, N199, N200,
         N201, N202, N203, N204, N205, N206, N207, N208, N209, N210, N211,
         N212, N213, N214, N215, N216, N217, N218, N219, N220, N221, N222,
         N223, N224, N225, N226, N227, N228, N229, N230, N231, N232, N233,
         N234, N235, N236, N237, N238, N239, N240, N241, N242, N243, N244,
         n204, n205, n206, n207, n208, n209, n210, n211, n212, n213, n214,
         n215, n216, n217, n218, n219, n220, n221, n222, n223, n224, n225,
         n226, n227, n228, n229, n230, n231, n232, n233, n234, n235, n236,
         n237, n238, n239, n240, n241, n242, n243, n244, n245, n246, n247,
         n248, n249, n250, n251, n252, n253, n254, n255, n256, n257, n258, n1,
         n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163, n164, n165, n166,
         n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n177,
         n178, n179, n180, n181, n182, n183, n184, n185, n186, n187, n188,
         n189, n190, n191, n192, n193, n194, n195, n196, n197, n198, n199,
         n200, n201, n202, n203, n259, n260, n261, n262, n263, n264, n265,
         n266, n267, n268, n269, n270, n271, n272, n273, n274, n275, n276,
         n277, n278, n279, n280, n281, n282, n283, n284, n285, n286, n287,
         n288, n289, n290, n291, n292;
  wire   [2:0] state;
  wire   [5:0] start_seq;
  wire   [6:0] counter;
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

  FD2QM8P \counter_reg[0]  ( .D(next_counter[0]), .CP(clk), .CD(rst), .Q(
        counter[0]) );
  FD2QM8P \counter_reg[3]  ( .D(next_counter[3]), .CP(clk), .CD(rst), .Q(
        counter[3]) );
  FD2QM8P \counter_reg[6]  ( .D(next_counter[6]), .CP(clk), .CD(rst), .Q(
        counter[6]) );
  FD2QM8P \packet_reg[51]  ( .D(n207), .CP(clk), .CD(rst), .Q(packet[51]) );
  FD2QM8P \packet_reg[48]  ( .D(n210), .CP(clk), .CD(rst), .Q(packet[48]) );
  FD2QM8P \packet_reg[44]  ( .D(n214), .CP(clk), .CD(rst), .Q(packet[44]) );
  FD2QM8P \packet_reg[35]  ( .D(n223), .CP(clk), .CD(rst), .Q(packet[35]) );
  FD2QM8P \packet_reg[34]  ( .D(n224), .CP(clk), .CD(rst), .Q(packet[34]) );
  FD2QM8P \packet_reg[32]  ( .D(n226), .CP(clk), .CD(rst), .Q(packet[32]) );
  FD2QM8P \packet_reg[31]  ( .D(n227), .CP(clk), .CD(rst), .Q(packet[31]) );
  FD2QM8P \packet_reg[26]  ( .D(n232), .CP(clk), .CD(rst), .Q(packet[26]) );
  FD2QM8P \packet_reg[16]  ( .D(n242), .CP(clk), .CD(rst), .Q(packet[16]) );
  FD2QM8P \packet_reg[10]  ( .D(n248), .CP(clk), .CD(rst), .Q(packet[10]) );
  FD2QM8P \packet_reg[8]  ( .D(n250), .CP(clk), .CD(rst), .Q(packet[8]) );
  receive_protocol_DW01_decode_1 r228 ( .A(counter), .B({
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
  FD4QM8P \counter_reg[1]  ( .D(next_counter[1]), .CP(clk), .SD(rst), .Q(
        counter[1]) );
  FD4QM8P \state_reg[0]  ( .D(n21), .CP(clk), .SD(rst), .Q(state[0]) );
  FD4QM8P \counter_reg[2]  ( .D(n291), .CP(clk), .SD(rst), .Q(counter[2]) );
  FD4QM8P \counter_reg[4]  ( .D(n292), .CP(clk), .SD(rst), .Q(counter[4]) );
  FD4QM8P \counter_reg[5]  ( .D(next_counter[5]), .CP(clk), .SD(rst), .Q(
        counter[5]) );
  FD4QM8P \start_seq_reg[5]  ( .D(next_start_seq[5]), .CP(clk), .SD(rst), .Q(
        start_seq[5]) );
  FD4QM8P \start_seq_reg[0]  ( .D(next_start_seq[0]), .CP(clk), .SD(rst), .Q(
        start_seq[0]) );
  FD2QM3P \state_reg[1]  ( .D(n11), .CP(clk), .CD(rst), .Q(state[1]) );
  FD2QM3P \packet_reg[2]  ( .D(n256), .CP(clk), .CD(rst), .Q(packet[2]) );
  FD2QM3P \packet_reg[54]  ( .D(n204), .CP(clk), .CD(rst), .Q(packet[54]) );
  FD2QM3P \packet_reg[53]  ( .D(n205), .CP(clk), .CD(rst), .Q(packet[53]) );
  FD2QM3P \packet_reg[50]  ( .D(n208), .CP(clk), .CD(rst), .Q(packet[50]) );
  FD2QM3P \packet_reg[49]  ( .D(n209), .CP(clk), .CD(rst), .Q(packet[49]) );
  FD2QM3P \packet_reg[46]  ( .D(n212), .CP(clk), .CD(rst), .Q(packet[46]) );
  FD2QM3P \packet_reg[45]  ( .D(n213), .CP(clk), .CD(rst), .Q(packet[45]) );
  FD2QM3P \packet_reg[43]  ( .D(n215), .CP(clk), .CD(rst), .Q(packet[43]) );
  FD2QM3P \packet_reg[42]  ( .D(n216), .CP(clk), .CD(rst), .Q(packet[42]) );
  FD2QM3P \packet_reg[41]  ( .D(n217), .CP(clk), .CD(rst), .Q(packet[41]) );
  FD2QM3P \packet_reg[40]  ( .D(n218), .CP(clk), .CD(rst), .Q(packet[40]) );
  FD2QM3P \packet_reg[38]  ( .D(n220), .CP(clk), .CD(rst), .Q(packet[38]) );
  FD2QM3P \packet_reg[37]  ( .D(n221), .CP(clk), .CD(rst), .Q(packet[37]) );
  FD2QM3P \packet_reg[36]  ( .D(n222), .CP(clk), .CD(rst), .Q(packet[36]) );
  FD2QM3P \packet_reg[30]  ( .D(n228), .CP(clk), .CD(rst), .Q(packet[30]) );
  FD2QM3P \packet_reg[24]  ( .D(n234), .CP(clk), .CD(rst), .Q(packet[24]) );
  FD2QM3P \packet_reg[23]  ( .D(n235), .CP(clk), .CD(rst), .Q(packet[23]) );
  FD2QM3P \packet_reg[22]  ( .D(n236), .CP(clk), .CD(rst), .Q(packet[22]) );
  FD2QM3P \packet_reg[20]  ( .D(n238), .CP(clk), .CD(rst), .Q(packet[20]) );
  FD2QM3P \packet_reg[19]  ( .D(n239), .CP(clk), .CD(rst), .Q(packet[19]) );
  FD2QM3P \packet_reg[18]  ( .D(n240), .CP(clk), .CD(rst), .Q(packet[18]) );
  FD2QM3P \packet_reg[17]  ( .D(n241), .CP(clk), .CD(rst), .Q(packet[17]) );
  FD2QM3P \packet_reg[13]  ( .D(n245), .CP(clk), .CD(rst), .Q(packet[13]) );
  FD2QM3P \packet_reg[12]  ( .D(n246), .CP(clk), .CD(rst), .Q(packet[12]) );
  FD2QM3P \packet_reg[9]  ( .D(n249), .CP(clk), .CD(rst), .Q(packet[9]) );
  FD2QM3P \packet_reg[7]  ( .D(n251), .CP(clk), .CD(rst), .Q(packet[7]) );
  FD2QM3P \packet_reg[6]  ( .D(n252), .CP(clk), .CD(rst), .Q(packet[6]) );
  FD2QM3P \packet_reg[1]  ( .D(n257), .CP(clk), .CD(rst), .Q(packet[1]) );
  FD2QM3P \packet_reg[14]  ( .D(n244), .CP(clk), .CD(rst), .Q(packet[14]) );
  FD2QM3P \packet_reg[0]  ( .D(n258), .CP(clk), .CD(rst), .Q(packet[0]) );
  FD4QM8P \start_seq_reg[2]  ( .D(next_start_seq[2]), .CP(clk), .SD(rst), .Q(
        start_seq[2]) );
  FD2QM3P \state_reg[2]  ( .D(n290), .CP(clk), .CD(rst), .Q(state[2]) );
  FD4QM8P \start_seq_reg[1]  ( .D(next_start_seq[1]), .CP(clk), .SD(rst), .Q(
        start_seq[1]) );
  FD4QM8P \start_seq_reg[3]  ( .D(next_start_seq[3]), .CP(clk), .SD(rst), .Q(
        start_seq[3]) );
  FD2QM1P \packet_reg[29]  ( .D(n229), .CP(clk), .CD(rst), .Q(packet[29]) );
  FD2QM1P \packet_reg[27]  ( .D(n231), .CP(clk), .CD(rst), .Q(packet[27]) );
  FD2QM1P \packet_reg[47]  ( .D(n211), .CP(clk), .CD(rst), .Q(packet[47]) );
  FD2QM1P \packet_reg[4]  ( .D(n254), .CP(clk), .CD(rst), .Q(packet[4]) );
  FD4QM8P \start_seq_reg[4]  ( .D(next_start_seq[4]), .CP(clk), .SD(rst), .Q(
        start_seq[4]) );
  FD2QM1P \packet_reg[5]  ( .D(n253), .CP(clk), .CD(rst), .Q(packet[5]) );
  FD2QM1P \packet_reg[3]  ( .D(n255), .CP(clk), .CD(rst), .Q(packet[3]) );
  FD2QM1P \packet_reg[33]  ( .D(n225), .CP(clk), .CD(rst), .Q(packet[33]) );
  FD2QM1P \packet_reg[21]  ( .D(n237), .CP(clk), .CD(rst), .Q(packet[21]) );
  FD2QM1P \packet_reg[25]  ( .D(n233), .CP(clk), .CD(rst), .Q(packet[25]) );
  FD2QM1P \packet_reg[11]  ( .D(n247), .CP(clk), .CD(rst), .Q(packet[11]) );
  FD2QM1P \packet_reg[15]  ( .D(n243), .CP(clk), .CD(rst), .Q(packet[15]) );
  FD2QM3P \packet_reg[39]  ( .D(n219), .CP(clk), .CD(rst), .Q(packet[39]) );
  FD2QM3P \packet_reg[52]  ( .D(n206), .CP(clk), .CD(rst), .Q(packet[52]) );
  FD2QM3P \packet_reg[28]  ( .D(n230), .CP(clk), .CD(rst), .Q(packet[28]) );
  ND2M1P U3 ( .A(n203), .B(n14), .Z(n200) );
  OAI21M3P U4 ( .A(n202), .B(n201), .C(n200), .Z(n11) );
  OAI21M1P U5 ( .A(n106), .B(n105), .C(n104), .Z(n233) );
  OAI21M1P U6 ( .A(n40), .B(n39), .C(n38), .Z(n255) );
  OAI21M1P U7 ( .A(n76), .B(n75), .C(n74), .Z(n243) );
  OAI21M1P U8 ( .A(n46), .B(n45), .C(n44), .Z(n253) );
  OAI21M1P U9 ( .A(n130), .B(n129), .C(n128), .Z(n225) );
  OAI21M1P U10 ( .A(n112), .B(n111), .C(n110), .Z(n231) );
  ND2BNM1P U11 ( .B(n18), .A(N197), .Z(n50) );
  NR3M8P U12 ( .A(n27), .B(n24), .C(n195), .Z(n25) );
  ND2BNM2P U13 ( .B(n9), .A(N227), .Z(n140) );
  ND2FM6P U14 ( .A(n267), .B(n198), .Z(n283) );
  ND2M1P U15 ( .A(n269), .B(n267), .Z(n271) );
  OAI21M1P U16 ( .A(n127), .B(n126), .C(n125), .Z(n226) );
  N1M4P U17 ( .A(n11), .Z(n286) );
  NR3M4P U18 ( .A(n261), .B(counter[6]), .C(n288), .Z(n280) );
  ND2FM4P U19 ( .A(n262), .B(n285), .Z(n261) );
  OAI21M2P U20 ( .A(n151), .B(n150), .C(n149), .Z(n218) );
  OAI21M3P U21 ( .A(n115), .B(n114), .C(n113), .Z(n230) );
  OAI21M1P U22 ( .A(n64), .B(n63), .C(n62), .Z(n247) );
  OAI21M1P U23 ( .A(n37), .B(n36), .C(n35), .Z(n256) );
  BUFM10P U24 ( .A(n281), .Z(n10) );
  OAI21M1P U25 ( .A(n187), .B(n186), .C(n185), .Z(n206) );
  OAI21M1P U26 ( .A(n139), .B(n138), .C(n137), .Z(n222) );
  BUFM3P U27 ( .A(state[2]), .Z(n6) );
  AND2M2P U28 ( .A(n8), .B(N210), .Z(n91) );
  ND2BNM2P U29 ( .B(n18), .A(N218), .Z(n113) );
  AND2M2P U30 ( .A(N232), .B(n8), .Z(n157) );
  AND2M2P U31 ( .A(N239), .B(n8), .Z(n178) );
  AND2M2P U32 ( .A(N243), .B(n8), .Z(n190) );
  AND2M2P U33 ( .A(N204), .B(n8), .Z(n73) );
  AND2M2P U34 ( .A(N197), .B(n8), .Z(n52) );
  OAI21M2P U35 ( .A(n52), .B(n51), .C(n50), .Z(n251) );
  N1M10P U36 ( .A(n281), .Z(n21) );
  N1M6P U37 ( .A(n20), .Z(n281) );
  NR3M2P U38 ( .A(n27), .B(n26), .C(n195), .Z(n1) );
  NR3M6P U39 ( .A(n27), .B(n26), .C(n195), .Z(n28) );
  ND4FM8P U40 ( .A(start_seq[3]), .B(start_seq[1]), .C(start_seq[0]), .D(
        start_seq[2]), .Z(n26) );
  ND4FM4P U41 ( .A(start_seq[3]), .B(start_seq[1]), .C(start_seq[0]), .D(
        start_seq[2]), .Z(n24) );
  AND2M1P U42 ( .A(n16), .B(N194), .Z(n43) );
  AND2M1P U43 ( .A(n16), .B(N237), .Z(n172) );
  OAI21M8P U44 ( .A(n1), .B(n282), .C(S_Data), .Z(n9) );
  ND2BNM1P U45 ( .B(counter[6]), .A(n285), .Z(n199) );
  N1M1P U46 ( .A(packet[52]), .Z(n186) );
  N1M1P U47 ( .A(packet[27]), .Z(n111) );
  N1M1P U48 ( .A(packet[39]), .Z(n147) );
  N1M1P U49 ( .A(packet[29]), .Z(n117) );
  N1M1P U50 ( .A(packet[25]), .Z(n105) );
  N1M1P U51 ( .A(packet[0]), .Z(n30) );
  N1M1P U52 ( .A(packet[14]), .Z(n72) );
  N1M1P U53 ( .A(packet[1]), .Z(n33) );
  N1M1P U54 ( .A(packet[3]), .Z(n39) );
  N1M1P U55 ( .A(packet[4]), .Z(n42) );
  N1M1P U56 ( .A(packet[5]), .Z(n45) );
  N1M1P U57 ( .A(packet[7]), .Z(n51) );
  N1M1P U58 ( .A(packet[11]), .Z(n63) );
  N1M1P U59 ( .A(packet[12]), .Z(n66) );
  N1M1P U60 ( .A(packet[13]), .Z(n69) );
  N1M1P U61 ( .A(packet[15]), .Z(n75) );
  N1M1P U62 ( .A(packet[17]), .Z(n81) );
  N1M1P U63 ( .A(packet[18]), .Z(n84) );
  N1M1P U64 ( .A(packet[19]), .Z(n87) );
  N1M1P U65 ( .A(packet[20]), .Z(n90) );
  N1M1P U66 ( .A(packet[21]), .Z(n93) );
  N1M1P U67 ( .A(packet[22]), .Z(n96) );
  N1M1P U68 ( .A(packet[23]), .Z(n99) );
  N1M1P U69 ( .A(packet[24]), .Z(n102) );
  N1M1P U70 ( .A(packet[30]), .Z(n120) );
  N1M1P U71 ( .A(packet[33]), .Z(n129) );
  N1M1P U72 ( .A(packet[38]), .Z(n144) );
  N1M1P U73 ( .A(packet[41]), .Z(n153) );
  N1M1P U74 ( .A(packet[42]), .Z(n156) );
  N1M1P U75 ( .A(packet[47]), .Z(n171) );
  OAI21M1P U76 ( .A(n178), .B(n177), .C(n176), .Z(n209) );
  N1M1P U77 ( .A(packet[49]), .Z(n177) );
  N1M1P U78 ( .A(packet[50]), .Z(n180) );
  N1M1P U79 ( .A(packet[53]), .Z(n189) );
  NR2M1P U80 ( .A(n264), .B(n263), .Z(n265) );
  NR2M1P U81 ( .A(n262), .B(n285), .Z(n263) );
  ND2M1P U82 ( .A(counter[4]), .B(n271), .Z(n268) );
  AND2M1P U83 ( .A(n272), .B(n271), .Z(n273) );
  ND2BNM1P U84 ( .B(n270), .A(n276), .Z(n272) );
  N1M1P U85 ( .A(counter[3]), .Z(n270) );
  ND2M1P U86 ( .A(counter[2]), .B(n277), .Z(n275) );
  OAI21M2P U87 ( .A(n183), .B(n184), .C(n182), .Z(n207) );
  AND2M2P U88 ( .A(N224), .B(n16), .Z(n133) );
  AND2M2P U89 ( .A(N221), .B(n13), .Z(n124) );
  AND2M2P U90 ( .A(N216), .B(n15), .Z(n109) );
  N1M4P U91 ( .A(n195), .Z(n288) );
  ND2FM8P U92 ( .A(n7), .B(state[0]), .Z(n195) );
  ND2BNM3P U93 ( .B(n199), .A(n262), .Z(n203) );
  N1M6P U94 ( .A(n283), .Z(n262) );
  BUFM2P U95 ( .A(n283), .Z(n2) );
  AOI21M6P U96 ( .A(n261), .B(counter[6]), .C(n259), .Z(n260) );
  N1M2P U97 ( .A(n261), .Z(n264) );
  N1M1P U98 ( .A(packet[40]), .Z(n150) );
  AND2M2P U99 ( .A(N206), .B(n10), .Z(n79) );
  AND2M2P U100 ( .A(N200), .B(n10), .Z(n61) );
  AND2M2P U101 ( .A(N234), .B(n10), .Z(n163) );
  AND2M2P U102 ( .A(N222), .B(n10), .Z(n127) );
  AND2M2P U103 ( .A(N241), .B(n10), .Z(n184) );
  AND2M2P U104 ( .A(N225), .B(n10), .Z(n136) );
  AND2M2P U105 ( .A(N198), .B(n10), .Z(n55) );
  N1M1P U106 ( .A(packet[2]), .Z(n36) );
  OAI21M1P U107 ( .A(n34), .B(n33), .C(n32), .Z(n257) );
  OAI21M1P U108 ( .A(n97), .B(n96), .C(n95), .Z(n236) );
  N1M1P U109 ( .A(packet[6]), .Z(n48) );
  OAI21M1P U110 ( .A(n121), .B(n120), .C(n119), .Z(n228) );
  N1M1P U111 ( .A(packet[45]), .Z(n165) );
  N1M1P U112 ( .A(packet[46]), .Z(n168) );
  N1M1P U113 ( .A(packet[36]), .Z(n138) );
  OAI21M1P U114 ( .A(n169), .B(n168), .C(n167), .Z(n212) );
  OAI21M1P U115 ( .A(n145), .B(n144), .C(n143), .Z(n220) );
  OAI21M1P U116 ( .A(n100), .B(n99), .C(n98), .Z(n235) );
  OAI21M1P U117 ( .A(n148), .B(n147), .C(n146), .Z(n219) );
  N1M1P U118 ( .A(packet[37]), .Z(n141) );
  OAI21M1P U119 ( .A(n91), .B(n90), .C(n89), .Z(n238) );
  OAI21M1P U120 ( .A(n118), .B(n117), .C(n116), .Z(n229) );
  OAI21M1P U121 ( .A(n82), .B(n81), .C(n80), .Z(n241) );
  N1M1P U122 ( .A(packet[43]), .Z(n159) );
  OAI21M1P U123 ( .A(n190), .B(n189), .C(n188), .Z(n205) );
  N1M1P U124 ( .A(packet[9]), .Z(n57) );
  N1M1P U125 ( .A(packet[54]), .Z(n193) );
  ND2BNM2P U126 ( .B(n12), .A(N230), .Z(n149) );
  AND2M2P U127 ( .A(n16), .B(N209), .Z(n88) );
  OAI21M1P U128 ( .A(n154), .B(n153), .C(n152), .Z(n217) );
  OAI21M1P U129 ( .A(n88), .B(n87), .C(n86), .Z(n239) );
  BUFM1P U130 ( .A(start_seq[0]), .Z(n3) );
  OAI21M1P U131 ( .A(n73), .B(n72), .C(n71), .Z(n244) );
  OAI21M1P U132 ( .A(n157), .B(n156), .C(n155), .Z(n216) );
  N1M3P U133 ( .A(state[1]), .Z(n7) );
  ND2BNM1P U134 ( .B(n18), .A(N209), .Z(n86) );
  ND2BNM1P U135 ( .B(n18), .A(N233), .Z(n158) );
  ND2BNM1P U136 ( .B(n18), .A(N212), .Z(n95) );
  ND2BNM1P U137 ( .B(n18), .A(N228), .Z(n143) );
  ND2BNM1P U138 ( .B(n18), .A(N199), .Z(n56) );
  BUFM1P U139 ( .A(n19), .Z(n4) );
  N1M4P U140 ( .A(state[2]), .Z(n22) );
  AND2M2P U141 ( .A(N231), .B(n16), .Z(n154) );
  BUFM12P U142 ( .A(n281), .Z(n16) );
  BUFM1P U143 ( .A(start_seq[2]), .Z(n5) );
  AND2M2P U144 ( .A(n16), .B(N208), .Z(n85) );
  OAI21M2P U145 ( .A(n160), .B(n159), .C(n158), .Z(n215) );
  OAI21M2P U146 ( .A(n49), .B(n48), .C(n47), .Z(n252) );
  OAI21M2P U147 ( .A(n194), .B(n193), .C(n192), .Z(n204) );
  OAI21M2P U148 ( .A(n58), .B(n57), .C(n56), .Z(n249) );
  N1M8P U149 ( .A(n191), .Z(n17) );
  OAI21M1P U150 ( .A(n172), .B(n171), .C(n170), .Z(n211) );
  OAI21M1P U151 ( .A(n142), .B(n141), .C(n140), .Z(n221) );
  OAI21M1P U152 ( .A(n175), .B(n174), .C(n173), .Z(n210) );
  OAI21M1P U153 ( .A(n103), .B(n102), .C(n101), .Z(n234) );
  AND2M2P U154 ( .A(n10), .B(N219), .Z(n118) );
  N1M4P U155 ( .A(n21), .Z(n8) );
  OAI21M1P U156 ( .A(n70), .B(n69), .C(n68), .Z(n245) );
  OAI21M1P U157 ( .A(n67), .B(n66), .C(n65), .Z(n246) );
  OAI21M1P U158 ( .A(n94), .B(n93), .C(n92), .Z(n237) );
  OAI21M1P U159 ( .A(n43), .B(n42), .C(n41), .Z(n254) );
  BUFM1P U160 ( .A(n282), .Z(n14) );
  N1M12P U161 ( .A(n17), .Z(n18) );
  ND2BNM1P U162 ( .B(n18), .A(N226), .Z(n137) );
  ND2BNM1P U163 ( .B(n18), .A(N213), .Z(n98) );
  OAI21M2P U164 ( .A(n181), .B(n180), .C(n179), .Z(n208) );
  AND2M1P U165 ( .A(N238), .B(n15), .Z(n175) );
  N1M4P U166 ( .A(n21), .Z(n13) );
  BUFM6P U167 ( .A(state[1]), .Z(n19) );
  OAI21M1P U168 ( .A(n85), .B(n84), .C(n83), .Z(n240) );
  NR2M1P U169 ( .A(n4), .B(n289), .Z(ready) );
  ND2BNM1P U170 ( .B(n18), .A(N229), .Z(n146) );
  ND2BNM1P U171 ( .B(n12), .A(N204), .Z(n71) );
  ND3M8P U172 ( .A(n23), .B(n22), .C(start_seq[4]), .Z(n27) );
  N1M6P U173 ( .A(n196), .Z(n282) );
  OAI21M4P U174 ( .A(n28), .B(n282), .C(S_Data), .Z(n191) );
  N1M3P U175 ( .A(packet[48]), .Z(n174) );
  OAI21M2P U176 ( .A(n123), .B(n124), .C(n122), .Z(n227) );
  N1M3P U177 ( .A(packet[31]), .Z(n123) );
  OAI21M2P U178 ( .A(n135), .B(n136), .C(n134), .Z(n223) );
  N1M3P U179 ( .A(packet[35]), .Z(n135) );
  OAI21M2P U180 ( .A(n162), .B(n163), .C(n161), .Z(n214) );
  N1M3P U181 ( .A(packet[44]), .Z(n162) );
  OAI21M2P U182 ( .A(n108), .B(n109), .C(n107), .Z(n232) );
  N1M3P U183 ( .A(packet[26]), .Z(n108) );
  OAI21M2P U184 ( .A(n60), .B(n61), .C(n59), .Z(n248) );
  N1M3P U185 ( .A(packet[10]), .Z(n60) );
  N1M3P U186 ( .A(packet[51]), .Z(n183) );
  OAI21M2P U187 ( .A(n54), .B(n55), .C(n53), .Z(n250) );
  N1M3P U188 ( .A(packet[8]), .Z(n54) );
  OAI21M2P U189 ( .A(n132), .B(n133), .C(n131), .Z(n224) );
  N1M3P U190 ( .A(packet[34]), .Z(n132) );
  N1M3P U191 ( .A(packet[32]), .Z(n126) );
  OAI21M2P U192 ( .A(n78), .B(n79), .C(n77), .Z(n242) );
  N1M3P U193 ( .A(packet[16]), .Z(n78) );
  ND2BNM1P U194 ( .B(n9), .A(N217), .Z(n110) );
  ND2BNM1P U195 ( .B(n18), .A(N196), .Z(n47) );
  N1M12P U196 ( .A(n21), .Z(n15) );
  AND2M1P U197 ( .A(n16), .B(N240), .Z(n181) );
  AND2M1P U198 ( .A(n16), .B(N196), .Z(n49) );
  AND2M1P U199 ( .A(n16), .B(N244), .Z(n194) );
  AND2M1P U200 ( .A(n16), .B(N233), .Z(n160) );
  AND2M1P U201 ( .A(n16), .B(N199), .Z(n58) );
  OAI21M1P U202 ( .A(n31), .B(n30), .C(n29), .Z(n258) );
  ND2BNM1P U203 ( .B(n18), .A(N210), .Z(n89) );
  NR2BNM1P U204 ( .B(N190), .A(n21), .Z(n31) );
  ND2BNM1P U205 ( .B(counter[6]), .A(n14), .Z(n284) );
  ND2BNM1P U206 ( .B(state[0]), .A(n6), .Z(n289) );
  N1M8P U207 ( .A(n17), .Z(n12) );
  ND2BNM1P U208 ( .B(n9), .A(N215), .Z(n104) );
  ND2BNM1P U209 ( .B(n12), .A(N234), .Z(n161) );
  ND2BNM1P U210 ( .B(n9), .A(N219), .Z(n116) );
  ND2BNM1P U211 ( .B(n12), .A(N200), .Z(n59) );
  ND2BNM1P U212 ( .B(n18), .A(N207), .Z(n80) );
  ND2BNM1P U213 ( .B(n12), .A(N208), .Z(n83) );
  ND2BNM1P U214 ( .B(n12), .A(N224), .Z(n131) );
  ND2BNM1P U215 ( .B(n12), .A(N190), .Z(n29) );
  ND2BNM1P U216 ( .B(n12), .A(N216), .Z(n107) );
  ND2BNM1P U217 ( .B(n18), .A(N236), .Z(n167) );
  ND2BNM1P U218 ( .B(n9), .A(N205), .Z(n74) );
  ND2BNM1P U219 ( .B(n18), .A(N244), .Z(n192) );
  ND2BNM1P U220 ( .B(n18), .A(N240), .Z(n179) );
  ND2BNM1P U221 ( .B(n9), .A(N237), .Z(n170) );
  ND2BNM1P U222 ( .B(n18), .A(N242), .Z(n185) );
  ND2BNM1P U223 ( .B(n9), .A(N238), .Z(n173) );
  ND2BNM1P U224 ( .B(n12), .A(N232), .Z(n155) );
  ND2BNM1P U225 ( .B(n18), .A(N214), .Z(n101) );
  ND2BNM1P U226 ( .B(n12), .A(N221), .Z(n122) );
  ND2BNM1P U227 ( .B(n9), .A(N211), .Z(n92) );
  ND2BNM1P U228 ( .B(n18), .A(N220), .Z(n119) );
  ND2BNM1P U229 ( .B(n12), .A(N206), .Z(n77) );
  ND2BNM1P U230 ( .B(n9), .A(N194), .Z(n41) );
  ND2BNM1P U231 ( .B(n9), .A(N201), .Z(n62) );
  ND2BNM1P U232 ( .B(n9), .A(N222), .Z(n125) );
  ND2BNM1P U233 ( .B(n12), .A(N225), .Z(n134) );
  ND2BNM1P U234 ( .B(n18), .A(N235), .Z(n164) );
  ND2BNM1P U235 ( .B(n12), .A(N202), .Z(n65) );
  ND2BNM1P U236 ( .B(n12), .A(N243), .Z(n188) );
  ND2BNM1P U237 ( .B(n18), .A(N192), .Z(n35) );
  ND2BNM1P U238 ( .B(n9), .A(N193), .Z(n38) );
  ND2BNM1P U239 ( .B(n12), .A(N231), .Z(n152) );
  ND2BNM1P U240 ( .B(n9), .A(N195), .Z(n44) );
  ND2BNM1P U241 ( .B(n18), .A(N239), .Z(n176) );
  ND2BNM1P U242 ( .B(n9), .A(N223), .Z(n128) );
  ND2BNM1P U243 ( .B(n18), .A(N191), .Z(n32) );
  ND2BNM1P U244 ( .B(n12), .A(N198), .Z(n53) );
  ND2BNM1P U245 ( .B(n12), .A(N203), .Z(n68) );
  ND2BNM1P U246 ( .B(n12), .A(N241), .Z(n182) );
  ND3BCNM1P U247 ( .B(start_seq[1]), .C(n6), .A(n288), .Z(next_start_seq[2])
         );
  ND3BCNM1P U248 ( .B(start_seq[3]), .C(n6), .A(n288), .Z(next_start_seq[4])
         );
  N1M4P U249 ( .A(start_seq[5]), .Z(n23) );
  N1M3P U250 ( .A(counter[5]), .Z(n285) );
  NR2M6P U251 ( .A(n25), .B(n282), .Z(n20) );
  ND4DNM4P U252 ( .D(n6), .A(n3), .B(n5), .C(start_seq[1]), .Z(n201) );
  OAI21M1P U253 ( .A(n280), .B(n265), .C(n10), .Z(next_counter[5]) );
  ND3BCNM1P U254 ( .B(S_Data), .C(n6), .A(n288), .Z(next_start_seq[0]) );
  ND3BCNM1P U255 ( .B(n3), .C(n6), .A(n288), .Z(next_start_seq[1]) );
  ND3BCNM1P U256 ( .B(start_seq[4]), .C(n6), .A(n288), .Z(next_start_seq[5])
         );
  ND3BCNM1P U257 ( .B(n5), .C(n6), .A(n288), .Z(next_start_seq[3]) );
  ND4DNM4P U258 ( .D(start_seq[5]), .A(start_seq[4]), .B(start_seq[3]), .C(
        n288), .Z(n202) );
  N1M1P U259 ( .A(counter[0]), .Z(n287) );
  AOI21M6P U260 ( .A(counter[1]), .B(counter[0]), .C(n278), .Z(n279) );
  ND2BNM1P U261 ( .B(counter[0]), .A(n269), .Z(n276) );
  ND2BNM1P U262 ( .B(counter[0]), .A(n274), .Z(n277) );
  OAI21M2P U263 ( .A(n166), .B(n165), .C(n164), .Z(n213) );
  ND3M1P U264 ( .A(n15), .B(n2), .C(n268), .Z(n292) );
  ND3M1P U265 ( .A(n276), .B(n275), .C(n16), .Z(n291) );
  ND3BCNM4P U266 ( .B(state[2]), .C(state[0]), .A(n19), .Z(n196) );
  OAI21M1P U267 ( .A(n280), .B(n279), .C(n15), .Z(next_counter[1]) );
  N1M4P U268 ( .A(n197), .Z(n267) );
  AND2M2P U269 ( .A(n13), .B(N191), .Z(n34) );
  AND2M2P U270 ( .A(n10), .B(N192), .Z(n37) );
  AND2M2P U271 ( .A(n15), .B(N193), .Z(n40) );
  AND2M2P U272 ( .A(n15), .B(N195), .Z(n46) );
  AND2M2P U273 ( .A(n13), .B(N201), .Z(n64) );
  AND2M2P U274 ( .A(n16), .B(N202), .Z(n67) );
  AND2M2P U275 ( .A(n15), .B(N203), .Z(n70) );
  AND2M2P U276 ( .A(n15), .B(N205), .Z(n76) );
  AND2M2P U277 ( .A(N207), .B(n13), .Z(n82) );
  AND2M2P U278 ( .A(n13), .B(N211), .Z(n94) );
  AND2M2P U279 ( .A(n15), .B(N212), .Z(n97) );
  AND2M2P U280 ( .A(n15), .B(N213), .Z(n100) );
  AND2M2P U281 ( .A(N214), .B(n15), .Z(n103) );
  AND2M2P U282 ( .A(N215), .B(n15), .Z(n106) );
  AND2M2P U283 ( .A(N217), .B(n15), .Z(n112) );
  AND2M2P U284 ( .A(N218), .B(n10), .Z(n115) );
  N1M2P U285 ( .A(packet[28]), .Z(n114) );
  AND2M2P U286 ( .A(n15), .B(N220), .Z(n121) );
  AND2M2P U287 ( .A(N223), .B(n15), .Z(n130) );
  AND2M2P U288 ( .A(n10), .B(N226), .Z(n139) );
  AND2M2P U289 ( .A(N227), .B(n15), .Z(n142) );
  AND2M2P U290 ( .A(n15), .B(N228), .Z(n145) );
  AND2M2P U291 ( .A(n10), .B(N229), .Z(n148) );
  AND2M2P U292 ( .A(N230), .B(n10), .Z(n151) );
  AND2M2P U293 ( .A(N235), .B(n10), .Z(n166) );
  AND2M2P U294 ( .A(N236), .B(n13), .Z(n169) );
  AND2M2P U295 ( .A(N242), .B(n15), .Z(n187) );
  OR2M2P U296 ( .A(counter[0]), .B(counter[3]), .Z(n197) );
  NR3M3P U297 ( .A(counter[4]), .B(counter[1]), .C(counter[2]), .Z(n198) );
  N1M1P U298 ( .A(n203), .Z(n259) );
  NR2FM1P U299 ( .A(n286), .B(n260), .Z(next_counter[6]) );
  OR2M2P U300 ( .A(counter[1]), .B(counter[2]), .Z(n266) );
  N1M1P U301 ( .A(n266), .Z(n269) );
  NR2FM1P U302 ( .A(n286), .B(n273), .Z(next_counter[3]) );
  N1M2P U303 ( .A(counter[1]), .Z(n274) );
  N1M1P U304 ( .A(n277), .Z(n278) );
  NR3CNM2P U305 ( .C(n285), .A(n284), .B(n2), .Z(n290) );
  NR2BNM2P U306 ( .B(n287), .A(n286), .Z(next_counter[0]) );
endmodule


module receiver_synth ( RX_Ready, Clk_S, Rst_n, S_Data, RX_Data_Valid, RX_Data );
  output [54:0] RX_Data;
  input RX_Ready, Clk_S, Rst_n, S_Data;
  output RX_Data_Valid;
  wire   good_data, \state[0] , n3, n4, n5;
  wire   [1:0] nextState;

  receive_protocol_synth rx_side ( .S_Data(S_Data), .clk(Clk_S), .rst(Rst_n), 
        .packet(RX_Data), .ready(good_data) );
  FD2QM1P \state_reg[1]  ( .D(nextState[1]), .CP(Clk_S), .CD(Rst_n), .Q(
        RX_Data_Valid) );
  FD2QM1P \state_reg[0]  ( .D(nextState[0]), .CP(Clk_S), .CD(Rst_n), .Q(
        \state[0] ) );
  ND2BNM1P U7 ( .B(n5), .A(n4), .Z(nextState[0]) );
  AND2M1P U8 ( .A(RX_Ready), .B(RX_Data_Valid), .Z(n5) );
  MUX21LM1P U9 ( .A(good_data), .B(n3), .S(\state[0] ), .Z(n4) );
  OA21M1P U10 ( .A(\state[0] ), .B(RX_Data_Valid), .C(RX_Ready), .Z(
        nextState[1]) );
  N1M2P U11 ( .A(RX_Data_Valid), .Z(n3) );
endmodule

