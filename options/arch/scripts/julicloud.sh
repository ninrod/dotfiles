#!/usr/bin/env bash


# first, go to mycloud and export the share as NFS
# then, uncover the shares with: showmount -e server

# if lsmod | grep nfs does not return 0, you may have updgraded the kernel. reboot.
# you can test this with modprobe nfs

sudo mount julicloud:/mnt/HD/HD_a2/filipe /mnt/julicloud

