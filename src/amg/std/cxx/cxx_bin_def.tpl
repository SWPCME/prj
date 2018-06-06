[+ AutoGen5 template -*- mode: c -*-
################################################################################
# $Id: cxx_bin_def.tpl 2017-10 $
#
# Project:  Prj amg (Prj: Project; amg: automated program generator.).
# Purpose:  Cxx bin definitions tpl.
# Author:   Weiwei Huang, 898687324@qq.com
#
################################################################################
# Copyright (c) 2017-10 ~ 2017 Weiwei Huang
#
# This program is free software; you can redistribute it and/or modify it under 
# the terms of the GNU General Public License as published by the Free Software 
# Foundation, either version 3 of the License, or \(at your option\) any later 
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
+]

/**
 * \brief Enviroment.
 */

src_dir = "[+ src_dir +]";
include_dir = "[+ include_dir +]";
opt_list = "[+ opt_list +]";
tgt_default = [+ tgt_default +];
tgt_clean = [+ tgt_clean +];
tgt_

/**
 * \brief File list.
 */

SUB_NAME =

LAYER = .

SUB_DIR = \
          base \
          core \
          wrap \
          ctgy

C_OBJ = \
      hub_ctl.o \
      hub_modulectl.o

C_HEADER = \
         hub_base.h \
         hub_ctl.hpp \
         hub_modulectl.hpp

C_LIB_SO_NAME = hub
C_EXTRA_LIB_SO = -lgdal -lgsl -lcurl -lfiremod -lrtklib
