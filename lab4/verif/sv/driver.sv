/*/|==========/=/|====================================/
|*|| Filename |*|| monitor.sv 
|*|| Date     |*|| 2022-09-30
|*|| Author   |*|| Nguyen Ha Nhat Phuong
|*|| Contact  |*|| phuong2710@gmail.com
|_|/==========|_|/===================================*/

class drv extends uvm_driver #(seq_item);
  // data or class properties

  `uvm_component_utils(drv)

  // initialization
  function new( string name="drv", uvm_component parent);
    super.new(name, parent);
  endfunction : new

  virtual task run_phase(uvm_phase phase);
    seq_item item;
    forever begin
      seq_item_port.get_next_item(item);
      `uvm_info( "drv", "\n\\-- Driver received a new item:", UVM_HIGH);
      item.print();
      seq_item_port.item_done();
      // `uvm_fatal( "drv", "Uh no, cannot find you in the list.");
    end
  endtask: run_phase

endclass : drv
