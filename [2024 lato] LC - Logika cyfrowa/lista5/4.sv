module dec2to4(
input [1:0] i,
input en,
output [3:0] o
);
integer k;
always_comb
for (k = 0; k <= 3; k = k + 1)
if (i == k)
o[k] = en;
else
  o[k]=0;
endmodule
module dec3to8(
  input [2:0] i,
  output[7:0] o
);
  logic [3:0] l;
  logic [3:0] r;
  dec2to4 ldec(.i(i[1:0]),.en(!i[2]),.o(l));
  dec2to4 rdec(.i(i[1:0]),.en(i[2]),.o(r));
  assign o={r,l};
endmodule
