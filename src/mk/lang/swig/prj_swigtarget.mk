################################################################################
# $Id: prj_swigctl.mk 2017-09 $
#
# Project:  Prj.
# Purpose:  Swig target.
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
prj_swig_prepare: prj_opt_prepare
	if [ ! -d $(PRJ_SWIG_OUT_DIR) ]; then $(MKDIR) $(PRJ_SWIG_OUT_DIR); fi
	if [ ! -d $(PRJ_SWIG_OBJ_DIR) ]; then $(MKDIR) $(PRJ_SWIG_OBJ_DIR); fi
	if [ ! -d $(PRJ_SWIG_LANG_DIR) ]; then $(MKDIR) $(PRJ_SWIG_LANG_DIR); fi
	if [ ! -d $(PRJ_SWIG_NAME_DIR) ]; then $(MKDIR) $(PRJ_SWIG_NAME_DIR); fi

#
# \brief Compile swig object.
#
$(PRJ_SWIG_OBJ_DIR)/%.$(PRJ_SWIG_OBJ_EXT): %.i
	$(SWIG) -package $(PRJ_SWIG_NAME) $(PRJ_SWIG_SRC_INCLUDE_DIR) $(PRJ_SWIG_FLAG) -o $@ \
	-outdir $(PRJ_SWIG_NAME_DIR) $(PRJ_INCLUDE_DIR) $<
$(PRJ_SWIG_OBJ_DIR)/%.$(OBJ_EXT): $(PRJ_SWIG_OBJ_DIR)/%.$(PRJ_SWIG_OBJ_EXT)
	$(CXX) $(PRJ_INCLUDE_DIR) $(CXX_FLAG) -c $< -o $@

#
# \brief Create swig object.
#
create_swig_obj: prj_swig_prepare $(PRJ_SWIG_CXX_OBJ_FILE)

clean_swig_obj:
	$(RM) -f $(PRJ_SWIG_OBJ_FILE)
	$(RM) -f $(PRJ_SWIG_CXX_OBJ_FILE)

#
# \brief Create swig library.
#
swig_lib_so: create_swig_obj
	$(LD) $(LD_FLAG) $(PRJ_SWIG_OBJ_DIR)/*.$(OBJ_EXT) $(OBJ_DIR)/*.$(OBJ_EXT) \
	 	$(PRJ_EXTRA_LIB_DIR) $(PRJ_EXTRA_LIB_SO) -o $(PRJ_LIB_SO_ABS)
create_swig_lib: swig_lib_so
create_swig_java: swig_lib_so
	$(CD) $(PRJ_SWIG_NAME_DIR); \
	$(JAVAC) $(PRJ_SWIG_JAVA_FLAGS) -d . *.java
	$(CD) $(PRJ_SWIG_NAME_DIR); \
	$(JAR) cvf ../$(PRJ_SWIG_NAME).jar $(PRJ_SWIG_NAME)/*.class

#
# \brief Install swig library.
#
install_lib_java: create_swig_$(PRJ_SWIG_DST_LANG)
	($(CP) $(PRJ_BUILD_DIR)/lib$(C_LIB_SO_NAME).$(PRJ_LIB_SO_SUFFIX) $(PRJ_C_INSTALL_O_DIR))
	($(CP) $(PRJ_SWIG_NAME_DIR).jar $(PRJ_C_INSTALL_O_DIR))
