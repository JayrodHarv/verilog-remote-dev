//1-bit full adder
module fullAdder (
    input a,
    input b,
    input cin,
    output reg sum,
    output reg cout
);
  always @(a or b or cin) begin
    sum  = #2 a ^ b ^ cin;
    cout = #2 (a & b) | (a & cin) | (b & cin);
  end
endmodule

// 4-bit full adder
module fullAdder4 (
    input [3:0] a,
    input [3:0] b,
    input cin,
    output reg [3:0] sum,
    output reg cout
);

  wire c1, c2, c3;

  fullAdder fullAdder1 (
      a[0],
      b[0],
      cin,
      sum[0],
      c1
  );
  fullAdder fullAdder2 (
      a[1],
      b[1],
      c1,
      sum[1],
      c2
  );
  fullAdder fullAdder3 (
      a[2],
      b[2],
      c2,
      sum[2],
      c3
  );
  fullAdder fullAdder4 (
      a[3],
      b[3],
      c3,
      sum[3],
      cout
  );

endmodule
