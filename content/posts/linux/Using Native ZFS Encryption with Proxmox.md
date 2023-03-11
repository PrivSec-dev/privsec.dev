---
title: "Using Native ZFS Encryption with Proxmox"
date: 2023-03-11
tags: ['Operating Systems', 'Linux', 'Security']
author: Tommy
---

Currently, the Proxmox installer does not support setting up encryption with ZFS. Thus, we have to set it up manually. This post will go over how to use the native ZFS encryption with Proxmox.

_The post also assumes that the Proxmox installation is new and does not have any virtual machines or containers yet._

![Proxmox ZFS Encryption](/images/proxmox-zfs-encryption.png)

## Encrypting the `rpool/ROOT` dataset

Proxmox installs its system inside of the `rpool/ROOT` dataset. This is what we will encrypt first.

First, boot into the initramfs. On the startup menu, press `e` to edit the boot argument. Remove `boot=zfs` and the kernel from the argument and press `enter`.

Load in the `zfs` kernel module:

```sh
modprobe zfs
```

Next, follow [this gist](https://gist.github.com/yvesh/ae77a68414484c8c79da03c4a4f6fd55) to encrypt the dataset. You do not need to use any sort of live USB or rescue mode, as the initramfs has all what we need. For your convenience, I will copy and paste it here:

```sh
# Import the old
zpool import -f rpool

# Make a snapshot of the current one
zfs snapshot -r rpool/ROOT@copy

# Send the snapshot to a temporary root
zfs send -R rpool/ROOT@copy | zfs receive rpool/copyroot

# Destroy the old unencrypted root
zfs destroy -r rpool/ROOT

# Create a new zfs root, with encryption turned on
# OR -o encryption=aes-256-gcm - aes-256-ccm vs aes-256-gcm
zfs create -o encryption=on -o keyformat=passphrase rpool/ROOT

# Copy the files from the copy to the new encrypted zfs root
zfs send -R rpool/copyroot/pve-1@copy | zfs receive -o encryption=on rpool/ROOT/pve-1

# Set the Mountpoint
zfs set mountpoint=/ rpool/ROOT/pve-1

# Export the pool again, so you can boot from it
zpool export rpool
```

Reboot into the system. You should now be prompted for an encryption password.

## Encrypting the `rpool/data` dataset

Next, we need to encrypt the `rpool/data` dataset. This is where Proxmox stores virtual machine disks.

Note that the encryption key will be stored inside of the `rpool/ROOT` dataset. Since `rpool/ROOT` is already encrypted, we can safely store it there. The key also has to be exactly 32 bytes.


```bash
# Destroy the original dataset
zfs destroy -r rpool/data

# Create a new encryption key
dd if=/dev/urandom bs=32 count=1 of=/.data.key

# Set the approprieate permission
chmod 400 /.data.key

# Make the key immutable
chattr +i /.data.key

# Create a new dataset with encryption enabled
zfs create -o encryption=on -o keylocation=file:///.data.key -o keyformat=raw rpool/data
```

Next, we need to setup a systemd service for automatic unlocking. Put the following inside of `/etc/systemd/system/zfs-load-key.service`

```
[Unit]
Description=Load encryption keys
DefaultDependencies=no
After=zfs-import.target
Before=zfs-mount.service

[Service]
Type=oneshot
RemainAfterExit=yes
ExecStart=/usr/sbin/zfs load-key -a

[Install]
WantedBy=zfs-mount.service
```

Finally, enable the service:

```bash
systemctl enable zfs-load-key
```

## Setting Dropbear for remote unlocking (optional)

It is not always convenient to type in the encryption password on the console. You might want to setup Dropbear inside of the initramfs to unlock the drive over SSH instead.

First, install the `dropbear` package. Note that we are passing the `--no-install-recommends` argument here, as we don't want it to install `cryptsetup` and give annoying warnings on every initramfs generation.

```bash
apt install --no-install-recommends dropbear
```

Next, create `/etc/dropbear/authorized_keys` and put your ssh keys in there.

You may also edit `/etc/dropbear/config` and adjust it however you like. You can find the list of the options [here](https://linux.die.net/man/8/dropbear). In my opinion, the default is good enough. Some other blog posts may recommend that you change the port to avoid the ssh fingerprint mismatch warning, but I would recommend just using a different subdomain to connect to dropbear instead. That way, you can pin Dropbear's fingerprint with SSHFP records. I will write a seperate post on this later.

Then, edit the `/etc/initramfs-tools/initramfs.conf` and add the static IP address for it to use. The format is

```
IP=IP Address::Gateway:Netmask:Hostname
```

For example:

```
IP=10.0.0.1::10.0.0.254:255.255.255.0:dropbear.node.domain.tld
```

One thing to keep in mind is that I have found only IPv4 to be working with this on Debian. If you figure out how to get IPv6 to work, please [let me know](https://tommytran.io/contact).

Finally, generate a new initramfs:

```bash
update-initramfs -u
```

You should now be able to ssh into your Dropbear upon reboot. Use `zfsunlock` to unlock the `rpool/ROOT` dataset :)

![Dropbear with Proxmox ZFS](/images/dropbear-proxmox-zfs.png)
