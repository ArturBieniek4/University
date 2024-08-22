module ram(
  input clk, wr,
  input [7:0] addr,
  input [7:0] in,
  output [7:0] out
);
  logic [7:0] mem [0:255];
  assign out = mem[addr];
  always_ff @(posedge clk)
    if(wr) mem[addr]<=in;
endmodule

module sterowanie(
  input clk, nrst,
  input start,
  input in_valid, out_ack,
  input [7:0] hd_s, text_s,
  input c_s, mem_s,
  
  //sygnały sterujące stanem ++/--/zerowanie/(datain)
  output logic hd_incr, hd_decr, hd_rst,
  output logic c_incr, c_decr, c_rst,
  output logic mem_incr, mem_decr, mem_rst, mem_in,
  output logic pc_incr, pc_decr, pc_rst,
  
  output logic text_in,
  output logic in_ack, out_valid,
  output logic ready
);
  logic [2:0] state;
  const logic [2:0]
  READY = 3'd0,
  ZERO = 3'd1,
  WORK = 3'd2,
  READ = 3'd3,
  WRITE = 3'd4,
  LEFT = 3'd5,
  RIGHT = 3'd6;
  
  always_ff @(posedge clk or negedge nrst)
    if(!nrst) state <= READY;
    else unique case(state)
      READY: if(start) state<= ZERO;
      ZERO: if(hd_s == 8'd0) state<= WORK;
      WORK: case(text_s)
        "[": if(mem_s) state<= RIGHT;
        "]": if(!mem_s) state<= LEFT;
        ".": state<= WRITE;
        ",": state<= READ;
        "\0": state<= READY; // koniec programu
        default: state<= WORK;
      endcase
      WRITE: if(out_ack) state<= WORK;
      READ: if(in_valid) state<= WORK;
      LEFT: if(text_s == "[" && !c_s) state<= WORK;
      RIGHT: if(text_s == "]" && !c_s) state<= WORK;
    endcase
  
  //resztę można obliczyć całkowicie kombinacyjnie, nie potrzebujemy zmieniać stanu
  
  always_comb begin
    //Wszystkie sygnały na 0, żeby było ustalone wyjście w momencie gdy ich nie przypiszemy
    hd_incr=0; hd_decr=0; hd_rst=0;
    c_incr=0; c_decr=0; c_rst=0;
    mem_incr=0; mem_decr=0; mem_rst=0; mem_in=0;
    pc_incr=0; pc_decr=0; pc_rst=0;
    text_in=0;
    in_ack=0; out_valid=0;
    ready=0;
    
    unique case(state)
      READY: begin
        ready=1;
        text_in=(in_valid && !start);
        pc_incr=(in_valid && !start);
        in_ack=(in_valid && !start);
        pc_rst = start;
      end
      ZERO: begin
        mem_rst=1;
        hd_incr=1;
      end
      WORK: unique case(text_s)
        "+": begin mem_incr=1; pc_incr=1; end
        "-": begin mem_decr=1; pc_incr=1; end
        ">": begin hd_incr=1; pc_incr=1; end
        "<": begin hd_decr=1; pc_incr=1; end
        "[": begin c_rst=mem_s; pc_incr=1; end
        "]": begin c_rst=!mem_s; pc_incr=mem_s; pc_decr=!mem_s; end
        ".": begin pc_incr=0; end
        ",": begin pc_incr=0; end
        "\0": begin pc_rst=1; hd_rst=1; end
      endcase
      READ:begin in_ack=1; mem_in=in_valid; pc_incr=in_valid; end
      WRITE: begin out_valid=1; pc_incr=out_ack; end
      RIGHT: begin
        pc_incr=1;
        c_incr = text_s=="[";
        c_decr = c_s && (text_s=="]");
      end
      LEFT: begin
        c_incr = text_s=="]";
        c_decr = c_s && (text_s=="[");
        pc_incr = !c_s && (text_s=="[");
        pc_decr = c_s || !(text_s=="[");
      end
    endcase
      end  
endmodule

module datapath(
  input clk, nrst,
  input [7:0] in_data,
  output [7:0] out_data, hd_s, text_s,
  output c_s, mem_s,
  input hd_incr, hd_decr, hd_rst,
  input c_incr, c_decr, c_rst,
  input mem_incr, mem_decr, mem_rst, mem_in,
  input pc_incr, pc_decr, pc_rst,
  input text_in
);
  logic[7:0] mem_indata, mem;
  logic[7:0] c, hd, pc;
  ram memory(clk, (mem_in || mem_incr || mem_decr || mem_rst), hd, mem_indata, mem);
  ram code(clk, text_in, pc, in_data, text_s);
  
  always_comb begin
    mem_indata = 1'bx;
    unique casez({mem_in,mem_rst, mem_incr, mem_decr})
      4'b1???: mem_indata = in_data;
      4'b?1??: mem_indata = 8'd0;
      4'b??1?: mem_indata = mem + 1;
      4'b???1: mem_indata = mem - 1;
    endcase
  end
  
  always_ff @(posedge clk or negedge nrst)
    if(!nrst) pc<= 8'd0;
    else begin
      if(pc_rst) pc<= 8'd0;
      else if(pc_incr) pc<= pc+1;
      else if(pc_decr) pc<= pc-1;
    end
  
  always_ff @(posedge clk or negedge nrst)
    if(!nrst) hd<= 8'd0;
    else begin
      if(hd_rst) hd<= 8'd0;
      else if(hd_incr) hd<= hd+1;
      else if(hd_decr) hd<= hd-1;
    end
  
  always_ff @(posedge clk or negedge nrst)
    if(!nrst) c<=8'd0;
    else begin
      if(c_rst) c<= 8'd0;
      else if(c_incr) c<= c+1;
      else if(c_decr) c<= c-1;
    end
  
  // wejścia dla ścieżki danych
  assign mem_s=(mem==8'd0);
  assign hd_s = hd+1;
  assign c_s = (c>0); // czy idziemy dalej w poszukiwaniu pasującego nawiasu
  assign out_data = mem;
endmodule

module toplevel(
  input clk, nrst,
  input [7:0] in_data,
  input in_valid,
  output in_ack,
  output [7:0] out_data,
  output out_valid,
  input out_ack,
  input start,
  output ready
);
  wire c_s, mem_s;
  wire [7:0] hd_s, text_s;
  wire hd_incr; wire hd_decr; wire hd_rst;
  wire c_incr; wire c_decr; wire c_rst;
  wire mem_incr; wire mem_decr; wire mem_rst; wire mem_in;
  wire pc_incr; wire pc_decr; wire pc_rst;
  wire text_in;
  
  sterowanie ster(
    .clk(clk),
    .nrst(nrst),
    .start(start),
    .in_valid(in_valid),
    .out_ack(out_ack),
    .hd_s(hd_s),
    .text_s(text_s),
    .c_s(c_s),
    .mem_s(mem_s),
    .pc_incr(pc_incr),
    .pc_decr(pc_decr),
    .pc_rst(pc_rst),
    .c_incr(c_incr),
    .c_decr(c_decr),
    .c_rst(c_rst),
    .hd_incr (hd_incr),
    .hd_decr(hd_decr),
    .hd_rst(hd_rst),
    .mem_in(mem_in),
    .mem_incr(mem_incr),
    .mem_decr(mem_decr),
    .mem_rst(mem_rst),
    .text_in(text_in),
    .in_ack(in_ack),
    .out_valid(out_valid),
    .ready(ready)
  );
  
  datapath dane(
    .clk(clk),
    .nrst(nrst),
    .in_data(in_data),
    .out_data(out_data),
    .hd_s(hd_s),
    .text_s(text_s),
    .c_s(c_s),
    .mem_s(mem_s),
    .pc_incr(pc_incr),
    .pc_decr(pc_decr),
    .pc_rst(pc_rst),
    .c_incr(c_incr),
    .c_decr(c_decr),
    .c_rst(c_rst),
    .hd_incr (hd_incr),
    .hd_decr(hd_decr),
    .hd_rst(hd_rst),
    .mem_in(mem_in),
    .mem_incr(mem_incr),
    .mem_decr(mem_decr),
    .mem_rst(mem_rst),
    .text_in(text_in)
  );

endmodule
