module barrel-shifter_tb;

    parameter WIDTH = 8;

    reg  [WIDTH-1:0] data_in;
    reg  [WIDTH-1:0] shift_amt;
    reg              direction;

    wire [WIDTH-1:0] data_out;

    barrel_shifter #(
        .WIDTH(WIDTH)
    ) dut (
        .data_in(data_in),
        .shift_amt(shift_amt),
        .direction(direction),
        .data_out(data_out)
    );
    
// initial block
    initial begin

        $monitor(
            "TIME=%0t | DATA=%b | SHIFT=%d | DIR=%b | OUT=%b",
            $time,
            data_in,
            shift_amt,
            direction,
            data_out
        );

        // LEFT SHIFT
        direction = 1'b0;

        data_in = 8'b10110110;
        shift_amt = 0;
        #10;

        shift_amt = 1;
        #10;

        shift_amt = 2;
        #10;

        shift_amt = 4;
        #10;

        // RIGHT SHIFT
        direction = 1'b1;

        shift_amt = 0;
        #10;

        shift_amt = 1;
        #10;

        shift_amt = 2;
        #10;

        shift_amt = 4;
        #10;

        $finish;

    end

endmodule
