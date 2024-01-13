#!/usr/bin/env sh

# Debian
# Ubuntu

rm -rf lib usr

# Brace expansion is off by default for POSIX sh in Debian/Ubuntu
CMDS=$(which cat clear cp echo ls mkdir mv rm rmdir sh tac touch)

cp -v --parents $CMDS .

LIST="$(ldd $CMDS | awk '{if (index($1, "/lib/") == 1) print $1; else if ($3 != "") print $3;}' | sort | uniq)"

for i in $LIST; do cp -v --parents "$i" .; done
