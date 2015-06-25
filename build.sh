#!/bin/bash
# PA5 build helper script

# red = errors, cyan = warnings, green = confirmations, blue = informational
# plain for generic text, bold for titles, reset flag at each end of line
# plain blue should not be used for readability reasons - use plain cyan instead
CLR_RST=$(tput sgr0)                        ## reset flag
CLR_RED=$CLR_RST$(tput setaf 1)             #  red, plain
CLR_GRN=$CLR_RST$(tput setaf 2)             #  green, plain
CLR_BLU=$CLR_RST$(tput setaf 4)             #  blue, plain
CLR_CYA=$CLR_RST$(tput setaf 6)             #  cyan, plain
CLR_BLD=$(tput bold)                        ## bold flag
CLR_BLD_RED=$CLR_RST$CLR_BLD$(tput setaf 1) #  red, bold
CLR_BLD_GRN=$CLR_RST$CLR_BLD$(tput setaf 2) #  green, bold
CLR_BLD_BLU=$CLR_RST$CLR_BLD$(tput setaf 4) #  blue, bold
CLR_BLD_CYA=$CLR_RST$CLR_BLD$(tput setaf 6) #  cyan, bold

# Nuke scrollback
echo -e '\0033\0143'
clear

# Make sure we are running on 64-bit before carrying on with anything
ARCH=$(uname -m | sed 's/x86_//;s/i[3-6]86/32/')
if [ "$ARCH" != "64" ]; then
        echo -e "${CLR_BLD_RED}error: unsupported arch (expected: 64, found: $ARCH)${CLR_RST}"
        exit 1
fi

# Set up paths
cd $(dirname $0)
DIR_ROOT=$(pwd)
DIR_OUT=$(readlink $DIR_ROOT/out)
[ -z "$DIR_OUT" ] && DIR_OUT="$DIR_ROOT/out"

# Make sure everything looks sane so far
if [ ! -d "$DIR_ROOT/vendor/pa" ]; then
        echo -e "${CLR_BLD_RED}error: insane root directory ($DIR_ROOT)${CLR_RST}"
        exit 1
fi

# Pick the default thread count (allow overrides from the environment)
if [ -z "$THREADS" ]; then
        if [ "$(uname -s)" = 'Darwin' ]; then
                export THREADS=$(sysctl -n machdep.cpu.core_count)
        else
                export THREADS=$(cat /proc/cpuinfo | grep '^processor' | wc -l)
        fi
fi

# Pick the best JDK 7, if more than one is installed
if [ "$(update-alternatives --list javac | wc -l)" -gt 1 ]; then
        JDK7_PATH=$(dirname $(update-alternatives --list javac | grep '\-7\-') | tail -n1)
        JRE7_PATH=$(dirname $JDK7_PATH/../jre/bin/java)
        export PATH=$JDK7_PATH:$JRE7_PATH:$PATH
fi

# Grab the build version
VERSION_MAJOR=$(cat $DIR_ROOT/vendor/pa/vendor.mk | grep 'ROM_VERSION_MAJOR := *' | sed 's/ROM_VERSION_MAJOR := //g')
VERSION_MINOR=$(cat $DIR_ROOT/vendor/pa/vendor.mk | grep 'ROM_VERSION_MINOR := *' | sed 's/ROM_VERSION_MINOR := //g')
VERSION_MAINTENANCE=$(cat $DIR_ROOT/vendor/pa/vendor.mk | grep 'ROM_VERSION_MAINTENANCE := *' | sed 's/ROM_VERSION_MAINTENANCE := //g')
VERSION_TAG=$(cat $DIR_ROOT/vendor/pa/vendor.mk | grep 'ROM_VERSION_TAG := *' | sed 's/ROM_VERSION_TAG := //g')

if [ -n "$TAG" ]; then
        VERSION=$VERSION_MAJOR.$VERSION_MINOR$VERSION_MAINTENANCE-$VERSION_TAG
else
        VERSION=$VERSION_MAJOR.$VERSION_MINOR$VERSION_MAINTENANCE
fi

# Grab all the command-line parameters
export DEVICE=$1
shift

