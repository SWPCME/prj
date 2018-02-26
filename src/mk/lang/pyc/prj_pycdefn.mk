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

ifeq ($(PRJ_PYC_OBJ_DIR),)
PRJ_PYC_OBJ_DIR = $(PRJ_BUILD_DIR)/$(PRJ_NAME)
endif
PRJ_PYC_OBJ_EXT = $(PYC_OBJ_EXT)
# PRJ_PYC_OBJ_NAME = $(PRJ_PYC_OBJ:.cxx=.$(PYC_OBJ_EXT))
# PRJ_PYC_OBJ_FILE = $(foreach file, $(PRJ_PYC_OBJ_NAME), $(PRJ_PYC_OBJ_DIR)/$(file))
PRJ_PYC_HEADER_NAME = $(PRJ_PYC_HEADER:.h=.pyx)
PRJ_PYC_HEADER_FILE = $(PRJ_PYC_HEADER_NAME)
PRJ_PYC_OBJ_NAME = $(PRJ_PYC_OBJ:.cxx=.py)
PRJ_PYC_OBJ_FILE = $(foreach file, $(PRJ_PYC_OBJ_NAME), $(PRJ_PYC_SRC_DIR)/$(file))
# PRJ_PYC_LD_FLAG = -pthread -fwrapv -O2 -Wall -fno-strict-aliasing
PRJ_PYC_INCLUDE_DIR = /usr/include
PRJ_PYC_P_VER = python3.5m

ifneq ($(PRJ_PYC_OBJ_NAME),)
PRJ_C_CXX_EXTRA_FLAG += $(PRJ_PYC_C_FLAG)
PRJ_EXTRA_INCLUDE_DIR += -I$(PRJ_PYC_INCLUDE_DIR)/$(PRJ_PYC_P_VER)
PRJ_EXTRA_LD_FLAG += $(PRJ_PYC_LD_FLAG)
PRJ_C_SRC_DIR = $(PRJ_PYC_OBJ_DIR)
# PRJ_PYC_C_OBJ_FILE = $(PRJ_PYC_OBJ:.cxx=.$(OBJ_EXT))
PRJ_PYC_C_OBJ_FILE = $(PRJ_NAME).o
PRJ_EXTRA_C_OBJ += $(PRJ_PYC_C_OBJ_FILE)
PRJ_C_HEADER_DIR = $(PRJ_PYC_OBJ_DIR)
PRJ_C_HEADER += $(PRJ_NAME).h
endif
