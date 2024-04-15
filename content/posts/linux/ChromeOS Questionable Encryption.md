# ChromeOS's Questionable Encryption

## How ChromeOS Encryption Works

ChromeOS encrypts user data on the disk by default. The encryption key is protected using a number of factors, which is documented in the [ChromeOS Documentation](https://www.chromium.org/chromium-os/chromiumos-design-docs/protecting-cached-user-data/).

Essentially, the user's Google account password, when typed into the Chromebook (with the TPM and what-not intact), will give the encryption key to unlock their files. As such, for confidentiality, it is important that the user's Google account password is never exposed to an attacker. If the threat model requires protection against Google or an attacker who has compromised their servers, the password should be hashed client side before being sent to Google's server.

## What Happens in Practice

I was a bit curious as to whether any client side hashing is done when you log into Google services. I had a quick look at the login page in the browser, and apparently, there is none:

![Google Login](/images/google-login.jpg)

As you can see in the screenshot, the login password is submitted directly to Google's server.

## What This Means

Essentially, this means that if Google is malicious, coerced by the government, or is hacked, their server can record the user password prior to it being hashed. That password can then be used to gain access to the files on the hardware when the attacker gains physical access.

Just to be clear here, this is not a vulnerability, it's just how the system is designed.