/*/|==========/=/|====================================/
|*|| Filename |*|| env.sv 
|*|| Date     |*|| 2022-12-04
|*|| Author   |*|| Nguyen Ha Nhat Phuong
|*|| Contact  |*|| phuong2710@gmail.com
|_|/==========|_|/===================================*/

class env extends uvm_env;
  // data or class properties
  componentA  compA  ;
  componentD  compD  ;
  componentE  compE  ;
  componentF2 compF2 ;
  componentG0 compG0 ;
  componentG1 compG1 ;
  componentG2 compG2 ;

  event done;

  `uvm_component_utils(env)

  // initialization
  function new( string name="env", uvm_component parent );
    super.new( name, parent );
  endfunction: new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    compA  =  componentA::type_id::create( "compA" , this );
    compD  =  componentD::type_id::create( "compD" , this );
    compE  =  componentE::type_id::create( "compE" , this );
    compF2 = componentF2::type_id::create( "compF2", this );
    compG0 = componentG0::type_id::create( "compG0", this );
    compG1 = componentG1::type_id::create( "compG1", this );
    compG2 = componentG2::type_id::create( "compG2", this );

  endfunction: build_phase

  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    fork
      @compA.done;
      @compD.compC.done;
      @compE.done;
    join
    ->done;
  endtask: run_phase

  function void connect_phase(uvm_phase phase) ;
    super.connect_phase(phase)             ;
    compA.bp_port.connect(compD.bp_exp)    ;
    compD.nbp_port.connect(compF2.nbp_exp) ;
    compE.nbg_port.connect(compD.nbg_exp)  ;
    compE.ana_port.connect(compG0.ana_imp) ;
    compE.ana_port.connect(compG1.ana_imp) ;
    compE.ana_port.connect(compG2.ana_imp) ;
  endfunction: connect_phase

endclass: env
