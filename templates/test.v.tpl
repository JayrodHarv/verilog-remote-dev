`timescale 1ns/1ps // sets the time unit to 1ns and the time precision to 1ps

module {{NAME}}_test(
    // inputs and outputs
);

    integer file_descriptor; // integer to hold log data

    initial begin
        $dumpfile("waves/dump.vcd");
        $dumpvars(0, {{NAME}}_tb);

        file_descriptor = $fopen("logs/{{NAME}}.log", "w"); // opens a log file to write test logs to

        // write test cases here

        // eg. four bit adder test
        // 0 + 0 + 0 = 0
        // 0000 + 0000 + 0 = 0000
        // a = 4'b0000; b = 4'b0000; cin = 0;
        // #INPUT_PERIOD; // delay for 50ns
        // $fdisplay(file_descriptor, "a=%b b=%b cin=%b sum=%b cout=%b", a,b,cin,sum,cout);

        $fclose(file_descriptor); // closes and saves log file
        $finish; // end the simulation
    end
endmodule
