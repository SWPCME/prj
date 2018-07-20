################################################################################
# $Id: prj_amgctl.mk 2018-06 $
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
prj_amg_gen_file: prj_amg_prepare
	$(PRJ_AMG) $(PRJ_AMG_FLAG) $(PRJ_AMG_FILE_IMPL);
	$(MV) $(PRJ_AMG_OUT_TMP) $(PRJ_AMG_OBJ_FILE_NEW);
	if [ -f $(PRJ_AMG_OUT_FILE) ]; then \
		$(RSYNC) -a $(PRJ_AMG_OUT_FILE) $(PRJ_AMG_OBJ_FILE_OLD); \
		$(PRJ_DIFFU_DIFF) --new-group-format='%>' \
		${PRJ_AMG_OBJ_FILE_OLD} ${PRJ_AMG_OBJ_FILE_NEW} \
		> $(PRJ_AMG_OBJ_FILE_MIX); \
		echo ""; \
	fi

prj_amg_gen: prj_amg_gen_file
	if [ -f $(PRJ_AMG_OUT_FILE) ]; then \
		if [ ! -z "$(shell echo `$(PRJ_DIFFU_CMP) -b $(PRJ_AMG_OBJ_FILE_MIX) \
		$(PRJ_AMG_OBJ_FILE_OLD)`)" ]; then \
			$(RSYNC) -a $(PRJ_AMG_OBJ_FILE_MIX) $(PRJ_AMG_OUT_FILE); \
		fi \
	else \
		$(RSYNC) -a $(PRJ_AMG_OBJ_FILE_NEW) $(PRJ_AMG_OUT_FILE); \
	fi

# clean up
ifeq ($(PRJ_AMG_LOCK), no)
prj_amg_clean:
	$(CD) $(PRJ_AMG_DST_DIR); $(RM) $(PRJ_AMG_OUT_FILE)
else
prj_amg_clean:
	echo $(PRJ_AMG_LOCK_ERROR)
endif
