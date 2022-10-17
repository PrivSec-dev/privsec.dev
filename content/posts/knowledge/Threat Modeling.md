---
title: "Threat Modeling"
date: 2022-07-18
tags: ['Knowledge base', 'Privacy', 'Security']
author: Tommy
---

The first task a person should do when taking steps to protect their privacy and security is to make a threat model. 

## Defining a threat

![Cameras](/images/cameras-1.jpg)

To make a threat model, we must first define a threat. A common mistake made by people who are just getting into the privacy space is to define the threat as "big-tech companies." There is a fundamental problem with this definition:

Why are we not trusting "big-tech companies," but then shift our trust to "small-tech companies"? What happens if those "small-tech companies" turn out to be malicious? What happens when our favorite "small-tech company" becomes successful and grow exponentially? **The proper way to define the threat here is the "service provider," not "big-tech."**

Generally, there are four primary threats a person would want to protect themselves from:

- A service provider spying their users
- Cross site/service tracking and data sharing, a.k.a. "mass surveillance"
- An app developer spying on users through their malicious software
- A hacker trying to get into the users' computers

A typical person would have several of these threats in their threat model. Some of these threats may weigh more than others. For example, a software developer would have a hacker stealing their source code, signing keys and secrets as their primary threat, but beyond that they would also want privacy from the websites they visit and so on. Likewise, an average Joe may have their primary threat as mass surveillance and service providers, but beyond that they also need to have decent security to prevent a hacker from stealing their data.

For whistleblowers, the threat model is much more extreme. Beyond what is mentioned above, they also need anonymity. Beyond just hiding what they do, what data they have, not getting hacked by hackers or governments, they also have to hide who they are. 

## Privacy from service providers

In most setups, our "private" messages, emails, social interactions are typically stored on a server somewhere. The obvious problem with this is that the service provider (or a hacker who has compromised the server) can look into your "private" conversations whenever and however they want, without you ever knowing. This applies to many common services like SMS messaging, Telegram, Discord, and so on.

With end-to-end encryption, you can alleviate this issue by encrypting communications between you and your desired recipients before they are even sent to the server. The confidentiality of your messages is guaranteed, so long as the service provider does not have access to the private keys of either party.

In practice, the effectiveness of different end-to-end encryption implementations varies. Applications such as Signal run natively on your device, and every copy of the application is the same across different installations. If the service provider were to backdoor their application in an attempt to steal your private keys, that could later be detected using reverse engineering.

On the other hand, web-based end-to-end encryption implementations such as Proton Mail's webmail or Bitwarden's web vault rely on the server dynamically serving JavaScript code to the browser to handle cryptographic operations. A malicious server could target a specific user and send them malicious JavaScript code to steal their encryption key, and it would be extremely hard for the user to ever notice such a thing. Even if the user does notice the attempt to steal their key, it would be incredibly hard to prove that it is the provider trying to do so, because the server can choose to serve different web clients to different users.

Therefore, when relying on end-to-end encryption, you should choose to use native applications over web clients whenever possible.

Even with end-to-end encryption, service providers can still profile you based on **metadata**, which is typically not protected. While the service provider could not read your messages to see what you're saying, they can still observe things like who you're talking to, how often you message them, and what times you're typically active. Protection of metadata is fairly uncommon, and you should pay close attention to the technical documentation of the software you are using to see if there is any metadata minimization or protection at all, if that is a concern for you.

## Protection from cross site/service tracking

You can be tracked across websites and services using some form of identifiers. These are typically:

- Your IP address
- Browser cookies
- Your browser fingerprint
- Data you submit to websites
- Payment method correlation

Your goals should be to segregate your online identities from each other, to blend in with other people, and simply to avoid giving out identifying information to anyone as much as possible.

Instead of relying on privacy policies (which are promises that could be violated), try to obfuscate your information in such a way that it is very difficult for different providers to correlate data with each other and build a profile on you. This could come in the form of using encryption tools like Cryptomator prior to uploading your data to cloud services, using prepaid cards or cryptocurrency to protect your credit/debit card information, using a VPN to hide your IP address from websites and services on the internet, etc. The privacy policy should only be relied upon as a last resort, when you have exhausted all of your option for true privacy and need to put complete trust in your service provider.

Bear in mind that companies can hide their ownership or share your information with data brokers, even if they are not in the advertising business. Thus, it makes little sense to solely focus on the "ad-tech" industry as a threat in your threat model. Rather, it makes a lot more sense to protect yourself from service providers as a whole, and any kind of corporate surveillance threat that most people are concerned about will be thwarted along with the rest.

