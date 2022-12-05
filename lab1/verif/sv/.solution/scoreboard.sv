/*/|==========/=/|====================================/
|*|| Filename |*|| scoreboard.sv 
|*|| Date     |*|| 2022-09-29
|*|| Author   |*|| Nguyen Ha Nhat Phuong
|*|| Contact  |*|| phuong2710@gmail.com
|_|/==========|_|/===================================*/

class scoreboard;
  // data or class properties
  mailbox scb_mbx;

  task run();
    forever begin
      Packet item, ref_item;
      scb_mbx.get(item);
      item.print("Scoreboard");

      ref_item = new();
      ref_item.copy(item);

      if (ref_item.rstn) begin
        {ref_item.carry, ref_item.sum} = 0;
      end else begin
        {ref_item.carry, ref_item.sum} = ref_item.a + ref_item.b;
      end
      if (ref_item.carry != item.carry) begin
        $display("T = %0t [Scoreboard] Carries mistmatch | ref_item = 0x%0h | item = 0x%0h [ERROR] ", $time, ref_item.carry, item.carry);
      end else begin
        $display("T = %0t [Scoreboard] Carries match | ref_item = 0x%0h | item = 0x%0h [PASS]", $time, ref_item.carry, item.carry);
      end
      if (ref_item.sum != item.sum) begin
        $display("T = %0t [Scoreboard] Sums    mistmatch | ref_item = 0x%0h | item = 0x%0h [ERROR]", $time, ref_item.sum, item.sum);
      end else begin
        $display("T = %0t [Scoreboard] Sums    match | ref_item = 0x%0h | item = 0x%0h [PASS]", $time, ref_item.sum, item.sum);
      end
    end
  endtask: run
endclass : scoreboard
