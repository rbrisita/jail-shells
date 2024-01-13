#!/usr/bin/env sh

# Debian
# Ubuntu

rm -rf lib usr

CMDS=$(which sh)

cp -v --parents $CMDS .

LIST="$(ldd $CMDS | awk '{if (index($1, "/lib/") == 1) print $1; else if ($3 != "") print $3;}' | sort | uniq)"
# AARCH64
#ubuntu@ubuntu-desktop:~/projects/chroot$ ldd /bin/sh
#        linux-vdso.so.1 (0x0000ffff8ffe0000)
#        libc.so.6 => /lib/aarch64-linux-gnu/libc.so.6 (0x0000ffff8fdee000)
#        /lib/ld-linux-aarch64.so.1 (0x0000ffff8ffad000)

# ARMHF
# pi@raspberrypi:~/projects/chroot $ ldd /bin/sh
#         linux-vdso.so.1 (0x7eff7000)
#         /usr/lib/arm-linux-gnueabihf/libarmmem-${PLATFORM}.so => /usr/lib/arm-linux-gnueabihf/libarmmem-v7l.so (0x76f2d000)
#         libc.so.6 => /lib/arm-linux-gnueabihf/libc.so.6 (0x76dcb000)
#         /lib/ld-linux-armhf.so.3 (0x76f42000)


for i in $LIST; do cp -v --parents "$i" .; done

#unshare -r chroot . /usr/bin/sh
