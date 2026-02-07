`timescale 1ns/1ps

module four_bit_adder_tb;

    reg  [3:0] a;
    reg  [3:0] b;
    reg  cin;
    wire [3:0] sum;
    wire cout;

    // Instantiate DUT
    four_bit_adder dut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    // Stimulus
    initial begin
        $dumpfile("waves/dump.vcd");
        $dumpvars(0, four_bit_adder_tb);

        a = 4'b0000; b = 4'b0000; cin = 0;
        #10 a = 4'b0011; b = 4'b0101; cin = 0;
        #10 a = 4'b1111; b = 4'b0001; cin = 1;
        #10 a = 4'b1010; b = 4'b0101; cin = 0;
        #10 a = 4'b1111; b = 4'b1111; cin = 1;

        #10 $finish;
    end

    // Optional monitor
    initial begin
        $monitor("Time=%0t | a=%b b=%b cin=%b | sum=%b cout=%b",
                  $time, a, b, cin, sum, cout);
    end

endmodule
