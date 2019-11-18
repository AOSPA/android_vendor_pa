function __print_aospa_functions_help() {
cat <<EOF
Additional Paranoid Android functions:
- cout:            Changes directory to out.
- repopick:        Utility to fetch changes from Gerrit.
- gerritremote:    Add git remote for AOSPA Gerrit Review.
- aospremote:      Add git remote for matching AOSP repository.
- cafremote:       Add git remote for matching CodeAurora repository.
- githubremote:    Add git remote for AOSPA Github.
- mka:             Builds using SCHED_BATCH on all processors.
- mkap:            Builds the module(s) using mka and pushes them to the device.
- cmka:            Cleans and builds using mka.
- picklist:        Utility to fetch many changes specified by a picklist.
- repodiff:        Diff 2 different branches or tags within the same repo
- repolastsync:    Prints date and time of last repo sync.
- repopick:        Utility to fetch changes from Gerrit.
EOF
}

function brunch()
{
    breakfast $*

    if [ $? -eq 0 ]; then
        mka bacon
    else
        echo "No such item in brunch menu. Try 'breakfast'"
        return 1
    fi
    return $?
}

function breakfast()
{
    target=$1
    local variant=$2

    if [ $# -eq 0 ]; then
        # No arguments, so let's have the full menu
        lunch
    else
        echo "z$target" | grep -q "-"
        if [ $? -eq 0 ]; then
            # A buildtype was specified, assume a full device name
            lunch $target
        else
            # This is probably just the AOSPA model name
            if [ -z "$variant" ]; then
                variant="userdebug"
            fi

            lunch pa_$target-$variant
        fi
    fi
    return $?
}

alias bib=breakfast

function cout()
{
    if [  "$OUT" ]; then
        cd $OUT
    else
        echo "Couldn't locate out directory.  Try setting OUT."
    fi
}

function gerritremote()
{
    if ! git rev-parse --git-dir &> /dev/null
    then
        echo ".git directory not found. Please run this from the root directory of the Android repository you wish to set up."
        return 1
    fi
    git remote rm aospagerrit 2> /dev/null
    local REMOTE=$(git config --get remote.aospa.projectname)
    local AOSPA="true"
    if [ -z "$REMOTE" ]
    then
        REMOTE=$(git config --get remote.aosp.projectname)
        AOSPA="false"
    fi
    if [ -z "$REMOTE" ]
    then
        REMOTE=$(git config --get remote.caf.projectname)
        AOSPA="false"
    fi

    if [ $AOSPA = "false" ]
    then
        local PROJECT=$(echo $REMOTE | sed -e "s#platform/#android/#g; s#/#_#g")
        local PFX="AOSPA/"
    else
        local PROJECT=$REMOTE
    fi

    local AOSPA_USER=$(git config --get review.gerrit.aospa.co.username)
    if [ -z "$AOSPA_USER" ]
    then
        git remote add aospagerrit ssh://gerrit.aospa.co:29418/$PFX$PROJECT
    else
        git remote add aospagerrit ssh://$AOSPA_USER@gerrit.aospa.co:29418/$PFX$PROJECT
    fi
    echo "Remote 'aospagerrit' created"
}

function aospremote()
{
    if ! git rev-parse --git-dir &> /dev/null
    then
        echo ".git directory not found. Please run this from the root directory of the Android repository you wish to set up."
        return 1
    fi
    git remote rm aosp 2> /dev/null
    local PROJECT=$(pwd -P | sed -e "s#$ANDROID_BUILD_TOP\/##; s#-caf.*##; s#\/default##")
    # Google moved the repo location in Oreo
    if [ $PROJECT = "build/make" ]
    then
        PROJECT="build"
    fi
    if (echo $PROJECT | grep -qv "^device")
    then
        local PFX="platform/"
    fi
    git remote add aosp https://android.googlesource.com/$PFX$PROJECT
    echo "Remote 'aosp' created"
}

function cafremote()
{
    if ! git rev-parse --git-dir &> /dev/null
    then
        echo ".git directory not found. Please run this from the root directory of the Android repository you wish to set up."
        return 1
    fi
    git remote rm caf 2> /dev/null
    local PROJECT=$(pwd -P | sed -e "s#$ANDROID_BUILD_TOP\/##; s#-caf.*##; s#\/default##")
     # Google moved the repo location in Oreo
    if [ $PROJECT = "build/make" ]
    then
        PROJECT="build"
    fi
    if [[ $PROJECT =~ "qcom/opensource" ]];
    then
        PROJECT=$(echo $PROJECT | sed -e "s#qcom\/opensource#qcom-opensource#")
    fi
    if (echo $PROJECT | grep -qv "^device")
    then
        local PFX="platform/"
    fi
    git remote add caf https://source.codeaurora.org/quic/la/$PFX$PROJECT
    echo "Remote 'caf' created"
}

function githubremote()
{
    if ! git rev-parse --git-dir &> /dev/null
    then
        echo ".git directory not found. Please run this from the root directory of the Android repository you wish to set up."
        return 1
    fi
    git remote rm aospa 2> /dev/null
    local REMOTE=$(git config --get remote.caf.projectname)

    if [ -z "$REMOTE" ]
    then
        REMOTE=$(git config --get remote.aospa.projectname)
    fi

    local PROJECT=$(echo $REMOTE | sed -e "s#platform/#android/#g; s#/#_#g")

    if [[ $PROJECT =~ "qcom-opensource" ]];
    then
        PROJECT=$(echo $PROJECT | sed -e "s#qcom-opensource#qcom_opensource#")
    fi

    git remote add aospa https://github.com/AOSPA/$PROJECT
    echo "Remote 'aospa' created"
}

# Make using all available CPUs
function mka() {
    if [ -f $ANDROID_BUILD_TOP/$QTI_BUILDTOOLS_DIR/build/update-vendor-hal-makefiles.sh ]; then
        vendor_hal_script=$ANDROID_BUILD_TOP/$QTI_BUILDTOOLS_DIR/build/update-vendor-hal-makefiles.sh
        source $vendor_hal_script --check
        regen_needed=$?
    else
        vendor_hal_script=$ANDROID_BUILD_TOP/device/qcom/common/vendor_hal_makefile_generator.sh
        regen_needed=1
    fi

    if [ $regen_needed -eq 1 ]; then
        _wrap_build $(get_make_command hidl-gen) hidl-gen ALLOW_MISSING_DEPENDENCIES=true
        RET=$?
        if [ $RET -ne 0 ]; then
            echo -n "${color_failed}#### hidl-gen compilation failed, check above errors"
            echo " ####${color_reset}"
            return $RET
        fi
        source $vendor_hal_script
        RET=$?
        if [ $RET -ne 0 ]; then
            echo -n "${color_failed}#### HAL file .bp generation failed dure to incpomaptible HAL files , please check above error log"
            echo " ####${color_reset}"
            return $RET
        fi
    fi

    m -j "$@"
}

function repolastsync() {
    RLSPATH="$ANDROID_BUILD_TOP/.repo/.repo_fetchtimes.json"
    RLSLOCAL=$(date -d "$(stat -c %z $RLSPATH)" +"%e %b %Y, %T %Z")
    RLSUTC=$(date -d "$(stat -c %z $RLSPATH)" -u +"%e %b %Y, %T %Z")
    echo "Last repo sync: $RLSLOCAL / $RLSUTC"
}

function repopick()
{
    local func=$1
    shift

    adb start-server # Prevent unexpected starting server message from adb get-state in the next line
    if ! _adb_connected; then
        echo "No device is online. Waiting for one..."
        echo "Please connect USB and/or enable USB debugging"
        until _adb_connected; do
            sleep 1
        done
        echo "Device Found."
    fi

    if (adb shell getprop ro.lineage.device | grep -q "$LINEAGE_BUILD") || [ "$FORCE_PUSH" = "true" ];
    then
    # retrieve IP and PORT info if we're using a TCP connection
    TCPIPPORT=$(adb devices \
        | egrep '^(([a-zA-Z0-9]|[a-zA-Z0-9][a-zA-Z0-9\-]*[a-zA-Z0-9])\.)*([A-Za-z0-9]|[A-Za-z0-9][A-Za-z0-9\-]*[A-Za-z0-9]):[0-9]+[^0-9]+' \
        | head -1 | awk '{print $1}')
    adb root &> /dev/null
    sleep 0.3
    if [ -n "$TCPIPPORT" ]
    then
        # adb root just killed our connection
        # so reconnect...
        adb connect "$TCPIPPORT"
    fi
    adb wait-for-device &> /dev/null
    sleep 0.3
    adb remount &> /dev/null

    mkdir -p $OUT
    ($func $*|tee $OUT/.log;return ${PIPESTATUS[0]})
    ret=$?;
    if [ $ret -ne 0 ]; then
        rm -f $OUT/.log;return $ret
    fi

    is_gnu_sed=`sed --version | head -1 | grep -c GNU`

    # Install: <file>
    if [ $is_gnu_sed -gt 0 ]; then
        LOC="$(cat $OUT/.log | sed -r -e 's/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g' -e 's/^\[ {0,2}[0-9]{1,3}% [0-9]{1,6}\/[0-9]{1,6}\] +//' \
            | grep '^Install: ' | cut -d ':' -f 2)"
    else
        LOC="$(cat $OUT/.log | sed -E "s/"$'\E'"\[([0-9]{1,3}((;[0-9]{1,3})*)?)?[m|K]//g" -E "s/^\[ {0,2}[0-9]{1,3}% [0-9]{1,6}\/[0-9]{1,6}\] +//" \
            | grep '^Install: ' | cut -d ':' -f 2)"
    fi

    # Copy: <file>
    if [ $is_gnu_sed -gt 0 ]; then
        LOC="$LOC $(cat $OUT/.log | sed -r -e 's/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g' -e 's/^\[ {0,2}[0-9]{1,3}% [0-9]{1,6}\/[0-9]{1,6}\] +//' \
            | grep '^Copy: ' | cut -d ':' -f 2)"
    else
        LOC="$LOC $(cat $OUT/.log | sed -E "s/"$'\E'"\[([0-9]{1,3}((;[0-9]{1,3})*)?)?[m|K]//g" -E 's/^\[ {0,2}[0-9]{1,3}% [0-9]{1,6}\/[0-9]{1,6}\] +//' \
            | grep '^Copy: ' | cut -d ':' -f 2)"
    fi

    # If any files are going to /data, push an octal file permissions reader to device
    if [ -n "$(echo $LOC | egrep '(^|\s)/data')" ]; then
        CHKPERM="/data/local/tmp/chkfileperm.sh"
(
cat <<'EOF'
#!/system/xbin/sh
FILE=$@
if [ -e $FILE ]; then
    ls -l $FILE | awk '{k=0;for(i=0;i<=8;i++)k+=((substr($1,i+2,1)~/[rwx]/)*2^(8-i));if(k)printf("%0o ",k);print}' | cut -d ' ' -f1
fi
EOF
) > $OUT/.chkfileperm.sh
        echo "Pushing file permissions checker to device"
        adb push $OUT/.chkfileperm.sh $CHKPERM
        adb shell chmod 755 $CHKPERM
        rm -f $OUT/.chkfileperm.sh
    fi

    RELOUT=$(echo $OUT | sed "s#^${ANDROID_BUILD_TOP}/##")

    stop_n_start=false
    for TARGET in $(echo $LOC | tr " " "\n" | sed "s#.*${RELOUT}##" | sort | uniq); do
        # Make sure file is in $OUT/system, $OUT/data, $OUT/odm, $OUT/oem, $OUT/product, $OUT/product_services or $OUT/vendor
        case $TARGET in
            /system/*|/data/*|/odm/*|/oem/*|/product/*|/product_services/*|/vendor/*)
                # Get out file from target (i.e. /system/bin/adb)
                FILE=$OUT$TARGET
            ;;
            *) continue ;;
        esac

        case $TARGET in
            /data/*)
                # fs_config only sets permissions and se labels for files pushed to /system
                if [ -n "$CHKPERM" ]; then
                    OLDPERM=$(adb shell $CHKPERM $TARGET)
                    OLDPERM=$(echo $OLDPERM | tr -d '\r' | tr -d '\n')
                    OLDOWN=$(adb shell ls -al $TARGET | awk '{print $2}')
                    OLDGRP=$(adb shell ls -al $TARGET | awk '{print $3}')
                fi
                echo "Pushing: $TARGET"
                adb push $FILE $TARGET
                if [ -n "$OLDPERM" ]; then
                    echo "Setting file permissions: $OLDPERM, $OLDOWN":"$OLDGRP"
                    adb shell chown "$OLDOWN":"$OLDGRP" $TARGET
                    adb shell chmod "$OLDPERM" $TARGET
                else
                    echo "$TARGET did not exist previously, you should set file permissions manually"
                fi
                adb shell restorecon "$TARGET"
            ;;
            /system/priv-app/SystemUI/SystemUI.apk|/system/framework/*)
                # Only need to stop services once
                if ! $stop_n_start; then
                    adb shell stop
                    stop_n_start=true
                fi
                echo "Pushing: $TARGET"
                adb push $FILE $TARGET
            ;;
            *)
                echo "Pushing: $TARGET"
                adb push $FILE $TARGET
            ;;
        esac
    done
    if [ -n "$CHKPERM" ]; then
        adb shell rm $CHKPERM
    fi
    if $stop_n_start; then
        adb shell start
    fi
    rm -f $OUT/.log
    return 0
    else
        echo "The connected device does not appear to be $LINEAGE_BUILD, run away!"
    fi
}

alias mmp='dopush mm'
alias mmmp='dopush mmm'
alias mmap='dopush mma'
alias mmmap='dopush mmma'
alias mkap='dopush mka'
alias cmkap='dopush cmka'

function picklist() {
    T=$(gettop)
    $T/vendor/pa/build/tools/picklist.py $@
}

function repopick() {
    T=$(gettop)
    $T/vendor/pa/build/tools/repopick.py $@
}
