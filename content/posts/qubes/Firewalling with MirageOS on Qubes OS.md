---
title: "Firewalling with MirageOS on Qubes OS"
date: 2022-08-26
tags: ['Operating Systems', 'MirageOS', 'Qubes OS', 'Security']
author: Tommy
---

![MirageOS](/images/mirageos.png)

[MirageOS](https://mirage.io/) is a library operating system with which you can create a unikernel for the sole purpose of acting as Qubes OS's firewall. In this post, I will walk you through how to set this up.

## Advantages
- Small attack surface. The unikernel only contains a minimal set of libraries to function, so it has a much smaller attack surface than a general purpose operating system like a Linux distribution or openBSD.
- Low resource consumption. You only need about 64MB of RAM for each instance of the Mirage Firewall.
- Fast startup time.

## Disadvantages
- No official package for Qubes OS. This means that you need to follow the development process on GitHub and download the new build whenever there is a release.
- Does not work well with the Windows PV network driver. With that being said, the Windows PV networking driver is pretty buggy on its own, and I don't recommend that you use it anyways.

## Installing the unikernel

To deploy MirageOS, you need to copy the `vmlinuz` and `initramfs` files from their [releases page](https://github.com/mirage/qubes-mirage-firewall/releases) to `/var/lib/qubes/vm-kernels/mirage-firewall` in `dom0`. 

### TemplateVM

Create a TemplateVM:

```bash
qvm-create \
  --property kernel=mirage-firewall \
  --property kernelopts='' \
  --property memory=64 \
  --property maxmem=64 \
  --property vcpus=1 \
  --property virt_mode=pvh \
  --label=black \
  --class TemplateVM \
  your_template_name
``` 

Don't worry if the TemplateVM doesn't launch - we don't need it to.

### Disposable Template

Next, create a disposable template based on the TemplateVM you have just created.

```bash
qvm-create \
  --property template=your_template_name \
  --property provides_network=True \
  --property template_for_dispvms=True \
  --label=orange \
  --class AppVM \
  your_disposable_template_name

qvm-features your_disposable_template_name qubes-firewall 1
qvm-features your_disposable_template_name no-default-kernelopts 1
``` 

Your disposable templates should now launch and shutdown properly.

### Disposable FirewallVMs

You can now create disposable FirewallVMs based on your disposable template. I recommend replacing `sys-firewall` with a disposable Mirage firewall. If you use ProxyVMs like `sys-whonix`, I recommend that you add a disposable Mirage Firewall after the ProxyVM as well, and use it as the net qube for your AppVMs. 

```bash
qvm-create \
  --property template=your_disposable_template_name \
  --property provides_network=True \
  --property netvm=your_net_qube_name \
  --label=orange \
  --class DispVM \
  your_firwall_name
```
