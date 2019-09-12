#!/bin/bash

IMAGE=/mnt/storage/vms/qemu/VirtualMachines/winxp.qcow2
NBDEV=/dev/nbd0
IMAGE_PART=p1
MOUNT_POINT=/mnt/storage/vms/qemu/VirtualMachines/nbd_mnt

# See if nbd module is loaded:
lsmod | grep nbd
if [[ ${?} != 0 ]] ; then
    # Load nbd module:
    sudo modprobe nbd max_part=8
fi

# See if ${NBDEV} is already mounted:
mount | grep ${NBDEV}${IMAGE_PART}
if [[ ${?} != 0 ]] ; then
    # Connect qcow image as a network block device and mount it.
    sudo qemu-nbd --connect=${NBDEV} ${IMAGE}
    sudo mount ${NBDEV}${IMAGE_PART} ${MOUNT_POINT}
else
    # already mounted; unmount it and disconnect the nbd.
    sudo umount ${NBDEV}${IMAGE_PART}
    sudo qemu-nbd --disconnect /dev/nbd0
fi


# To start the VM use
# sudo qemu-system-i386 winxp.qcow2 -m 1024 -cpu pentium3 \
#                       -usb -usbdevice tablet -alt-grab -enable-kvm
