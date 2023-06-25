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

Note that I am recommending UTM here over other solutions like [Parallels](https://www.parallels.com/) here, specifically for the [Emulated VLAN](https://docs.getutm.app/settings-qemu/devices/network/network/#network-mode) network setup. Parallels only supports the [Shared Network mode](https://kb.parallels.com/4948) where all VMs and the host are connected to the same VLAN, which is less that ideal considering that we will still communicate with our Linux server using the insecure NTP protocol. I have not tried VMWare Fusion or VirtualBox yet, but the general idea is that you should be connecting to the NTP server using a private interface which only the host and the target VM have access to. Another nice thing about UTM is that it is a [sandboxed](https://developer.apple.com/documentation/xcode/configuring-the-macos-app-sandbox/) application and runs without any special privileges.

## Choosing your Linux distribution

Generally, any distribution with `chrony` 4.0 or above would work fine. I recommend using Fedora since it is easy to manage, generally up to date,  and has mostly sane defaults.

You download Fedora Server from their [official website](https://fedoraproject.org/server/download/).

## Setting up the VM

Next, create your Linux VM in UTM. Make sure that you use the QEMU backend (as opposed to Apple Virtualization), set the Network Mode to Emulated VLAN, and port forward port 123/UDP and 22/TCP.

![macOS NTP Port Forwarding](/images/macos-ntp-port-forwarding.png)

Optionally, you can also:
* Set the CPU allocation to 2 vCPUs. The NTP server does not need access to all of your performance cores.
* Reduce the allocated Memory to 2048. This is a fairly lightweight server.
* Enable memory ballooning.
* Use local time for base clock.

Next, install your operating system. If you are using Fedora, I recommend going with the "Minimal Install" option.

## Post operating system installation

Once the operating system is installed, shut down the VM. Remove "USB Drive" from your VM configuration to ensure that you have the correct boot order.

You can also remove other unncessary features from the VM for attack surface reduction:

* Disable USB support
* Disable Clipboard sharing
* Delete the display device (we will run the server headless)
* Delete the audio device

Start the VM, then SSH into it via `127.0.0.1`:

```bash
ssh 127.0.0.1
```

Update the OS:

```bash
#This is an example for Fedora:
sudo dnf upgrade -y
```

You can also consider installing the `qemu-guest-agent`. It will help against insane clocks caused by snapshotting and rolling back if UTM implements these features in the future.

```bash
#This is an example for Fedora:
sudo dnf install qemu-guest-agent -y
```

If your operating system comes with `systemd-timesyncd` instead of `chrony` by default (as is the case with Ubuntu and Arch Linux), disable it and replace it with `chrony`. Fedora users can skip this step, since it already uses `chrony` by default.

```bash
#This is an example for Ubuntu:
sudo systemctl disable --now systemd-timesyncd
sudo apt purge -y systemd-timesyncd
sudo apt install -y chrony
sudo systemctl enable --now chronyd
```

## Configuring chronyd

Next, configure `chronyd` to use NTS. On Fedora, the configuration file is `/etc/chrony.conf`. We will use [GrapheneOS's configuration](https://github.com/GrapheneOS/infrastructure/blob/main/chrony.conf) as a reference.

Your configuration should look something like this:

```
server time.cloudflare.com iburst nts
server ntppool1.time.nl iburst nts
server nts.netnod.se iburst nts
server ptbtime1.ptb.de iburst nts

minsources 2
authselectmode require

driftfile /var/lib/chrony/drift
ntsdumpdir /var/lib/chrony

leapsectz right/UTC
makestep 1.0 3

rtconutc
rtcsync

cmdport 0

allow 10.0.2.2/32
```

Explanations:

We get our time from 4 different sources:

`
server time.cloudflare.com iburst nts
server ntppool1.time.nl iburst nts
server nts.netnod.se iburst nts
server ptbtime1.ptb.de iburst nts
`

Should there be a discrepancy, a time change will only happen if at least 2 sources agree on it:

`minsources 2`

Finally, we add this line to the configuration file to allow macOS to get time from it:

`allow 10.0.2.2/32`.

