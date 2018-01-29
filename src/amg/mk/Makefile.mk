################################################################################
# $Id: Makefile 2017-10 $
#
# Project:  Prj (Prj: Project).
# Purpose:  Makefile definition.
# Author:   Weiwei Huang, 898687324@qq.com
#
################################################################################
# Copyright (c) 2017-10 ~ 2017, Weiwei Huang
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
# Options.
#
# Directory.
SRC_DIR = .
# Search.
INCLUDE_DIR = .

#
# Include.
#
OPT_LIST = $(SRC_DIR)/opt.lst
include $(OPT_LIST)

default: bin_file

clean: clean_obj target_dir_clean

backup:
	7z a ../.backup/$(NAME)_$(VERSION).7z ../src
