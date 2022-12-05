/*/|==========/=/|====================================/
|*|| Filename |*|| top.sv 
|*|| Date     |*|| 2022-09-29
|*|| Author   |*|| Nguyen Ha Nhat Phuong
|*|| Contact  |*|| phuong2710@gmail.com
|_|/==========|_|/===================================*/

module tb ();
  bit tb_clk;

  clk_if m_clk_if();
  adder_if m_adder_if();
  my_adder u0 (m_adder_if.rstn, m_adder_if.a, m_adder_if.b, m_adder_if.sum, m_adder_if.carry);
  
  initial begin
      test t0;

      t0 = new;
      t0.e0.m_adder_vif = m_adder_if;
      t0.e0.m_clk_vif = m_clk_if;
      tb_clk = m_clk_if.tb_clk;
      t0.run();
      #20 $finish;
  end
  initial begin
    // Terminating violently
    #1000 $finish;
  end

  initial begin
    $dumpfile("dump.vcd");
  end
endmodule
