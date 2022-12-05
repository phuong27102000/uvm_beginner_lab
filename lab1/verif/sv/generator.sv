/*/|==========/=/|====================================/
|*|| Filename |*|| generator.sv 
|*|| Date     |*|| 2022-09-29
|*|| Author   |*|| Nguyen Ha Nhat Phuong
|*|| Contact  |*|| phuong2710@gmail.com
|_|/==========|_|/===================================*/

class generator;
  // data or class properties
  int loop = 30;
  event drv_done;
  mailbox drv_mbx;

  task run();
    for (int i = 0; i < loop; i++) begin
      Packet item = new;
      item.randomize();
      $display("T = %0t [Generator] Loop: %0d/%0d", $time, i+1, loop);
      drv_mbx.put(item);
      $display("T = %0t [Generator] Wait for driver to be done", $time);
      @(drv_done);
    end
  endtask: run
endclass : generator
