---
title: "Secure Time Synchronization on macOS"
date: 2023-06-25
tags: ['macOS', 'Security']
author: Tommy
---

![macOS NTP](/images/macos-ntp.png)

macOS by default uses the unencrypted and unauthenticated Network Time Protocol (NTP) for time synchronization. A popular solution to mitigate problem this is to use [ChronyControl](https://whatroute.net/chronycontrol.html) to setup NTS. However, the application requires administrator privileges, which less than ideal.

In this post, I will go over how you leverage virtualization to setup a local Linux server, update its time using NTS, and synchronize your macOS host with it using NTP, all without needing a privileged application.

## Installing UTM

The virtualization software we are going for this setup is [UTM](https://mac.getutm.app/). You can obtain it through [App Store](https://apps.apple.com/us/app/utm-virtual-machines/id1538878817) for $10 USD or directly through [GitHub](https://github.com/utmapp/UTM/releases) free of charge.

Personally, I would recommend using the App Store, since you are getting automatic updates with it, and a small donation would really help out the developers.

Note that I am recommending UTM here over other solutions like [Parallels](https://www.parallels.com/) here, specifically for the [Emulated VLAN](https://docs.getutm.app/settings-qemu/devices/network/network/#network-mode) network setup. Parallels only supports the [Shared Network mode](https://kb.parallels.com/4948) where all VMs and the host are connected to the same VLAN, which is less that ideal considering that we will still communicate with our Linux server using the insecure NTP protocol. I have not tried VMWare Solution or Virtualbox yet, but the general idea is that you should be connecting to the NTP server using a private interface which only the host and the target VM have access to. Another nice thing with UTM is that it is a [sandboxed](https://developer.apple.com/documentation/xcode/configuring-the-macos-app-sandbox/) application and runs without any special privileges.

