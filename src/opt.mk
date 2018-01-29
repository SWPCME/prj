################################################################################
# $Id: opt.mk 2017-08 $
#
# Project:  Prj.
# Purpose:  Option controler.
# Author:   Weiwei Huang, 898687324@qq.com
#
################################################################################
# Copyright (c) 2016-08 ~ 2017 Weiwei Huang
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

# Project name
NAME = prj

# Mode
DEBUG = yes
UNIX = yes
CYGWIN = 

# Version
VERSION = v0.1.1

# Directory
MK_DIR = $(SRC_DIR)/mk
INSTALL_DIR = /home/swpcme/me/usr/share

# File
FILE_LIST = file.lst

# Include
PRJ_CTL_MK = $(MK_DIR)/prj_optctl.mk
include $(PRJ_CTL_MK)
