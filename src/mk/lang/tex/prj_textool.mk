################################################################################
# $Id: prj_textool.mk 2018-03 $
#
# Project:  Prj.
# Purpose:  Tex (TeX: Text EXecutive) tool.
# Author:   Weiwei Huang, 898687324@qq.com
#
################################################################################
# Copyright (c) 2018-03 ~ 2018 Weiwei Huang
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

# \brief Flag.
PRJ_TEX_BUILD_DIR_FLAG = -output-directory $(PRJ_TEX_BUILD_DIR)
PRJ_TEX_OUT_FORMAT_FLAG = -output-format $(PRJ_TEX_OUT_FORMAT)

# \brief Command.
ifneq ($(TEX_INPUTS),)
PRJ_TEX_ENV = TEXINPUTS=$(PRJ_TEX_INPUTS):
endif
ifeq ($(PRJ_TEX_FORMAT), latex)
PRJ_TEX = $(PRJ_TEX_ENV) latex
else
ifeq ($(PRJ_TEX_FORMAT), xelatex)
PRJ_TEX = $(PRJ_TEX_ENV) xelatex
PRJ_TEX_OUT_FORMAT_FLAG = -interaction nonstopmode
else
ifeq ($(PRJ_TEX_FORMAT), luatex)
PRJ_TEX = $(PRJ_TEX_ENV) luatex
PRJ_TEX_OUT_FORMAT_FLAG = 
else
PRJ_TEX = $(PRJ_TEX_ENV) tex
endif
endif
endif
PRJ_GS = gs
PRJ_DVIPS = dvips
PRJ_DVIPDF = dvipdf

# \brief Flag.
PRJ_TEX_FLAG = $(PRJ_TEX_BUILD_DIR_FLAG) $(PRJ_TEX_OUT_FORMAT_FLAG)
