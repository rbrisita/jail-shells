#!/usr/bin/env sh

# Arch Linux

# Remove old folders.
rm -rf bin lib usr

# Get allowed commands.
CMDS=$(which sh)
# 7 dependencies
#[arch@localhost chroot]$ ldd /bin/sh
#        linux-vdso.so.1 (0x0000ffff940e4000)
#        /usr/${LIB}/libgtk3-nocsd.so.0 => /usr/lib/libgtk3-nocsd.so.0 (0x0000ffff93f60000)
#        libreadline.so.8 => /usr/lib/libreadline.so.8 (0x0000ffff93ed0000)
#        libdl.so.2 => /usr/lib/libdl.so.2 (0x0000ffff93eb0000)
#        libc.so.6 => /usr/lib/libc.so.6 (0x0000ffff93d00000)
#        /lib/ld-linux-aarch64.so.1 => /usr/lib/ld-linux-aarch64.so.1 (0x0000ffff940ab000)
#        libpthread.so.0 => /usr/lib/libpthread.so.0 (0x0000ffff93ce0000)
#        libncursesw.so.6 => /usr/lib/libncursesw.so.6 (0x0000ffff93c50000)

# Copy commands.
cp -v --parents $CMDS .

# Copy lib dependencies.
LIST="$(ldd $CMDS | awk '{if ($3 != "") print $3;}' | sort | uniq)"
for i in $LIST; do cp -v --parents "$i" .; done

# /lib/ld-linux-aarch64.so.1
ln -s usr/lib lib

# LIST="$(ldd $CMDS | grep -oP '.*/lib/\K.*\.[0-9]' | sort | uniq)"
# for i in $LIST; do cp -v -L --parents /lib/"$i" .; done
# for i in $LIST; do ls -lah "$i"; done

# libreadline.so.8 needs to be in usr/lib/

# sudo -r chroot . /bin/sh
# unshare -r chroot . /bin/sh
