[+ AutoGen5 template -*- mode: text -*-
################################################################################
# $Id: cxx_bin.tpl 2017-10 $
#
# Project:  Prj amg (Prj: Project; amg: automated program generator.).
# Purpose:  Cxx bin tpl.
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
[+ (set-writable) +]

[+ Include "std_makefile.mk" +]

[+ # Create Makefile.tpl. +]
[+ IF (not (access? "Makefile.tpl" R_OK)) +]
[+ (out-push-new "Makefile.tpl") +]
[+ INCLUDE "cxx_bin_tpl.mk" +]
[+ (out-pop) +]
[+ ENDIF # Create Makefile.tpl. +]

[+ # Create Makefile.def. +]
[+ IF (not (access? "Makefile.def" R_OK)) +]
[+ (out-push-new "Makefile.def") +]
[+ INCLUDE "cxx_bin_def.mk" +]
[+ (out-pop) +]
[+ ENDIF # Create Makefile.def. +]
