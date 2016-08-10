`timescale 1ns / 1ps
module FIR (filter_output95, filter_input95, clock95, reset95);

 output reg signed[39:0] filter_output95;
 input signed[16:0] filter_input95;
 input clock95;
 input reset95;
 //reg signed[32:0] filter_output95;
 reg signed[39:0] prod95_1,prod95_2,prod95_3,prod95_4,prod95_5,prod95_6,prod95_7,prod95_8,prod95_9;
 reg signed[16:0] delayed_sample95_0,delayed_sample95_1,delayed_sample95_2,delayed_sample95_3,delayed_sample95_4,delayed_sample95_5,delayed_sample95_6,delayed_sample95_7;
 reg signed[16:0] fil_coef_0,fil_coef_1,fil_coef_2,fil_coef_3,fil_coef_4,fil_coef_5,fil_coef_6,fil_coef_7,fil_coef_8;
 reg signed[39:0] sum95_1,sum95_2,sum95_3,sum95_4,sum95_5,sum95_6,sum95_7;
 reg signed[16:0] temp;

//assign 

always@(*)
 begin
  if(reset95)
   begin
    prod95_1 = 39'b0;
    prod95_2 = 39'b0;
    prod95_3 = 39'b0;
    prod95_4 = 39'b0;
    prod95_5 = 39'b0;
    prod95_6 = 39'b0;
    prod95_7 = 39'b0;
    prod95_8 = 39'b0;
    prod95_9 = 39'b0;
    
    fil_coef_0 = 17'b0;
    fil_coef_1 = 17'b0;
    fil_coef_2 = 17'b0;
    fil_coef_3 = 17'b0;
    fil_coef_4 = 17'b0;
    fil_coef_5 = 17'b0;
    fil_coef_6 = 17'b0;
    fil_coef_7 = 17'b0;
    fil_coef_8 = 17'b0;
    
    sum95_1 = 39'b0;
    sum95_2 = 39'b0;
    sum95_3 = 39'b0;
    sum95_4 = 39'b0;
    sum95_5 = 39'b0;
    sum95_6 = 39'b0;
    sum95_7 = 39'b0; 
    
    filter_output95 = 39'b0;
    
   end
 
 else begin
 fil_coef_0 = -17'd409;
 fil_coef_1 = 17'd769;
 fil_coef_2 = 17'd8928;
 fil_coef_3 = 17'd24338;
 fil_coef_4 = 17'd32768;
 fil_coef_5 = 17'd24338;
 fil_coef_6 = 17'd8928;
 fil_coef_7 = 17'd769;
 fil_coef_8 = -17'd409;
 
  prod95_1 = (fil_coef_0) * (temp);
  prod95_2 = (fil_coef_1) * (delayed_sample95_0);
  prod95_3 = (fil_coef_2) * (delayed_sample95_1);
  prod95_4 = (fil_coef_3) * (delayed_sample95_2);
  prod95_5 = (fil_coef_4) * (delayed_sample95_3);
  prod95_6 = (fil_coef_5) * (delayed_sample95_4);
  prod95_7 = (fil_coef_6) * (delayed_sample95_5);
  prod95_8 = (fil_coef_7) * (delayed_sample95_6);
  prod95_9 = (fil_coef_8) * (delayed_sample95_7);
  
  
    sum95_1 = prod95_1 + prod95_2;
    sum95_2 = sum95_1 + prod95_3;
    sum95_3 = sum95_2 + prod95_4;
    sum95_4 = sum95_3 + prod95_5;
    sum95_5 = sum95_4 + prod95_6;
    sum95_6 = sum95_5 + prod95_7;
    sum95_7 = sum95_6 + prod95_8;
    filter_output95 = sum95_7 + prod95_9;  
  
 end
 end

always@(posedge clock95 or posedge reset95)
 begin
  if(reset95)
   begin
    delayed_sample95_7 <= 17'b0;
    delayed_sample95_6 <= 17'b0;
    delayed_sample95_5 <= 17'b0;
    delayed_sample95_4 <= 17'b0;
    delayed_sample95_3 <= 17'b0;
    delayed_sample95_2 <= 17'b0;
    delayed_sample95_1 <= 17'b0;
    delayed_sample95_0 <= 17'b0;
    temp <= 17'b0;
   end
  else begin
    delayed_sample95_7 <= delayed_sample95_6;
    delayed_sample95_6 <= delayed_sample95_5;
    delayed_sample95_5 <= delayed_sample95_4;
    delayed_sample95_4 <= delayed_sample95_3;
    delayed_sample95_3 <= delayed_sample95_2;
    delayed_sample95_2 <= delayed_sample95_1;
    delayed_sample95_1 <= delayed_sample95_0;
    delayed_sample95_0 <= temp;
    temp <= filter_input95;
  end
end
endmodule
   
   

