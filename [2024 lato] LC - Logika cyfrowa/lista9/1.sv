module circuit(
  input clk, nrst, door, start, finish,
  output logic heat, light, bell
);
  const logic [2:0] closed = 3'b000, cook = 3'b001, pause = 3'b010, open = 3'b011, s_bell = 3'b100;
  logic [2:0] q;
  always_ff @(posedge clk or negedge nrst)
    if (!nrst) q <= closed; // stan początkowy
  else begin
    unique case(q)
      closed: q <= door ? open : (start ? cook : closed);
      cook: q <= door ? pause : (finish ? s_bell : cook);
      pause: q <= door ? pause : cook;
      open: q <= door ? open : closed;
      s_bell: q <= door ? open : s_bell;
    endcase
  end
  always_comb begin
    heat=(q==cook);
    light=(q==cook || q==pause || q==open);
    bell=(q==s_bell);
  end
endmodule
