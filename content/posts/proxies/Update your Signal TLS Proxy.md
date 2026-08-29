---
title: "Signal TLS Proxy warning"
date: 2022-10-15
tags: ['Proxies', 'Containers', 'Security']
author: Tommy
---

![Signal](/images/plz-merge.jpg)

Given the current censorship situation in Iran, I decided to have a look at the [Signal TLS Proxy](https://github.com/signalapp/Signal-TLS-Proxy).

One thing immediately jumped out - the NGINX image has not been updated [for years](https://github.com/signalapp/Signal-TLS-Proxy/blob/ac94d6b869f942ec05d7ef76840287a1d1f487f9/nginx-relay/Dockerfile#L9). In fact, NGINX 1.18 is so old that it has gone end of life for [a year and a half](https://endoflife.date/nginx) as of this writing.

If you are deploying or maintaining a Signal TLS Proxy, I highly recommend that you use the upstream `nginx:alpine` image instead.

My Docker Compose setup can be found [here](https://github.com/ArcticFoxes-net/Signal-TLS-Proxy). I have also fixed the missing `:Z` flag for mountpoints and and dropped privileges to reduce the attack surface. I made a couple of pull requests for these changes, but Signal is being very slow on reviewing and merging them, so... yeah.

- [Drop capabilities](https://github.com/signalapp/Signal-TLS-Proxy/pull/24)
- [Use upstream NGINX image](https://github.com/signalapp/Signal-TLS-Proxy/pull/23)
- [Add :Z for SELinux](https://github.com/signalapp/Signal-TLS-Proxy/pull/22)

Currently, we believe Signal’s TLS Proxies are an incomplete solution to the problems they try to solve. Instead, we recommend using Orbot in conjunction with [Molly](https://molly.im), an alternative Signal client which natively supports SOCKS proxies, to fully tunnel your Signal traffic over the Tor network.

## Attributions (not endorsements)

- [A Warning About Signal Proxies in Iran and Other Oppressive Countries - Privacy Guides](https://www.privacyguides.org/articles/2022/10/15/warning-about-signal-proxies/)
