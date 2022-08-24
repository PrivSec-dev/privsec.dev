---
title: "Commercial VPN Use Cases"
date: 2022-07-19
tags: ['Knowledge base', 'VPN', 'Privacy']
author: ['Tommy', 'WfKe9vLwSvv7rN']
---

Virtual Private Networks are a way of creating a protected and private network over the open Internet. It was originally designed to provide remote access to an internal corporate network. However, in recent years, it has also been used by commercial VPN companies to hide their clients' real IP address from third-party websites and services.

## Should I use a VPN?

**Yes**, unless you are already using Tor. A VPN does two things: shifting the risks from your Internet Service Provider to itself and hiding your IP from a third-party service.

VPNs cannot encrypt data outside of the connection between your device and the VPN server. VPN providers can see and modify your traffic the same way your ISP could. And there is no way to verify a VPN provider's "no logging" policies in any way.

However, they do hide your actual IP from a third-party service, provided that there are no IP leaks. They help you blend in with others and mitigate IP based tracking.

## What about encryption?

Encryption offered by VPN providers are between your devices and their servers. It guarantees that this specific link is secure. This is a step up from using unencrypted proxies where an adversary on the network can intercept the communications between your devices and said proxies and modify them. However, encryption between your apps or browsers with the service providers are not handled by this encryption.