## Limiting Public Information

The best way to ensure your data is private is to simply not put it out there in the first place. Deleting information you find about yourself online is one of the best first steps you can take to regain your privacy.

On sites where you do share information, checking the privacy settings of your account to limit how widely that data is spread is very important. For example, if your accounts have a "private mode," enable it to make sure your account isn't being indexed by search engines and can't be viewed by people you don't vet beforehand.

If you have already submitted your real information to a number of sites which shouldn't have it, consider employing disinformation tactics such as submitting fictitious information related to the same online identity to make your real information indistinguishable from the false information.

## Protection from malware and hackers

![Motherboard](/images/motherboard-1.jpg)

You need security to obtain any semblance of privacy: **Using tools which appear private is futile if they could easily be exploited by attackers to release your data later.**

When it comes to application security, we generally do not (and sometimes cannot) know if the software that we use is malicious, or might one day become malicious. Even with the most trustworthy developers, there is generally no guarantee that their software does not have a serious vulnerability that could later be exploited.

To minimize the potential damage that a malicious piece of software can do, you should employ security by compartmentalization. This could come in the form of using different computers for different jobs, using virtual machines to separate different groups of related applications, or using a secure operating system with a strong focus on application sandboxing and mandatory access control.

Mobile operating systems are generally safer than desktop operating systems when it comes to application sandboxing. Apps cannot obtain root access and only have access to system resources which you grant them.

Desktop operating systems generally lag behind on proper sandboxing. ChromeOS has similar sandboxing properties to Android, and macOS has full system permission control and opt-in (for developers) sandboxing for applications, however these operating systems do transmit identifying information to their respective OEMs. Linux tends to not submit information to system vendors, but it has poor protection against exploits and malicious apps. This can be mitigated somewhat with specialized distributions which make heavy use of virtual machines or containers, such as Qubes OS.

Web browsers, email clients, and office applications all typically run untrusted code sent to you from third-parties. Running multiple virtual machines to separate applications like these from your host system as well as each other is one technique you can use to avoid an exploit in these applications from compromising the rest of your system. Technologies like Qubes OS or Microsoft Defender Application Guard on Windows provide convenient methods to do this seamlessly, for example.

If you are concerned about physical attacks you should use an operating system with a secure verified boot implementation, such as Android, iOS, ChromeOS, or macOS. You should also make sure that your drive is encrypted, and that the operating system uses a TPM or Secure [Enclave](https://support.apple.com/guide/security/secure-enclave-sec59b0b31ff/1/web/1) or [Secure Element](https://developers.google.com/android/security/android-ready-se) for rate limiting attempts to enter the encryption passphrase. You should avoid sharing your computer with people you don't trust, because most desktop operating systems do not encrypt data separately per-user.

## Bad Practices
As a beginner, you may often fall into some bad practices while making a threat model. These include:

- Solely focusing on advertising networks instead of service providers as a whole
- Heavy reliance on privacy policies
- Blindly shifting trust from one service provider to another
- Heavy reliance on badness enumeration for privacy instead of systematically solving the problem
- Blindly trusting open-source software

As discussed, focusing solely on advertising networks and relying solely on privacy policies does not make up a sensible threat model. When switching away from a service provider, try to determine what the root problem is and see if your new provider has any technical solution to the problem. For example, you may not like Google Drive as it means giving Google access to all of your data. The underlying problem here is the lack of end to end encryption, which you can solve by using an encryption tool like Cryptomator or by switching to a provider who provides it out of the box like Proton Drive. Blindly switching from Google Drive to a provider who does not provide end to end encryption like the Murena Cloud does not make sense.

You should also keep in mind that [badness enumeration does not work, cannot work, has never worked, and will never work](/knowledge/badness-enumeration/). While things like ad blockers and antiviruses may help block the low hanging fruits, they can never fully protect you from the threat. On the other hand, they often increase your attack surface and are not worth the security sacrifice. At best, they are merely covenience tools and should not be thought of as part of a defense strategy.

Another thing to keep in mind is that open-source software is not automatically private or secure. Malicious code can be sneaked into the package by the developer of the project, contributors, library developers or the person who compiles the code. Beyond that, sometimes, a piece of open-source software may have worse security properties than its proprietary counterpart. An example of this would be traditional Linux desktops lacking verified boot, system integrity protection, or a full system access control for apps when compared to macOS. When doing threat modeling, it is vital that you evaluate the privacy and security properties of each piece of software being used, rather than just blindly trusting it because it is open-source.
