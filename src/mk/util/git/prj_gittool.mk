################################################################################
# $Id: prj_gittool.mk 2018-05 $
#
# Project:  Prj.
# Purpose:  Git tool.
# Author:   Weiwei Huang, 898687324@qq.com
#
################################################################################
# Copyright (c) 2018-05 ~ 2018 Weiwei Huang
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

ifneq ($(PRJ_GIT_BIN_PATH),)
PRJ_GIT = $(PRJ_GIT_BIN_PATH)/git
else
PRJ_GIT = git
endif

PRJ_GIT_CLONE = $(PRJ_GIT) clone
PRJ_GIT_PULL = $(PRJ_GIT) pull
PRJ_GIT_CHECKOUT = $(PRJ_GIT) checkout
