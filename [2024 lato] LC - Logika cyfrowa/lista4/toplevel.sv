// Write your modules here!
module funnelshift(
  input [7:0] a,b,
  input [3:0] n,
  output [7:0] o
);
  assign o[0]=(n>=8) ? (a[n-8]) : b[n];
  assign o[1]=(n>=7) ? (a[n-7]) : b[1+n];
  assign o[2]=(n>=6) ? (a[n-6]) : b[2+n];
  assign o[3]=(n>=5) ? (a[n-5]) : b[3+n];
  assign o[4]=(n>=4) ? (a[n-4]) : b[4+n];
  assign o[5]=(n>=3) ? (a[n-3]) : b[5+n];
  assign o[6]=(n>=2) ? (a[n-2]) : b[6+n];
  assign o[7]=(n>=1) ? (a[n-1]) : b[7+n];
endmodule

module circuit(
  input [7:0] i,
  input [3:0] n,
  input ar, lr, rot,
  output [7:0] o
);
  logic [7:0] a= rot ? i
    : ( lr ? (i)
       :ar?{8{i[7]}}:0 // rozsmaruj znak
      );
  logic [7:0] b= rot ? i
    :  (lr ? 0 : i);
  logic [3:0] n2= lr ? (8-n) : n;
  funnelshift fs(.o(o), .n(n2), .a(a), .b(b));
endmodule
