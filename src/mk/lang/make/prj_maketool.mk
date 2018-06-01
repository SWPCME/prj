################################################################################
# $Id: prj_maketool.mk 2017-08 $
#
# Project:  Prj.
# Purpose:  Make tool.
# Author:   Weiwei Huang, 898687324@qq.com
#
################################################################################
# Copyright (c) 2017-08 ~ 2017 Weiwei Huang
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
# \brief Make tools.
# Make: Utility to maintain groups of programs.
#
PRJ_MAKE_BIN = make
PRJ_MAKE = $(PRJ_MAKE_BIN) $(PRJ_MAKE_FLAG)
# ifeq (${PRJ_DCC_ENABLE}, yes)
# PRJ_MAKE = sh_pump.sh
# else
# PRJ_MAKE = make
# endif
