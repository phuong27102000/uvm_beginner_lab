/*/|==========/=/|====================================/
|*|| Filename |*|| componentB.sv 
|*|| Date     |*|| 2022-12-04
|*|| Author   |*|| Nguyen Ha Nhat Phuong
|*|| Contact  |*|| phuong2710@gmail.com
|_|/==========|_|/===================================*/

class componentB extends uvm_component;
  // data or class properties
  uvm_blocking_put_imp #(item, componentB) bp_imp ;
  uvm_blocking_get_imp #(item, componentB) bg_imp ;

  local mailbox #(item) mbx        ;
  local int             size  = 10 ;
  local int             delay = 5  ;

  `uvm_component_utils(componentB)

  // initialization
  function new( string name="componentB", uvm_component parent );
    super.new( name, parent ) ;
    if ($test$plusargs("DELAY")) begin
      $value$plusargs("DELAY = %d", delay); 
    end
    if ($test$plusargs("MBX_SIZE")) begin
      $value$plusargs("MBX_SIZE = %d", size); 
    end
    mbx = new( size ) ;
  endfunction: new

  function void build_phase(uvm_phase phase);
    bp_imp = new( "bp_imp", this );
    bg_imp = new( "bg_imp", this );
  endfunction: build_phase

  virtual task put( input item an_item );
    #(delay);
    `uvm_info( get_type_name(), $sformatf("\n---> New item received: %s", an_item.convert2string()), UVM_MEDIUM);
    if ( size != 0 && mbx.num < size ) begin
      mbx.put(an_item);
    end else begin
      `uvm_info( get_type_name(), "Mailbox is now full!", UVM_MEDIUM);
    end
  endtask: put

  virtual task get( output item an_item );
    #5;
    if (mbx.num != 0) begin
      mbx.get( an_item );
      `uvm_info( get_type_name(), $sformatf("\n---> New item get: %s", an_item.convert2string()), UVM_MEDIUM);
    end else begin
      `uvm_info( get_type_name(), "Mailbox is now empty!", UVM_MEDIUM);
      an_item = item::type_id::create( "an_item" );
      an_item.addr = 32'hDEAD_DEAD;
      an_item.data = 32'hDEAD_DEAD;
    end
  endtask: get

endclass: componentB
