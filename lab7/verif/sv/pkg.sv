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

  // Transactions
  `include "transactions/all_transactions.sv";

  // Component
  `include "components/all_components.sv";

  // Tests
  `include "tests/all_tests.sv";

endpackage : my_pkg
