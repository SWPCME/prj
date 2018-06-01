################################################################################
# $Id: prj_aconfctl.mk 2018-01 $
#
# Project:  Prj.
# Purpose:  Autoconf target.
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

# Prepare.
aconf_prepare: prj_opt_prepare
	$(RSYNC) -a $(PRJ_WORK_DIR)/* $(PRJ_BUILD_DIR)
	if [ -f $(PRJ_BUILD_DIR)/$(PRJ_ACONF_CONFIGURE_CFG) ]; \
	then echo "Directly run configure."; \
	elif [ -f $(PRJ_BUILD_DIR)/$(PRJ_ACONF_RE_CFG) ]; \
	then $(CD) $(PRJ_BUILD_DIR); $(PRJ_ACONF_RE) $(PRJ_ACONF_RE_FLAG); \
	elif [ -f $(PRJ_BUILD_DIR)/$(PRJ_ACONF_AUTOGEN_CFG) ]; \
	then $(CD) $(PRJ_BUILD_DIR); $(PRJ_ACONF_AUTOGEN); fi
	$(CD) $(PRJ_BUILD_DIR); $(PRJ_ACONF_CONFIGURE) $(PRJ_ACONF_CONFIGURE_FLAG)

aconf_compile: aconf_prepare
	$(CD) $(PRJ_BUILD_DIR); $(PRJ_ACONF_ENV_PATH) $(PRJ_MAKE)

aconf_install: aconf_compile
	$(CD) $(PRJ_BUILD_DIR); $(PRJ_ACONF_ENV_PATH) $(PRJ_MAKE) install

aconf_clean:
	$(CD) $(PRJ_BUILD_DIR); $(PRJ_MAKE) clean
