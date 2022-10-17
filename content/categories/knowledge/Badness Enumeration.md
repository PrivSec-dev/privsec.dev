---
title: "Badness Enumeration"
date: 2022-07-27
tags: ['Knowledge base', 'Privacy', 'Security']
author: Tommy
---

Badness enumeration is the concept of making a list of known bad actors and attempting to block them. While it seems intuitive at first glance, badness enumeration should not be relied on for privacy or security. In many cases, it actually does the exact opposite and directly harms the user. This post will attempt to explain why badness enumeration as a concept is flawed and give *some* examples of its failings in practice.

## The Obvious Problem

The obvious argument against badness enumeration is that there are so many threat actors out there, it is impossible to make a list to block all of them. Even when you make a magical list that somehow includes all of the threat actors that exist today, tomorrow a new threat actor will pop up and attack you anyways. Enumerating badness does not systematically solve the underlying problem. Instead, it is running away from the problem and hoping that a competent adversary will not come after you. Badness enumeration does not work, cannot work, has never worked, and will never work.

## Adblocking Extensions

On top of the [obvious problem](#the-obvious-problem) mentioned above, there are various technical reasons why advertisement/tracker blocking extensions cannot provide privacy. One of which is the fact that tracking can be done without any scripts at all. For example, a website only needs to know your session ID using a cookie and save all logs associated with that ID. It can then analyize when you visited the website, how long you visited the website for, which page on the website you spent the most time on, what you looked at, and so on. Another problem is that a website can just host its own tracking code or [proxy third party tracking code under its own domain](https://gist.github.com/paivaric/211ca15afd48c5686226f5f747539e8b). Just because your adblocker blocks connections to Google Analytics does not mean that you you are actually "safe" from Google Analytics at all. Even if you are successful in doing so, there is nothing stopping the website from sharing the analytics data it collected on its own with Google either.

"Okay, so adblockers are unreliable, but what is the harm?" you may ask.

The problem here is that adblockers (especially with Manifest v2) are highly privileged and have access to all of your data within the browser. All it takes is for the extension developer to turn malicious for your passwords, session ids, TOTP secrets, etc to get compromised. Even if you were to assume that the extension developer is trustworthy, one vulnerability within the extension could still be catastrophic. This is made worse by the fact that adblockers typically use third-party blocklists, extending trust to the blocklist maintainers to not exploit the extension should a vulnerability be found. The ["uBlock, I exfiltrate"](https://portswigger.net/research/ublock-i-exfiltrate-exploiting-ad-blockers-with-css) blog post describes in detail how a CSS injection vulnerability in uBlockOrigin lead to data exfiltration with one single bad filtering rule.

Overall, adblockers increase your attack surface for dubious privacy benefits. If you insist on getting an adblocker however, I highly recommend that you use purely declarative, permission less Manifest V3 ones like [uBlock Origin Lite](https://chrome.google.com/webstore/detail/ublock-origin-lite/ddkjiahejlhfcafbddmgiahcphecmpfh). While they do block fewer ads and trackers than their Manifest V2 counterparts and V3 extensions with "Read and change all your data on all websites", they pose much less of a threat to your privacy and security while still providing the convenience of blocking annoyances.

## DNS Filtering

DNS filtering solutions. while not having any negative impact on security, are trivially bypassable by just hosting the advertisement and trackers under the apex domain instead of a subdomain. For example, instead of hosting advertisement and trackers under ads.example.com, the webmaster can move them to be under example.com/ads and it would be impossible for DNS filters to block. Other bypasses include an application implementing its own DNS resolution instead of relying on the DNS servers set by the operating system, or connecting directly to certain IP addresses without any DNS resolution at all.

It should also be noted that websites can detect which DNS servers a visitor uses. You can look at [DNSLeakTest](https://www.dnsleaktest.com/) as an example. Using non-network provided DNS servers adds to the fingerprint and make you more identifiable.

The best way to do DNS filtering is to use a VPN provider which has this feature built in like [ProtonVPN](https://protonvpn.com), [Mullvad](https://mullvad.net), and [IVPN](https://www.ivpn.net/) in order to not standout from other users of the same VPN provider. Even then, DNS filtering is purely a convenience feature and cannot be relied on for privacy and security.

## Antiviruses

Antiviruses are highly privileged processes with access to virtually all of your files and data, parsing through them trying to find something that matches a known bad signature. Beyond the fact that you need to trust the Antivirus company to not exfiltrate your sensitive data and that the signature list will never have all of the malware in existence, a vulnerable parser could lead to a system compromise. The [Abusing File Processing in Malware Detectors for Fun and Profit](/researches/Abusing-File-Processing-in-Malware-Detectors-for-Fun-and-Profit.pdf) research paper by Suman Jana and Vitaly Shmatikov discusses this in detail.

Here are some other examples of Anviruses being attack surfaces on their own:
- [Arbitrary Code Execution with Avast's Javascript Interpreter](https://github.com/taviso/avscript)
- [Memory Corruption with Bitdefender](https://landave.io/2020/11/bitdefender-upx-unpacking-featuring-ten-memory-corruptions/)
- [Kaspersky in the Middle](https://web.archive.org/web/20210729054039/https://palant.info/2019/08/19/kaspersky-in-the-middle-what-could-possibly-go-wrong/)


The proper way to deal with untrusted applications is not to scan them with an Antivirus, but to confine them in such a way that even if they were malicious, they cannot do much damage at all. This has already been achieved on secure mobile operating systems like Android and iOS with their application sandbox. Typically, attacks against these systems require an exploit chain against the operating system, or for the user to actually mess up and grant an app access to sensitive data. On desktop operating systems, you should utilize virtualization to contain untrusted applications in their own virtual machine. This can be done with a system like Qubes OS, the [Windows Sandbox](https://docs.microsoft.com/en-us/windows/security/threat-protection/windows-sandbox/windows-sandbox-overview), or just general KVM / HyperV virtual machines.


## Default Permit

Surprisingly (or unsurprisingly), the [The Six Dumbest Ideas in Computer Security](https://www.ranum.com/security/computer_security/editorials/dumb/) article from almost 20 years ago still holds true today. It explains the problem with Default Permit better than I ever could. In short, when setting up a Firewall or some sort of filter list, it is better to start out by blocking everything, then allowing only the traffic that you need. That way, you don't have to worry about applications that you didn't care enough to block turning out to be vulnerable. Sometimes, "goodness enumeration" is the solution to the problem.

## Conclusion

By now, I hope I have clearly explained why badness enumeration is never the solution to the problem. Sometimes, it can be a nice-to-have thing, like a VPN provider blocking advertisements and trackers on the DNS level to make the web experience more enjoyable. Other times, it can be harmful to your privacy and security, like with a malicious/vulnerable extension or antivirus. The important thing to keep in mind is that you cannot rely on badness enumeration for true privacy and security, and you should always be aware of the privacy and security implications that certain options may entail.
