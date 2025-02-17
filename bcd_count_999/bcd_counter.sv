//------------------------------------------------------------------------------
// author       : Prabakaran Elaiyappan
// email        : prabakaran_vlsi@yahoo.com
// create date  : 2025-02-18 00:54:44
// modify date  : 2025-02-18 00:54:44
// Module Name  : bcd_counter_999
// description  : BCD counter with 7 segment decoded output
//------------------------------------------------------------------------------ 

module bcd_counter_999 (
        // Global signals
        input logic clk,
        input logic rst,

        // Count enable signal
        input logic cnt_en,

        // 12 bit bcd output 
        output logic [11:0] bcd,

        // output 7 segment enable signals - Not conusmed at the top
        output logic seg0_en,
        output logic seg1_en,
        output logic seg2_en
);
    logic [3:0] bcd_ones;
    logic [3:0] bcd_tens;
    logic [3:0] bcd_hns;

    // Segment enable logic 
    assign seg0_en = |bcd[3:0];
    assign seg1_en = |bcd[7:4];
    assign seg2_en = |bcd[11:8];

    assign bcd = {bcd_hns, bcd_tens, bcd_ones};

 //    BCD once counter
    
    always_ff @( posedge clk or negedge rst ) begin : bcd_counter
        if(~rst) begin
            bcd_ones <= 4'b0000;
            bcd_tens <= 4'b0000;
            bcd_hns  <= 4'b0000;
        end
        else if(cnt_en) begin
            if (bcd_ones == 4'b1001) begin
                bcd_ones <= 4'b0000;
                if(bcd_tens == 4'b1001) begin
                    bcd_tens <= 4'b0000;
                    if(bcd_hns == 4'b1001) begin
                        bcd_hns <= 4'b0000;
                    end
                    else begin
                        bcd_hns <= bcd_hns+1;
                    end
                end
                else begin
                    bcd_tens <= bcd_tens + 1;
                end
            end
            else begin
                bcd_ones <= bcd_ones + 1;
            end
        end
        else begin
            bcd_ones <= 4'b0000;
            bcd_tens <= 4'b0000;
            bcd_hns  <= 4'b0000;
            
        end
    end

endmodule