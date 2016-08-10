`timescale 1ns / 1ps
module FIR_test();
 wire signed[39:0] filter_output95;
 reg signed[16:0] filter_input95;
 //reg [15:0] temp [0:199];
 reg clock95;
 reg reset95;
 integer f195, f295;
 
 
 FIR F1(filter_output95, filter_input95, clock95, reset95);
 
 always #5 clock95 = ~clock95;
 
 initial
begin
f195  = $fopen("/home/up/uppu9195/EE278/mini2/Data.txt","r");
f295  = $fopen("/home/up/uppu9195/EE278/mini2/Output.txt","w");
clock95 = 1'b0; reset95 = 1'b1; 
#10 reset95 = 1'b0;/* filter_input95 = -17'd2;
#10 filter_input95 = 17'd0;
#10 filter_input95 = -17'd2;
#10 filter_input95 = 17'd0;
#10 filter_input95 = -17'd2;
#10 filter_input95 = -17'd1;
#10 filter_input95 = -17'd1;
#10 filter_input95 = -17'd2;
#10 filter_input95 = 17'd0;
#10 filter_input95 = -17'd2;
#10 filter_input95 = 17'd0;
#10 filter_input95 = -17'd3;
#10 filter_input95 = 17'd0;
#10 filter_input95 = -17'd2;
#10 filter_input95 = -17'd1;
#10 filter_input95 = -17'd1;
#10 filter_input95 = -17'd1;
#10 filter_input95 = -17'd3;
#10 filter_input95 = 17'd5;
#10 filter_input95 = -17'd15;
#10 filter_input95 = 17'd25;
#10 filter_input95 = -17'd47;
#10 filter_input95 = 17'd73;
#10 filter_input95 = -17'd116;
#10 filter_input95 = 17'd169;
#10 filter_input95 = -17'd241;
#10 filter_input95 = 17'd345;
#10 filter_input95 = -17'd482;
#10 filter_input95 = 17'd684;
#10 filter_input95 = -17'd993;
#10 filter_input95 = 17'd1558;
#10 filter_input95 = -17'd2933;*/
end
 
always @(posedge clock95 or posedge reset95) begin
if (reset95) begin
filter_input95 = 17'd0;
end
else begin
    if(!$feof(f195)) begin
    $fscanf(f195,"%d \n",filter_input95);
    //$display("%d,%d", din,datain[i]);
    $fwrite(f295,"%d \n",filter_output95);
    end
    else begin
    $fclose(f195);
    $fwrite(f295,"%d \n",filter_output95);
    $fclose(f295);
    #1000 $finish;
    end
end
end

 
 
 initial
  begin
   $dumpfile("FIR.vcd");
   $dumpvars(0,FIR_test);
   end 
 
 endmodule
 