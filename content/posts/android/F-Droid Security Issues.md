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

While we've seen that F-Droid controls the signing servers (much like Play App Signing), F-Droid also fully controls the build servers that run the disposable VMs used for building apps. And from June to November of 2022, their guest VM image [officially ran an end-of-life release of Debian LTS](https://gitlab.com/groups/fdroid/-/milestones/5#tab-issues). It is also worth noting that Debian LTS separate project from Debian which attempts to extend the lifetime of releases that are deemed end-of-life by the Debian project and [does not get handled by the Debian Security team](https://wiki.debian.org/LTS). The version they were using (Debian Stretch) was actually discontinued [2 years prior](https://wiki.debian.org/DebianStretch). Undoubtedly, this raises questions about their whole infrastructure security.

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

Their client also lacks **TLS certificate pinning**, unlike Play Store which improves security for all connections to Google (they generally use a limited set of root CAs including [their own](https://pki.goog/)). Certificate pinning is a way for apps to increase the security of their connection to services [by providing a set of public key hashes](https://developer.android.com/training/articles
