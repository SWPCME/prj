################################################################################
# $Id: prj_utilctl.mk 2018-07 $
#
# Project:  Prj.
# Purpose:  Utility controler.
# Author:   Weiwei Huang, 898687324@qq.com
#
################################################################################
# Copyright (c) 2017-09 ~ 2018 Weiwei Huang
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
# \brief Include util controler.
#
PRJ_CUTIL_MK_DIR = $(PRJ_UTIL_MK_DIR)/cutil
PRJ_BINU_MK_DIR = $(PRJ_UTIL_MK_DIR)/binu
PRJ_GIT_MK_DIR = $(PRJ_UTIL_MK_DIR)/git
PRJ_DIFFU_MK_DIR = $(PRJ_UTIL_MK_DIR)/diffu
PRJ_PATCH_MK_DIR = $(PRJ_UTIL_MK_DIR)/patch
PRJ_ACONF_MK_DIR = $(PRJ_UTIL_MK_DIR)/aconf
PRJ_CMAKE_MK_DIR = $(PRJ_UTIL_MK_DIR)/cmake
PRJ_DIFFU_MK_DIR = $(PRJ_UTIL_MK_DIR)/diffu
PRJ_CCC_MK_DIR = $(PRJ_UTIL_MK_DIR)/ccc
PRJ_DCC_MK_DIR = $(PRJ_UTIL_MK_DIR)/dcc
PRJ_OS_MK_DIR = $(PRJ_UTIL_MK_DIR)/os
PRJ_VGR_MK_DIR = $(PRJ_UTIL_MK_DIR)/vgr
include $(PRJ_CUTIL_MK_DIR)/prj_cutilctl.mk
include $(PRJ_BINU_MK_DIR)/prj_binuctl.mk
include $(PRJ_GIT_MK_DIR)/prj_gitctl.mk
include $(PRJ_DIFFU_MK_DIR)/prj_diffuctl.mk
include $(PRJ_PATCH_MK_DIR)/prj_patchctl.mk
include $(PRJ_ACONF_MK_DIR)/prj_aconfctl.mk
include $(PRJ_CMAKE_MK_DIR)/prj_cmakectl.mk
include $(PRJ_DIFFU_MK_DIR)/prj_diffuctl.mk
include $(PRJ_CCC_MK_DIR)/prj_cccctl.mk
include $(PRJ_DCC_MK_DIR)/prj_dccctl.mk
include $(PRJ_OS_MK_DIR)/prj_osctl.mk
include $(PRJ_VGR_MK_DIR)/prj_vgrctl.mk
