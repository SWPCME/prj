# !bash --posix
################################################################################
# $Id: prj_init.sh 2018-03 $
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

function prj_source_amg()
{
    local OPT=${1}
    if [[ ${OPT} == ${STR_NULL} ]]
    then
        OPT=main
    fi

    local MK_DIR=amg
    prj_source_cfg_create ${MK_DIR} ${OPT}
}

function prj_source_cxx()
{
    local OPT=${1}
    if [[ ${OPT} == ${STR_NULL} ]]
    then
        OPT=lib
    fi

    local MK_DIR=cxx
    prj_source_cfg_create ${MK_DIR} ${OPT}
}

function prj_source_pyc()
{
    local OPT=${1}
    if [[ ${OPT} == ${STR_NULL} ]]
    then
        OPT=main
    fi

    local MK_DIR=pyc
    prj_source_cfg_create ${MK_DIR} ${OPT}
}

function prj_source_tex()
{
    local OPT=${1}
    if [[ ${OPT} == ${STR_NULL} ]]
    then
        OPT=main
    fi

    local MK_DIR=tex
    prj_source_cfg_create ${MK_DIR} ${OPT}
}

function prj_source_cfg_create()
{
    local MK_DIR=${1}
    local OPT=${2}
    local MK_SRC_FILE=${PRJ_DIR}/mk/tmpl/source/${MK_DIR}/${MK_DIR}_${OPT}.mk
    local MK_DST_FILE=Makefile
    local MK_SRC_LIST=${PRJ_DIR}/mk/tmpl/source/${MK_DIR}/${MK_DIR}_${OPT}.lst
    local MK_DST_LIST=file.lst

    if [[ ${MK_DIR} == ${STR_NULL} ]]
    then
        MK_DIR=cxx
    fi

    if [[ ${OPT} == ${STR_NULL} ]]
    then
        OPT=main
    fi

    if [ ! -f ${MK_DST_FILE} ]
    then
        if [ -f ${MK_SRC_FILE} ]
        then
           ${CP} ${MK_SRC_FILE} ${MK_DST_FILE}
           echo "Init build script with ${MK_DST_FILE}."
        else
           echo "Init build script failed, please the option"
        fi
    else
        echo "Init build script failed, ${MK_DST_FILE} is exist."
    fi

    if [ ! -f ${MK_DST_LIST} ]
    then
        if [ -f ${MK_SRC_LIST} ]
        then
           ${CP} ${MK_SRC_LIST} ${MK_DST_LIST}
           echo "Init build script with ${MK_DST_LIST}."
        else
           echo "Init build script failed, please the option"
        fi
    else
        echo "Init build script failed, ${MK_DST_LIST} is exist."
    fi
}

function prj_help()
{
    echo "`basename ${0}`:"
    echo "usage: [--source | -s name]"
    echo "       | [--source_amg | -s_amg main]"
    echo "       | [--source_cxx | -s_cxx bin|lib|obj]"
    echo "       | [--source_pyc | -s_pyc main]"
    echo "       | [--source_tex | -s_tex main]"
    exit 1 # Command to come out of the program with status 1
}

option="${1}"
case ${option} in
    --source | -s) prj_source ${2}
                   ;;
    --source_amg | -s_amg) prj_source_amg ${2}
                           ;;
    --source_cxx | -s_cxx) prj_source_cxx ${2}
                           ;;
    --source_pyc | -s_pyc) prj_source_pyc ${2}
                           ;;
    --source_tex | -s_tex) prj_source_tex ${2}
                           ;;
    *) prj_help
       ;;
esac