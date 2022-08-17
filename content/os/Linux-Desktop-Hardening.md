---
title: "Linux Desktop Hardening"
date: 2022-08-17
tags: ['operating systems', 'linux', 'privacy', 'security']
author: Tommy
---

Linux is [not](https://madaidans-insecurities.github.io/linux.html) a security operating system. However, there are step you can take harden it, reduce its attack surface and improve its privacy.

**Notes**: This guide is largely based on [Madaidan's Linux hardening guide](https://madaidans-insecurities.github.io/guides/linux-hardening.html); however, it does take into account the usability, ease of maintenance of each recommendation. The goal is to produce a guide that intermediate to advanced Linux users can reasonably follow to set up and maintain the security configurations. It will also **not** try to be distribution agnostic, and there will be many distribution specific recommendations.

![Fedora Tux](/images/fedora-tux.png)


## During Installation

### Drive Encryption

Most Linux distributions have an option within its installer for enabling [LUKS](../encryption.md#linux-unified-key-setup) full disk encryption. If this option isn’t set at installation time, you will have to backup your data and re-install, as encryption is applied after [disk partitioning](https://en.wikipedia.org/wiki/Disk_partitioning), but before [file systems](https://en.wikipedia.org/wiki/File_system) are formatted. 

### Encrypted Swap

Consider using [encrypted swap](https://wiki.archlinux.org/title/Dm-crypt/Swap_encryption) or [ZRAM](https://wiki.archlinux.org/title/Swap#zram-generator) instead of unencrypted swap to avoid potential security issues with sensitive data being pushed to [swap space](https://en.wikipedia.org/wiki/Memory_paging). While ZRAM can be set up post-installation, if you want to use encrypted swap, you should set it up while partitioning your drive.

Depending on your distribution, encrypted swap may be sutomatically set up if you choose to encrypt your drive. Fedora [uses ZRAM by default](https://fedoraproject.org/wiki/Changes/SwapOnZRAM), regardless of whether you enable drive encryption or not.

## Privacy Tweaks

### MAC Address Randomization

Many desktop Linux distributions (Fedora, openSUSE, etc) will come with [NetworkManager](https://en.wikipedia.org/wiki/NetworkManager), to configure Ethernet and Wi-Fi settings.

It is possible to [randomize](https://fedoramagazine.org/randomize-mac-address-nm/) the [MAC address](https://en.wikipedia.org/wiki/MAC_address) when using NetworkManager. This provides a bit more privacy on Wi-Fi networks as it makes it harder to track specific devices on the network you’re connected to. It does [**not**](https://papers.mathyvanhoef.com/wisec2016.pdf) make you anonymous.

I recommend changing the setting to **random** instead of **stable**, as suggested in the [article](https://fedoramagazine.org/randomize-mac-address-nm/).

If you are using [systemd-networkd](https://en.wikipedia.org/wiki/Systemd#Ancillary_components), you will need to set [`MACAddressPolicy=random`](https://www.freedesktop.org/software/systemd/man/systemd.link.html#MACAddressPolicy=) which will enable [RFC 7844 (Anonymity Profiles for DHCP Clients)](https://www.freedesktop.org/software/systemd/man/systemd.network.html#Anonymize=).

There isn’t much point in randomizing the MAC address for Ethernet connections as a system administrator can find you by looking at the port you are using on the [network switch](https://en.wikipedia.org/wiki/Network_switch). Randomizing Wi-Fi MAC addresses depends on support from the Wi-Fi’s firmware.

### Other Identifiers

There are other system identifiers which you may wish to be careful about. You should give this some thought to see if it applies to your [threat model](/knowledge/threat-modeling/):

- **Hostnames:** Your system's hostname is shared with the networks you connect to. You should avoid including identifying terms like your name or operating system in your hostname, instead sticking to generic terms or random strings.
- **Usernames:** Similarly, your username is used in a variety of ways across your system. Consider using generic terms like "user" rather than your actual name.
- **Machine ID:**: During installation a unique machine ID is generated and stored on your device. Consider [setting it to a generic ID](https://madaidans-insecurities.github.io/guides/linux-hardening.html#machine-id).

### System Counting

Many Linux distributions sends some telemetry data by default to count how many systems are using their software. Consider disabling this depending on your threat model.

The Fedora Project does this by [counting](https://fedoraproject.org/wiki/Changes/DNF_Better_Counting) how many unique systems access its mirrors by using a [`countme`](https://fedoraproject.org/wiki/Changes/DNF_Better_Counting#Detailed_Description) variable instead of a unique ID. 

This [option](https://dnf.readthedocs.io/en/latest/conf_ref.html#options-for-both-main-and-repo) is currently off by default. However, you could add `countme=false` to `/etc/dnf/dnf.conf` just in case it is enabled in the future. On systems that use rpm-ostree such as Fedora Silverblue or Kinoite, the `countme` option can be disabled by masking the [rpm-ostree-countme](https://fedoramagazine.org/getting-better-at-counting-rpm-ostree-based-systems/) timer.

openSUSE uses a [unique ID](https://en.opensuse.org/openSUSE:Statistics) to count systems, which can be disabled by deleting the `/var/lib/zypp/AnonymousUniqueId` file.

Zorin OS uses the `zorin-os-cencus` package, which also uses a [unique ID](https://zorin.com/legal/privacy/) to count systems. You can opt out of this by doing `sudo apt purge zorin-os-census`, and optionally hold it with `sudo apt-mark hold zorin-os-census` to avoid accidentally installing it in the future.

[Snapd](https://github.com/snapcore/snapd) assigns a [unique ID](https://snapcraft.io/docs/snap-store-metrics) to your snapd installation and use it for telemetry. While this is generally not a problem, if your threat model calls for anonimity, you should not be using snap packages, and you should remove snapd from your Ubuntu installation. Like with Zorin Census, on Debian based distributions, and especially Ubuntu, consider holding `snapd` with `sudo apt-mark hold snapd`.

Of course, this is a non-exhaustive list of how different Linux distributions do this. If you are aware of any other tracking mechanisms that different distributions use, feel free to make a [pull request](https://github.com/PrivSec-dev/privsec.dev/blob/main/content/os/Linux-Desktop-Hardening.md) or [discussion post](https://github.com/PrivSec-dev/privsec.dev/discussions) detailing them!

### Keystroke Anonymization
You could be [fingerprinted based on soft biometric traits](https://www.whonix.org/wiki/Keystroke_Deanonymization) when you use the keyboard. The [Kloak](https://github.com/vmonaco/kloak) package could help you mitigate this threat. It is available as a .deb package from [Kicksecure's repository](https://www.kicksecure.com/wiki/Packages_for_Debian_Hosts) and an [AUR package](https://aur.archlinux.org/packages/kloak-git).

WIth that being said, if your threat model calls for using something like Kloak, you are probably better off just using Whonix.

## Application Confinement
Some sandboxing solutions for desktop Linux distributions do exist; however, they are not as strict as those found in macOS or ChromeOS. Applications installed from the package manager (`dnf`, `apt`, etc.) typically have **no** sandboxing or confinement whatsoever. Below are a few projects that aim to solve this problem:

### Flatpak

{{< youtube id="GkgPIJp8_30">}}

[Flatpak](https://flatpak.org) aims to be a universal package manager for Linux. One of its main goals is to provide a universal package format which can be used in most Linux distributions. It provides some [permission control](https://docs.flatpak.org/en/latest/sandbox-permissions.html). With that being said, Flatpak sandboxing is [quite weak](https://madaidans-insecurities.github.io/linux.html#flatpak).

You can restrict applications further by issuing [Flatpak overrides](https://docs.flatpak.org/en/latest/flatpak-command-reference.html#flatpak-override). This can be done with the command-line or by using [Flatseal](https://flathub.org/apps/details/com.github.tchx84.Flatseal). Some sample overrides are provided by [me](https://github.com/tommytran732/Flatpak-Overrides) and [rusty-snake](https://github.com/rusty-snake/kyst/tree/main/flatpak). Note that this only helps with the lax high level default permissions, but cannot solve the low level issues like `/proc` and `/sys` access, or an insufficient seccomp blacklist.

Some sensitive permissions you should pay attention to:

- the Network (`--share=network`) socket (internet access)
- the PulseAudio socket (`--socket=pulseaudio`) for audio and sound
- `--device=all` access to all devices including the camera
- `--talk-name=org.freedesktop.secrets` dbus (access to secrets stored on your keychain) for applications which do not need it

If an application works natively with Wayland (*not* running through the [XWayland](https://wayland.freedesktop.org/xserver.html) compatibility layer), consider revoking its access to the X11 (`--socket=x11`) and [inter-process communications (IPC)](https://en.wikipedia.org/wiki/Unix_domain_socket) socket (`--share=ipc`) as well.

Many Flatpak apps come with broad filesystem permissions such as `--filesystem=home` and `--filesystem=host`. Some applications implement the [Portal API](https://docs.flatpak.org/en/latest/portal-api-reference.html), which allows a file manager to pass files to the Flatpak application (e.g. VLC) without specific filesystem access privileges. Despite this, many of them, including ones like VLC [still use](https://github.com/flathub/org.videolan.VLC/blob/master/org.videolan.VLC.json) `--filesystem=host`.

My strategy to deal with this is to revoke all filesystem access first, then test if an application works without it. If it does, it means the app is already using Portals and I don't need to do anything else. If it doesn't, then I start granting permission to specific directories.

As odd as this may sound, **you should not automatically update your Flatpak packages**. The problem with Flatpak is that it grants install-time permissions when you update your applications, and you will not be notified of the permission change unless you update them manually via the command line.

### Snap

Snap is another universal package manager with some sandboxing support. It is developed by Canonical and heavily pushed on Ubuntu.

Snap packages come in [two variants](https://snapcraft.io/docs/snap-confinement): classic snap with no confinement and strict snap with confinement on systems with AppArmor and Cgroupsv1. If a snap package is classic snap, you are better off using a version provided by your distribution's repository instead, if one is available. If your system does not have AppArmor, then you are better off not using snap at all. Most modern systems outside of Ubuntu and its derivatives only use Cgroupsv2 by default, so you have to set `systemd.unified_cgroup_hierarchy=0` in your kernel parameters to get Cgroupsv1 working.

Snap permissions can be managed via the Snap Store or Ubuntu's custom patched GNOME Control Center.

One caveat with Snap packages is that you only have control over the interfaces declared in their manifests. For example, snap has seperate interfaces for `audio-playback` and `audio-record`; however, some packages will only declare the legacy `pulseaudio` interface which grants them permission to both play and record audio. Likewise, some applications may work perfectly fine with Wayland, but the package maintainer may only declare the X11 interface in their manifest. For these cases, you need to reach out to the maintainer of the Snap package to update the manifest accordingly.

### Firejail

[Firejail](https://firejail.wordpress.com/) is another method of sandboxing. As it is a large [setuid](https://en.wikipedia.org/wiki/Setuid) binary, it has a large attack surface which may assist in [privilege escalation](https://en.wikipedia.org/wiki/Privilege_escalation).

Madaidan [provided](https://madaidans-insecurities.github.io/linux.html#firejail) additional details on how Firejail can worsen the security of your device.

If you do use Firejail, there is a tool called [Firetools](https://github.com/netblue30/firetools) which can help you quickly manage what an application can have access to and launch them. Note that the configurations by `Firetools` are temporarily and it does not provide you with an option to save a profile for long term use. 

Firejail can also confine X11 windows using Xpra or Xephr, something that Flatpak and Snap cannot do. I highly recommend that you check out their [documentation](https://firejail.wordpress.com/documentation-2/x11-guide/) on how to set this up.

One trick to consistently launch applications which have a Firejail profile confined is to use the `firecfg` command. This will create a symlink in `/usr/local/bin/app_name_here` pointing to Firejail. `.desktop` files which do not specifically specify the absolute path of the binaries to use will launch the application through the symlink and have Firejail sandbox them this way. Of course, this is bypassable if you or some other applications launch the application directly from `/usr/bin/app_name_here` instead.

### Mandatory Access Control

Common Linux [Mandatory access control](https://en.wikipedia.org/wiki/Mandatory_access_control) frameworks require policy files in order to force constraints on the system.

The two main control systems are [SELinux](https://en.wikipedia.org/wiki/Security-Enhanced_Linux) (used on Android and Fedora based distributions) and [AppArmor](https://en.wikipedia.org/wiki/AppArmor) (Used on Debian based distributions and most openSUSE variants).

Fedora includes SELinux preconfigured with some policies that will confine [system daemons](https://en.wikipedia.org/wiki/Daemon_(computing)) (background processes). You should keep it in Enforcing mode.

openSUSE gives the choice of AppArmor or SELinux during the installation process. You should stick to the default for each variant (AppArmor for [Tumbleweed](https://get.opensuse.org/tumbleweed/) and SELinux for [MicroOS](https://microos.opensuse.org/)). openSUSE’s SELinux policies are derived from Fedora.

Arch and Arch-based operating systems often do not come with a mandatory access control system and you must manually install and configure [AppArmor](https://wiki.archlinux.org/title/AppArmor) for it.

Note that unlike Android, traditional desktop Linux distributions typically do not have full system Mandatory Access Control policies, and only a few system daemons are actually confined.

### Making Your Own Policies/Profiles

You can make your own AppArmor profiles, SELinux policies, Bubblewrap profiles, and [seccomp](https://en.wikipedia.org/wiki/Seccomp) blacklist to have better confinement of applications. This is an advanced and sometimes tedious task, so I won’t go into detail about how to do it here, but there are a few projects that you could use as reference.

- Whonix’s [AppArmor Everything](https://github.com/Whonix/apparmor-profile-everything)
- Krathalan’s [AppArmor profiles](https://github.com/krathalan/apparmor-profiles)
- noatsecure’s [SELinux templates](https://github.com/noatsecure/hardhat-selinux-templates)
- Seirdy’s [Bubblewrap scripts](https://sr.ht/~seirdy/bwrap-scripts)

### Securing Linux Containers

If you’re running a server, you may have heard of Linux Containers. They are more common in server environments where individual services are built to operate independently. However, you may sometimes see them on desktop systems as well, especially for development purposes.

[Docker](https://en.wikipedia.org/wiki/Docker_(software)) is one of the most common container solutions. It is **not** a proper sandbox, and this means that there is a large kernel attack surface. You can should the [Docker and OCI Hardening](/os/docker-and-oci-hardening/) guide to mitigate this problem. In short, there are things you can do like using rootless containers (either through configuration or through using [Podman](https://podman.io/)), using a runtime which provides a psedo-kernel for each container ([gVisor](https://gvisor.dev/)), and so on.

Another option is [Kata containers](https://katacontainers.io/), where virtual machines masquerade as containers. Each Kata container has its own Linux kernel and is isolated from the host.

## Security Hardening

![opensuse-computer.jpg](/images/opensuse-computer.jpg)

### Firewalls

A [firewall](https://en.wikipedia.org/wiki/Firewall_(computing)) may be used to secure connections to your system.

Red Hat distributions (such as Fedora) are typically configured through [firewalld](https://en.wikipedia.org/wiki/Firewalld). Red Hat has plenty of [documentation](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/configuring_and_managing_networking/using-and-configuring-firewalld_configuring-and-managing-networking) regarding this topic. There is also the [Uncomplicated Firewall](https://en.wikipedia.org/wiki/Uncomplicated_Firewall) which can be used as an alternative.

You could also set your default firewall zone to drop packets. If you're on a Red Hat or SUSE based distribution such as Fedora this can be done with the following commands:

```
firewall-cmd --set-default-zone=drop
firewall-cmd --add-protocol=ipv6-icmp --permanent
firewall-cmd --add-service=dhcpv6-client --permanent
```

All these firewalls use the [Netfilter](https://en.wikipedia.org/wiki/Netfilter) framework and therefore cannot protect against malicious programs running on the system. A malicious program could insert its own rules.

There are some per-binary outbound firewalls such as [OpenSnitch](https://github.com/evilsocket/opensnitch) or [Portmaster](https://safing.io/portmaster/) that you could use as well. But just like firewalld and UFW, they are bypassable.

If you are using Flatpak packages, you can revoke their network socket access using Flatseal and prevent those applications from accessing your network. This permission is not bypassable.

If you are using non-classic [Snap](https://en.wikipedia.org/wiki/Snap_(package_manager)) packages on a system with proper snap confinement support (with both AppArmor and [cgroups](https://en.wikipedia.org/wiki/Cgroups) v1 present), you can use the Snap Store to revoke network permission as well. This is also not bypassable.

### Kernel Hardening
There are some additional kernel hardening options such as configuring [sysctl](https://en.wikipedia.org/wiki/Sysctl#Linux) keys and [kernel command-line parameters](https://www.kernel.org/doc/html/latest/admin-guide/kernel-parameters.html) which are described in the Madaidan's guide. You should read through them before applying these changes.

- [2.2 Sysctl](https://madaidans-insecurities.github.io/guides/linux-hardening.html#sysctl)
- [2.5.2 Blacklisting kenrel modules](https://madaidans-insecurities.github.io/guides/linux-hardening.html#kasr-kernel-modules)

Madaidan recommends that you disable unprivileged [user namespaces](https://madaidans-insecurities.github.io/linux.html#kernel) due to it being responsible for various privileged escalation vulnerabilities. However, some software such as Podman and LXD require unprivileged user namespaces to function. If you decide that you want to use these technoligies, do not disable `kernel.unprivileged_userns_clone`.

If you are using KickSecure or Whonix, most of these hardening have already been done for you thanks to [security-misc](https://github.com/Kicksecure/security-misc). If you are using a Debian, you should consider [morphing](https://www.kicksecure.com/wiki/Debian) it into KickSecure. On other distributions, you can copy the configurations from the following files to use:

- [`/etc/sysctl.d/30_security-misc.conf`](https://github.com/Kicksecure/security-misc/blob/master/etc/sysctl.d/30_security-misc.conf)
- [`/etc/sysctl.d/30_silent-kernel-printk.conf`](https://github.com/Kicksecure/security-misc/blob/master/etc/sysctl.d/30_silent-kernel-printk.conf)
- [`/etc/modprobe.d/30_security-misc.conf`](https://github.com/Kicksecure/security-misc/blob/master/etc/modprobe.d/30_security-misc.conf)

Note that these configurations do not disable unprivileged user namespaces. There are also a few things in `/etc/modprobe.d/30_security-misc.conf` to keep in mind:
- The `bluetooth` and `btusb` kernel modules are disabled by default. You need to comment out `install bluetooth /bin/disabled-bluetooth-by-security-misc` and `install btusb /bin/disabled-bluetooth-by-security-misc` if you want to use Bluetooth.
- Apple filesystems are disabled by default. This is generally fine on non-Apple systems; however, if you are using Linux on an Apple product, you **must** check what filesystem your EFI partition uses. For example, if your EFI filesystem is HFS+, you need to comment out `install hfsplus /bin/disabled-filesys-by-security-misc`, otherwise your computer will not be able to boot into Linux.

### Harding Boot Parameters

Read through this section on how to harden your boot parameters:
- [2.3 Boot Parameters](https://madaidans-insecurities.github.io/guides/linux-hardening.html#boot-parameters)

Kicksecure comes with these boot parameters by default. This section is fairly short, so I'd recommend that you read it through. With that being said, here are all of the parameters that you would need:

`slab_nomerge init_on_alloc=1 init_on_free=1 page_alloc.shuffle=1 pti=on vsyscall=none debugfs=off oops=panic module.sig_enforce=1 lockdown=confidentiality mce=0 quiet loglevel=0 spectre_v2=on spec_store_bypass_disable=on tsx=off tsx_async_abort=full,nosmt mds=full,nosmt l1tf=full,force nosmt=force kvm.nx_huge_pages=force`

Note that [SMT](https://en.wikipedia.org/wiki/Simultaneous_multithreading) is disabled due to it being the cause of various security vulnerabilities. Also, on rpm-ostree based distributions, you should set the kernel parameters using `rpm-ostree kargs` rather than messing with grub configurations directly.

### Restricting access to /proc and /sys

You should read these 2 sections in Madaidan's guide to further reduce the attack surface on the kernel:

- [2.4 hidepid](https://madaidans-insecurities.github.io/guides/linux-hardening.html#hidepid)
- [2.7 Restricting access to sysfs](https://madaidans-insecurities.github.io/guides/linux-hardening.html#restricting-sysfs)

Disabling access to `/sys` without a proper whitelist will lead to various applications breaking. This will unfortunately be an extremely tedious process for most users. Kicksecure, and by extension, Whonix, has the experimental [proc-hidepid](https://github.com/Kicksecure/security-misc/blob/master/lib/systemd/system/proc-hidepid.service) and [hide-hardware-info](https://github.com/Kicksecure/security-misc/blob/master/lib/systemd/system/hide-hardware-info.service) services which do just this. From my testing, these work perfectly fine on minimal Kicksecure installations and both Qubes-Whonix Workstation and Gateway.

### linux-hardened

Some distributions like Arch Linux have the [linux-hardened](https://github.com/anthraxx/linux-hardened) kernel package. It includes [hardening patches](https://wiki.archlinux.org/title/security#Kernel_hardening) and more security-conscious defaults. linux-hardened has `kernel.unprivileged_userns_clone=0` disabled by default as well. See the [note above](#kernel-hardening) about how this might impact you.

### Linux Kernel Runtime Guard (LKRG)

LKRG is a kernel module that performs runtime integrity check on the kernel to help detect exploits against the kernel. LKRG works in a *post*-detect fashion, attempting to respond to unauthorized modifications to the running Linux kernel. While it is [bypassable by design](https://lkrg.org/), it does stop off-the-shelf malware that does not specifically target LKRG itself. This may make exploits harder to develop and execute on vulnerable systems.

If you can get LKRG and maintain module updates, it provides a worthwhile improvement to security. Debian-based distributions can get the LKRG DKMS package from KickSecure's repository and the [KickSecure documentation](https://www.kicksecure.com/wiki/Linux_Kernel_Runtime_Guard_LKRG) has installation instructions. Once again,if you are using debian, consider  [morphing](https://www.kicksecure.com/wiki/Debian) it into KickSecure. It should be noted that KickSecure does not currently install LKRG by default, and you will need to run `sudo apt install lkrg-dkms linux-headers-amd64` to obtain it.

On Fedora, [fepitre](https://github.com/fepitre), a QubesOS developer, has a [COPR repository](https://copr.fedorainfracloud.org/coprs/fepitre/lkrg/) where you can install it. Arch based systems can obtain the LKRG DKMS package via an [AUR package](https://aur.archlinux.org/packages/lkrg-dkms).

### grsecurity

grsecurity is a set of kernel patches that attempt to improve security of the Linux kernel. It requires [payment to access](https://grsecurity.net/purchase) the code and is worth using if you have a subscription.

### Disable Simultaneous Multithreading (SMT)

[SMT](https://en.wikipedia.org/wiki/Simultaneous_multithreading) has been the cause of numerous hardware vulnerabilities, and subsequent patches for those vulnerabilities often come with performance penalties that negate most of the performance gain given by SMT. If you followed the “kernel hardening” section above, some kernel parameters already disable SMT. If the option is available to you, we recommend that you disable it in your firmware as well.

### Hardened Memory Allocator

The [hardened memory allocator](https://github.com/GrapheneOS/hardened_malloc) from [GrapheneOS](https://grapheneos.org) can also be used on general Linux distributions. It is available as an [AUR package](https://wiki.archlinux.org/title/Security#Hardened_malloc) on Arch based distributions, and (though not enabled by default) on Whonix and Kicksecure.

If you are using Whonix, Kicksecure or the AUR package, consider setting up `LD_PRELOAD` as described in the [Kicksecure Documentation](https://www.kicksecure.com/wiki/Hardened_Malloc) or [Arch Wiki](https://wiki.archlinux.org/title/Security#Hardened_malloc).

### Strict UMASK

If you are not using openSUSE, consider changing the default [umask](https://en.wikipedia.org/wiki/Umask) for both regular user accounts and root to 077. Changing umask to 077 can break snapper on openSUSE and is **not** recommended.

### Mountpoint Hardening

Consider adding the [following options](https://man7.org/linux/man-pages/man8/mount.8.html) `nodev`, `noexec`, and `nosuid` to mountpoints which do not need them. Typically, these could be applied to `/boot`, `/boot/efi`, and `/var`.

These flags could also be applied to `/home` and `/root` as well, however, `noexec` will prevent applications from working that require binary execution in those locations. This includes products such as Flatpak and Snap. It should also be noted that this is not fool proof, as `noexec` is bypassable. You can see an example of that [here](https://chromium.googlesource.com/chromiumos/docs/+/HEAD/security/noexec_shell_scripts.md)

If you use [Toolbox](https://docs.fedoraproject.org/en-US/fedora-silverblue/toolbox/), you should not set any of those options on `/var/log/journal`. From my testing, the Toolbox container will fail to start if you have `nodev`, `nosuid`, or `noexec` on said directory. If you are on Arch Linux, you probably would not want to set `noexec` on `/var/tmp`, as it will make some AUR packages fail to build.

### Disabling SUID

SUID allows a user to execute an application as the owner of that application, which in many cases, would be the `root` user. Vulnerable SUID executables could lead to privilege escalation vulnerabilities.

It is desirable to remove SUID from as many binaries as possible; however, this takes substantial effort and trial and error on the user's part, as some applications require SUID to function.

Kicksecure, and by extension, Whonix has an experimental [permission hardening service](https://github.com/Kicksecure/security-misc/blob/master/lib/systemd/system/permission-hardening.service) and [application whitelist](https://github.com/Kicksecure/security-misc/tree/master/etc/permission-hardening.d) to automate SUID removal from most binaries and libraries on the system. From our testing, these work perfectly fine on a minimal Kicksecure installation and both Qubes-Whonix Workstation and Gateway.

If you are using Kicksecure or Whonix, we recommend that you follow the [Kicksecure Wiki](https://www.kicksecure.com/wiki/SUID_Disabler_and_Permission_Hardener) to enable the permission hardener.

Users of other distributions can adapt the permission hardener to their own system based on the source code linked above.

### Secure Time Synchronization

Most Linux distributions by default (especially Arch based distributions with `systemd-timesyncd`) use NTP for time synchronization which is unencrypted and unauthenticated. Securing NTP can be achieved by [configuring NTS with chronyd](https://fedoramagazine.org/secure-ntp-with-nts/) or by using [sdwdate](https://github.com/Kicksecure/sdwdate) on Debian based distributions.

### Linux Pluggable Authentication Modules (PAM)

The security of [PAM](https://en.wikipedia.org/wiki/Linux_PAM) can be [hardened](https://madaidans-insecurities.github.io/guides/linux-hardening.html#pam) to allow secure authentication to your system.

On Red Hat distributions you can use [`authselect`](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/configuring_authentication_and_authorization_in_rhel/configuring-user-authentication-using-authselect_configuring-authentication-and-authorization-in-rhel) to configure this e.g.:

```bash
sudo authselect select <profile_id, default: sssd> with-faillock without-nullok with-pamaccess
```

On systems where [`pam_faillock`](https://man7.org/linux/man-pages/man8/pam_tally.8.html) is not available, consider using [`pam_tally2`](https://man7.org/linux/man-pages/man8/pam_tally.8.html) instead.

### USB Port Protection

To better protect your [USB](https://en.wikipedia.org/wiki/USB) ports from attacks such as [BadUSB](https://en.wikipedia.org/wiki/BadUSB), we recommend [USBGuard](https://github.com/USBGuard/usbguard). USBGuard has [documentation](https://github.com/USBGuard/usbguard#documentation) as does the [Arch Wiki](https://wiki.archlinux.org/title/USBGuard).

Another alternative option if you’re using the [linux-hardened](#linux-hardened) is the [`deny_new_usb`](https://github.com/GrapheneOS/linux-hardened/commit/96dc427ab60d28129b36362e1577b6673b0ba5c4) sysctl. See [Preventing USB Attacks with `linux-hardened`](https://blog.lizzie.io/preventing-usb-attacks-with-linux-hardened.html).

### Secure Boot

[Secure Boot](https://en.wikipedia.org/wiki/Unified_Extensible_Firmware_Interface#Secure_Boot) can be used to secure the boot process by preventing the loading of [unsigned](https://en.wikipedia.org/wiki/Public-key_cryptography) [UEFI](https://en.wikipedia.org/wiki/Unified_Extensible_Firmware_Interface) drivers or [boot loaders](https://en.wikipedia.org/wiki/Bootloader).

One of the problems with Secure Boot, particularly on Linux is, that only the chainloader (shim), the [boot loader](https://en.wikipedia.org/wiki/Bootloader) (GRUB), and the [kernel](https://en.wikipedia.org/wiki/Kernel_(operating_system)) are verified and that's where verification stops. The [initramfs](https://en.wikipedia.org/wiki/Initial_ramdisk) is often left unverified, unencrypted, and open up the window for an [evil maid](https://en.wikipedia.org/wiki/Evil_maid_attack) attack. The firmware on most devices is also configured to trust Microsoft's keys for Windows and its partners, leading to a large attacks surface.

To eliminate the need to trust Microsoft's keys, follow the "Using your own keys" section on the [Arch Wiki](https://wiki.archlinux.org/title/Unified_Extensible_Firmware_Interface/Secure_Boot). The important thing that needs to be done here is to replace the OEM's key with your own Platform Key.

There are several ways to work around the unverified initramfs:

The first way is to [encrypt the /boot partition](https://wiki.archlinux.org/title/GRUB#Encrypted_/boot). If you are on Fedora Workstation (not Silverblue), you can follow [this guide](https://mutschler.eu/linux/install-guides/fedora-btrfs-33/) to convert the existing installation to encrypted `/boot`. openSUSE comes with this that by default.

Encrypting `/boot` however have its own issues, one being that [GRUB](https://en.wikipedia.org/wiki/GNU_GRUB) only supports [LUKS1](https://en.wikipedia.org/wiki/Linux_Unified_Key_Setup) and not the newer default LUKS2 scheme. As the bootloader runs in [protected mode](https://en.wikipedia.org/wiki/Protected_mode) and the encryption module lacks SSE acceleration so the boot process will take minutes to complete. Another problem with this is that you have to type the encryption password twice, which could be solved by following the [openSUSE Wiki](https://en.opensuse.org/SDB:Encrypted_root_file_system#Avoiding_to_type_the_passphrase_twice).

There are a few options depending on your configuration:

- If you enroll your own keys as described above, and your distribution supports Secure Boot by default, you can add your distribution's EFI Key into the list of trusted keys (db keys). It can then be enrolled into the firmware. Then, you should move all of your keys off your local storage device.
- If you enroll your own keys as described above, and your distribution does **not** support Secure Boot out of the box (like Arch Linux), you have to leave the keys on the disk and setup automatic signing of the [kernel](https://wiki.archlinux.org/title/Unified_Extensible_Firmware_Interface/Secure_Boot#Signing_the_kernel_with_a_pacman_hook) and bootloader. If you are using Grub, you can install it with the `--no-shim-lock` option and remove the need for the chainloader.

The second option is to creating an [EFI Boot Stub](https://wiki.archlinux.org/title/Unified_kernel_image) that contains the kernel, [initramfs](https://en.wikipedia.org/wiki/Initial_ramdisk), and [microcode](https://en.wikipedia.org/wiki/Microcode). This EFI stub can then be signed. If you use [dracut](https://en.wikipedia.org/wiki/Dracut_(software)) this can easily be done with the [`--uefi-stub` switch](https://man7.org/linux/man-pages/man8/dracut.8.html) or the [`uefi_stub` config](https://www.man7.org/linux/man-pages/man5/dracut.conf.5.html) option. This option also requires you to leave the keys on the disk to setup automatic signing, which weakens the security model.

After setting up Secure Boot it is crucial that you set a “firmware password” (also called a “supervisor password”, “BIOS password” or “UEFI password”), otherwise an adversary can simply disable Secure Boot.

These recommendations can make you a little more resistant to [evil maid](https://en.wikipedia.org/wiki/Evil_maid_attack) attacks, but they not good as a proper verified boot process such as that found on [Android](https://source.android.com/security/verifiedboot), [ChromeOS](https://support.google.com/chromebook/answer/3438631) or [Windows](https://docs.microsoft.com/en-us/windows/security/information-protection/secure-the-windows-10-boot-process).

### Automatic Kernel Module Signing