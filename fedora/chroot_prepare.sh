#!/usr/bin/env sh

# Fedora
# FedBerry

rm -rf lib usr

# The cp option combination of: --no-preserve=mode or --parents don't accurately create permissions.
# Creates directory with correct permissions
mkdir -p lib usr/bin

CMDS=$(which --skip-alias cat clear cp echo ls mkdir mv rm rmdir sh tac touch)

cp -v --parents $CMDS .

LIST="$(ldd $CMDS | awk '{if (index($1, "/lib/") == 1) print $1; else if ($3 != "") print $3;}' | sort | uniq)"

for i in $LIST; do cp -v --parents "$i" .; done
