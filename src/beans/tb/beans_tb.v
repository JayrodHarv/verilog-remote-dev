`timescale 1ns/1ps

module beans_tb;

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
    beans dut (
        // .a(a),
        // .b(b),
        // .y(y)
    );

    // --------------------
    // Dump waves
    // --------------------
    initial begin
        $dumpfile("waves/beans.vcd");
        $dumpvars(0, beans_tb);
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
