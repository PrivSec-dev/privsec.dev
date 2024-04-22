---
title: "ChromeOS's Questionable Encryption"
date: 2024-04-15
tags: ['Operating Systems', 'Linux', 'ChromeOS', 'Security']
author: Tommy
---

## How ChromeOS Encryption Works

ChromeOS encrypts user data on the disk by default. The encryption key is protected using a number of factors, which is documented in the [ChromeOS Documentation](https://www.chromium.org/developers/design-documents/tpm-usage/#TOC-Protecting-User-Data-Encryption-Keys).

Essentially, the user's Google account password, when typed into a the Chromebook (with the security chip intact - be it the TPM, Titan C, or some other chips), will give the encryption key to unlock their files. As such, for confidentiality, it is important that the user's Google account password is never exposed to an attacker. If the threat model requires protection against Google or an attacker who has compromised their servers, the password should be hashed client side before being sent to Google's server.

## What Happens in Practice

I was a bit curious as to whether any client side hashing is done when you log into Google services. I had a quick look at the login page in the browser, and apparently, there is none:

![Google Login](/images/google-login.jpg)

As you can see in the screenshot, the login password "mygloriouspassword" is submitted directly to Google's server as part of the payload.

## What This Means

Essentially, this means that if Google is malicious, coerced by the government, or hacked, their servers can record the user password prior to it being hashed. That password can then be used to gain access to the files on the hardware when the attacker gains physical access.

Just to be clear here, this is not a vulnerability, it's just how the system is designed.