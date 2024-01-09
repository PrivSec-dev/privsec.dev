---
title: "Choosing Your Mobile Browser"
author: Astellan
tags: ['Android', 'Privacy', 'Security', 'Browsers']
---

Here are mobile-based web browsers and extensions that we presently advise using for regular browsing.  We recommend [Vanadium] to those who want a security focused alternative to Google Chrome. [Mulch] for those who want a security focused browser similar to Vanadium, especially if they are not a GrapheneOS user. [Mull] is recommended if you want a Gecko based browser, which is hardened by default and can be used with uBlock Origin. For iOS users, [Safari] with AdGuard and Apple Private Relay (if available) is the only solution we suggest.

# Minimum Requirements

✅ Has to be open-source \
✅ By default prohibits third-party cookies and should lessen cross-site tracking \
✅ Must allow user to disable JIT

## Vanadium

[Vanadium] by GrapheneOS, a browser which is based on Chromium. Vanadium has been hardened by default, and it is also used to power Vanadium System Web View. If needed, it can be used as an independent browser applications. It is the most secure browser after Safari as it comes with JIT disabled and network state partitioning, control-flow integrity enabled by default. It makes use of Hardened Malloc and MTE (Only Pixel 8 Series) on GrapheneOS, which makes it the most secure browser when using a GrapheneOS Phone.

GrapheneOS Team has been reportedly working on a content blocking solution like Brave Browser Shields. We advise you to wait for their release in few months, if possible. DNS based content blocking is another solution for those who want to block ads and trackers while browsing on the Internet. For that, Rethink DNS + Firewall or NextDNS/AdGuard DNS can be a great pick.

### Why use Vanadium over Brave Browser?

The attack surface may expand with an ad blocker, depending on how it is implemented, and also blocking ads is not a security benefit. It's just for ease of use and providing little privacy from ads and tracker. if you want strong Fingerprint Resistance (FPR) Protection, tor browser is your only choice. Brave Browser can only block simple script, it will fail to block advanced scripts. Vanadium is recommended over Brave Browser if you don't want content blocking.

## Mull

Based on Firefox, [Mull] Browser prioritizes privacy. It uses Arkenfox's user.js configurations to enable several capabilities that are via the Tor project. Installing uBlock Origin is advised, especially with [Divest recommended](https://divestos.org/pages/browsers#tuningFenix) blocklists and browser settings. Mull is hardened by default, like the disabled JIT state for security. Furthermore, with uBlock you can enable *Medium Blocking* mode and disable JavaScript for increased security.

**Note:** Firefox-based Android browsers lack per-site process isolation, an important security feature that offers further protection against a website with malicious intent using a security flaw. For low-risk web browsers, missing this capability probably won't be a problem if they keep their browser updated, but if you visit higher-risk websites or are vulnerable to targeted or zero-day attacks, you should seriously consider switching to a Chromium-based browser.</span>

## Mulch

[Mulch] web browser is built on Chromium and is focused on security. Because of patches from the Vanadium Project (By GrapheneOS), some security features are introduced.
Mulch can be used as the system Web View on various operating systems. We strongly recommend you to change your system web-view to Mulch, if possible. Mulch comes with JIT disabled and network state partitioning and control-flow integrity enabled by default.

As per our testing, we were able to change system web-view on 2018 Samsung flagship devices like the S9, S9 Plus running the latest LineageOS 20 (Android 13). [Mulch Web View](https://github.com/A4Alpha/mulch-webview-overlay) can be set to default in these devices running LineageOS and we strongly suggest you to use Mulch Browser and Mulch system Web View combination, if you have one of these devices.

### Why don't we recommend DuckDuckGo (DDG) Browser?

Since DuckDuckGo is a Web View browser, per-site process isolation is not supported. We would recommend making use of Vanadium or Mulch, since you can benefit from the extra sandboxing of this browser. If you're a iOS user, we recommend you to stick to your default (First Party) web browser, which is Safari.

## Brave Browser

Since [Brave Browser] is based on the Chromium web-browser project, it ought to feel comfortable and have few problems with websites not working. A built-in content blocker and privacy protections are available in Brave Browser. It guards against browser fingerprinting and blocks trackers & ads by default. Though, it doesn't come with JIT state disabled, you have to manually do it. You can harden Brave Browser further by following this [Guide by Divest](https://divestos.org/pages/browsers#tuningChromium).

## Tor Browser

[Tor Browser] should be your choice of browser, ONLY if your threat model demands for it. Firefox-based browser on Android aren't the best choice when it comes to security. Although, Tor Browser is the only option providing great level of Anonymity while browsing. We recommend you to use it at the *Safest* or *Safer* Security Levels.

[uBlock Origin]: https://github.com/gorhill/uBlock#ublock-origin
[Brave Browser]: https://brave.com
[Tor Browser]: https://www.torproject.org/download/
[JIT]: https://blog.mozilla.org/attack-and-defense/2020/09/15/inspecting-just-in-time-compiled-javascript/
[Vanadium]: https://grapheneos.org/usage#web-browsing
[Mulch]: https://divestos.org/pages/our_apps#mulch
[Mull]: https://divestos.org/pages/our_apps#mull
[AdGuard]: https://adguard.com/en/adguard-ios/overview.html
[Safari]: https://www.apple.com/safari/