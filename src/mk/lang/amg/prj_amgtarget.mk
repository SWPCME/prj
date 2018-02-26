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

#
# \brief create asm obj.
#
$(PRJ_ASM_OBJ_DIR)/%.$(PRJ_ASM_OBJ_EXT): %.${PRJ_ASM_SUFFIX}
	$(PRJ_ASM) $(PRJ_ASM_FLAG) $< -o $@

prj_create_asm_obj: $(PRJ_ASM_OBJ_FILE)

