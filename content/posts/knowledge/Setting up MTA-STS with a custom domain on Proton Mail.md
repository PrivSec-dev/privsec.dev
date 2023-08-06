---
title: "Setting up MTA-STS with a custom domain on Proton Mail"
date: 2023-07-13T10:00:00Z
tags: ['Knowledge base', 'Security']
author: Wonderfall
canonicalURL: https://wonderfall.dev/mta-sts/
ShowCanonicalLink: true
---

To this date, [Proton Mail doesn't support MTA-STS for custom domains](https://old.reddit.com/r/ProtonMail/comments/y6q6g8/mtasts_for_custom_domains/). While DANE for SMTP is a much better solution to the same problem, MTA-STS exists for a reason: many providers are slow at adopting DNSSEC. DNSSEC is essential to enabling standards such as DANE or SSHFP. Notably, [Gmail still does not support DANE](https://www.hardenize.com/report/gmail.com/1689164394#email_dane) but has supported MTA-STS for years.

Therefore, MTA-STS and DANE can complement each other, and you should ideally deploy both.


## Why bother? A tale of DANE...
Mail security is challenging and complex, and humanity might never get it right. Unfortunately, we still rely on this ancient technology for nearly everything. Attempts to make SMTP more resilient and secure have been made in the past, including opportunistic transport encryption (STARTTLS). One tricky issue is that implementing TLS alone in this case does not prevent man-in-the-middle or various downgrade attacks (such as STRIPTLS) from happening.

**DANE for SMTP** ([RFC 7672](https://datatracker.ietf.org/doc/html/rfc7672)) is an elegant solution to address these issues. DANE relies on **DNSSEC** to protect **TLSA records** of the same DNS zone as the SMTP server. TLSA records indicate that TLS should be enforced for inbound mail, and basically contain information about the public keys that are allowed to be used. Let's briefly dig *(no pun intended)* into how Proton implements this:

```
$ dig +noall +answer mx protonmail.com
protonmail.com.		1138	IN	MX	10 mailsec.protonmail.ch.
protonmail.com.		1138	IN	MX	5 mail.protonmail.ch
```

```
$ dig +noall +answer tlsa _25._tcp.mail.protonmail.ch
_25._tcp.mail.protonmail.ch. 915 IN	TLSA	3 1 1 6111A5698D23C89E09C36FF833C1487EDC1B0C841F87C49DAE8F7A09 E11E979E
_25._tcp.mail.protonmail.ch. 915 IN	TLSA	3 1 1 76BB66711DA416433CA890A5B2E5A0533C6006478F7D10A4469A947A CC8399E1
```

I will skip the details since this post is not about how DANE works, but as you can see the TLSA records can be easily retrieved and we can verify those. Tools like [Hardenize](https://www.hardenize.com/) may help you in investigating which providers have DANE.


## MTA-STS to the rescue
Despite being a years-old standard, DANE for SMTP is not widely adopted. **MTA-STS** ([RFC 8461](https://datatracker.ietf.org/doc/html/rfc8461)) is an alternative solution which aims to prevent the same security issues, whilst not relying on DNSSEC. When MTA-STS is enabled, it effectively indicates to SMTP servers that TLS (1.2 or higher) should be used with valid certificates.

In order to do that, MTA-STS relies on a **HTTPS web server** (and thus the WebPKI) to publish the policy at a specific subdomain (`mta-sts`) and address (`/.well-known/mta-sts.txt`). A **DNS TXT record** will also be needed to signal that a MTA-STS policy is available for the domain. Let's see how Proton implements that.

If we navigate to https://mta-sts.protonmail.com/.well-known/mta-sts.txt, we will indeed find the MTA-STS policy published by Proton:

```txt
version: STSv1
mode: enforce
mx: mail.protonmail.ch
mx: mailsec.protonmail.ch
max_age: 604800
```

The DNS "discovery" record should be defined at the `_mta-sts` subdomain:

```
$ dig +noall +answer txt _mta-sts.protonmail.com
_mta-sts.protonmail.com. 1114	IN	CNAME	_mta-sts.protonmail.ch.
_mta-sts.protonmail.ch.	1114	IN	TXT	"v=STSv1; id=190906205100Z;"
```

Everything is there as expected.


## Enable MTA-STS for custom domains
The challenge is that Proton does not offer an easy way to host a policy for custom domains. They could eventually offer this in the future, and I expect them to. In the meantime, we can enable MTA-STS ourselves as it should be somewhat straightforward.

The main challenging part is really to find a way to host the policy. It's just a text file after all, so there are many ways to do that without going through the hassle of self-hosting a web server. [GitHub Pages](https://pages.github.com/) and [Netlify](https://www.netlify.com/) have free offerings to host static websites, and they should be enough to meet our needs here. I will use Netlify since you can host multiple websites with the same account; the only drawback is that you have a 100GB bandwidth limit per month, but it should be more than enough for a simple text file.

First, you will need to create a GitHub repository - public or private, it doesn't matter. Then, you should push a directory named `.well-known` which contains a `mta-sts.txt` file. The latter will be our policy, and you may simply copy the policy from Proton:

```txt
version: STSv1
mode: enforce
mx: mail.protonmail.ch
mx: mailsec.protonmail.ch
max_age: 604800
```

> If you're really not sure about what you're doing, setting `mode: testing` might be a conservative approach to avoid breaking things (a report will be sent if you've configured TLS-RPT, more on that later). You may also consider decreasing or increasing `max_age` which corresponds to a time in seconds, and 604800 for instance means that the policy will be cached for one week.

Then, head to your Netlify account, add a new site, register your GitHub repository and voilà. Once it's done and that you can access your policy through your `netlify.app` address, it's a matter of publishing a few DNS records:

- An `A` record for your Netlify-hosted policy. If your domain name from which you intend to send and receive mails is `@domain.tld` then you should make this `A` record for `mta-sts.domain.tld`. Netlify will tell you to use a CNAME record but I personnally caution against using CNAME to third parties in general. They have a universal load balancer IPv4 [you can use](https://docs.netlify.com/domains-https/custom-domains/configure-external-dns/), so you should use that.

- A `TXT` record for MTA-STS discovery. The content should resemble to the following: `"v=STSv1; id=2023071200"`. `v=STSv1` declares the policy version, and `id=` is really just a random number you should increment to signal whenever your MTA-STS policy has been changed. If you're out of ideas you can use the Unix epoch time, or the YMD format followed by two numbers reserved for iterations (just like I do).

- An *optional* `TXT` record for TLS-RPT so that the sending mail server will receive reports about successful and failed attempts at applying the MTA-STS policy. Since these reports can be very useful, I highly recommend you configure TLS-RPT. To do that, add the following TXT record to the `_smtp._tls` subdomain: `"v=TLSRPTv1; rua=mailto:reports@domain.tld"` where `rua=` should point to the mail address where you want to receive reports.

> **Security tip :** since `mta-sts` is a subdomain with an A record, I strongly recommend defining a "reject all" SPF policy and a null MX record ([RFC 7505](https://www.rfc-editor.org/rfc/rfc7505)) for that subdomain. That is because even when an MX record does not exist, [A records can be used as a fallback](https://www.rfc-editor.org/rfc/rfc5321#section-5).

Wait a bit for the DNS propagation to take place, then verify with [Hardenize](https://www.hardenize.com/) that MTA-STS is enabled.


## Conclusion
MTA-STS is far from perfect and suffers from multiple flaws in my opinion: it relies on **certificate authorities** (CA), and is inherently a ***trust on first use*** security policy akin to HSTS for HTTPS (the DNSSEC infrastructure is already trusted in the case of DANE). I also believe that MTA-STS is more tedious to deploy compared to the simplicity and robustness of DANE, DNSSEC deployment quirks aside.

Nonetheless, I hope this article will prove somewhat useful to Proton Mail users who wish to use MTA-STS with their custom domains.
