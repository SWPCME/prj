################################################################################
# $Id: prj_buildctl.mk 2018-01 $
#
# Project:  Prj.
# Purpose:  Build controler.
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

NAME = 
CTGY = 
VERSION = 
OS = x86_64-pc-linux-gnu
TARGET_OS = x86_64-pc-linux-gnu
#TARGET_OS = x86_64-w64-mingw32
BUILDER = aconf
#BUILDER = cmake
HOME_DIR = /home/swpcme
PROJECT_DIR = $(HOME_DIR)/file/source/func/$(CTGY)/$(NAME)
BUILD_DIR = $(PROJECT_DIR)/build
BUILD_CMAKE_DIR = $(BUILD_DIR)/cmake
WORK_DIR = $(PROJECT_DIR)/source/$(VERSION)/$(NAME)
OUT_DIR = $(BUILD_DIR)/$(TARGET_OS)/$(VERSION)
INSTALL_DIR = $(PROJECT_DIR)/install/$(TARGET_OS)/$(VERSION)

# Directory
MK_DIR = $(HOME_DIR)/me/usr/share/prj/mk
OPTCTL_MK = $(MK_DIR)/prj_optctl.mk
include $(OPTCTL_MK)

default: $(BUILDER)_install

compile: $(BUILDER)_compile

install: $(BUILDER)_install
