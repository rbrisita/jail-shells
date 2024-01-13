#!/usr/bin/env sh

# Gentoo

rm -rf lib lib64 usr

CMDS=$(which sh)

cp -v --parents $CMDS .

LIST="$(ldd $CMDS | awk '{if (index($1, "/lib/") == 1) print $1; else if ($3 != "") print $3;}' | sort | uniq)"
#gentoo@pi64 ~/projects/chroot $ ldd /bin/sh
#        linux-vdso.so.1 (0x0000007fb9d93000)
#        libreadline.so.8 => /lib64/libreadline.so.8 (0x0000007fb9bf6000)
#        libtinfo.so.6 => /lib64/libtinfo.so.6 (0x0000007fb9baa000)
#        libc.so.6 => /lib64/libc.so.6 (0x0000007fb9a41000)
#        /lib/ld-linux-aarch64.so.1 => /lib64/ld-linux-aarch64.so.1 (0x0000007fb9d63000)
#        libtinfow.so.6 => /lib64/libtinfow.so.6 (0x0000007fb99f4000)

for i in $LIST; do cp -v --parents "$i" .; done

#unshare -r chroot . /usr/bin/sh
