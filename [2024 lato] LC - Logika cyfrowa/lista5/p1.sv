// Write your modules here!
module circuit(
  input [15:0]i,
  output [15:0] o
);
  logic [15:0] temp;
  integer j,k,m;
  always_comb begin
    temp=i;
    for(j=0;j<3;j=j+1) begin
      for(k=1;k<4;k=k+1) begin
        m=k*4;
        if(temp[m-1:m-4]>temp[m+3:m]) // swap
          temp[m+3:m-4]={temp[m-1:m-4],temp[m+3:m]};
      end
    end
  end
  assign o=temp;
endmodule
