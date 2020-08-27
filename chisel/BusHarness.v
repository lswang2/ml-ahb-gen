module HastiBus(input clk, input reset,
    input [31:0] io_master_haddr,
    input  io_master_hwrite,
    input [2:0] io_master_hsize,
    input [2:0] io_master_hburst,
    input [3:0] io_master_hprot,
    input [1:0] io_master_htrans,
    input  io_master_hmastlock,
    input [31:0] io_master_hwdata,
    output[31:0] io_master_hrdata,
    output io_master_hready,
    output io_master_hresp,
    output[31:0] io_slaves_2_haddr,
    output io_slaves_2_hwrite,
    output[2:0] io_slaves_2_hsize,
    output[2:0] io_slaves_2_hburst,
    output[3:0] io_slaves_2_hprot,
    output[1:0] io_slaves_2_htrans,
    output io_slaves_2_hmastlock,
    output[31:0] io_slaves_2_hwdata,
    input [31:0] io_slaves_2_hrdata,
    output io_slaves_2_hsel,
    output io_slaves_2_hreadyin,
    input  io_slaves_2_hreadyout,
    input  io_slaves_2_hresp,
    output[31:0] io_slaves_1_haddr,
    output io_slaves_1_hwrite,
    output[2:0] io_slaves_1_hsize,
    output[2:0] io_slaves_1_hburst,
    output[3:0] io_slaves_1_hprot,
    output[1:0] io_slaves_1_htrans,
    output io_slaves_1_hmastlock,
    output[31:0] io_slaves_1_hwdata,
    input [31:0] io_slaves_1_hrdata,
    output io_slaves_1_hsel,
    output io_slaves_1_hreadyin,
    input  io_slaves_1_hreadyout,
    input  io_slaves_1_hresp,
    output[31:0] io_slaves_0_haddr,
    output io_slaves_0_hwrite,
    output[2:0] io_slaves_0_hsize,
    output[2:0] io_slaves_0_hburst,
    output[3:0] io_slaves_0_hprot,
    output[1:0] io_slaves_0_htrans,
    output io_slaves_0_hmastlock,
    output[31:0] io_slaves_0_hwdata,
    input [31:0] io_slaves_0_hrdata,
    output io_slaves_0_hsel,
    output io_slaves_0_hreadyin,
    input  io_slaves_0_hreadyout,
    input  io_slaves_0_hresp
);

  wire T0;
  reg  skb_valid;
  wire T67;
  wire T1;
  wire T2;
  wire T3;
  wire T4;
  wire T5;
  wire T6;
  wire[2:0] T7;
  wire[2:0] T8;
  wire[2:0] T9;
  wire T10;
  wire T11;
  wire[1:0] master_htrans;
  reg [1:0] skb_htrans;
  wire[1:0] T12;
  wire T13;
  wire T14;
  wire[3:0] T15;
  wire[31:0] master_haddr;
  reg [31:0] skb_haddr;
  wire[31:0] T16;
  wire T17;
  wire T18;
  wire T19;
  wire[3:0] T20;
  wire T21;
  wire T22;
  wire T23;
  wire[3:0] T24;
  wire T25;
  wire T26;
  wire T27;
  wire T28;
  wire T29;
  wire T30;
  wire T31;
  wire T32;
  reg  R33;
  wire T68;
  wire T34;
  wire T35;
  reg  R36;
  wire T69;
  wire T37;
  reg  R38;
  wire T70;
  wire T39;
  wire master_hready;
  wire T40;
  wire T41;
  wire T42;
  wire T43;
  wire T44;
  wire T45;
  wire T46;
  wire T47;
  wire[31:0] master_hwdata;
  reg [31:0] skb_hwdata;
  wire master_hmastlock;
  reg  skb_hmastlock;
  wire T48;
  wire[3:0] master_hprot;
  reg [3:0] skb_hprot;
  wire[3:0] T49;
  wire[2:0] master_hburst;
  reg [2:0] skb_hburst;
  wire[2:0] T50;
  wire[2:0] master_hsize;
  reg [2:0] skb_hsize;
  wire[2:0] T51;
  wire master_hwrite;
  reg  skb_hwrite;
  wire T52;
  wire T53;
  wire T54;
  wire T55;
  wire T56;
  wire T57;
  wire T58;
  wire T59;
  wire T60;
  wire T61;
  wire[31:0] T62;
  wire[31:0] T63;
  wire[31:0] T64;
  wire[31:0] T65;
  wire[31:0] T66;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    skb_valid = {1{$random}};
    skb_htrans = {1{$random}};
    skb_haddr = {1{$random}};
    R33 = {1{$random}};
    R36 = {1{$random}};
    R38 = {1{$random}};
    skb_hwdata = {1{$random}};
    skb_hmastlock = {1{$random}};
    skb_hprot = {1{$random}};
    skb_hburst = {1{$random}};
    skb_hsize = {1{$random}};
    skb_hwrite = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_slaves_0_hreadyin = T0;
  assign T0 = skb_valid | io_master_hready;
  assign T67 = reset ? 1'h0 : T1;
  assign T1 = master_hready ? T2 : skb_valid;
  assign T2 = T32 & T3;
  assign T3 = T25 | T4;
  assign T4 = T6 & T5;
  assign T5 = io_slaves_2_hreadyout ^ 1'h1;
  assign T6 = T7[2];
  assign T7 = T21 ? 3'h1 : T8;
  assign T8 = T17 ? 3'h2 : T9;
  assign T9 = T10 ? 3'h4 : 3'h0;
  assign T10 = T14 & T11;
  assign T11 = master_htrans != 2'h0;
  assign master_htrans = skb_valid ? skb_htrans : io_master_htrans;
  assign T12 = T13 ? io_master_htrans : skb_htrans;
  assign T13 = master_hready & T2;
  assign T14 = T15 == 4'h0;
  assign T15 = master_haddr[31:28];
  assign master_haddr = skb_valid ? skb_haddr : io_master_haddr;
  assign T16 = T13 ? io_master_haddr : skb_haddr;
  assign T17 = T19 & T18;
  assign T18 = master_htrans != 2'h0;
  assign T19 = T20 == 4'h2;
  assign T20 = master_haddr[31:28];
  assign T21 = T23 & T22;
  assign T22 = master_htrans != 2'h0;
  assign T23 = T24 == 4'h3;
  assign T24 = master_haddr[31:28];
  assign T25 = T29 | T26;
  assign T26 = T28 & T27;
  assign T27 = io_slaves_1_hreadyout ^ 1'h1;
  assign T28 = T7[1];
  assign T29 = T31 & T30;
  assign T30 = io_slaves_0_hreadyout ^ 1'h1;
  assign T31 = T7[0];
  assign T32 = T35 | R33;
  assign T68 = reset ? 1'h0 : T34;
  assign T34 = master_hready ? T6 : R33;
  assign T35 = R38 | R36;
  assign T69 = reset ? 1'h0 : T37;
  assign T37 = master_hready ? T28 : R36;
  assign T70 = reset ? 1'h0 : T39;
  assign T39 = master_hready ? T31 : R38;
  assign master_hready = T45 | T40;
  assign T40 = T42 | T41;
  assign T41 = R33 ? io_slaves_2_hreadyout : 1'h0;
  assign T42 = T44 | T43;
  assign T43 = R36 ? io_slaves_1_hreadyout : 1'h0;
  assign T44 = R38 ? io_slaves_0_hreadyout : 1'h0;
  assign T45 = T46 == 1'h0;
  assign T46 = T47 | R33;
  assign T47 = R38 | R36;
  assign io_slaves_0_hsel = T31;
  assign io_slaves_0_hwdata = master_hwdata;
  assign master_hwdata = skb_valid ? skb_hwdata : io_master_hwdata;
  assign io_slaves_0_hmastlock = master_hmastlock;
  assign master_hmastlock = skb_valid ? skb_hmastlock : io_master_hmastlock;
  assign T48 = T13 ? io_master_hmastlock : skb_hmastlock;
  assign io_slaves_0_htrans = master_htrans;
  assign io_slaves_0_hprot = master_hprot;
  assign master_hprot = skb_valid ? skb_hprot : io_master_hprot;
  assign T49 = T13 ? io_master_hprot : skb_hprot;
  assign io_slaves_0_hburst = master_hburst;
  assign master_hburst = skb_valid ? skb_hburst : io_master_hburst;
  assign T50 = T13 ? io_master_hburst : skb_hburst;
  assign io_slaves_0_hsize = master_hsize;
  assign master_hsize = skb_valid ? skb_hsize : io_master_hsize;
  assign T51 = T13 ? io_master_hsize : skb_hsize;
  assign io_slaves_0_hwrite = master_hwrite;
  assign master_hwrite = skb_valid ? skb_hwrite : io_master_hwrite;
  assign T52 = T13 ? io_master_hwrite : skb_hwrite;
  assign io_slaves_0_haddr = master_haddr;
  assign io_slaves_1_hreadyin = T53;
  assign T53 = skb_valid | io_master_hready;
  assign io_slaves_1_hsel = T28;
  assign io_slaves_1_hwdata = master_hwdata;
  assign io_slaves_1_hmastlock = master_hmastlock;
  assign io_slaves_1_htrans = master_htrans;
  assign io_slaves_1_hprot = master_hprot;
  assign io_slaves_1_hburst = master_hburst;
  assign io_slaves_1_hsize = master_hsize;
  assign io_slaves_1_hwrite = master_hwrite;
  assign io_slaves_1_haddr = master_haddr;
  assign io_slaves_2_hreadyin = T54;
  assign T54 = skb_valid | io_master_hready;
  assign io_slaves_2_hsel = T6;
  assign io_slaves_2_hwdata = master_hwdata;
  assign io_slaves_2_hmastlock = master_hmastlock;
  assign io_slaves_2_htrans = master_htrans;
  assign io_slaves_2_hprot = master_hprot;
  assign io_slaves_2_hburst = master_hburst;
  assign io_slaves_2_hsize = master_hsize;
  assign io_slaves_2_hwrite = master_hwrite;
  assign io_slaves_2_haddr = master_haddr;
  assign io_master_hresp = T55;
  assign T55 = T57 | T56;
  assign T56 = R33 ? io_slaves_2_hresp : 1'h0;
  assign T57 = T59 | T58;
  assign T58 = R36 ? io_slaves_1_hresp : 1'h0;
  assign T59 = R38 ? io_slaves_0_hresp : 1'h0;
  assign io_master_hready = T60;
  assign T60 = T61 & master_hready;
  assign T61 = skb_valid ^ 1'h1;
  assign io_master_hrdata = T62;
  assign T62 = T64 | T63;
  assign T63 = R33 ? io_slaves_2_hrdata : 32'h0;
  assign T64 = T66 | T65;
  assign T65 = R36 ? io_slaves_1_hrdata : 32'h0;
  assign T66 = R38 ? io_slaves_0_hrdata : 32'h0;

  always @(posedge clk) begin
    if(reset) begin
      skb_valid <= 1'h0;
    end else if(master_hready) begin
      skb_valid <= T2;
    end
    if(T13) begin
      skb_htrans <= io_master_htrans;
    end
    if(T13) begin
      skb_haddr <= io_master_haddr;
    end
    if(reset) begin
      R33 <= 1'h0;
    end else if(master_hready) begin
      R33 <= T6;
    end
    if(reset) begin
      R36 <= 1'h0;
    end else if(master_hready) begin
      R36 <= T28;
    end
    if(reset) begin
      R38 <= 1'h0;
    end else if(master_hready) begin
      R38 <= T31;
    end
    skb_hwdata <= skb_hwdata;
    if(T13) begin
      skb_hmastlock <= io_master_hmastlock;
    end
    if(T13) begin
      skb_hprot <= io_master_hprot;
    end
    if(T13) begin
      skb_hburst <= io_master_hburst;
    end
    if(T13) begin
      skb_hsize <= io_master_hsize;
    end
    if(T13) begin
      skb_hwrite <= io_master_hwrite;
    end
  end
endmodule

