/*/|==========/=/|====================================/
|*|| Filename |*|| env.sv 
|*|| Date     |*|| 2022-09-29
|*|| Author   |*|| Nguyen Ha Nhat Phuong
|*|| Contact  |*|| phuong2710@gmail.com
|_|/==========|_|/===================================*/

class env;
  // data or class properties
  generator   g0;
  driver      d0;
  monitor     m0;
  scoreboard  s0;

  virtual adder_if m_adder_vif;
  virtual clk_if   m_clk_vif;

  event drv_done;
  mailbox drv_mbx;
  mailbox scb_mbx;

  // initialization
  function new();
    d0 = new;
    m0 = new;
    s0 = new;
    g0 = new;
    scb_mbx = new();
    drv_mbx = new();
  endfunction : new

  function void connect ();
    // Connect virtual interface handles
    d0.m_adder_vif = m_adder_vif;
    m0.m_adder_vif = m_adder_vif;
    d0.m_clk_vif = m_clk_vif;
    m0.m_clk_vif = m_clk_vif;
    
    // Connect mailboxes between each component
    d0.drv_mbx = drv_mbx;
    g0.drv_mbx = drv_mbx;
    m0.scb_mbx = scb_mbx;
    s0.scb_mbx = scb_mbx;

    // Connect event handles
    d0.drv_done = drv_done;
    g0.drv_done = drv_done;
  endfunction : connect

  task run();
    fork
      s0.run();
      d0.run();
      m0.run();
      g0.run();
    join_any
  endtask: run

endclass : env
