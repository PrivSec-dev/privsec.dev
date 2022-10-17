---
title: "Using Lokinet on Qubes OS"
date: 2022-07-27
tags: ['Applications', 'Qubes OS', 'Anonymity', 'Privacy']
author: Tommy
---

![Lokinet](/images/lokinet.png)

[Lokinet](https://lokinet.org) is an Internet overlay network utilizing onion routing to provide anonymity for its users, similar to Tor network. This post will provide a quick (and non exhaustive) list of its [pros](#advantages) and [cons](#disadvantages) from an end user perspective and go over how to set it up on Qubes OS.

## Advantages

- Provides anonymity by removing trust in a service provider (as opposed to a traditional VPN)
- Better versatility than Tor by supporting any IP based protocols (Tor only supports TCP)
- Generally faster speed than the Tor Network

## Disadvantages

- Only works well on Debian-based distributions. The client for Windows has DNS Leaks, and support for macOS, Android, and other Linux distributions is experimental. It should be noted that this is a problem with the official client, not the protocol itself.
- Does not have a killswitch which could lead to accidental leaks (as opposed to common commercial VPN clients which lock the connections to just the provider's servers).
- The official client requires a user to manually define an exit node, or to set certain IP ranges to be routed through certain exit nodes. While this makes it possible to setup some form of Steam Isolation, it is not as good as Tor's `isolateDestinationAddr` and `isolateDesitnationPort`. which automatically use a random exit node for every destination/port you visit.
- DNS does not work when used as a ProxyVM on Qubes OS

## Creating the TemplateVM

As mentioned [above](#disadvantages), the Lokinet client only works well with Debian-based distributions. This means that our template will have to be one of the Debian-based ones, and I would highly recommend that you convert the official Debian template by the Qubes OS team into a KickSecure template to use as a base. KickSecure reduces the attack surface of Debian with a substantial set of hardening configurations, and a nice feature to go with an anonymity network like Lokinet is [Boot Clock Randomization](https://www.kicksecure.com/wiki/Boot_Clock_Randomization) which helps defend against [time-based denonymization attacks](https://www.whonix.org/wiki/Time_Attacks). You will only need the `kicksecure-cli` meta package (`kicksecure-gui` is unnecessary), and experimental services like `proc-hidepid`, `hide-hardware-info` and `permission-hardening` work just fine with the Lokinet client. [Hardened Malloc](https://www.kicksecure.com/wiki/Hardened_Malloc) and [LKRG](https://www.kicksecure.com/wiki/Linux_Kernel_Runtime_Guard_LKRG) do not cause any problem with Lokinet, either.

Since DNS with Lokinet does not work if it is installed inside of a ProxyVM, we will need to have Lokinet running inside the same AppVM as the applications you intend to run. This is less than ideal, as a compromised AppVM could reveal your IP address. Beyond that, accidental leaks can happen, too.

A potential solution to this problem is to set up an unbound server or firewall script redirecting all DNS traffic to the ProxyVM to its Lokinet DNS server at `127.3.2.1:53`; however, I have been unable to get it working. Another solution is to simply override the DNS server inside the AppVM to a custom DNS server, but this will make you stand out out and break `.loki` DNS resolution. Websites like [DNS leak test](https://dnsleaktest.com) can observe which DNS server you are actually using and potentially fingerprint you. For the same reason that you should not use custom DNS servers when connected to the Tor network, you really should not use a custom DNS server when connected to Lokinet.

Start by importing the Oxen's PGP key:

`sudo curl --proxy http://127.0.0.1:8082 -so /etc/apt/trusted.gpg.d/oxen.gpg https://deb.oxen.io/pub.gpg`

Then, add Oxen's Debian repository:

`echo "deb https://deb.oxen.io $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/oxen.list`

Next, update the repositories:

`sudo apt update`

If updates for your packages are found, **DO NOT** attempt to upgrade them directly. Instead, use the Qubes Updater to update the TemplateVM.

When you are done, install `lokinet-gui` and `resolvconf`:

`sudo apt install lokinet-gui resolvconf`

Note that you **must** install `resolveconf` to get DNS working.

Next, edit `/var/lib/lokinet/lokinet.ini` and add the exit server you want to use:

`exit-node=exit.loki`

Note that I am using `exit.loki` here, as it is the one mentioned in the [Lokinet documentation](https://docs.oxen.io/products-built-on-oxen/lokinet/exit-nodes).
There are some other exit servers listed on [probably.loki](http://probably.loki/wiki/index.php?title=Exit_Nodes) as well, and for your convenience, I will just copy-paste them here:

- `exit.loki` (USA, run by Jeff)
- `exit2.loki` (USA, run by Jeff, same ip as exit.loki)
- `xite.loki` (Iceland, run by Loutchi)
- `peter.loki` (USA, run by peter)
- `secret.loki` (Netherlands, run by Secret)

Finally, enable the `lokinet` service:

`systemctl enable lokinet`

## Creating the AppVM

Just create the AppVM as usual, and you would be good to go. There are a few things to keep in mind though:
- You should probably set networking to use `sys-firewall`. I have tested using my ProtonVPN ProxyVM for networking, and DNS was not working. Besides, it makes little sense to attempt such setup anyways, unless you are worried about accidental leaks or a compromised AppVM.
- You should give the AppVM the `network-manager` service so that Lokinet can set up networking properly and get DNS working.
