################################################################################
# $Id: prj_binutarget.mk 2018-08 $
#
# Project:  Prj.
# Purpose:  Binary utility target.
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

# split debug info
$(PRJ_BINU_LIB_DIR)/%_$(PRJ_LIB_SO_SUFFIX).$(PRJ_BINU_DBG_SUFFIX): $(PRJ_BINU_LIB_DIR)/%.$(PRJ_LIB_SO_SUFFIX)
	$(PRJ_BINU_OBJCOPY) --only-keep-debug $< $@
	$(PRJ_BINU_OBJCOPY) --strip-debug $<
	$(PRJ_BINU_OBJCOPY) --remove-section=.gnu_debuglink $<
	$(PRJ_BINU_OBJCOPY) --add-gnu-debuglink=$@ $<

$(PRJ_BINU_LIB_DIR)/%_$(PRJ_LIB_A_SUFFIX).$(PRJ_BINU_DBG_SUFFIX): $(PRJ_BINU_LIB_DIR)/%.$(PRJ_LIB_A_SUFFIX)
	$(PRJ_BINU_OBJCOPY) --only-keep-debug $< $@
	$(PRJ_BINU_OBJCOPY) --strip-debug $<
	$(PRJ_BINU_OBJCOPY) --remove-section=.gnu_debuglink $<
	$(PRJ_BINU_OBJCOPY) --add-gnu-debuglink=$@ $<

prj_binu_dbg_split:
	$(PRJ_BINU_OBJCOPY) --only-keep-debug $(PRJ_BINU_DBG_BIN) \
	    $(PRJ_BINU_DBG_FILE)
	$(PRJ_BINU_OBJCOPY) --strip-debug $(PRJ_BINU_DBG_BIN) \
	    $(PRJ_BINU_DBG_BIN_NONE)

prj_binu_dbg_link_add: prj_binu_dbg_split
	$(PRJ_BINU_OBJCOPY) --add-gnu-debuglink=$(PRJ_BINU_DBG_FILE) \
	    $(PRJ_BINU_DBG_BIN_NONE)

prj_binu_dbg_link_remove:
	$(PRJ_BINU_OBJCOPY) --remove-section=.gnu_debuglink \
	    $(PRJ_BINU_DBG_BIN_NONE)
