---
title: "Using Lokinet on Qubes OS"
date: 2022-07-27
tags: ['Applications', 'Qubes OS', 'Anonymity', 'Privacy']
author: Tommy
---

![Lokinet](/images/lokinet.png)

[Lokinet](https://lokinet.org) is an Internet overlay network utilizing onion routing to provide anonymity for its users, similar to Tor network. This post will go over how to set it up on Qubes OS.

**Before we start...**

This post should not be considered an endorsement of Lokinet in any shape or form. Lokinet is currently not in a good state --- it has not had a public release since 2022, and most free public exit nodes have gone offline. According to the developers, they are doing major rewrites of the code, and it should not be used in production at the moment.

## Creating the TemplateVM

Currently, the Lokinet client seems to work well with only Debian-based distributions. This means that our template will have to be one of the Debian-based ones. Personally, I use [this script](https://github.com/TommyTran732/QubesOS-Scripts/blob/main/debian-gnome/debian-gnome.sh) to trim down the Debian GNOME template and convert it to Kicksecure. Kicksecure reduces the attack surface of Debian with a substantial set of hardening configurations, and a nice feature to go with an anonymity network like Lokinet is [Boot Clock Randomization](https://www.kicksecure.com/wiki/Boot_Clock_Randomization) which helps defend against [time-based denonymization attacks](https://www.whonix.org/wiki/Time_Attacks).

Start by creating the bind directories for Lokinet's configurations:

```bash
sudo mkdir -p /etc/qubes-bind-dirs.d
echo 'binds+=( '\'''/etc/loki''\'' )' | sudo tee /etc/qubes-bind-dirs.d/50_user.conf 
```

Next, add the Oxen PGP key and the Lokinet template. We will deviate from the [official documentation](https://github.com/oxen-io/lokinet/blob/dev/docs/install.md#linux-install) and pin the PGP key to only be used for this repository:

```bash
curl --proxy http://127.0.0.1:8082 https://deb.oxen.io/pub.gpg | sudo tee /usr/share/keyrings/oxen.gpg
echo "deb [signed-by=/usr/share/keyrings/oxen.gpg] https://deb.oxen.io $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/oxen.list
```

Next, `lokinet` and `resolvconf`. `lokinet-gui` was very buggy when I tested it inside my VM, so I recommend installing only the daemon. `resolvconf` is used by the Lokinet init script but is not declared as a dependency for some reason, so you have to manually install it as well:

```bash
sudo apt update
sudo apt install lokinet-gui resolvconf
```

To work around the problem where Qubes overrides the DNS configuration at boot, create `/etc/systemd/system/lokinet-dns-fix.service` with the following content:

```
[Unit]
Description=Fix DNS for Lokinet
After=qubes-network-uplink.service

[Service]
Type=oneshot
ExecStart=/usr/bin/rm /etc/resolv.conf
ExecStart=/usr/bin/ln -s /run/resolvconf/resolv.conf /etc/resolv.conf

[Install]
WantedBy=multi-user.target
```



Enable the `lokinet-dns-fix` service:

```bash
sudo systemctl enable lokinet-dns-fix
```

At this stage, you can install any .deb app you want to use with Lokinet in the TemplateVM. I have been unable to get DNS working properly with Lokinet as a network VM, so for now we will have to use a Lokinet in each individual AppVM. 

Finally, shut down the TemplateVM:

```bash
sudo shutdown now
```

## Creating the AppVM

Create an AppVM based on the TemplateVM you have just created. Set `sys-firewall` (or whatever FirewallVM you have connected to your `sys-net`) as the net qube. If you do not have such FirewallVM, use `sys-net` as the net qube.

Edit `/etc/loki/lokinet.ini` and add the exit node you want to use. At the moment, the only free exit node that I am aware of is `euroexit.loki`:

```
[network]
exit-node=euroexit.loki
```
