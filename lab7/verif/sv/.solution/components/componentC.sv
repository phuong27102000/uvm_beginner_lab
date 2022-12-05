/*/|==========/=/|====================================/
|*|| Filename |*|| componentC.sv 
|*|| Date     |*|| 2022-12-02
|*|| Author   |*|| Nguyen Ha Nhat Phuong
|*|| Contact  |*|| phuong2710@gmail.com
|_|/==========|_|/===================================*/

class componentC extends uvm_component;
  // data or class properties
  uvm_blocking_get_port    #(item)             bg_port  ;
  uvm_nonblocking_get_imp  #(item, componentC) nbg_imp  ;
  uvm_nonblocking_put_port #(item)             nbp_port ;

  event done;

  local mailbox #(item) mbx        ;
  local int             size  = 10 ;

  `uvm_component_utils(componentC)

  // initialization
  function new( string name="componentC", uvm_component parent );
    super.new( name, parent );
    if ($test$plusargs("MBX_SIZE")) begin
      $value$plusargs("MBX_SIZE = %d", size); 
    end
    mbx = new( size ) ;
  endfunction: new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    bg_port  = new( "bg_port",  this ) ;
    nbg_imp  = new( "nbg_imp",  this ) ;
    nbp_port = new( "nbp_port", this ) ;
  endfunction: build_phase

  task run_phase(uvm_phase phase);
    item an_item;
    int loop = 10;

    super.run_phase(phase);
    
    if ($test$plusargs("LOOP")) begin
      $value$plusargs("LOOP = %d", loop); 
    end
    for (int i = 0; i < loop; i++) begin
      `uvm_info( get_type_name(), $sformatf("\n---> Loop: %d/%d", i, loop), UVM_MEDIUM) ;
      `uvm_info( get_type_name(), "\n---> Ready to get the item", UVM_MEDIUM)           ;
      bg_port.get(an_item) ;
      if ( size != 0 && mbx.num < size ) begin
        mbx.put(an_item) ;
        `uvm_info( get_type_name(), "\n---> Already put into the mailbox", UVM_MEDIUM)           ;
      end
      `uvm_info( get_type_name(), $sformatf("\n---> New item get: %s", an_item.convert2string()), UVM_MEDIUM);
      `uvm_info( get_type_name(), "\n---> Try to put the item", UVM_MEDIUM);
      if ( nbp_port.try_put(an_item) ) begin
        `uvm_info( get_type_name(), "\n---> Put successfully", UVM_MEDIUM);
      end
    end
    ->done;
  endtask: run_phase

  virtual function bit try_get( output item an_item );
    if ( mbx.try_get( an_item ) ) begin
      return 1 ;
    end else begin 
      return 0 ;
    end
  endfunction: try_get

  virtual function bit can_get();
    return ( mbx.num != 0 ) ;
  endfunction: can_get

endclass: componentC
