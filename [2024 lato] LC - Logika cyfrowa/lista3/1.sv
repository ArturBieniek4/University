module halfadder(output s, c, input a, b);
  xor (s, a, b); // pierwszy port to wyj±cie
  and (c, a, b);
endmodule

module fulladder(
    output o, co,
    input a, b, c
  );
  logic t, c1, c2;
  function [1:0] ha(input a, b);
  ha = ({a^b, a&b});
  endfunction
  assign {t, c1} = ha(a, b);
  assign {o, c2} = ha(t, c);
  assign co = c1 | c2;
endmodule

module fouradder(
  output [3:0] o,
  output co,
  input [3:0] x, y, c
);
  logic s0, s1, s2, s3, c0, c1, c2;
  fulladder fa0(.o(s0), .co(c0), .c(c), .a(x[0]), .b(y[0]));
  fulladder fa1(.o(s1), .co(c1), .c(c0), .a(x[1]), .b(y[1]));
  fulladder fa2(.o(s2), .co(c2), .c(c1), .a(x[2]), .b(y[2]));
  fulladder fa3(.o(s3), .co(co), .c(c2), .a(x[3]), .b(y[3]));
  assign o = {s3, s2, s1, s0};
endmodule

module circuit(
  output [7:0] s,
  input [7:0] a,
  input [7:0] b,
  input sub
);
  logic [3:0] a0, b0, s0, s0_correct;
  logic c0;
  assign a0=a[3:0];
  assign b0=b[3:0];
  fouradder fa0(.o(s0), .co(c0), .c(c0), .x(a0), .y(b0));
  fouradder fa0_correct(.o(s0_correct), .co(c0_plus6), .c(0), .x(s0), .y(6));
  assign s[3:0]=s0;
endmodule
