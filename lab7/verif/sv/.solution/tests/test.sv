/*/|==========/=/|====================================/
|*|| Filename |*|| test.sv 
|*|| Date     |*|| 2022-10-09
|*|| Author   |*|| Nguyen Ha Nhat Phuong
|*|| Contact  |*|| phuong2710@gmail.com
|_|/==========|_|/===================================*/

class my_test extends uvm_test;
  // data or class properties
  env m_env;

  `uvm_component_utils(my_test)

  // initialization
  function new( string name="my_test", uvm_component parent );
    super.new( name, parent );
  endfunction : new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    m_env = env::type_id::create( "m_env", this );
  endfunction: build_phase

  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    phase.raise_objection(this);
    @m_env.done;
    phase.drop_objection(this);
  endtask: run_phase

endclass : my_test
