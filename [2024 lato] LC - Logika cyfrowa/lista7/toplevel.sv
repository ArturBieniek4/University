module tff(output q, nq, input t, clk, nrst);
  logic ns, nr, ns1, nr1, j, k;
  nand n1(ns, clk, j), n2(nr, clk, k), n3(q, ns, nq),
  n4(nq, nr, q, nrst), n5(ns1, !clk, t, nq),
  n6(nr1, !clk, t, q), n7(j, ns1, k), n8(k, nr1, j, nrst);
endmodule

module circuit(output [3:0] out, input clk, nrst, step, down);
  logic t0,t1,t2,t3;
  logic nq[3:0];
  assign t0=step?0:1;
  tff tf0(.q(out[0]), .nq(nq[0]), .t(t0), .clk(clk), .nrst(nrst));
  assign t1=step?1:(down?nq[0]:out[0]);
  tff tf1(.q(out[1]), .nq(nq[1]), .t(t1), .clk(clk), .nrst(nrst));
  assign t2=step ? ((down?nq[1]:out[1])) : ((down?nq[0]:out[0])&&(down?nq[1]:out[1]));
  tff tf2(.q(out[2]), .nq(nq[2]), .t(t2), .clk(clk), .nrst(nrst));
  assign t3=t2&&(down?nq[2]:out[2]);
  tff tf3(.q(out[3]), .nq(nq[3]), .t(t3), .clk(clk), .nrst(nrst));
endmodule
