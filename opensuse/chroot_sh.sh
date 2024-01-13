#!/usr/bin/env sh

# OpenSUSE

rm -rf lib lib64 usr

CMDS=$(which sh)

cp -v --parents $CMDS .

LIST="$(ldd $CMDS | awk '{if (index($1, "/lib/") == 1) print $1; else if ($3 != "") print $3;}' | sort | uniq)"
#opensuse@localhost:~/projects/chroot> ldd /bin/sh
#   linux-vdso.so.1 (0x0000ffffa8f82000)
#	libreadline.so.7 => /lib64/libreadline.so.7 (0x0000ffffa8dcd000)
#	libdl.so.2 => /lib64/libdl.so.2 (0x0000ffffa8dac000)
#	libc.so.6 => /lib64/libc.so.6 (0x0000ffffa8c26000)
#	/lib/ld-linux-aarch64.so.1 (0x0000ffffa8f54000)
#	libtinfo.so.6 => /lib64/libtinfo.so.6 (0x0000ffffa8bdd000)

for i in $LIST; do cp -v --parents "$i" .; done

#unshare -r chroot . /usr/bin/sh
