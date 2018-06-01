################################################################################
# $Id: prj_aconfctl.mk 2018-01 $
#
# Project:  Prj.
# Purpose:  Autoconf tool.
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

PRJ_ACONF = autoconf
PRJ_ACONF_CONFIGURE_CFG = configure
PRJ_ACONF_RE_CFG = configure.ac
PRJ_ACONF_RE = autoreconf
PRJ_ACONF_RE_FLAG = -Wall $(PRJ_ACONF_RE_EXTRA_FLAG)
# PRJ_ACONF_CONFIGURE = $(WORK_DIR)/configure
PRJ_ACONF_AUTOGEN_CFG = autogen.sh
PRJ_ACONF_AUTOGEN_BIN_PATH = .
PRJ_ACONF_AUTOGEN = $(PRJ_ACONF_AUTOGEN_BIN_PATH)/autogen.sh
ifeq ($(PRJ_ACONF_WORK_DIR),)
PRJ_ACONF_WORK_DIR=.
endif
PRJ_ACONF_ENV_PATH = $(PRJ_ENV_PATH)
PRJ_ACONF_ENV = $(PRJ_ACONF_ENV_PATH)
ifeq (${PRJ_DCC_ENABLE}, yes)
PRJ_ACONF_ENV += CC="$(CC)" CXX="$(CXX)"
endif
PRJ_ACONF_CONFIGURE = $(PRJ_ACONF_ENV) $(PRJ_ACONF_WORK_DIR)/configure
