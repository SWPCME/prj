################################################################################
# $Id: prj_cmakectl.mk 2018-01 $
#
# Project:  Prj.
# Purpose:  Cmake define.
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

PRJ_CMAKE_BUILDER = cmake

ifeq ($(PRJ_CMAKE_CFG_DIR),)
PRJ_CMAKE_CFG_DIR = $(PRJ_MK_DIR)/util/cmake/cfg
endif

ifneq ($(PRJ_TARGET_OS),)
ifneq ($(PRJ_TARGET_OS), $(PRJ_OS))
PRJ_CMAKE_CROSS_FLAG = -DCMAKE_TOOLCHAIN_FILE=$(PRJ_CMAKE_CFG_DIR)/$(PRJ_TARGET_OS).cmake
endif
endif

ifneq ($(PRJ_CMAKE_FIND_ROOT_PATH),)
PRJ_CMAKE_EXTRA_FLAG += -DCMAKE_FIND_ROOT_PATH=$(PRJ_CMAKE_FIND_ROOT_PATH)
endif

PRJ_CMAKE_FLAG= $(PRJ_CMAKE_CROSS_FLAG) ${PRJ_CMAKE_EXTRA_FLAG} \
    -DCMAKE_INSTALL_PREFIX=$(PRJ_INSTALL_DIR) \
    -B$(PRJ_BUILD_DIR) -H$(PRJ_WORK_DIR)

# debug toggle
PRJ_CMAKE_DEBUG = no
ifeq ($(PRJ_DEBUG),yes)
ifeq ($(PRJ_BUILDER),$(PRJ_CMAKE_BUILDER))
PRJ_CMAKE_DEBUG = yes
endif
endif

# fetch library for debug
ifeq ($(PRJ_CMAKE_DEBUG),yes)
# static library
PRJ_CMAKE_DBG_LIB_A = $(wildcard $(PRJ_INSTALL_LIB_DIR)/*.a)
PRJ_CMAKE_DBG_LIB_A_FILE = $(PRJ_CMAKE_DBG_LIB_A:.$(PRJ_LIB_A_SUFFIX)=_a.dbg)
# share library
PRJ_CMAKE_DBG_LIB_SO = $(wildcard $(PRJ_INSTALL_LIB_DIR)/*.so)
PRJ_CMAKE_DBG_LIB_SO_FILE = $(PRJ_CMAKE_DBG_LIB_SO:.$(PRJ_LIB_SO_SUFFIX)=_so.dbg)
endif
