#!/bin/bash
# Script to update all dependencies at once

# Grep and replace
grep -rl $1 products/ | xargs sed -i "s/$1/$2/g"

# We're done
echo -e "Replaced $1 with $2"

