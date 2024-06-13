
---
title: "Misinformation on x86 Hardware"
date: 2024-06-10
tags: ['Hardware', 'Security']
author: Tommy
---

While browsing privacy forums, I often see a lot discussions regarding x86 hardware security features. Unfortunately, most of the threads are riped with misinformation. In this post, I will bad advices I have seen.

### Intel CSME and AMD PSP

A very common piece of misinformation among privacy communities is that the Intel Management Engine (ME), its sucessor - [Intel Converged Security and Management Engine (CSME)](https://www.intel.com/content/dam/www/public/us/en/security-advisory/documents/intel-csme-security-white-paper.pdf), and the AMD Platform Security Processor (PSP) are some sort of evil backdoor. Some may go so far as to tell other users to "disable the ME" or to "buy hardware with the ME disabled".

The problems with these recommendations are as follows:

Intel CSME provides security features, including:
- [Boot Guard](https://networkbuilders.intel.com/docs/networkbuilders/secure-the-network-infrastructure-secure-boot-methodologies.pdf) - The basis of Static Root of Trust Measurement (SRTM). It verifies that a significant portion of your EEPROM is signed by your OEM, and provides fuses to prevent downgrade attacks to old, vulnerable versions.
- [Platform Trust Technology](https://www.intel.com/content/www/us/en/support/articles/000094205/processors/intel-core-processors.html) - A firmware TPM implementation. Generally, fTPMs have better security properties when compared to dTPMs, as they stay on the same die as the CPU and are immune to bus sniffing attacks.
- [Modern Standby](https://learn.microsoft.com/en-us/windows-hardware/design/device-experiences/modern-standby) - This is not necessarily a security feature, but Windows does use modern standby to download critical updates even when the computer is in sleep mode.

AMD PSP provides its own set of security features:
- Firmware TPM - serving the same role as Intel's Platform Trust Technology.
- [Secure Encryption Virtualization](https://www.amd.com/en/developer/sev.html) (on Ryzen Pro and EPYC CPUs). SEV both protects the hypervisor from cold boot attacks and makes VM break outs much more difficult.

By buying hardware with Intel CSME disabled, you are **increasing the attack surface** by not having Boot Guard to protect your firmware. Additionally, if you buy hardware so old that you can run `me_cleaner` to disable the ME yourself, it means that these hardware do not have Boot Guard to begin with. In both cases, you will end up with a piece of hardware with no root of trust, and any attempt to implement firmware security will be futile.

I am not aware of any way to disable AMD PSP, but even if this was possible, all that it does is deprive you of useful security features.

This exercise also achieves absolutely nothing to protect against a hypothetical scenario where Intel and AMD are malicious. Intel and AMD do not need the co-processor to implement a backdoor --- they can simply introduce CPU vulnerabilities like Spectre and Meltdown if they want to. If you do not trust a CPU vendor, the only mitigation is to not use said vendor.

### Intel AMT and AMD DASH

Another piece of misinformation regarding CSME is that it is provides some kind of [shady "remote management" system](https://www.fsf.org/blogs/community/active-management-technology) for your computer. In reality, this is the AMT component which only exists on Intel vPro CPUs. It is meant for IT teams to manage systems with technologies like Serial over LAN, Solarwind, etc.

Here are some facts about it:
- You can disable it firmware settings.
- Certain firmware allows you to permanently disable it by blowing an eFuse.
- It is detectable. An easy way is to just go visit port 16992/tcp on your device.
- To be extra sure, you can also run `nmap` to scan the port from a different device.

This is not something hidden, people have accidentally [run into AMT](https://mastodon.lilysthings.org/@i_lost_my_bagel/112228352384742242) on social media.

For attack surface reduction, you should absolutely disable it. If you do not have a vPro laptop and are curious what this looks like, have a look at the [BIOS Simulator for the Thinkpad T14 Gen 5](https://download.lenovo.com/bsco/#/graphicalsimulator/ThinkPad%20T14%20Gen%205%20(21ML,21MM)).

With that said, don't let the scary claims about "remote management" spook you --- if some sort of hypothetical backdoor is actually implemented this way, it will not be hard to detect. There are better ways to implement a backdoor as discussed above, and if you don't trust the CPU vendor you should avoid them as a whole, not just the vPro models.

Some people recommend buying AMD instead of Intel to avoid the possibility of having Intel AMT. However, they also overlook the very simple fact that AMD has an equivalent technology for their Ryzen Pro CPU: [AMD DASH](https://www.amd.com/system/files/documents/out-of-band-client-management-overview.pdf).

### Intel vPro

On the topic of AMT, a lot of people seem to think that vPro is all about AMT and that regular users do not need it. This is far from the truth. Intel vPro Enterprise provides other features that are absolutely relevant outside of corporate usecases:

- Total Memory Encryption - Multi Key. This is AMD SEV's Intel counterpart: it provides memory encryption to protect the host from cold boot attacks and make VM break outs harder. This is a mandatory requirement to meet HSI level 4 on Linux.
- Intel Key Locker - This feature makes it possible to encrypt and decrypt data with an AES key using a key handle instead of the actual encryption key. A key handle can be revoked when the system state changes, such as with a reboot. This feature is not widely used on Linux, although it is already available on Chromebooks with vPro Enterprise.
- Intel Trusted Execution Technology (TXT). This feature implements Dynamic Root of Trust Measurement (DRTM) and is necessary for [System Guard](https://learn.microsoft.com/en-us/windows/security/hardware-security/how-hardware-based-root-of-trust-helps-protect-windows) on Windows. It is a pre-requisite for the Secured-core certification. On Linux, DRTM is not widely used, but Trenchboot is being developed to address that.

It is always best to buy a vPro Enterprise CPU to enjoy all of the security features that Intel has to offer. AMT comes with vPro and is attack surface, but it can easily be disabled as discussed above.

### Restricted Boot

A false claim popularized by the Free Software Foundation is that Secure Boot is somehow [Microsoft's evil attempt to lock users out of their computer by only allowing it to run Microsoft approved software](https://www.fsf.org/campaigns/secure-boot-vs-restricted-boot/whitepaper-web).

In reality, most if not all laptops with UEFI Secure Boot allows you to disable it - you can run whichever operating system you want. While it is true that certain lines of laptops like Razer do not allow custom key enrollment, proper business laptops like Dell Latitude/Precision and Lenovo Thinkpad do. You can enroll your own Secure Boot key and tell your laptop to boot only the system you trust.

Microsoft even went further to make Secure Boot better for end users. Computers with their Secured-core certification provides users with the **Freedom** to disable the Microsoft Secure Boot Third Party Certificate Authority and still have the computers function normally. They **protect** the users from having to sign and trust random **proprietary Option ROMS**. It is great for both users who want to use Windows as their primary system and users who plan to set up a proper Secure Boot system with Linux.

UEFI Secure Boot is not Restricted Boot. It is a building block of Static Root of Trust Measurement and a step towards building a secure boot environment.

### Trusted Platform Module

The Trusted Platform Module (TPM) is very often misunderstood, and there have been plenty of inaccurate claims regarding its capabilities. The reality is this:

- It is a passive chip. It does not have the capability to measure what is going on on a system - it only receive measurements given to it by the firmware, Trusted Execution Technology, bootloader, and so on. It cannot serve as a root of trust, and it cannot verify the integrity of the firmware, firmware settings, operating system status, etc on its own.

- It does not weaken disk encryption when used properly. The TPM provides 2 important properties: it enforces rate limiting, and it pinning a secret against certain PCRs. Rate limiting is useful if the user does not have a strong encryption password, but is not strictly necessary when a diceware encryption passphrase is used. Pinning secrets against PCRs on the other hand are critical, as SRTM and DRTM technologies rely on it to be useful. The general idea is that 