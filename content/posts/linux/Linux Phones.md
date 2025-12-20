---
title: "Linux Phones"
date: 2022-03-06
tags: ['Operating Systems', 'Linux', 'Security']
author: madaidan
---

Linux phones, such as the Librem 5 or Pinephone, are a major degradation from traditional mobile operating systems, such as Android or iOS. A few of the points in this article do apply to the Librem 5 specifically, but the majority applies to any Linux phone unless specified otherwise.

Linux phones lack any significant security model, and most desktop Linux security issues apply to Linux phones fully. There is not yet a single Linux phone with a sane security model. They do not have modern security features, such as full system MAC policies, verified boot, strong app sandboxing, modern exploit mitigations and so on, which modern Android phones already deploy.
    
Distributions like PureOS are not particularly secure. They are mostly a reskinned Debian and do not include substantial hardening. While AppArmor is enabled, the majority of processes still run unconfined, so that is mostly negligible. PureOS [changes a few security-relevant settings](https://source.puri.sm/pureos/packages/pureos-security-hardening), but these are also mostly negligible:

- PureOS does not apply the exec-shield patch, so that sysctl doesn't even exist in the first place.
- The purpose of disabling kexec is to prevent root from booting a malicious kernel, but [root can do so many other things to modify the kernel](https://mjg59.dreamwidth.org/55105.html), such as loading a kernel module.
- Attempting to hide kernel symbols via 'kptr_restrict' ignores the fact that they're clearly visible in the 'System.map' file on disk, among other sources.
- And finally, disabling source routing is already a Debian default.

PureOS also uses [linux-libre](https://en.wikipedia.org/wiki/Linux-libre). This will prevent the user from loading any proprietary firmware updates, which just so happens to be almost all of them. [The Librem 5 prevents the user from updating new firmware even with an alternative kernel](https://puri.sm/posts/librem5-solving-the-first-fsf-ryf-hurdle/), which forces the user to use outdated and insecure firmware with known vulnerabilities.
   
The hardware itself lacks many modern security features too, such as [proper verified boot](https://source.android.com/security/verifiedboot/), [a hardware-backed keystore](https://source.android.com/security/keystore/) (some PGP smartcard is not equivalent), and more.

Although one way to fix the issues in software would be to install a more sane OS like Android or its derivatives, such as GrapheneOS, if support for the hardware was added. Keep in mind though that it would still lack important hardware and firmware security features like verified boot, so it still isn't close to a normal Android device.

These devices are also not open hardware/firmware unlike what they try to imply. The majority of the hardware/firmware is still proprietary.

## Hardware Kill Switches

Hardware kill switches are nothing but marketing frills.

The microphone kill switch is useless since audio can still be gotten via the sensors (such as the [gyroscope](https://crypto.stanford.edu/gyrophone/files/gyromic.pdf) or [accelerometer](https://dl.acm.org/doi/pdf/10.1145/3309074.3309076)). While the Librem 5 does have a "lockdown mode" that disables the sensors, it also requires flipping all of the other switches, including the network switches, which effectively turns your device into a brick just to prevent audio recording. <br>

The network kill switch has two primary threat models: preventing cell tower triangulation, or preventing data exfiltration after the device has been compromised. The switch is useless in either of these threat models:

- To prevent cell tower triangulation, you can simply enable airplane mode and it is just as effective.
- The network kill switch is useless for preventing data exfiltration since the attacker can just wait until you toggle the switch on again to exfiltrate data. If you need to temporarily disable network access, you can use airplane mode. Airplane mode can be disabled via a software vulnerability, but if an attacker has those capabilities already, then they can also simply sit and record any sensitive data and eventually upload it once you re-enable the hardware network kill switch, making it no more effective than airplane mode.

The camera kill switch can be useful as a small usability improvement, but it is really no better than some tape.

## Modem Isolation

Modem isolation isn't anything special. For example, [Qualcomm SoCs have isolated the modem via an IOMMU for years](https://i.blackhat.com/USA-19/Thursday/us-19-Pi-Exploiting-Qualcomm-WLAN-And-Modem-Over-The-Air-wp.pdf), among others. The unorthodox way in which the Librem 5 attempt to isolate the modem is via the Linux kernel USB stack, which is not a strong barrier.

There is also a lot of misinformation as to how the modem being on a separate chip means it's isolated — this is completely untrue. Just look at how, for example, [FireWire can be abused for DMA](https://en.wikipedia.org/wiki/IEEE_1394#Security_issues) while being completely separate from the rest of the hardware. Whether or not the modem is on a separate chip is irrelevant to if it's isolated.
