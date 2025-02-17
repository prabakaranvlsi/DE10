module decoder_bcd_7seg (
    input logic [3:0] bcd_in,
    output logic [7:0] seg_out
);
    // Common Anode 7 Seg display
    always begin : bcd_7seg_decoder
            case(bcd_in)
                4'b0000: seg_out = 8'b11000000;	
                4'b0001: seg_out = 8'b11111001;	
                4'b0010: seg_out = 8'b10100100;	
                4'b0011: seg_out = 8'b10110000;	
                4'b0100: seg_out = 8'b10011001;	
                4'b0101: seg_out = 8'b10010010;	
                4'b0110: seg_out = 8'b10000010;	
                4'b0111: seg_out = 8'b11111000;	
                4'b1000: seg_out = 8'b10000000;	
                4'b1001: seg_out = 8'b10010000;            
            default:
                seg_out = 8'b11000000;
            endcase
    end

endmodule