module HastiSlaveMux(input clk, input reset,
    input [31:0] io_ins_2_haddr,
    input  io_ins_2_hwrite,
    input [2:0] io_ins_2_hsize,
    input [2:0] io_ins_2_hburst,
    input [3:0] io_ins_2_hprot,
    input [1:0] io_ins_2_htrans,
    input  io_ins_2_hmastlock,
    input [31:0] io_ins_2_hwdata,
    output[31:0] io_ins_2_hrdata,
    input  io_ins_2_hsel,
    input  io_ins_2_hreadyin,
    output io_ins_2_hreadyout,
    output io_ins_2_hresp,
    input [31:0] io_ins_1_haddr,
    input  io_ins_1_hwrite,
    input [2:0] io_ins_1_hsize,
    input [2:0] io_ins_1_hburst,
    input [3:0] io_ins_1_hprot,
    input [1:0] io_ins_1_htrans,
    input  io_ins_1_hmastlock,
    input [31:0] io_ins_1_hwdata,
    output[31:0] io_ins_1_hrdata,
    input  io_ins_1_hsel,
    input  io_ins_1_hreadyin,
    output io_ins_1_hreadyout,
    output io_ins_1_hresp,
    input [31:0] io_ins_0_haddr,
    input  io_ins_0_hwrite,
    input [2:0] io_ins_0_hsize,
    input [2:0] io_ins_0_hburst,
    input [3:0] io_ins_0_hprot,
    input [1:0] io_ins_0_htrans,
    input  io_ins_0_hmastlock,
    input [31:0] io_ins_0_hwdata,
    output[31:0] io_ins_0_hrdata,
    input  io_ins_0_hsel,
    input  io_ins_0_hreadyin,
    output io_ins_0_hreadyout,
    output io_ins_0_hresp,
    output[31:0] io_out_haddr,
    output io_out_hwrite,
    output[2:0] io_out_hsize,
    output[2:0] io_out_hburst,
    output[3:0] io_out_hprot,
    output[1:0] io_out_htrans,
    output io_out_hmastlock,
    output[31:0] io_out_hwdata,
    input [31:0] io_out_hrdata,
    output io_out_hsel,
    output io_out_hreadyin,
    input  io_out_hreadyout,
    input  io_out_hresp
);

  wire T0;
  wire T1;
  wire[2:0] T2;
  wire[2:0] T3;
  wire[2:0] T4;
  wire requests_2;
  reg  R5;
  wire T168;
  wire T6;
  wire T7;
  wire T8;
  wire T9;
  wire T10;
  wire T11;
  wire T12;
  wire T13;
  wire T14;
  wire requests_1;
  reg  R15;
  wire T169;
  wire T16;
  wire T17;
  wire T18;
  wire T19;
  wire T20;
  wire T21;
  wire T22;
  wire T23;
  wire T24;
  wire T25;
  wire requests_0;
  reg  R26;
  wire T170;
  wire T27;
  wire T28;
  wire T29;
  wire T30;
  wire T31;
  wire T32;
  wire T33;
  wire T34;
  wire T35;
  wire T36;
  wire T37;
  wire[31:0] T38;
  wire[31:0] T39;
  reg  R40;
  wire T171;
  wire T41;
  wire[31:0] T42;
  wire[31:0] T43;
  reg  R44;
  wire T172;
  wire T45;
  wire[31:0] T46;
  reg  R47;
  wire T173;
  wire T48;
  wire T49;
  wire T50;
  wire T51;
  reg  R52;
  wire T53;
  wire T54;
  wire T55;
  wire T56;
  wire T57;
  reg  R58;
  wire T59;
  wire T60;
  wire T61;
  wire T62;
  reg  R63;
  wire T64;
  wire T65;
  wire[1:0] T66;
  wire[1:0] T67;
  wire[1:0] T68;
  reg [1:0] R69;
  wire[1:0] T70;
  wire[1:0] T71;
  wire[1:0] T72;
  wire[1:0] T73;
  reg [1:0] R74;
  wire[1:0] T75;
  wire[1:0] T76;
  wire[1:0] T77;
  reg [1:0] R78;
  wire[1:0] T79;
  wire[3:0] T80;
  wire[3:0] T81;
  wire[3:0] T82;
  reg [3:0] R83;
  wire[3:0] T84;
  wire[3:0] T85;
  wire[3:0] T86;
  wire[3:0] T87;
  reg [3:0] R88;
  wire[3:0] T89;
  wire[3:0] T90;
  wire[3:0] T91;
  reg [3:0] R92;
  wire[3:0] T93;
  wire[2:0] T94;
  wire[2:0] T95;
  wire[2:0] T96;
  reg [2:0] R97;
  wire[2:0] T98;
  wire[2:0] T99;
  wire[2:0] T100;
  wire[2:0] T101;
  reg [2:0] R102;
  wire[2:0] T103;
  wire[2:0] T104;
  wire[2:0] T105;
  reg [2:0] R106;
  wire[2:0] T107;
  wire[2:0] T108;
  wire[2:0] T109;
  wire[2:0] T110;
  reg [2:0] R111;
  wire[2:0] T112;
  wire[2:0] T113;
  wire[2:0] T114;
  wire[2:0] T115;
  reg [2:0] R116;
  wire[2:0] T117;
  wire[2:0] T118;
  wire[2:0] T119;
  reg [2:0] R120;
  wire[2:0] T121;
  wire T122;
  wire T123;
  wire T124;
  reg  R125;
  wire T126;
  wire T127;
  wire T128;
  wire T129;
  reg  R130;
  wire T131;
  wire T132;
  wire T133;
  reg  R134;
  wire T135;
  wire[31:0] T136;
  wire[31:0] T137;
  wire[31:0] T138;
  reg [31:0] R139;
  wire[31:0] T140;
  wire[31:0] T141;
  wire[31:0] T142;
  wire[31:0] T143;
  reg [31:0] R144;
  wire[31:0] T145;
  wire[31:0] T146;
  wire[31:0] T147;
  reg [31:0] R148;
  wire[31:0] T149;
  wire T150;
  wire T151;
  wire T152;
  wire T153;
  wire[31:0] T154;
  wire[31:0] T155;
  wire[31:0] T174;
  wire T156;
  wire T157;
  wire T158;
  wire T159;
  wire[31:0] T160;
  wire[31:0] T161;
  wire[31:0] T175;
  wire T162;
  wire T163;
  wire T164;
  wire T165;
  wire[31:0] T166;
  wire[31:0] T167;
  wire[31:0] T176;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    R5 = {1{$random}};
    R15 = {1{$random}};
    R26 = {1{$random}};
    R40 = {1{$random}};
    R44 = {1{$random}};
    R47 = {1{$random}};
    R52 = {1{$random}};
    R58 = {1{$random}};
    R63 = {1{$random}};
    R69 = {1{$random}};
    R74 = {1{$random}};
    R78 = {1{$random}};
    R83 = {1{$random}};
    R88 = {1{$random}};
    R92 = {1{$random}};
    R97 = {1{$random}};
    R102 = {1{$random}};
    R106 = {1{$random}};
    R111 = {1{$random}};
    R116 = {1{$random}};
    R120 = {1{$random}};
    R125 = {1{$random}};
    R130 = {1{$random}};
    R134 = {1{$random}};
    R139 = {1{$random}};
    R144 = {1{$random}};
    R148 = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_out_hreadyin = io_out_hreadyout;
  assign io_out_hsel = T0;
  assign T0 = T37 | T1;
  assign T1 = T2[2];
  assign T2 = requests_0 ? 3'h1 : T3;
  assign T3 = requests_1 ? 3'h2 : T4;
  assign T4 = requests_2 ? 3'h4 : 3'h0;
  assign requests_2 = T14 | R5;
  assign T168 = reset ? 1'h0 : T6;
  assign T6 = T10 ? T9 : T7;
  assign T7 = T8 ? 1'h0 : R5;
  assign T8 = io_out_hreadyout & T1;
  assign T9 = io_ins_2_hsel & io_ins_2_hreadyin;
  assign T10 = io_out_hreadyout & T11;
  assign T11 = T13 & T12;
  assign T12 = R5 ^ 1'h1;
  assign T13 = T1 ^ 1'h1;
  assign T14 = io_ins_2_hsel & io_ins_2_hreadyin;
  assign requests_1 = T25 | R15;
  assign T169 = reset ? 1'h0 : T16;
  assign T16 = T21 ? T20 : T17;
  assign T17 = T18 ? 1'h0 : R15;
  assign T18 = io_out_hreadyout & T19;
  assign T19 = T2[1];
  assign T20 = io_ins_1_hsel & io_ins_1_hreadyin;
  assign T21 = io_out_hreadyout & T22;
  assign T22 = T24 & T23;
  assign T23 = R15 ^ 1'h1;
  assign T24 = T19 ^ 1'h1;
  assign T25 = io_ins_1_hsel & io_ins_1_hreadyin;
  assign requests_0 = T36 | R26;
  assign T170 = reset ? 1'h0 : T27;
  assign T27 = T32 ? T31 : T28;
  assign T28 = T29 ? 1'h0 : R26;
  assign T29 = io_out_hreadyout & T30;
  assign T30 = T2[0];
  assign T31 = io_ins_0_hsel & io_ins_0_hreadyin;
  assign T32 = io_out_hreadyout & T33;
  assign T33 = T35 & T34;
  assign T34 = R26 ^ 1'h1;
  assign T35 = T30 ^ 1'h1;
  assign T36 = io_ins_0_hsel & io_ins_0_hreadyin;
  assign T37 = T30 | T19;
  assign io_out_hwdata = T38;
  assign T38 = T42 | T39;
  assign T39 = R40 ? io_ins_2_hwdata : 32'h0;
  assign T171 = reset ? 1'h1 : T41;
  assign T41 = io_out_hreadyout ? T1 : R40;
  assign T42 = T46 | T43;
  assign T43 = R44 ? io_ins_1_hwdata : 32'h0;
  assign T172 = reset ? 1'h1 : T45;
  assign T45 = io_out_hreadyout ? T19 : R44;
  assign T46 = R47 ? io_ins_0_hwdata : 32'h0;
  assign T173 = reset ? 1'h1 : T48;
  assign T48 = io_out_hreadyout ? T30 : R47;
  assign io_out_hmastlock = T49;
  assign T49 = T55 | T50;
  assign T50 = T1 ? T51 : 1'h0;
  assign T51 = R5 ? R52 : io_ins_2_hmastlock;
  assign T53 = T54 ? io_ins_2_hmastlock : R52;
  assign T54 = T10 & T9;
  assign T55 = T61 | T56;
  assign T56 = T19 ? T57 : 1'h0;
  assign T57 = R15 ? R58 : io_ins_1_hmastlock;
  assign T59 = T60 ? io_ins_1_hmastlock : R58;
  assign T60 = T21 & T20;
  assign T61 = T30 ? T62 : 1'h0;
  assign T62 = R26 ? R63 : io_ins_0_hmastlock;
  assign T64 = T65 ? io_ins_0_hmastlock : R63;
  assign T65 = T32 & T31;
  assign io_out_htrans = T66;
  assign T66 = T71 | T67;
  assign T67 = T1 ? T68 : 2'h0;
  assign T68 = R5 ? R69 : io_ins_2_htrans;
  assign T70 = T54 ? io_ins_2_htrans : R69;
  assign T71 = T76 | T72;
  assign T72 = T19 ? T73 : 2'h0;
  assign T73 = R15 ? R74 : io_ins_1_htrans;
  assign T75 = T60 ? io_ins_1_htrans : R74;
  assign T76 = T30 ? T77 : 2'h0;
  assign T77 = R26 ? R78 : io_ins_0_htrans;
  assign T79 = T65 ? io_ins_0_htrans : R78;
  assign io_out_hprot = T80;
  assign T80 = T85 | T81;
  assign T81 = T1 ? T82 : 4'h0;
  assign T82 = R5 ? R83 : io_ins_2_hprot;
  assign T84 = T54 ? io_ins_2_hprot : R83;
  assign T85 = T90 | T86;
  assign T86 = T19 ? T87 : 4'h0;
  assign T87 = R15 ? R88 : io_ins_1_hprot;
  assign T89 = T60 ? io_ins_1_hprot : R88;
  assign T90 = T30 ? T91 : 4'h0;
  assign T91 = R26 ? R92 : io_ins_0_hprot;
  assign T93 = T65 ? io_ins_0_hprot : R92;
  assign io_out_hburst = T94;
  assign T94 = T99 | T95;
  assign T95 = T1 ? T96 : 3'h0;
  assign T96 = R5 ? R97 : io_ins_2_hburst;
  assign T98 = T54 ? io_ins_2_hburst : R97;
  assign T99 = T104 | T100;
  assign T100 = T19 ? T101 : 3'h0;
  assign T101 = R15 ? R102 : io_ins_1_hburst;
  assign T103 = T60 ? io_ins_1_hburst : R102;
  assign T104 = T30 ? T105 : 3'h0;
  assign T105 = R26 ? R106 : io_ins_0_hburst;
  assign T107 = T65 ? io_ins_0_hburst : R106;
  assign io_out_hsize = T108;
  assign T108 = T113 | T109;
  assign T109 = T1 ? T110 : 3'h0;
  assign T110 = R5 ? R111 : io_ins_2_hsize;
  assign T112 = T54 ? io_ins_2_hsize : R111;
  assign T113 = T118 | T114;
  assign T114 = T19 ? T115 : 3'h0;
  assign T115 = R15 ? R116 : io_ins_1_hsize;
  assign T117 = T60 ? io_ins_1_hsize : R116;
  assign T118 = T30 ? T119 : 3'h0;
  assign T119 = R26 ? R120 : io_ins_0_hsize;
  assign T121 = T65 ? io_ins_0_hsize : R120;
  assign io_out_hwrite = T122;
  assign T122 = T127 | T123;
  assign T123 = T1 ? T124 : 1'h0;
  assign T124 = R5 ? R125 : io_ins_2_hwrite;
  assign T126 = T54 ? io_ins_2_hwrite : R125;
  assign T127 = T132 | T128;
  assign T128 = T19 ? T129 : 1'h0;
  assign T129 = R15 ? R130 : io_ins_1_hwrite;
  assign T131 = T60 ? io_ins_1_hwrite : R130;
  assign T132 = T30 ? T133 : 1'h0;
  assign T133 = R26 ? R134 : io_ins_0_hwrite;
  assign T135 = T65 ? io_ins_0_hwrite : R134;
  assign io_out_haddr = T136;
  assign T136 = T141 | T137;
  assign T137 = T1 ? T138 : 32'h0;
  assign T138 = R5 ? R139 : io_ins_2_haddr;
  assign T140 = T54 ? io_ins_2_haddr : R139;
  assign T141 = T146 | T142;
  assign T142 = T19 ? T143 : 32'h0;
  assign T143 = R15 ? R144 : io_ins_1_haddr;
  assign T145 = T60 ? io_ins_1_haddr : R144;
  assign T146 = T30 ? T147 : 32'h0;
  assign T147 = R26 ? R148 : io_ins_0_haddr;
  assign T149 = T65 ? io_ins_0_haddr : R148;
  assign io_ins_0_hresp = T150;
  assign T150 = R47 & io_out_hresp;
  assign io_ins_0_hreadyout = T151;
  assign T151 = io_out_hreadyout & T152;
  assign T152 = T153 | R47;
  assign T153 = R26 ^ 1'h1;
  assign io_ins_0_hrdata = T154;
  assign T154 = T155 & io_out_hrdata;
  assign T155 = 32'h0 - T174;
  assign T174 = {31'h0, R47};
  assign io_ins_1_hresp = T156;
  assign T156 = R44 & io_out_hresp;
  assign io_ins_1_hreadyout = T157;
  assign T157 = io_out_hreadyout & T158;
  assign T158 = T159 | R44;
  assign T159 = R15 ^ 1'h1;
  assign io_ins_1_hrdata = T160;
  assign T160 = T161 & io_out_hrdata;
  assign T161 = 32'h0 - T175;
  assign T175 = {31'h0, R44};
  assign io_ins_2_hresp = T162;
  assign T162 = R40 & io_out_hresp;
  assign io_ins_2_hreadyout = T163;
  assign T163 = io_out_hreadyout & T164;
  assign T164 = T165 | R40;
  assign T165 = R5 ^ 1'h1;
  assign io_ins_2_hrdata = T166;
  assign T166 = T167 & io_out_hrdata;
  assign T167 = 32'h0 - T176;
  assign T176 = {31'h0, R40};

  always @(posedge clk) begin
    if(reset) begin
      R5 <= 1'h0;
    end else if(T10) begin
      R5 <= T9;
    end else if(T8) begin
      R5 <= 1'h0;
    end
    if(reset) begin
      R15 <= 1'h0;
    end else if(T21) begin
      R15 <= T20;
    end else if(T18) begin
      R15 <= 1'h0;
    end
    if(reset) begin
      R26 <= 1'h0;
    end else if(T32) begin
      R26 <= T31;
    end else if(T29) begin
      R26 <= 1'h0;
    end
    if(reset) begin
      R40 <= 1'h1;
    end else if(io_out_hreadyout) begin
      R40 <= T1;
    end
    if(reset) begin
      R44 <= 1'h1;
    end else if(io_out_hreadyout) begin
      R44 <= T19;
    end
    if(reset) begin
      R47 <= 1'h1;
    end else if(io_out_hreadyout) begin
      R47 <= T30;
    end
    if(T54) begin
      R52 <= io_ins_2_hmastlock;
    end
    if(T60) begin
      R58 <= io_ins_1_hmastlock;
    end
    if(T65) begin
      R63 <= io_ins_0_hmastlock;
    end
    if(T54) begin
      R69 <= io_ins_2_htrans;
    end
    if(T60) begin
      R74 <= io_ins_1_htrans;
    end
    if(T65) begin
      R78 <= io_ins_0_htrans;
    end
    if(T54) begin
      R83 <= io_ins_2_hprot;
    end
    if(T60) begin
      R88 <= io_ins_1_hprot;
    end
    if(T65) begin
      R92 <= io_ins_0_hprot;
    end
    if(T54) begin
      R97 <= io_ins_2_hburst;
    end
    if(T60) begin
      R102 <= io_ins_1_hburst;
    end
    if(T65) begin
      R106 <= io_ins_0_hburst;
    end
    if(T54) begin
      R111 <= io_ins_2_hsize;
    end
    if(T60) begin
      R116 <= io_ins_1_hsize;
    end
    if(T65) begin
      R120 <= io_ins_0_hsize;
    end
    if(T54) begin
      R125 <= io_ins_2_hwrite;
    end
    if(T60) begin
      R130 <= io_ins_1_hwrite;
    end
    if(T65) begin
      R134 <= io_ins_0_hwrite;
    end
    if(T54) begin
      R139 <= io_ins_2_haddr;
    end
    if(T60) begin
      R144 <= io_ins_1_haddr;
    end
    if(T65) begin
      R148 <= io_ins_0_haddr;
    end
  end
endmodule

module HastiXbar(input clk, input reset,
    input [31:0] io_masters_2_haddr,
    input  io_masters_2_hwrite,
    input [2:0] io_masters_2_hsize,
    input [2:0] io_masters_2_hburst,
    input [3:0] io_masters_2_hprot,
    input [1:0] io_masters_2_htrans,
    input  io_masters_2_hmastlock,
    input [31:0] io_masters_2_hwdata,
    output[31:0] io_masters_2_hrdata,
    output io_masters_2_hready,
    output io_masters_2_hresp,
    input [31:0] io_masters_1_haddr,
    input  io_masters_1_hwrite,
    input [2:0] io_masters_1_hsize,
    input [2:0] io_masters_1_hburst,
    input [3:0] io_masters_1_hprot,
    input [1:0] io_masters_1_htrans,
    input  io_masters_1_hmastlock,
    input [31:0] io_masters_1_hwdata,
    output[31:0] io_masters_1_hrdata,
    output io_masters_1_hready,
    output io_masters_1_hresp,
    input [31:0] io_masters_0_haddr,
    input  io_masters_0_hwrite,
    input [2:0] io_masters_0_hsize,
    input [2:0] io_masters_0_hburst,
    input [3:0] io_masters_0_hprot,
    input [1:0] io_masters_0_htrans,
    input  io_masters_0_hmastlock,
    input [31:0] io_masters_0_hwdata,
    output[31:0] io_masters_0_hrdata,
    output io_masters_0_hready,
    output io_masters_0_hresp,
    output[31:0] io_slaves_2_haddr,
    output io_slaves_2_hwrite,
    output[2:0] io_slaves_2_hsize,
    output[2:0] io_slaves_2_hburst,
    output[3:0] io_slaves_2_hprot,
    output[1:0] io_slaves_2_htrans,
    output io_slaves_2_hmastlock,
    output[31:0] io_slaves_2_hwdata,
    input [31:0] io_slaves_2_hrdata,
    output io_slaves_2_hsel,
    output io_slaves_2_hreadyin,
    input  io_slaves_2_hreadyout,
    input  io_slaves_2_hresp,
    output[31:0] io_slaves_1_haddr,
    output io_slaves_1_hwrite,
    output[2:0] io_slaves_1_hsize,
    output[2:0] io_slaves_1_hburst,
    output[3:0] io_slaves_1_hprot,
    output[1:0] io_slaves_1_htrans,
    output io_slaves_1_hmastlock,
    output[31:0] io_slaves_1_hwdata,
    input [31:0] io_slaves_1_hrdata,
    output io_slaves_1_hsel,
    output io_slaves_1_hreadyin,
    input  io_slaves_1_hreadyout,
    input  io_slaves_1_hresp,
    output[31:0] io_slaves_0_haddr,
    output io_slaves_0_hwrite,
    output[2:0] io_slaves_0_hsize,
    output[2:0] io_slaves_0_hburst,
    output[3:0] io_slaves_0_hprot,
    output[1:0] io_slaves_0_htrans,
    output io_slaves_0_hmastlock,
    output[31:0] io_slaves_0_hwdata,
    input [31:0] io_slaves_0_hrdata,
    output io_slaves_0_hsel,
    output io_slaves_0_hreadyin,
    input  io_slaves_0_hreadyout,
    input  io_slaves_0_hresp
);

  wire[31:0] HastiBus_io_master_hrdata;
  wire HastiBus_io_master_hready;
  wire HastiBus_io_master_hresp;
  wire[31:0] HastiBus_io_slaves_2_haddr;
  wire HastiBus_io_slaves_2_hwrite;
  wire[2:0] HastiBus_io_slaves_2_hsize;
  wire[2:0] HastiBus_io_slaves_2_hburst;
  wire[3:0] HastiBus_io_slaves_2_hprot;
  wire[1:0] HastiBus_io_slaves_2_htrans;
  wire HastiBus_io_slaves_2_hmastlock;
  wire[31:0] HastiBus_io_slaves_2_hwdata;
  wire HastiBus_io_slaves_2_hsel;
  wire HastiBus_io_slaves_2_hreadyin;
  wire[31:0] HastiBus_io_slaves_1_haddr;
  wire HastiBus_io_slaves_1_hwrite;
  wire[2:0] HastiBus_io_slaves_1_hsize;
  wire[2:0] HastiBus_io_slaves_1_hburst;
  wire[3:0] HastiBus_io_slaves_1_hprot;
  wire[1:0] HastiBus_io_slaves_1_htrans;
  wire HastiBus_io_slaves_1_hmastlock;
  wire[31:0] HastiBus_io_slaves_1_hwdata;
  wire HastiBus_io_slaves_1_hsel;
  wire HastiBus_io_slaves_1_hreadyin;
  wire[31:0] HastiBus_io_slaves_0_haddr;
  wire HastiBus_io_slaves_0_hwrite;
  wire[2:0] HastiBus_io_slaves_0_hsize;
  wire[2:0] HastiBus_io_slaves_0_hburst;
  wire[3:0] HastiBus_io_slaves_0_hprot;
  wire[1:0] HastiBus_io_slaves_0_htrans;
  wire HastiBus_io_slaves_0_hmastlock;
  wire[31:0] HastiBus_io_slaves_0_hwdata;
  wire HastiBus_io_slaves_0_hsel;
  wire HastiBus_io_slaves_0_hreadyin;
  wire[31:0] HastiBus_1_io_master_hrdata;
  wire HastiBus_1_io_master_hready;
  wire HastiBus_1_io_master_hresp;
  wire[31:0] HastiBus_1_io_slaves_2_haddr;
  wire HastiBus_1_io_slaves_2_hwrite;
  wire[2:0] HastiBus_1_io_slaves_2_hsize;
  wire[2:0] HastiBus_1_io_slaves_2_hburst;
  wire[3:0] HastiBus_1_io_slaves_2_hprot;
  wire[1:0] HastiBus_1_io_slaves_2_htrans;
  wire HastiBus_1_io_slaves_2_hmastlock;
  wire[31:0] HastiBus_1_io_slaves_2_hwdata;
  wire HastiBus_1_io_slaves_2_hsel;
  wire HastiBus_1_io_slaves_2_hreadyin;
  wire[31:0] HastiBus_1_io_slaves_1_haddr;
  wire HastiBus_1_io_slaves_1_hwrite;
  wire[2:0] HastiBus_1_io_slaves_1_hsize;
  wire[2:0] HastiBus_1_io_slaves_1_hburst;
  wire[3:0] HastiBus_1_io_slaves_1_hprot;
  wire[1:0] HastiBus_1_io_slaves_1_htrans;
  wire HastiBus_1_io_slaves_1_hmastlock;
  wire[31:0] HastiBus_1_io_slaves_1_hwdata;
  wire HastiBus_1_io_slaves_1_hsel;
  wire HastiBus_1_io_slaves_1_hreadyin;
  wire[31:0] HastiBus_1_io_slaves_0_haddr;
  wire HastiBus_1_io_slaves_0_hwrite;
  wire[2:0] HastiBus_1_io_slaves_0_hsize;
  wire[2:0] HastiBus_1_io_slaves_0_hburst;
  wire[3:0] HastiBus_1_io_slaves_0_hprot;
  wire[1:0] HastiBus_1_io_slaves_0_htrans;
  wire HastiBus_1_io_slaves_0_hmastlock;
  wire[31:0] HastiBus_1_io_slaves_0_hwdata;
  wire HastiBus_1_io_slaves_0_hsel;
  wire HastiBus_1_io_slaves_0_hreadyin;
  wire[31:0] HastiBus_2_io_master_hrdata;
  wire HastiBus_2_io_master_hready;
  wire HastiBus_2_io_master_hresp;
  wire[31:0] HastiBus_2_io_slaves_2_haddr;
  wire HastiBus_2_io_slaves_2_hwrite;
  wire[2:0] HastiBus_2_io_slaves_2_hsize;
  wire[2:0] HastiBus_2_io_slaves_2_hburst;
  wire[3:0] HastiBus_2_io_slaves_2_hprot;
  wire[1:0] HastiBus_2_io_slaves_2_htrans;
  wire HastiBus_2_io_slaves_2_hmastlock;
  wire[31:0] HastiBus_2_io_slaves_2_hwdata;
  wire HastiBus_2_io_slaves_2_hsel;
  wire HastiBus_2_io_slaves_2_hreadyin;
  wire[31:0] HastiBus_2_io_slaves_1_haddr;
  wire HastiBus_2_io_slaves_1_hwrite;
  wire[2:0] HastiBus_2_io_slaves_1_hsize;
  wire[2:0] HastiBus_2_io_slaves_1_hburst;
  wire[3:0] HastiBus_2_io_slaves_1_hprot;
  wire[1:0] HastiBus_2_io_slaves_1_htrans;
  wire HastiBus_2_io_slaves_1_hmastlock;
  wire[31:0] HastiBus_2_io_slaves_1_hwdata;
  wire HastiBus_2_io_slaves_1_hsel;
  wire HastiBus_2_io_slaves_1_hreadyin;
  wire[31:0] HastiBus_2_io_slaves_0_haddr;
  wire HastiBus_2_io_slaves_0_hwrite;
  wire[2:0] HastiBus_2_io_slaves_0_hsize;
  wire[2:0] HastiBus_2_io_slaves_0_hburst;
  wire[3:0] HastiBus_2_io_slaves_0_hprot;
  wire[1:0] HastiBus_2_io_slaves_0_htrans;
  wire HastiBus_2_io_slaves_0_hmastlock;
  wire[31:0] HastiBus_2_io_slaves_0_hwdata;
  wire HastiBus_2_io_slaves_0_hsel;
  wire HastiBus_2_io_slaves_0_hreadyin;
  wire[31:0] HastiSlaveMux_io_ins_2_hrdata;
  wire HastiSlaveMux_io_ins_2_hreadyout;
  wire HastiSlaveMux_io_ins_2_hresp;
  wire[31:0] HastiSlaveMux_io_ins_1_hrdata;
  wire HastiSlaveMux_io_ins_1_hreadyout;
  wire HastiSlaveMux_io_ins_1_hresp;
  wire[31:0] HastiSlaveMux_io_ins_0_hrdata;
  wire HastiSlaveMux_io_ins_0_hreadyout;
  wire HastiSlaveMux_io_ins_0_hresp;
  wire[31:0] HastiSlaveMux_io_out_haddr;
  wire HastiSlaveMux_io_out_hwrite;
  wire[2:0] HastiSlaveMux_io_out_hsize;
  wire[2:0] HastiSlaveMux_io_out_hburst;
  wire[3:0] HastiSlaveMux_io_out_hprot;
  wire[1:0] HastiSlaveMux_io_out_htrans;
  wire HastiSlaveMux_io_out_hmastlock;
  wire[31:0] HastiSlaveMux_io_out_hwdata;
  wire HastiSlaveMux_io_out_hsel;
  wire HastiSlaveMux_io_out_hreadyin;
  wire[31:0] HastiSlaveMux_1_io_ins_2_hrdata;
  wire HastiSlaveMux_1_io_ins_2_hreadyout;
  wire HastiSlaveMux_1_io_ins_2_hresp;
  wire[31:0] HastiSlaveMux_1_io_ins_1_hrdata;
  wire HastiSlaveMux_1_io_ins_1_hreadyout;
  wire HastiSlaveMux_1_io_ins_1_hresp;
  wire[31:0] HastiSlaveMux_1_io_ins_0_hrdata;
  wire HastiSlaveMux_1_io_ins_0_hreadyout;
  wire HastiSlaveMux_1_io_ins_0_hresp;
  wire[31:0] HastiSlaveMux_1_io_out_haddr;
  wire HastiSlaveMux_1_io_out_hwrite;
  wire[2:0] HastiSlaveMux_1_io_out_hsize;
  wire[2:0] HastiSlaveMux_1_io_out_hburst;
  wire[3:0] HastiSlaveMux_1_io_out_hprot;
  wire[1:0] HastiSlaveMux_1_io_out_htrans;
  wire HastiSlaveMux_1_io_out_hmastlock;
  wire[31:0] HastiSlaveMux_1_io_out_hwdata;
  wire HastiSlaveMux_1_io_out_hsel;
  wire HastiSlaveMux_1_io_out_hreadyin;
  wire[31:0] HastiSlaveMux_2_io_ins_2_hrdata;
  wire HastiSlaveMux_2_io_ins_2_hreadyout;
  wire HastiSlaveMux_2_io_ins_2_hresp;
  wire[31:0] HastiSlaveMux_2_io_ins_1_hrdata;
  wire HastiSlaveMux_2_io_ins_1_hreadyout;
  wire HastiSlaveMux_2_io_ins_1_hresp;
  wire[31:0] HastiSlaveMux_2_io_ins_0_hrdata;
  wire HastiSlaveMux_2_io_ins_0_hreadyout;
  wire HastiSlaveMux_2_io_ins_0_hresp;
  wire[31:0] HastiSlaveMux_2_io_out_haddr;
  wire HastiSlaveMux_2_io_out_hwrite;
  wire[2:0] HastiSlaveMux_2_io_out_hsize;
  wire[2:0] HastiSlaveMux_2_io_out_hburst;
  wire[3:0] HastiSlaveMux_2_io_out_hprot;
  wire[1:0] HastiSlaveMux_2_io_out_htrans;
  wire HastiSlaveMux_2_io_out_hmastlock;
  wire[31:0] HastiSlaveMux_2_io_out_hwdata;
  wire HastiSlaveMux_2_io_out_hsel;
  wire HastiSlaveMux_2_io_out_hreadyin;


  assign io_slaves_0_hreadyin = HastiSlaveMux_io_out_hreadyin;
  assign io_slaves_0_hsel = HastiSlaveMux_io_out_hsel;
  assign io_slaves_0_hwdata = HastiSlaveMux_io_out_hwdata;
  assign io_slaves_0_hmastlock = HastiSlaveMux_io_out_hmastlock;
  assign io_slaves_0_htrans = HastiSlaveMux_io_out_htrans;
  assign io_slaves_0_hprot = HastiSlaveMux_io_out_hprot;
  assign io_slaves_0_hburst = HastiSlaveMux_io_out_hburst;
  assign io_slaves_0_hsize = HastiSlaveMux_io_out_hsize;
  assign io_slaves_0_hwrite = HastiSlaveMux_io_out_hwrite;
  assign io_slaves_0_haddr = HastiSlaveMux_io_out_haddr;
  assign io_slaves_1_hreadyin = HastiSlaveMux_1_io_out_hreadyin;
  assign io_slaves_1_hsel = HastiSlaveMux_1_io_out_hsel;
  assign io_slaves_1_hwdata = HastiSlaveMux_1_io_out_hwdata;
  assign io_slaves_1_hmastlock = HastiSlaveMux_1_io_out_hmastlock;
  assign io_slaves_1_htrans = HastiSlaveMux_1_io_out_htrans;
  assign io_slaves_1_hprot = HastiSlaveMux_1_io_out_hprot;
  assign io_slaves_1_hburst = HastiSlaveMux_1_io_out_hburst;
  assign io_slaves_1_hsize = HastiSlaveMux_1_io_out_hsize;
  assign io_slaves_1_hwrite = HastiSlaveMux_1_io_out_hwrite;
  assign io_slaves_1_haddr = HastiSlaveMux_1_io_out_haddr;
  assign io_slaves_2_hreadyin = HastiSlaveMux_2_io_out_hreadyin;
  assign io_slaves_2_hsel = HastiSlaveMux_2_io_out_hsel;
  assign io_slaves_2_hwdata = HastiSlaveMux_2_io_out_hwdata;
  assign io_slaves_2_hmastlock = HastiSlaveMux_2_io_out_hmastlock;
  assign io_slaves_2_htrans = HastiSlaveMux_2_io_out_htrans;
  assign io_slaves_2_hprot = HastiSlaveMux_2_io_out_hprot;
  assign io_slaves_2_hburst = HastiSlaveMux_2_io_out_hburst;
  assign io_slaves_2_hsize = HastiSlaveMux_2_io_out_hsize;
  assign io_slaves_2_hwrite = HastiSlaveMux_2_io_out_hwrite;
  assign io_slaves_2_haddr = HastiSlaveMux_2_io_out_haddr;
  assign io_masters_0_hresp = HastiBus_io_master_hresp;
  assign io_masters_0_hready = HastiBus_io_master_hready;
  assign io_masters_0_hrdata = HastiBus_io_master_hrdata;
  assign io_masters_1_hresp = HastiBus_1_io_master_hresp;
  assign io_masters_1_hready = HastiBus_1_io_master_hready;
  assign io_masters_1_hrdata = HastiBus_1_io_master_hrdata;
  assign io_masters_2_hresp = HastiBus_2_io_master_hresp;
  assign io_masters_2_hready = HastiBus_2_io_master_hready;
  assign io_masters_2_hrdata = HastiBus_2_io_master_hrdata;
  HastiBus HastiBus(.clk(clk), .reset(reset),
       .io_master_haddr( io_masters_0_haddr ),
       .io_master_hwrite( io_masters_0_hwrite ),
       .io_master_hsize( io_masters_0_hsize ),
       .io_master_hburst( io_masters_0_hburst ),
       .io_master_hprot( io_masters_0_hprot ),
       .io_master_htrans( io_masters_0_htrans ),
       .io_master_hmastlock( io_masters_0_hmastlock ),
       .io_master_hwdata( io_masters_0_hwdata ),
       .io_master_hrdata( HastiBus_io_master_hrdata ),
       .io_master_hready( HastiBus_io_master_hready ),
       .io_master_hresp( HastiBus_io_master_hresp ),
       .io_slaves_2_haddr( HastiBus_io_slaves_2_haddr ),
       .io_slaves_2_hwrite( HastiBus_io_slaves_2_hwrite ),
       .io_slaves_2_hsize( HastiBus_io_slaves_2_hsize ),
       .io_slaves_2_hburst( HastiBus_io_slaves_2_hburst ),
       .io_slaves_2_hprot( HastiBus_io_slaves_2_hprot ),
       .io_slaves_2_htrans( HastiBus_io_slaves_2_htrans ),
       .io_slaves_2_hmastlock( HastiBus_io_slaves_2_hmastlock ),
       .io_slaves_2_hwdata( HastiBus_io_slaves_2_hwdata ),
       .io_slaves_2_hrdata( HastiSlaveMux_2_io_ins_0_hrdata ),
       .io_slaves_2_hsel( HastiBus_io_slaves_2_hsel ),
       .io_slaves_2_hreadyin( HastiBus_io_slaves_2_hreadyin ),
       .io_slaves_2_hreadyout( HastiSlaveMux_2_io_ins_0_hreadyout ),
       .io_slaves_2_hresp( HastiSlaveMux_2_io_ins_0_hresp ),
       .io_slaves_1_haddr( HastiBus_io_slaves_1_haddr ),
       .io_slaves_1_hwrite( HastiBus_io_slaves_1_hwrite ),
       .io_slaves_1_hsize( HastiBus_io_slaves_1_hsize ),
       .io_slaves_1_hburst( HastiBus_io_slaves_1_hburst ),
       .io_slaves_1_hprot( HastiBus_io_slaves_1_hprot ),
       .io_slaves_1_htrans( HastiBus_io_slaves_1_htrans ),
       .io_slaves_1_hmastlock( HastiBus_io_slaves_1_hmastlock ),
       .io_slaves_1_hwdata( HastiBus_io_slaves_1_hwdata ),
       .io_slaves_1_hrdata( HastiSlaveMux_1_io_ins_0_hrdata ),
       .io_slaves_1_hsel( HastiBus_io_slaves_1_hsel ),
       .io_slaves_1_hreadyin( HastiBus_io_slaves_1_hreadyin ),
       .io_slaves_1_hreadyout( HastiSlaveMux_1_io_ins_0_hreadyout ),
       .io_slaves_1_hresp( HastiSlaveMux_1_io_ins_0_hresp ),
       .io_slaves_0_haddr( HastiBus_io_slaves_0_haddr ),
       .io_slaves_0_hwrite( HastiBus_io_slaves_0_hwrite ),
       .io_slaves_0_hsize( HastiBus_io_slaves_0_hsize ),
       .io_slaves_0_hburst( HastiBus_io_slaves_0_hburst ),
       .io_slaves_0_hprot( HastiBus_io_slaves_0_hprot ),
       .io_slaves_0_htrans( HastiBus_io_slaves_0_htrans ),
       .io_slaves_0_hmastlock( HastiBus_io_slaves_0_hmastlock ),
       .io_slaves_0_hwdata( HastiBus_io_slaves_0_hwdata ),
       .io_slaves_0_hrdata( HastiSlaveMux_io_ins_0_hrdata ),
       .io_slaves_0_hsel( HastiBus_io_slaves_0_hsel ),
       .io_slaves_0_hreadyin( HastiBus_io_slaves_0_hreadyin ),
       .io_slaves_0_hreadyout( HastiSlaveMux_io_ins_0_hreadyout ),
       .io_slaves_0_hresp( HastiSlaveMux_io_ins_0_hresp )
  );
  HastiBus HastiBus_1(.clk(clk), .reset(reset),
       .io_master_haddr( io_masters_1_haddr ),
       .io_master_hwrite( io_masters_1_hwrite ),
       .io_master_hsize( io_masters_1_hsize ),
       .io_master_hburst( io_masters_1_hburst ),
       .io_master_hprot( io_masters_1_hprot ),
       .io_master_htrans( io_masters_1_htrans ),
       .io_master_hmastlock( io_masters_1_hmastlock ),
       .io_master_hwdata( io_masters_1_hwdata ),
       .io_master_hrdata( HastiBus_1_io_master_hrdata ),
       .io_master_hready( HastiBus_1_io_master_hready ),
       .io_master_hresp( HastiBus_1_io_master_hresp ),
       .io_slaves_2_haddr( HastiBus_1_io_slaves_2_haddr ),
       .io_slaves_2_hwrite( HastiBus_1_io_slaves_2_hwrite ),
       .io_slaves_2_hsize( HastiBus_1_io_slaves_2_hsize ),
       .io_slaves_2_hburst( HastiBus_1_io_slaves_2_hburst ),
       .io_slaves_2_hprot( HastiBus_1_io_slaves_2_hprot ),
       .io_slaves_2_htrans( HastiBus_1_io_slaves_2_htrans ),
       .io_slaves_2_hmastlock( HastiBus_1_io_slaves_2_hmastlock ),
       .io_slaves_2_hwdata( HastiBus_1_io_slaves_2_hwdata ),
       .io_slaves_2_hrdata( HastiSlaveMux_2_io_ins_1_hrdata ),
       .io_slaves_2_hsel( HastiBus_1_io_slaves_2_hsel ),
       .io_slaves_2_hreadyin( HastiBus_1_io_slaves_2_hreadyin ),
       .io_slaves_2_hreadyout( HastiSlaveMux_2_io_ins_1_hreadyout ),
       .io_slaves_2_hresp( HastiSlaveMux_2_io_ins_1_hresp ),
       .io_slaves_1_haddr( HastiBus_1_io_slaves_1_haddr ),
       .io_slaves_1_hwrite( HastiBus_1_io_slaves_1_hwrite ),
       .io_slaves_1_hsize( HastiBus_1_io_slaves_1_hsize ),
       .io_slaves_1_hburst( HastiBus_1_io_slaves_1_hburst ),
       .io_slaves_1_hprot( HastiBus_1_io_slaves_1_hprot ),
       .io_slaves_1_htrans( HastiBus_1_io_slaves_1_htrans ),
       .io_slaves_1_hmastlock( HastiBus_1_io_slaves_1_hmastlock ),
       .io_slaves_1_hwdata( HastiBus_1_io_slaves_1_hwdata ),
       .io_slaves_1_hrdata( HastiSlaveMux_1_io_ins_1_hrdata ),
       .io_slaves_1_hsel( HastiBus_1_io_slaves_1_hsel ),
       .io_slaves_1_hreadyin( HastiBus_1_io_slaves_1_hreadyin ),
       .io_slaves_1_hreadyout( HastiSlaveMux_1_io_ins_1_hreadyout ),
       .io_slaves_1_hresp( HastiSlaveMux_1_io_ins_1_hresp ),
       .io_slaves_0_haddr( HastiBus_1_io_slaves_0_haddr ),
       .io_slaves_0_hwrite( HastiBus_1_io_slaves_0_hwrite ),
       .io_slaves_0_hsize( HastiBus_1_io_slaves_0_hsize ),
       .io_slaves_0_hburst( HastiBus_1_io_slaves_0_hburst ),
       .io_slaves_0_hprot( HastiBus_1_io_slaves_0_hprot ),
       .io_slaves_0_htrans( HastiBus_1_io_slaves_0_htrans ),
       .io_slaves_0_hmastlock( HastiBus_1_io_slaves_0_hmastlock ),
       .io_slaves_0_hwdata( HastiBus_1_io_slaves_0_hwdata ),
       .io_slaves_0_hrdata( HastiSlaveMux_io_ins_1_hrdata ),
       .io_slaves_0_hsel( HastiBus_1_io_slaves_0_hsel ),
       .io_slaves_0_hreadyin( HastiBus_1_io_slaves_0_hreadyin ),
       .io_slaves_0_hreadyout( HastiSlaveMux_io_ins_1_hreadyout ),
       .io_slaves_0_hresp( HastiSlaveMux_io_ins_1_hresp )
  );
  HastiBus HastiBus_2(.clk(clk), .reset(reset),
       .io_master_haddr( io_masters_2_haddr ),
       .io_master_hwrite( io_masters_2_hwrite ),
       .io_master_hsize( io_masters_2_hsize ),
       .io_master_hburst( io_masters_2_hburst ),
       .io_master_hprot( io_masters_2_hprot ),
       .io_master_htrans( io_masters_2_htrans ),
       .io_master_hmastlock( io_masters_2_hmastlock ),
       .io_master_hwdata( io_masters_2_hwdata ),
       .io_master_hrdata( HastiBus_2_io_master_hrdata ),
       .io_master_hready( HastiBus_2_io_master_hready ),
       .io_master_hresp( HastiBus_2_io_master_hresp ),
       .io_slaves_2_haddr( HastiBus_2_io_slaves_2_haddr ),
       .io_slaves_2_hwrite( HastiBus_2_io_slaves_2_hwrite ),
       .io_slaves_2_hsize( HastiBus_2_io_slaves_2_hsize ),
       .io_slaves_2_hburst( HastiBus_2_io_slaves_2_hburst ),
       .io_slaves_2_hprot( HastiBus_2_io_slaves_2_hprot ),
       .io_slaves_2_htrans( HastiBus_2_io_slaves_2_htrans ),
       .io_slaves_2_hmastlock( HastiBus_2_io_slaves_2_hmastlock ),
       .io_slaves_2_hwdata( HastiBus_2_io_slaves_2_hwdata ),
       .io_slaves_2_hrdata( HastiSlaveMux_2_io_ins_2_hrdata ),
       .io_slaves_2_hsel( HastiBus_2_io_slaves_2_hsel ),
       .io_slaves_2_hreadyin( HastiBus_2_io_slaves_2_hreadyin ),
       .io_slaves_2_hreadyout( HastiSlaveMux_2_io_ins_2_hreadyout ),
       .io_slaves_2_hresp( HastiSlaveMux_2_io_ins_2_hresp ),
       .io_slaves_1_haddr( HastiBus_2_io_slaves_1_haddr ),
       .io_slaves_1_hwrite( HastiBus_2_io_slaves_1_hwrite ),
       .io_slaves_1_hsize( HastiBus_2_io_slaves_1_hsize ),
       .io_slaves_1_hburst( HastiBus_2_io_slaves_1_hburst ),
       .io_slaves_1_hprot( HastiBus_2_io_slaves_1_hprot ),
       .io_slaves_1_htrans( HastiBus_2_io_slaves_1_htrans ),
       .io_slaves_1_hmastlock( HastiBus_2_io_slaves_1_hmastlock ),
       .io_slaves_1_hwdata( HastiBus_2_io_slaves_1_hwdata ),
       .io_slaves_1_hrdata( HastiSlaveMux_1_io_ins_2_hrdata ),
       .io_slaves_1_hsel( HastiBus_2_io_slaves_1_hsel ),
       .io_slaves_1_hreadyin( HastiBus_2_io_slaves_1_hreadyin ),
       .io_slaves_1_hreadyout( HastiSlaveMux_1_io_ins_2_hreadyout ),
       .io_slaves_1_hresp( HastiSlaveMux_1_io_ins_2_hresp ),
       .io_slaves_0_haddr( HastiBus_2_io_slaves_0_haddr ),
       .io_slaves_0_hwrite( HastiBus_2_io_slaves_0_hwrite ),
       .io_slaves_0_hsize( HastiBus_2_io_slaves_0_hsize ),
       .io_slaves_0_hburst( HastiBus_2_io_slaves_0_hburst ),
       .io_slaves_0_hprot( HastiBus_2_io_slaves_0_hprot ),
       .io_slaves_0_htrans( HastiBus_2_io_slaves_0_htrans ),
       .io_slaves_0_hmastlock( HastiBus_2_io_slaves_0_hmastlock ),
       .io_slaves_0_hwdata( HastiBus_2_io_slaves_0_hwdata ),
       .io_slaves_0_hrdata( HastiSlaveMux_io_ins_2_hrdata ),
       .io_slaves_0_hsel( HastiBus_2_io_slaves_0_hsel ),
       .io_slaves_0_hreadyin( HastiBus_2_io_slaves_0_hreadyin ),
       .io_slaves_0_hreadyout( HastiSlaveMux_io_ins_2_hreadyout ),
       .io_slaves_0_hresp( HastiSlaveMux_io_ins_2_hresp )
  );
  HastiSlaveMux HastiSlaveMux(.clk(clk), .reset(reset),
       .io_ins_2_haddr( HastiBus_2_io_slaves_0_haddr ),
       .io_ins_2_hwrite( HastiBus_2_io_slaves_0_hwrite ),
       .io_ins_2_hsize( HastiBus_2_io_slaves_0_hsize ),
       .io_ins_2_hburst( HastiBus_2_io_slaves_0_hburst ),
       .io_ins_2_hprot( HastiBus_2_io_slaves_0_hprot ),
       .io_ins_2_htrans( HastiBus_2_io_slaves_0_htrans ),
       .io_ins_2_hmastlock( HastiBus_2_io_slaves_0_hmastlock ),
       .io_ins_2_hwdata( HastiBus_2_io_slaves_0_hwdata ),
       .io_ins_2_hrdata( HastiSlaveMux_io_ins_2_hrdata ),
       .io_ins_2_hsel( HastiBus_2_io_slaves_0_hsel ),
       .io_ins_2_hreadyin( HastiBus_2_io_slaves_0_hreadyin ),
       .io_ins_2_hreadyout( HastiSlaveMux_io_ins_2_hreadyout ),
       .io_ins_2_hresp( HastiSlaveMux_io_ins_2_hresp ),
       .io_ins_1_haddr( HastiBus_1_io_slaves_0_haddr ),
       .io_ins_1_hwrite( HastiBus_1_io_slaves_0_hwrite ),
       .io_ins_1_hsize( HastiBus_1_io_slaves_0_hsize ),
       .io_ins_1_hburst( HastiBus_1_io_slaves_0_hburst ),
       .io_ins_1_hprot( HastiBus_1_io_slaves_0_hprot ),
       .io_ins_1_htrans( HastiBus_1_io_slaves_0_htrans ),
       .io_ins_1_hmastlock( HastiBus_1_io_slaves_0_hmastlock ),
       .io_ins_1_hwdata( HastiBus_1_io_slaves_0_hwdata ),
       .io_ins_1_hrdata( HastiSlaveMux_io_ins_1_hrdata ),
       .io_ins_1_hsel( HastiBus_1_io_slaves_0_hsel ),
       .io_ins_1_hreadyin( HastiBus_1_io_slaves_0_hreadyin ),
       .io_ins_1_hreadyout( HastiSlaveMux_io_ins_1_hreadyout ),
       .io_ins_1_hresp( HastiSlaveMux_io_ins_1_hresp ),
       .io_ins_0_haddr( HastiBus_io_slaves_0_haddr ),
       .io_ins_0_hwrite( HastiBus_io_slaves_0_hwrite ),
       .io_ins_0_hsize( HastiBus_io_slaves_0_hsize ),
       .io_ins_0_hburst( HastiBus_io_slaves_0_hburst ),
       .io_ins_0_hprot( HastiBus_io_slaves_0_hprot ),
       .io_ins_0_htrans( HastiBus_io_slaves_0_htrans ),
       .io_ins_0_hmastlock( HastiBus_io_slaves_0_hmastlock ),
       .io_ins_0_hwdata( HastiBus_io_slaves_0_hwdata ),
       .io_ins_0_hrdata( HastiSlaveMux_io_ins_0_hrdata ),
       .io_ins_0_hsel( HastiBus_io_slaves_0_hsel ),
       .io_ins_0_hreadyin( HastiBus_io_slaves_0_hreadyin ),
       .io_ins_0_hreadyout( HastiSlaveMux_io_ins_0_hreadyout ),
       .io_ins_0_hresp( HastiSlaveMux_io_ins_0_hresp ),
       .io_out_haddr( HastiSlaveMux_io_out_haddr ),
       .io_out_hwrite( HastiSlaveMux_io_out_hwrite ),
       .io_out_hsize( HastiSlaveMux_io_out_hsize ),
       .io_out_hburst( HastiSlaveMux_io_out_hburst ),
       .io_out_hprot( HastiSlaveMux_io_out_hprot ),
       .io_out_htrans( HastiSlaveMux_io_out_htrans ),
       .io_out_hmastlock( HastiSlaveMux_io_out_hmastlock ),
       .io_out_hwdata( HastiSlaveMux_io_out_hwdata ),
       .io_out_hrdata( io_slaves_0_hrdata ),
       .io_out_hsel( HastiSlaveMux_io_out_hsel ),
       .io_out_hreadyin( HastiSlaveMux_io_out_hreadyin ),
       .io_out_hreadyout( io_slaves_0_hreadyout ),
       .io_out_hresp( io_slaves_0_hresp )
  );
  HastiSlaveMux HastiSlaveMux_1(.clk(clk), .reset(reset),
       .io_ins_2_haddr( HastiBus_2_io_slaves_1_haddr ),
       .io_ins_2_hwrite( HastiBus_2_io_slaves_1_hwrite ),
       .io_ins_2_hsize( HastiBus_2_io_slaves_1_hsize ),
       .io_ins_2_hburst( HastiBus_2_io_slaves_1_hburst ),
       .io_ins_2_hprot( HastiBus_2_io_slaves_1_hprot ),
       .io_ins_2_htrans( HastiBus_2_io_slaves_1_htrans ),
       .io_ins_2_hmastlock( HastiBus_2_io_slaves_1_hmastlock ),
       .io_ins_2_hwdata( HastiBus_2_io_slaves_1_hwdata ),
       .io_ins_2_hrdata( HastiSlaveMux_1_io_ins_2_hrdata ),
       .io_ins_2_hsel( HastiBus_2_io_slaves_1_hsel ),
       .io_ins_2_hreadyin( HastiBus_2_io_slaves_1_hreadyin ),
       .io_ins_2_hreadyout( HastiSlaveMux_1_io_ins_2_hreadyout ),
       .io_ins_2_hresp( HastiSlaveMux_1_io_ins_2_hresp ),
       .io_ins_1_haddr( HastiBus_1_io_slaves_1_haddr ),
       .io_ins_1_hwrite( HastiBus_1_io_slaves_1_hwrite ),
       .io_ins_1_hsize( HastiBus_1_io_slaves_1_hsize ),
       .io_ins_1_hburst( HastiBus_1_io_slaves_1_hburst ),
       .io_ins_1_hprot( HastiBus_1_io_slaves_1_hprot ),
       .io_ins_1_htrans( HastiBus_1_io_slaves_1_htrans ),
       .io_ins_1_hmastlock( HastiBus_1_io_slaves_1_hmastlock ),
       .io_ins_1_hwdata( HastiBus_1_io_slaves_1_hwdata ),
       .io_ins_1_hrdata( HastiSlaveMux_1_io_ins_1_hrdata ),
       .io_ins_1_hsel( HastiBus_1_io_slaves_1_hsel ),
       .io_ins_1_hreadyin( HastiBus_1_io_slaves_1_hreadyin ),
       .io_ins_1_hreadyout( HastiSlaveMux_1_io_ins_1_hreadyout ),
       .io_ins_1_hresp( HastiSlaveMux_1_io_ins_1_hresp ),
       .io_ins_0_haddr( HastiBus_io_slaves_1_haddr ),
       .io_ins_0_hwrite( HastiBus_io_slaves_1_hwrite ),
       .io_ins_0_hsize( HastiBus_io_slaves_1_hsize ),
       .io_ins_0_hburst( HastiBus_io_slaves_1_hburst ),
       .io_ins_0_hprot( HastiBus_io_slaves_1_hprot ),
       .io_ins_0_htrans( HastiBus_io_slaves_1_htrans ),
       .io_ins_0_hmastlock( HastiBus_io_slaves_1_hmastlock ),
       .io_ins_0_hwdata( HastiBus_io_slaves_1_hwdata ),
       .io_ins_0_hrdata( HastiSlaveMux_1_io_ins_0_hrdata ),
       .io_ins_0_hsel( HastiBus_io_slaves_1_hsel ),
       .io_ins_0_hreadyin( HastiBus_io_slaves_1_hreadyin ),
       .io_ins_0_hreadyout( HastiSlaveMux_1_io_ins_0_hreadyout ),
       .io_ins_0_hresp( HastiSlaveMux_1_io_ins_0_hresp ),
       .io_out_haddr( HastiSlaveMux_1_io_out_haddr ),
       .io_out_hwrite( HastiSlaveMux_1_io_out_hwrite ),
       .io_out_hsize( HastiSlaveMux_1_io_out_hsize ),
       .io_out_hburst( HastiSlaveMux_1_io_out_hburst ),
       .io_out_hprot( HastiSlaveMux_1_io_out_hprot ),
       .io_out_htrans( HastiSlaveMux_1_io_out_htrans ),
       .io_out_hmastlock( HastiSlaveMux_1_io_out_hmastlock ),
       .io_out_hwdata( HastiSlaveMux_1_io_out_hwdata ),
       .io_out_hrdata( io_slaves_1_hrdata ),
       .io_out_hsel( HastiSlaveMux_1_io_out_hsel ),
       .io_out_hreadyin( HastiSlaveMux_1_io_out_hreadyin ),
       .io_out_hreadyout( io_slaves_1_hreadyout ),
       .io_out_hresp( io_slaves_1_hresp )
  );
  HastiSlaveMux HastiSlaveMux_2(.clk(clk), .reset(reset),
       .io_ins_2_haddr( HastiBus_2_io_slaves_2_haddr ),
       .io_ins_2_hwrite( HastiBus_2_io_slaves_2_hwrite ),
       .io_ins_2_hsize( HastiBus_2_io_slaves_2_hsize ),
       .io_ins_2_hburst( HastiBus_2_io_slaves_2_hburst ),
       .io_ins_2_hprot( HastiBus_2_io_slaves_2_hprot ),
       .io_ins_2_htrans( HastiBus_2_io_slaves_2_htrans ),
       .io_ins_2_hmastlock( HastiBus_2_io_slaves_2_hmastlock ),
       .io_ins_2_hwdata( HastiBus_2_io_slaves_2_hwdata ),
       .io_ins_2_hrdata( HastiSlaveMux_2_io_ins_2_hrdata ),
       .io_ins_2_hsel( HastiBus_2_io_slaves_2_hsel ),
       .io_ins_2_hreadyin( HastiBus_2_io_slaves_2_hreadyin ),
       .io_ins_2_hreadyout( HastiSlaveMux_2_io_ins_2_hreadyout ),
       .io_ins_2_hresp( HastiSlaveMux_2_io_ins_2_hresp ),
       .io_ins_1_haddr( HastiBus_1_io_slaves_2_haddr ),
       .io_ins_1_hwrite( HastiBus_1_io_slaves_2_hwrite ),
       .io_ins_1_hsize( HastiBus_1_io_slaves_2_hsize ),
       .io_ins_1_hburst( HastiBus_1_io_slaves_2_hburst ),
       .io_ins_1_hprot( HastiBus_1_io_slaves_2_hprot ),
       .io_ins_1_htrans( HastiBus_1_io_slaves_2_htrans ),
       .io_ins_1_hmastlock( HastiBus_1_io_slaves_2_hmastlock ),
       .io_ins_1_hwdata( HastiBus_1_io_slaves_2_hwdata ),
       .io_ins_1_hrdata( HastiSlaveMux_2_io_ins_1_hrdata ),
       .io_ins_1_hsel( HastiBus_1_io_slaves_2_hsel ),
       .io_ins_1_hreadyin( HastiBus_1_io_slaves_2_hreadyin ),
       .io_ins_1_hreadyout( HastiSlaveMux_2_io_ins_1_hreadyout ),
       .io_ins_1_hresp( HastiSlaveMux_2_io_ins_1_hresp ),
       .io_ins_0_haddr( HastiBus_io_slaves_2_haddr ),
       .io_ins_0_hwrite( HastiBus_io_slaves_2_hwrite ),
       .io_ins_0_hsize( HastiBus_io_slaves_2_hsize ),
       .io_ins_0_hburst( HastiBus_io_slaves_2_hburst ),
       .io_ins_0_hprot( HastiBus_io_slaves_2_hprot ),
       .io_ins_0_htrans( HastiBus_io_slaves_2_htrans ),
       .io_ins_0_hmastlock( HastiBus_io_slaves_2_hmastlock ),
       .io_ins_0_hwdata( HastiBus_io_slaves_2_hwdata ),
       .io_ins_0_hrdata( HastiSlaveMux_2_io_ins_0_hrdata ),
       .io_ins_0_hsel( HastiBus_io_slaves_2_hsel ),
       .io_ins_0_hreadyin( HastiBus_io_slaves_2_hreadyin ),
       .io_ins_0_hreadyout( HastiSlaveMux_2_io_ins_0_hreadyout ),
       .io_ins_0_hresp( HastiSlaveMux_2_io_ins_0_hresp ),
       .io_out_haddr( HastiSlaveMux_2_io_out_haddr ),
       .io_out_hwrite( HastiSlaveMux_2_io_out_hwrite ),
       .io_out_hsize( HastiSlaveMux_2_io_out_hsize ),
       .io_out_hburst( HastiSlaveMux_2_io_out_hburst ),
       .io_out_hprot( HastiSlaveMux_2_io_out_hprot ),
       .io_out_htrans( HastiSlaveMux_2_io_out_htrans ),
       .io_out_hmastlock( HastiSlaveMux_2_io_out_hmastlock ),
       .io_out_hwdata( HastiSlaveMux_2_io_out_hwdata ),
       .io_out_hrdata( io_slaves_2_hrdata ),
       .io_out_hsel( HastiSlaveMux_2_io_out_hsel ),
       .io_out_hreadyin( HastiSlaveMux_2_io_out_hreadyin ),
       .io_out_hreadyout( io_slaves_2_hreadyout ),
       .io_out_hresp( io_slaves_2_hresp )
  );
endmodule

module HastiToPociBridge(input clk, input reset,
    input [31:0] io_in_haddr,
    input  io_in_hwrite,
    input [2:0] io_in_hsize,
    input [2:0] io_in_hburst,
    input [3:0] io_in_hprot,
    input [1:0] io_in_htrans,
    input  io_in_hmastlock,
    input [31:0] io_in_hwdata,
    output[31:0] io_in_hrdata,
    input  io_in_hsel,
    input  io_in_hreadyin,
    output io_in_hreadyout,
    output io_in_hresp,
    output[31:0] io_out_paddr,
    output io_out_pwrite,
    output io_out_psel,
    output io_out_penable,
    output[31:0] io_out_pwdata,
    input [31:0] io_out_prdata,
    input  io_out_pready,
    input  io_out_pslverr
);

  wire T0;
  reg [1:0] state;
  wire[1:0] T26;
  wire[1:0] T1;
  wire[1:0] T2;
  wire[1:0] T3;
  wire[1:0] T4;
  wire[1:0] T5;
  wire T6;
  wire transfer;
  wire T7;
  wire T8;
  wire T9;
  wire T10;
  wire T11;
  wire T12;
  wire T13;
  wire T14;
  wire T15;
  wire T16;
  wire T17;
  wire T18;
  wire T19;
  reg  hwrite_reg;
  wire T20;
  reg [31:0] haddr_reg;
  wire[31:0] T21;
  wire T22;
  wire T23;
  wire T24;
  wire T25;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    state = {1{$random}};
    hwrite_reg = {1{$random}};
    haddr_reg = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_out_pwdata = io_in_hwdata;
  assign io_out_penable = T0;
  assign T0 = state == 2'h2;
  assign T26 = reset ? 2'h0 : T1;
  assign T1 = T17 ? 2'h2 : T2;
  assign T2 = T15 ? 2'h1 : T3;
  assign T3 = T11 ? 2'h0 : T4;
  assign T4 = T10 ? 2'h2 : T5;
  assign T5 = T6 ? 2'h1 : state;
  assign T6 = T9 & transfer;
  assign transfer = T8 & T7;
  assign T7 = io_in_htrans[1];
  assign T8 = io_in_hsel & io_in_hreadyin;
  assign T9 = 2'h0 == state;
  assign T10 = 2'h1 == state;
  assign T11 = T14 & T12;
  assign T12 = io_out_pready & T13;
  assign T13 = ~ transfer;
  assign T14 = 2'h2 == state;
  assign T15 = T14 & T16;
  assign T16 = io_out_pready & transfer;
  assign T17 = T14 & T18;
  assign T18 = ~ io_out_pready;
  assign io_out_psel = T19;
  assign T19 = state != 2'h0;
  assign io_out_pwrite = hwrite_reg;
  assign T20 = transfer ? io_in_hwrite : hwrite_reg;
  assign io_out_paddr = haddr_reg;
  assign T21 = transfer ? io_in_haddr : haddr_reg;
  assign io_in_hresp = io_out_pslverr;
  assign io_in_hreadyout = T22;
  assign T22 = T24 | T23;
  assign T23 = state == 2'h0;
  assign T24 = T25 & io_out_pready;
  assign T25 = state == 2'h2;
  assign io_in_hrdata = io_out_prdata;

  always @(posedge clk) begin
    if(reset) begin
      state <= 2'h0;
    end else if(T17) begin
      state <= 2'h2;
    end else if(T15) begin
      state <= 2'h1;
    end else if(T11) begin
      state <= 2'h0;
    end else if(T10) begin
      state <= 2'h2;
    end else if(T6) begin
      state <= 2'h1;
    end
    if(transfer) begin
      hwrite_reg <= io_in_hwrite;
    end
    if(transfer) begin
      haddr_reg <= io_in_haddr;
    end
  end
endmodule

module PociBus(
    input [31:0] io_master_paddr,
    input  io_master_pwrite,
    input  io_master_psel,
    input  io_master_penable,
    input [31:0] io_master_pwdata,
    output[31:0] io_master_prdata,
    output io_master_pready,
    output io_master_pslverr,
    output[31:0] io_slaves_2_paddr,
    output io_slaves_2_pwrite,
    output io_slaves_2_psel,
    output io_slaves_2_penable,
    output[31:0] io_slaves_2_pwdata,
    input [31:0] io_slaves_2_prdata,
    input  io_slaves_2_pready,
    input  io_slaves_2_pslverr,
    output[31:0] io_slaves_1_paddr,
    output io_slaves_1_pwrite,
    output io_slaves_1_psel,
    output io_slaves_1_penable,
    output[31:0] io_slaves_1_pwdata,
    input [31:0] io_slaves_1_prdata,
    input  io_slaves_1_pready,
    input  io_slaves_1_pslverr,
    output[31:0] io_slaves_0_paddr,
    output io_slaves_0_pwrite,
    output io_slaves_0_psel,
    output io_slaves_0_penable,
    output[31:0] io_slaves_0_pwdata,
    input [31:0] io_slaves_0_prdata,
    input  io_slaves_0_pready,
    input  io_slaves_0_pslverr
);

  wire T0;
  wire T1;
  wire[2:0] T2;
  wire[2:0] T3;
  wire[2:0] T4;
  wire T5;
  wire T6;
  wire[3:0] T7;
  wire T8;
  wire T9;
  wire[3:0] T10;
  wire T11;
  wire T12;
  wire[3:0] T13;
  wire T14;
  wire T15;
  wire T16;
  wire T17;
  wire T18;
  wire T19;
  wire T20;
  wire T21;
  wire T22;
  wire T23;
  wire T24;
  wire T25;
  wire T26;
  wire T27;
  wire[31:0] T28;
  wire[31:0] T29;
  wire[31:0] T30;
  wire[31:0] T31;
  wire[31:0] T32;


  assign io_slaves_0_pwdata = io_master_pwdata;
  assign io_slaves_0_penable = T0;
  assign T0 = io_master_penable & T1;
  assign T1 = T2[0];
  assign T2 = T11 ? 3'h1 : T3;
  assign T3 = T8 ? 3'h2 : T4;
  assign T4 = T5 ? 3'h4 : 3'h0;
  assign T5 = T6 & io_master_psel;
  assign T6 = T7 == 4'h0;
  assign T7 = io_master_paddr[27:24];
  assign T8 = T9 & io_master_psel;
  assign T9 = T10 == 4'h1;
  assign T10 = io_master_paddr[27:24];
  assign T11 = T12 & io_master_psel;
  assign T12 = T13 == 4'h2;
  assign T13 = io_master_paddr[27:24];
  assign io_slaves_0_psel = T1;
  assign io_slaves_0_pwrite = io_master_pwrite;
  assign io_slaves_0_paddr = io_master_paddr;
  assign io_slaves_1_pwdata = io_master_pwdata;
  assign io_slaves_1_penable = T14;
  assign T14 = io_master_penable & T15;
  assign T15 = T2[1];
  assign io_slaves_1_psel = T15;
  assign io_slaves_1_pwrite = io_master_pwrite;
  assign io_slaves_1_paddr = io_master_paddr;
  assign io_slaves_2_pwdata = io_master_pwdata;
  assign io_slaves_2_penable = T16;
  assign T16 = io_master_penable & T17;
  assign T17 = T2[2];
  assign io_slaves_2_psel = T17;
  assign io_slaves_2_pwrite = io_master_pwrite;
  assign io_slaves_2_paddr = io_master_paddr;
  assign io_master_pslverr = T18;
  assign T18 = T20 | T19;
  assign T19 = T17 ? io_slaves_2_pslverr : 1'h0;
  assign T20 = T22 | T21;
  assign T21 = T15 ? io_slaves_1_pslverr : 1'h0;
  assign T22 = T1 ? io_slaves_0_pslverr : 1'h0;
  assign io_master_pready = T23;
  assign T23 = T25 | T24;
  assign T24 = T17 ? io_slaves_2_pready : 1'h0;
  assign T25 = T27 | T26;
  assign T26 = T15 ? io_slaves_1_pready : 1'h0;
  assign T27 = T1 ? io_slaves_0_pready : 1'h0;
  assign io_master_prdata = T28;
  assign T28 = T30 | T29;
  assign T29 = T17 ? io_slaves_2_prdata : 32'h0;
  assign T30 = T32 | T31;
  assign T31 = T15 ? io_slaves_1_prdata : 32'h0;
  assign T32 = T1 ? io_slaves_0_prdata : 32'h0;
endmodule

module BusHarness(input clk, input reset,
    input [31:0] io_jtag_haddr,
    input  io_jtag_hwrite,
    input [2:0] io_jtag_hsize,
    input [2:0] io_jtag_hburst,
    input [3:0] io_jtag_hprot,
    input [1:0] io_jtag_htrans,
    input  io_jtag_hmastlock,
    input [31:0] io_jtag_hwdata,
    output[31:0] io_jtag_hrdata,
    output io_jtag_hready,
    output io_jtag_hresp,
    input [31:0] io_dmem_haddr,
    input  io_dmem_hwrite,
    input [2:0] io_dmem_hsize,
    input [2:0] io_dmem_hburst,
    input [3:0] io_dmem_hprot,
    input [1:0] io_dmem_htrans,
    input  io_dmem_hmastlock,
    input [31:0] io_dmem_hwdata,
    output[31:0] io_dmem_hrdata,
    output io_dmem_hready,
    output io_dmem_hresp,
    input [31:0] io_imem_haddr,
    input  io_imem_hwrite,
    input [2:0] io_imem_hsize,
    input [2:0] io_imem_hburst,
    input [3:0] io_imem_hprot,
    input [1:0] io_imem_htrans,
    input  io_imem_hmastlock,
    input [31:0] io_imem_hwdata,
    output[31:0] io_imem_hrdata,
    output io_imem_hready,
    output io_imem_hresp,
    output[31:0] io_uart_paddr,
    output io_uart_pwrite,
    output io_uart_psel,
    output io_uart_penable,
    output[31:0] io_uart_pwdata,
    input [31:0] io_uart_prdata,
    input  io_uart_pready,
    input  io_uart_pslverr,
    output[31:0] io_spi_paddr,
    output io_spi_pwrite,
    output io_spi_psel,
    output io_spi_penable,
    output[31:0] io_spi_pwdata,
    input [31:0] io_spi_prdata,
    input  io_spi_pready,
    input  io_spi_pslverr,
    output[31:0] io_i2c_paddr,
    output io_i2c_pwrite,
    output io_i2c_psel,
    output io_i2c_penable,
    output[31:0] io_i2c_pwdata,
    input [31:0] io_i2c_prdata,
    input  io_i2c_pready,
    input  io_i2c_pslverr,
    output[31:0] io_datamem_haddr,
    output io_datamem_hwrite,
    output[2:0] io_datamem_hsize,
    output[2:0] io_datamem_hburst,
    output[3:0] io_datamem_hprot,
    output[1:0] io_datamem_htrans,
    output io_datamem_hmastlock,
    output[31:0] io_datamem_hwdata,
    input [31:0] io_datamem_hrdata,
    output io_datamem_hsel,
    output io_datamem_hreadyin,
    input  io_datamem_hreadyout,
    input  io_datamem_hresp,
    output[31:0] io_codemem_haddr,
    output io_codemem_hwrite,
    output[2:0] io_codemem_hsize,
    output[2:0] io_codemem_hburst,
    output[3:0] io_codemem_hprot,
    output[1:0] io_codemem_htrans,
    output io_codemem_hmastlock,
    output[31:0] io_codemem_hwdata,
    input [31:0] io_codemem_hrdata,
    output io_codemem_hsel,
    output io_codemem_hreadyin,
    input  io_codemem_hreadyout,
    input  io_codemem_hresp
);

  wire[31:0] bridge0_inst_io_in_hrdata;
  wire bridge0_inst_io_in_hreadyout;
  wire bridge0_inst_io_in_hresp;
  wire[31:0] bridge0_inst_io_out_paddr;
  wire bridge0_inst_io_out_pwrite;
  wire bridge0_inst_io_out_psel;
  wire bridge0_inst_io_out_penable;
  wire[31:0] bridge0_inst_io_out_pwdata;
  wire[31:0] bridge0_apb_xbar_io_master_prdata;
  wire bridge0_apb_xbar_io_master_pready;
  wire bridge0_apb_xbar_io_master_pslverr;
  wire[31:0] bridge0_apb_xbar_io_slaves_2_paddr;
  wire bridge0_apb_xbar_io_slaves_2_pwrite;
  wire bridge0_apb_xbar_io_slaves_2_psel;
  wire bridge0_apb_xbar_io_slaves_2_penable;
  wire[31:0] bridge0_apb_xbar_io_slaves_2_pwdata;
  wire[31:0] bridge0_apb_xbar_io_slaves_1_paddr;
  wire bridge0_apb_xbar_io_slaves_1_pwrite;
  wire bridge0_apb_xbar_io_slaves_1_psel;
  wire bridge0_apb_xbar_io_slaves_1_penable;
  wire[31:0] bridge0_apb_xbar_io_slaves_1_pwdata;
  wire[31:0] bridge0_apb_xbar_io_slaves_0_paddr;
  wire bridge0_apb_xbar_io_slaves_0_pwrite;
  wire bridge0_apb_xbar_io_slaves_0_psel;
  wire bridge0_apb_xbar_io_slaves_0_penable;
  wire[31:0] bridge0_apb_xbar_io_slaves_0_pwdata;
  wire[31:0] ahb_xbar_io_masters_2_hrdata;
  wire ahb_xbar_io_masters_2_hready;
  wire ahb_xbar_io_masters_2_hresp;
  wire[31:0] ahb_xbar_io_masters_1_hrdata;
  wire ahb_xbar_io_masters_1_hready;
  wire ahb_xbar_io_masters_1_hresp;
  wire[31:0] ahb_xbar_io_masters_0_hrdata;
  wire ahb_xbar_io_masters_0_hready;
  wire ahb_xbar_io_masters_0_hresp;
  wire[31:0] ahb_xbar_io_slaves_2_haddr;
  wire ahb_xbar_io_slaves_2_hwrite;
  wire[2:0] ahb_xbar_io_slaves_2_hsize;
  wire[2:0] ahb_xbar_io_slaves_2_hburst;
  wire[3:0] ahb_xbar_io_slaves_2_hprot;
  wire[1:0] ahb_xbar_io_slaves_2_htrans;
  wire ahb_xbar_io_slaves_2_hmastlock;
  wire[31:0] ahb_xbar_io_slaves_2_hwdata;
  wire ahb_xbar_io_slaves_2_hsel;
  wire ahb_xbar_io_slaves_2_hreadyin;
  wire[31:0] ahb_xbar_io_slaves_1_haddr;
  wire ahb_xbar_io_slaves_1_hwrite;
  wire[2:0] ahb_xbar_io_slaves_1_hsize;
  wire[2:0] ahb_xbar_io_slaves_1_hburst;
  wire[3:0] ahb_xbar_io_slaves_1_hprot;
  wire[1:0] ahb_xbar_io_slaves_1_htrans;
  wire ahb_xbar_io_slaves_1_hmastlock;
  wire[31:0] ahb_xbar_io_slaves_1_hwdata;
  wire ahb_xbar_io_slaves_1_hsel;
  wire ahb_xbar_io_slaves_1_hreadyin;
  wire[31:0] ahb_xbar_io_slaves_0_haddr;
  wire ahb_xbar_io_slaves_0_hwrite;
  wire[2:0] ahb_xbar_io_slaves_0_hsize;
  wire[2:0] ahb_xbar_io_slaves_0_hburst;
  wire[3:0] ahb_xbar_io_slaves_0_hprot;
  wire[1:0] ahb_xbar_io_slaves_0_htrans;
  wire ahb_xbar_io_slaves_0_hmastlock;
  wire[31:0] ahb_xbar_io_slaves_0_hwdata;
  wire ahb_xbar_io_slaves_0_hsel;
  wire ahb_xbar_io_slaves_0_hreadyin;


  assign io_codemem_hreadyin = ahb_xbar_io_slaves_2_hreadyin;
  assign io_codemem_hsel = ahb_xbar_io_slaves_2_hsel;
  assign io_codemem_hwdata = ahb_xbar_io_slaves_2_hwdata;
  assign io_codemem_hmastlock = ahb_xbar_io_slaves_2_hmastlock;
  assign io_codemem_htrans = ahb_xbar_io_slaves_2_htrans;
  assign io_codemem_hprot = ahb_xbar_io_slaves_2_hprot;
  assign io_codemem_hburst = ahb_xbar_io_slaves_2_hburst;
  assign io_codemem_hsize = ahb_xbar_io_slaves_2_hsize;
  assign io_codemem_hwrite = ahb_xbar_io_slaves_2_hwrite;
  assign io_codemem_haddr = ahb_xbar_io_slaves_2_haddr;
  assign io_datamem_hreadyin = ahb_xbar_io_slaves_1_hreadyin;
  assign io_datamem_hsel = ahb_xbar_io_slaves_1_hsel;
  assign io_datamem_hwdata = ahb_xbar_io_slaves_1_hwdata;
  assign io_datamem_hmastlock = ahb_xbar_io_slaves_1_hmastlock;
  assign io_datamem_htrans = ahb_xbar_io_slaves_1_htrans;
  assign io_datamem_hprot = ahb_xbar_io_slaves_1_hprot;
  assign io_datamem_hburst = ahb_xbar_io_slaves_1_hburst;
  assign io_datamem_hsize = ahb_xbar_io_slaves_1_hsize;
  assign io_datamem_hwrite = ahb_xbar_io_slaves_1_hwrite;
  assign io_datamem_haddr = ahb_xbar_io_slaves_1_haddr;
  assign io_i2c_pwdata = bridge0_apb_xbar_io_slaves_2_pwdata;
  assign io_i2c_penable = bridge0_apb_xbar_io_slaves_2_penable;
  assign io_i2c_psel = bridge0_apb_xbar_io_slaves_2_psel;
  assign io_i2c_pwrite = bridge0_apb_xbar_io_slaves_2_pwrite;
  assign io_i2c_paddr = bridge0_apb_xbar_io_slaves_2_paddr;
  assign io_spi_pwdata = bridge0_apb_xbar_io_slaves_1_pwdata;
  assign io_spi_penable = bridge0_apb_xbar_io_slaves_1_penable;
  assign io_spi_psel = bridge0_apb_xbar_io_slaves_1_psel;
  assign io_spi_pwrite = bridge0_apb_xbar_io_slaves_1_pwrite;
  assign io_spi_paddr = bridge0_apb_xbar_io_slaves_1_paddr;
  assign io_uart_pwdata = bridge0_apb_xbar_io_slaves_0_pwdata;
  assign io_uart_penable = bridge0_apb_xbar_io_slaves_0_penable;
  assign io_uart_psel = bridge0_apb_xbar_io_slaves_0_psel;
  assign io_uart_pwrite = bridge0_apb_xbar_io_slaves_0_pwrite;
  assign io_uart_paddr = bridge0_apb_xbar_io_slaves_0_paddr;
  assign io_imem_hresp = ahb_xbar_io_masters_2_hresp;
  assign io_imem_hready = ahb_xbar_io_masters_2_hready;
  assign io_imem_hrdata = ahb_xbar_io_masters_2_hrdata;
  assign io_dmem_hresp = ahb_xbar_io_masters_1_hresp;
  assign io_dmem_hready = ahb_xbar_io_masters_1_hready;
  assign io_dmem_hrdata = ahb_xbar_io_masters_1_hrdata;
  assign io_jtag_hresp = ahb_xbar_io_masters_0_hresp;
  assign io_jtag_hready = ahb_xbar_io_masters_0_hready;
  assign io_jtag_hrdata = ahb_xbar_io_masters_0_hrdata;
  HastiXbar ahb_xbar(.clk(clk), .reset(reset),
       .io_masters_2_haddr( io_imem_haddr ),
       .io_masters_2_hwrite( io_imem_hwrite ),
       .io_masters_2_hsize( io_imem_hsize ),
       .io_masters_2_hburst( io_imem_hburst ),
       .io_masters_2_hprot( io_imem_hprot ),
       .io_masters_2_htrans( io_imem_htrans ),
       .io_masters_2_hmastlock( io_imem_hmastlock ),
       .io_masters_2_hwdata( io_imem_hwdata ),
       .io_masters_2_hrdata( ahb_xbar_io_masters_2_hrdata ),
       .io_masters_2_hready( ahb_xbar_io_masters_2_hready ),
       .io_masters_2_hresp( ahb_xbar_io_masters_2_hresp ),
       .io_masters_1_haddr( io_dmem_haddr ),
       .io_masters_1_hwrite( io_dmem_hwrite ),
       .io_masters_1_hsize( io_dmem_hsize ),
       .io_masters_1_hburst( io_dmem_hburst ),
       .io_masters_1_hprot( io_dmem_hprot ),
       .io_masters_1_htrans( io_dmem_htrans ),
       .io_masters_1_hmastlock( io_dmem_hmastlock ),
       .io_masters_1_hwdata( io_dmem_hwdata ),
       .io_masters_1_hrdata( ahb_xbar_io_masters_1_hrdata ),
       .io_masters_1_hready( ahb_xbar_io_masters_1_hready ),
       .io_masters_1_hresp( ahb_xbar_io_masters_1_hresp ),
       .io_masters_0_haddr( io_jtag_haddr ),
       .io_masters_0_hwrite( io_jtag_hwrite ),
       .io_masters_0_hsize( io_jtag_hsize ),
       .io_masters_0_hburst( io_jtag_hburst ),
       .io_masters_0_hprot( io_jtag_hprot ),
       .io_masters_0_htrans( io_jtag_htrans ),
       .io_masters_0_hmastlock( io_jtag_hmastlock ),
       .io_masters_0_hwdata( io_jtag_hwdata ),
       .io_masters_0_hrdata( ahb_xbar_io_masters_0_hrdata ),
       .io_masters_0_hready( ahb_xbar_io_masters_0_hready ),
       .io_masters_0_hresp( ahb_xbar_io_masters_0_hresp ),
       .io_slaves_2_haddr( ahb_xbar_io_slaves_2_haddr ),
       .io_slaves_2_hwrite( ahb_xbar_io_slaves_2_hwrite ),
       .io_slaves_2_hsize( ahb_xbar_io_slaves_2_hsize ),
       .io_slaves_2_hburst( ahb_xbar_io_slaves_2_hburst ),
       .io_slaves_2_hprot( ahb_xbar_io_slaves_2_hprot ),
       .io_slaves_2_htrans( ahb_xbar_io_slaves_2_htrans ),
       .io_slaves_2_hmastlock( ahb_xbar_io_slaves_2_hmastlock ),
       .io_slaves_2_hwdata( ahb_xbar_io_slaves_2_hwdata ),
       .io_slaves_2_hrdata( io_codemem_hrdata ),
       .io_slaves_2_hsel( ahb_xbar_io_slaves_2_hsel ),
       .io_slaves_2_hreadyin( ahb_xbar_io_slaves_2_hreadyin ),
       .io_slaves_2_hreadyout( io_codemem_hreadyout ),
       .io_slaves_2_hresp( io_codemem_hresp ),
       .io_slaves_1_haddr( ahb_xbar_io_slaves_1_haddr ),
       .io_slaves_1_hwrite( ahb_xbar_io_slaves_1_hwrite ),
       .io_slaves_1_hsize( ahb_xbar_io_slaves_1_hsize ),
       .io_slaves_1_hburst( ahb_xbar_io_slaves_1_hburst ),
       .io_slaves_1_hprot( ahb_xbar_io_slaves_1_hprot ),
       .io_slaves_1_htrans( ahb_xbar_io_slaves_1_htrans ),
       .io_slaves_1_hmastlock( ahb_xbar_io_slaves_1_hmastlock ),
       .io_slaves_1_hwdata( ahb_xbar_io_slaves_1_hwdata ),
       .io_slaves_1_hrdata( io_datamem_hrdata ),
       .io_slaves_1_hsel( ahb_xbar_io_slaves_1_hsel ),
       .io_slaves_1_hreadyin( ahb_xbar_io_slaves_1_hreadyin ),
       .io_slaves_1_hreadyout( io_datamem_hreadyout ),
       .io_slaves_1_hresp( io_datamem_hresp ),
       .io_slaves_0_haddr( ahb_xbar_io_slaves_0_haddr ),
       .io_slaves_0_hwrite( ahb_xbar_io_slaves_0_hwrite ),
       .io_slaves_0_hsize( ahb_xbar_io_slaves_0_hsize ),
       .io_slaves_0_hburst( ahb_xbar_io_slaves_0_hburst ),
       .io_slaves_0_hprot( ahb_xbar_io_slaves_0_hprot ),
       .io_slaves_0_htrans( ahb_xbar_io_slaves_0_htrans ),
       .io_slaves_0_hmastlock( ahb_xbar_io_slaves_0_hmastlock ),
       .io_slaves_0_hwdata( ahb_xbar_io_slaves_0_hwdata ),
       .io_slaves_0_hrdata( bridge0_inst_io_in_hrdata ),
       .io_slaves_0_hsel( ahb_xbar_io_slaves_0_hsel ),
       .io_slaves_0_hreadyin( ahb_xbar_io_slaves_0_hreadyin ),
       .io_slaves_0_hreadyout( bridge0_inst_io_in_hreadyout ),
       .io_slaves_0_hresp( bridge0_inst_io_in_hresp )
  );
  HastiToPociBridge bridge0_inst(.clk(clk), .reset(reset),
       .io_in_haddr( ahb_xbar_io_slaves_0_haddr ),
       .io_in_hwrite( ahb_xbar_io_slaves_0_hwrite ),
       .io_in_hsize( ahb_xbar_io_slaves_0_hsize ),
       .io_in_hburst( ahb_xbar_io_slaves_0_hburst ),
       .io_in_hprot( ahb_xbar_io_slaves_0_hprot ),
       .io_in_htrans( ahb_xbar_io_slaves_0_htrans ),
       .io_in_hmastlock( ahb_xbar_io_slaves_0_hmastlock ),
       .io_in_hwdata( ahb_xbar_io_slaves_0_hwdata ),
       .io_in_hrdata( bridge0_inst_io_in_hrdata ),
       .io_in_hsel( ahb_xbar_io_slaves_0_hsel ),
       .io_in_hreadyin( ahb_xbar_io_slaves_0_hreadyin ),
       .io_in_hreadyout( bridge0_inst_io_in_hreadyout ),
       .io_in_hresp( bridge0_inst_io_in_hresp ),
       .io_out_paddr( bridge0_inst_io_out_paddr ),
       .io_out_pwrite( bridge0_inst_io_out_pwrite ),
       .io_out_psel( bridge0_inst_io_out_psel ),
       .io_out_penable( bridge0_inst_io_out_penable ),
       .io_out_pwdata( bridge0_inst_io_out_pwdata ),
       .io_out_prdata( bridge0_apb_xbar_io_master_prdata ),
       .io_out_pready( bridge0_apb_xbar_io_master_pready ),
       .io_out_pslverr( bridge0_apb_xbar_io_master_pslverr )
  );
  PociBus bridge0_apb_xbar(
       .io_master_paddr( bridge0_inst_io_out_paddr ),
       .io_master_pwrite( bridge0_inst_io_out_pwrite ),
       .io_master_psel( bridge0_inst_io_out_psel ),
       .io_master_penable( bridge0_inst_io_out_penable ),
       .io_master_pwdata( bridge0_inst_io_out_pwdata ),
       .io_master_prdata( bridge0_apb_xbar_io_master_prdata ),
       .io_master_pready( bridge0_apb_xbar_io_master_pready ),
       .io_master_pslverr( bridge0_apb_xbar_io_master_pslverr ),
       .io_slaves_2_paddr( bridge0_apb_xbar_io_slaves_2_paddr ),
       .io_slaves_2_pwrite( bridge0_apb_xbar_io_slaves_2_pwrite ),
       .io_slaves_2_psel( bridge0_apb_xbar_io_slaves_2_psel ),
       .io_slaves_2_penable( bridge0_apb_xbar_io_slaves_2_penable ),
       .io_slaves_2_pwdata( bridge0_apb_xbar_io_slaves_2_pwdata ),
       .io_slaves_2_prdata( io_i2c_prdata ),
       .io_slaves_2_pready( io_i2c_pready ),
       .io_slaves_2_pslverr( io_i2c_pslverr ),
       .io_slaves_1_paddr( bridge0_apb_xbar_io_slaves_1_paddr ),
       .io_slaves_1_pwrite( bridge0_apb_xbar_io_slaves_1_pwrite ),
       .io_slaves_1_psel( bridge0_apb_xbar_io_slaves_1_psel ),
       .io_slaves_1_penable( bridge0_apb_xbar_io_slaves_1_penable ),
       .io_slaves_1_pwdata( bridge0_apb_xbar_io_slaves_1_pwdata ),
       .io_slaves_1_prdata( io_spi_prdata ),
       .io_slaves_1_pready( io_spi_pready ),
       .io_slaves_1_pslverr( io_spi_pslverr ),
       .io_slaves_0_paddr( bridge0_apb_xbar_io_slaves_0_paddr ),
       .io_slaves_0_pwrite( bridge0_apb_xbar_io_slaves_0_pwrite ),
       .io_slaves_0_psel( bridge0_apb_xbar_io_slaves_0_psel ),
       .io_slaves_0_penable( bridge0_apb_xbar_io_slaves_0_penable ),
       .io_slaves_0_pwdata( bridge0_apb_xbar_io_slaves_0_pwdata ),
       .io_slaves_0_prdata( io_uart_prdata ),
       .io_slaves_0_pready( io_uart_pready ),
       .io_slaves_0_pslverr( io_uart_pslverr )
  );
endmodule

