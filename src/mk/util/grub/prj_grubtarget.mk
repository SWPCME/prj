################################################################################
# $Id: prj_grubctl.mk 2018-01 $
#
# Project:  Prj.
# Purpose:  Grub target.
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
prj_grub_prepare: prj_os_prepare
	if [ ! -d $(PRJ_OS_GRUB_DIR) ]; then $(MKDIR) $(PRJ_OS_GRUB_DIR); fi

# Check grub file.
prj_grub_check_file:
	$(if $(PRJ_GRUB_FILE) $(PRJ_GRUB_FILE_FLAG) $(PRJ_GRUB_RESCUE_IMAGE_BIN) \
	$(PRJ_GRUB_RESCUE_IMAGE_SOURCE); then \
		echo Multiboot confirmed! \
	else \
		echo The file is not multiboot! \
	fi)

# Make grub rescue image.
prj_grub_make_rescue_image:
	$(PRJ_GRUB_MKRESCUE) $(PRJ_GRUB_MKRESCUE_FLAG) $(PRJ_GRUB_RESCUE_IMAGE_BIN)
