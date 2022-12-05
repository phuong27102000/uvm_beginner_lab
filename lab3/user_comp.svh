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

  /* Declare function that write out code and 
   * result of a somebody object.
   */
  virtual function void do_print(uvm_printer printer);
    super.do_print(printer);
    /* HINT: 
     * Use printer function. Check it out in $UVM_HOME/src/ 
     */
  endfunction

  /* Declare function copy that phuong (somebody) 
   * could copy code and result from thinh (somebody)
   */
  virtual function void do_copy(uvm_object obj);
    super.do_copy(obj);
    /* HINT: 
     * If phuong copies from thinh:
     * Firstly, obj (base class) will point to thinh (subclass).
     * Secondly, you need to declare a somebody object that
     * points to obj. It must be declared above
     * super.do_copy(obj).
     * Finally, you could alternatively copy all the properties
     * of the somebody object.
     */
  endfunction: do_copy

  /* Declare function copy that thay_trang (somebody) 
   * could compare code and result from between phuong 
   * (somebody) and thinh (somebody).
   */
  virtual function bit do_compare(uvm_object obj, uvm_comparer comparer=null);
    do_compare = super.do_compare(obj, comparer);
    /* HINT: 
     * Firsly, compare the everything from the base class 
     * uvm_object with super.do_compare.
     * Secondly, compare the properties of class somebody.
     * Finally, Bit-wise AND all the comparing result.
     * Never forget inheritance and polymorphism of class.
     */
  endfunction: do_compare
endclass : somebody
