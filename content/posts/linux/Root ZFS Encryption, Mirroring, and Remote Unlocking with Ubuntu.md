---
title: "Root ZFS Encryption, Mirroring, and Remote Unlocking on Ubuntu"
tags: ['Operating Systems', 'Linux', 'Security']
date: 2023-07-26
author: Tommy
---

While Unbutu supports ZFS on root filesystems with an easy snapshot and rollback mechanism called ZSYS, ZSYS is [soon going to be deprecated](https://bugs.launchpad.net/ubuntu/+source/ubiquity/+bug/1966773) and the installer does not offer an easy way to setup mirroring. In this guide, I will walk you through how to set up Ubuntu with root on ZFS, mirroring with both the root and EFI partitions, and remote unlocking + boot into a snapshot with ZFSBootMenu.

![ZFSBootMenu](/images/zfsbootmenu.png)

## Partitioning the Disk

Esentially, we need a 512MB ESP partition for ZFSBootMenu and a `/` partition for the rest of the system. If you are using a single disk, just make those 2 partitions on your disk. If you are planning to do mirroring, set up both on of these partitions on each disk.

There are a variety of tools you can use, but an easy to use one would be `cfdisk`.

```bash
cfdisk /dev/nvme0n1
cfdisk /dev/nvme0n2
```

![cfdisk](/images/cfdisk.png)

## Mirroring the ESP partition

__Skip this if you are not doing mirroring__

While the EFI specs do not support `mdadm`, we can setup mdadm with metadata v1.0, which will be put at the end of the parition and allows it to boot.

```bash
mdadm --create /dev/md0 --level 1 --raid-disks --metadata 1.0 /dev/nvme0n1p1 /dev/nvme0n1p2
```