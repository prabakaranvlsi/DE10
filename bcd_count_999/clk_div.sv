module clk_div (
    input logic clk_in,
    input logic rst,
    
    output logic clk_out
);
    localparam TOTAL_CYCLE = 6000000;
    //localparam TOTAL_CYCLE = 6;
    localparam HALF_CYCLE = TOTAL_CYCLE / 2;
    logic [31:0] cnt;

   // assign clk_out = cnt [4];


    always_ff @( posedge clk_in or negedge rst ) begin : pulse_cnt
        if(~rst) 
            cnt <= 32'h0000_0000;
        else if (cnt >= TOTAL_CYCLE)
            cnt <= 32'h0000_0000;
        else
            cnt <= cnt + 1;
    end

    always_ff @( posedge clk_in or negedge rst ) begin : clk_gen
        if(~rst)
            clk_out <= 1'b0;
        else if (cnt < HALF_CYCLE)
            clk_out <= 1'b1;
        else
            clk_out <= 1'b0;        
    end

endmodule