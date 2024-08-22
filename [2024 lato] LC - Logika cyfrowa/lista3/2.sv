module fouradder(
  output [3:0] s,
  output G,
  output P,
  input [3:0] a, b,
  input c
);
  logic [3:0] p, g;
  logic c1, c2, c3;
  assign g[0]=a[0]&&b[0];
  assign p[0]=a[0]||b[0];
  assign g[1]=a[1]&&b[1];
  assign p[1]=a[1]||b[1];
  assign g[2]=a[2]&&b[2];
  assign p[2]=a[2]||b[2];
  assign g[3]=a[3]&&b[3];
  assign p[3]=a[3]||b[3];
  assign c1=g[0] || p[0]&&c;
  assign c2=g[1] || g[0]&&p[0] || c&&p[0]&&p[1];
  assign c3=g[2]|| g[1]&&p[2] || g[0]&&p[1]&&p[2] || c&&p[0]&&p[1]&&p[2];
  assign s[0]=a[0]^b[0]^c;
  assign s[1]=a[1]^b[1]^c1;
  assign s[2]=a[2]^b[2]^c2;
  assign s[3]=a[3]^b[3]^c3;
  assign P=p[3];
  assign G=g[3];
endmodule

module circuit(
  output [15:0] s,
  input [15:0] a,
  input [15:0] b
);
  logic [3:0] G,P,C;
  fouradder fa0(.s(s[3:0]), .G(G[0]), .P(P[0]), .a(a[3:0]), .b(b[3:0]), .c(0)); 
  assign c1=G[0];
  fouradder fa1(.s(s[7:4]), .G(G[1]), .P(P[1]), .a(a[7:4]), .b(b[7:4]), .c(0)); 
endmodule
