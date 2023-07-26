---
title: "Root ZFS Encryption, Mirroring, and Remote Unlocking on Ubuntu"
tags: ['Operating Systems', 'Linux', 'Security']
date: 2023-07-26
author: Tommy
---

While Unbutu supports ZFS on root filesystems with an easy snapshot and rollback mechanism called ZSYS, ZSYS is [soon going to be deprecated](https://bugs.launchpad.net/ubuntu/+source/ubiquity/+bug/1966773) and the installer does not offer an easy way to setup mirroring. In this guide, I will walk you through how to set up Ubuntu with root on ZFS, mirroring with both the root and EFI partitions, and remote unlocking + boot into a snapshot with ZFSBootMenu.

![ZFSBootMenu](/images/zfsbootmenu.png)