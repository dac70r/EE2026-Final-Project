`timescale 1ns / 1ps

module BCD_control(
input [31:0] loudnesses,
input switcherer,
input switcherer2,
input switcherer3,
input [3:0] digit1,
input [3:0] digit2,
input [4:0] digit3,
input [3:0] digit4,
input [3:0] refreshcounter,
output reg [3:0] ONE_DIGIT = 0
);

always@(refreshcounter)  
  begin  
        if (switcherer3 == 1)begin
        case(refreshcounter)
                2'd0:
                   ONE_DIGIT = digit1;
                2'd1:
                    ONE_DIGIT = digit2;
                2'd2:
                    ONE_DIGIT = digit3;
                2'd3:
                    ONE_DIGIT = digit4;
                endcase end
        
        else if (switcherer == 1 && switcherer2 == 0)begin   
        case(refreshcounter)
        2'd0:
           ONE_DIGIT = digit1;
        2'd1:
            ONE_DIGIT = digit2;
        2'd2:
            ONE_DIGIT = digit3;
        2'd3:
            ONE_DIGIT = digit4;
        endcase end
        
        else    begin
        if(switcherer2 == 1 && switcherer == 0) begin
            case(loudnesses)
            0: ONE_DIGIT = 0;
            1: ONE_DIGIT = 1;
            2: ONE_DIGIT = 2;
            3: ONE_DIGIT = 3;
            4: ONE_DIGIT = 4;
            5: ONE_DIGIT = 5;
            endcase end
            end 
    end
    









endmodule
