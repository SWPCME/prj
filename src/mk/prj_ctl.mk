################################################################################
# $Id: prj_ctl.mk 2017-08 $
#
# Project:  Prj.
# Purpose:  Project controler.
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
# Arch
#
PRJ_ARCH_MK_DIR = $(PRJ_MK_DIR)
include $(PRJ_ARCH_MK_DIR)/prj_archctl.mk

#
# Language.
#
PRJ_LANG_MK_DIR = $(PRJ_MK_DIR)/lang
include $(PRJ_LANG_MK_DIR)/prj_langctl.mk

#
# Utility.
#
PRJ_UTIL_MK_DIR = $(PRJ_MK_DIR)/util
include $(PRJ_UTIL_MK_DIR)/prj_utilctl.mk

#
# Template.
#
# PRJ_TMPL_MK_DIR = ${PRJ_MK_DIR}/tmpl
# include $(PRJ_TMPL_MK_DIR)/prj_tmplctl.mk
