################################################################################
# $Id: prj_diffutarget.mk 2018-05 $
#
# Project:  Prj.
# Purpose:  Diffutils target.
# Author:   Weiwei Huang, 898687324@qq.com
#
################################################################################
# Copyright (c) 2018-05 ~ 2018 Weiwei Huang
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

# Prepare.
prj_diffu_prepare:

# Keep extra old lines and instead of old lines with new lines.
# keo: keep extra old lines; ion: instead of old lines with new lines.
# prj_diffu_keo_ion:
# 	$(PRJ_DIFFU_DIFF) --changed-group-format='%>' --old-group-format='%<' \
# 	$(PRJ_DIFFU_FILE_OLD) $(PRJ_DIFFU_FILE_NEW) > $(PRJ_DIFFU_FILE_OUT)

# prj_diffu_diff:
# 	$(CD) $(PRJ_DIFFU_PATH_DIFF); $(PRJ_DIFF) $(PRJ_DIFFU_DIFF_FLAG) \
# 	$(PRJ_DIFFU_FILE_OLD) $(PRJ_DIFFU_FILE_NEW) > $(PRJ_DIFFU_FILE_DIFF)

# prj_diffu_apply_diff: prj_diffu_diff
# 	$(PRJ_DIFFU) $(PRJ_DIFFU_FLAG) < \
# 	$(PRJ_DIFFU_PATH_DIFF)/$(PRJ_DIFFU_FILE_DIFF)
