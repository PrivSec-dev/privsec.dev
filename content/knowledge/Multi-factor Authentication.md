---
title: "Multi-factor Authentication"
tags: ['knowledge base', 'security']
author: Tommy
---

**Multi-factor authentication** is a security mechanism that requires additional verification beyond your username (or email) and password. This usually comes in the form of a one time passcode, a push notification, or plugging in and tapping a hardware security key.

## Common protocols

### Email and SMS MFA

Email and SMS MFA are examples of the weaker MFA protocols. Email MFA is not great as whoever controls your email account can typically both reset your password and receive your MFA verification. SMS, on the other hand, is problematic due to the lack of any kind of encryption, making it vulnerable to sniffing. [Sim swap](https://en.wikipedia.org/wiki/SIM_swap_scam) attacks, if carried out successfully, will allow an attacker to receive your one time passcode while locking you out of your own account. In certain cases, websites or services may also allow the user to reset their account login by calling them using the phone number used for MFA, which could be faked with a [spoofed CallerID](https://en.wikipedia.org/wiki/Caller_ID_spoofing).

Only use these protocols when it is the only option you have, and be very careful with SMS MFA as it could actually worsen your security.

### Push Confirmations

Push confirmation MFA is typically a notification being sent to an app on your phone asking you to confirm new account logins. This method is a lot better than SMS or email, since an attacker typically wouldn't be able to get these push notifications without having an already logged-in device.

Push comfirmation in most cases rely on a third party provider like [Duo](https://duo.com/). This means that trust is placed in a server that neither you nor your service provider control. A malicious push confirmation server could compromise your MFA or profile you based on which website and account you use with the service.

Even if the push notification application and server is provided by first party as is the case with Microsoft login and [Microsoft Authenticator](https://www.microsoft.com/en-us/security/mobile-authenticator-app), there is still a risk of you accidentally tapping on the confirmation button.

### Time-based One-time Password (TOTP)

TOTP is one of the most common forms of MFA available. When you set up TOTP, you setup a "[shared secret](https://en.wikipedia.org/wiki/Shared_secret)" with the service that you intend to use and store it in your authentication app.

The time-limited code is then derived from the shared secret and the current time. As the code is only valid for a short time, without access to the shared secret, an adversary cannot generate new codes.

If you have a [Yubikey](https://www.yubico.com/), you should store the "shared secrets" on the key itself using the [Yubico Authenticator](https://www.yubico.com/products/yubico-authenticator/) app. After the initial setup, the Yubico Authenticator will only expose the 6 digit code to the machine it is running on, but not the shared secret. Additional security can be set up by requiring touch confirmation, protecting digit codes not in used from a compromised operating system.

Unlike [WebAuthn](#fido-fast-identity-online), TOTP offers no protection against [phishing](https://en.wikipedia.org/wiki/Phishing) or reuse attacks. If an adversary obtains a valid code from you, they may use it as many times as they like until it expires (generally 60 seconds + grace period).

Despite of its short comings, TOTP is considered better and safer than Push Confirmations.

### Yubico OTP

Yubico OTP is an authentication protocol typically implemented in hardware security keys. When you decide to use Yubico OTP, the key will generate a public ID, private ID, and a Secret Key which is then uploaded to the Yubico OTP server.

When logging into a website, all you need to do is to physically touch the security key. The security key will emulate a keyboard and print out a one-time password into the password field.

The service will then forward the one-time password to the Yubico OTP server for validation. A counter is incremented both on the key and Yubico's validation server. The OTP can only be used once, and when a successful authentication occurs, the counter is increased which prevents reuse of the OTP. Yubico provides a [detailed document](https://developers.yubico.com/OTP/OTPs_Explained.html) about the process.

![Yubico OTP](/yubico-otp.png)

The Yubico validation server is a cloud based service, and you're placing trust in Yubico that their server won't be used to bypass your MFA or profile you. The public ID associated with Yubico OTP is reused on every website and could be another avenue for third-parties to profile you. Like TOTP, Yubico OTP does not provide phishing resistance.

Yubico OTP is an inferior protocol compared to TOTP since TOTP does not need trust in a third party server and most security keys that support Yubico OTP (namely the Yubikey and OnlyKey) supports TOTP anyway. Yubico OTP is still better than Push Confirmation, however.

### FIDO (Fast IDentity Online)

[FIDO](https://en.wikipedia.org/wiki/FIDO_Alliance) includes a number of standards; first there was U2F and then later [FIDO2](https://en.wikipedia.org/wiki/FIDO2_Project) which includes the web standard [WebAuthn](https://en.wikipedia.org/wiki/WebAuthn).

U2F and FIDO2 refer to the [Client to Authenticator Protocol](https://en.wikipedia.org/wiki/Client_to_Authenticator_Protocol), which is the protocol between the security key and the computer, such as a laptop or phone. It complements WebAuthn which is the component used to authenticate with the website (the "Relying Party") you're trying to log in on.

WebAuthn is the most secure and private form of second factor authentication. While the authentication experience is similar to Yubico OTP, the key does not print out a one-time password and validate with a third-party server. Instead, it uses [public key cryptography](https://en.wikipedia.org/wiki/Public-key_cryptography) for authentication.

When you create an account, the public key is sent to the service, then when you log in, the service will require you to "sign" some data with your private key. The benefit of this is that no password data is ever stored by the service, so there is nothing for an adversary to steal.

{{< youtube id="aMo4ZlWznao">}}

FIDO2 and WebAuthn have superior security and privacy properties when compared to any MFA methods.

Web services typically use WebAuthn which is a part of the [W3C recommendations](https://en.wikipedia.org/wiki/World_Wide_Web_Consortium#W3C_recommendation_(REC)). It uses public key authentication and is more secure than shared secrets used in Yubico OTP and TOTP methods, as it includes the origin name (usually, the domain name) during authentication. Attestation is provided to protect you from phishing attacks, as it helps you to determine that you are using the authentic service and not a fake copy.

Unlike Yubico OTP, WebAuthn does not use any public ID, so the key is **not** identifiable across different websites. It also does not use any third-party cloud server for authentication. All communication is completed between the key and the website you are logging into. FIDO also uses a counter which is incremented upon use in order to prevent session reuse and cloned keys.

If a website or service supports WebAuthn for the authentication, it is highly recommended that you use it over any other form of MFA.

## Notes

### Initial Set Up

When buying a security key, it is important that you change the default credentials, set up password protection for the key, and enable touch confirmation if your key supports it. Products such as the YubiKey have multiple interfaces with separate credentials for each one of them, so you should go over each interface and set up protection as well.

### Backups

You should always have backups for your MFA method. Hardware security keys can get lost, stolen, or simply stop working over time. It is recommended that you have a pair of hardware security keys with the same access to your accounts instead of just one.

When using TOTP with an authenticator app, be sure to back up your recovery keys or the app itself, or copy the "shared secrets" to another instance of the app on a different phone or to an encrypted container (e.g. [VeraCrypt](../encryption.md#veracrypt)).