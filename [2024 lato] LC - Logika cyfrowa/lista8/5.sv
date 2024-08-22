module NWD(
  output logic [15:0] wynik,
  input logic [15:0] a,
  input logic [15:0] b,
  input clk,
  input en,
  output ready
);
  logic [15:0] wieksza, mniejsza;
  logic [15:0] wieksza_teraz, mniejsza_teraz;
  assign wieksza_teraz=(wieksza>mniejsza)?wieksza:mniejsza;
  assign mniejsza_teraz=(wieksza<=mniejsza)?wieksza:mniejsza;
  always_ff @(posedge clk)
    if (en) begin
      if (!ready) begin
        mniejsza<=mniejsza_teraz;
        if(mniejsza_teraz>0)
          wieksza<=wieksza_teraz-mniejsza_teraz;
        else begin
          wynik<=wieksza_teraz;
          ready=1;
        end
      end
    end
    else begin
      wieksza<=a;
      mniejsza<=b;
      ready=0;
    end
endmodule
