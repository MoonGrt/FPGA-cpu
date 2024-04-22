module InCtrl_led (
    input  wire  [15: 0]  num_in,
    output wire  [7: 0]   led
);

assign  led[7: 0] =  num_in[7: 0];
        
endmodule
