################################################################################
# $Id: prj_amgctl.mk 2018-02 $
#
# Project:  Prj.
# Purpose:  Amg controler.
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

#
# \brief Definition.
#
include $(PRJ_AMG_MK_DIR)/prj_amgdefn.mk

#
# \brief Include swig tool.
#
include $(PRJ_AMG_MK_DIR)/prj_amgtool.mk

#
# \brief Target.
#
include $(PRJ_AMG_MK_DIR)/prj_amgtarget.mk
