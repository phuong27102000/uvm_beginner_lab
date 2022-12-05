/*/|==========/=/|====================================/
|*|| Filename |*|| sequence.sv 
|*|| Date     |*|| 2022-09-30
|*|| Author   |*|| Nguyen Ha Nhat Phuong
|*|| Contact  |*|| phuong2710@gmail.com
|_|/==========|_|/===================================*/

class seq extends uvm_sequence #(seq_item);
  // data or class properties
  seq_item  item;
  int       loop=10;

  `uvm_object_utils(seq)

  // initialization
  function new( string name="seq" );
    super.new(name);
  endfunction : new
  
  `uvm_declare_p_sequencer(uvm_sequencer #(seq_item));
  
  virtual task body();
    if ($value$plusargs("LOOP=%d",loop)) begin
      `uvm_info( "seq", $sformatf("\n\\-- We're gonna generate %d items",loop), UVM_HIGH);
    end
    for (int i = 0; i < loop; i++) begin
      /* Writing code for the sequence body here
       */
    end
  endtask: body

endclass : seq
