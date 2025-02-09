module memory(
  input wr, step,
  input [9:0] addr,
  input [15:0] in,
  output logic [15:0] out
);
  logic [15:0] mem [0:1023];
  assign out = mem[addr];
  always_ff @(posedge step)
    if (wr) mem[addr] <= in;
endmodule

module calc(
  input nrst, clk, en,
  input signed [15:0] d,
  input push,
  input [2:0] op,
  output logic signed [15:0] out,
  output logic [9:0] cnt
);
  const logic [2:0] sub = 3'b001, add = 3'b010, mult = 3'b011, greater = 3'b000, swap = 3'b100, load = 3'b101, pop = 3'b110, pop2 = 3'b111;
  logic signed [15:0] top;
  logic [9:0] addr;
  assign addr = push ? cnt-1 : (op==load ? cnt-2-out : cnt-2);
  memory ram(en && (push || op==swap) && cnt>0, clk, addr, out, top);

  always_ff @(posedge clk or negedge nrst) begin
    if (!nrst) out <= 0; // przyjąłem że reset ma działać bez względu na enable, inaczej rodzi to problemy
    else if(!en) out <= out; // stan się nie zmienia jeśli en=0
    else begin
      if(push) out <= d;
      else unique case(op)
        sub: out <= -out;
        add: out <= out+top;
        mult: out <= out*top;
        greater: out <= (out>0 ? 1 : 0);
        swap: out <= top;
        load: out <= top;
        pop: out <= top;
        pop2: out <= top;
      endcase
    end
  end
  always_ff @(posedge clk or negedge nrst) begin
    if(!nrst) cnt <= 0;
    else if(!en) cnt <= cnt; // stan się nie zmienia jeśli en=0
    else if(push && cnt!=1023) cnt <= cnt+1;
    else if((op==add || op==mult || op==pop || op==pop2) && cnt>0) cnt <=cnt-1;
  end
endmodule

module toplevel(
  input clk, nrst,
  input [9:0] addr,
  input wr,
  input [15:0] datain,
  input start,
  output logic ready,
  output logic [15:0] out
);
  logic [15:0] p;
  logic [9:0] pc;
  memory codeRAM((!start && wr), clk, (wr ? addr : pc), datain, p);
  
  // sygnały dla kalkulatora
  logic en, push;
  logic [2:0] op;
  
  assign en = !ready && !(p[15] && p[14]);
  assign op = p[2:0];
  assign push = !p[15];
  
  calc calcModule(nrst, clk, en, p, push, op, out, );
  
  always_ff @(posedge clk or negedge nrst)
    if(!nrst)
      ready <= 1;
    else if(ready) begin
      if(start) ready<=0;
    end else if(p[15] && p[14]) ready<=1; // koniec programu
  
  always_ff @(posedge clk)
    if(ready) begin
      if(start) pc<=0; // start programu
    end else begin
      if(!(p[15] && (p[14] || p[2:0] == 7))) pc <= pc+1; // wykonujemy program
      else if(p[15] && !p[14] && p[2:0] == 7) pc <= out; // jump
    end
        
endmodule
