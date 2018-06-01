################################################################################
# $Id: prj_opttarget.mk 2017-09 $
#
# Project:  Prj.
# Purpose:  Option target.
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
# \brief Defalut target
#
default:

#
# \brief Prepare.
#
ifneq ($(PRJ_GIT_VER_NAME),)
ifeq ($(PRJ_VCS), git)
prj_opt_version: prj_git_checkout
endif
else
prj_opt_version:
endif
prj_opt_prepare: prj_opt_version
	if [ ! -d $(PRJ_BUILD_DIR) ]; then $(MKDIR) -pv $(PRJ_BUILD_DIR); fi
	if [ ! -d $(PRJ_INSTALL_DIR) ]; then $(MKDIR) -pv $(PRJ_INSTALL_DIR); fi
	if [ ! -d $(PRJ_INSTALL_BIN_DIR) ]; then $(MKDIR) $(PRJ_INSTALL_BIN_DIR); fi
	if [ ! -d $(PRJ_INSTALL_INCLUDE_DIR) ]; then $(MKDIR) $(PRJ_INSTALL_INCLUDE_DIR); fi
	if [ ! -d $(PRJ_INSTALL_LIB_DIR) ]; then $(MKDIR) $(PRJ_INSTALL_LIB_DIR); fi
	if [ ! -d $(PRJ_INSTALL_SHARE_DIR) ]; then $(MKDIR) $(PRJ_INSTALL_SHARE_DIR); fi

#
# \brief Tmp directory.
#
# Create directory
# create_tmp:
#$(shell if [ ! -d $(PRJ_TMP_DIR) ]; then $(MKDIR) $(PRJ_TMP_DIR); fi)

clean_tmp: clean_obj
	$(RMDIR) $(PRJ_TMP_DIR)

#
# \brief Install file.
#
PRJ_MAIN_INSTALL_FILE_DIR = $(PRJ_INSTALL_FILE_DIR)/$(PRJ_NAME)
PRJ_SUB_INSTALL_FILE_DIR = $(PRJ_MAIN_INSTALL_FILE_DIR)/$(PRJ_LAYER)
prj_install_file: 
	if [ ! -d $(PRJ_MAIN_INSTALL_FILE_DIR) ]; then $(MKDIR) $(PRJ_MAIN_INSTALL_FILE_DIR); fi
	if [ ! -d $(PRJ_SUB_INSTALL_FILE_DIR) ]; then $(MKDIR) -p $(PRJ_SUB_INSTALL_FILE_DIR); fi
	for file in $(PRJ_INSTALL_FILE); do $(RSYNC) -a $$file $(PRJ_SUB_INSTALL_FILE_DIR); done

#
# \brief Default rules for handling subdirectories.
#
target_dir_default: $(TARGET_DIR_DEFAULT)

target_dir_clean: $(TARGET_DIR_CLEAN)

target_dir_install: $(TARGET_DIR_INSTALL)

%_target_default:
	$(MAKE) -C $*

%_target_clean:
	$(MAKE) -C $* clean

%_target_install:
	$(MAKE) -C $* install
