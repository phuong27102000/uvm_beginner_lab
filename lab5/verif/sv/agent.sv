/*/|==========/=/|====================================/
|*|| Filename |*|| agent.sv 
|*|| Date     |*|| 2022-09-30
|*|| Author   |*|| Nguyen Ha Nhat Phuong
|*|| Contact  |*|| phuong2710@gmail.com
|_|/==========|_|/===================================*/

class my_agent extends uvm_agent;
  // data or class properties
  uvm_sequencer #(seq_item) seqr;
  drv driv;

  `uvm_component_utils(my_agent)

  // initialization
  function new( string name="my_agent", uvm_component parent );
    super.new(name, parent);
  endfunction : new

  virtual function void build_phase(uvm_phase phase);
    driv = drv::type_id::create( "drv", this );
    seqr = uvm_sequencer #(seq_item)::type_id::create( "seqr", this );
  endfunction: build_phase

  virtual function void connect_phase(uvm_phase phase);
    driv.seq_item_port.connect(seqr.seq_item_export);
  endfunction: connect_phase

endclass : my_agent
