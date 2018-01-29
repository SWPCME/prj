################################################################################
# $Id: prj_ctl.mk 2017-08 $
#
# Project:  Prj.
# Purpose:  Language controler.
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
# \brief Include cxx controler.
#
PRJ_CXX_MK_DIR = $(PRJ_LANG_MK_DIR)/cxx
include $(PRJ_CXX_MK_DIR)/prj_cxxctl.mk

#
# \brief Include java controler.
#
PRJ_JAVA_MK_DIR = $(PRJ_LANG_MK_DIR)/java
include $(PRJ_JAVA_MK_DIR)/prj_javactl.mk

#
# \brief Include swig controler.
#
PRJ_SWIG_MK_DIR = $(PRJ_LANG_MK_DIR)/swig
include $(PRJ_SWIG_MK_DIR)/prj_swigctl.mk

#
# \brief Include make controler.
#
PRJ_MAKE_MK_DIR = $(PRJ_LANG_MK_DIR)/make
include $(PRJ_MAKE_MK_DIR)/prj_makectl.mk

#
# \brief Include doxy controler.
#
PRJ_DOXY_MK_DIR = $(PRJ_LANG_MK_DIR)/doxy
include $(PRJ_DOXY_MK_DIR)/prj_doxyctl.mk
