################################################################################
# $Id: prj_optctl.mk 2017-08 $
#
# Project:  Prj.
# Purpose:  Option controler.
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

# Project name
PRJ_NAME = $(NAME)

# Mode
PRJ_OS = $(OS)
PRJ_TARGET_OS = $(TARGET_OS)
PRJ_DEBUG = $(DEBUG)

# Version
PRJ_VERSION = $(VERSION)

# Utility
# dcc
PRJ_DCC_HOST = $(DCC_HOST)
# cmake
PRJ_CMAKE_CFG_DIR = ${CMAKE_CFG_DIR}
PRJ_CMAKE_EXTRA_FLAG = ${CMAKE_EXTRA_FLAG}

# Option list.
# Build
PRJ_BUILD_DIR = $(BUILD_DIR)
PRJ_BUILD_CMAKE_DIR = $(BUILD_CMAKE_DIR)
# For asm.
PRJ_ASM_OBJ = $(ASM_OBJ)
# For c.
PRJ_C_SUFFIX = $(C_SUFFIX)
# For cxx.
PRJ_CXX_SUFFIX = $(CXX_SUFFIX)
# For pyc.
PRJ_PYC_SUFFIX = $(PYC_SUFFIX)
PRJ_PYC_SRC_DIR = $(PYC_SRC_DIR)
PRJ_PYC_OBJ = $(PYC_OBJ)
PRJ_PYC_OBJ_EXT = $(PYC_OBJ_EXT)
PRJ_PYC_HEADER = $(PYC_HEADER)
PRJ_PYC_SETUP_FILE = $(PYC_SETUP_FILE)
# For swig.
PRJ_SWIG_NAME = $(SWIG_NAME)
PRJ_SWIG_SRC_LANG = $(SWIG_SRC_LANG)
PRJ_SWIG_DST_LANG = $(SWIG_DST_LANG)
PRJ_SWIG_SRC_INCLUDE_DIR = $(SWIG_SRC_INCLUDE_DIR)
PRJ_SWIG_EXT = $(SWIG_EXT)
PRJ_SWIG_OBJ = $(SWIG_OBJ)
PRJ_SWIG_OBJ_DIR = $(SWIG_OBJ_DIR)
PRJ_SWIG_OBJ_EXT = $(SWIG_OBJ_EXT)
PRJ_SWIG_OUT_DIR = $(SWIG_OUT_DIR)
# JAVA
PRJ_JAVA_OS = $(JAVA_OS)
PRJ_JAVA_JDK_DIR = $(JAVA_JDK_DIR)
PRJ_JAVA_NAME = $(JAVA_NAME)
PRJ_JAVA_CODE_EXT = $(JAVA_CODE_EXT)
PRJ_JAVA_OBJ = $(JAVA_OBJ)
PRJ_JAVA_OBJ_DIR = $(JAVA_OBJ_DIR)
PRJ_JAVA_OBJ_EXT = $(JAVA_OBJ_EXT)
PRJ_JAVA_JAR = $(JAVA_JAR)
PRJ_JAVA_OUT_DIR = $(JAVA_OUT_DIR)
# Doc
PRJ_DOC_API_CFG_DIR = $(DOC_API_CFG_DIR)
PRJ_DOC_API_CFG_FILE = $(DOC_API_CFG_FILE)

#
# OS
#
# PRJ_OS_BOOT_DIR
PRJ_OS_NAME = $(OS_NAME)

#
# For "file.lst"
#
# Sub project name
PRJ_SUB_NAME = $(SUB_NAME)
# Layer
PRJ_LAYER = $(LAYER)
# Sub directory
PRJ_SUB_DIR = $(SUB_DIR)
# Source
PRJ_C_SRC_DIR = $(C_SRC_DIR)
# Object
PRJ_C_OBJ = $(C_OBJ)
# Header
PRJ_C_HEADER_DIR = $(C_HEADER_DIR)
PRJ_C_HEADER = $(C_HEADER)
# File
PRJ_INSTALL_FILE = $(INSTALL_FILE)
# Library
PRJ_LIB_DIR = $(LIB_DIR)
PRJ_LIB_SO_NAME = $(C_LIB_SO_NAME)
PRJ_EXTRA_LIB_DIR = $(C_EXTRA_LIB_DIR)
PRJ_EXTRA_LIB_SO = $(C_EXTRA_LIB_SO)
# Flag
PRJ_C_CXX_EXTRA_FLAG = $(C_CXX_EXTRA_FLAG)
PRJ_CXX_EXTRA_FLAG = $(CXX_EXTRA_FLAG)
PRJ_C_EXTRA_FLAG = $(C_EXTRA_FLAG)

# Makefile
PRJ_INCLUDE_DIR = $(INCLUDE_DIR)

# Directory
PRJ_HOME_DIR = $(HOME_DIR)
PRJ_WORK_DIR = $(WORK_DIR)
PRJ_SRC_DIR = $(SRC_DIR)
PRJ_MK_DIR = $(MK_DIR)
PRJ_BUILD_DIR = $(BUILD_DIR)/$(PRJ_TARGET_OS)
PRJ_INSTALL_DIR = $(INSTALL_DIR)/$(PRJ_TARGET_OS)
PRJ_INSTALL_BIN_DIR = $(INSTALL_BIN_DIR)
PRJ_INSTALL_INCLUDE_DIR = $(INSTALL_INCLUDE_DIR)
PRJ_INSTALL_LIB_DIR = $(INSTALL_LIB_DIR)
PRJ_INSTALL_SHARE_DIR = $(INSTALL_SHARE_DIR)
PRJ_JAVA_CLASS_DIR = $(JAVA_CLASS_DIR)

# File
PRJ_FILE_LIST = $(FILE_LIST)

#
# \brief Module
#
PRJ_OPT_MODULE = $(OPT_MODULE)

#
# \brief Option definition.
#
include $(PRJ_MK_DIR)/prj_optdefn.mk

#
# \brief Option target.
#
include $(PRJ_MK_DIR)/prj_opttarget.mk

#
# \brief Main controler.
#
PRJ_CTL_MK = $(PRJ_MK_DIR)/prj_ctl.mk
include $(PRJ_CTL_MK)
