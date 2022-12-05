# ==================================================
# Filename: Makefile 
# Date    : 2022-09-24
# Author  : Nguyen Ha Nhat Phuong
# Contact : phuong2710@gmail.com
# ==================================================

# DIRs & FILEs
LOG_DIR=$(WORK_DIR)/sim_result
WF_FILE=dump.vcd

# UVM
UVM_OPT=-ntb_opts uvm-1.2
UVM_TEST_DECLARED=+UVM_TESTNAME=my_test 

all: build sim report
	@printf "Done !!!\nDate: $$(date +'%Y/%m/%d')\nTime: $$(date +'%H:%M:%S')\n"

build:
	vcs -sverilog -f ben.list | tee $(LOG_DIR)/vcs.log

sim:
	./simv | tee $(LOG_DIR)/sim.log

report:
	@echo "=================================================="
	@printf "=================="
	@awk "/ERROR/{check=1} END{if(check==0) {printf \" TEST PASSED \";} else {printf \" TEST FAILED \";} }" $(LOG_DIR)/sim.log
	@echo "==================="
	@echo "=================================================="

clean:
	rm simv $(LOG_DIR)/* simv.daidir/.vcs.timestamp $(WF_FILE)

2clean:
	rm -r simv* $(LOG_DIR)/* csrc ucli.key vc_hdrs.h $(WF_FILE)   
