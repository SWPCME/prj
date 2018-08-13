################################################################################
# $Id: prj_aconfctl.mk 2018-01 $
#
# Project:  Prj.
# Purpose:  Autoconf define.
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

PRJ_ACONF_BUILDER = aconf

ifneq ($(PRJ_OS), $(PRJ_TARGET_OS))
PRJ_ACONF_OS_FLAG = --build=$(PRJ_OS) --host=$(PRJ_TARGET_OS) \
	--target=$(PRJ_TARGET_OS)
endif
PRJ_ACONF_CONFIGURE_BASE_FLAG = --prefix=$(PRJ_INSTALL_DIR)
PRJ_ACONF_CONFIGURE_FLAG = $(PRJ_ACONF_CONFIGURE_BASE_FLAG) \
	$(PRJ_ACONF_CONFIGURE_EXTRA_FLAG)

# debug toggle
PRJ_ACONF_DEBUG = no
ifeq ($(PRJ_DEBUG),yes)
ifeq ($(PRJ_BUILDER),$(PRJ_ACONF_BUILDER))
PRJ_ACONF_DEBUG = yes
endif
endif

# fetch library for debug
ifeq ($(PRJ_ACONF_DEBUG),yes)
# static library
PRJ_ACONF_DBG_LIB_A = $(wildcard $(PRJ_INSTALL_LIB_DIR)/*.a)
PRJ_ACONF_DBG_LIB_A_FILE = $(PRJ_ACONF_DBG_LIB_A:.$(PRJ_LIB_A_SUFFIX)=_a.dbg)
# share library
PRJ_ACONF_DBG_LIB_SO = $(wildcard $(PRJ_INSTALL_LIB_DIR)/*.so)
PRJ_ACONF_DBG_LIB_SO_FILE = $(PRJ_ACONF_DBG_LIB_SO:.$(PRJ_LIB_SO_SUFFIX)=_so.dbg)
endif
