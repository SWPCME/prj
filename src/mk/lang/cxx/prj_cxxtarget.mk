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
prj_cxx_prepare: prj_opt_prepare
	if [ ! -d $(OBJ_DIR) ]; then $(MKDIR) $(OBJ_DIR); fi
#
# \brief C/CXX target.
#
$(OBJ_DIR)/%.$(OBJ_EXT): ${PRJ_C_SRC_DIR}/%.${PRJ_C_SUFFIX}
	$(CC) $(PRJ_INCLUDE_DIR) $(C_FLAG) -c $< -o $@

$(OBJ_DIR)/%.$(OBJ_EXT): ${PRJ_C_SRC_DIR}/%.$(PRJ_CXX_SUFFIX)
	$(CXX) $(PRJ_INCLUDE_DIR) $(CXX_FLAG) -c $< -o $@

#
# \brief Object.
#
create_obj: prj_cxx_prepare $(OBJ_FILE)

clean_obj: 
	$(RM) -f $(OBJ_FILE)

copy_obj: create_obj
	($(CP) $(OBJ_DIR)/*.$(OBJ_EXT) $(PRJ_C_INSTALL_O_DIR))

#
# \brief Library.
#
# Create library.
ifeq ($(PRJ_LIB_A_SO_ON),yes)
create_lib: create_tmp lib_a lib_so
endif
ifeq ($(PRJ_LIB_A_ON),yes)
create_lib: create_tmp lib_a
endif
ifeq ($(PRJ_LIB_SO_ON),yes)
create_lib: create_tmp lib_so
endif
ifeq ($(PRJ_LIB_OFF),yes)
create_lib:
endif

lib_a: create_obj
	$(AR) r $(PRJ_LIB_A) $(OBJ_DIR)/*.$(OBJ_EXT)
	$(RANLIB) $(PRJ_LIB_A_ABS)

lib_so: create_obj
	$(LD) $(LD_FLAG) $(OBJ_DIR)/*.$(OBJ_EXT) $(PRJ_EXTRA_LIB_DIR) $(PRJ_EXTRA_LIB_SO) \
		  -o $(PRJ_LIB_SO_ABS)

# Clean library.
clean_lib: clean_obj
	$(RM) -f $(PRJ_LIB_A)
	$(RM) -f $(PRJ_LIB_SO)

# Install library.
ifeq ($(PRJ_LIB_A_SO_ON),yes)
install_lib: install_a_lib install_so_lib
endif
ifeq ($(PRJ_LIB_A_ON),yes)
install_lib: install_a_lib
endif
ifeq ($(PRJ_LIB_SO_ON),yes)
install_lib: install_so_lib
endif
ifeq ($(PRJ_LIB_OFF),yes)
install_lib: copy_obj
endif

install_a_lib: create_lib
	($(CP) $(PRJ_LIB_A_ABS) $(PRJ_C_INSTALL_O_DIR))

install_so_lib: create_lib
	($(CP) $(PRJ_LIB_SO_ABS) $(PRJ_C_INSTALL_O_DIR))

#
# \brief Header file.
#
PRJ_MAIN_INSTALL_H_DIR = $(PRJ_INSTALL_INCLUDE_DIR)/$(PRJ_NAME)
PRJ_SUB_INSTALL_H_DIR = $(PRJ_MAIN_INSTALL_H_DIR)/$(LAYER)
install_header:
	$(shell if [ ! -d $(PRJ_MAIN_INSTALL_H_DIR) ]; then $(MKDIR) $(PRJ_MAIN_INSTALL_H_DIR); fi)
	$(shell if [ ! -d $(PRJ_SUB_INSTALL_H_DIR) ]; then $(MKDIR) -p $(PRJ_SUB_INSTALL_H_DIR); fi)
	$(shell for file in $(PRJ_C_HEADER_FILE); do $(CP) $$file $(PRJ_SUB_INSTALL_H_DIR); done)

#
# \brief Binary file.
#
# ifeq ($(PRJ_TARGET_OS), $(PRJ_ARCH_X86_64_PC_LINUX_GNU))
# bin_file: create_tmp create_obj target_dir_install
# 	($(CD) $(PRJ_C_INSTALL_O_DIR); \
# 		$(CXX) $(CXX_FLAG) $(OBJ_DIR)/*.$(OBJ_EXT) \
# 		-o $(BIN_FILE) -L$(PRJ_LIB_DIR) $(IMPORT_LIB_A) $(IMPORT_LIB_SO))
# else
bin_file: create_tmp create_obj target_dir_install
	($(CD) $(PRJ_C_INSTALL_O_DIR); \
		$(CXX) $(CXX_FLAG) $(OBJ_DIR)/*.$(OBJ_EXT) \
		-o $(BIN_FILE) $(PRJ_EXTRA_LIB_DIR) $(PRJ_EXTRA_LIB_SO))
# endif
