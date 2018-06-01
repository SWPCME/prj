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

ifneq ($(PRJ_SWIG_BIN_PATH),)
PRJ_CMAKE_ENV_PATH = PATH=$(PRJ_SWIG_BIN_PATH):$(PATH)
else
PRJ_CMAKE_ENV_PATH = 
endif

PRJ_CMAKE_ENV = $(PRJ_CMAKE_ENV_PATH) CC="$(CC)" CXX="$(CXX)"

#
# \brief cmake
#
ifneq ($(PRJ_CMAKE_BIN_PATH),)
PRJ_CMAKE_BIN = $(PRJ_CMAKE_BIN_PATH)/cmake
else
PRJ_CMAKE_BIN = cmake
endif

PRJ_CMAKE = $(PRJ_CMAKE_ENV) $(PRJ_CMAKE_BIN)
