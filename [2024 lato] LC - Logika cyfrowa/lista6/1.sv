module d_latch(output q, nq, input en, d);
  logic nr, ns;
  nand gq(q, nr, nq), gnq(nq, ns, q),
  gr(nr, d, en), gs(ns, nr, en);
endmodule

module zatrzask(output qa, nq, input clk, d);
logic nr, ns;
  nand gq(qa, nr, nq), gnq(nq, ns, qa),
  gr(nr, d, clk), gs(ns, nr, clk);
endmodule

module dff_opadajace(output q, nq, input clk, d);
logic q1;
d_latch dl1(q1, , clk, d), dl2(q, nq, !clk, q1);
endmodule

module dff_narastajace(output q, nq, input clk, d);
logic q1;
d_latch dl1(q1, , !clk, d), dl2(q, nq, clk, q1);
endmodule

module circuit(output qa, qb, qc, input clk, d);
  zatrzask z1(qa, , clk, d);
  dff_opadajace opad(qb, , clk, d);
  dff_narastajace narast(qc, , clk, d);
endmodule
