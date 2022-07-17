---
title: "Linux Insecurities"
tags: ['operating system', 'security', 'linux']
author: Tommy
---

There is a common misconception among privacy communities that Linux is one of the more secure operating systems, either because it is open source or because it is widely used in the cloud. However, this is a far cry from reality.

There is already a very in-depth technical blog explaining the various security weaknesses of Linux by Madaidan, [Whonix](https://www.whonix.org/)'s Security Researcher. This page will attempt to address some of the questions commonly raised in reaction to his blog post. You can find the original article [here](https://madaidans-insecurities.github.io/linux.html).

### Why is Linux used on servers if it is so insecure?

On servers, while most of the problems referenced in the article still exists, they are somewhat less problematic. 

On Desktop Linux, GUI applications run under your user, and thus have access to all of your files in `/home`. This is in contrast to how system daemons typically run on servers, where they have their own group and user. For example, NGINX will run under `nginx:nginx` on Red Hat distributions, or `www-data:www-data` on Debian based ones. Discreationary Access Control does help with filesystem access control for server processes, but is useless for desktop applications.

Another thing to keep in mind is that Mandatory Access Control is also somewhat effective on servers, as commonly run system daemons are confined. 

Work in progress

### Can't Linux be configured to be most secure operating system?

### Isn't it impossible to backdoor Linux because it is open source?