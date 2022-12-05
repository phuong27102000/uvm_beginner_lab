/*/|==========/=/|====================================/
|*|| Filename |*|| pkg.sv 
|*|| Date     |*|| 2022-10-09
|*|| Author   |*|| Nguyen Ha Nhat Phuong
|*|| Contact  |*|| phuong2710@gmail.com
|_|/==========|_|/===================================*/

package my_pkg;
  // UVM
  import uvm_pkg::*;
  `include "uvm_macros.svh";

  // Sequences
  `include "seq_item.sv";
  `include "sequence.sv";

  // Component
  `include "driver.sv";
  `include "monitor.sv";
  `include "agent.sv";
  `include "scoreboard.sv";
  `include "env.sv";
  `include "test.sv";
endpackage : my_pkg
