/* ==================================================
 * Filename: user_comp.svh 
 * Date    : 2022-09-24
 * Author  : Nguyen Ha Nhat Phuong
 * Contact : phuong2710@gmail.com
 * ==================================================
 */

class somebody extends uvm_object;
  // data or class properties
  string code;
  int result;

  `uvm_object_utils(somebody)
  // initialization
  function new(string name="somebody");
    super.new(name);
  endfunction : new

  virtual function void do_print(uvm_printer printer);
    super.do_print(printer);
    printer.print_string("code", code);
    printer.print_field_int("result", result, $bits(result), UVM_DEC);
  endfunction

  /* Declare function copy that phuong (somebody) 
  * could copy code and result from thinh (somebody)
   */
  virtual function void do_copy(uvm_object obj);
    super.do_copy(obj);
    /* HINT:
     * Why this function input is uvm_object but not somebody ? 
     * Because the function do_copy in uvm_object (base class)
     * is just like that, and we need to remain it in 
     * uvm_object 's child class.
     * If phuong copies from thinh:
     * Firstly, obj (base class) will point to thinh (subclass).
     * Secondly, you need to declare a somebody object that
     * points to obj. It must be declared above
     * super.do_copy(obj).
     * Finally, you could alternatively copy all the properties
     * of the somebody object.
     */
  endfunction: do_copy
endclass : somebody
