---
title: "Android Tips"
date: 2022-07-22
lastmod: 2022-08-16
tags: ['Operating Systems', 'Android', 'Privacy', 'Security']
author: Tommy
---

Android is a very secure and robust operating system out of the box. This post will be less of a "hardening guide", but more of a non-exhaustive list of tips when it comes to buying and using Android phones.

## Android Devices

### Recommended Phones

![Google Store](/images/google-store.png)

Google Pixel phones are the **only** devices I would recommend for purchase. Pixel phones have stronger hardware security than any other Android devices currently on the market, due to proper AVB support for third-party operating systems and Google's custom [Titan](https://security.googleblog.com/2021/10/pixel-6-setting-new-standard-for-mobile.html) security chips acting as the Secure Element.

When purchasing a device, you should buy one as new as possible. The software and firmware of mobile devices are only supported for a limited time, so buying new extends that lifespan as much as possible. Also, beginning with the **Pixel 6** and **6 Pro**, Pixel devices receive a minimum of 5 years of guaranteed security updates, ensuring a much longer lifespan compared to the 2-4 years competing OEMs typically offer.

### Phones to Avoid
Avoid buying the Fairphone 4, which only has just over 2 years of full security updates since its release date despite them advertising 6 years of support. This is because the System on a Chip they use (Snapdragon 750G) only has 3 years of support from Qualcomm, and the SoC was already old when the phone came out. This is not to mention, the Fairphone 4 [uses the Android Verified Boot Test Key as their OEM keys](https://forum.fairphone.com/t/bootloader-avb-keys-used-in-roms-for-fairphone-3-4/83448/11), effectively making Verified Boot useless. In general, you should check for how long the SoC a phone uses is supported for and not blindly trust the phone manufacturer's claims.

You should also avoid buying the /e/ OS phones (sometimes branded as the Murena phones). /e/ OS in itself extremely insecure, not supporting verified boot, shipping userdebug build, [shipping months old version of Chromium, bundling years old version Orbot into their operating system then marketing it as "Advanced Privacy"](https://divestos.org/misc/e.txt), etc. They have recently also had an incident where their cloud service mishandled session keys and give users access to each other's files, then proceeded to [mislead the users that the server cannot see their files](https://community.e.foundation/t/service-announcement-26-may/41252/30) despite there being no end-to-end encryption.

You should also be very wary of low quality privacy branded phones like the Freedom Phone, BraX2 Phone, Volta Phone, and the like. These are cheap Chinese phones with the [Mediatek Helio P60](https://i.mediatek.com/p60) from 2018, which has already reached end-of-life or is near end-of-life. Needless to say, you should also avoid any vendor who claims they are Zero-day proof like this: 

![Volta phone](/images/volta-phone.png)

## Android-based Operating Systems

![GrapheneOS Aurora](/images/grapheneos-aurora.jpg)

In certain cases, installing a custom Android-based operating system can help increase your privacy and security. This is rather tricky; however, as the vast majority of these operating systems (a.k.a. "custom ROMs") do exactly the opposite - breaking the Android security model, ruining your security while providing no or dubious privacy benefits.

I have written a detailed post on selecting your Android-based operating system, which you can find [here](../../os/choosing-your-android-based-operating-system/).

**TLDR**: If you are using a modern Pixel, use [GrapheneOS](https://grapheneos.org). If you are on a device supported by [DivestOS](https://divestos.org), use DivestOS. Otherwise, stick to your stock operating system. Do not blindly use an OS just because it is advertised as "degoogled".

## Use New Android Versions

It's important to not use an [end-of-life](https://endoflife.date/android) version of Android. Newer versions of Android not only receive security updates for the operating system but also important privacy enhancing updates too. For example, [prior to Android 10](https://developer.android.com/about/versions/10/privacy/changes), any apps with the [`READ_PHONE_STATE`](https://developer.android.com/reference/android/Manifest.permission#READ_PHONE_STATE) permission could access sensitive and unique serial numbers of your phone such as [IMEI](https://en.wikipedia.org/wiki/International_Mobile_Equipment_Identity), [MEID](https://en.wikipedia.org/wiki/Mobile_equipment_identifier), your SIM card's [IMSI](https://en.wikipedia.org/wiki/International_mobile_subscriber_identity), whereas now they must be system apps to do so. System apps are only provided by the OEM or Android distribution.

## Do Not Root Your Phone

[Rooting](https://en.wikipedia.org/wiki/Rooting_(Android)) Android phones can decrease security significantly as it weakens the complete [Android security model](https://en.wikipedia.org/wiki/Android_(operating_system)#Security_and_privacy). This can decrease privacy should there be an exploit that is assisted by the decreased security. Common rooting methods involve directly tampering with the boot partition, making it impossible to perform successful Verified Boot. Apps that require root will also modify the system partition meaning that Verified Boot would have to remain disabled. Having root exposed directly in the user interface also increases the [attack surface](https://en.wikipedia.org/wiki/Attack_surface) of your device and may assist in [privilege escalation](https://en.wikipedia.org/wiki/Privilege_escalation) vulnerabilities and SELinux policy bypasses.

## Use a diceware passphrase, avoid pattern unlock

On Android, the phone unlock (Password, Pin, Pattern) is used to protect the encryption key for your device. Thus, it is vital that your unlock secret is secure and can withstand Bruteforce attacks.

Pattern unlock is extremely insecure and should be avoided at all cost. This is discussed in detail in the [Cracking Android Pattern Lock in Five Attempts](/researches/Cracking-Android-Pattern-Lock-in-Five-Attempts.pdf) research paper.

If you trust the hardware enforced rate limiting features (typically done by the [Secure Element](https://en.wikipedia.org/wiki/Secure_cryptoprocessor) or [Trusted Execution Environment](https://en.wikipedia.org/wiki/Trusted_execution_environment)) of your device, a 8+ digit PIN may be sufficient.

Ideally, you should be using a 8-10 word [diceware passphrase](https://en.wikipedia.org/wiki/Diceware) to secure your phone. This would make your phone unlock practically impossible to bruteforce, regardless of whether there is proper rate limiting or not.

## Use Global Toggles

Modern Android devices have global toggles for disabling Bluetooth and location services. Android 12 introduced toggles for the camera and microphone. When not in use, you should disable these features. Apps cannot use disabled features (even if granted individual permission) until re-enabled.

## Manage Android Permissions

[Permissions on Android](https://developer.android.com/guide/topics/permissions/overview) grant you control over what apps are allowed to access. Google regularly makes [improvements](https://developer.android.com/about/versions/11/privacy/permissions) on the permission system in each successive version. All apps you install are strictly [sandboxed](https://source.android.com/security/app-sandbox), therefore, there is no need to install any antivirus apps. 

You can manage Android permissions by going to **Settings** → **Privacy ** → **Permission Manager**. Be sure to remove from apps any permissions that they do not need.

## Enable VPN Killswitch

Android 7 and above supports a VPN killswitch and it is available without the need to install third-party apps. This feature can prevent leaks if the VPN is disconnected. It can be found in **Settings** → **Network & internet** → **VPN** → **Block connections without VPN**.

## Media Access
Quite a few applications allow you to "share" a file with them for media upload. If you want to, for example, tweet a picture to Twitter, do not grant Twitter access to your "media and photos", because it will have access to all of your pictures then. Instead, go to your file manager (documentsUI), hold onto the picture, then share it with Twitter.

If you are using GrapheneOS, you should utilize the Storage Scopes feature to force apps that request broad storage access permission to function with scoped storage.

![VLC Storage Scopes](/images/vlc-storage-scopes.png)

## User Profiles

Multiple user profiles can be found in **Settings** → **System** → **Multiple users** and are the simplest way to isolate in Android.

With user profiles, you can impose restrictions on a specific profile, such as: making calls, using SMS, or installing apps on the device. Each profile is encrypted using its own encryption key and cannot access the data of any other profiles. Even the device owner cannot view the data of other profiles without knowing their password. Multiple user profiles are a more secure method of isolation.

## Work Profile

[Work Profiles](https://support.google.com/work/android/answer/6191949) are another way to isolate individual apps and may be more convenient than separate user profiles.

A **device controller** such as [Shelter](https://gitea.angry.im/PeterCxy/Shelter#shelter) is required, unless you're using CalyxOS which includes one.

The work profile is dependent on a device controller to function. Features such as *File Shuttle* and *contact search blocking* or any kind of isolation features must be implemented by the controller. You must also fully trust the device controller app, as it has full access to your data inside of the work profile.

This method is generally less secure than a secondary user profile; however, it does allow you the convenience of running apps in both the work and personal profiles simultaneously.

## Baseband Modem Attack Surface Reduction

By default, your baseband modem will typically set to support just about every generation of mobile cellular technology, from 2G to 5G. This gives a large attack surface.

You can reduce this attack surface by limiting the baseband modem to just using the generation that in needs. In most cases, this would be 4G/LTE.

GrapheneOS has the LTE only mode exposed in settings. You can set this by going to **Settings** → **Internet** → **Your carrier name** → **Preferred network type** → **LTE Only**.

If your Android-based operating system does not expose this setting in the Settings app, or if you want to set your baseband modem to a less restrictive mode, dial `*#*#4636#*#*` then hit **Phone information**. Here, you can set preferred network type to just the generations that you intend to use. For example, if you only want to use 4G and 5G, you can set it to `NR/LTE`.

## Where to Get Your Aspplications

### GrapheneOS App Store

GrapheneOS's app store is available on [GitHub](https://github.com/GrapheneOS/Apps/releases). It supports Android 12 and above and is capable of updating itself. The app store has standalone applications built by the GrapheneOS project such as the [Auditor](https://attestation.app/), [Camera](https://github.com/GrapheneOS/Camera), and [PDF Viewer](https://github.com/GrapheneOS/PdfViewer). If you are looking for these applications, I highly recommend that you get them from GrapheneOS's app store instead of the Play Store, as the apps on their store are signed by the GrapheneOS's project own signature that Google does not have access to.

### Aurora Store

The [Aurora Store](https://auroraoss.com/download/AuroraStore/) is a proxy for the Google Play Store. It is great for privacy in the sense that it automatically gives you a disposable account to download apps, and it works on Android-based distributions that do not support Google Play Services. That being said, it lacks security features like certificate pinning and does not support Play Asset Delivery.

My recommendation is to stick with the Google Play Store unless your threat model calls for not logging into Google Services at all.

### F-Droid

F-Droid, despite being often recommended in the privacy community, has various security deficiencies. You can read more about them [here](../../apps/f-droid-security-analysis/).

I do not recommend that you use F-Droid at all unless you have no other choice to obtain certain apps. In some rare cases, there may be some apps which require the F-Droid version to work properly without Google Play Services. If you do end up using F-Droid, I highly recommend that you avoid the official F-Droid client (which is extremely outdated and targets API level 25) and use a more modern client with seamless updates such as [NeoStore](https://github.com/NeoApplications/Neo-Store). You should also avoid using the official F-Droid repository as mmuch as possible and stick to the F-Droid repositories hosted by the app developers instead.

### GitHub

You can also obtain your apps directly from their GitHub repositories. In most cases, there would be a pre-built APK for you to download. You can verify the signature of the downloaded using apksinger:

- Install the [Android Studio](https://developer.android.com/studio) which includes apksinger.
- Run `apksigner verify --print-certs --verbose myCoolApp.apk` to verify the certificate of the apk.

After you have verified the signature of the apk and installed it on your phone, there are several strategies you can use to keep the application up-to-date. 

The first strategy is to add the atom feed of the application's release page to an RSS Reader like [ReadYou](https://github.com/Ashinch/ReadYou) to get notified of new releases. You will still need to download and install the new releases manually. If you are confused, here is a video that could help with this process: 

{{< youtube id="FFz57zNR_M0">}}

The second strategy is to use the [IzzyOnDroid](https://apt.izzysoft.de/fdroid/) F-Droid repository with a modern F-Droid client like [NeoStore](https://github.com/NeoApplications/Neo-Store), as mentioned [above](#f-droid). The IzzyOnDroid repository pulls new releases from various GitHub repositories to their server, which can then be automatically downloaded and installed by NeoStore. The downside of this strategy is that not every application on GitHub is on IzzyOnDroid, and sometimes IzzyOnDroid fails to pull a new release, resulting in you not getting any updates at all.

It should be noted that since Android has automatic signature checking for existing applications on the system, you only need to manually check the signature of the apk the first time you install an application. If you do use IzzyOnDroid to update the applications, you will need to manually confirm the first update of an application to authorize the NeoStore as the installation source. After that, future updates will be seamless.

## Google

If you are using a device with Google services, either your stock operating system or an operating system that safely sandboxes Google Play Services like GrapheneOS, there are a number of additional changes you can make to improve your privacy.

### Enroll in the Advanced Protection Program

![Advanced Protection Program](/images/advanced-protection-program.png)

If you have a Google account we suggest enrolling in the [Advanced Protection Program](https://landing.google.com/advancedprotection/). It is available at no cost to anyone with two or more hardware security keys with [FIDO2](/knowledge/multi-factor-authentication/#fido2-fast-identity-online) support.

The Advanced Protection Program provides enhanced threat monitoring and enables:

- Stricter two factor authentication; e.g. that [FIDO2](/knowledge/multi-factor-authentication/#fido2-fast-identity-online) **must** be used and disallows the use of [SMS OTP](/knowledge/multi-factor-authentication/#fido2-fast-identity-online), [TOTP](/knowledge/multi-factor-authentication/#time-based-one-time-password-totp) and [OAuth](https://en.wikipedia.org/wiki/OAuth)
- Only Google and verified third-party apps can access account data
- Scanning of incoming emails on Gmail accounts for [phishing](https://en.wikipedia.org/wiki/Phishing#Email_phishing) attempts
- Stricter [safe browser scanning](https://www.google.com/chrome/privacy/whitepaper.html#malware) with Google Chrome
- Stricter recovery process for accounts with lost credentials

 If you use non-sandboxed Google Play Services (common on stock operating systems), the Advanced Protection Program also comes with [additional benefits](https://support.google.com/accounts/answer/9764949?hl=en) such as:

- Not allowing app installation outside of the Google Play Store, the OS vendor's app store, or via [`adb`](https://en.wikipedia.org/wiki/Android_Debug_Bridge)
- Mandatory automatic device scanning with [Play Protect](https://support.google.com/googleplay/answer/2812853?hl=en#zippy=%2Chow-malware-protection-works%2Chow-privacy-alerts-work)
- Warning you about unverified applications

### Google Play System Updates

In the past, Android security updates had to be shipped by the operating system vendor. Android has become more modular beginning with [Android 10](https://www.android.com/android-10/), and Google [can push security updates](https://blog.google/products/android-enterprise/android-10-security/) for **some** system components via the privileged Play Services.

If you have an EOL device shipped with Android 10 or above (shipped beginnning 2020) and are unable to run any of our recommended operating systems on your device, you are likely going to be better off sticking with your OEM Android installation (as opposed to an insecure operating system here such as LineageOS or /e/ OS). This will allow you to receive **some** security fixes from Google, while not violating the Android security model by using an insecure Android derivative and increasing your attack surface. You should still upgrade to a supported device as soon as possible.

### Disable Advertising ID

All devices with Google Play Services installed automatically generate an [advertising ID](https://support.google.com/googleplay/android-developer/answer/6048248?hl=en) used for targeted advertising. Disable this feature to limit the data collected about you.

On Android distributions with [Sandboxed Google Play](https://grapheneos.org/usage#sandboxed-google-play), go to **Settings** → **Apps** → **Sandboxed Google Play** → **Google Settings** → **Ads**, and select *Delete advertising ID*.

On Android distributions with privileged Google Play Services (such as stock OSes), the setting may be in one of several locations. Check

- **Settings** → **Google** → **Ads**
- **Settings** → **Privacy** → **Ads**

![Ads=id](/images/ads-id.png)

You will either be given the option to delete your advertising ID or to *Opt out of interest-based ads*, this varies between OEM distributions of Android. If presented with the option to delete the advertising ID that is preferred. If not, then make sure to opt out and reset your advertising ID.
