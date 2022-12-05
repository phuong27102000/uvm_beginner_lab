/*/|==========/=/|====================================/
|*|| Filename |*|| dut_if.sv 
|*|| Date     |*|| 2022-09-29
|*|| Author   |*|| Nguyen Ha Nhat Phuong
|*|| Contact  |*|| phuong2710@gmail.com
|_|/==========|_|/===================================*/

interface adder_if ();
  // nets
  logic rstn;
  logic [7:0] a;
  logic [7:0] b;
  logic [7:0] sum;
  logic carry;
  // clocking
  
  // modports
  
endinterface : adder_if
