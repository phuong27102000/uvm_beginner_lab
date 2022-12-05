/*/|==========/=/|====================================/
|*|| Filename |*|| componentE.sv 
|*|| Date     |*|| 2022-12-02
|*|| Author   |*|| Nguyen Ha Nhat Phuong
|*|| Contact  |*|| phuong2710@gmail.com
|_|/==========|_|/===================================*/

class componentE extends uvm_component;
  // data or class properties
  uvm_nonblocking_get_port #(item) nbg_port;
  uvm_analysis_port        #(item) ana_port;

        event done      ;
  local int   delay = 5 ;

  `uvm_component_utils(componentE)

  // initialization
  function new( string name="componentE", uvm_component parent );
    super.new( name, parent );
  endfunction: new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    nbg_port = new( "nbg_port", this );
    ana_port = new( "ana_port", this );
    if ($test$plusargs("DELAY")) begin
      $value$plusargs("DELAY = %d", delay); 
    end
  endfunction: build_phase

  task run_phase(uvm_phase phase);
    item an_item;
    int loop = 10;

    super.run_phase(phase);
    
    if ($test$plusargs("LOOP")) begin
      $value$plusargs("LOOP = %d", loop); 
    end
    for (int i = 0; i < loop; i++) begin
      #(delay);
      `uvm_info( get_type_name(), $sformatf("\n---> Loop: %d/%d", i, loop), UVM_MEDIUM);
      if ( nbg_port.try_get(an_item) ) begin
        `uvm_info( get_type_name(), $sformatf("\n---> New item get: %s", an_item.convert2string()), UVM_MEDIUM);
        ana_port.write(an_item);
        `uvm_info( get_type_name(), "\n---> Already write the item", UVM_MEDIUM);
      end else begin
        `uvm_info( get_type_name(), "\n---> Tried but cannot get the item", UVM_MEDIUM);
      end
    end
    ->done;
  endtask: run_phase

endclass: componentE
