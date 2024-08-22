module circuit(output o, input [3:0] i);
  wire x=i[0],y=i[1],z=i[2],w=i[3];
  assign o=
    (x||y||z)&&
    (x||z||w)&&
    (x||y||w)&&
    (y||z||w)&&
    (!x||!y||!z||!w)
      ;
endmodule
