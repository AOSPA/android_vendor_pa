function __print_aospa_functions_help() {
cat <<EOF
Additional Paranoid Android functions:
- repopick:        Utility to fetch changes from Gerrit.
- gerritremote:    Add git remote for AOSPA Gerrit Review.
- cafmerge:        Utility to merge CAF tags.
EOF
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

function repopick()
{
    T=$(gettop)
    $T/vendor/aospa/build/tools/repopick.py $@
}

function cafmerge()
{
    target_branch=$1
    set_stuff_for_environment
    T=$(gettop)
    python3 $T/vendor/aospa/build/tools/merge-caf.py $target_branch
}

export SKIP_ABI_CHECKS="true"
