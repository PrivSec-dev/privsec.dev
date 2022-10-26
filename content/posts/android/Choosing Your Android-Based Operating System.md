---
title: "Choosing Your Android-Based Operating System"
date: 2022-07-18
tags: ['Operating Systems', 'Android', 'Privacy', 'Security']
author: Tommy
---

Android is a secure operating system that has strong [app sandboxing](https://source.android.com/security/app-sandbox), [Verified Boot](https://source.android.com/security/verifiedboot) (AVB), and a robust [permission](https://developer.android.com/guide/topics/permissions/overview) control system.

When you buy an Android phone, the device's default operating system often comes with invasive integration with apps and services that are not part of the [Android Open-Source Project](https://source.android.com/). An example of such is Google Play Services, which has irrevocable privileges to access your files, contacts storage, call logs, SMS messages, location, camera, microphone, hardware identifiers, and so on. These apps and services increase the attack surface of your device and are the source of various privacy concerns with Android.

This problem could be solved by using a custom Android-based operating system that does not come with such invasive integration. Unfortunately, many custom Android-based operating systems often violate the Android security model by not supporting critical security features such as AVB, rollback protection, firmware updates, and so on. Some of them also ship [`userdebug`](https://source.android.com/setup/build/building#choose-a-target) builds which expose root over [ADB](https://developer.android.com/studio/command-line/adb) and require [more permissive](https://github.com/LineageOS/android_system_sepolicy/search?q=userdebug&type=code) SELinux policies to accommodate debugging features, resulting in a further increased attack surface and weakened security model.

When choosing a custom Android-based operating system, you should make sure that it upholds the Android security model. Ideally, the custom operating system should have substantial privacy and security improvements to justify adding yet another party to trust.

## Baseline Security

### Verified Boot

![Verified Boot](/images/verified-boot.png)

[Verified Boot](https://source.android.com/security/verifiedboot) is an important part of the Android security model. It provides protection against [evil maid](https://en.wikipedia.org/wiki/Evil_maid_attack) attacks, malware persistence, and ensures security updates cannot be downgraded with [rollback protection](https://source.android.com/security/verifiedboot/verified-boot#rollback-protection).

On Android, only your data (inside of the /data partition) is encrypted, and the operating system files are left unencrypted. Verified Boot ensures the integrity of the operating system files, thereby preventing an adversary with physical access from tampering or installing malware on the device. In the unlikely case that malware is able to exploit other parts of the system and gain higher privileged access, Verified Boot will prevent and revert changes to the system partition upon rebooting the device.

Unfortunately, OEMs are only obliged to support Verified Boot on their stock Android distribution. Only a few OEMs such as Google support custom AVB key enrollment on their devices. Additionally, some AOSP derivatives such as LineageOS or /e/ OS do not support Verified Boot even on hardware with Verified Boot support for third-party operating systems. These AOSP derivatives should be avoided at all cost.

### Firmware Updates

Firmware updates are critical for maintaining security and without them your device cannot be secure. OEMs have support agreements with their partners to provide the closed-source components for a limited support period. These are detailed in the monthly [Android Security Bulletins](https://source.android.com/security/bulletin).

On a custom Android distribution, it is the responsibility of the operating system vendor to extract the firmware from the stock operating system, test it against their Android builds, then ship them to the user.

Unfortunately, many custom Android distributions, including extremely popular ones like LineageOS and /e/ OS do not ship firmware updates for most of their supported device. Instead, they expect the user to keep track of stock OS updates, extract and flash the firmware themselves. Beyond the lack of testing, this is extremely burdensome and not feasible for most end users and is yet another reason to not use these distributions.

### Patch Levels

As the [Android Security Bulletins](https://source.android.com/security/bulletin) is updated every month, Android-Based operating systems are expected to apply all security fixes before the next bulletin update comes out. Beside extracting the firmware, testing it and shipping it to the end user as described [above](#firmware-updates), the AOSP based system also need to be updated.

This is a particularly challenging thing to do, especially around the time of a new major Android release since there are a lot of changes. Sometimes, newer firmware versions require newer major versions of AOSP, and if the developer takes too long to update their base operating system to the next major AOSP version, they cannot ship firmware updates either, leaving users vulnerable.

This has happened to CalyxOS during the Android 11 to Android 12 transition. It took them [4 months](https://github.com/privacyguides/privacyguides.org/pull/578#issue-1112002737) to update to Android 12; and during those 4 months, they could not ship any firmware updates at all, leaving the user vulnerable during that time period.

It would be much better if you just stick to the stock operating system (which got updated to Android 12 shortly after the AOSP 12 release) instead of using a custom operating system which could not keep up with updates as described.

### Chromium Webview Updates

Android comes with a system [webview](https://developer.android.com/reference/android/webkit/WebView), a component that many apps rely on to use as part of their activity layout. It effectively behaves like a minimal browser, opening random websites with arbitrary code the internet. Thus, it is very important that this component is consistently kept up to dater.

Some Android-based operating systems, including ones like CalyxOS, often fall behind on security updates for this component. Particularly, this has gotten so bad that they actually fell behind for [3 months](https://github.com/privacyguides/privacyguides.org/pull/548#issuecomment-1018245074) back in January 2022 and [2 months](https://github.com/privacyguides/privacyguides.org/pull/1378) in June 2022. It is a good indication that these operating systems cannot keep up with security updates and should not be used.

### User Builds

As mentioned [above](/posts/os/choosing-your-android-based-operating-system/), `userdebug` builds expose root over ADB and require more permissive SELinux policies to accommodate debugging features. `userdebug` builds violate the Android security model and are really only meant for developers to test out their android builds during development. 

End users should be using the production `user` builds, and any distributions that fail to deliver them like LineageOS or /e/ OS should be avoided.

### SELinux in Enforcing Mode

[SELinux](https://source.android.com/security/selinux) is a critical part of the Android security model, having the Linux kernel enforcing confinement for all processes, including system processes running as root. 

In order for a system to be secure, it must have SELinux in Enforcing mode, accompanied by fine-grained SELinux policies.

Unfortunately, many custom Android-based operating system builds (especially unofficial LineageOS builds) disables SELinux or set it into Permissive mode. You can check whether SELinux is in enforcing mode or not by executing `getenforce` in the ADB shell (the expected output is `Enforcing`). You should avoid any Android-based operating system builds that do not have SELinux in enforcing mode at all cost.

![ADB SELinux](/images/adb-selinux.png)

## Recommended Android-Based Operating Systems

Currently, I am only aware of two Android-based operating systems that should be used over the stock operating systems:

### GrapheneOS
![GrapheneOS Aurora](/images/grapheneos-aurora.jpg)

[GrapheneOS](https://grapheneos.org) is the **only** custom Android-based operating system you should buy a new phone for. It provides additional [security hardening](https://en.wikipedia.org/wiki/Hardening_(computing)) and privacy improvements over the stock operating system from Google. It has a [hardened memory allocator](https://github.com/GrapheneOS/hardened_malloc), network and sensor permissions, and various other [security feature](https://grapheneos.org/features). GrapheneOS also comes with full firmware updates and signed builds, so verified boot is fully supported. Here is a quick video demonstrating the network and sensors permissions:

{{< youtube id="0ic6QK0xUMY">}}

For usability purposes, GrapheneOS supports [Sandboxed Google Play](https://grapheneos.org/usage#sandboxed-google-play), which runs Google Play Services fully sandboxed like any other regular app. This means you can take advantage of most Google Play Services, such as [push notifications](https://firebase.google.com/docs/cloud-messaging/), while giving you full control over their permissions and access, and while containing them to a specific work profile or user profile of your choice. Most interestingly, the [In-app Billing API](https://android-doc.github.io/google/play/billing/api.html), [Google Play Games](https://play.google.com/googleplaygames), [Play Asset Delivery](https://developer.android.com/guide/playcore/asset-delivery), [FIDO2](/posts/knowledge/multi-factor-authentication/#fido2-fast-identity-online) all work exceptionally well. Most [Advanced Protection Program](https://landing.google.com/advancedprotection/) features, except for [Play Protect](https://support.google.com/googleplay/answer/2812853?hl=en) and restricted app installation, also work.

Because GrapheneOS does not grant any Google Apps and Services apart from the opt-in eSIM action app privileged access to the system, Play Protect cannot disable or uninstall known malicious applications when it detects them. As for restricted app installation, this feature is not that useful on stock operating system anyways, since it is bypassable with `adb push`.

Recently, GrapheneOS has also added the [Storage Scopes](https://grapheneos.org/usage#storage-access) feature, allowing you to force apps that request broad storage access permission to function with scoped storage. With this new feature, you no longer have to grant certain apps access to all of your media or files to use them anymore. You can watch a video of Storage Scope in action here:

{{< youtube id="WjrANjvrSzw">}}


Currently, Google Pixel phones are the only devices that meet GrapheneOS's [hardware security requirements](https://grapheneos.org/faq#device-support).

### DivestOS

[DivestOS](https://divestos.org/) is a great aftermarket operating system for devices that have gone end-of-life or are near end-of-life. Note that this is a harm reduction project, ran by one developer on the best effort basis, and you should not buy a new device just to run DivestOS.

Being a soft-fork of [LineageOS](https://lineageos.org/), DivestOS inherits many [supported devices](https://divestos.org/index.php?page=devices&base=LineageOS) from LineageOS. It has signed builds, making it possible to have [verified boot](https://source.android.com/security/verifiedboot) on some non-Pixel devices.

It comes with substantial hardening over AOSP. DivestOS has automated kernel vulnerability ([CVE](https://en.wikipedia.org/wiki/Common_Vulnerabilities_and_Exposures)) [patching](https://gitlab.com/divested-mobile/cve_checker), fewer proprietary blobs, a custom [hosts](https://divested.dev/index.php?page=dnsbl) file, and various security features ported from GrapheneOS. A non-exhaustive list of this includes:

- A hardened webview. [Mulch](https://gitlab.com/divested-mobile/mulch) comes with *some* patches from GrapheneOS's Vanadium browser and the [Bromite](https://github.com/bromite/bromite) project. It gets updated fairly quickly and do not fall behind nearly as much as Bromite.
- Kernel patches from GrapheneOS and enables all available kernel security features via [defconfig hardening](https://github.com/Divested-Mobile/DivestOS-Build/blob/master/Scripts/Common/Functions.sh#L758). All kernels newer than version 3.4 include full page [sanitization](https://lwn.net/Articles/334747/) and all ~22 Clang-compiled kernels have [`-ftrivial-auto-var-init=zero`](https://reviews.llvm.org/D54604?id=174471) enabled.
-  GrapheneOS's [`INTERNET`](https://developer.android.com/training/basics/network-ops/connecting) and SENSORS permission toggle.
- [Hardened memory allocator](https://github.com/GrapheneOS/hardened_malloc)
- [Secure Exec-Spawning](https://grapheneos.org/usage#exec-spawning)
- Partial [bionic](https://en.wikipedia.org/wiki/Bionic_(software)) hardening patchsets from GrapheneOS
- GrapheneOS's per-network full [MAC randomization](https://en.wikipedia.org/wiki/MAC_address#Randomization) option on version 17.1 and higher
- Automatic reboot/Wi-Fi/Bluetooth [timeout options](https://grapheneos.org/features)

With that being said, DivestOS is not without its faults. The developer does not have all of the devices he is building for, and for a lot of them he simply publishes the builds blind without actually testing them. Firmware update support [varies](https://gitlab.com/divested-mobile/firmware-empty/-/blob/master/STATUS) across devices. DivestOS also takes a very long time to update to a new major Android, and actually took longer than CalyxOS did as mentioned [above](#firmware-updates). It does not tend to fall behind on Chromium updates like CalyxOS, however.

Also, please note that I am only recommending DivestOS here, and not any of its related apps. For instance, I would not recommend using Mull, since it is just a Firefox Android fork with better defaults and still inherits many security deficiencies from its upstream, including the lack of support for [site isolation](https://wiki.mozilla.org/Project_Fission) and [isolatedProcess](https://bugzilla.mozilla.org/show_bug.cgi?id=1565196).
