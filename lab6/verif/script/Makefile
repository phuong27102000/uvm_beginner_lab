# ==================================================
# Filename: Makefile 
# Date    : 2022-09-24
# Author  : Nguyen Ha Nhat Phuong
# Contact : phuong2710@gmail.com
# ==================================================

# DIRs & FILEs
LOG_DIR=$(WORK_DIR)/sim_result
WF_FILE=dump.vcd
SV_DIR=$(WORK_DIR)/verif/sv
IF_DIR=$(WORK_DIR)/verif/interface

# UVM
UVM_OPT=-ntb_opts uvm-1.2
UVM_TEST=+UVM_TESTNAME=my_test 
UVM_VBST=+UVM_VERBOSITY=UVM_HIGH

# MORE OPTIONS
PLUSARG=+LOOP=30
INC_DIR=+incdir+$(SV_DIR)+incdir+$(IF_DIR)
# FSDB=-kdb -lca +fsdbfile+$(WF_FILE)
DEBUG=-debug_access+all 

all: build sim report
	@printf "Done !!!\nDate: $$(date +'%Y/%m/%d')\nTime: $$(date +'%H:%M:%S')\n"

build:
	vcs -sverilog -f ben.list $(INC_DIR) $(UVM_OPT) +plusarg_save $(DEBUG) | tee $(LOG_DIR)/vcs.log

sim:
	./simv $(UVM_TEST) $(UVM_VBST) $(PLUSARG) | tee $(LOG_DIR)/sim.log

report:
	@echo "=================================================="
	@printf "=================="
	@awk "/UVM_ERROR/{check++} /UVM_FATAL/{check++} END{if(check<=7) {printf \" TEST PASSED \";} else {printf \" TEST FAILED \" ;} }" $(LOG_DIR)/sim.log
	@echo "==================="
	@echo "=================================================="

wave:
	./simv -gui & 
clean:
	rm simv $(LOG_DIR)/* simv.daidir/.vcs.timestamp $(WF_FILE)

2clean:
	rm -r simv* $(LOG_DIR)/* csrc ucli.key vc_hdrs.h tr_db.log $(WF_FILE)  
