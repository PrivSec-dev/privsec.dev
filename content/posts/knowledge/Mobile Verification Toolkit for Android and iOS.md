---
title: "Mobile Verification Toolkit for Android and iOS"
date: 2023-05-16
tags: ['Knowledge base', 'Privacy', 'Security', 'Android', 'iOS']
author: Raja Grewal
---

One of the key principle components involved in maintaining both strong privacy and security infrastructure is the detection of existing and previous compromises. On mobile operating systems such as Android and iOS/iPadOS it is difficult for a end-user to execute this type of search given the lock down nature of these devices. While their respective app stores have a plethora of so-call “anti-virus” programs, these are subject to the same [pitfalls](https://privsec.dev/posts/knowledge/badness-enumeration/#antiviruses) as their desktop variants.

Building on this, both independent and mainstream media are constantly awash with stories regarding the frequent discoveries of sophisticated malware installed on users phones that have the ability totally compromise a device by giving external parties effectively root access. The most well-known of these variants of spyware target hitherto unknown zero-day exploits as thoroughly discussed by [Amnesty International Security Lab](https://www.amnesty.org/en/tech/) and [The Citizen Lab](https://citizenlab.ca/).

For example, there is very little any end-user can do to detect intrusions by the infamous Pegasus spyware made by the NSO Group, see [[1](https://citizenlab.ca/2016/08/million-dollar-dissident-iphone-zero-day-nso-group-uae/), [2](https://citizenlab.ca/2020/12/the-great-ipwn-journalists-hacked-with-suspected-nso-group-imessage-zero-click-exploit/), [3](https://www.amnesty.org/en/latest/research/2021/07/forensic-methodology-report-how-to-catch-nso-groups-pegasus/), [4](https://forbiddenstories.org/case/the-pegasus-project/), [5](https://citizenlab.ca/2022/01/project-torogoz-extensive-hacking-media-civil-society-el-salvador-pegasus-spyware/), [6](https://citizenlab.ca/2022/02/bahraini-activists-hacked-with-pegasus/), [7](https://citizenlab.ca/2022/04/peace-through-pegasus-jordanian-human-rights-defenders-and-journalists-hacked-with-pegasus-spyware/), [8](https://citizenlab.ca/2022/04/uk-government-officials-targeted-pegasus/), [9](https://citizenlab.ca/2022/07/geckospy-pegasus-spyware-used-against-thailands-pro-democracy-movement/), [10](https://citizenlab.ca/2022/10/new-pegasus-spyware-abuses-identified-in-mexico/), [11](https://citizenlab.ca/2023/04/nso-groups-pegasus-spyware-returns-in-2022/)]. Other high-profile recent examples of mercenary spyware vendors include [Candiru](https://citizenlab.ca/2021/07/hooking-candiru-another-mercenary-spyware-vendor-comes-into-focus/), [Cytrox](https://citizenlab.ca/2021/12/pegasus-vs-predator-dissidents-doubly-infected-iphone-reveals-cytrox-mercenary-spyware/), an [undisclosed company](https://www.amnesty.org/en/latest/news/2023/03/new-android-hacking-campaign-linked-to-mercenary-spyware-company/), and [QuaDream](https://citizenlab.ca/2023/04/spyware-vendor-quadream-exploits-victims-customers/).

It should also be recognised and stressed that being targeted by complex mercenary spyware is an expensive undertaking and so the overwhelming majority individuals are very unlikely to be affected. The confirmed targets involve politicians, activists, developers of AI-based guidance systems, lawyers, journalists, and whistleblowers. See The Citizen Lab's [publication list](https://citizenlab.ca/publications/) for more references.

## Detecting traces of known compromise with `mvt`

Fortunately, [Amnesty International Security Lab](https://www.amnesty.org/en/tech/) have made public their [Mobile Verification Toolkit (MVT)](https://docs.mvt.re/en/latest/) to facilitate the consensual forensic analysis of Android and iOS/iPadOS devices for the purposes of identifying traces of compromise. As discussed in "Limitations" further below, it should be stressed that that this tool can only prove a positive, not a negative. If a device is infected, there is nothing stopping it from reporting a negative even though it actually is compromised.

MVT analyses your device for a broad range of known historical indicators of compromise obtained from a wide range of sources including [Amnesty Tech](https://github.com/AmnestyTech/investigations) and [Echap](https://github.com/AssoEchap/stalkerware-indicators). As such, use of this tool can not provide any sort of guarantee against an attack from a sophisticated actor as they would be well-aware of what MVT is capable of detecting. Note the tool is currently only accessible using the command line interface.

The software can be installed from some of the following sources:
- Arch Linux [package](https://archlinux.org/packages/community/any/mvt/)
- GitHub [repository](https://github.com/mvt-project/mvt)
- PyPi [package](https://pypi.org/project/mvt/)

For iOS/iPadOS devices, if you decide to back up data with `libimobiledevice` instead of iTunes, you may need to install from source using a `git clone` of the [repository](https://github.com/libimobiledevice/libimobiledevice) as opposed to using the latest [release](https://github.com/libimobiledevice/libimobiledevice/releases) in order for it to be compatible with more recent iOS releases as there can often be a large time delay between `libimobiledevice` releases.

Next, always ensure either the `mvt-android download-iocs` or `mvt-ios download-iocs` command is performed prior to a scan to ensure the latest indicators have been obtained.

The instructions for then using the software are fairly straight-forward to learn when performing both [Android](https://docs.mvt.re/en/latest/android/methodology/) or [iOS/iPadOS](https://docs.mvt.re/en/latest/ios/methodology/) analyses. In both cases it is advised to always analyse encrypted backups as these will incorporate the scanning of more files.

While an even more thorough scan can be performed by rooting Android and jailbreaking iOS/iPadOS due to more internal logs being accessible, this is strictly [not recommended](https://madaidans-insecurities.github.io/android.html#rooting). One situation where this might be advised is if your now using another device and desire extended scans of no longer used devices.

Regardless, it should be noted that Android devices currently provide far less diagnostic information that iOS/iPadOS devices and so `mvt` capabilities are correspondingly diminished.

Overall, it should be clear from the command line outputs if any known compromises are detected. Additional output details at conclusion will also then provided in the format of a timeline CSV and an assortment of JSON files. If any files ending with “_detected.json” are present, this implies your device shows evidence of past and/or present compromise using the currently available list indicators.

## Privilege escalation from user error
It should be recognised that [MVT's documentation](https://docs.mvt.re/en/latest/introduction) states that "MVT is not intended for end-user self-assessment". We believe this statement is far more than just a standard policy disclosure.

If you run the tool as described above you will find considerable amounts of highly private and sensitive information regarding the contents of your device are outputted and stored in an unencrypted manner and so are at risk of being compromised. In particular, the timeline CSV contains incredibly personal information, as is the case with many of the other JSON files.

These issues are also greatly exacerbated for iOS/iPadOS devices as their entire unencrypted contents must be transferred to the device performing the scan. The generate timeline CSV also provides a (partial) history of almost all events for not just the device being analysed but the entire Apple account (includes all previous devices). Note this is also one of the reasons why iOS/iPadOS analyses are much more comprehensive than their Android counterparts.

Overall, the disclaimer is more than reasonable since on the balance of probabilities, Android and iOS/iPadOS [tend to be far more secure](https://madaidans-insecurities.github.io/security-privacy-advice.html#operating-system) than operating systems available on desktops and laptops. Ultimately then, utilisation of MVT can inadvertently lead to making it easier for threat actors to get access to the contents of your mobile device if they already have control over the system performing the `mvt` scan. This is a form of privilege escalation due to the user not managing their data properly.

Therefore we highlight a few strict requirements prior to using `mvt`. First ensure you have full control over the desktop/laptop used to conduct the scan, do not use shared or work computers. The desktop/laptop operating system must also be hardened as much as feasibly possible.

Next, for transferring internal mobile device content, ensure the data is only ever copied to encrypted storage media. Never under any situation use a unencrypted device to store and analyse the mobile device data since data recovery of ‘deleted’ files is very mature profession.

For maximum privacy the author advises the use of [VeraCrypt](https://www.veracrypt.fr/en/Home.html) volumes as these enable robust cross-platform compatibility allowing the seamless construction of containers with pre-determined size using unmodified existing desktop OS installations. Additionally, while there are countless alternatives methods to securely store data such as other disk encryption software or even the use of RAM disks, we ultimately leave this decision to the reader. Regarding the default recommendation of VeraCrypt, there exists substantial evidence from very experienced and well-established practitioners [[1](https://blog.elcomsoft.com/2020/01/a-comprehensive-guide-on-securing-your-system-archives-and-documents/), [2](https://blog.elcomsoft.com/2020/03/breaking-veracrypt-containers/), [3](https://blog.elcomsoft.com/2021/06/breaking-veracrypt-obtaining-and-extracting-on-the-fly-encryption-keys/)] detailing its strengths (despite some theoretical limitations discussed across various online forum threads).

If using VeraCrypt, simply create a new volume prior to a scan and only use this volume for all `mvt` related data. For typical devices the required VeraCrypt volume size for `mvt` outputs depends on the length of history of the device, allocating 1GB should generally be more than sufficient for most cases involving Android devices. For iOS/iPadOS devices, since the entire contents of the devices must also be transferred, allocated volume size must be sufficiently greater than double the size of the all data stored on the mobile devices. Upon completion of the scans, you can transfer `mvt` outputs to other secure similarly storage media for logging purposes, then dismount and delete the VeraCrypt volume which will assist in preventing forensic data recovery.

To emphasise again, extreme care must be taken with the handling and storage of all `mvt` related data. Any leak of this data would be very dangerous as it provides extraordinary amounts of detail regarding the internal contents of the mobile device, the overwhelming of which is even impossible to access on-device.

If you are using `mvt` purely due to a mixture of paranoia and curiosity, after confirming the presence of no malicious indicators, do not retain any scan logs and delete the VeraCrypt volume. For high-risk individuals, retaining periodic scan logs can be beneficial but must be done with appropriately great care.

## Limitations

While `mvt` is a very handy tool and periodic scans should be performed with a frequency proportional to your threat model, it is once again only a detection tool based on [known indicators](https://deploy-preview-86--privsec-dev.netlify.app/posts/knowledge/badness-enumeration/) of compromise. It is also reasonable to assume that once indicators are publicly exposed, sophisticated threat actors will take steps to modify their existing spyware and potentially even temporarily erase it from your device in order to avoid detection. This can be very clearly seen through the time-evolution of NSO Group’s Pegasus infrastructure ([Section 9.3](https://www.amnesty.org/en/latest/research/2021/07/forensic-methodology-report-how-to-catch-nso-groups-pegasus/)) where known malicious domains are quickly replaced. More recently there appears to be shift to using cloud service providers.

Therefore, as with “anti-virus” programs, `mvt` is simply a detection tool with no explicit preventive capabilities, but unlike them, `mvt` does not require extensive administrative permissions at runtime and can be used in a purely offline manner with no telemetry.

## Advanced extensions

Tools like `mvt` are powered by the use of [Structured Threat Information Expression (STIX)](https://oasis-open.github.io/cti-documentation/stix/intro.html) files to identify potential traces of compromise. The existing downloaded indicators can observed on any Linux distribution in the `.local/share/mvt/indicators/` directory of the users home directory. While at first glance these files can be bewildering, their structure is relatively simple when analysed in terms of [relationships between entries](https://oasis-open.github.io/cti-documentation/examples/visualized-sdo-relationships) (graph database) and their respective [definitions](https://docs.oasis-open.org/cti/stix/v2.0/stix-v2.0-part2-stix-objects.html).

The large flexibility of this format combined with ready-made tools like `mvt` have the capacity to empower any end-user to perform fully customised deep scans of their mobile devices using indicators of their choosing. One application of this incredibly powerful method is to allow anyone (with minimal `mvt` modifications) to comprehensively detect in the history of their device the presence any user-defined domain, server, or connection deemed to be suspicious.

While this certainly has the potential to cause excessively high amounts of false positives if benign indicators are selected, the feature is much appreciated.

TO BE PUBLISHED:
- Explain STIX 2.0 formatting for simple detection rules.
- Walkthrough example on how to perform a custom scan looking for all references to a particular domain on both Android and iOS/iPadOS.
