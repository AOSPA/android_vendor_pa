#!/bin/bash

# Version 2.0.4, Adapted for AOSPA.

# We don't allow scrollback buffer
echo -e '\0033\0143'
clear

# Get current path
DIR="$(cd `dirname $0`; pwd)"

# **Inspired from AOSP** Out directory can be exported by the variable exported by
# the command "export OUT_DIR_COMMON_BASE=/path/to/out/directory" This will make a
# folder in the specified output directory with the name of the source directory.
if [ -z $OUT_DIR_COMMON_BASE];
then
	OUT="$(readlink $DIR/out)"
	[ -z "${OUT}" ] && OUT="${DIR}/out"
else
	OUT=$OUT_DIR_COMMON_BASE
fi

# Prepare output customization commands
red=$(tput setaf 1)             #  red
grn=$(tput setaf 2)             #  green
blu=$(tput setaf 4)             #  blue
cya=$(tput setaf 6)             #  cyan
txtbld=$(tput bold)             # Bold
bldred=${txtbld}$(tput setaf 1) #  red
bldgrn=${txtbld}$(tput setaf 2) #  green
bldblu=${txtbld}$(tput setaf 4) #  blue
bldcya=${txtbld}$(tput setaf 6) #  cyan
txtrst=$(tput sgr0)             # Reset

# Local defaults, can be overriden by environment
: ${PREFS_FROM_SOURCE:="false"}
: ${THREADS:="$(cat /proc/cpuinfo | grep "^processor" | wc -l)"}

# If there is more than one jdk installed, use latest 6.x
function update-alt {
	if [ "`update-alternatives --list javac | wc -l`" -gt 1 ]; then
	        JDK6=$(dirname `update-alternatives --list javac | grep "\-6\-"` | tail -n1)
	        JRE6=$(dirname ${JDK6}/../jre/bin/java)
	        export PATH=${JDK6}:${JRE6}:$PATH
	fi
}

type -P update-alternatives &>/dev/null && update-alt

JVER=$(javac -version  2>&1 | head -n1 | cut -f2 -d' ')

# Import command line parameters
DEVICE="$1"
EXTRAS=("$@")
EXTRAS=(${EXTRAS[@]:1})

# Get build version
MAJOR=$(cat $DIR/vendor/pa/vendor.mk | grep 'ROM_VERSION_MAJOR := *' | sed  's/ROM_VERSION_MAJOR := //g')
MINOR=$(cat $DIR/vendor/pa/vendor.mk | grep 'ROM_VERSION_MINOR := *' | sed  's/ROM_VERSION_MINOR := //g')
MAINTENANCE=$(cat $DIR/vendor/pa/vendor.mk | grep 'ROM_VERSION_MAINTENANCE := *' | sed  's/ROM_VERSION_MAINTENANCE := //g')

VERSION=$MAJOR.$MINOR$MAINTENANCE

# Usage details for the command by sending help in the place of device name
if [ $DEVICE == "help" ]; then
	echo "${bldcya}AOSPA Script for building PA ROM.${txtrst}"
	echo ""
	echo "Usage: ./rom-build.sh [device name] (true/false) (threads N) (clean/cclean)"
	echo ""
	echo ""
	echo "   device name	:   The name of the device. Only Nexus device and OPPO devices are officially supported by PA Team. For other devices try AOSPA-legacy"
	echo "   help		:   Displays this message and exits."
	echo "   true/false	:   Optional. Whether to sync prior to build."
	echo "   threads N	:   Optional. Sync with N threads."
	echo "   clean/cclean	:   Optional. Clean previously formed intermediates and output files."
	echo ""
	echo ""
	echo "Out directory can be exported by the variable exported by the command "export OUT_DIR_COMMON_BASE=/path/to/out/directory" This will make a folder in the specified output directory with the name of the source directory."
	echo "For further details Paranoid Android Google Plus Community: https://plus.google.com/u/0/communities/112514149478109338346, XDA Community: http://forum.xda-developers.com/paranoid-android, github repo: https://github.com/AOSPA. Tutorial to build AOSPA http://forum.xda-developers.com/showthread.php?t=1863547."
	exit 0
fi

# If extra commands are given decide what command to execute prior to build
if [ ! -z $EXTRAS ]; then
	for opt in "${EXTRAS[@]}"
	do
	count=$((count+1))
	case $opt in
		clean|cclean)
			echo -e "${bldblu}Cleaning intermediates and output files${txtrst}"
			export CLEAN_BUILD="true"
	                [ -d $OUT ] & [ "$(ls -A $OUT)" ] && rm -Rf $OUT/*
	        ;;
		threads)
	                THREADS=${myArray[count]}
			echo $THREADS
		;;
# Fetch latest sources
		true)
			echo -e ""
		        echo -e "${bldblu}Fetching latest sources${txtrst}"
		        repo sync -j"$THREADS"
		        echo -e ""	
		;;
	esac
	done
fi

echo -e ""

if [ ! -r "${DIR}/out/versions_checked.mk" ] && [ -n "$(java -version 2>&1 | grep -i openjdk)" ]; then
        echo -e "${bldcya}Your java version still not checked and is candidate to fail, masquerading.${txtrst}"
        JAVA_VERSION="java_version=${JVER}"
fi

if [ -n "${INTERACTIVE}" ]; then
        echo -e "${bldblu}Dropping to interactive shell${txtrst}"
        echo -en "${bldblu}Remeber to lunch you device:"
        if [ "${VENDOR}" == "pa" ]; then
                echo -e "[${bldgrn}lunch pa_$DEVICE-userdebug${bldblu}]${txtrst}"
        else
                echo -e "[${bldgrn}lunch full_$DEVICE-userdebug${bldblu}]${txtrst}"
        fi
        bash --init-file build/envsetup.sh -i
else
        # Setup environment
        echo -e ""
        echo -e "${bldblu}Setting up environment${txtrst}"
        . build/envsetup.sh
        echo -e ""

        # lunch/brunch device
        echo -e "${bldblu}Lunching device [$DEVICE] ${cya}(Includes dependencies sync)${txtrst}"
        export PREFS_FROM_SOURCE
        lunch "pa_$DEVICE-userdebug";

        echo -e "${bldblu}Starting compilation${txtrst}"
        mka bacon
fi
echo -e ""

# Get elapsed time
res2=$(date +%s.%N)
echo -e "${bldgrn}Total time elapsed: ${txtrst}${grn}$(echo "($res2 - $res1) / 60"|bc ) minutes ($(echo "$res2 - $res1"|bc ) seconds)${txtrst}"
