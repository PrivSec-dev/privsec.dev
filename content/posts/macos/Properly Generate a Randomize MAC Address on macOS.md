---
title: "Properly Generate a Randomized MAC Address on macOS"
date: 2023-08-16
tags: ['macOS', 'Privacy']
author: Tommy
---

Unlike iOS, macOS does not have an easy way to randomize the MAC address. To work around this, various guides recommended several ways to create a randomized MAC address and apply it to the system during runtime. Unfortunately, most of the instructions do not have a proper threat model in mind and will end up making you stick out more from the crowd.

![Standing Out](/images/standing-out.png)

### The Threat Model

Consider the following:
- macOS does not support MAC address randomization by default
- Most if not all macOS computers around you will use their real MAC address with Apple's OUI (the first 3 octets of your MAC address)
- You cannot hide that you are using a mac (because of your hostname, connections to Apple's servers, etc)

Randomizing the mac address only makes sense if you use a not-very-unique hostname (like Macbook-Pro), and that you only randomize the last 3 octets of your MAC address so that you actually look like a new Macbook on the network.

### Improper instructions

Unfortunately, most of the guides I could find recommends randomizing the entire MAC address instead of the final 3 octets. Take the guides recommending `macchanger` for example, they fail to mention that the program does [this](https://github.com/acrogenesis/macchanger/blob/main/bin/macchanger#L37):

```ruby
[format('%0.2x', rand(256) & ~1), (1..5).map { format('%0.2x', rand(256)) }].join(':')
```

Or this snippet from PrivacyGuides:

![PrivacyGuides macOS MAC Randomization](/images/privacyguides-macos-mac-randomization.png) 

These will give you completely randomized MAC addresses, which is not what we want.

### Doing it the Proper Way

First, you need to get the name of your network interface and its MAC address. You can check this with

```bash
ifconfig
```

In most cases, your interface will be `en0`, the Wifi network interface on modern Macbooks.

