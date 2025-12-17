---
title: "Setting up DM-Integrity"
date: 2025-06-03
tags: ['Operating Systems', 'Linux', 'Security',]
author: Purpleseaotter
---

### Introduction

---

DM-Integrity is a Linux kernel device-mapper target that provides block-level data integrity checking. This is to detect unauthorized changes or corruption on a block device. Unlike encryption, dm-integrity ensures data hasn’t been tampered with. When paired with LUKS, which uses dm-crypt for encryption, it can enhance security by adding authenticated encryption to combine confidentiality and integrity.

### Limitations

---

However dm-integrity is limited to only protecting the data when it is at rest, any data written to the disk when the dm-integrity target is active (meaning the system has booted) will be picked up by dm-integrity and written immediately without validation.

Another limitation of dm-integrity is it's inability to prevent rollback attacks. Imagine this scenario, someone steals your disk today, `February 24th 2025`. Now the attacker in `March 13th 2027` knows that there was a critical CVE in the OpenSSH daemon that allows unauthenticated remote code execution that was discovered a month prior, he can simply revert the disk of the victim, and when the non suspecting system boots their machine. The attacker can gain immediate access to the victim's machine because the old image still contains the vulnerable OpenSSH daemon version. Dm-integrity will happily verify that old data because it has been at rest, not corrupted or tampered with.

The cryptsetup developer Milan Broz has made it clear [that the discard option for ssd trimming is not supported in AEAD mode](https://gitlab.com/cryptsetup/cryptsetup/-/issues/420).

### Setup

---

When you're setting up your Arch Linux machine and you want to make use of dm-integrity, set up your system as normal until you reach the step where you are required to set up your crypto disk, and use this cryptsetup command:

```bash
cryptsetup luksFormat --type luks2 /dev/sdX --integrity hmac-sha256 --sector-size 4096
```

We are setting a sane default of using hmac-sha256 for the integrity checking. Alternatively if you have very weak hardware that would struggle with hmac-sha256, you can also use crc32c. However this is non cryptographic and probably significantly weaker.

When pacstrapping the system make sure you add in the cryptsetup package to install LUKS and by extension dm-integrity. The following command is a minimal base install example of what that would look like:

```bash
pacstrap /mnt base linux linux-firmware sudo efibootmgr nano cryptsetup
```

When setting up a crypto disk with LUKS and dm-integrity make sure you don't forget to include the `encrypt` hook before `filesystems` in `/etc/mkinitcpio.conf`. You do not need to include a seperate hook for dm-integrity alone.

The following steps are for Debian and Fedora, they both require a manual installation which can be done using a bootstrapping tool. For Debian this is `debootstrap` and on Fedora you can simply use `dnf`.

For Debian I the steps are the same, apart from the fact you specifically need to load the `dm-integrity` and `dm-bufio` modules in `/etc/initramfs-tools/modules`. Just make sure to bootstrap your system correctly using `debootstrap`. An example would be this:

```bash
debootstrap --variant=minbase stable /mnt/debian-minbase http://deb.debian.org/debian/
```

If you want to install Fedora you will also have to bootstrap the system manually using `dnf`. You will have to load the module in the initramfs in `/etc/dracut.conf.d/dm-integrity.conf` and add `add_drivers+=" dm-integrity "`. An example for the DNF command would be:

```bash
dnf --releasever=41 --installroot=/mnt/fedora groupinstall core
```

For additional information you should read other blog posts or instruction videos because bootstrapping a Linux distro is out of scope for this blog post.