################################################################################
# $Id: prj_cxxctl.mk 2017-09 $
#
# Project:  Prj.
# Purpose:  Cxx definition.
# Author:   Weiwei Huang, 898687324@qq.com
#
################################################################################
# Copyright (c) 2017-09 ~ 2017 Weiwei Huang
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
# \brief Cxx definition.
#

#
# \brief Module
#
PRJ_OPT_MODULE_DEFINE = $(foreach module, $(PRJ_OPT_MODULE_UP), -D $(PRJ_NAME_UP)_MODULE_$(module))

#
# \brief Extension.
#
OBJ_EXT = o

#
# \brief Install directory.
#
# INSTALL_L_DIR = $(PRJ_INSTALL_DIR)/$(PRJ_TARGET_OS)/lib
PRJ_C_INSTALL_O_DIR = $(PRJ_INSTALL_BIN_DIR)
# INSTALL_O_TO_SRC_DIR = ../../src

#
# \brief Generic library rules.
#
ifeq ($(PRJ_C_SRC_DIR),)
PRJ_C_SRC_DIR = .
endif
ifeq ($(OBJ_DIR),)
OBJ_DIR = $(PRJ_BUILD_DIR)/$(PRJ_NAME)
endif
PRJ_All_C_OBJ = $(PRJ_C_OBJ) $(PRJ_EXTRA_C_OBJ)
OBJ_NAME = $(PRJ_All_C_OBJ:.o=.$(OBJ_EXT))
OBJ_FILE = $(foreach file, $(OBJ_NAME), $(OBJ_DIR)/$(file))

#
# \brief Header
#
ifeq ($(PRJ_C_HEADER_DIR),)
PRJ_C_HEADER_DIR = .
endif
PRJ_C_HEADER_FILE = $(foreach file, $(PRJ_C_HEADER), $(PRJ_C_HEADER_DIR)/$(file))

#
# \brief Library.
#
ifeq ($(PRJ_LIB_NAME),)
PRJ_LIB_NAME =
endif
ifeq ($(PRJ_OS), $(PRJ_ARCH_X86_64_PC_LINUX_GNU))
PRJ_LIB_PREFIX = lib
else
PRJ_LIB_PREFIX = 
endif
# Static library.
PRJ_LIB_A_NAME_TMP = $(foreach name, $(PRJ_LIB_A_NAME), \
	$(addprefix $(PRJ_LIB_PREFIX), $(name)))
PRJ_LIB_A_SUFFIX = a
PRJ_LIB_A = $(foreach lib, $(PRJ_LIB_A_NAME_TMP), \
	$(addsuffix .$(PRJ_LIB_A_SUFFIX), $(lib)))
PRJ_LIB_A_ABS = $(foreach lib, $(PRJ_LIB_A), \
	$(addprefix $(PRJ_BUILD_DIR)/, $(lib)))
IMPORT_LIB_A = $(foreach lib_a, $(PRJ_LIB_A), \
	$(STATIC_FLAG) $(lib_a))
# Dynamic library.
PRJ_LIB_SO_NAME_TMP = $(foreach name, $(PRJ_LIB_SO_NAME), \
	$(addprefix $(PRJ_LIB_PREFIX), $(name)))
ifeq ($(PRJ_TARGET_OS), $(PRJ_ARCH_X86_64_PC_LINUX_GNU))
PRJ_LIB_SO_SUFFIX = so
else
PRJ_LIB_SO_SUFFIX = dll
endif
PRJ_LIB_SO = $(foreach lib, $(PRJ_LIB_SO_NAME_TMP), \
	$(addsuffix .$(PRJ_LIB_SO_SUFFIX), $(lib)))
PRJ_LIB_SO_ABS = $(foreach lib, $(PRJ_LIB_SO), \
	$(addprefix $(PRJ_BUILD_DIR)/, $(lib)))
ifeq ($(PRJ_TARGET_OS), $(PRJ_ARCH_X86_64_PC_LINUX_GNU))
IMPORT_LIB_SO = $(foreach lib_so, $(PRJ_LIB_SO), \
	$(DYNAMIC_FLAG) $(lib_so))
else
IMPORT_LIB_SO = -L. -lgdal
endif

#
# \brief Select output format of library.
#
# ifneq ($(PRJ_OS), $(PRJ_ARCH_X86_64_PC_LINUX_GNU))
# PRJ_LIB_OFF = yes
# else # ifneq ($(PRJ_OS), $(PRJ_ARCH_X86_64_PC_LINUX_GNU))
ifneq ($(PRJ_LIB_A_NAME),)
ifneq ($(PRJ_LIB_SO_NAME),)
PRJ_LIB_A_SO_ON = yes
else # ifneq ($(PRJ_LIB_A_NAME),)
PRJ_LIB_A_ON = yes
endif # ifneq ($(PRJ_LIB_SO_NAME),)
else # ifneq ($(PRJ_LIB_A_NAME),)
ifneq ($(PRJ_LIB_SO_NAME),)
PRJ_LIB_SO_ON = yes
else # ifneq ($(PRJ_LIB_SO_NAME),)
PRJ_LIB_OFF = yes
endif # ifneq ($(PRJ_LIB_SO_NAME),)
endif # ifneq ($(PRJ_LIB_A_NAME),)
# endif # ifneq ($(PRJ_OS), $(PRJ_ARCH_X86_64_PC_LINUX_GNU))
