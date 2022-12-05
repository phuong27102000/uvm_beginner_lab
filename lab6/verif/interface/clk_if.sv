/*/|==========/=/|====================================/
|*|| Filename |*|| clk_if.sv 
|*|| Date     |*|| 2022-09-29
|*|| Author   |*|| Nguyen Ha Nhat Phuong
|*|| Contact  |*|| phuong2710@gmail.com
|_|/==========|_|/===================================*/

interface clk_if ();
  // nets
  
  // clocking
  logic tb_clk;
  // modports
   
  initial begin
    tb_clk <= 0;
  end
  
  always #10 tb_clk = ~tb_clk;
endinterface : clk_if
