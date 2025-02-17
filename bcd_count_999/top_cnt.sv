module top_cnt (
    input logic clk,
    input logic rst,
    input logic en,
    
    output logic [7:0] seg0,
    output logic [7:0] seg1,
    output logic [7:0] seg2
);

    logic div_clk;
    logic [11:0] r_bcd;
    logic seg0_en;
    logic seg1_en;
    logic seg2_en;


    // Instantiation of clk div module
    clk_div u_clk_div (
                        .clk_in (clk),
                        .rst (rst),
                        .clk_out (div_clk)
    );


    // Instantiation of bcd_counter
    bcd_counter_999 u_bcd_cnt (
                        .clk (div_clk),
                        .rst (rst),
                        .cnt_en (en),
                        .bcd (r_bcd),
                        .seg0_en (seg0_en),
                        .seg1_en (seg1_en),
                        .seg2_en (seg2_en)
    );

    // decoder_bcd_7seg
    decoder_bcd_7seg u_7seg_0 (
                        .bcd_in (r_bcd[3:0]),
                        .seg_out (seg0)
    );


    decoder_bcd_7seg u_7seg_1 (
                        .bcd_in (r_bcd[7:4]),
                        .seg_out (seg1)
    );

    decoder_bcd_7seg u_7seg_2 (
                        .bcd_in (r_bcd[11:8]),
                        .seg_out (seg2)
    );


endmodule