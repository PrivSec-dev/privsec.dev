---
title: "Choosing Your VPN Provider"
date: 2022-08-18
tags: ['Providers', 'VPN', 'privacy']
author: Tommy
---

Commercial VPNs are an important privacy tool. They hide your actual IP address from a third-party service, mitigating IP based tracking on the internet. I have written another post regarding their use cases [here](/knowledge/commercial-vpn-use-cases/). In this post I will walk you through what to look for when choosing a VPN provider.

![Ethernet](/images/ethernet-1.jpg)

## Modern Protocols

The first thing you should look for in a provider is that they use a modern and secure protocol for their VPN tunnels. For a detailed comparison between common VPN protocols, you should read ProtonVPN's [blog post](https://protonvpn.com/blog/whats-the-best-vpn-protocol/) on this topic.

In general, OpenVPN, Wireguard, and IKEv2/IPSec would serve you well. PPTP should be avoided at all cost due to various [known vulnerabilities](https://www.schneier.com/academic/archives/1999/09/cryptanalysis_of_mic_1.html).

L2PT/IPSec is an interesting case, as it is quite complex and is difficult to set up properly. [Many VPN providers](https://gist.github.com/kennwhite/1f3bc4d889b02b35d8aa) opt into using a common pre-shared key and making themselves [vulnerable to MITM attacks](https://www.ivpn.net/knowledgebase/general/is-using-l2tporipsec-with-a-public-pre-shared-key-secure/). Leaked NSA documents also suggests that the agency is capable to at least weaken it to some capacity. You are better off just not using this protocol as well.

## Encryption Key Stregth

Along with supporting a good VPN protocol, VPN providers should use keys with sufficient stregth on their servers. For example, most VPN providers would use a well known encryption standard like AES 256 or ChaCha20 for data transfer and RSA 4096 or at least RSA 2048 for the handshake. 

While this is generally not a problem with most providers, there has been instances of VPN providers using very weak encryption, such as [ExpressVPN using RSA 1024 for their handshake](https://spec.matrix.org/unstable/rooms/) a few years ago.

Before buying a VPN, you should check the provider's documentation on what type of encryption they use, or if they do not have it, ask their support directly. 

## VPN Killswitch

A killswitch is critical for a VPN to prevent accidental IP leakage. Ideally, the VPN should create a new network interface, then drop all of the connections on other interfaces except when the connection is to the VPN provider's servers. This networking setup should also persist even when the VPN client is off to prevent leaks in case of a crash or during system startup. You should keep in mind that there may be applications which start up before the VPN client and attempt to access the network.

On Android, this is less of an issue because the operating system has a built in killswitch since Android 7. However, other operating systems like Windows, macOS, common Linux distributions, iOS, etc do not have this feature built in, so you should really check if your VPN provider provides such a feature for your specific platform.

Note that currently on iOS, VPNs are leaky due to a [vulnerability in the operating system](https://protonvpn.com/blog/apple-ios-vulnerability-disclosure/) itself, and has been for years.

Some VPN providers like BytzVPN will only give you a bunch of OpenVPN profiles and tell you to import them to your OpenVPN client/NetworkManager configuration. Neither the OpenVPN client nor NetworkManager has a killswitch feature (not even a non-persistent one) on desktop operating systems. Manually making and **maintaining** a killswitch + keeping all of the profiles up-to-date is an extremely tedious task, and you should avoid these types of providers at all cost.

## Checking for Leaks

Beyond just reading the documentation from your VPN provider, you should also check for leaks yourself. [WIP]

## Multi-Hopping

This feature is not a must, but it is very nice to have. 

Not all VPN providers own their hardware, datacenter, and network . In fact, if your check their network, most VPN providers end to rent their servers from different service providers. This means that beyond trusting the VPN provider, you are also trusting their providers to not monitor your traffic.

By using using multihop, you can minize the risk of being monitored by your VPN provider's service providers. Your packets are encrypted at least twice and routed through at least 2 hops, with the entry node only knowing who you are but not what you visit, and with the exit node only knowing what you visit but not who you are. This cannot protect you from a malicious VPN provider as they will just compromise the VPN server on both ends, but it can help against a single node compromise (caused by a rougue datacenter employee for example).

Ideally, you should choose two servers from two different countries when using this feature.

## Pluggable Transport

## Payment Methods

## DNS Filtering

## Infrastructure

## General Trustworthiness

## Personal Recommendations

### ProtonVPN

### Mullvad

### IVPN

## Notes

### Self-Hosted VPN

### VPN Review Websites

### "The Only True VPN Rating System on The Net"
