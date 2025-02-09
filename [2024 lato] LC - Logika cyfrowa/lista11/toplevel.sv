module datapath(
  input clk,
  input calc,
  input swap,
  input read,
  input [7:0] ain,
  input [7:0] bin,
  output a_eq_b,
  output a_lt_b,
  output logic [7:0] out
);
  logic [7:0] a,b;
  logic [7:0] new_a, new_b;
  assign new_a = read ? ain : calc ? swap ? b : a-b : a;
  assign new_b = read ? bin : calc ? swap ? a : b : b;
  assign out = calc ? a : out;
  assign a_eq_b = (a==b);
  assign a_lt_b = (a < b);
  always_ff @(posedge clk)
    begin
      a <= new_a;
      b <= new_b;
    end
endmodule

module toplevel(
  input clk, nrst, start,
  input [7:0] ina,
  input [7:0] inb,
  output logic ready,
  output logic [7:0] out
);
  logic read, calc, swap, a_eq_b, a_lt_b;
  assign ready = !(ready && start) && ready || a_eq_b || !nrst;
  assign calc = nrst && !ready;
  assign swap = nrst && calc && a_lt_b;
  assign read = ready && !start || !nrst;
  
  datapath dp(clk, calc, swap, read, ina, inb, a_eq_b, a_lt_b, out);
endmodule

