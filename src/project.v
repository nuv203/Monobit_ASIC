// ----------------------------------------------------------------------
//  HLS HDL:        Verilog Netlister
//  HLS Version:    2023.1_2/1049935 Production Release
//  HLS Date:       Sat Jun 10 10:53:51 PDT 2023
// 
//  Generated by:   nuv203@hansolo.poly.edu
//  Generated date: Mon Dec  2 17:04:49 2024
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    monobit_core
// ------------------------------------------------------------------

module tt_um_monobit (
    input  wire [7:0] ui_in,
    output wire [7:0] uo_out,
    input  wire [7:0] uio_in,
    output wire [7:0] uio_out,
    output wire [7:0] uio_oe,
    input  wire       ena,
    input  wire       clk,
    input  wire       rst_n
);

    monobit monobit_inst (
      .clk(clk),
      .rst(rst_n),
      .is_random_rsc_dat(uo_out[0]),
      .is_random_triosy_lz(uo_out[3]),
      .valid_rsc_dat(uo_out[1]),
      .valid_triosy_lz(uo_out[4]),
      .epsilon_rsc_dat(ui_in[0]),
      .epsilon_triosy_lz(uo_out[5])
    );

  assign uio_out[7:2] = 0;
  assign uio_oe[7:2]  = 0;
  assign uio_oe[1:0]  = 2'b11;

endmodule

// ----------------------------------------------------------------------
//  HLS HDL:        Verilog Netlister
//  HLS Version:    2023.1_2/1049935 Production Release
//  HLS Date:       Sat Jun 10 10:53:51 PDT 2023
// 
//  Generated by:   nuv203@hansolo.poly.edu
//  Generated date: Mon Dec  2 17:04:49 2024
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    monobit_core
// ------------------------------------------------------------------


