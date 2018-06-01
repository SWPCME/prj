################################################################################
# $Id: prj_texdefn.mk 2018-03 $
#
# Project:  Prj.
# Purpose:  Tex (TeX: Text EXecutive) definition.
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

# directory
PRJ_TEX_NAME = $(PRJ_SUB_NAME)
PRJ_TEX_BUILD_DIR = $(PRJ_BUILD_DIR)
PRJ_TEX_INSTALL_DIR = $(PRJ_INSTALL_SHARE_DOC_DIR)
PRJ_TEX_INSTALL_FILE = $(foreach file, $(PRJ_TEX_NAME), $(addsuffix \
	.$(PRJ_PDF_SUFFIX), $(file)))
