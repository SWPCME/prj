# !bash --posix
################################################################################
# $Id: git.mk 2018-04 $
#
# Project:  PRJ.
# Purpose:  Git.
# Author:   Weiwei Huang, 898687324@qq.com
#
################################################################################
# Copyright (c) 2018-04 ~ 2018 Weiwei Huang
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

SOURCE_DIR=
REMOTE_SRV=
STR_NULL=

git_init:
	if [ ! -f ${SOURCE_DIR} ]; then mkdir -pv ${SOURCE_DIR}; fi
	cd ${SOURCE_DIR}; if [ ! -f .git ]; then git init; fi
	cd ${SOURCE_DIR}; if [ ! ${REMOTE_SRV} -eq ${STR_NULL} ]; then git fetch ${REMOTE_SRV}; fi
