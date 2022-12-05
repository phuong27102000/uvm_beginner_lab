/*/|==========/=/|====================================/
|*|| Filename |*|| env.sv 
|*|| Date     |*|| 2022-10-09
|*|| Author   |*|| Nguyen Ha Nhat Phuong
|*|| Contact  |*|| phuong2710@gmail.com
|_|/==========|_|/===================================*/

class my_env extends uvm_env;
  // data or class properties
  my_agent      agt;
  my_scoreboard scb;

  `uvm_component_utils(my_env)

  // initialization
  function new( string name="my_env", uvm_component parent );
    super.new( name, parent );
  endfunction : new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agt = my_agent     ::type_id::create( "agt", this );
    scb = my_scoreboard::type_id::create( "scb", this );
  endfunction: build_phase
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    agt.mon.ana_port.connect(scb.ana_exp);
  endfunction: connect_phase
endclass : my_env
