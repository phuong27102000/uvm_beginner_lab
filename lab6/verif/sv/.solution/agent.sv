/*/|==========/=/|====================================/
|*|| Filename |*|| agent.sv 
|*|| Date     |*|| 2022-10-09
|*|| Author   |*|| Nguyen Ha Nhat Phuong
|*|| Contact  |*|| phuong2710@gmail.com
|_|/==========|_|/===================================*/

class my_agent extends uvm_agent;
  // data or class properties
  uvm_sequencer #(seq_item) sqr;
  my_driver                 drv;
  my_monitor                mon;

  `uvm_component_utils(my_agent)

  // initialization
  function new( string name="my_agent", uvm_component parent );
    super.new( name, parent );
  endfunction : new

  function void build_phase(uvm_phase phase);
    sqr = uvm_sequencer #(seq_item)::type_id::create( "sqr", this );
    drv = my_driver                ::type_id::create( "drv", this);
    mon = my_monitor               ::type_id::create( "mon", this );
  endfunction: build_phase

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    drv.seq_item_port.connect(sqr.seq_item_export);
  endfunction: connect_phase

endclass : my_agent
