################################################################################
# $Id: prj_optdefn.mk 2017-09 $
#
# Project:  Prj.
# Purpose:  Option definition.
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
# \brief Global directory.
#
ifeq ($(WORK_DIR),)
WORK_DIR = .
endif
CURRENT_DIR = .

#
# \brief Process the options.
#
ifeq ($(INSTALL_BIN_DIR),)
PRJ_INSTALL_BIN_DIR = $(PRJ_INSTALL_DIR)/bin
endif
ifeq ($(INSTALL_INCLUDE_DIR),)
PRJ_INSTALL_INCLUDE_DIR = $(PRJ_INSTALL_DIR)/include
endif
ifeq ($(INSTALL_LIB_DIR),)
PRJ_INSTALL_LIB_DIR = $(PRJ_INSTALL_DIR)/lib
endif
ifeq ($(INSTALL_SHARE_DIR),)
PRJ_INSTALL_SHARE_DIR = $(PRJ_INSTALL_DIR)/share
endif

#
# \brief Include list.
#
# Dir list.
ifneq ($(PRJ_DIR_LIST),)
include $(PRJ_DIR_LIST)
endif
# File list.
ifeq ($(PRJ_FILE_DIR),)
PRJ_FILE_DIR = .
endif
PRJ_FILE_LIST = $(PRJ_FILE_DIR)/file.lst
ifeq ($(PRJ_FILE_LIST), $(wildcard $(PRJ_FILE_LIST)))
include $(PRJ_FILE_LIST)
endif

#
# \brief File list.
#
ifeq ($(strip $(PRJ_LAYER)),)
PRJ_LAYER = $(SUB_NAME)
endif

#
# \brief Install directory.
#
ifeq ($(PRJ_INSTALL_FILE_DIR_NAME),)
PRJ_INSTALL_FILE_DIR = $(PRJ_INSTALL_DIR)
else
PRJ_INSTALL_FILE_DIR = $(PRJ_INSTALL_DIR)/$(PRJ_INSTALL_FILE_DIR_NAME)
endif

#
# \brief Temporary directory.
#
ifeq ($(PRJ_TMP_DIR),)
PRJ_TMP_DIR = $(PRJ_C_INSTALL_O_DIR)/.tmp
endif

#
# \brief Subdirectories.
#
TARGET_DIR_DEFAULT = $(foreach dir, $(PRJ_SUB_DIR), $(dir)_target_default)
TARGET_DIR_CLEAN = $(foreach dir, $(PRJ_SUB_DIR), $(dir)_target_clean)
TARGET_DIR_INSTALL = $(foreach dir, $(PRJ_SUB_DIR), $(dir)_target_install)

#
# \brief Module
#
PRJ_OPT_MODULE_UP = $(shell echo $(PRJ_OPT_MODULE) | tr a-z A-Z)
PRJ_NAME_UP = $(shell echo $(PRJ_NAME) | tr a-z A-Z)
