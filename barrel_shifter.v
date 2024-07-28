module barrel_shifter #(
    parameter WIDTH = 8,
    parameter SHIFT_WIDTH = 3
)(
    input [WIDTH-1:0] data_in,
    input [SHIFT_WIDTH-1:0] shift_amount,
    input direction,  // 0 for right shift, 1 for left shift
    output reg [WIDTH-1:0] data_out
);

    integer i;
    reg [WIDTH-1:0] temp;sim:/barrel_shifter/data_out

    always @(*) begin
        temp = data_in;
        
        for (i = 0; i < SHIFT_WIDTH; i = i + 1) begin
            if (shift_amount[i]) begin
                if (direction) begin
                    // Left shift
                    temp = (temp << (1 << i)) | (temp >> (WIDTH - (1 << i)));
                end else begin
                    // Right shift
                    temp = (temp >> (1 << i)) | (temp << (WIDTH - (1 << i)));
                end
            end
        end
        
        data_out = temp;
    end

endmodule
