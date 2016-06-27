#!/bin/bash
dd if=/dev/zero of=root.bin bs=1M count=64
mkfs.ext2 -F root.bin
mkdir mnt
sudo mount -o loop root.bin mnt
cd mnt
sudo mkdir -p bin etc dev lib proc sbin sys tmp usr usr/bin \
usr/lib usr/sbin
cd ..
sudo cp busybox mnt/bin
sudo cp ../inittab mnt/etc/inittab
sudo ln -s ../bin/busybox mnt/sbin/init
sudo umount mnt

