// Write your modules here!
module circuit(
  input [3:0]i,
  input l,r,
  output [3:0]o
);
  assign o[0]=!r && !l && i[0] || r && i[1];
  assign o[1]=!r && !l && i[1] || l && i[0] || r && i[2];
  assign o[2]=!r && !l && i[2] || l && i[1] || r && i[3];
  assign o[3]=!r && !l && i[3] || l && i[2];
endmodule
