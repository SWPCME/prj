################################################################################
# $Id: prj_osctl.mk 2018-01 $
#
# Project:  Prj.
# Purpose:  Os target.
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

# Prepare.
prj_os_prepare:
	if [ ! -d $(PRJ_OS_BOOT_DIR) ]; then $(MKDIR) $(PRJ_OS_BOOT_DIR); fi

# \brief Make image.
prj_os_image:
	$(DD) if=$(PRJ_OS_DIR)/$(PRJ_OS_NAME).iso of=$(PRJ_OS_DISK) && $(SYNC)

prj_os_kernel:
	$(CXX) -T $(PRJ_OS_LINKER_FILE) -o $(PRJ_OS_NAME).bin $(CXX_FLAG) $(PRJ_OS_OBJ_DIR)/*.$(OBJ_EXT) -lgcc

prj_os_run:
	$(PRJ_QEMU) -kernel $(PRJ_INSTALL_BIN_DIR)/$(PRJ_OS_NAME).bin
