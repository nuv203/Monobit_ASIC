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
    input clk, rst,
    input [7:0] epsilon_rsc_dat,
    output [7:0] is_random_rsc_dat, is_random_triosy_lz, valid_rsc_dat, valid_triosy_lz, epsilon_triosy_lz
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
      .dat(is_random_rsc_dat[0])
    );
  ccs_out_v1 #(.rscid(32'sd2),
  .width(32'sd1)) valid_rsci (
      .idat(valid_rsci_idat),
      .dat(valid_rsc_dat[0])
    );
  ccs_in_v1 #(.rscid(32'sd3),
  .width(32'sd1)) epsilon_rsci (
      .dat(epsilon_rsc_dat[0]),
      .idat(epsilon_rsci_idat)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) is_random_triosy_obj (
      .ld(reg_epsilon_triosy_obj_ld_cse),
      .lz(is_random_triosy_lz[0])
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) valid_triosy_obj (
      .ld(reg_epsilon_triosy_obj_ld_cse),
      .lz(valid_triosy_lz[0])
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) epsilon_triosy_obj (
      .ld(reg_epsilon_triosy_obj_ld_cse),
      .lz(epsilon_triosy_lz[0])
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

// ------------------------------------------------------------------
//  Design Unit:    monobit
// ------------------------------------------------------------------


module tt_um_monobit (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

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

tt_um_monobit tt_um_monobit_inst (
  .clk(clk),
  .rst_n(rst),
  .ui_in(epsilon_rsc_dat)
  .uo_out(is_random_rsc_dat),
  .uio_in(is_random_triosy_lz),
  .uio_out(valid_rsc_dat),
  .uio_oe(valid_triosy_lz)

); 
