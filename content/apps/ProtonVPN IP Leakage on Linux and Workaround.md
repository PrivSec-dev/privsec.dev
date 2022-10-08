---
title: "ProtonVPN IP Leakage on Linux and Workaround"
date: 2022-10-08
tags: ['Applications', 'Linux', 'Qubes OS', 'Privacy']
author: Tommy
---

**Before We Start**... 

I sent Proton an email regarding this issue in late August 2022 and was told they are working on fixing it, though it will take some time as it requires some architectural changes in how the killswitch works.

## The Leak

Ideally, when implementing a killswitch, a VPN client should drop all connections on non-VPN interfaces except when the connection is to the VPN provider's servers. This is necessary to prevent accidental leaks, at least by unprivileged applications. Unfortunately, the ProtonVPN client does not currently do this.

Effectively, any application that binds to the connected physical interface (as opposed to the VPN's virtual interface) on your Linux system will expose your actual IP address, regardless of the killswitch state. This is problematic, especially for certain applications like Torrent clients, as they tend to use whatever interfaces they can access (rather than just the default one) to connect to the internet.
You can check this with `curl`: 

```bash
curl --interface <physical interface> https://ipinfo.io
```

This will return your actual IP address.

## The Workaround

### Qubes OS

On Qubes OS, you generally should not have a problem if you use the ProtonVPN client in a ProxyVM. While the same issue still exists within the ProxyVM itself, it is unlikely to manifest as you should not be running any other applications in the same Qube anyways, and apps in an AppVM cannot bind to the public interface of the ProxyVM. I have not observed any leaks from an AppVM behind a ProtonVPN ProxyVM.

### General Linux Distributions

On a general Linux distribution, the workaround is to configure OpenVPN manually and setup a killswitch yourself.

Since ProtonVPN does not support IPv6, you should disable it in your kernel settings:

```bash
echo 'net.ipv6.conf.all.disable_ipv6=1
net.ipv6.conf.default.disable_ipv6=1
net.ipv6.conf.lo.disable_ipv6=1' | sudo tee /etc/sysctl.d/10-disable-ipv6.conf
sudo sysctl -p
```

Next, download your OpenVPN configuration files from [account.protonvpn.com](https://account.protonvpn.com/). In those configuration files, you should see a list of IP addresses and ports of ProtonVPN's servers.

Finally, set up the VPN killswitch. The rules I posted here are based on [this discussion](https://airvpn.org/forums/topic/15061-firewalld-killswitch/).

#### Firewalld

```bash
sudo firewall-cmd --direct --permanent --add-rule ipv4 filter FORWARD 0 -o tun+ -j ACCEPT
sudo firewall-cmd --direct --permanent --add-rule ipv4 filter FORWARD 0 -i tun+ -j ACCEPT

sudo firewall-cmd --direct --permanent --add-rule ipv6 filter INPUT 0 -j DROP
sudo firewall-cmd --direct --permanent --add-rule ipv4 filter INPUT 0 -i lo -j ACCEPT
sudo firewall-cmd --direct --permanent --add-rule ipv4 filter INPUT 1 -i tun+ -p tcp -j ACCEPT
sudo firewall-cmd --direct --permanent --add-rule ipv4 filter INPUT 1 -i tun+ -p udp -j ACCEPT
sudo firewall-cmd --direct --permanent --add-rule ipv4 filter INPUT 999 -j DROP

sudo firewall-cmd --direct --permanent --add-rule ipv6 filter OUTPUT 0 -j DROP
sudo firewall-cmd --direct --permanent --add-rule ipv4 filter OUTPUT 0 -o lo -j ACCEPT
sudo firewall-cmd --direct --permanent --add-rule ipv4 filter OUTPUT 0 -o tun+ -j ACCEPT

#You will need to add each of the IP address and port with the following command:
sudo firewall-cmd --direct --permanent --add-rule ipv4 filter OUTPUT 1 -p udp -m udp --dport $PORT -d $IP -j ACCEPT

sudo firewall-cmd --direct --permanent --add-rule ipv4 filter OUTPUT 999 -j DROP

sudo firewall-cmd --reload
```

#### UFW

```bash
sudo ufw default deny incoming
sudo ufw default deny outgoing

#You will need to add each of the IP address and port with the following command:
sudo ufw allow out to $IP port $PORT proto udp

sudo ufw allow out on tun0 from any to any
```


