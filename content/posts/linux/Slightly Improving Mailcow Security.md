---
title: "Slightly Improving Mailcow Security"
date: 2022-07-18
tags: ['Applications', 'Linux', 'Security']
author: Tommy
---

![Mailcow](/images/mailcow.png)

Mailcow is a fairly popular self-hosted mail server. If you use it, there are a few ways you can improve its security by following these steps.

## Postfix Configuration

Consider disabling weak ciphers and TLS versions below 1.2 in `data/conf/postfix/extra.cf`:

```
tls_high_cipherlist = ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256
tls_preempt_cipherlist = yes

smtp_tls_protocols = !SSLv2, !SSLv3, !TLSv1, !TLSv1.1
smtp_tls_ciphers = high
smtp_tls_mandatory_ciphers = high

smtpd_tls_protocols = !SSLv2, !SSLv3, !TLSv1, !TLSv1.1
smtpd_tls_ciphers = high
smtpd_tls_mandatory_ciphers = high
```

## NGINX Configuration

These security configurations can be added/modified in `data/conf/nginx/includes/site-defaults.conf`.

### SSL Ciphers

Consider only supporting ciphers matching that of TLSv1.3:

```
ssl_ciphers "ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-ECDSA-AES128-GCM-SHA256";
```

### HSTS

Consider adding `includeSubDomains;` and `preload;` to the HSTS configuration if all of your services are using HTTPS:

```
add_header Strict-Transport-Security "max-age=63072000; includeSubDomains; preload";
```

### X-XSS-Protection

We will setup Content Security, so this header is no longer needed. In fact, it may do [more harm than good](https://github.com/helmetjs/helmet/issues/230). Change the setting to `0`:

```
add_header X-XSS-Protection "0";
```

### Permission Policy

Mailcow does not need any special permissions to operate, except for USB which is needed to access your FIDO2 keys if you use them.

Add this header to deny other permissions:

```
add_header Permissions-Policy "accelerometer=(), ambient-light-sensor=(), autoplay=(), battery=(), camera=(), clipboard-read=(), display-capture=(), document-domain=(), encrypted-media=(), fullscreen=(), geolocation=(), gyroscope=(), hid=(), idle-detection=(), interest-cohort=(), magnetometer=(), microphone=(), midi=(), payment=(), picture-in-picture=(), screen-wake-lock=(), serial=(), usb=(), sync-xhr=(), xr-spatial-tracking=()";
```

### Content Security Policy

Use the following as your [Content Security Policy](https://developer.mozilla.org/en-US/docs/Web/HTTP/CSP#:~:text=Content%20Security%20Policy%20(CSP)%20is,site%20defacement%2C%20to%20malware%20distribution.):

#### If you use Gravatar with SOGo

```
add_header Content-Security-Policy "default-src 'none'; connect-src 'self' https://api.github.com; font-src 'self' https://fonts.gstatic.com; img-src 'self' data:; script-src 'self' 'unsafe-inline'; style-src 'self' 'unsafe-inline' https://fonts.googleapis.com; frame-ancestors 'none'; block-all-mixed-content; base-uri 'none'";
```

#### If you do not use Gravatar with SOGo

```
add_header Content-Security-Policy "default-src 'none'; connect-src 'self' https://api.github.com https://www.gravatar.com; font-src 'self' https://fonts.gstatic.com; img-src 'self' data: https://www.gravatar.com; script-src 'self' 'unsafe-inline'; style-src 'self' 'unsafe-inline' https://fonts.googleapis.com; frame-ancestors 'none'; block-all-mixed-content; base-uri 'none'";
```

### Cross-Origin Resource, Opener, and Embedder Policies

Mailcow does not use any cross site scripts, or documents. Thus, you should set CORP and COOP headers to their strictest configuration:

```
add_header Cross-Origin-Resource-Policy same-origin;
add_header Cross-Origin-Opener-Policy same-origin;
```

If you do not use Gravatar with SOGo, you can also set COEP to require-corp since image embedding will not be used either:

```
add_header Cross-Origin-Embedder-Policy require-corp;
```