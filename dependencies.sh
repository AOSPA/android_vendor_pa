#!/bin/bash
# PA dependency updater script
set -e

OLD_TAG=$1
if [ -n "$OLD_TAG" ]; then OLD_TAG=$(basename $OLD_TAG); fi

NEW_TAG=$2
if [ -n "$NEW_TAG" ]; then NEW_TAG=$(basename $NEW_TAG); fi

if [ -z "$OLD_TAG" ] || [ -z "$NEW_TAG" ]; then
        echo "usage: $0 <old-tag> <new-tag>"
        exit 1
fi

FOUND_TAG=0

echo "Replacing '$OLD_TAG' with '$NEW_TAG'.."

for FILE in $(grep -rl $OLD_TAG products/*/pa.dependencies); do
        if [ $FOUND_TAG -eq 0 ]; then FOUND_TAG=1; fi
        echo "    in $FILE"
        sed -i "s/$OLD_TAG/$NEW_TAG/g" "$FILE"
done

if [ $FOUND_TAG -eq 0 ]; then echo "    found nothing to replace"; fi

echo "Done."
