module toplevel(
  input clk, nrst, start,
  input [15:0] inx,
  input [7:0] inn,
  output logic ready,
  output logic [15:0] out
);
  // skoro out jest valid tylko gdy ready=1 to traktujemmy jako a
  logic [15:0] x;
  logic [15:0] n;
  logic [15:0] mult_op;
  logic [15:0] mult_res;
  assign mult_op = n[0] ? out : x;
  assign mult_res = mult_op * x;
  always_ff @(posedge clk or negedge nrst)
    begin
      if(!nrst) ready<=1;
      else begin
        if(start && ready) begin
          out <= 1;
          x <= inx;
          n <= inn;
          ready<=0;
        end
        else if(!ready) begin
          if(n==0) ready<=1;
          else begin
            if(n[0]==0) begin
              x <= mult_res;
              n <= n>>1;
            end
            else begin
              out <= mult_res;
              n <= n-1;
            end
          end
        end
      end
    end
endmodule
