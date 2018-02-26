# !bash --posix
################################################################################
# $Id: sh_prj_init.sh 2018-01 $
#
# Project:  Prj.
# Purpose:  Initialize.
# Author:   Weiwei Huang, 898687324@qq.com
#
################################################################################
# Copyright (c) 2018-01 ~ 2018 Weiwei Huang
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

# Prj directory.
HOME_DIR=/home/swpcme
PRJ_DIR=${HOME_DIR}/me/usr/share/prj

# Defines.
STR_NULL=""

# Tools.
CD=cd
CP=cp
CP_FLAG=-r
MKDIR=mkdir

function prj_source()
{
    local NAME="${1}"
    local DIR=.
    local MK_FILE=Makefile
    if [ ! -f ${MK_FILE} ]
    then
        ${CP} ${PRJ_DIR}/mk/tmpl/source/prj_sourcectl.mk ${MK_FILE}
        echo "Init build script with ${MK_FILE}."
    else
        echo "Init build script failed, ${MK_FILE} is exist."
    fi

    local OPT_FILE=${DIR}/opt.lst
    if [ ! -f ${OPT_FILE} ]
    then
        ${CP} ${PRJ_DIR}/mk/tmpl/source/opt.lst ${OPT_FILE}
        echo "Init build script with ${OPT_FILE}."
    else
        echo "Init build script failed, ${OPT_FILE} is exist."
    fi

    local OPT_DIR=${DIR}/opt
    if [ ! -d ${OPT_DIR} ]
    then
        ${CP} -r ${PRJ_DIR}/mk/tmpl/source/opt ${OPT_DIR}
        echo "Init build script with ${OPT_DIR}."
    else
        echo "Init build script failed, ${OPT_DIR} is exist."
    fi

    if [ ${NAME} == ${STR_NULL} ]
    then
        echo "Init project without main."
        return 1;
    fi

    local MAIN_DIR=${DIR}/${NAME}
    if [ ! -d ${MAIN_DIR} ]
    then
        ${MKDIR} ${MAIN_DIR}
        ${CD} ${MAIN_DIR}
        prj_source_main
        ${CD} ..
        echo "Init build script with ${MAIN_DIR}."
    else
        echo "Init build script failed, ${MAIN_DIR} is exist."
    fi

    echo "Init project in ${NAME}."
}

function prj_source_main()
{
    local MK_FILE=${1}
    if [ ${MK_FILE} == ${STR_NULL} ]
    then
        MK_FILE=Makefile
    fi

    local MK_DIR=main
    prj_source_sub ${MK_FILE} ${MK_DIR}
}

function prj_source_sub()
{
    local MK_FILE=${1}
    local MK_DIR=${2}
    if [ ${MK_DIR} == ${STR_NULL} ]
    then
        MK_DIR=
    else
        MK_DIR=main
    fi
    if [ ${MK_FILE} == ${STR_NULL} ]
    then
        MK_FILE=Makefile
    fi

    if [ ! -f ${MK_FILE} ]
    then
        ${CP} ${PRJ_DIR}/mk/tmpl/source/${MK_DIR}/Makefile ${MK_FILE}
        echo "Init build script with ${MK_FILE}."
    else
        echo "Init build script failed, ${MK_FILE} is exist."
    fi

    local LST_FILE=file.lst
    if [ ! -f ${LST_FILE} ]
    then
        ${CP} ${PRJ_DIR}/mk/tmpl/source/${MK_DIR}/file.lst ${LST_FILE}
        echo "Init build script with ${LST_FILE}."
    else
        echo "Init build script failed, ${LST_FILE} is exist."
    fi
}

function prj_help()
{
    echo "`basename ${0}`:"
    echo "usage: [--source | -s name]"
    echo "       | [--source-main | -sm file] | [--source-sub | -ss file]"
    exit 1 # Command to come out of the program with status 1
}

option="${1}"
case ${option} in
    --source | -s) prj_source ${2}
                   ;;
    --source-main | -sm) prj_source_main ${2}
                         ;;
    --source-sub | -ss) prj_source_sub ${2}
                        ;;
    *) prj_help
       ;;
esac
