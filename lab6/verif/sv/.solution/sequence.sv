/*/|==========/=/|====================================/
|*|| Filename |*|| sequence.sv 
|*|| Date     |*|| 2022-10-09
|*|| Author   |*|| Nguyen Ha Nhat Phuong
|*|| Contact  |*|| phuong2710@gmail.com
|_|/==========|_|/===================================*/

class my_sequence extends uvm_sequence #(seq_item);
  // data or class properties
  seq_item item;
  int      loop=10;

  `uvm_object_utils(my_sequence)

  // initialization
  function new( string name="my_sequence");
    super.new( name );
  endfunction : new

  `uvm_declare_p_sequencer(uvm_sequencer #(seq_item));

  task body();
    if ($test$plusargs("LOOP")) begin
      $value$plusargs("LOOP=%d", loop);
    end
    `uvm_info( get_type_name(), $sformatf("We're gonna generate %d sequence items", loop), UVM_HIGH);
    for (int i = 0; i < loop; i++) begin
      item = new("item");
      start_item(item);
      item.randomize();
      finish_item(item);
      `uvm_info( get_type_name(), $sformatf("Generated %d/%d sequence items",i+1, loop), UVM_HIGH);
    end
  endtask: body

endclass : my_sequence
