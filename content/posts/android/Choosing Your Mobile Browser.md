---
title: "Choosing Your Mobile Browser"
author: Astellan
tags: ['Android', 'Privacy', 'Security', 'Browsers']
---

Here are mobile-based web browsers and extensions that we presently advise using for regular browsing.  We recommend [Vanadium] to those who want a security focused alternative to Google Chrome. [Mulch] for those who want a security focused browser similar to Vanadium, especially if they are not a GrapheneOS user. [Mull] is recommended if you want a Gecko based browser.

## Vanadium

The best sandbox implementation is offered by Chromium-based browsers, such as [Vanadium]. The sandbox offers far more benefits than just preventing other areas of the OS from being compromised. By putting each site in its own isolated sandbox, site isolation uses the sandbox to establish security limits around every website. Vanadium also comes with JIT disabled, network state partitioning and control-flow integrity enabled by default. All this makes Vanadium one of the most secure browser.

## Mulch

[Mulch] web browser is built on Chromium and is focused on security. Because of patches from the Vanadium Project (By GrapheneOS), some security features are introduced.

Mulch can be used as the system Web View on various operating systems. We strongly recommend you to change your system web-view to Mulch, if possible. Mulch comes with JIT disabled and network state partitioning and control-flow integrity enabled by default.

As per our testing, we were able to change system web-view on 2018 Samsung flagship devices like the S9, S9 Plus running the latest LineageOS 20 (Android 13). [Mulch Web View](https://github.com/A4Alpha/mulch-webview-overlay) can be set to default in these devices running LineageOS and we strongly suggest you to use Mulch Browser and Mulch system Web View combination, if you have one of these devices.

## Brave Browser

[Brave Browser] is another browser based on the Chromium web-browser project. It includes its own search engine, also named Brave, but you can change it as per your preference. Brave Browser also comes with built-in content blocker, which you can configure as per your needs. Brave Browser guards against browser fingerprinting and blocks trackers & ads by default. You can harden Brave Browser further by following this [Guide by Divest](https://divestos.org/pages/browsers#tuningChromium).

## Tor Browser

[Tor Browser] should be your choice of browser, ONLY if your threat model demands for it. Firefox-based browser on Android aren't the best choice when it comes to security. Although, Tor Browser is the only option providing great level of Anonymity while browsing. We recommend you to use it at the *Safest* or *Safer* Security Levels.

## Mull

Based on Firefox, [Mull] Browser prioritizes privacy. It uses Arkenfox's user.js configurations to enable several capabilities that are via the Tor project. Mull is hardened by default, like the disabled JIT state for security.

**Note:** Firefox-based Android browsers lack per-site process isolation, an important security feature that offers further protection against a website with malicious intent using a security flaw.

### Why don't we recommend DuckDuckGo (DDG) Browser?

Since DuckDuckGo is a Web View browser, per-site process isolation is not supported. We would recommend making use of Vanadium or Mulch, since you can benefit from the extra sandboxing of this browser.

[uBlock Origin]: https://github.com/gorhill/uBlock#ublock-origin
[Brave Browser]: https://brave.com
[Tor Browser]: https://www.torproject.org/download/
[JIT]: https://blog.mozilla.org/attack-and-defense/2020/09/15/inspecting-just-in-time-compiled-javascript/
[Vanadium]: https://grapheneos.org/usage#web-browsing
[Mulch]: https://divestos.org/pages/our_apps#mulch
[Mull]: https://divestos.org/pages/our_apps#mull
[AdGuard]: https://adguard.com/en/adguard-ios/overview.html
[Safari]: https://www.apple.com/safari/
