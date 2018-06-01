################################################################################
# $Id: prj_patchtarget.mk 2018-05 $
#
# Project:  Prj.
# Purpose:  Patch target.
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

# Prepare.
prj_patch_prepare: prj_opt_prepare
	if [ ! -d $(PRJ_PATCH_BUILD_DIR) ]; \
	then $(MKDIR) $(PRJ_PATCH_BUILD_DIR); fi

prj_patch_create: prj_patch_prepare
	$(shell $(CD) $(PRJ_PATCH_WORK_DIR); $(PRJ_DIFFU_DIFF) $(PRJ_PATCH_DIFF_FLAG) \
	$(PRJ_PATCH_FILE_OLD) $(PRJ_PATCH_FILE_NEW) > $(PRJ_PATCH_FILE_TMP))

prj_patch_install: prj_patch_create
	$(RSYNC) -a $(PRJ_PATCH_FILE_TMP) $(PRJ_PATCH_FILE)

prj_patch_apply: prj_patch_prepare
	$(RSYNC) -a $(PRJ_PATCH_FILE) $(PRJ_PATCH_FILE_TMP)
	$(CD) $(PRJ_PATCH_OBJ_DIR); $(PRJ_PATCH) $(PRJ_PATCH_FLAG) \
	< $(PRJ_PATCH_FILE_TMP)
