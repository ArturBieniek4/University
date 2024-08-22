// Write your modules here!
module circuit(
  input clk,
  input [15:0] d,
  input [1:0] sel,
  output [15:0] cnt,
  output [15:0] cmp,
  output [15:0] top,
  output out
);
  assign out=cnt<cmp;
  always_ff @(posedge clk) begin
    if(sel==3) cnt<=d;
    else begin
      if(sel==1) cmp<=d;
      if(sel==2) top<=d;
      if(cnt>top) cnt<=0;
      else cnt<=cnt+1;
    end
  end
endmodule
