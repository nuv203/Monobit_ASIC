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
    
    // Internal signals for mapping
    wire rst = ~rst_n; // Active low reset converted to active high
    // Outputs from monobit instance
    wire is_random_rsc_dat;
    wire is_random_triosy_lz;
    wire valid_rsc_dat;
    wire valid_triosy_lz;
    wire epsilon_triosy_lz;
    // Input mapping
    wire epsilon_rsc_dat = ui_in[0]; // Map ui_in[0] to epsilon input
    // Output mapping
    assign uo_out[0] = is_random_rsc_dat; // Map is_random to uo_out[0]
    assign uo_out[1] = valid_rsc_dat;     // Map valid to uo_out[1]
    assign uo_out[2] = epsilon_triosy_lz; // Map epsilon_triosy to uo_out[2]
    assign uo_out[7:3] = 5'b0;            // Unused outputs set to 0
    // Configure IO enable outputs
    assign uio_oe = 8'b0; // All uio pins are inputs by default
    // Unused IO paths
    assign uio_out = 8'b0; // No output from uio paths



    
    monobit_core monobit_core_inst (
      .clk(clk),
        .rst(rst_n),
        .is_random_rsc_dat(uo_out[0]),
      .is_random_triosy_lz(is_random_triosy_lz),
      .valid_rsc_dat(valid_rsc_dat),
      .valid_triosy_lz(valid_triosy_lz),
        .epsilon_rsc_dat(ui_in[0]),
        .epsilon_triosy_lz(uio_out[0])
    );

    
    // monobit monobit_inst (
    //     .clk(clk),
    //     .rst(rst),
    //     .is_random_rsc_dat(uo_out[0]),
    //     .is_random_triosy_lz(is_random_triosy_lz),
    //     .valid_rsc_dat(valid_rsc_dat),
    //     .valid_triosy_lz(valid_triosy_lz),
    //     .epsilon_rsc_dat(ui_in[0]),
    //     .epsilon_triosy_lz(uio_out[0])
    // );
endmodule
