################################################################################
# $Id: prj_javadefn.mk 2017-09 $
#
# Project:  Prj.
# Purpose:  Java definition.
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
# \brief JAVA object.
#
ifeq ($(PRJ_JAVA_OBJ_DIR),)
PRJ_JAVA_OBJ_DIR = $(PRJ_TMP_DIR)/java
endif
PRJ_JAVA_OBJ_NAME = $(PRJ_JAVA_OBJ:.class=.$(PRJ_JAVA_OBJ_EXT))
PRJ_JAVA_OBJ_FILE = $(foreach file, $(PRJ_JAVA_OBJ_NAME), $(PRJ_JAVA_OBJ_DIR)/$(file))
PRJ_JAVA_C_OBJ_FILE = $(foreach file, $(PRJ_JAVA_OBJ_NAME), \
	$(addsuffix .$(OBJ_EXT), $(file)))
PRJ_JAVA_PKG = $(JAVA_PKG)

ifeq (PRJ_DEBUG, yes)
PRJ_JAVA_FLAGS += -g
endif
