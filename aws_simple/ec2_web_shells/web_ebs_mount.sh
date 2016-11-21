#!/bin/bash
/sbin/mkfs.ext4 /dev/xvdf
/bin/mkdir -p /ftp
/bin/cp /etc/fstab /etc/fstab.orig
echo '/dev/xvdf  /ftp  ext4  defaults,nofail 0 0' >> /etc/fstab
/bin/mount -t ext4 /dev/xvdf /ftp
