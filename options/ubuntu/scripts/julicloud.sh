#!/usr/bin/env bash


# first, go to mycloud and export the share as NFS
# then, uncover the shares with: showmount -e server

# if lsmod | grep nfs does not return 0, you may have updgraded the kernel. reboot.
# you can test this with modprobe nfs

cloud_filipe=~/julicloud/filipe
cloud_eve=~/julicloud/eve
cloud_public=~/julicloud/public

mkdir -p $cloud_filipe
mkdir -p $cloud_eve
mkdir -p $cloud_public

# JULICLOUD=192.168.0.2
JULICLOUD=julicloud

sudo mount $JULICLOUD:/mnt/HD/HD_a2/filipe $cloud_filipe
sudo mount $JULICLOUD:/mnt/HD/HD_a2/Public $cloud_public
sudo mount $JULICLOUD:/mnt/HD/HD_a2/eve $cloud_eve
