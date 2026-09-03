module barrel-shifter #
  ( parameter WIDTH = 8 )
  (
    input  wire [WIDTH-1:0] data_in,
    input  wire [WIDTH-1:0] shift_amt,
    input  wire              direction,
    output reg  [WIDTH-1:0] data_out
);

    always @(*) begin

        if (direction == 1'b0)
            data_out = data_in << shift_amt;

        else
            data_out = data_in >> shift_amt;

    end

endmodule
