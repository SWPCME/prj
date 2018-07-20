################################################################################
# $Id: prj_diffutool.mk 2018-05 $
#
# Project:  Prj.
# Purpose:  Diffutils tool.
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

ifneq ($(PRJ_DIFFU_BIN_PATH),)
PRJ_DIFFU_DIFF = $(PRJ_DIFFU_BIN_PATH)/diff
PRJ_DIFFU_CMP = $(PRJ_DIFFU_BIN_PATH)/cmp
else
PRJ_DIFFU_DIFF = diff
PRJ_DIFFU_CMP = cmp
endif
