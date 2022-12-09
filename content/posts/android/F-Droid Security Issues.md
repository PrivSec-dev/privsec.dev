---
title: "F-Droid Security Issues"
date: 2022-01-02T21:28:31Z
tags: ['Applications', 'Android', 'Security']
author: PrivSec.dev Contributors
---

F-Droid is a popular alternative app repository for Android, especially known for its main repository dedicated to free and open-source software. F-Droid is often recommended among security and privacy enthusiasts, but how does it stack up against Play Store in practice? This write-up will attempt to emphasize major security issues with F-Droid that you should consider.

Before we start, a few things to keep in mind:

- The main goal of this write-up was to inform users so they can make responsible choices, not to trash someone else's work. I have respect for any work done in the name of good intentions. Likewise, please don't misinterpret the intentions of this article.
- You have your own reasons for using open-source or free/libre/whatever software which won't be discussed here. A development model shouldn't be an excuse for bad practices and shouldn't lure you into believing that it can provide strong guarantees it cannot.
- A lot of information in this article is sourced from official and trusted sources, but you're welcome to do your own research.
- These analyses do not account for threat models and personal preferences. As the author of this article, I'm only interested in facts and not ideologies.

*This is not an in-depth security review, nor is it exhaustive.*

## 1. The trusted party problem
To understand why this is a problem, you'll have to understand a bit about F-Droid's architecture, the things it does very differently from other app repositories, and the [Android platform security model](https://arxiv.org/pdf/1904.05572.pdf) (some of the issues listed in this article are somewhat out of the scope of the OS security model, but the majority is).

Unlike other repositories, F-Droid signs all the apps in the main repository with **its own signing keys** (unique per app) at the exception of the very few [reproducible builds](https://f-droid.org/en/docs/Reproducible_Builds/). A signature is a mathematical scheme that guarantees the authenticity of the applications you download. Upon the installation of an app, Android pins the signature across the entire OS (including user profiles): that's what we call a *trust-on-first-use* model since all subsequent updates of the app must have the corresponding signature to be installed.

Normally, the developer is supposed to sign their own app prior to its upload on a distribution channel, whether that is a website or a traditional repository (or both). You don't have to trust the source (usually recommended by the developer) except for the first installation: future updates will have their authenticity cryptographically guaranteed. The issue with F-Droid is that all apps are signed by the same party (F-Droid) which is also not the developer. You're now adding another party you'll have to trust since **you still have to trust the developer** anyway, which isn't ideal: **the fewer parties, the better**.

On the other hand, Play Store now manages the app signing keys too, as [Play App Signing](https://developer.android.com/studio/publish/app-signing#app-signing-google-play) is required for app bundles which are required for new apps since August 2021. These signing keys can be uploaded or automatically generated, and are securely stored by [Google Cloud Key Management Service](https://services.google.com/fh/files/misc/security_whitepapers_march2018.pdf). It should be noted that the developer still has to sign the app with **an upload key** so that Google can verify its authenticity before signing it with the app signing key. For apps created before August 2021 that may have [not opted in Play App Signing](https://developer.android.com/studio/publish/app-signing#opt-out) yet, the developer still manages the private key and is responsible for its security, as a compromised private key can allow a third party to sign and distribute malicious code.

F-Droid requires that the source code of the app is exempt from any proprietary library or ad service, according to their [inclusion policy](https://f-droid.org/en/docs/Inclusion_Policy/). Usually, that means that some developers will have to maintain a slightly different version of their codebase that should comply with F-Droid's requirements. Besides, their "quality control" offers **close to no guarantees** as having access to the source code doesn't mean it can be easily proofread. Saying Play Store is filled with malicious apps is beyond the point: the **false sense of security** is a real issue. Users should not think of the F-Droid main repository as free of malicious apps, yet unfortunately many are inclined to believe this.

> But... can't I just trust F-Droid and be done with it?

[You don't have to take my word for it](https://forum.f-droid.org/t/is-it-as-safe-as-it-is-from-fdroid-official-repo/15956/12): they openly admit themselves it's a [very basic process](https://forum.f-droid.org/t/is-it-as-safe-as-it-is-from-fdroid-official-repo/15956/2) relying on badness enumeration (this doesn't work by the way) which consists in a few scripts scanning the code for proprietary blobs and known trackers. You are therefore not exempted from trusting upstream developers and it goes for any repository.

*A tempting idea would be to compare F-Droid to the desktop Linux model where users trust their distribution maintainers out-of-the-box (this can be sane if you're already trusting the OS anyway), but the desktop platform is intrinsically chaotic and heterogeneous for better and for worse. It really shouldn't be compared to the Android platform in any way.*

While we've seen that F-Droid controls the signing servers (much like Play App Signing), F-Droid also fully controls the build servers that run the disposable VMs used for building apps. And from June to November of 2022, their guest VM image [officially ran an end-of-life release of Debian LTS](https://gitlab.com/groups/fdroid/-/milestones/5#tab-issues). It is also worth noting that Debian LTS seperate project from Debian which attempts to extend the lifetime of releases that are deemed end-of-life by the Debian project and [does not get handled by the Debian Security team](https://wiki.debian.org/LTS). The version they were using (Debian Stretch) was actually discontinued [2 years prior](https://wiki.debian.org/DebianStretch). Undoubtedly, this raises questions about their whole infrastructure security.

> How can you be sure that the app repository can be held to account for the code it delivers?

F-Droid's answer, interesting yet largely unused, is [build reproducibility](https://f-droid.org/en/docs/Reproducible_Builds/). While deterministic builds are a neat idea in theory, it requires the developer to make their toolchain match with what F-Droid provides. It's additional work on both ends sometimes resulting in [apps severely lagging behind in updates](https://code.briarproject.org/briar/briar/-/issues/1612), so reproducible builds are not as common as we would have wanted. It should be noted that reproducible builds in the main repository can be exclusively developer-signed.

Google's approach is [code transparency for app bundles](https://developer.android.com/guide/app-bundle/code-transparency), which is a simple idea addressing some of the concerns with Play App Signing. A JSON Web Token (JWT) signed by a key private to the developer is included in the app bundle before its upload to Play Store. This token contains a list of DEX files and native `.so` libraries and their hashes, allowing end-users to verify that the running code was built and signed by the app developer. Code transparency has known limitations, however: not all resources can be verified, and this verification can only be done manually since it's not part of the Android platform itself (so requiring a code transparency file cannot be enforced by the OS right now). Despite its incompleteness, code transparency is still helpful, easy to implement, and thus something we should see more often as time goes by.

> What about other app repositories such as Amazon?

[To my current knowledge](https://developer.amazon.com/docs/app-submission/understanding-submission.html#code_wrapper), the Amazon Appstore has always been wrapping APKs with their own code (including their own trackers), and this means they were effectively resigning submitted APKs.

If you understood correctly the information above, Google can't do this for apps that haven't opted in Play App Signing. As for apps concerned by Play App Signing, while Google could technically introduce their own code like Amazon, they wouldn't do that without telling about it since this will be easily noticeable by the developer and more globally researchers. They have other means on the Android app development platform to do so. Believing they won't do that based on this principle is not a strong guarantee, however: hence the above paragraph about code transparency for app bundles.

Huawei AppGallery seems to have a [similar approach](https://developer.huawei.com/consumer/en/doc/distribution/app/20210812) to Google, where submitted apps could be developer-signed, but newer apps will be resigned by Huawei.

## 2. Slow and irregular updates
Since you're adding one more party to the mix, that party is now responsible for delivering proper builds of the app: it's a common thing among traditional Linux distributions and their packaging system. They have to catch up with *upstream* on a regular basis, but very few do it well (Arch Linux comes to my mind). Others, like Debian, prefer making extensive *downstream* changes and delivering security fixes for a subset of vulnerabilities assigned to a CVE (yeah, it's as bad as it sounds, but that's another topic).

Not only does F-Droid require specific changes for the app to comply with its inclusion policy, which often leads to more maintenance work, it also has a rather strange way of triggering new builds. Part of its build process seems to be [automated](https://f-droid.org/en/docs/FAQ_-_App_Developers/), which is the least you could expect. Now here's the thing: app signing keys are on an **air-gapped server** (meaning it's disconnected from any network, at least that's what they claim: see [their recommendations](https://f-droid.org/docs/Building_a_Signing_Server/) for reference), which forces an irregular update cycle where a human has to manually trigger the signing process. It is far from an ideal situation, and you may argue it's the least to be expected since by entrusting all the signing keys to one party, you could also introduce a single point of failure. Should their system be compromised (whether from the inside or the outside), this could lead to serious security issues affecting plenty of users.

*This is one of the main reasons why Signal refused to support the inclusion of a third-party build in the F-Droid official repository. While [this GitHub issue](https://github.com/signalapp/Signal-Android/issues/127) is quite old, many points still hold true today.*

Considering all this, and the fact that their build process is often broken using outdated tools, you have to expect **far slower updates** compared to a traditional distribution system. Slow updates mean that you will be exposed to security vulnerabilities more often than you should've been. It would be unwise to have a full browser updated through the F-Droid official repository, for instance. F-Droid third-party repositories somewhat mitigate the issue of slow updates since they can be managed directly by the developer. It isn't ideal either as you will see below.

## 3. Low target API level (SDK) for client & apps
SDK stands for *Software Development Kit* and is the collection of software to build apps for a given platform. On Android, a higher SDK level means you'll be able to make use of modern API levels of which each iteration brings **security and privacy improvements**. For instance, API level 31 makes use of all these improvements on Android 12.

As you may already know, Android has a strong sandboxing model where each application is sandboxed. You could say that an app compiled with the highest API level benefits from all the latest improvements brought to the app sandbox; as opposed to outdated apps compiled with older API levels, which have a **weaker sandbox**.

```
# b/35917228 - /proc/misc access
# This will go away in a future Android release
allow untrusted_app_25 proc_misc:file r_file_perms;

# Access to /proc/tty/drivers, to allow apps to determine if they
# are running in an emulated environment.
# b/33214085 b/33814662 b/33791054 b/33211769
# https://github.com/strazzere/anti-emulator/blob/master/AntiEmulator/src/diff/strazzere/anti/emulator/FindEmulator.java
# This will go away in a future Android release
allow untrusted_app_25 proc_tty_drivers:file r_file_perms;
```

This is a mere sample of the [SELinux exceptions](https://android.googlesource.com/platform/system/sepolicy/+/refs/tags/android-12.0.0_r21/private) that have to be made on older API levels so that you can understand why it matters.

It turns out the official F-Droid client doesn't care much about this since it lags behind quite a bit, **[targeting the API level 25](https://gitlab.com/fdroid/fdroidclient/-/blob/2a8b16683a2dbee16d624a58e7dd3ea1da772fbd/app/build.gradle#L33)** (Android 7.1) of which some SELinux exceptions were shown above. As a workaround, some users recommended third-party clients such as [Foxy Droid](https://f-droid.org/en/packages/nya.kitsunyan.foxydroid/) or [Aurora Droid](https://f-droid.org/en/packages/com.aurora.adroid/). While these clients might be technically better, they're poorly maintained for some, and they also introduce yet another party to the mix. [Droid-ify](https://github.com/Iamlooker/Droid-ify) (recently rebranded to Neo-Store) seems to be a better option than the official client in most aspects.

Furthermore, F-Droid **doesn't enforce a minimum target SDK** for the official repository. Play Store [does that quite aggressively](https://developer.android.com/google/play/requirements/target-sdk) for new apps and app updates:

- Since August 2021, Play Store requires new apps to target at least API level 30.
- Since November 2021, existing apps must at least target API level 30 for updates to be submitted.

While it may seem bothersome, it's a necessity to keep the **app ecosystem modern and healthy**. Here, F-Droid sends the wrong message to developers (and even users) because they should care about it, and this is why many of us think it may be even harmful to the FOSS ecosystem. Backward compatibility is often the enemy of security, and while there's a middle-ground for convenience and obsolescence, it shouldn't be exaggerated. As a result of this philosophy, the main repository of F-Droid is filled with obsolete apps from another era, just for these apps to be able to run on the more than ten years old Android 4.0 Ice Cream Sandwich. Let's not make the same mistake as the desktop platforms: instead, complain to your vendors for selling devices with no decent OS/firmware support.

There is little practical reason for developers not to increase the target SDK version (`targetSdkVersion`) along with each Android release. This attribute matches the version of the platform an app is targeting, and allows access to modern improvements, rules and features on a modern OS. The app can still ensure backwards compatibility in such a way that it can run on older platforms: the `minSdkVersion` attribute informs the system about the minimum API level required for the application to run. Setting it too low isn't practical though, because this requires having a lot of fallback code (most of it is handled by common libraries) and separate code paths.

At the time of writing:
- Android 9 is the oldest Android version that is [getting security updates](https://endoflife.date/android).
- [~80% of the Android devices](https://developer.android.com/about/dashboards) used in the world are **at least** running 8.0 Oreo.

*Overall statistics do not reflect real-world usage of a given app (people using old devices are not necessarily using your app). If anything, it should be viewed as an underestimation.*

## 4. General lack of good practices
The F-Droid client allows multiple repositories to coexist within the same app. Many of the issues highlighted above were focused on the main official repository which most of the F-Droid users will use anyway. However, having **other repositories in a single app also violates the security model of Android** which was not designed for this at all. The OS expects you to trust **an app repository as a single source** of apps, yet F-Droid isn't that by design as it mixes several repositories in one single app. This is important because the OS management APIs and features (such as [UserManager](https://developer.android.com/reference/android/os/UserManager) which can be used to prevent a user from installing third-party apps) are not meant for this and see F-Droid as a single source, so you're trusting the app client to not mess up far more than you should, especially when the **privileged extension** comes into the picture.

There is indeed a serious security issue with the OS first-party source feature being misused, as the privileged extension makes use of the `INSTALL_PACKAGES` [API](https://developer.android.com/reference/android/Manifest.permission#INSTALL_PACKAGES) in an insecure manner (i.e. not implementing it with the appropriate security checks). The privileged extension accepts any request from F-Droid, which again suffers from various bugs and security issues and allows user-defined repositories by design. A lot can go wrong, and bypassing security checks for powerful APIs should definitely not be taken lightly.

On that note, it is also worth noting the repository metadata format isn't properly signed by lacking whole-file signing and key rotation. [Their index v1](https://f-droid.org/2021/02/05/apis-for-all-the-things.html#the-repo-index) format [uses JAR signing](https://gitlab.com/fdroid/fdroidserver/-/blob/3182b77d180b2313f4fdb101af96c035380abfd7/fdroidserver/signindex.py) with `jarsigner`, which has serious security flaws. It seems that [work is in progress on a v2 format](https://gitlab.com/fdroid/fdroidserver/-/commit/3182b77d180b2313f4fdb101af96c035380abfd7) with support for `apksigner`, although the final implementation remains to be seen. This just seems to be an over-engineered and flawed approach since better suited tools such as `signify` could be used to sign the metadata JSON.

As a matter of fact, the [new unattended update API](https://developer.android.com/reference/android/Manifest.permission#UPDATE_PACKAGES_WITHOUT_USER_ACTION) added in API level 31 (Android 12) that allows seamless app updates for app repositories without [privileged access](https://f-droid.org/en/packages/org.fdroid.fdroid.privileged/) to the system (such an approach is not compatible with the security model) won't work with F-Droid "as is". It should be mentioned that the aforementioned third-party client [Neo-Store](https://github.com/Iamlooker/Droid-ify/issues/20) supports this API, although the underlying issues about the F-Droid infrastructure largely remain. Indeed, this secure API allowing for unprivileged unattended updates not only requires for the app repository client to target API level 31, but the apps to be updated also have to at least target API level 29.

Their client also lacks **TLS certificate pinning**, unlike Play Store which improves security for all connections to Google (they generally use a limited set of root CAs including [their own](https://pki.goog/)). Certificate pinning is a way for apps to increase the security of their connection to services [by providing a set of public key hashes](https://developer.android.com/training/articles/security-config#CertificatePinning) of known-good certificates for these services instead of trusting pre-installed CAs. This can avoid some cases where an interception (*man-in-the-middle* attack) could be possible and lead to various security issues considering you're trusting the app to deliver you other apps.

It is an important security feature that is also straightforward to implement using the [declarative network security configuration](https://developer.android.com/training/articles/security-config) available since Android 7.0 (API level 24). See how GrapheneOS pins both root and CA certificates in their [app repository client](https://github.com/GrapheneOS/Apps):

```xml
<!-- res/xml/network_security_config.xml -->
<network-security-config>
    <base-config cleartextTrafficPermitted="false"/>
    <domain-config>
        <domain includeSubdomains="true">apps.grapheneos.org</domain>
        <pin-set>
            <!-- ISRG Root X1 -->
            <pin digest="SHA-256">C5+lpZ7tcVwmwQIMcRtPbsQtWLABXhQzejna0wHFr8M=</pin>
            <!-- ISRG Root X2 -->
            <pin digest="SHA-256">diGVwiVYbubAI3RW4hB9xU8e/CH2GnkuvVFZE8zmgzI=</pin>
            <!-- Let's Encrypt R3 -->
            <pin digest="SHA-256">jQJTbIh0grw0/1TkHSumWb+Fs0Ggogr621gT3PvPKG0=</pin>
            <!-- Let's Encrypt E1 -->
            <pin digest="SHA-256">J2/oqMTsdhFWW/n85tys6b4yDBtb6idZayIEBx7QTxA=</pin>
            ...
        </pin-set>
    </domain-config>
</network-security-config>
```

To be fair, they've thought several times about adding certificate pinning to their client [at least for the default repositories](https://gitlab.com/fdroid/fdroidclient/-/issues/105). [Relics of preliminary work](https://gitlab.com/fdroid/fdroidclient/-/blob/1.14-alpha4/app/src/main/java/org/fdroid/fdroid/FDroidCertPins.java) can even be found in their current codebase, but it's unfortunate that they haven't been able to find [any working implementation](https://github.com/f-droid/fdroidclient/commit/7f78b46664981b9b73cadbfdda6391f6fe939c77) so far. Given the overly complex nature of F-Droid, that's largely understandable.

F-Droid also has a problem regarding the adoption of **[new signature schemes](https://source.android.com/security/apksigning)** as they [held out on the v1 signature scheme](https://forum.f-droid.org/t/why-f-droid-is-still-using-apk-signature-scheme-v1/10602) (which was [horrible](https://www.xda-developers.com/janus-vulnerability-android-apps/) and deprecated since 2017) until they were forced by Android 11 requirements to support the newer v2/v3 schemes (v2 was introduced in Android 7.0). Quite frankly, this is straight-up bad, and **signing APKs with GPG** is no better considering [how bad PGP and its reference implementation GPG are](https://latacora.micro.blog/2019/07/16/the-pgp-problem.html) (even Debian [is trying to move away from it](https://wiki.debian.org/Teams/Apt/Spec/AptSign)). Ideally, F-Droid should fully move on to newer signature schemes, and should completely phase out the legacy signature schemes which are still being used for some apps and metadata.

## 5. Confusing UX
It is worth mentioning that their website has (for some reason) always been hosting an [outdated APK of F-Droid](https://forum.f-droid.org/t/why-does-the-f-droid-website-nearly-always-host-an-outdated-f-droid-apk/6234), and this is still the case today, leading to many users wondering why they can't install F-Droid on their secondary user profile (due to the downgrade prevention enforced by Android). "Stability" seems to be the main reason mentioned on their part, which doesn't make sense: either your version isn't ready to be published in a stable channel, or it is and new users should be able to access it easily.

F-Droid should enforce the approach of prefixing the package name of their alternate builds with `org.f-droid` for instance (or add a `.fdroid` suffix as some already have). Building and signing while **reusing the package name** ([application ID](https://developer.android.com/studio/build/configure-app-module)) is bad practice as it causes **signature verification errors** when some users try to update/install these apps from other sources, even directly from the developer. That is again due to the security model of Android which enforces a signature check when installing app updates (or installing them again in a secondary user profile). Note that this is going to be an issue with Play App Signing as well, and developers are encouraged to follow this approach should they intend to distribute their apps through different distribution channels.

This results in a confusing user experience where it's hard to keep track of who signs each app, and from which repository the app should be downloaded or updated.

## 6. Misleading permissions approach
F-Droid shows a list of the [low-level permissions](https://developer.android.com/reference/android/Manifest.permission) for each app: these low-level permissions are usually grouped in the standard high-level permissions (Location, Microphone, Camera, etc.) and special toggles (nearby Wi-Fi networks, Bluetooth devices, etc.) that are explicitly based on a type of sensitive data. While showing a list of low-level permissions could be useful information for a developer, it's often a **misleading** and inaccurate approach for the end-user. Since Android 6, apps have to [request the standard permissions at runtime](https://developer.android.com/guide/topics/permissions/overview#runtime) and do not get them simply by being installed, so showing all the "under the hood" permissions without proper context is not useful and makes the permission model unnecessarily confusing.

F-Droid claims that these low-level permissions are relevant because they support Android 5.1+, meaning they support very outdated versions of Android where apps could have [install-time permissions](https://source.android.com/devices/tech/config/runtime_perms). Anyway, if a technical user wants to see all the manifest permissions for some reason, then they can access the app manifest pretty easily (in fact, exposing the raw manifest would be less misleading). But this is already beyond the scope of this article because anyone who cares about privacy and security wouldn't run a 8 years old version of Android that has not received security updates for years.

A [discussion about this](https://gitlab.com/fdroid/fdroid-website/-/merge_requests/834) took place on F-Droid's GitLab repository. In short, F-Droid downplayed the issue with their misleading permission labels, and their lead developer proceeded to call the Android permission model a "dumpster fire" and claim that the operating system cannot sandbox untrusted apps while still remaining useful.

*To clear up confusion: even apps targeting an API level below 23 (Android 5.1 or older) do not have permissions granted at install time on modern Android, which instead displays a legacy permission grant dialog. Whether or not permissions are granted at install time does not just depend on the app's `targetSdkVersion`. And even if this were the case, the OS package installer on modern Android would've been designed to show the requested permissions for those legacy apps.*

For example, the low-level permission `RECEIVE_BOOT_COMPLETED` is referred to in F-Droid as the *run at startup* description, when in fact this permission is not needed to start at boot and just refers to a specific time broadcasted by the system once it finishes booting, and is not about background usage (though power usage may be a valid concern). To be fair, these short summaries used to be provided by the Android documentation years ago, but the permission model has drastically evolved since then and most of them aren't accurate anymore.

> *Allows the app to have itself started as soon as the system has finished booting. This can make it take longer to start the phone and allow the app to slow down the overall phone by always running.*

In modern Android, the background restriction toggle is what really provides the ability for apps to run in the background. Some low-level permissions don't even have a security/privacy impact and shouldn't be misinterpreted as having one. Anyhow, you can be sure that each dangerous low-level permission has a **high-level representation** that is **disabled by default** and needs to be **granted dynamically** to the app (by a toggle or explicit user consent in general).

Another example to illustrate the shortcomings of this approach would be the `QUERY_ALL_PACKAGES` low-level permission, which is referred to as the *query all packages* permission that "allows an app to see all installed packages". While this is somewhat correct, this can also be misleading: apps do not need `QUERY_ALL_PACKAGES` to list other apps within the same user profile. Even without this permission, some apps are visible automatically (visibility is restricted by default [since Android 11](https://developer.android.com/training/package-visibility)). If an app needs more visibility, it will declare a `<queries>` element in its manifest file: in other words, `QUERY_ALL_PACKAGES` is only one way to achieve visibility. Again, this goes to show low-level manifest permissions are not intended to be interpreted as high-level permissions the user should fully comprehend.

Play Store for instance conveys the permissions in a way less misleading way: the main low-level permissions are first grouped in their high-level user-facing toggles, and the rest is shown under "Other". This permission list can only be accessed by taping "About this app" then "App permissions - See more" at the bottom of the page. Play Store will tell the app may request access to the following permissions: this kind of wording is more important than it seems. *Update: since July 2022, Play Store doesn't offer a way to display low-level permissions anymore.*

Moreover, [Play Store restricts the use of highly invasive permissions](https://support.google.com/googleplay/android-developer/answer/9888170) such as `MANAGE_EXTERNAL_STORAGE` which allows apps to opt out of scoped storage if they can't work with [more privacy friendly approaches](https://developer.android.com/guide/topics/providers/document-provider) (like a file explorer). Apps that can't justify their use of this permission (which again has to be granted dynamically) may be removed from Play Store. This is where an app repository can actually be useful in their review process to protect end-users from installing poorly made apps that might compromise their privacy. Not that it matters much if these apps target very old API levels that are inclined to require invasive permissions in the first place...

## Conclusion: what should you do?
So far, you have been presented with referenced facts that are easily verifiable. In the next part, I'll allow myself to express my own thoughts and opinions. You're free to disagree with them, but don't let that overshadow the rest.

While some improvements could easily be made, I don't think F-Droid is in an ideal situation to solve all of these issues because some of them are **inherent flaws** in their architecture. I'd also argue that their core philosophy is not aligned with some security principles expressed in this article. In any case, I can only wish for them to improve since they're one of the most popular alternatives to commercial app repositories, and are therefore trusted by a large userbase.

F-Droid is often seen as the only way to get and support open-source apps: that is not the case. Sure, F-Droid could help you in finding FOSS apps that you wouldn't otherwise have known existed. Many developers also publish their FOSS apps on the **Play Store** or their website directly. Most of the time, releases are available on **GitHub**, which is great since each GitHub releases page has an Atom feed. If downloading APKs from regular websites, you can use `apksigner` to validate the authenticity by comparing the certificate fingerprint against the fingerprint from another source (it wouldn't matter otherwise).

This is how you may proceed to get the app certificate:

```
apksigner verify --print-certs --verbose myCoolApp.apk
```

Also, as written above: the OS pins the app signature (for all profiles) upon installation, and enforces signature check for app updates. In practice, this means the source doesn't matter as much after the initial installation.

For most people, I'd recommend just **sticking with Play Store**. Play Store isn't quite flawless, but emphasises the adoption of modern security standards which in turn encourages better privacy practices; as strange as it may sound, Google is not always doing bad things in that regard.

*Note: this article obviously can't address all the flaws related to Play Store itself. Again, the main topic of this article is about F-Droid and should not be seen as an exhaustive comparison between different app repositories.*

> Should I really care?

**It's up to your threat model**, and of course your personal preferences. Most likely, your phone won't turn into a nuclear weapon if you install F-Droid on it - and this is far from the point that this article is trying to make. Still, I believe the information presented will be valuable for anyone who values a **practical approach to privacy** (rather than an ideological one). Such an approach is partially described below.

> But there is more malware in Play Store! How can you say that it's more secure?

As explained above, it doesn't matter as you shouldn't really rely on any quality control to be the sole guarantee that a software is free of malicious or exploitable code. Play Store and even the Apple App Store may have a considerable amount of malware because a full reverse-engineering of any uploaded app isn't feasible realistically. However, they fulfill their role quite well, and that is all that is expected of them.

> With Play App Signing being effectively enforced for new apps, isn't Play Store as "flawed" as F-Droid?

I've seen this comment repeatedly, and it would be dismissing all the other points made in this article. Also, I strongly suggest that you carefully read the sections related to Play App Signing, and preferably the official documentation on this matter. It's not a black and white question and there are many more nuances to it.

> Aren't open-source apps more secure? Doesn't it make F-Droid safer?

You can still find and get your open-source apps elsewhere. And no, open-source apps [aren't necessarily more private or secure](https://seirdy.one/2022/02/02/floss-security.html). Instead, you should rely on the strong security and privacy guarantees provided by a modern operating system with **a robust sandboxing/permission model**, namely modern Android, GrapheneOS and iOS. Pay close attention to the permissions you grant, and avoid legacy apps as they could require invasive permissions to run.

When it comes to *trackers* (this really comes up a lot), you shouldn't believe in the flawed idea that you can enumerate all of them. The *enumerating badness* approach is [known to be flawed in the security field](https://www.ranum.com/security/computer_security/editorials/dumb/), and the same applies to privacy. You shouldn't believe that a random script can detect every single line of code that can be used for data exfiltration. Data exfiltration can be properly prevented in the first place by the permission model, which again **denies access to sensitive data by default**: this is a simple, yet rigorous and effective approach.

No app should be unnecessarily entrusted with any kind of permission. It is only if you deem it necessary that you should allow access to a type of data, and this access should be as fine-grained as possible. That's the way the Android platform works (regular apps run in the explicit `untrusted_app` domain) and continues evolving. Contrary to some popular beliefs, usability and most productivity tasks can still be achieved in a secure and private way.

> Isn't Google evil? Isn't Play Store spyware?

Some people tend to exaggerate the importance of Google in their threat model, at the cost of pragmatism and security/privacy good practices. Play Store isn't spyware and can run unprivileged like it does on GrapheneOS (including with unattended updates support). On the vast majority of devices though, Google Play is a privileged app and a core part of the OS that provides low-level system modules. In that case, the trust issues involved with Play App Signing could be considered less important since Google Play is already trusted as a privileged component.

**Play Store evidently has some privacy issues** given it's a proprietary service which requires an account (this cannot be circumvented), and Google services have a history of nagging users to enable privacy-invasive features. Again, some of these privacy issues can be mitigated by setting up the [Play services compatibility layer from GrapheneOS](https://grapheneos.org/usage#sandboxed-google-play) which runs Play services and Play Store in the regular app sandbox (the `untrusted_app` domain). [ProtonAOSP also shares that feature](https://protonaosp.org/features#privacy-and-security). This solution could very well be ported to other Android-based operating systems. If you want to go further, consider using a properly configured account with the least amount of personally indentifiable information possible (note that the phone number requirement appears to be region-dependent).

If you don't have Play services installed, you can use a third-party Play Store client called **[Aurora Store](https://auroraoss.com/)**. Aurora Store has some issues of its own, and some of them overlap in fact with F-Droid. Aurora Store somehow still requires [the legacy storage permission](https://gitlab.com/AuroraOSS/AuroraStore/-/blob/26f5d4fd558263a89baee4c3cbe1d220913da104/app/src/main/AndroidManifest.xml#L28-32), has yet to [implement certificate pinning](https://gitlab.com/AuroraOSS/AuroraStore/-/issues/697), has been known to sometimes retrieve wrong versions of apps, and [distributed account tokens](https://gitlab.com/AuroraOSS/AuroraStore/-/issues/722) over [cleartext HTTP](https://gitlab.com/AuroraOSS/AuroraStore/-/issues/734) until fairly recently; not that it matters much since tokens were designed to be shared between users, which is already concerning. I'd recommend against using the shared "anonymous" accounts feature: you should make your own throwaway account with minimal information.

### Looking to the future

**[Accrescent](https://accrescent.app/)** is an up-and-coming app repository which strives to tackle the issues discussed here [and more](https://accrescent.app/features). Hopefully Accrescent or a project like it can flourish as a secure and open ecosystem for app delivery.

It's also worth keeping an eye on the great work **GrapheneOS** does on [their future app repository](https://github.com/GrapheneOS/Apps). It will serve as a simple, secure, modern app repository, albeit only for a curated list of high-quality apps, some of which will have their own builds (for instance, Signal still uses their [original 1024-bits RSA key](https://github.com/signalapp/Signal-Android/issues/9362) that has never been rotated since then).

---

## Meta

This article aims to be **purely technical**. It is not an attack on F-Droid or their mission --- it is meant as an informative piece for end users and a springboard for improvement of the F-Droid project.

In spite of this, the release of this article has unfortunately triggered a mostly negative response from the F-Droid team and some of their community, who seem to take a dismissive stance toward this article rather than bringing relevant counterpoints. Some of these individuals go as far as engaging in harassment campaigns against projects and security researchers that do not share their views; hopefully they realize that such unethical behavior undermines their own project and reputation. Creating a rift between developers and security researchers is not in anyone's best interest.

Some individuals have also falsely associated this article with GrapheneOS. _This article is an entirely independent work and unrelated to the GrapheneOS project. It was not written by a GrapheneOS developer and does not claim to represent the GrapheneOS project's official stance._ Either way, dismissing the article on the basis of association instead of addressing the actual technical content is silly and not helpful to anyone.