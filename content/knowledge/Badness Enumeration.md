---
title: "Badness Enumeration"
date: 2022-07-27
tags: ['Knowledge base', 'Privacy', 'Security']
author: Tommy
---

Badness enumeration is the concept of making a list of known bad actors and attempting to block them. While it may seem intuitive at first glance, badness enumeration should not be relied upon for privacy or security. In many cases, it actually does the exact opposite and directly harms the user. This post will attempt to explain why badness enumeration as a concept is flawed and give *some examples* of its failings in practice.

## The Obvious Problem

The obvious argument against badness enumeration is that there are so many threat actors out there, it is impossible to make a list to block all of them. Even when you make a magical list that somehow includes all of the threat actors that exist today, tomorrow a new threat actor will pop up and attack you anyways. Enumerating badness does not systematically solve the underlying problem. It is simply running away from the problem and hoping that a competent adversary will not come after you. Badness enumeration does not work, cannot work, has never worked, and will never work.

## Adblocking Extensions

On top of the [obvious problem](#the-obvious-problem) mentioned above, there are various technical reasons why advertisement/tracker blocking extensions cannot provide privacy. One of which is the fact that tracking can be done without any scripts at all. For example, a website only needs to know your session ID using a cookie and save all logs associated with that ID. It can then analyize when you visited the website, how long you visited the website for, which page on the website you spent the most time on, what you looked at, and so on. Another problem is that a website can just host its own tracking code or [proxy third party tracking code under its own domain](https://gist.github.com/paivaric/211ca15afd48c5686226f5f747539e8b). Just because your adblocker blocks connections to Google Analytics does not mean that you can be sure you are actually "safe" from Google Analytics at all. Even when you are successful in doing so, there is nothing stopping the website from sharing the analytics data it collected on its own with Google either.

"Okay, so adblockers are unreliable, but what is the harm?" you may ask.

The problem here is that adblockers (especially with Manifest v2) are highly privileged and have access to all of your data within the browser. All it takes is for the extension developer to turn malicious for your passwords, session ids, TOTP secrets, etc to get compromised. Even if you were to assume that the extension developer is trustworthy, one vulnerability within the extension could still be catastrophic. This is made worse by the fact that adblockers typically use third-party blocklists, extending trust to the blocklist maintainers to not exploit the extension should a vulnerability be found. The ["uBlock, I exfiltrate"](https://portswigger.net/research/ublock-i-exfiltrate-exploiting-ad-blockers-with-css) blog post describes in detail how a CSS injection vulnerability in uBlockOrigin lead to data exfiltration with one sigle bad filtering rule.

Overall, adblockers weaken your security for dubios privacy benefits. You are better off not using any advertisement/tracker blocking extensions at all. If you want to avoid stateful tracking, consider clearing all cookies and site data upon exit, using [FireFox containers](https://linuxbsdos.com/2021/11/27/see-multi-account-containers-extension-is-not-needed-to-use-containers-in-firefox/), or using multiple browser instances. You would also need to hide your IP address using a VPN or something like the Tor network as well. If you are worried about stateless tracking, use a browser with fingerprinting protection like Brave (which can fool naive scripts) or Tor Browser (which has the best protection in the market).

## Antiviruses

Antiviruses are highly privileged processes with access to virtually all of your files and data, parsing through them trying to find something that matches a known bad signature. Beyond the fact that you need to trust the Antivirus company to not exfiltrate your sensitive data and that the signature list will never have all of the malware in existence, a vulnerable parser could lead to a system compromise. The [Abusing File Processing in Malware Detectors for Fun and Profit](/researches/Abusing-File-Processing-in-Malware-Detectors-for-Fun-and-Profit.pdf) research paper by Suman Jana and Vitaly Shmatikov discusses this in detail.

Here are some other examples of Anviruses being attack surfaces on their own:
- [Arbitary Code Execution with Avast's Javascript Interpreter](https://github.com/taviso/avscript)
- [Memory Corruption with Bitdefender](https://landave.io/2020/11/bitdefender-upx-unpacking-featuring-ten-memory-corruptions/)
- [Kaspersky in the Middle](https://web.archive.org/web/20210729054039/https://palant.info/2019/08/19/kaspersky-in-the-middle-what-could-possibly-go-wrong/)


The proper way to deal with untrusted applications is not to scan them with an Antivirus, but to confine them in such a way that even if they were malicious, they cannot do much damage at all. This has already been achieved on secure mobile operating systems like Android and iOS. Typically, attacks against these systems require an operating system level exploit chain, or for the user to actually mess up and grant an app access to sensitive data. On desktop operating systems, you should utilize virtualization to contain untrusted applications in their own virtual machine. This can be done with a system like Qubes OS, the [Windows Sandbox](https://docs.microsoft.com/en-us/windows/security/threat-protection/windows-sandbox/windows-sandbox-overview), or just general KVM / HyperV virtual machines.


## Default Permit

Surprisingly (or unsurprisingly), the [The Six Dumbest Ideas in Computer Security](https://www.ranum.com/security/computer_security/editorials/dumb/) article from almost 20 years ago still holds true today. It explains the problem with Default Permit better than I ever could. In short, when setting up a Firewall or some sort of filter list, it is better to start out by blocking everything, then allowing only the traffic that you need. That way, you don't have to worry about applications that you didn't care enough to block turning out to be vulnerable. Sometimes, "goodness enumeration" is the solution to the problem.

## Conclusion

By now, I hope I have clearly explained why badness enumeration is never the solution to the problem. Sometimes, it can be a nice-to-have thing, like a VPN provider blocking advertisements and trackers on the DNS level to make the web experience more enjoyable. Other times, it can be harmful to your privacy and security, like with a malicious/vulnerable extension or antivirus. The important thing to keep in mind is that you cannot rely on badness enumeration for true privacy and security, and you should always be aware of the privacy and security implications that certain options may entail.
