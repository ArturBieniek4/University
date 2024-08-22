module fouradder(
  output [3:0] s,
  output G,
  output P,
  input [3:0] a, b,
  input c0
);
  logic [3:0] p, g, c;
  assign c[0]=c0;
  assign g=a&b;
  assign p=a|b;
  assign c[1]=g[0] || p[0]&&c[0];
  assign c[2]=g[1] || g[0]&&p[0] || c[0]&&p[0]&&p[1];
  assign c[3]=g[2]|| g[1]&&p[2] || g[0]&&p[1]&&p[2] || c[0]&&p[0]&&p[1]&&p[2];
  assign s=a^b^c;
  assign P=p[3];
  assign G=g[3]|| g[2]&&p[3] || g[1]&&p[2]&&p[3] || g[0]&&p[1]&&p[2]&&p[3] || c[0]&&p[0]&&p[1]&&p[2]&&p[3];
endmodule

module circuit(
  output [15:0] o,
  input [15:0] a,
  input [15:0] b
);
  logic [3:0] G,P,C;
  logic c1, c2, c3;
  fouradder fa0(.s(o[3:0]), .G(G[0]), .P(P[0]), .a(a[3:0]), .b(b[3:0]), .c0(0)); 
  assign c1=G[0];
  fouradder fa1(.s(o[7:4]), .G(G[1]), .P(P[1]), .a(a[7:4]), .b(b[7:4]), .c0(c1)); 
  assign c2=G[1]||G[0]&&P[1];
  fouradder fa2(.s(o[11:8]), .G(G[2]), .P(P[2]), .a(a[11:8]), .b(b[11:8]), .c0(c2));
  assign c3=G[2]||G[1]&&P[2]||G[0]&&P[1]&&P[2];
  fouradder fa3(.s(o[15:12]), .G(G[3]), .P(P[3]), .a(a[15:12]), .b(b[15:12]), .c0(c3));
endmodule

for x=0,10 do
  local a = math.random(0, 20)
  local b = math.random(0, 20)
  sim.setinput("a", '16d' .. tostring(a))
  sim.setinput("b", '16d' .. tostring(b))
  sim.sleep(10)
  print(sim.getoutput("o"):tohex():match("0*(%d+)"), string.format("%x", (a + b)))
  assert(sim.getoutput("o"):tohex():match("0*(%d+)") == string.format("%x", (a + b)), "Error: a=" .. a .. " b=" .. b)
end
print("OK!")
