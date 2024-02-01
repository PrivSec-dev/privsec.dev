---
title: "Using TPM unlock with Proxmox Encryption"
date: 2024-02-01
tags: ['Operating Systems', 'Linux', 'Security']
author: Tommy
---

# Using TPM unlock with Proxmox Encryption

Currently, the Proxmox installer does not support setting up encryption with ZFS. Previously, I have written on how to setup Proxmox with native ZFS encryption and remote unlock with Dropbear. Today, I will guide you through the process of setting it up with TPM unlock and Secure Boot.

By the end of this guide, you will have:
- Secure Boot setup with your custom key and Unified Kernel Image
- Autheticated Drive Encryption (AEAD)
- Automatic unlock and *some* tamper detection with the TPM

Limitations:
- No rollback protection. This could theoratically be solved with [PCR Oracle](https://github.com/okirch/pcr-oracle), though I have not looked into it in depth yet. I will update this guide in the future when I have figured it out :)
- This is not proper verified boot. At best, it prevents someone from just replace your kernel/initramfs and compromise your system, but it will not provide any protection against malware persistence and so on.
- The TPM is fully trusted. An adversary will be able to decrypt your drive if they can get the internal state of the TPM, such as with the [FaulTPM](https://arxiv.org/pdf/2304.14717.pdf) vulnerability.
- This procedure will only work if you have at least 2 drives to setup mirroring.

## The Design

There is currently no nice solution for unlocking native ZFS encryption with a TPM. While theoratically possible, the tooling for it does not exist as of this writing, to my knowledge. ZFS on LUKS will work with TPM unlock (via `systemd-cryptenroll`), but is suboptimal as ZFS will not get direct access to the disk.

To get the best of both worlds, we will set up a ZFS encryption partition with LUKS for Proxmox itself. After the system has booted, we will unlock and mount a second ZFS partition encrypted with native ZFS encryption using a key stored inside the ZFS partiton encrypted with LUKS. This way, we can get TPM unlock and use it to provide some basic tamper detection, while still allowing ZFS direct access to the disk for where the virtual machines are stored and achieve optimal performance.

UEFI Firmware -> Signed UKI --(TPM Unlock)--> PVE partition (ZFS on LUKS) -> VM storage (Native ZFS Encryption)

## Proxmox Installation

### Disable Secure Boot

Disable Secure Boot before installing Proxmox. By default, Proxmox installs with Grub, Shim, and MOKUtil etc if Secure Boot is enabled. It is just easier to not have to clean them up later.

### Select your RAID level

- Boot into the installation media. Select the filesystem as ZFS with a RAID level of your choice. I will be using ZFS Mirror for the rest of this guide.

- In advanced configuration, reduce the `hdsize`. Proxmox on its own only takes up about 5-6 GB of storage, and I do not intend to store anything else like ISO files on it, so I will set the size as 32GB (the extra space is to account for future updates).

## Setup LUKS Encryption

This section is covered on [Oblivious Observer's Blog](https://oblivious.observer/posts/proxmoxve6-zfs-luks-systemdboot-dropbear/). We will adjust the commands a bit to include AEAD and update the instructions to be more inline with Proxmox 8.

### Setup repositories

Run the following commands:

```bash
curl https://raw.githubusercontent.com/TommyTran732/Linux-Setup-Scripts/main/etc/apt/apt.conf.d/99sane-upgrades | sudo tee /etc/apt/apt.conf.d/99sane-upgrades
chmod 644 /etc/apt/apt.conf.d/99sane-upgrades
sed -i '1 {s/^/#/}' /etc/apt/sources.list.d/pve-enterprise.list
echo 'deb https://deb.debian.org/debian/ bookworm main contrib non-free non-free-firmware
deb http://deb.debian.org/debian-security/ bookworm-security main contrib non-free non-free-firmware
deb https://deb.debian.org/debian/ bookworm-updates main contrib non-free non-free-firmware
deb https://deb.debian.org/debian/ bookworm-backports main contrib non-free non-free-firmware
deb http://download.proxmox.com/debian/pve bookworm pve-no-subscription' | tee /etc/apt/sources.list
echo 'deb http://download.proxmox.com/debian/ceph-quincy bookworm no-subscription' | tee /etc/apt/sources.list.d/ceph.list
```

### Upgrade packages

```bash
apt update
apt full-upgrade
```

### Install cryptsetup

```bash
apt install cryptsetup
```

