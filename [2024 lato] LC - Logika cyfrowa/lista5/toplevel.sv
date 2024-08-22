// Write your modules here!
module circuit(
  input [31:0]i,
  output [31:0] o
);
  logic [31:0] temp;
  integer j;
  always_comb begin
    temp[31]=i[31];
    for(j=30;j>=0;j=j-1) begin
      temp[j]=temp[j+1]^i[j];
    end
  end
  assign o=temp;
endmodule
