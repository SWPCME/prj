################################################################################
# $Id: prj_textarget.mk 2018-03 $
#
# Project:  Prj.
# Purpose:  Tex (TeX: Text EXecutive) target.
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

#
# \brief prepare
#
prj_tex_prepare: 
	if [ ! -d $(PRJ_BUILD_DIR) ]; then $(MKDIR) -pv $(PRJ_BUILD_DIR); fi
	if [ ! -d $(PRJ_INSTALL_DIR) ]; then $(MKDIR) -pv $(PRJ_INSTALL_DIR); fi
	if [ ! -d $(PRJ_INSTALL_SHARE_DIR) ]; then $(MKDIR) -pv $(PRJ_INSTALL_SHARE_DIR); fi
	if [ ! -d $(PRJ_INSTALL_SHARE_DOC_DIR) ]; then $(MKDIR) -pv $(PRJ_INSTALL_SHARE_DOC_DIR); fi

#
# \brief compile tex code
#
# prj_tex_obj_dvi_create: prj_tex_prepare
# 	$(PRJ_TEX) $(PRJ_TEX_FLAG) $(PRJ_TEX_SRC_FILE)

#
# \brief compile tex code.
#
prj_tex_obj_create: prj_tex_prepare
	$(PRJ_TEX) $(PRJ_TEX_FLAG) $(PRJ_TEX_SRC_FILE)

#
# \brief translate dvi to pdf
#
# prj_tex_obj_pdf_create: prj_tex_obj_dvi_create
# 	$(PRJ_DVIPDF) $(PRJ_DVIPDF_FLAG) $(PRJ_TEX_OBJ_DVI) $(PRJ_TEX_OBJ_PDF)

#
# \brief install file
#
prj_tex_install: prj_tex_obj_create
	$(CD) $(PRJ_BUILD_DIR); for file in $(PRJ_TEX_INSTALL_FILE); do $(RSYNC) -a $$file \
		$(PRJ_INSTALL_SHARE_DOC_DIR); done
