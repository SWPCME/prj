################################################################################
# $Id: prj_patchctl.mk 2018-05 $
#
# Project:  Prj.
# Purpose:  Patch define.
# Author:   Weiwei Huang, 898687324@qq.com
#
################################################################################
# Copyright (c) 2018-05 ~ 2018 Weiwei Huang
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

PRJ_PATCH_DIFF_EXCLUDE_FILE_ALL = $(foreach name, \
	$(PRJ_PATCH_DIFF_EXCLUDE_FILE), $(addprefix -x , $(name)))
PRJ_PATCH_DIFF_FLAG = -u -r -a -N --no-dereference \
	$(PRJ_PATCH_DIFF_EXCLUDE_FILE_ALL)
PRJ_PATCH_FLAG = -p $(PRJ_PATCH_STRIP_NUM) -f -s
PRJ_PATCH_BUILD_DIR = $(PRJ_BUILD_DIR)/patch
PRJ_PATCH_FILE_TMP = $(PRJ_PATCH_BUILD_DIR)/$(PRJ_PATCH_FILE_NAME)
PRJ_PATCH_FILE = $(PRJ_PATCH_FILE_PATH)/$(PRJ_PATCH_FILE_NAME)
