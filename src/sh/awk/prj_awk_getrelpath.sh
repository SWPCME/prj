# !bash --posix
################################################################################
# $Id: prj_awk_getrelpath.sh 2018-06 $
#
# Project:  Prj.
# Purpose:  Get relative path with awk.
# Author:   Weiwei Huang, 898687324@qq.com
#
################################################################################
# Copyright (c) 2018-06 ~ 2018 Weiwei Huang
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

key=$1
cur=`pwd`
num=`awk 'BEGIN \
         {\
             n = split("'"${cur}"'", a, /\//); \
             i = 1; \
             while (i <= n) \
             { \
                 if (a[i] == "'"${key}"'") \
                 { \
                     print (n - i); \
                 } \
                 i++; \
             } \
         } \
         ' \
    `
if [ -z ${num} ]; then
    num=0
fi
i=1;
str=
while [ ${i} -le ${num} ]
do
    if [ ! ${i} -eq ${num} ]; then
       str+=`echo "../"`
    else
       str+=`echo ".."`
    fi
    i=`expr ${i} + 1`
done
if [ ${num} -eq 0 ]; then
    str=.
fi
echo ${str}
