---
title: "Secure Time Synchronization on macOS"
date: 2023-06-25
tags: ['macOS', 'Security']
author: Tommy
---

![macOS NTP](/images/macos-ntp.png)

macOS by default uses the unencrypted and unauthenticated Network Time Protocol (NTP) for time synchronization. A popular solution to mitigate problem this is to use [ChronyControl](https://whatroute.net/chronycontrol.html) to setup NTS. However, the application requires administrator privileges, which less than ideal.

In this post, I will go over how you can setup NTS without needing a privileged application on your system by leveraging virtualization.

## UTM

