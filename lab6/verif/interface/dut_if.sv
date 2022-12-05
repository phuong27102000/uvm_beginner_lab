/*/|==========/=/|====================================/
|*|| Filename |*|| dut_if.sv 
|*|| Date     |*|| 2022-09-29
|*|| Author   |*|| Nguyen Ha Nhat Phuong
|*|| Contact  |*|| phuong2710@gmail.com
|_|/==========|_|/===================================*/

interface adder_if ();
  // nets
  bit rstn;
  bit [7:0] a;
  bit [7:0] b;
  bit [7:0] sum;
  bit carry;
  // clocking

  // modports
  
endinterface : adder_if
