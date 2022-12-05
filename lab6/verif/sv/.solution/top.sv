/*/|==========/=/|====================================/
|*|| Filename |*|| top.sv 
|*|| Date     |*|| 2022-10-09
|*|| Author   |*|| Nguyen Ha Nhat Phuong
|*|| Contact  |*|| phuong2710@gmail.com
|_|/==========|_|/===================================*/

module top;
  import uvm_pkg::*;
  import my_pkg ::*;

  clk_if clk0 ();
  adder_if if0 ();
  my_test test;

  my_adder dut (.rstn (if0.rstn ),
                .a    (if0.a    ),
                .b    (if0.b    ),
                .sum  (if0.sum  ),
                .carry(if0.carry) );

  initial begin
    uvm_config_db #(virtual adder_if)::set(null, "uvm_test_top", "vif" , if0 );
    uvm_config_db #(virtual clk_if)  ::set(null, "uvm_test_top", "vclk", clk0);
    run_test("my_test"); 
  end

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1,dut,clk0.tb_clk);
  end
endmodule : top
