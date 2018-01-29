################################################################################
# $Id: prj_swigctl.mk 2017-09 $
#
# Project:  Prj.
# Purpose:  Swig definition.
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

# SWIG object.
ifeq ($(PRJ_SWIG_OBJ_DIR),)
PRJ_SWIG_OBJ_DIR = $(PRJ_BUILD_DIR)
endif
PRJ_SWIG_LANG_DIR = $(PRJ_SWIG_OUT_DIR)/$(PRJ_SWIG_DST_LANG)
PRJ_SWIG_NAME_DIR = $(PRJ_SWIG_LANG_DIR)/$(PRJ_SWIG_NAME)
PRJ_SWIG_OBJ_NAME = $(PRJ_SWIG_OBJ:.o=.$(PRJ_SWIG_OBJ_EXT))
PRJ_SWIG_OBJ_FILE = $(foreach file, $(PRJ_SWIG_OBJ_NAME), $(PRJ_SWIG_OBJ_DIR)/$(file))
PRJ_SWIG_CXX_OBJ_NAME = $(PRJ_SWIG_OBJ:.o=.$(OBJ_EXT))
PRJ_SWIG_CXX_OBJ_FILE = $(foreach file, $(PRJ_SWIG_CXX_OBJ_NAME), $(PRJ_SWIG_OBJ_DIR)/$(file))

ifeq (PRJ_DEBUG, yes)
PRJ_SWIG_JAVA_FLAGS += -g
endif
