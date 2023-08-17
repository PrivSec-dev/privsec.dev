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

#### Notes

We use slightly different options than the official guide. Most notably, `atime` is disabled as it has detrimental effect on performance and unnecessarily increases write operations. `compression` is changed from `lz4` to `zstd` as it has much better compression ratio than `lz4` while still maintaining good performance. We did not specify the encryption type here as `aes-256-gcm` is already the default with openZFS >= 0.8.4.

### Creating the filesystems

```bash
zfs create -o mountpoint=none zroot/ROOT
zfs create -o mountpoint=/ -o canmount=noauto zroot/ROOT/ubuntu
zfs create -o mountpoint=/home zroot/home
zfs create -o mountpoint=/var/log zroot/ROOT/ubuntu/log
zfs create -o mountpoint=/var/spool zroot/ROOT/ubuntu/spool
zfs create -o mountpoint=/var/cache zroot/ROOT/ubuntu/cache

zpool set bootfs=zroot/ROOT/ubuntu zroot
```

Here, we deviate from the official guide by splitting out `/var/log`, `/var/spool`, `/var/cache` out into their own datasets. These are directories which are parts of Ubuntu that we do not want to be rolled back along with the system in case we need to boot into a prior snapshot.

If you plan to dual boot with a different system and have shared directory dataset, then you need to make sure that dataset is not under `zroot/ROOT`. `zroot/home` is an example of this.

### Mounting the filesystem

```bash
zpool export zroot
zpool import -N -R /mnt zroot
zfs load-key -L prompt zroot
zfs mount zroot/ROOT/ubuntu
zfs mount zroot/ROOT/ubuntu/log
zfs mount zroot/ROOT/ubuntu/cache
zfs mount zroot/ROOT/ubuntu/spool
zfs mount zroot/home
```

### Update device symlink

```bash
udevadm trigger
```

## Install Ubuntu

We will deviate from the ZFSBootMenu's documentation here, as it only installs a minimal system with SysVinit. Instead, we can install ubuntu-server-minimal.

### Bootstrapping

```bash
zgenhostid -f 0x00bab10c
apt install -y debootstrap
debootstrap jammy /mnt
```

### Copy files into the new install

```bash
cp /etc/hostid /mnt/etc/hostid
cp /etc/resolv.conf /mnt/etc/
mkdir /mnt/etc/zfs
cp /etc/zfs/zroot.key /mnt/etc/zfs
```

### Chroot into the new OS

```bash
mount -t proc proc /mnt/proc
mount -t sysfs sys /mnt/sys
mount -B /dev /mnt/dev
mount -t devpts pts /mnt/dev/pts
chroot /mnt /bin/bash
```

### Setup the repositories

```bash
cat <<EOF > /etc/apt/sources.list
# Uncomment the deb-src entries if you need source packages

deb http://archive.ubuntu.com/ubuntu/ jammy main restricted universe multiverse
deb http://archive.ubuntu.com/ubuntu/ jammy-security main restricted universe multiverse
deb http://archive.ubuntu.com/ubuntu/ jammy-updates main restricted universe multiverse
deb http://archive.ubuntu.com/ubuntu/ jammy-backports main restricted universe multiverse
#deb http://archive.canonical.com/ubuntu/ jammy partner
EOF
```

### Install the necessary packages

```bash
apt update
apt install --no-install-recommends linux-generic ubuntu-server-minimal
```

### Configure packages to customize local and console properties

```bash
dpkg-reconfigure locales tzdata keyboard-configuration console-setup
```

## ZFS Configuration

### Install required packages

```bash
apt install dosfstools zfs-initramfs zfsutils-linux
```

### Enable systemd ZFS services

```bash
systemctl enable zfs.target
systemctl enable zfs-import-cache
systemctl enable zfs-mount
systemctl enable zfs-import.target
```

### Configure `initramfs-tools`

```bash
echo "UMASK=0077" > /etc/initramfs-tools/conf.d/umask.conf
```

### Rebuild the initramfs

```bash
update-initramfs -c -k all
```

## Install and configure ZFSBootMenu

### Setup the EFI partition

If you are doing mirroring:

```bash
zfs set org.zfsbootmenu:commandline="quiet loglevel=4" zroot/ROOT
zfs set org.zfsbootmenu:keysource="zroot/ROOT/ubuntu" zroot

cat << EOF >> /etc/fstab
$( blkid | grep /dev/md0 | cut -d ' ' -f 2 ) /boot/efi vfat defaults 0 0
EOF

mkdir -p /boot/efi
mount /boot/efi
```

If you are not, just replace `md0` in the commands above with your efi partition.

### Install ZFSBootMenu

#### To use it without remote unlocking, just follow the official guide:

```
apt install curl -y
mkdir -p /boot/efi/EFI/ZBM
curl -o /boot/efi/EFI/ZBM/VMLINUZ.EFI -L https://get.zfsbootmenu.org/efi
cp /boot/efi/EFI/ZBM/VMLINUZ.EFI /boot/efi/EFI/ZBM/VMLINUZ-BACKUP.EFI
```

#### To use it with remote unlocking, you have to compile the package:

```bash
git clone https://github.com/dracut-crypt-ssh/dracut-crypt-ssh
apt install -y blah blah blah dependency here I forgot
some build command here
echo 'omit_dracutmodules+=" crypt-ssh "' >> /etc/dracut-config-location-idk
mkdir -p /etc/dropbear
ssh-keygen -t rsa -m PEM -f /etc/dropbear/ssh_host_rsa_key
ssh-keygen -t ecdsa -m PEM -f /etc/dropbear/ssh_host_ecdsa_key
mkdir -p /etc/cmdline.d
echo "ip=dhcp rd.neednet=1" > /etc/cmdline.d/dracut-network.conf

cat <<EOF > /etc/zfsbootmenu/dracut.conf.d/dropbear.conf
# Enable dropbear ssh server and pull in network configuration args
add_dracutmodules+=" crypt-ssh "
install_optional_items+=" /etc/cmdline.d/dracut-network.conf "
# Copy system keys for consistent access
dropbear_rsa_key=/etc/dropbear/ssh_host_rsa_key
dropbear_ecdsa_key=/etc/dropbear/ssh_host_ecdsa_key
# User zbmuser is the authorized unlocker here
dropbear_acl=/home/zbmuser/.ssh/authorized_keys
EOF
```

### Configure EFI boot entries

```bash
mount -t efivarfs efivarfs /sys/firmware/efi/efivars
apt install efibootmgr -y

efibootmgr -c -d "/dev/nvme0n1" -p 1 \
  -L "ZFSBootMenu" \
  -l \\EFI\\ZBM\\VMLINUZ.EFI

efibootmgr -c -d /dev/nvme0n1 -p 1 \
  -L "ZFSBootMenu (Backup)" \
  -l \\EFI\\ZBM\\VMLINUZ-BACKUP.EFI

### Skip this section if you are not doing mirroring

efibootmgr -c -d "/dev/nvme0n2" -p 1 \
  -L "ZFSBootMenu 2" \
  -l \\EFI\\ZBM\\VMLINUZ.EFI

efibootmgr -c -d /dev/nvme0n2 -p 1 \
  -L "ZFSBootMenu 2 (Backup)" \
  -l \\EFI\\ZBM\\VMLINUZ-BACKUP.EFI

```

### Exit the environment
```
exit
umount -n -R /mnt
zpool export zroot
reboot
```