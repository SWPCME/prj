################################################################################
# $Id: prj_cxxtarget.mk 2017-09 $
#
# Project:  Prj.
# Purpose:  Cxx target.
# Author:   Weiwei Huang, 898687324@qq.com
#
################################################################################
# Copyright (c) 2017-09 ~ 2017 Weiwei Huang
#
# This program is free software; you can redistribute it and/or modify it under 
# the terms of the GNU General Public License as published by the Free Software 
# Foundation, either version 3 of the License, or (at your option) any later 
# version.
#
# This program is distributed in the hope that it will be useful, but WITHOUT 
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS 
# FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more 
# details.
#
# You should have received a copy of the GNU General Public License along with 
# this program.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

#
# \brief prepare
#
.PHONY: prj_cxx_prepare
prj_cxx_prepare: prj_opt_prepare
	if [ ! -d $(PRJ_CXX_OBJ_DIR) ]; then $(MKDIR) -pv $(PRJ_CXX_OBJ_DIR); fi

#
# \brief C/CXX target.
#
$(PRJ_CXX_OBJ_DIR)/%.$(PRJ_CXX_OBJ_EXT): ${PRJ_C_SRC_DIR}/%.${PRJ_ASM_SUFFIX}
	$(CC) $(PRJ_INCLUDE_DIR) $(PRJ_EXTRA_INCLUDE_DIR) $(C_FLAG) -c $< -o $@

$(PRJ_CXX_OBJ_DIR)/%.$(PRJ_C_OBJ_EXT): ${PRJ_C_SRC_DIR}/%.${PRJ_C_SUFFIX}
	$(CC) $(PRJ_INCLUDE_DIR) $(PRJ_EXTRA_INCLUDE_DIR) $(C_FLAG) -c $< -o $@

$(PRJ_CXX_OBJ_DIR)/%.$(PRJ_CXX_OBJ_EXT): ${PRJ_C_SRC_DIR}/%.$(PRJ_CXX_SUFFIX)
	$(CXX) $(PRJ_INCLUDE_DIR) $(PRJ_EXTRA_INCLUDE_DIR) $(CXX_FLAG) -c $< -o $@

#
# \brief Object.
#
create_obj: prj_create_obj
prj_create_obj: target_dir_default
prj_create_obj: prj_cxx_prepare
prj_create_obj: $(OBJ_FILE)
target_dir_default: prj_cxx_prepare
$(OBJ_FILE): prj_cxx_prepare

clean_obj: prj_clean_obj
prj_clean_obj:
	$(RM) -f $(OBJ_FILE)

#
# \brief Library.
#
# prepare to create library.
# prj_create_lib_prepare:
#$(LN) -s 

# Create library.
create_lib: prj_cxx_create_lib
prj_cxx_create_lib:
ifeq ($(PRJ_C_CXX_LIB_FLAG_A),yes)
prj_cxx_create_lib: lib_a
endif
ifeq ($(PRJ_C_CXX_LIB_FLAG_SO),yes)
prj_cxx_create_lib: lib_so
endif

lib_a: prj_create_obj
	$(AR) r $(PRJ_LIB_A_ABS) $(PRJ_CXX_OBJ_DIR)/*.$(PRJ_CXX_OBJ_EXT)
	$(RANLIB) $(PRJ_LIB_A_ABS)

lib_so: prj_create_obj
	$(LD) $(PRJ_C_CXX_LD_SO_FLAG) $(PRJ_CXX_OBJ_DIR)/*.$(PRJ_CXX_OBJ_EXT) $(PRJ_EXTRA_LIB_DIR) \
		$(PRJ_C_CXX_LIB_A_EXTRA_NAME) $(PRJ_C_CXX_LIB_SO_EXTRA_NAME) \
		-o $(PRJ_LIB_SO_ABS)

# Clean library.
clean_lib: clean_obj
	$(RM) -f $(PRJ_LIB_A)
	$(RM) -f $(PRJ_LIB_SO)

install_lib: prj_cxx_install_lib
ifeq ($(PRJ_C_CXX_LIB_FLAG_A),yes)
prj_cxx_install_lib: install_a_lib
endif
ifeq ($(PRJ_C_CXX_LIB_FLAG_SO),yes)
prj_cxx_install_lib: install_so_lib
endif

install_a_lib: prj_cxx_create_lib
	($(RSYNC) -a $(PRJ_LIB_A_ABS) $(PRJ_INSTALL_LIB_DIR))

install_so_lib: prj_cxx_create_lib
	($(RSYNC) -a $(PRJ_LIB_SO_ABS) $(PRJ_INSTALL_LIB_DIR))

#
# \brief Header file.
#
PRJ_MAIN_INSTALL_H_DIR = $(PRJ_INSTALL_INCLUDE_DIR)/$(PRJ_NAME)
PRJ_SUB_INSTALL_H_DIR = $(PRJ_MAIN_INSTALL_H_DIR)/$(LAYER)
install_header:
	$(shell if [ ! -d $(PRJ_MAIN_INSTALL_H_DIR) ]; then $(MKDIR) $(PRJ_MAIN_INSTALL_H_DIR); fi)
	$(shell if [ ! -d $(PRJ_SUB_INSTALL_H_DIR) ]; then $(MKDIR) -p $(PRJ_SUB_INSTALL_H_DIR); fi)
	$(shell for file in $(PRJ_C_HEADER_FILE); do $(RSYNC) -a $$file $(PRJ_SUB_INSTALL_H_DIR); done)

#
# \brief Binary file.
#
bin_file: prj_create_obj target_dir_install
	($(CD) $(PRJ_INSTALL_BIN_DIR); \
		$(LD) $(PRJ_LD_FLAG) $(PRJ_CXX_OBJ_DIR)/*.$(PRJ_CXX_OBJ_EXT) \
		-o $(PRJ_CXX_BIN_FILE) $(PRJ_EXTRA_LIB_DIR) \
		$(PRJ_C_CXX_LIB_A_EXTRA_NAME) $(PRJ_C_CXX_LIB_SO_EXTRA_NAME))
#		$(PRJ_EXTRA_LIB_SO) 
