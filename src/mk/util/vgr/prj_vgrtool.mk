# -*- mode: makefile -*-
################################################################################
# $Id: prj_vgrtool.mk 2018-07 $
#
# Project:  Prj.
# Purpose:  Valgrind tool.
# Author:   Weiwei Huang, 898687324@qq.com
#
################################################################################
# Copyright (c) 2018-07 ~ 2018 Weiwei Huang
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

PRJ_VGR_LD_LIBRARY_PATH = LD_LIBRARY_PATH=$(LD_LIBRARY_PATH):$(PRJ_VGR_LD_LIBRARY_PATH_EXTRA)
PRJ_VGR_LIBC_LD_SO = $(PRJ_VGR_LIBC_LIB_PATH)/ld-linux-x86-64.so.2

PRJ_VGR_ENV = $(PRJ_VGR_LD_LIBRARY_PATH)
PRJ_VGR_VALGRIND = $(PRJ_VGR_ENV) $(PRJ_VGR_BIN_PATH)/valgrind
PRJ_VGR_VALGRIND_ARG = $(PRJ_VGR_LIBC_LD_SO)
