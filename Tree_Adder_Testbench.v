`timescale 1ns / 1ps
module Tree_Adder_test();
 wire signed[39:0] filter_output95;
 reg signed[16:0] filter_input95;
 //reg [15:0] temp [0:199];
 reg clock95;
 reg reset95;
 integer f195, f295;
 
 
 Tree_Adder T1(filter_output95, filter_input95, clock95, reset95);
 
 always #5 clock95 = ~clock95;
 
 initial
begin
f195  = $fopen("/home/up/uppu9195/EE278/mini2/Data.txt","r");
f295  = $fopen("/home/up/uppu9195/EE278/mini2/Tree_Output.txt","w");
clock95 = 1'b0; reset95 = 1'b1; 
#10 reset95 = 1'b0;
end
 
always @(posedge clock95 or posedge reset95) begin
if (reset95) begin
filter_input95 = 17'd0;
end
else begin
    if(!$feof(f195)) begin
    $fscanf(f195,"%d \n",filter_input95);
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
   $dumpfile("Tree_Adder.vcd");
   $dumpvars(0,Tree_Adder);
   end 
 
 endmodule
 