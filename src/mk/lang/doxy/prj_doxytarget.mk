################################################################################
# $Id: prj_doxytarget.mk 2017-09 $
#
# Project:  Prj.
# Purpose:  Doxy target.
# Author:   Weiwei Huang, 898687324@qq.com
#
################################################################################
# Copyright (c) 2017-09 ~ 2017 Weiwei Huang
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
# \brief prepare
#
prj_doxy_prepare: prj_opt_prepare
	if [ ! -d $(PRJ_DOC_OUT_DIR) ]; then $(MKDIR) $(PRJ_DOC_OUT_DIR); fi
	if [ ! -d $(PRJ_DOC_API_OUT_DIR) ]; then $(MKDIR) $(PRJ_DOC_API_OUT_DIR); fi

#
# \brief Create.
#
create_doc: prj_doxy_prepare
	$(CD) $(PRJ_DOC_API_CFG_DIR); $(DOXYGEN) $(PRJ_DOC_API_CFG_FILE)
