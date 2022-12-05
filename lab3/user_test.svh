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
  uvm_comparer thay_trang;
  
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
    somebody con_anh_thinh;
    thinh.result = 10;
    thinh.code = "return 10";

    `uvm_info("MUST READ", "Thinh 's code and result: ", UVM_MEDIUM);
    thinh.print(tb_printer);

    `uvm_info("MUST READ", "Thinh 's code is the heritage for his son", UVM_MEDIUM);
    $cast(con_anh_thinh, thinh.clone());

    `uvm_info("MUST READ", "The son of Thinh 's code and result: ", UVM_MEDIUM);
    con_anh_thinh.print(tb_printer);

    `uvm_info("MUST READ", "Phuong is suspicious, maybe he is cheating.", UVM_MEDIUM);
    phuong.copy(thinh);

    `uvm_info("MUST READ", "Phuong 's code and result: ", UVM_MEDIUM);
    phuong.print(tb_printer);
    
    `uvm_info("MUST READ", "Thay Trang will compare code & result of these two students.", UVM_MEDIUM);

    if ( thinh.compare(phuong, thay_trang) ) begin 
      `uvm_info("MUST READ", "Codes & results look same, somebody might have cheated.", UVM_MEDIUM);
    end else begin
      `uvm_fatal("MUST READ", "Nobody cheated.");
    end

  endtask: run_phase

endclass : my_test
