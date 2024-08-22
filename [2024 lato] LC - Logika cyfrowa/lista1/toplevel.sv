module circuit(output o, input a,b,c,d,x,y);
  assign o=(!x && !y && a)
            || (!x && y && b)
            || (x && !y && c)
            || (x && y && d);
endmodule
