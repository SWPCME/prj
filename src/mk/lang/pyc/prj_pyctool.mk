################################################################################
# $Id: prj_asmtool.mk 2018-01 $
#
# Project:  Prj.
# Purpose:  Pyc (Python compiler and iterpreter collection) tool.
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

# \brief Command.
PRJ_PYC_BIN_DIR = /home/swpcme/.local/bin
PRJ_PYC_P = $(PRJ_PYC_BIN_DIR)/python
PRJ_PYC_C = $(PRJ_PYC_BIN_DIR)/cython

# \brief Flag.
PRJ_PYC_C_FLAG = --embed
