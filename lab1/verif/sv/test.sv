/*/|==========/=/|====================================/
|*|| Filename |*|| test.sv 
|*|| Date     |*|| 2022-09-29
|*|| Author   |*|| Nguyen Ha Nhat Phuong
|*|| Contact  |*|| phuong2710@gmail.com
|_|/==========|_|/===================================*/

class test;
  // data or class properties
  env e0;
  mailbox drv_mbx;

  // initialization
  function new();
    drv_mbx = new;
    e0 = new;
  endfunction : new

  task run();
    e0.d0.drv_mbx = drv_mbx;
    e0.connect();
    e0.run();
  endtask : run
endclass : test
