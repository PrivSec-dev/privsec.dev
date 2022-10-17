---
title: "Android VPN Leakage with Secondary User Profiles"
date: 2022-10-10
tags: ['Operating Systems', 'Android', 'Privacy']
author: Tommy
---

**Before We Start**... 

I have been aware of this issue for awhile now (since at least Android 11), though I have not done enough testing to see what actually causes the leak nor do I have any workaround at the moment. My guess is that applications which launch early when you log into a secondary profile can bypass the VPN killswitch.

I have reported it on [Google's issue tracker](https://issuetracker.google.com/issues/252851265).

## The Leak

You can reproduce the leak by doing the following:

1. Create a new user profile (you need to create a secondary user profile for this, as it is not reproducible on your owner profile or a work profile). Do not log into your Google account at this stage.
2. Sideload a VPN app. The leak happens with every VPN provider I have tried (since it is likely a platform issue), though if you do not have a VPN subscription I would recommend getting a free one with [ProtonVPN](https://protonvpn.com).
3. Setup the VPN and the [Android VPN killswitch](/posts/os/android-tips/#enable-vpn-killswitch).
4. Log into your Google account through Play Services.
5. Restart the phone. Open the secondary user profile again.
6. Go to Google's [My Devices](https://myaccount.google.com/device-activity) page. Observe that one of the sessions for your phone has your actual location obtained with GeoIP. In some cases, your actual IP address will be shown there as well.

## Notes

1. It is unlikely that this is caused by Play Services being privileged applications. This issue is reproducible on GrapheneOS with the Sandboxed Play Services (which runs as a normal, unprivileged application) as well.

2. More testing is needed to find the root cause of the problem. I do not think that this is Play Services specific. Unfortunately, I do not have access to a router to do a packet capture right now. I would appreciate it if someone can help me get to the bottom of this. You can find my contact information [here](https://tommytran.io/contact/).