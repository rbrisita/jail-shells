#!/usr/bin/env sh

# Fedora
# FedBerry

rm -rf lib usr

# The cp option combination of: --no-preserve=mode or --parents don't accurately create permissions.
# Creates directory with correct permissions
mkdir -p lib usr/bin

CMDS=$(which --skip-alias sh)

cp -v --parents $CMDS .

LIST="$(ldd $CMDS | awk '{if (index($1, "/lib/") == 1) print $1; else if ($3 != "") print $3;}' | sort | uniq)"
#[fedora@localhost chroot]# ldd /bin/sh
#	linux-vdso.so.1 (0x7efb6000)
#	libtinfo.so.6 => /lib/libtinfo.so.6 (0x76e5d000)
#	libdl.so.2 => /lib/libdl.so.2 (0x76e4a000)
#	libgcc_s.so.1 => /lib/libgcc_s.so.1 (0x76e1d000)
#	libc.so.6 => /lib/libc.so.6 (0x76cd8000)
#	/lib/ld-linux-armhf.so.3 (0x76fad000)

for i in $LIST; do cp -v --parents "$i" .; done
