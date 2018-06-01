# !bash --posix
################################################################################
# $Id: git.sh 2018-04 $
#
# Project:  PRJ.
# Purpose:  Git fetch.
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
DEPTH=0

if [ ! -f ${SOURCE_DIR} ]; then
   mkdir -pv ${SOURCE_DIR}
fi

cd ${SOURCE_DIR}

if [ ! -f .git ]; then
   git init
fi

if [ ${depth} -eq 0 ]; then
    DEPTH_FLAG= --depth ${DEPTH}
else
    DEPTH_FLAG=
fi

git fetch ${DEPTH_FLAG} ${REMOTE_SRV}
git remote add origin ${REMOTE_SRV}

if [ ${depth} -eq 0 ]; then
    exit 0
fi

COUNT_REC=-1
COUNT=0
while ((${COUNT_REC} != ${COUNT}))
do
    git fetch --depth ${DEPTH}
    ${COUNT_REC}=${COUNT}
    COUNT=`git rev-list --count --all`
    let ++${DEPTH}
done
