################################################################################
# $Id: prj_asmctl.mk 2018-01 $
#
# Project:  Prj.
# Purpose:  Pyc (Python compiler and iterpreter collection) target.
# Author:   Weiwei Huang, 898687324@qq.com
#
################################################################################
# Copyright (c) 2018-01 ~ 2018 Weiwei Huang
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
prj_pyc_prepare: prj_opt_prepare
	if [ ! -d $(PRJ_PYC_OBJ_DIR) ]; then $(MKDIR) $(PRJ_PYC_OBJ_DIR); fi

#
# \brief create asm obj.
#
# $(PRJ_PYC_OBJ_DIR)/%.$(PRJ_PYC_OBJ_EXT): $(PRJ_PYC_SRC_DIR)/%.$(PRJ_PYC_SUFFIX)
# 	$(PRJ_PYC_C) $(PRJ_PYC_C_FLAG) $< -o $@

# prj_create_pyc_obj: $(PRJ_PYC_OBJ_FILE)

$(PRJ_PYC_OBJ_DIR)/$(PRJ_NAME).cxx: 
	$(PRJ_PYC_C) $(PRJ_PYC_OBJ_FILE) $(PRJ_PYC_HEADER_FILE) -o $(PRJ_PYC_OBJ_DIR)/$(PRJ_NAME).cxx

prj_create_pyc_obj: $(PRJ_PYC_OBJ_DIR)/$(PRJ_NAME).cxx

prj_create_pyc_lib: prj_pyc_prepare prj_create_pyc_obj create_lib
# $(CC) -shared -pthread -fPIC -fwrapv -O2 -Wall -fno-strict-aliasing \
# -I$(PRJ_PYC_BIN_DIR)/$(PRJ_PYC_P_VER) -o test.so test.c

prj_create_pyc_setup:
	python $(PRJ_PYC_SETUP_FILE) build_ext --inplace

prj_install_pyc_lib: prj_create_pyc_lib install_lib install_header
