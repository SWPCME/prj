################################################################################
# $Id: prj_cxxtool.mk 2017-08 $
#
# Project:  Prj.
# Purpose: 	Cxx tool.
# Author:   Weiwei Huang, 898687324@qq.com
#
################################################################################
# Copyright (c) 2016-08 ~ 2017 Weiwei Huang
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
# \brief C/CXX tools.
# CC: C compile.
# CXX: Cxx compile.
# LD: Linker.
# AR: Create, modify, and extract from archives.
# RANLIB: Generate index to archive.
#
ifeq ($(PRJ_CCC_ENABLE), yes)
PRJ_C_CXX_ENV += $(PRJ_CCC)
endif
ifneq ($(DISTCC_HOSTS),)
ifeq ($(PRJ_CCC_ENABLE), yes)
PRJ_C_CXX_ENV += $(PRJ_DCC)
endif
endif

PRJ_CXX_BIN_PREFIX = 
ifneq ($(PRJ_TARGET_OS),)
# ifneq ($(PRJ_TARGET_OS), $(PRJ_OS))
PRJ_CXX_BIN_PREFIX = $(PRJ_TARGET_OS)-
# endif
endif

CC = $(PRJ_C_CXX_ENV) $(PRJ_CXX_BIN_PREFIX)gcc
CXX = $(PRJ_C_CXX_ENV) ${PRJ_CXX_BIN_PREFIX}g++
# The LD must be g++ not gcc, if the source is cxx.
LD = $(PRJ_CXX_BIN_PREFIX)g++
AR = $(PRJ_CXX_BIN_PREFIX)ar
RANLIB = $(PRJ_CXX_BIN_PREFIX)ranlib

#
# \brief Flag of c/cxx.
# Compile flags.
# Diff:-fPIC, -fpic and -fPIE.
# C_CXX_FLAG = -fpic -Wall
# PRJ_C_CXX_MEM = -fsanitize=address
PRJ_C_CXX_MEM = 
PRJ_C_CXX_DEFINE = -D NAME=$(PRJ_NAME_UP) $(PRJ_OPT_MODULE_DEFINE) $(PRJ_DEBUG_MODE)
C_CXX_FLAG = -fpic -Wall -Wextra $(PRJ_C_CXX_MEM) $(PRJ_C_CXX_EXTRA_FLAG) $(PRJ_C_CXX_DEFINE)
C_STD = -std=gnu99
C_FLAG = $(C_CXX_FLAG) $(C_STD) $(PRJ_C_EXTRA_FLAG)
CXX_STD = -std=c++11
CXX_WARNING = -Wno-delete-incomplete
CXX_FLAG = $(C_CXX_FLAG) -fpermissive $(CXX_STD) $(CXX_WARNING) $(PRJ_CXX_EXTRA_FLAG)
ifeq ($(PRJ_DEBUG), yes)
PRJ_DEBUG_MODE = -D DEBUG_MODE
C_FLAG += -g
CXX_FLAG += -g
endif
ifeq ($(PRJ_TARGET_OS), $(PRJ_ARCH_X86_64_PC_LINUX_GNU))
C_FLAG += -D OS_UNIX
CXX_FLAG += -D OS_UNIX
endif
ifeq ($(PRJ_TARGET_OS), cygwin)
C_FLAG += -D OS_CYGWIN
CXX_FLAG += -D OS_CYGWIN
endif
ifeq ($(PRJ_TARGET_OS), $(PRJ_ARCH_X86_64_W64_MINGW32))
C_FLAG += -D OS_WINDOWS
CXX_FLAG += -D OS_WINDOWS
endif
INCLUDE_PATH_FLAG = -I
PRJ_LIB_PATH_FLAG = -L
PRJ_LD_FLAG = -fpic $(PRJ_LD_EXTRA_FLAG)
ifneq ($(PRJ_C_CXX_LINKER_FILE),)
PRJ_LD_FLAG += -T $(PRJ_C_CXX_LINKER_FILE)
endif
# ifneq ($(PRJ_LIB_SO_ABS),)
# PRJ_LD_FLAG += -shared
# endif
PRJ_C_CXX_LD_SO_FLAG = $(PRJ_LD_FLAG) -shared
PRJ_C_CXX_STATIC_FLAG = -Wl,-Bstatic
PRJ_C_CXX_DYNAMIC_FLAG = -Wl,-Bdynamic
