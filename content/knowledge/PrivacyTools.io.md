---
title: "PrivacyTools.io"
date: 2022-07-28
tags: ['Knowledge Base', 'Privacy', 'Security']
author: Tommy
---

PrivacyTools.io is a fairly popular website recommending software and providers for the privacy communities. However, the website lacks any sort of quality control, recommending many products without technical merits or with severe vulnerabilities, and ending up harming user privacy. This post will go over a non-exhaustive list of bad recommendations from PrivacyTools.io.

## Web Browsers

### Duckduckgo
Duckduckgo Browser on Android is a [Webview based browser](https://github.com/duckduckgo/Android/issues/1837#issuecomment-1093044254). It [does not support Site Isolation](https://chromium.googlesource.com/chromium/src/+/main/docs/process_model_and_site_isolation.md). This is in contrast with Standalone or Trichrome browsers which support this feature and come preinstalled out of the box with most Android-based operating systems.

### Onion Browser
The Onion Browser leaks the actual IP address of the user via WebRTC. This issue has been reported in Juanuart 2018 and still has not been fixed as of this writing (July 2022). You can read more about this [here](https://github.com/OnionBrowser/OnionBrowser/issues/117).

## Browser Addons

### HTTPS Everywhere
This extension is obsolete and all major modern browsers have built in Https Everywhere capability.

### Decentraleyes
The concept is privacy theatre. It does not make sense to [enumerate badness](/knowledge/badness-enumeration/) and selectively block certain content from certain CDNs. If anything, it makes the user more fingerprintable (websites can detect which content is not being loaded) and adds unnecessary security risks, as the extension itself has access to all of the websites the user visits. 

### xBrowserSync
It does not make any sense to recommend this extension, as Chrome, Firefox, and Brave already have built-in end to end encryption for bookmarks. This is an unnecessary security risk for no apparent privacy benefit.

### Cookie AutoDelete
This is yet another example of an unnecesary security risk and could lead to a worse user experience. It is better for the user to just use Firefox containers or multiple browser instances for to keep cookies seperated. Firefox and Chromium based browsers also have automatic cookies deletion on close built in.

## Password Manager

### Lesspass
This is a deterministic password manager, which is [substantially worse](https://tonyarcieri.com/4-fatal-flaws-in-deterministic-password-managers) than traditional vault-styled password managers.

### Spectre
This is yet another deterministic password manager like Lesspass. However, unlike Lesspass, it is also stateless, which makes it even less flexible.

## Productivity & Collaboration Tools

### Etherpad
Etherpad does not support end to end encryption, and does not even have password authentication out of the box. There is nothing "private" about it.

### OnlyOffice
OnlyOffice in itself is not an entirely terrible application; however, it has worse security properties than Microsoft Office and Apple iWork. On Windows, it does not have [MDAG integration](https://www.onlyoffice.com/) like Microsoft Office. On macOS, it is not [sandboxed](https://developer.apple.com/documentation/security/app_sandbox) like Apple iWork or Microsoft Office. OnlyOffice should only be recommended with caveats attached to it.

### LibreOffice
Same as OnlyOffice.

### Ethercal
Same as Eherpad.

## Windows Privacy Tools

### O&O ShutUp10++
Shutup10 is simply a tool to quickly change a few privacy settings and group policies in Windows. It makes little sense to introduce yet another privileged third party application to the system instead of just following Microsoft's documentation and make the appproprieate changes.

## Mobile Operating Systems

### Ubuntu Touch
Ubuntu Touch is years behind mainline Ubuntu. It does not even support basic security feature like [drive encryption](https://ubports.com/blog/ubports-news-1/post/ubuntu-touch-safety-architecture-25).

### LineageOS
LineageOS substantially weakens the baseline security of Android. It does not support verified boot even on devices which support it, does not ship firmware updates on the vast majority of builds, uses userdebug builds, and so on.

## "Encrypted DNS Clients for Improved Internet Privacy"
Encrypted DNS [does not](https://madaidans-insecurities.github.io/encrypted-dns.html) provide privacy.

## Anonymizing Networks

### Zeronet
Zeronet [deos not](https://zeronet.io/docs/faq/#how-to-use-zeronet-with-tor) provide anonimity. It is about as private as the Bittorrent network, which means it is not very private on its own at all. Instead, the user has to opt into using the Tor Network in conjuction with it for anonimity.

### Retroshare
Same as Zeronet. Unless it is used with Tor or I2P, it does not provide anonimity. The "circle of trust" can see each other's IP addresses.

### IPFS
IPFS [does not](https://docs.ipfs.tech/concepts/privacy-and-encryption/) provide anonimity. It is designed as a public network, much like BitTorrent.

### GNUNet
GNUNet is [not ready for production](https://www.gnunet.org/en/faq.html) and should not be used by by non-developers.

## Torrent Clients
The BitTorrent network is inherently not private, and none of the recommendationss actually provides anything for privacy. While there is one client which actually attempts to provide privacy through onion routing called [Tribler](https://www.tribler.org/), it is not mentioned on PrivacyTools.io

## Whistleblower Tools

### Haven
The application is [broken](https://github.com/guardianproject/haven/issues/454), it quite literally does not even work.

## Instant Messaging

### Delta Chat
Delta Chat is okay as an email client with PGP support; however, it should not be used as an instant messenger. Delta Chat relies on PGP for encryption and email for delivery, and not many people actually use PGP with emails to begin with. To make matters worse, PGP encryption lacks perfect forward secrecy, and the email protocol makes it impossible to have any kind of metadata protection. Beyond that, many email providers do not set up sender authentication properly, leading to emails under their domains being spoofable.

It is also worth noting that as an email client, Delta Chat is still worse than alternatives like Fairemail and K9Mail as it [does not](https://support.delta.chat/t/use-of-smartcard-piv-key/2014/2) have PGP smartcard support.

### Revolt Chat
Still in very early stages of development. It does not support end to end encryption and has yet to even implement second factor authentication. It its current state, it has worse security than Discord and no apparent privacy benefit whatsoever.

### Tox
Tox has a [severe vulnerability](https://github.com/TokTok/c-toxcore/issues/426) since 2017 and has yet to be fixed as of July 2022 where messages are spoofable.

### "Encrypted DNS Resolvers for Improved Internet Privacy"
Again, encrypted DNS [does not](https://madaidans-insecurities.github.io/encrypted-dns.html) provide privacy.

## Encrypted Cloud Storage

### Mega
In June 2022, a research paper has found a vulnerability in Mega's encryption that would allow an adversarial provider to break the confidentiality of their customer's data. You can read more about it [here](https://mega-awry.io/). PrivacyTools continues to recommend Mega along with their affiliate links despite of this vulnerability not having been fixed.

### Nextcloud
Nextcloud's end to end encryption is experimental and has to be manually enabled by the instance's administrator. There is practically no major Nextcloud hosting provider who enables this feature. When end to end encryption is being used, it cannot function like "Office 365 or Google Drive" as PrivacyTools claims, as its integration with Collabora Online/OnlyOffice Document Server/Etherpad would not work with encrypted documents.

To be truly private with Nextcloud, the user has to be in full control of their instance, enable the end to end encryption module, and purely use it for data storage and nothing else. The alternative is to use an encryption tool which supports WebDav as a storage backend like Cryptomator and Wildland, however, these are generic tools which would work with any provider and not specific to Nextcloud.