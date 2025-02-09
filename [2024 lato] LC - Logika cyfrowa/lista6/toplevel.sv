module dff(output q, nq, input clk, d);
logic r, s, nr, ns;
nand gq(q, nr, nq), gnq(nq, ns, q),
gr(nr, clk, r), gs(ns, nr, clk, s),
gr1(r, nr, s), gs1(s, ns, d);
endmodule

module single_multiregister(output q, input d,clk,l,r,prev,next);
  logic data;
  assign data = (l ? (r ? d : next) : (r ? prev : q));
  dff dflip(q, , clk, data);
endmodule

module circuit(
  output [7:0] q,
  input [7:0] d,
  input i,c,l,r
);
  single_multiregister r0(q[0], d[0], c, l, r, i, q[1]);
  single_multiregister r1(q[1], d[1], c, l, r, q[0], q[2]);
  single_multiregister r2(q[2], d[2], c, l, r, q[1], q[3]);
  single_multiregister r3(q[3], d[3], c, l, r, q[2], q[4]);
  single_multiregister r4(q[4], d[4], c, l, r, q[3], q[5]);
  single_multiregister r5(q[5], d[5], c, l, r, q[4], q[6]);
  single_multiregister r6(q[6], d[6], c, l, r, q[5], q[7]);
  single_multiregister r7(q[7], d[7], c, l, r, q[6], i);
endmodule
