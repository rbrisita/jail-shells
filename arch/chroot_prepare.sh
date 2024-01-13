#!/usr/bin/env sh

# Arch Linux

rm -rf bin lib usr

# Get allowed commands.
CMDS=$(which cat clear cp echo ls mkdir mv rm rmdir sh tac touch)
# CMDS=$(echo /bin/{cat,clear,cp,ls,man,mkdir,mv,rm,rmdir,sh,tac,touch})
# clear - terminals database is inaccessible
# man - man: can't set the locale; make sure $LC_* and $LANG are correct
# man: can't open the manpath configuration file /etc/man_db.conf
# env, man, set, shopt are for testing

# Copy commands.
cp -v --parents $CMDS .

# Copy lib dependencies.
LIST="$(ldd $CMDS | awk '{if ($3 != "") print $3;}' | sort | uniq)"
for i in $LIST; do cp -v --parents "$i" .; done

ln -s usr/lib lib
