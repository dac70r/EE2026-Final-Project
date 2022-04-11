`timescale 1ns / 1ps


module seven_segment(input basys_clock,input [31:0]loudness, input switch,input switch2,
input switch3,input [31:0]a,b,c,d, output [7:0] seg, output [3:0] an );
    //input [31:0]a, b,c,d,
    wire clk_xhz;
    wire [1:0] refreshcounterz;
//    reg [31:0] a = 6;
//    reg [31:0] b = 7;
//    reg [31:0] a = 10;
//    reg [31:0] b = 11;
    wire [3:0] one_digit;
    
//    always @ (posedge basys_clock)
//    begin
//        if(switch3 == 0)
//        begin a = 10; b = 11; end
        
//    end
    
    
    clock_divider freq_10hz (basys_clock, 1999, clk_xhz);
    refreshcounter refreshcounterWrapper (clk_xhz, refreshcounterz);
    anode_control anodecontrolWrapper (refreshcounterz,switch, switch2,switch3,an);
    BCD_control bcdWrapper( 
    .loudnesses(loudness),
    .switcherer(switch),
    .switcherer2(switch2),
    .switcherer3(switch3),
    .digit1(c), // B
    .digit2(d), // d
    .digit3(b), // ones
    .digit4(a), // hundreds
    .refreshcounter(refreshcounterz),
    .ONE_DIGIT(one_digit));
    
    BCD_to_Cathodez BCDtocathodezWrapper (one_digit, seg);
    
endmodule