In order to keep what you actually do on the websites you visit private and secure, you must use [TLS](https://en.wikipedia.org/wiki/Transport_Layer_Security). This will keep your passwords, session tokens, and queries safe from the VPN provider. Consider enabling "HTTPS everywhere" in your browser to mitigate downgrade attacks like [SSL Strip](https://www.blackhat.com/presentations/bh-dc-09/Marlinspike/BlackHat-DC-09-Marlinspike-Defeating-SSL.pdf).

## Should I use encrypted DNS with a VPN?

Unless your VPN provider hosts the encrypted DNS servers, **no**. Using DOH/DOT (or any other form of encrypted DNS) with third-party servers will simply add more entities to trust and does **absolutely nothing** to improve your privacy/security. Your VPN provider can still see which websites you visit based on the IP addresses and other methods. Instead of just trusting your VPN provider, you are now trusting both the VPN provider and the DNS provider.

A common reason to recommend encrypted DNS is that it helps against DNS spoofing. However, your browser should already be checking for [TLS certificates](https://en.wikipedia.org/wiki/Transport_Layer_Security#Digital_certificates) with **HTTPS** and warn you about it. If you are not using **HTTPS**, then an adversary can still just modify anything other than your DNS queries and the end result will be little different.

Needless to say, **you shouldn't use encrypted DNS with Tor**. This would direct all of your DNS requests to a single entity and make you stand out from the rest of Tor users who would be using the exit node's DNS configuration.

## What if I need anonymity?

VPNs cannot provide anonymity. Your VPN provider will still see your real IP address, and often has a money trail that can be linked directly back to you. You cannot rely on "no logging" policies to protect your data. Use [Tor](https://www.torproject.org/) instead.

## Should I use Tor over VPN?

By using Tor over VPN, you are creating essentially adding an extra node in the beginning of the circuit. This provides zero additional benefits to you, while increasing the latency of your connection dramatically. If you wish to hide your Tor usage from your ISP or your government, Tor has a built-in solution for that: Tor bridges. 

## What about VPN over Tor?

By using VPN over Tor, you are adding an extra node at the end of a circuit, which is always controlled by the same entity. If you pay for the VPN using the traditional banking system, it essentially breaks the anonymity that the three hops in front of it would provide. If you pay for the VPN subscription using cash or a private cryptocurrency like Monero, your privacy is reduced to that of pseudonymity, since the VPN provider still knows the connections being made are from the same individual, they just do not know who you really are. Even if you are using a free VPN, you would still break [Stream Isolation](https://www.whonix.org/wiki/Stream_Isolation), one of Tor's important anonymity features. There are very few use cases where it would make sense to add a VPN server at the end of the chain.

## What about VPN providers that provide Tor nodes?

Do not use that feature. The point of using Tor is that you do not trust your VPN provider. Currently Tor only supports the [TCP](https://en.wikipedia.org/wiki/Transmission_Control_Protocol) protocol. Through Tor, [UDP](https://en.wikipedia.org/wiki/User_Datagram_Protocol) (used in [WebRTC](https://en.wikipedia.org/wiki/WebRTC) for voice and video sharing, the new [HTTP3/QUIC](https://en.wikipedia.org/wiki/HTTP/3) protocol, etc), [ICMP](https://en.wikipedia.org/wiki/Internet_Control_Message_Protocol) and other packets will be dropped. To compensate for this, VPN providers typically will route all non-TCP packets through their VPN server (your first hop). This is the case with [ProtonVPN](https://protonvpn.com/support/tor-vpn/). Additionally, like VPN over Tor, you lose control over other important Tor features like Stream Isolation.
Thus, this feature should be viewed as a convenient way to access the Tor Network, not to stay anonymous. For true anonymity, use the Tor Browser Bundle, TorSocks, or a Tor gateway.

## When are VPNs useful?

A VPN is useful in a variety of scenarios, such as:

- Hiding your traffic from **only** your Internet Service Provider.
- Hiding your downloads (such as torrents) from your ISP and anti-piracy organizations.
- Hiding your IP from third-party websites and services, preventing IP based tracking.

## Circumventing censorship/filters {#circumventing-censorship}

Network filtering can take many forms, from simplistic DNS or IP blocklists to sophisticated deep packet inspection ({{< rawhtml >}}<abbr>DPI</abbr>{{< /rawhtml >}}). A VPN, if not itself blocked, is the most robust method to circumvent filtering, but other methods may also be worth considering:

{{< rawhtml >}}
<dl>
  <dt>Encrypted DNS</dt><dd><ul>
    <li>Bypasses unsophisticated DNS blocks only</li>
    <li>Easily thwarted by unsophisticated IP address or <a href="https://www.cloudflare.com/learning/ssl/what-is-sni/"><abbr title="Server Name Identification">SNI</abbr></a> blocks</li>
    <li>Increases fingerprintability</li>
    <li>Free and easy (<a href="https://quad9.net/service/service-addresses-and-features">Quad9</a>, <a href="https://developers.cloudflare.com/1.1.1.1/encryption/">Cloudflare&nbsp;1.1.1.1</a>, <a href="https://developers.google.com/speed/public-dns/docs/secure-transports">Google&nbsp;Public&nbsp;DNS</a>)</li>
  </ul></dd>

  <dt><a href="https://github.com/ValdikSS/GoodbyeDPI">GoodbyeDPI</a> or <a href="https://github.com/krlvm/PowerTunnel">PowerTunnel</a></dt><dd><ul>
    <li>Works for HTTP(S) traffic only</li>
    <li>Attempts to work around DPI by exploiting bugs in DPI software</li>
    <li>May increase fingerprintability</li>
    <li>Free and does not rely on external servers</li>
  </ul></dd>

  <dt>VPN on port tcp/443</dt><dd><ul>
    <li>Extremely difficult to block without affecting HTTPS traffic</li>
    <li>Slow due to encapsulation with TCP</li>
    <li>Cannot use WireGuard (requires UDP)</li>
    <li>Offered by many commercial VPN providers (<a href="https://www.ivpn.net/knowledgebase/troubleshooting/how-do-i-change-the-port-or-protocol-used-to-connect/">IVPN</a>, <a href="https://mullvad.net/en/help/connection-speed-why-it-so-slow/">Mullvad</a>, <a href="https://protonvpn.com/support/udp-tcp/">Proton&nbsp;VPN</a>)</li>
  </ul></dd>

  <dt>Obfuscation proxy: <a href="https://shadowsocks.org/">Shadowsocks</a>, <a href="https://gitlab.com/yawning/obfs4">obfs4</a>, or <a href="https://www.v2fly.org/en_US/">V2Ray</a> (VMess)</dt><dd><ul>
    <li>Specifically designed for obfuscating traffic from DPI</li>
    <li>Very similar to VPNs, unlike traditional proxy implementations</li>
    <li>Security implications generally less explored than VPNs</li>
    <li>Limited or zero commercial availability (requires self&#8209;hosting)</li>
  </ul></dd>

  <dt>VPN over obfuscation proxy</dt><dd><ul>
    <li>Increased latency compared to standalone proxy</li>
    <li>More complex setup for self-hosting</li>
    <li>Offered by some commercial VPN providers (<a href="https://www.ivpn.net/knowledgebase/troubleshooting/i-cant-connect-from-china-or-vietnam-or-iran-etc-how-do-i-enable-obfsproxy/">IVPN</a>, <a href="https://mullvad.net/en/help/intro-shadowsocks/">Mullvad&nbsp;Bridges</a>)
  </ul></dd>

  <dt><a href="https://www.torproject.org/">Tor</a></dt><dd><ul>
    <li>Works for TCP traffic only (UDP tunneling over Tor is <a href="https://www.whonix.org/wiki/Transporting_UDP_Tunnels_over_Tor">complicated, fragile, and counterproductive</a>)</li>
    <li>Extremely slow</li>
    <li>Offers DPI-bypassing entrance proxies (<a href="https://tb-manual.torproject.org/circumvention/">Tor&nbsp;bridge pluggable&nbsp;transports</a>)
    <li>Free and decentralized</li>
  </ul></dd>
</dl>
{{< /rawhtml >}}