# !bash --posix
################################################################################
# $Id: prj_init.sh 2018-06 $
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
AUTOGEN=autogen

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
    prj_source_cfg_amg_create ${MK_DIR} ${OPT}
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

function prj_source_git()
{
    local OPT=${1}
    if [[ ${OPT} == ${STR_NULL} ]]
    then
        OPT=clone
    fi

    local MK_DIR=git
    prj_source_cfg_create ${MK_DIR} ${OPT}
}

function prj_source_cfg_amg_create()
{
    local MK_DIR=${1}
    local OPT=${2}
    local MK_SRC_DIR=${PRJ_DIR}/amg/prj/mk/tmpl/source/${MK_DIR}
    local MK_MAKEFILE=${MK_SRC_DIR}/Makefile
    local MK_SRC_MAIN_TPL=${MK_SRC_DIR}/${MK_DIR}_${OPT}_mk.tpl
    local MK_SRC_MAIN_DEF=${MK_SRC_DIR}/${MK_DIR}_${OPT}_mk.def
    local MK_DST_MAIN=Makefile
    local MK_SRC_LIST_TPL=${MK_SRC_DIR}/${MK_DIR}_${OPT}_lst.tpl
    local MK_SRC_LIST_DEF=${MK_SRC_DIR}/${MK_DIR}_${OPT}_lst.def
    local MK_DST_LIST=file.lst

    if [[ ${MK_DIR} == ${STR_NULL} ]]
    then
        MK_DIR=cxx
    fi

    if [[ ${OPT} == ${STR_NULL} ]]
    then
        OPT=main
    fi

    prj_amg_cmd ${MK_SRC_MAIN_TPL} ${MK_SRC_MAIN_DEF} ${MK_DST_MAIN}
    prj_amg_cmd ${MK_SRC_LIST_TPL} ${MK_SRC_LIST_DEF} ${MK_DST_LIST}
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
           echo "Init build script failed, please check the option."
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
           echo "Init build script failed, please check the option."
        fi
    else
        echo "Init build script failed, ${MK_DST_LIST} is exist."
    fi
}

function prj_amg()
{
    local AMG=$1
    local NAME=$2
    local TYPE=$3

    if [ -z ${AMG} ]; then
        return -1
    fi

    if [ -z ${NAME} ]; then
        return -1
    fi

    if [ ${AMG} = "tpl" ]; then
        if [ -z ${TYPE} ]; then
            return -1
        fi
    fi

    prj_amg_create ${AMG} ${NAME} ${TYPE}

    return 1
}

function prj_amg_create()
{
    local AMG=$1
    local NAME=$2
    local TYPE=$3
    local SUB=

    if [ ${AMG} = "tpl" ]; then
        AMG=amg
        SUB=tpl
    fi

    if [ ${AMG} = "def" ]; then
        AMG=amg
        SUB=def
    fi

    case ${TYPE} in
        cxx) TYPE="c++"
             ;;
        sh) TYPE="shell-script"
            ;;
        mk) TYPE="makefile"
            ;;
        def) TYPE="conf"
             ;;
        *)
            ;;
    esac

    local MK_SRC_DIR=${PRJ_DIR}/amg/prj/mk/tmpl/amg/${AMG}
    local TPL=${MK_SRC_DIR}/${AMG}_${SUB}main.tpl
    local DEF=${MK_SRC_DIR}/${AMG}_${SUB}main.def

    prj_amg_cmd ${TPL} ${DEF} ${NAME} ${TYPE}
}

function prj_amg_cmd()
{
    local TPL=${1}
    local DEF=${2}
    local DST=${3}
    local TYPE=${4}

    if [ ! -f ${TPL} ]; then
        echo "The file of ${TPL} is not exist";
        return -1;
    fi

    if [ ! -f ${DEF} ]; then
        echo "The file of ${DEF} is not exist";
        return -1;
    fi

    if [ -f ${DST} ]; then
        echo "The file of ${DST} is exist";
        return -1;
    fi

    DST_DIR=`dirname ${DST}`
    DST_BASE=`basename ${DST}`

    # change directory.
    ${CD} ${DST_DIR};
    echo "Go to ${DST_DIR}"

    IFS="." read -r -a dst_array <<< "${DST_BASE}"

    local DST_NAME=${dst_array[0]}
    local DST_SUFFIX=${dst_array[1]}

    if [ -z ${DST_SUFFIX} ]; then
       DST_SUFFIX="\ "
    fi

    ${AUTOGEN} -T ${TPL} --definitions=${DEF} -b ${DST_NAME} -o ${DST_SUFFIX} \
               --writable

    # Add file name.
    sed -i "s/ \$Id: / \$Id: ${DST_BASE} /" ${DST_BASE}

    # change the type
    if [ ! -z ${TYPE} ]; then
        sed -i "s/\-\*\- mode: conf \-\*\-/\-\*\- mode: ${TYPE} \-\*\-/" ${DST_BASE}
    fi

    # return to original directory.
    ${CD} -
    echo "Return to work directory."
}

function prj_help()
{
    echo "`basename ${0}`:"
    echo ""
    echo "usage1: [--source | -s name]"
    echo "       | [--source_amg | -s_amg main]"
    echo "       | [--source_cxx | -s_cxx bin|lib|obj]"
    echo "       | [--source_pyc | -s_pyc main]"
    echo "       | [--source_tex | -s_tex main]"
    echo "       | [--source_git | -s_git clone]"
    echo ""
    echo "usage2: [--amg | -g AMG_NAME] [--type | -t TYPE_NAME] \
[--output | -o NAME]"
    echo ""
    echo "options:"
    echo "    AMG_NAME/TYPE_NAME: tpl, def, cxx, mk, sh"
    exit 1 # Command to come out of the program with status 1
}

function prj_main()
{
    local ARG_AMG=
    local ARG_AMG_TYPE=
    local ARG_AMG_OUTPUT=
    if [ -z "$1" ]; then
        prj_help
    fi

    while :; do
        case ${1} in
            --source | -s) prj_source ${2}
                           shift
                           ;;
            --source_amg | -s_amg) prj_source_amg ${2}
                                   shift
                                   ;;
            --source_cxx | -s_cxx) prj_source_cxx ${2}
                                   shift
                                   ;;
            --source_pyc | -s_pyc) prj_source_pyc ${2}
                                   shift
                                   ;;
            --source_tex | -s_tex) prj_source_tex ${2}
                                   shift
                                   ;;
            --source_git | -s_git) prj_source_git ${2}
                                   shift
                                   ;;
            --amg | -g) AMG=${2}
                        shift
                        ;;
            --type | -t) TYPE=${2}
                         shift
                         ;;
            --output | -o) NAME=${2}
                           shift
                           ;;
            *)
               break
               ;;
        esac

        shift
    done

    prj_amg ${AMG} ${NAME} ${TYPE}

    return 0
}

# main function
prj_main $@
