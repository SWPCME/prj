################################################################################
# $Id: prj_makefile.mk 2017-08 $
#
# Project:  Prj.
# Purpose:  Project makefile.
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

# For ui library.

#
# Options.
#
# Directory.
HUB_DIR = hub
OBJ_DIR = $(TMP_DIR)/main
# Search.
INCLUDE_DIR = -I$(UI_DIR) -I$(BSN_DIR) -I$(HUB_DIR) -I$(CCS_DIR) -I$(UST_DIR) 

#
# Include.
#
HUB_MAKEOPT = $(HUB_DIR)/hub_makeopt.mk
include $(HUB_MAKEOPT)

default: bin_file

clean: clean_obj target_dir_clean

backup:
	7z a ../.backup/hub_src_$(VERSION).7z ../src
