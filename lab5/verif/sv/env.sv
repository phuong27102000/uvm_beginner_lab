/*/|==========/=/|====================================/
|*|| Filename |*|| my_env.sv 
|*|| Date     |*|| 2022-09-30
|*|| Author   |*|| Nguyen Ha Nhat Phuong
|*|| Contact  |*|| phuong2710@gmail.com
|_|/==========|_|/===================================*/

class my_env extends uvm_env;
  // data or class properties
  my_agent agt; 

  `uvm_component_utils(my_env)

  // initialization
  function new( string name="my_env", uvm_component parent=null );
    super.new(name, parent);
  endfunction : new

  virtual function void build_phase(uvm_phase phase);
    agt = my_agent::type_id::create( "agt", this );
  endfunction: build_phase

endclass : my_env
