################################################################################
# $Id: prj_amgctl.mk 2018-01 $
#
# Project:  Prj.
# Purpose:  Amg target.
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
prj_amg_prepare: prj_opt_prepare
	if [ ! -d $(PRJ_AMG_OBJ_DIR) ]; then $(MKDIR) $(PRJ_AMG_OBJ_DIR); fi

# generate
ifeq ($(PRJ_AMG_LOCK), no)
prj_amg_gen_file:
	$(CD) $(PRJ_AMG_DST_DIR); $(PRJ_AMG) $(PRJ_AMG_FLAG) $(PRJ_AMG_FILE_IMPL)
else
prj_amg_gen_file:
	$(CD) $(PRJ_AMG_DST_DIR); if [ ! -f $(PRJ_AMG_OUT_FILE) ]; \
	then $(PRJ_AMG) $(PRJ_AMG_FLAG) $(PRJ_AMG_FILE_IMPL); \
	else echo $(PRJ_AMG_LOCK_ERROR); fi
endif
prj_amg_gen: prj_amg_gen_file
	if [ ! -f $(PRJ_AMG_OUT_FILE) ]; \
	then $(MV) $(PRJ_AMG_OUT) $(PRJ_AMG_OUT_DIR); \
	else echo $(PRJ_AMG_LOCK_ERROR); fi

# clean up
ifeq ($(PRJ_AMG_LOCK), no)
prj_amg_clean:
	$(CD) $(PRJ_AMG_DST_DIR); $(RM) $(PRJ_AMG_OUT_FILE)
else
prj_amg_clean:
	echo $(PRJ_AMG_LOCK_ERROR)
endif
