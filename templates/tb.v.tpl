`timescale 1ns/1ps

module {{NAME}}_tb;

    // --------------------
    // Signals
    // --------------------
    reg clk;
    reg rst;

    // DUT signals
    // reg  a;
    // reg  b;
    // wire y;

    // --------------------
    // Clock generation
    // --------------------
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // --------------------
    // DUT instance
    // --------------------
    {{NAME}} dut (
        // .a(a),
        // .b(b),
        // .y(y)
    );

    // --------------------
    // Dump waves
    // --------------------
    initial begin
        $dumpfile("waves/{{NAME}}.vcd");
        $dumpvars(0, {{NAME}}_tb);
    end

    // --------------------
    // Test sequence
    // --------------------
    initial begin
        rst = 1;
        #20 rst = 0;

        // stimulus here

        #100;
        $display("TEST COMPLETE");
        $finish;
    end

endmodule
