---
title: "Root ZFS Encryption, Mirroring, and Remote Unlocking on Ubuntu"
tags: ['Operating Systems', 'Linux', 'Security']
date: 2023-07-26
author: Tommy
---

While Unbutu supports ZFS on root filesystems with an easy snapshot and rollback mechanism called ZSYS, ZSYS is [soon going to be deprecated](https://bugs.launchpad.net/ubuntu/+source/ubiquity/+bug/1966773) and the installer does not offer an easy way to setup mirroring. In this guide, I will walk you through how to set up Ubuntu with root on ZFS, mirroring with both the root and EFI partitions, and remote unlocking + boot into a snapshot with ZFSBootMenu.

![ZFSBootMenu](/images/zfsbootmenu.png)

## Enter the Shell

Enter the shell on your Ubuntu Installer:



## Partitioning the Disk

Esentially, we need a 512MB ESP partition for ZFSBootMenu and a `/` partition for the rest of the system. If you are using a single disk, just make those 2 partitions on your disk. If you are planning to do mirroring, set up both on of these partitions on each disk.

There are a variety of tools you can use, but an easy to use one would be `cfdisk`.

```bash
cfdisk /dev/nvme0n1
cfdisk /dev/nvme0n2
```

![cfdisk](/images/cfdisk.png)

## Mirroring the ESP partition

_Skip this if you are not doing mirroring_

While the EFI specs do not support `mdadm`, we can setup mdadm with metadata v1.0, which will be put at the end of the parition and allows it to boot.

```bash
mdadm --create /dev/md0 --level 1 --raid-disks --metadata 1.0 /dev/nvme0n1p1 /dev/nvme0n1p2
mkfs.fat -F 32 /dev/md0
```

## Setup the ZFS partition

This part is mostly based on the [official ZFSBootMenu guide](https://docs.zfsbootmenu.org/en/v2.2.x/guides/ubuntu/uefi.html) with some changes to work around some not-so-great instructions there.

### Creating the zpool

#### Getting the Disk ID.

First, we must get the disk IDs from `/dev/disk/by-id`. The official guide uses the dynamically assigned drive identifier (`/dev/sda`, `/dev/nvme0n1`, etc), which is not what we want to do with zpools, since it will cause problems later on.

![/dev/disk/by-id](/images/disk-by-id.png)

#### Installing ZFS-Utils

```bash
sudo apt install zfsutils-linux -y
```

#### Create the encryption key

```bash
echo 'SomeKeyphrase' > /etc/zfs/zroot.key
chmod 000 /etc/zfs/zroot.key
```

#### For Non-Mirrored Setups

```bash
sudo zpool create -o ashift=12 -O compression=zstd -O acltype=posixacl -O xattr=sa -O atime=off -O encryption=on -O keylocation=file:///etc/zfs/zroot.key -O keyformat=passphrase -o autotrim=on -m none zroot /dev/disk/by-id/nvme-SAMSUNG_MZQL21T9HCJR-00A07_XXXXXXX-part2 
```

#### For Mirrored Setups

```bash
zpool create  -o ashift=12  -O compression=zstd  -O acltype=posixacl  -O xattr=sa  -O atime=off  -O encryption=on  -O keylocation=file:///etc/zfs/zroot.key  -O keyformat=passphrase  -o autotrim=on  -m none zroot mirror /dev/disk/by-id/nvme-SAMSUNG_MZQL21T9HCJR-00A07_XXXXXXX-part2 /dev/disk/by-id/nvme-SAMSUNG_MZQL21T9HCJR-00A07_YYYYYYY-part2
```