module monobit_core (
  input clk,
  input rst,
  output is_random_rsc_dat,
  output is_random_triosy_lz,
  output valid_rsc_dat,
  output valid_triosy_lz,
  input epsilon_rsc_dat,
  output epsilon_triosy_lz
);
  


  // Interconnect Declarations
  reg is_random_rsci_idat;
  reg valid_rsci_idat;
  wire epsilon_rsci_idat;
  reg [6:0] bit_count_sva;
  wire [7:0] nl_bit_count_sva;
  reg reg_epsilon_triosy_obj_ld_cse;
  reg [7:0] sum_sva;
  wire [7:0] sum_sva_2;
  wire [8:0] nl_sum_sva_2;
  wire unequal_tmp_1;

  wire[7:0] operator_8_true_acc_nl;
  wire[8:0] nl_operator_8_true_acc_nl;
  wire[6:0] operator_8_true_acc_nl_1;
  wire[7:0] nl_operator_8_true_acc_nl_1;

  // Interconnect Declarations for Component Instantiations 
  ccs_out_v1 #(.rscid(32'sd1),
  .width(32'sd1)) is_random_rsci (
      .idat(is_random_rsci_idat),
      .dat(is_random_rsc_dat)
    );
  ccs_out_v1 #(.rscid(32'sd2),
  .width(32'sd1)) valid_rsci (
      .idat(valid_rsci_idat),
      .dat(valid_rsc_dat)
    );
  ccs_in_v1 #(.rscid(32'sd3),
  .width(32'sd1)) epsilon_rsci (
      .dat(epsilon_rsc_dat),
      .idat(epsilon_rsci_idat)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) is_random_triosy_obj (
      .ld(reg_epsilon_triosy_obj_ld_cse),
      .lz(is_random_triosy_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) valid_triosy_obj (
      .ld(reg_epsilon_triosy_obj_ld_cse),
      .lz(valid_triosy_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) epsilon_triosy_obj (
      .ld(reg_epsilon_triosy_obj_ld_cse),
      .lz(epsilon_triosy_lz)
    );
  assign nl_sum_sva_2 = sum_sva + conv_s2s_2_8({(~ epsilon_rsci_idat) , 1'b1});
  assign sum_sva_2 = nl_sum_sva_2[7:0];
  assign unequal_tmp_1 = ~((bit_count_sva==7'b1111111));
  always_ff @(posedge clk) begin
    if ( rst ) begin
      reg_epsilon_triosy_obj_ld_cse <= 1'b0;
      valid_rsci_idat <= 1'b0;
      is_random_rsci_idat <= 1'b0;
      bit_count_sva <= 7'b0000000;
      sum_sva <= 8'b00000000;
    end
    else begin
      reg_epsilon_triosy_obj_ld_cse <= 1'b1;
      valid_rsci_idat <= ~ unequal_tmp_1;
      is_random_rsci_idat <= ~((readslicef_8_1_7(operator_8_true_acc_nl)) | (readslicef_7_1_6(operator_8_true_acc_nl_1))
          | unequal_tmp_1);
      bit_count_sva <= nl_bit_count_sva[6:0];
      sum_sva <= MUX_v_8_2_2(8'b00000000, sum_sva_2, unequal_tmp_1);
    end
  end
  assign nl_operator_8_true_acc_nl = conv_s2u_7_8(~ (sum_sva_2[7:1])) + 8'b00001111;
  assign operator_8_true_acc_nl = nl_operator_8_true_acc_nl[7:0];
  assign nl_operator_8_true_acc_nl_1 = conv_s2u_6_7(sum_sva_2[7:2]) + 7'b0000111;
  assign operator_8_true_acc_nl_1 = nl_operator_8_true_acc_nl_1[6:0];
  assign nl_bit_count_sva  = bit_count_sva + 7'b0000001;

  function automatic [7:0] MUX_v_8_2_2;
    input [7:0] input_0;
    input [7:0] input_1;
    input  sel;
    reg [7:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_8_2_2 = result;
  end
  endfunction


  function automatic [0:0] readslicef_7_1_6;
    input [6:0] vector;
    reg [6:0] tmp;
  begin
    tmp = vector >> 6;
    readslicef_7_1_6 = tmp[0:0];
  end
  endfunction


  function automatic [0:0] readslicef_8_1_7;
    input [7:0] vector;
    reg [7:0] tmp;
  begin
    tmp = vector >> 7;
    readslicef_8_1_7 = tmp[0:0];
  end
  endfunction


  function automatic [7:0] conv_s2s_2_8 ;
    input [1:0]  vector ;
  begin
    conv_s2s_2_8 = {{6{vector[1]}}, vector};
  end
  endfunction


  function automatic [6:0] conv_s2u_6_7 ;
    input [5:0]  vector ;
  begin
    conv_s2u_6_7 = {vector[5], vector};
  end
  endfunction


  function automatic [7:0] conv_s2u_7_8 ;
    input [6:0]  vector ;
  begin
    conv_s2u_7_8 = {vector[6], vector};
  end
  endfunction

endmodule

// ------------------------------------------------------------------
//  Design Unit:    monobit
// ------------------------------------------------------------------

/*
module monobit (
  clk, rst, is_random_rsc_dat, is_random_triosy_lz, valid_rsc_dat, valid_triosy_lz,
      epsilon_rsc_dat, epsilon_triosy_lz
);
  input clk;
  input rst;
  output is_random_rsc_dat;
  output is_random_triosy_lz;
  output valid_rsc_dat;
  output valid_triosy_lz;
  input epsilon_rsc_dat;
  output epsilon_triosy_lz;



  // Interconnect Declarations for Component Instantiations 
  monobit_core monobit_core_inst (
      .clk(clk),
      .rst(rst),
      .is_random_rsc_dat(is_random_rsc_dat),
      .is_random_triosy_lz(is_random_triosy_lz),
      .valid_rsc_dat(valid_rsc_dat),
      .valid_triosy_lz(valid_triosy_lz),
      .epsilon_rsc_dat(epsilon_rsc_dat),
      .epsilon_triosy_lz(epsilon_triosy_lz)
    );
endmodule
*/


//------> /eda/mentor/Siemens_EDA/Catapult_Synthesis_2023.1_2/Mgc_home/pkgs/siflibs/ccs_out_v1.v 
//------------------------------------------------------------------------------
// Catapult Synthesis - Sample I/O Port Library
//
// Copyright (c) 2003-2015 Mentor Graphics Corp.
//       All Rights Reserved
//
// This document may be used and distributed without restriction provided that
// this copyright statement is not removed from the file and that any derivative
// work contains this copyright notice.
//
// The design information contained in this file is intended to be an example
// of the functionality which the end user may study in preparation for creating
// their own custom interfaces. This design does not necessarily present a 
// complete implementation of the named protocol or standard.
//
//------------------------------------------------------------------------------

module ccs_out_v1 (dat, idat);

  parameter integer rscid = 1;
  parameter integer width = 8;

  output   [width-1:0] dat;
  input    [width-1:0] idat;

  wire     [width-1:0] dat;

  assign dat = idat;

endmodule




//------> /eda/mentor/Siemens_EDA/Catapult_Synthesis_2023.1_2/Mgc_home/pkgs/siflibs/ccs_in_v1.v 
//------------------------------------------------------------------------------
// Catapult Synthesis - Sample I/O Port Library
//
// Copyright (c) 2003-2017 Mentor Graphics Corp.
//       All Rights Reserved
//
// This document may be used and distributed without restriction provided that
// this copyright statement is not removed from the file and that any derivative
// work contains this copyright notice.
//
// The design information contained in this file is intended to be an example
// of the functionality which the end user may study in preparation for creating
// their own custom interfaces. This design does not necessarily present a 
// complete implementation of the named protocol or standard.
//
//------------------------------------------------------------------------------


module ccs_in_v1 (idat, dat);

  parameter integer rscid = 1;
  parameter integer width = 8;

  output [width-1:0] idat;
  input  [width-1:0] dat;

  wire   [width-1:0] idat;

  assign idat = dat;

endmodule


//------> /eda/mentor/Siemens_EDA/Catapult_Synthesis_2023.1_2/Mgc_home/pkgs/siflibs/mgc_io_sync_v2.v 
//------------------------------------------------------------------------------
// Catapult Synthesis - Sample I/O Port Library
//
// Copyright (c) 2003-2017 Mentor Graphics Corp.
//       All Rights Reserved
//
// This document may be used and distributed without restriction provided that
// this copyright statement is not removed from the file and that any derivative
// work contains this copyright notice.
//
// The design information contained in this file is intended to be an example
// of the functionality which the end user may study in preparation for creating
// their own custom interfaces. This design does not necessarily present a 
// complete implementation of the named protocol or standard.
//
//------------------------------------------------------------------------------


module mgc_io_sync_v2 (ld, lz);
    parameter valid = 0;

    input  ld;
    output lz;

    wire   lz;

    assign lz = ld;

endmodule


//------> ./rtl.v 
// ----------------------------------------------------------------------
//  HLS HDL:        Verilog Netlister
//  HLS Version:    2023.1_2/1049935 Production Release
//  HLS Date:       Sat Jun 10 10:53:51 PDT 2023
// 
//  Generated by:   nuv203@hansolo.poly.edu
//  Generated date: Mon Dec  2 17:04:49 2024
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    monobit_core
// ------------------------------------------------------------------
/*
module monobit_core (
  clk, rst, is_random_rsc_dat, is_random_triosy_lz, valid_rsc_dat, valid_triosy_lz,
      epsilon_rsc_dat, epsilon_triosy_lz
);
  input clk;
  input rst;
  output is_random_rsc_dat;
  output is_random_triosy_lz;
  output valid_rsc_dat;
  output valid_triosy_lz;
  input epsilon_rsc_dat;
  output epsilon_triosy_lz;


  // Interconnect Declarations
  reg is_random_rsci_idat;
  reg valid_rsci_idat;
  wire epsilon_rsci_idat;
  reg [6:0] bit_count_sva;
  wire [7:0] nl_bit_count_sva;
  reg reg_epsilon_triosy_obj_ld_cse;
  reg [7:0] sum_sva;
  wire [7:0] sum_sva_2;
  wire [8:0] nl_sum_sva_2;
  wire unequal_tmp_1;

  wire[7:0] operator_8_true_acc_nl;
  wire[8:0] nl_operator_8_true_acc_nl;
  wire[6:0] operator_8_true_acc_nl_1;
  wire[7:0] nl_operator_8_true_acc_nl_1;

  // Interconnect Declarations for Component Instantiations 
  ccs_out_v1 #(.rscid(32'sd1),
  .width(32'sd1)) is_random_rsci (
      .idat(is_random_rsci_idat),
      .dat(is_random_rsc_dat)
    );
  ccs_out_v1 #(.rscid(32'sd2),
  .width(32'sd1)) valid_rsci (
      .idat(valid_rsci_idat),
      .dat(valid_rsc_dat)
    );
  ccs_in_v1 #(.rscid(32'sd3),
  .width(32'sd1)) epsilon_rsci (
      .dat(epsilon_rsc_dat),
      .idat(epsilon_rsci_idat)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) is_random_triosy_obj (
      .ld(reg_epsilon_triosy_obj_ld_cse),
      .lz(is_random_triosy_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) valid_triosy_obj (
      .ld(reg_epsilon_triosy_obj_ld_cse),
      .lz(valid_triosy_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) epsilon_triosy_obj (
      .ld(reg_epsilon_triosy_obj_ld_cse),
      .lz(epsilon_triosy_lz)
    );
  assign nl_sum_sva_2 = sum_sva + conv_s2s_2_8({(~ epsilon_rsci_idat) , 1'b1});
  assign sum_sva_2 = nl_sum_sva_2[7:0];
  assign unequal_tmp_1 = ~((bit_count_sva==7'b1111111));
  always @(posedge clk) begin
    if ( rst ) begin
      reg_epsilon_triosy_obj_ld_cse <= 1'b0;
      valid_rsci_idat <= 1'b0;
      is_random_rsci_idat <= 1'b0;
      bit_count_sva <= 7'b0000000;
      sum_sva <= 8'b00000000;
    end
    else begin
      reg_epsilon_triosy_obj_ld_cse <= 1'b1;
      valid_rsci_idat <= ~ unequal_tmp_1;
      is_random_rsci_idat <= ~((readslicef_8_1_7(operator_8_true_acc_nl)) | (readslicef_7_1_6(operator_8_true_acc_nl_1))
          | unequal_tmp_1);
      bit_count_sva <= nl_bit_count_sva[6:0];
      sum_sva <= MUX_v_8_2_2(8'b00000000, sum_sva_2, unequal_tmp_1);
    end
  end
  assign nl_operator_8_true_acc_nl = conv_s2u_7_8(~ (sum_sva_2[7:1])) + 8'b00001111;
  assign operator_8_true_acc_nl = nl_operator_8_true_acc_nl[7:0];
  assign nl_operator_8_true_acc_nl_1 = conv_s2u_6_7(sum_sva_2[7:2]) + 7'b0000111;
  assign operator_8_true_acc_nl_1 = nl_operator_8_true_acc_nl_1[6:0];
  assign nl_bit_count_sva  = bit_count_sva + 7'b0000001;

  function automatic [7:0] MUX_v_8_2_2;
    input [7:0] input_0;
    input [7:0] input_1;
    input  sel;
    reg [7:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_8_2_2 = result;
  end
  endfunction


  function automatic [0:0] readslicef_7_1_6;
    input [6:0] vector;
    reg [6:0] tmp;
  begin
    tmp = vector >> 6;
    readslicef_7_1_6 = tmp[0:0];
  end
  endfunction


  function automatic [0:0] readslicef_8_1_7;
    input [7:0] vector;
    reg [7:0] tmp;
  begin
    tmp = vector >> 7;
    readslicef_8_1_7 = tmp[0:0];
  end
  endfunction


  function automatic [7:0] conv_s2s_2_8 ;
    input [1:0]  vector ;
  begin
    conv_s2s_2_8 = {{6{vector[1]}}, vector};
  end
  endfunction


  function automatic [6:0] conv_s2u_6_7 ;
    input [5:0]  vector ;
  begin
    conv_s2u_6_7 = {vector[5], vector};
  end
  endfunction


  function automatic [7:0] conv_s2u_7_8 ;
    input [6:0]  vector ;
  begin
    conv_s2u_7_8 = {vector[6], vector};
  end
  endfunction

endmodule
*/
// ------------------------------------------------------------------
//  Design Unit:    monobit
// ------------------------------------------------------------------


module monobit (
  clk, rst, is_random_rsc_dat, is_random_triosy_lz, valid_rsc_dat, valid_triosy_lz,
      epsilon_rsc_dat, epsilon_triosy_lz
);
  input clk;
  input rst;
  output is_random_rsc_dat;
  output is_random_triosy_lz;
  output valid_rsc_dat;
  output valid_triosy_lz;
  input epsilon_rsc_dat;
  output epsilon_triosy_lz;


  
  // Interconnect Declarations for Component Instantiations 
  monobit_core monobit_core_inst (
      .clk(clk),
      .rst(rst),
      .is_random_rsc_dat(is_random_rsc_dat),
      .is_random_triosy_lz(is_random_triosy_lz),
      .valid_rsc_dat(valid_rsc_dat),
      .valid_triosy_lz(valid_triosy_lz),
      .epsilon_rsc_dat(epsilon_rsc_dat),
      .epsilon_triosy_lz(epsilon_triosy_lz)
    );
    
endmodule
