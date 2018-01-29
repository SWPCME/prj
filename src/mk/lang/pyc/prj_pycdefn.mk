################################################################################
# $Id: prj_pycctl.mk 2018-01 $
#
# Project:  Prj.
# Purpose:  Pyc (Python compiler and iterpreter collection) definition.
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

PRJ_PYC_OBJ_EXT = o
PRJ_PYC_OBJ_NAME = $(PRJ_PYC_OBJ:.o=.$(OBJ_EXT))
PRJ_PYC_OBJ_FILE = $(foreach file, $(PRJ_PYC_OBJ_NAME), $(PRJ_PYC_OBJ_DIR)/$(file))

ifneq ($(PRJ_PYC_OBJ_NAME),)
PRJ_C_CXX_EXTRA_FLAG += $(PRJ_PYC_C_FLAG)
endif