if [ -z "$DEVICE" ]; then
        echo -e "${CLR_BLD_RED}Error: no device specified${CLR_RST}"
        echo -e ""
        echo -e "${CLR_BLD_BLU}Usage: $0 <device> <options>${CLR_RST}"
        echo -e ""
        echo -e "${CLR_BLD_BLU}Options:${CLR_RST}"
        echo -e "${CLR_BLD_BLU}  -c, --clean, c, clean    clean build${CLR_RST}"
        echo -e "${CLR_BLD_BLU}  -u, --user, u, user      lunch user build${CLR_RST}"
        echo -e "${CLR_BLD_BLU}  -s, --sync, s, sync      sync sourcecode${CLR_RST}"
        exit 1
fi

while [[ "$#" > 0 ]]; do
        PARAM=$(echo ${1,,})
        case $PARAM in
        -c|--clean|c|clean)
            FLAG_CLEAN_BUILD=y
            ;;
        -u|--user|u|user)
            FLAG_USER_BUILD=y
            ;;
        -s|--sync|s|sync)
            FLAG_SYNC=y
            ;;
        -h|--help|h|help)
            echo -e "${CLR_BLD_BLU}Usage: $0 <device> <options>${CLR_RST}"
            echo -e ""
            echo -e "${CLR_BLD_BLU}Options:${CLR_RST}"
            echo -e "${CLR_BLD_BLU}  -c, --clean, c, clean    clean build${CLR_RST}"
            echo -e "${CLR_BLD_BLU}  -u, --user, u, user      lunch user build${CLR_RST}"
            echo -e "${CLR_BLD_BLU}  -s, --sync, s, sync      sync sourcecode${CLR_RST}"
            exit 1
            ;;
        *)
            echo -e "${CLR_CYA}warning: skipping unknown parameter: $1${CLR_RST}"
            ;;
        esac
        shift
done

# Prep for a clean build, if requested so
if [ "$FLAG_CLEAN_BUILD" = 'y' ]; then
        echo -e "${CLR_BLD_BLU}Cleaning output files left from old builds${CLR_RST}"
        echo -e ""
        rm -rf ${DIR_ROOT}/out/*
fi

# And sync up, if asked to
if [ "$FLAG_SYNC" = 'y' ]; then
        echo -e "${CLR_BLD_BLU}Downloading the latest source files${CLR_RST}"
        echo -e ""
        repo sync -j"$THREADS"
fi

# Enable pre-built Chromium
export USE_PREBUILT_CHROMIUM=1

# Mask Java, if it seems to be faulty
if [ ! -r "$DIR_ROOT/out/versions_checked.mk" ] && [ -n "$(java -version 2>&1 | grep -i openjdk)" ]; then
        echo -e "${CLR_BLD_CYA}Your Java version has not been checked and is a candidate for failure. Masquerading.${CLR_RST}"
        echo -e ""
        JAVA_VERSION="java_version=$(javac -version 2>&1 | head -n1 | cut -f2 -d' ')"
fi

# Check the starting time (of the real build process)
TIME_START=$(date +%s.%N)

# Friendly logging to tell the user everything is working fine is always nice
echo -e "${CLR_BLD_GRN}Building AOSPA $VERSION for $DEVICE${CLR_RST}"
echo -e "${CLR_GRN}Start time: $(date)${CLR_RST}"
echo -e ""

# Initializationizing!
echo -e "${CLR_BLD_BLU}Setting up the environment${CLR_RST}"
echo -e ""
. build/envsetup.sh
echo -e ""

# Lunch-time!
echo -e "${CLR_BLD_BLU}Lunching $DEVICE${CLR_RST} ${CLR_CYA}(Including dependencies sync)${CLR_RST}"
echo -e ""
if [ "$FLAG_USER_BUILD" = 'y' ]; then
        lunch "pa_$DEVICE-user"
else
        lunch "pa_$DEVICE-userdebug"
fi
echo -e ""

# Build away!
echo -e "${CLR_BLD_BLU}Starting compilation${CLR_RST}"
echo -e ""
if [ "$FLAG_USER_BUILD" = 'y' ]; then
        mka dist
else
        mka bacon
fi
echo -e ""

# Check the finishing time
TIME_END=$(date +%s.%N)

# Log those times at the end as a fun fact of the day
echo -e "${CLR_BLD_GRN}Total time elapsed:${CLR_RST} ${CLR_GRN}$(echo "($TIME_END - $TIME_START) / 60" | bc) minutes ($(echo "$TIME_END - $TIME_START" | bc) seconds)${CLR_RST}"
echo -e ""
