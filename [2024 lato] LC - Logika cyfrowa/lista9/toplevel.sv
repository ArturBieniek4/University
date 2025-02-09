module memory(
  input wr, step,
  input [9:0] rdaddr, wraddr,
  input [15:0] in,
  output logic [15:0] out
);
  logic [15:0] mem [0:999];
  assign out = mem[rdaddr];
  always_ff @(posedge step)
    if (wr) mem[wraddr] <= in;
endmodule

module toplevel(
  input nrst, step,
  input [15:0] d,
  input push,
  input [1:0] op,
  output logic [15:0] out,
  output logic [9:0] cnt
);
  const logic [1:0] sub = 2'b01, add = 2'b10, mult = 2'b11;
  logic [15:0] top;
  logic [15:0] addr;
  assign addr = push ? cnt-1 : cnt-2;
  memory ram((push && cnt>0), step, addr, addr, out, top);
  
  always_ff @(posedge step or negedge nrst) begin
    if (!nrst) out <= 0;
    else begin
      if(push) out <= d;
      else unique case(op)
          sub: out <= -out;
          add: out <= out+top;
          mult: out <= out*top;
      endcase
    end
  end
  always_ff @(posedge step or negedge nrst) begin
    if(!nrst) cnt <= 0;
    else if(push && cnt!=1023) cnt <= cnt+1;
    else if((op==add || op==mult) && cnt>0) cnt <= cnt-1;
  end
endmodule
