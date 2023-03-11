---
title: "Do Not Use chroot as root for Application Sandboxing"
date: 2023-03-08
tags: ['Operating Systems', 'Linux', 'Privacy', 'Security']
author: Tommy
---

When searching for "chroot" on YouTube, the top video that shows up is one from Rob Braxman. In the video, Braxman recommends using chroot to run untrusted applications, and he does so as the root user. Unfortunately, this does absolutely nothing positive for security and in fact makes it trivial for malware to have full system compromise.

The video in question:

{{< youtube id="2wSJREC7RV8">}}

## Unprivileged Malware

On traditional Linux systems, when a user executes an application without sandboxing it (which is often the case), the application will have as much privileges as the user. It can view all of the files the user has access to, do whatever the user can do, and so on. However, short of an operating system exploit and vulnerable/insecure system daemons, it cannot elevate itself to root and compromise the actual system or other users.

## chroot

Remember: chroot is meant to provide an easy to to setup an environment for binaries to execute. It is **not** a security feature.

## Trivial chroot Escape

For a root process as shown in the video, escaping the chroot is as trivial as calling the chdir system call a few times on .. (the parent directory) to get to the actual root.

## Sandboxing

## Comparison to Containers

A typical container is better isolated from the host than a chroot "jail". While still interacting directly with the host kernel in most cases,