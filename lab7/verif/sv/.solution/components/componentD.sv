/*/|==========/=/|====================================/
|*|| Filename |*|| componentD.sv 
|*|| Date     |*|| 2022-12-02
|*|| Author   |*|| Nguyen Ha Nhat Phuong
|*|| Contact  |*|| phuong2710@gmail.com
|_|/==========|_|/===================================*/

class componentD extends uvm_component;
  // data or class properties
  uvm_blocking_put_export    #(item) bp_exp   ;
  uvm_nonblocking_get_export #(item) nbg_exp  ;
  uvm_nonblocking_put_port   #(item) nbp_port ;

  componentB compB;
  componentC compC;

  `uvm_component_utils(componentD)

  // initialization
  function new( string name="componentD", uvm_component parent );
    super.new( name, parent );
  endfunction: new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    bp_exp   = new( "bp_exp"   , this );
    nbg_exp  = new( "nbg_exp"  , this );
    nbp_port = new( "nbp_port" , this );
    compB    = componentB::type_id::create( "compB", this );
    compC    = componentC::type_id::create( "compC", this );

  endfunction: build_phase

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase)          ;
    bp_exp.connect(compB.bp_imp)        ;
    nbg_exp.connect(compC.nbg_imp)      ;
    compC.nbp_port.connect(nbp_port)    ;
    compC.bg_port.connect(compB.bg_imp) ;
  endfunction: connect_phase

endclass: componentD
