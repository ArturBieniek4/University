module tff(output q, nq, input t, clk, nrst);
logic ns, nr, ns1, nr1, j, k;
nand n1(ns, clk, j), n2(nr, clk, k), n3(q, ns, nq),
n4(nq, nr, q, nrst), n5(ns1, !clk, t, nq),
n6(nr1, !clk, t, q), n7(j, ns1, k), n8(k, nr1, j, nrst);
endmodule
module circuit(output q0, q1, q2, input clk, nrst);
  tff t0(q0,,1,clk,nrst);
  tff t1(q1,,q0,clk,nrst);
  tff t2(q2,,q1,clk,nrst);
endmodule
/*
1 0 0
0 1 0
1 1 1
0 0 0
*/
