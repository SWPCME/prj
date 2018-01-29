# !bash --posix
################################################################################
# $Id: build.sh 2017-10 $
#
# Project:  Gdal.
# Purpose:  Build.
# Author:   Weiwei Huang, 898687324@qq.com
#
################################################################################
# Copyright (c) 2017-10 ~ 2017 Weiwei Huang
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

NAME=gdal
VERSION=2_2_3
TARGET=x86_64-pc-linux-gnu
HOST=${TARGET}
SOURCE_DIR=/home/swpcme/file/source/func
CATEGORY_DIR=sci/libs
WORK_DIR=${SOURCE_DIR}/${CATEGORY_DIR}/${NAME}
BUILD_DIR=${WORK_DIR}/build/${TARGET}/${VERSION}
#BUILD_DIR=${WORK_DIR}/source/${VERSION}/${NAME}
PREFIX=${WORK_DIR}/install/${TARGET}/${VERSION}
CMAKE_DIR=${WORK_DIR}/build/cmake

MKDIR=mkdir
MKDIR_FLAG=-p
CD=cd
MAKE=make

# GNU Autotool
CONFIGURE="../../../source/${VERSION}/${NAME}/configure"
CONFIGURE_FLAG="--host=${HOST} --target=${TARGET} --prefix=${PREFIX}"
# CMake
CMAKE=cmake
# For cross-compile: 
#CMAKE_CROSS=-DCMAKE_TOOLCHAIN_FILE=${CMAKE_DIR}/${TARGET}.cmake
CMAKE_CROSS=
CMAKE_FLAG="${CMAKE_CROSS}\
            -DCMAKE_INSTALL_PREFIX=${PREFIX} \
            -B. -H${WORK_DIR}/source/${VERSION}/${NAME}"

if [ ! -d ${PREFIX} ]; then
    ${MKDIR} ${MKDIR_FLAG} ${PREFIX};
fi

if [ ! -d ${BUILD_DIR} ]; then
    ${MKDIR} ${MKDIR_FLAG} ${BUILD_DIR};
fi

${CD} ${BUILD_DIR}
${CONFIGURE} ${CONFIGURE_FLAG}
# ${CMAKE} ${CMAKE_FLAG}

${MAKE} 
${MAKE} install
${MAKE} help
