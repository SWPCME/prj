[+ AutoGen5 template mk -*- mode: makefile -*- +]
[+ Include "../../../../../std/mk/mk_licence.tpl" +]

#
# Options.
#
# Directory.
SRC_DIR = [+ src_dir +]
DOC_SRC_DIR = .
# Search.
INCLUDE_DIR = -I$(CURRENT_DIR)

# Include.
OPT_LIST = $(SRC_DIR)/opt.lst
include $(OPT_LIST)

# Target.
default: amg_gen

amg_gen: prj_amg_gen

clean: prj_amg_clean
