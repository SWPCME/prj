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
cmake_prepare: prj_opt_prepare
	${PRJ_CMAKE} ${PRJ_CMAKE_FLAG}

cmake_compile: cmake_prepare
	$(CD) $(PRJ_BUILD_DIR); $(PRJ_MAKE)

cmake_install: cmake_compile
	$(CD) $(PRJ_BUILD_DIR); $(PRJ_MAKE) install

cmake_clean:
	$(CD) $(PRJ_BUILD_DIR); $(PRJ_MAKE) clean
