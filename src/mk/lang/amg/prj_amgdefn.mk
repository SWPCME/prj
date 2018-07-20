################################################################################
# $Id: prj_amgctl.mk 2018-05 $
#
# Project:  Prj.
# Purpose:  Amg definition.
# Author:   Weiwei Huang, 898687324@qq.com
#
################################################################################
# Copyright (c) 2018-02 ~ 2018 Weiwei Huang
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

# destination
ifeq ($(PRJ_AMG_OBJ_DIR),)
PRJ_AMG_OBJ_DIR = $(PRJ_BUILD_DIR)/amg
endif
PRJ_AMG_DST_DIR = $(AMG_DST_DIR)
ifeq ($(PRJ_AMG_DST_DIR),)
PRJ_AMG_DST_DIR = .
endif

ifeq ($(PRJ_AMG_OUT_SUFFIX),)
PRJ_AMG_OUT_SUFFIX = " "
endif

# template
PRJ_AMG_TPL_DIR = $(AMG_TPL_DIR)
PRJ_AMG_TPL_FILE_IMPL = $(foreach name, $(PRJ_AMG_TPL), \
	$(addprefix -T$(PRJ_AMG_TPL_DIR)/, $(name)))

# definition
PRJ_AMG_DEFN_DIR = $(AMG_DEFN_DIR)
PRJ_AMG_DEFN_FILE_IMPL = $(foreach name, $(PRJ_AMG_DEFN), \
	$(addprefix --definitions=$(PRJ_AMG_DEFN_DIR)/, $(name)))

# output
PRJ_AMG_OUT_FILE = $(foreach name, $(PRJ_AMG_OUT), \
	$(addprefix $(PRJ_AMG_OUT_DIR)/, $(name)))
PRJ_AMG_OUT_FILE_TAG = amg_
PRJ_AMG_OUT_TMP = $(PRJ_AMG_OUT_FILE_TAG)$(PRJ_AMG_OUT)
PRJ_AMG_OUT_NAME_TMP = $(firstword $(subst ., ,$(PRJ_AMG_OUT_TMP)))
PRJ_AMG_OUT_SUFFIX_TMP = $(lastword $(subst ., ,$(PRJ_AMG_OUT_TMP)))
PRJ_AMG_OUT_FILE_IMPL_NAME = $(foreach name, $(PRJ_AMG_OUT_NAME_TMP), \
	$(addprefix -b , $(name)))
PRJ_AMG_OUT_FILE_IMPL_SUFFIX = $(foreach name, $(PRJ_AMG_OUT_SUFFIX_TMP), \
	$(addprefix -o , $(name)))
PRJ_AMG_OUT_FILE_IMPL = $(PRJ_AMG_OUT_FILE_IMPL_NAME) \
	$(PRJ_AMG_OUT_FILE_IMPL_SUFFIX)

PRJ_AMG_FILE_IMPL = $(PRJ_AMG_TPL_FILE_IMPL) $(PRJ_AMG_DEFN_FILE_IMPL) \
	$(PRJ_AMG_OUT_FILE_IMPL)

# output for diffutils
PRJ_AMG_OBJ_FILE_OLD = $(PRJ_AMG_OBJ_DIR)/$(PRJ_AMG_OUT)_old
PRJ_AMG_OBJ_FILE_NEW = $(PRJ_AMG_OBJ_DIR)/$(PRJ_AMG_OUT)_new
PRJ_AMG_OBJ_FILE_MIX = $(PRJ_AMG_OBJ_DIR)/$(PRJ_AMG_OUT)_mix

# error
PRJ_AMG_LOCK_ERROR = "Error! All the output files are protected!"
