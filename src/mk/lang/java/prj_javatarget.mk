################################################################################
# $Id: prj_javatarget.mk 2017-09 $
#
# Project:  Prj.
# Purpose:  Java target.
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
# \brief Prepare
#
prj_java_prepare: prj_opt_prepare
	if [ ! -d $(PRJ_JAVA_OBJ_DIR) ]; then $(MKDIR) $(PRJ_JAVA_OBJ_DIR); fi
	if [ ! -d $(PRJ_JAVA_OUT_DIR) ]; then $(MKDIR) $(PRJ_JAVA_OUT_DIR); fi

#
# \brief Compile.
#
$(PRJ_JAVA_OBJ_DIR)/%.$(PRJ_JAVA_OBJ_EXT): %.$(PRJ_JAVA_CODE_EXT)
	$(JAVAC) $< -cp $(PRJ_JAVA_JAR):$(PRJ_JAVA_OBJ_DIR) \
	-d $(PRJ_JAVA_OBJ_DIR) $(PRJ_JAVA_FLAGS)
# $(JAVAC) $< -cp $(PRJ_JAVA_CLASS_DIR)/$(PRJ_JAVA_JAR) -d $(PRJ_JAVA_OBJ_DIR)

#
# \brief Create object.
#
create_java_obj: prj_java_prepare $(PRJ_JAVA_OBJ_FILE)

#
# \brief Clean object.
#
clean_java_obj:
	$(RM) -f $(PRJ_JAVA_OBJ_FILE)

#
# \brief Install java object.
#
install_java_obj: create_java_obj
	$(CP) -r $(PRJ_JAVA_OBJ_DIR)/$(PRJ_JAVA_PKG) $(PRJ_JAVA_OUT_DIR)
#	$(CP) $(PRJ_JAVA_OBJ_DIR)/*.$(PRJ_JAVA_OBJ_EXT) $(PRJ_JAVA_OUT_DIR)

#
# \brief Run java
#
run_java:
	$(JAVA) -Djava.library.path=$(PRJ_JAVA_LIB_PATH) -cp "./*.jar:." $(PRJ_JAVA_MAIN_CLASS)
