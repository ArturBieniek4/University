module circuit(output o, input [3:0] i);
  wire x=i[0],y=i[1],z=i[2],w=i[3];
  assign o=
    // poziome
    
    //!xy
    (!x&&y&&z)||
    (!x&&y&&w)||
    
    //xy
    (x&&y&&!z)||
    (x&&y&&!w)||
    
    //x!y
    (x&&!y&&z)||
    (x&&!y&&w)||
    
    //pionowe
    
    //!zw
    (x&&!z&&w)||
    (y&&!z&&w)||
    
    //zw
    (!x&&z&&w)||
    (!y&&z&&w)||
    
    //z!w
    (x&&z&&!w)||
    (y&&z&&!w)
      ;
endmodule
