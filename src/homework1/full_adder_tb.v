module full_adder_tb;

  reg  [3:0] a;
  reg  [3:0] b;
  reg        cin;
  wire [3:0] sum;
  wire       cout;

  full_adder_tb dut (
      a,
      b,
      cin,
      sum,
      cout
  );

  initial begin
    a   = 4'd3;
    b   = 4'd5;
    cin = 0;
    #10;  // 8
    a   = 4'd9;
    b   = 4'd7;
    cin = 0;
    #10;  // 16
    a   = 4'd15;
    b   = 4'd1;
    cin = 0;
    #10;  // overflow
    a   = 4'd6;
    b   = 4'd2;
    cin = 1;
    #10;  // 9

    $finish;
  end

endmodule
