module memory(
input rd, wr, clk,
  input [2:0] rdaddr, wraddr,
  input [7:0] in,
  output logic [7:0] out
);
  logic [7:0] mem [0:7];
always_ff @(posedge clk)
if (rd) out <= mem[rdaddr];
always_ff @(posedge clk)
if (wr) mem[wraddr] <= in;
endmodule

module toplevel(
  input clk, nrst, start,
  input [2:0] addr,
  input wr,
  input [7:0] datain,
  output [7:0] dataout,
  output logic ready
);
  logic [2:0] state;
  const logic [2:0] OUTER = 3'b000, INNER = 3'b001, END = 3'b010, SWAP = 3'b011, AFTERSWAP = 3'b100;
  logic ramwr;
  logic [2:0] rdaddr, wraddr;
  logic [7:0] in, out;
  memory ram(1, ramwr, clk, rdaddr, wraddr, in, out);
  logic [2:0] i, j, jm;
  logic [7:0] m, c;
  assign dataout = out;
  always_ff @(posedge clk or negedge nrst) begin
    rdaddr<=0;
    wraddr<=0;
    ready<=1;
    if(!nrst) begin
      ready <= 1;
    end
    else begin
      if(ready) begin
        if(start) begin
          ramwr <= 0;
          i <= 0;
          if(rdaddr==0) begin
            c <= out;
            state <= OUTER;
            ready<=0;
          end else begin
            rdaddr <= 0;
            ready<=1;
          end
        end
        else begin
          if(wr) begin
            wraddr <= addr;
            in <= datain;
            ramwr <= 1;
          end
          else begin
            ramwr <= 0;
            rdaddr <= addr;
          end
        end
      end
      else begin
        case(state)
          OUTER:begin
            if(i==7) ready <= 1;
            else begin
              ready <= 0;
              if(rdaddr==i+1) begin
                c<=out;
                state <= INNER;
              end
              else begin
                j <= i+1;
                jm <= i;
                m <= c;
                rdaddr <= i+1;
              end
            end
          end
          INNER:begin
            ready <=0;
            if(c<m) begin
              m <= c;
              jm <= j;
            end
            else begin
              if(j==7) begin
                if(rdaddr==i) begin
                  c<=out;
                  state<=END;
                end
                else rdaddr<=i;
              end
              else begin
                if(rdaddr==j+1) begin
                  j<=j+1;
                  c<=out;
                  state<=INNER;
                end
                else rdaddr<=j+1;
              end
            end
          end
          END:begin
            ready <=0;
            if(j==jm) state<=AFTERSWAP;
            else begin
              ramwr<=1;
              wraddr<=jm;
              in<=c;
              state<=SWAP;
            end
          end
          SWAP:begin
            ready <=0;
            ramwr<=1;
            wraddr<=i;
            in<=m;
            state<=AFTERSWAP;
          end
          AFTERSWAP:begin
            ready <=0;
            if(rdaddr==i+1) begin
              i<=i+1;
              c<=out;
              state<=OUTER;
            end
            else begin
              rdaddr<=i+1;
              state<=AFTERSWAP;
            end
          end
        endcase
      end
    end
  end
endmodule
