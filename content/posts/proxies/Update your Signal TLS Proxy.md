---
title: "Update your Signal TLS Proxy"
date: 2022-10-15
tags: ['Proxies', 'Containers', 'Security']
author: Tommy
---

![Signal](/images/plz-merge.jpg)

Given the current censorship situation in Iran, I decided to have a look at the [Signal TLS Proxy](https://github.com/signalapp/Signal-TLS-Proxy).

One thing immediately jumped out - the NGINX image has not been updated [for years](https://github.com/signalapp/Signal-TLS-Proxy/blob/ac94d6b869f942ec05d7ef76840287a1d1f487f9/nginx-relay/Dockerfile#L9). In fact, NGINX 1.18 is so old that it has gone end of life for [a year and a half](https://endoflife.date/nginx) as of this writing.

If you are deploying or maintaining a Signal TLS Proxy, I highly recommend that you use the upstream `nginx:alpine` image instead.

My Docker Compose setup can be found [here](https://github.com/tommytran732/Signal-TLS-Proxy). I have also fixed the missing `:Z` flag for mountpoints and and dropped privileges to reduce the attack surface. I made a couple of pull requests for these changes, but Signal is being very slow on reviewing and merging them, so... yeah.

- [Drop capabilities](https://github.com/signalapp/Signal-TLS-Proxy/pull/24)
- [Use upstream NGINX image](https://github.com/signalapp/Signal-TLS-Proxy/pull/23)
- [Add :Z for SELinux](https://github.com/signalapp/Signal-TLS-Proxy/pull/22)
