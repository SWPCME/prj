################################################################################
# $Id: prj_dccctl.mk 2018-02 $
#
# Project:  Prj.
# Purpose:  Distcc tool.
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

PRJ_DCC_DIR = /home/swpcme/file/resource/func/sys/devel/distcc/
PRJ_DCC_BIN_DIR = $(PRJ_DCC_DIR)/install/${PRJ_OS}/bin
PRJ_DCC_ENV = DISTCC_HOSTS="$(PRJ_DCC_HOST)"
PRJ_DCC = $(PRJ_DCC_ENV) $(PRJ_DCC_BIN_DIR)/distcc
PRJ_DCCD = $(PRJ_DCC_BIN_DIR)/distccd
