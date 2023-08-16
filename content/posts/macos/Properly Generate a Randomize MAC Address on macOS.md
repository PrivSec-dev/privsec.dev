---
title: "Properly Generate a Randomized MAC Address on macOS"
date: 2023-08-16
tags: ['macOS', 'Privacy']
author: Tommy
---

Unlike iOS, macOS does not have an easy way to randomize the MAC address. To work around this, various guides recommended several ways to create a randomized MAC address and apply it to the system during runtime. Unfortunately, most of the instructions do not have a proper threat model in mind and will end up making you stick out more from the crowd.