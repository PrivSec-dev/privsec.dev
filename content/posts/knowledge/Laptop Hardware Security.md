---
title: "Laptop Hardware Security"
date: 2024-06-10
tags: ['Knowledge base', 'Hardware', 'Security']
author: Tommy
---

While browsing privacy forums, I often see a lot discussions regarding laptop hardware security, especially in regards to resistance against physical attacks. Unfortunately, most of the advice given on these forums are incorrect, recommending people to buy overpriced products that are significantly less secure than standard laptops.

In this post, I will walk you through a quick overview of how hardware security is generally implemented for laptops, what to look for, and what to avoid. We will not discuss Macbooks or Chromebooks, as they are vastly different from normal x86 Windows/Linux hardware.

![Latitude 9440](/images/latitude-9440.jpg)

## The Benchmark

To start off, the best laptops I have found are modern the Dell Latitude/Precision laptops with an Intel vPRO Enterprise CPU. The second best group of laptops I have found are modern Lenovo Thinkpads with Intel vPRO Enterprise or AMD Ryzen Pro CPUs. These are relatively easy to acquire and share these common security properties:

- Have Intel Boot Guard or AMD Platform Secure Boot to protect the firmware
- Have regular firmware updates (Monthly updates for Dell, and Bi-monthly updates for Thinkpads)
- Support firmware updates via the [Linux Vendor Firmware Service](https://www.fwupd.org/)
- Support custom Secure Boot key enrollment
- Support disabling Microsoft third-party certificate authoritity
- Support memory encryption
- Support DRTM technologies
- Meet Secure-cored requirements for Windows
- Meet HSI-4 for Linux
- Still recieve Microcode updates from Intel and AMD

## Boot Security

For boot security, there are 2 different technologies: Static Root of Trust Measurement (SRTM) and Dynamic Root of Trust Measurement (DRTM). I will primarily discuss SRTM here, but I will quickly go over DRTM as well.

### SRTM

In general, SRTM works as follows:
- The public key for the firmware by the OEM is fused into an immutable Root of Trust. With Intel Boot Guard, this will be in the chipset (PCH). With AMD Platform Secure Boot, this will be in the CPU.
- The CPU ensures that a significant portion of firmware from the EEPROM (BIOS chip) is signed by the OEM. This includes the Boot Block.
- The Boot Block performs measurements of the firmware and its settings and submit those measurements to PCR 0.
- The next stages measures things like the firmware configuration, boot loader, partition table, Secure Boot state, and so on. These are submitted to PCR 2,3,5,7, and so on.
- UEFI Secure Boot validates the signature of the bootloader against the Secure Boot database.
- The boot loader submits additional measurements to other PCRs. In the case of GRUB, it will use PCR 8 or 9 for instance.

After the user has set up disk encryption, they can seal a encryption key protector to the TPM against certain PCRs, and optionally protect it with a PIN.

Should an attacker attempt to flash malicious firmware onto the EEPROM, the laptop will refuse to boot, and will throw a Boot Guard / Platform Secure Boot violation. Should they try to downgrade the firmware version, change firmware settings or disable UEFI Secure Boot, PCR 0, 1, and 7 will change respectively. The TPM will not recieve the correct measurements and will not release the encryption key protector.

This is not perfect, and the user still needs to set up additional protection for the boot stages after the boot loader, but it is an okay start and is significantly better than how some vendors try to do it as we will discuss down below.

### DRTM

In general, DRTM works by loading in an ACM binary signed by the CPU vendor along what the system is trying to boot. The ACM binary will perform measurements of the environment and submit the results to certain PCRs. In the case of Intel TXT, PCR 17 and 18 are used. The measurements then can be used to for remote attestation or to release a secret in the TPM if it matches the TPM policy.

On Windows, DRTM is implemented with [System Guard](https://learn.microsoft.com/en-us/windows/security/hardware-security/how-hardware-based-root-of-trust-helps-protect-windows). On Linux, [TrenchBoot](https://trenchboot.org/) is being developed. One application of it would be to provide the Anti Evil Maid setup with Qubes OS.

One important thing here is that DRTM technologies can be bypassed via SMM, so you still need to have some level of trust in your firmware to implement SMM mitigations.