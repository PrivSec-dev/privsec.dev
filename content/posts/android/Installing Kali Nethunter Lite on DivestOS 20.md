---
title: "Installing Kali NetHunter Lite on DivestOS 20.0"
date: 2022-07-18
tags: ['Operating Systems', 'Android', 'Security']
author: Tommy
---

**This will turn your device into a purely penetration testing device, and it will be very insecure for any other purpose. Please do not do this on your daily driver.**

_This procedure should work without modification on many devices using the standard Android bootloader (not Samsung). However, every device has unique quirks that may require special attention._

![Kali NetHunter Lite on a OnePlus 7T](/images/kali-nethunter-op7t.jpg)

Originally, I just needed a device to run packet capture on my other devices. I have a OnePlus 7T laying around which I am not using for anything (since it has already reached its end-of-life), so I thought it would be cool to give it a new purpose. I am using DivestOS here since it is my go&#8209;to Android distribution, but you can use LineageOS or any other distribution if you want to.

Officially, Kali Nethunter only supports OxygenOS based on Android 10 or 11 on my device. However, since there is no security to be had anyways, I decided to have some fun and not do things by the book (their official documentation isn't accurate anyways, as I will explain).

## Installing DivestOS

The installation procedure for DivestOS is pretty straight forward. All you need to do is to head to the [download page](https://divestos.org/pages/devices), download the recovery, then it using fastboot:

```bash
fastboot flash recovery /path/to/the/divestos/recovery.img
```

Next, reboot to recovery:

```bash
fastboot reboot recovery
```

![DivestOS Recovery](/images/divestos-recovery.jpg)

Select Apply Update and Apply Update from ADB:

```bash
adb sideload /path/to/divestos.zip
```

Do not attempt to relock the bootloader&nbsp;--- we need to leave it unlocked to enable privileged access ("rooting") anyways. Do not reboot into the OS at this stage either.

## Installing Magisk and disabling forceencrypt

The official documentation recommends [TWRP](https://twrp.me/) and [Disable_Dm&#8209;Verity_ForceEncrypt](https://forum.xda-developers.com/t/deprecated-universal-dm-verity-forceencrypt-disk-quota-disabler-11-2-2020.3817389/). However, TWRP doesn't exist for Android 12 and above for my device, and Disable_Dm&#8209;Verity_ForceEncrypt is deprecated and doesn't even work on Android 11.

Instead, what we need is just a custom recovery which allows for flashing files with arbitary signatures and a way to disable forceencrypt. Fortunately, the LineageOS Recovery and [Disable Force Encryption NEO](https://forum.xda-developers.com/t/a-b-a-only-script-read-only-erofs-android-10-universal-disable-force-encryption-for-ro-and-rw-neo-stable.4454017/) work for just this.

First, reboot the device into the bootloader.

Then, you need to download the LineageOS Recovery for your device and boot into it:

```bash
fastboot reboot /path/to/the/divestos/recovery.img
```

Next, you just need to do ADB sideload for Disable Force Encryption NEO. It will give you the option to install Magisk and disable forceencrypt, and choose yes on both. The rest of the options are up to you - they are not very important.

## Installing Kali Nethunter Lite

Reboot into your OS and set it up normally. Make sure that encryption is disabled:

![Kali Nethunter Encryption](/images/kali-nethunter-encryption.jpg)

Finally, [download](https://www.kali.org/get-kali/#kali-mobile) the appropriate build for Nethunter and flash it as a Magisk module in the Magisk Manager.

Happy NetHunting!