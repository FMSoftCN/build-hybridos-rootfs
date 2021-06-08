#!/bin/bash
#
# Copyright (C) 2021 Beijing FMSoft Technologies Co., Ltd.
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#    http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LUNCH_MENU_CHOICES=""

function gettop
{
    local TOPFILE=build/envsetup.sh
    if [ -n "$BUILD_HYBRIDOS_ROOTFS_TOP" -a -f "$BUILD_HYBRIDOS_ROOTFS_TOP/$TOPFILE" ] ; then
        # The following circumlocution ensures we remove symlinks from TOP.
        (\cd $BUILD_HYBRIDOS_ROOTFS_TOP; PWD= /bin/pwd)
    else
        if [ -f $TOPFILE ] ; then
            # The following circumlocution (repeated below as well) ensures
            # that we record the true directory name and not one that is
            # faked up with symlink names.
            PWD= /bin/pwd
        else
            local here="${PWD}"
            while [ "${here}" != "/" ]; do
                if [ -f "${here}/${TOPFILE}" ]; then
                    (\cd ${here}; PWD= /bin/pwd)
                    break
                fi
                here="$(dirname ${here})"
            done
        fi
    fi
}

function print_lunch_menu()
{
    local uname=$(uname)
    echo
    echo "You're building on" $uname
    echo
    echo "Lunch menu... pick a combo:"


    local i=1
    local choice
    for choice in ${LUNCH_MENU_CHOICES[@]}
    do
        echo "     $i. $choice"
        i=$(($i+1))
    done
    echo
}

function lunch()
{
    # get last platfrom as default platform
    local T="$(gettop)"
    local last
    if [ -f "$T/.config" ]; then
        last="$(sed -n -r '/BR2_DEFCONFIG/{s:.*/(.*)_defconfig":\1:;p;q}' ${T}/.config)"
    fi

    # select platform
    local select
    if [ "$1" ] ; then
        select=$1
    else
        print_lunch_menu
        echo -n "Which would you like?"
        [ -n "${last}" ] && echo -n " [Default ${last}]"
        echo -n ": "
        read select
    fi

    if [ -z "${select}" ]; then
        select="${last}"
    elif (echo -n $select | grep -q -e "^[0-9][0-9]*$"); then
        [ $select -le ${#LUNCH_MENU_CHOICES[@]} ] \
            && select=${LUNCH_MENU_CHOICES[$(($select-1))]}
    else
        select="$select"
    fi

    BUILD_HYBRIDOS_ROOTFS_TARGET_DEFCONFIG="${select}_defconfig"
    if [ ! -f "$T/configs/${BUILD_HYBRIDOS_ROOTFS_TARGET_DEFCONFIG}" ]; then
        echo "Invalid lunch : $select" >&2
        return 1
    fi

    export BUILD_HYBRIDOS_ROOTFS_TARGET_DEFCONFIG
#    export BUILD_HYBRIDOS_ROOTFS_TARGET_DIR_NAME=${select}
	export BUILD_HYBRIDOS_ROOTFS_TARGET_OUTPUT_DIR="$BUILD_HYBRIDOS_ROOTFS_OUTPUT_DIR"

	echo "==========================================="
	echo
	echo "BUILD_HYBRIDOS_ROOTFS_TOP=${BUILD_HYBRIDOS_ROOTFS_TOP}"
	echo "BUILD_HYBRIDOS_ROOTFS_TARGET_OUTPUT_DIR=${BUILD_HYBRIDOS_ROOTFS_TARGET_OUTPUT_DIR}"
	echo "BUILD_HYBRIDOS_ROOTFS_TARGET_DEFCONFIG=${BUILD_HYBRIDOS_ROOTFS_TARGET_DEFCONFIG}"
	echo
	echo "==========================================="

	make -C ${BUILD_HYBRIDOS_ROOTFS_TOP} O="${BUILD_HYBRIDOS_ROOTFS_TARGET_OUTPUT_DIR}" ${BUILD_HYBRIDOS_ROOTFS_TARGET_DEFCONFIG}
}

function envsetup
{
    unset BUILD_HYBRIDOS_ROOTFS_TOP
    unset BUILD_HYBRIDOS_ROOTFS_OUTPUT_DIR
    unset BUILD_HYBRIDOS_ROOTFS_TARGET_DEFCONFIG
    unset BUILD_HYBRIDOS_ROOTFS_TARGET_DIR_NAME
	unset BUILD_HYBRIDOS_ROOTFS_TARGET_OUTPUT_DIR
    if [ "x$SHELL" != "x/bin/bash" ]; then
        case `ps -o command -p $$` in
            *bash*)
                ;;
            *)
                echo -n "WARNING: Only bash is supported, "
                echo "use of other shell would lead to erroneous results"
                ;;
        esac
    fi

    # check top of SDK
    if [ ! -f "${PWD}/build/envsetup.sh" ]; then
        echo "ERROR: Please source envsetup.sh in the root of build-hybridos-rootfs"
        return -1
    fi

    BUILD_HYBRIDOS_ROOTFS_TOP="$(PWD= /bin/pwd)"
    BUILD_HYBRIDOS_ROOTFS_OUTPUT_DIR=${BUILD_HYBRIDOS_ROOTFS_TOP}/output

    if [ ! -d "${BUILD_HYBRIDOS_ROOTFS_TOP}/configs/" ]; then
        echo "ERROR: not found directory: ${BUILD_HYBRIDOS_ROOTFS_TOP}/configs/"
        return -1;
    fi

	LUNCH_MENU_CHOICES=(
		$(cd ${BUILD_HYBRIDOS_ROOTFS_TOP}/configs/; ls | \
			sed "s/_defconfig$//" | grep "$1" | sort)
	)

	LUNCH_MENU_CHOICES_LEN=${#LUNCH_MENU_CHOICES[@]}

	if [ $LUNCH_MENU_CHOICES_LEN -eq 0 ]; then
		echo No available configs${1:+" for: $1"}
		return
	fi

    export BUILD_HYBRIDOS_ROOTFS_TOP
    export BUILD_HYBRIDOS_ROOTFS_OUTPUT_DIR

    echo "Setup env done! Please run lunch next."
}

#### MAIN ####
envsetup
