/* ==================================================
 * Filename: user_test.svh 
 * Date    : 2022-09-24
 * Author  : Nguyen Ha Nhat Phuong
 * Contact : phuong2710@gmail.com
 * ==================================================
 */
class my_test extends uvm_test;
  // data or class properties
  somebody thinh;
  somebody phuong;
  uvm_table_printer tb_printer;
  
  `uvm_component_utils(my_test)
  // initialization
  function new(string name="my_test", uvm_component parent);
    super.new(name, parent);
  endfunction : new

  virtual function void build_phase(uvm_phase phase);
    thinh = somebody::type_id::create("thinh", this);
    phuong = somebody::type_id::create("phuong", this);
  endfunction: build_phase

  virtual task run_phase(uvm_phase phase);
    thinh.result = 5;
    thinh.code = "return 5";
    thinh.print(tb_printer);
    phuong.copy(thinh);
    phuong.print(tb_printer);
  endtask: run_phase

endclass : my_test
