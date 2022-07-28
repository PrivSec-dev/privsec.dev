---
title: "Linux Hardening Guide"
tags: ['operating systems', 'linux', 'privacy', 'security']
author: Tommy
---

Linux is [not](https://madaidans-insecurities.github.io/linux.html) a security operating system. However, there are step you can take harden it, reduce its attack surface and improve its privacy.

**Disclosure**: This guide is largely based on [Madaidan's Linux hardening guide](https://madaidans-insecurities.github.io/guides/linux-hardening.html); however, it does take into account the usability, ease of maintenance of each recommendation. The goal is to produce a guide that intermediate to advanced Linux users can reasonably follow to set up and maintain the security configurations. It will also **not** try to be distribution agnostic, and there will be many distribution specific recommendations.

![Fedora Tux](/images/fedora-tux.png)


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

The Fedora Project [counts](https://fedoraproject.org/wiki/Changes/DNF_Better_Counting) how many unique systems access its mirrors by using a [`countme`](https://fedoraproject.org/wiki/Changes/DNF_Better_Counting#Detailed_Description) variable instead of a unique ID. Fedora does this to determine load and provision better servers for updates where necessary.

This [option](https://dnf.readthedocs.io/en/latest/conf_ref.html#options-for-both-main-and-repo) is currently off by default. We recommend adding `countme=false` to `/etc/dnf/dnf.conf` just in case it is enabled in the future. On systems that use `rpm-ostree` such as Silverblue, the countme option is disabled by masking the [rpm-ostree-countme](https://fedoramagazine.org/getting-better-at-counting-rpm-ostree-based-systems/) timer.

openSUSE also uses a [unique ID](https://en.opensuse.org/openSUSE:Statistics) to count systems, which can be disabled by deleting the `/var/lib/zypp/AnonymousUniqueId` file.

[Snapd](https://github.com/snapcore/snapd), while providing somewhat useful sandboxing on AppArmor + Cgroupsv1 systems, assigns a [unique ID](https://snapcraft.io/docs/snap-store-metrics) to your snapd installation and use it for telemetry. While this is generally not a problem, if your threat model calls for anonimity, you should not be using snap packages, and you should remove snapd from your Ubuntu installation.

Ubuntu does like to put packages in the .deb repository that will just install its snap counterpart. An example of this would be the [Chromium package](https://askubuntu.com/questions/1185091/why-apt-package-chromium-browser-installs-snap-package-instead). If you choose to remove snapd, you can use `sudo apt-mark hold snapd` to prevent accidental installation of snapd again.

### Keystroke Anonymization
You could be [fingerprinted based on soft biometric traits](https://www.whonix.org/wiki/Keystroke_Deanonymization) when you use the keyboard. The [Kloak](https://github.com/vmonaco/kloak) package could help you mitigate this threat. It is available as a .deb package from [Kicksecure's repository](https://www.kicksecure.com/wiki/Packages_for_Debian_Hosts) and an [AUR package](https://aur.archlinux.org/packages/kloak-git).

WIth that being said, if your threat model calls for using something like Kloak, you are probably better off just using Whonix.

## Application Confinement
Some sandboxing solutions for desktop Linux distributions do exist, however they are not as strict as those found in macOS or ChromeOS. Applications installed from the package manager (`dnf`, `apt`, etc.) typically have **no** sandboxing or confinement whatsoever. Below are a few projects that aim to solve this problem:

### Flatpak

{{< youtube id="GkgPIJp8_30">}}

[Flatpak](https://flatpak.org) aims to be a universal package manager for Linux. One of its main goals is to provide a universal package format which can be used in most Linux distributions. It provides some [permission control](https://docs.flatpak.org/en/latest/sandbox-permissions.html). With that being said, Flatpak sandboxing is [quite weak](https://madaidans-insecurities.github.io/linux.html#flatpak).

You can restrict applications further by issuing [Flatpak overrides](https://docs.flatpak.org/en/latest/flatpak-command-reference.html#flatpak-override). This can be done with the command-line or by using [Flatseal](https://flathub.org/apps/details/com.github.tchx84.Flatseal). Some sample overrides are provided by [me](https://github.com/tommytran732/Flatpak-Overrides) and [rusty-snake](https://github.com/rusty-snake/kyst/tree/main/flatpak). Note that this only helps with the lax high level default permissions, but cannot solve the low level issues like `/proc` and `/sys` access, or an insufficient seccomp blacklist.

Some sensitive permissions you should pay attention to:

- the Network (`share=network`) socket (internet access)
- the PulseAudio socket (for both audio in and out), `device=all` (access to all devices including the camera)
- `org.freedesktop.secrets` dbus (access to secrets stored on your keychain) for applications which do not need it

If an application works natively with Wayland (and not running through the [XWayland](https://wayland.freedesktop.org/xserver.html) compatibility layer), consider revoking its access to the X11 (`socket=x11`) and [Inter-process communications (IPC)](https://en.wikipedia.org/wiki/Unix_domain_socket) socket (`share=ipc`) as well.

Many flatpak apps come with broad filesystem permissions such as `filesystem=home` and `filesystem=host`. Some applications like implement the [Portals](https://docs.flatpak.org/en/latest/portal-api-reference.html) [API](https://en.wikipedia.org/wiki/API), which allows a file manager to pass files to the Flatpak application (e.g. VLC) without specific filesystem access privileges. Despite of this, many of them, including ones like VLC [still includes](https://github.com/flathub/org.videolan.VLC/blob/master/org.videolan.VLC.json) `filesystem=host` for no apparant reason. 

My strategy to deal with this is to revoke all filesystem access first, then test if an application works without it. If it does, it means the app is already using Portals and I don't need to do anything else. If it doesn't, then I start granting permission to specific directories.

As odd as this may sound, **you should not automatically update your Flatpak packages**. The problem with Flatpak is that it grants install-time permissions when you update your applications, and you will not be notified of the permission change unless you update them manually via the command line.

### Snap

Snap is another universal package manager with some sandboxing support. It is developed by Canonical and heavily pushed on Ubuntu.

Snap packages come in [two variants](https://snapcraft.io/docs/snap-confinement): classic snap with no confinement and strict snap with confinement on systems with AppArmor and Cgroupsv1. If a snap package is classic snap, you are better off using a version provided by your distribution's repository instead, if one is available. If your system does not have AppArmor, then you are better off not using snap at all. Most modern systems outside of Ubuntu and its derivatives only use Cgroupsv2 by default, so you have to set `systemd.unified_cgroup_hierarchy=0` in your kernel parameters to get Cgroupsv1 working.

Snap permissions can be managed via the Snap Store or Ubuntu's custom patched GNOME Control Center.

### Firejail

[Firejail](https://firejail.wordpress.com/) is another method of sandboxing. As it is a large [setuid](https://en.wikipedia.org/wiki/Setuid) binary, it has a large attack surface which may assist in [privilege escalation](https://en.wikipedia.org/wiki/Privilege_escalation).

Madaidan [provided](https://madaidans-insecurities.github.io/linux.html#firejail) additional details on how Firejail can worsen the security of your device.

Generally, you are should are better off not using it.

### Mandatory Access Control

[Mandatory access control](https://en.wikipedia.org/wiki/Mandatory_access_control) systems require policy files in order to force constraints on the system.

The two main control systems are [SELinux](https://en.wikipedia.org/wiki/Security-Enhanced_Linux) (used on Android and Fedora) and [AppArmor](https://en.wikipedia.org/wiki/AppArmor).

Fedora includes SELinux preconfigured with some policies that will confine [system daemons](https://en.wikipedia.org/wiki/Daemon_(computing)) (background processes). You should keep it in Enforcing mode.

openSUSE gives the choice of AppArmor or SELinux during the installation process. You should stick to the default for each variant (AppArmor for [Tumbleweed](https://get.opensuse.org/tumbleweed/) and SELinux for [MicroOS](https://microos.opensuse.org/)). openSUSE’s SELinux policies are derived from Fedora.

Arch and Arch-based operating systems often do not come with a mandatory access control system and that must be configured manually for either [AppArmor](https://wiki.archlinux.org/title/AppArmor) or [SELinux](https://wiki.archlinux.org/title/SELinux).

Linux desktops don't usually include individual app confinement rules, unlike Android which sandboxes every application installed.

### Making your own policies/profiles

You can make your own AppArmor profiles, SELinux policies, Bubblewrap profiles, and [seccomp](https://en.wikipedia.org/wiki/Seccomp) blacklist to have better confinement of applications. This is an advanced and sometimes tedious task, so I won’t go into detail about how to do it here, but there are a few projects that you could use as reference.

- Whonix’s [AppArmor Everything](https://github.com/Whonix/apparmor-profile-everything)
- Krathalan’s [AppArmor profiles](https://github.com/krathalan/apparmor-profiles)
- noatsecure’s [SELinux templates](https://github.com/noatsecure/hardhat-selinux-templates)
- Seirdy’s [Bubblewrap scripts](https://sr.ht/~seirdy/bwrap-scripts)

### Securing Linux containers

If you’re running a server, you may have heard of Linux Containers, Docker. Containers are more common in server and development environments where individual apps are built to operate independently.

[Docker](https://en.wikipedia.org/wiki/Docker_(software)) is one of the most common container solutions. It is **not** a proper sandbox, and this means that there is a large kernel attack surface. You can should the [Docker and OCI Hardening](/os/docker-and-oci-hardening/) guide to mitigate this problem.

Another option is [Kata containers](https://katacontainers.io/), where virtual machines masquerade as containers. Each Kata container has its own Linux kernel and is isolated from the host.

## Security Hardening

![opensuse-computer.jpg](/images/opensuse-computer.jpg)

### Firewalls

A [firewall](https://en.wikipedia.org/wiki/Firewall_(computing)) may be used to secure connections to your system. If you’re on a public network, the necessity of this may be greater than if you’re on a local trusted network that you control. 

Red Hat distributions (such as Fedora) are typically configured through [firewalld](https://en.wikipedia.org/wiki/Firewalld). Red Hat has plenty of [documentation](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/configuring_and_managing_networking/using-and-configuring-firewalld_configuring-and-managing-networking) regarding this topic. There is also the [Uncomplicated Firewall](https://en.wikipedia.org/wiki/Uncomplicated_Firewall) which can be used as an alternative.

You could also set your default firewall zone to drop packets. If you're on a Redhat based distribution, such as Fedora this can be done with the following commands:

```
firewall-cmd --set-default-zone=drop
firewall-cmd --add-protocol=ipv6-icmp --permanent
firewall-cmd --add-service=dhcpv6-client --permanent
```

All these firewalls use the [Netfilter](https://en.wikipedia.org/wiki/Netfilter) framework and therefore cannot protect against malicious programs running on the system. A malicious program could insert its own rules.

There are some per-binary outbound firewalls such as [OpenSnitch](https://github.com/evilsocket/opensnitch) or [Portmaster](https://safing.io/portmaster/) that you could use as well. But just like Firewalld and UFW, they are bypassable.

If you are using Flatpak packages, you can revoke their network socket access using Flatseal and prevent those applications from accessing your network. This permission is not bypassable.

If you are using non-classic [Snap](https://en.wikipedia.org/wiki/Snap_(package_manager)) packages on a system with proper snap confinement support (with both AppArmor and [cgroups](https://en.wikipedia.org/wiki/Cgroups) v1 present), you can use the Snap Store to revoke network permission as well. This is also not bypassable.

### Kernel hardening

Kernel hardening options such as configuring [sysctl](https://en.wikipedia.org/wiki/Sysctl#Linux) keys and [kernel command-line parameters](https://www.kernel.org/doc/html/latest/admin-guide/kernel-parameters.html) can help harden your system. We suggest looking at the following [sysctl settings](https://madaidans-insecurities.github.io/guides/linux-hardening.html#sysctl) and [boot parameters](https://madaidans-insecurities.github.io/guides/linux-hardening.html#boot-parameters).

We **strongly** recommend that you learn what these options do before applying them. There are also some methods of [kernel attack surface reduction](https://madaidans-insecurities.github.io/guides/linux-hardening.html#kernel-attack-surface-reduction) and [access restrictions to sysfs](https://madaidans-insecurities.github.io/guides/linux-hardening.html#restricting-sysfs) that can further improve security.

!!! Note
    Unprivileged [user namespaces](https://madaidans-insecurities.github.io/linux.html#kernel) can be disabled, due to it being responsible for various privileged escalation vulnerabilities. Some software such as Docker, Podman, and LXC require unprivileged user namespaces to function. If you use these tools you should not disable `kernel.unprivileged_userns_clone`.

    Disabling access to `/sys` without a proper whitelist will lead to various applications breaking. This will unfortunately be an extremely tedious process for most users. Kicksecure, and by extension, Whonix, has an experimental [hide hardware info service](https://github.com/Kicksecure/security-misc/blob/master/lib/systemd/system/hide-hardware-info.service) which does just this. From our testing, these work perfectly fine on minimal Kicksecure installations and both Qubes-Whonix Workstation and Gateway. If you are using Kicksecure or Whonix, we recommend that you follow the [Kicksecure Wiki](https://www.kicksecure.com/wiki/Security-misc) to enable hide hardware info service.

### Linux-Hardened

Some distributions like Arch Linux have the [linux-hardened](https://github.com/anthraxx/linux-hardened), kernel package. It includes [hardening patches](https://wiki.archlinux.org/title/security#Kernel_hardening) and more security-conscious defaults. Linux-Hardened has `kernel.unprivileged_userns_clone=0` disabled by default. See the [note above](#kernel-hardening) about how this might impact you.

### Linux Kernel Runtime Guard (LKRG)

LKRG is a kernel module that performs runtime integrity check on the kernel to help detect exploits against the kernel. LKRG works in a *post*-detect fashion, attempting to respond to unauthorized modifications to the running Linux kernel. While it is [bypassable by design](https://lkrg.org/), it does stop off-the-shelf malware that does not specifically target LKRG itself. This may make exploits harder to develop and execute on vulnerable systems.

If you can get LKRG and maintain module updates, it provides a worthwhile improvement to security. Debian based distributions can get the LKRG DKMS package from KickSecure's secure repository and the [KickSecure documentation](https://www.kicksecure.com/wiki/Linux_Kernel_Runtime_Guard_LKRG) has instructions.

On Fedora, [fepitre](https://github.com/fepitre), a QubesOS developer has a [COPR repository](https://copr.fedorainfracloud.org/coprs/fepitre/lkrg/) where you can install it. Arch based systems can obtain the LKRG DKMS package via an [AUR package](https://aur.archlinux.org/packages/lkrg-dkms).

### GRSecurity

GRSecurity is a set of kernel patches that attempt to improve security of the Linux kernel. It requires [payment to access](https://grsecurity.net/purchase) the code and is worth using if you have a subscription.

### Simultaneous multithreading (SMT)

[SMT](https://en.wikipedia.org/wiki/Simultaneous_multithreading) has been the cause of numerous hardware vulnerabilities, and subsequent patches for those vulnerabilities often come with performance penalties that negate most of the performance gain given by SMT. If you followed the “kernel hardening” section above, some kernel parameters already disable SMT. If the option is available to you, we recommend that you disable it in your firmware as well.

### Hardened memory allocator

The [hardened memory allocator](https://github.com/GrapheneOS/hardened_malloc) from [GrapheneOS](https://grapheneos.org) can also be used on general Linux distributions. It is available as an [AUR package](https://wiki.archlinux.org/title/Security#Hardened_malloc) on Arch based distributions, and (though not enabled by default) on Whonix and Kicksecure.

If you are using Whonix, Kicksecure or the AUR package, consider setting up `LD_PRELOAD` as described in the [Kicksecure Documentation](https://www.kicksecure.com/wiki/Hardened_Malloc) or [Arch Wiki](https://wiki.archlinux.org/title/Security#Hardened_malloc).

### Umask

If you are not using openSUSE, consider changing the default [umask](https://en.wikipedia.org/wiki/Umask) for both regular user accounts and root to 077. Changing umask to 077 can break snapper on openSUSE and is **not** recommended.

### Mountpoint hardening

Consider adding the [following options](https://man7.org/linux/man-pages/man8/mount.8.html) `nodev`, `noexec`, and `nosuid` to [mountpoints](https://en.wikipedia.org/wiki/Mount_(computing)) which do not need them. Typically, these could be applied to `/boot`, `/boot/efi`, and `/var`.

These flags could also be applied to `/home` and `/root` as well, however, `noexec` will prevent applications from working that require binary execution in those locations. This includes products such as Flatpak and Snap.

If you use [Toolbox](https://docs.fedoraproject.org/en-US/fedora-silverblue/toolbox/), `/var/log/journal` must not have any of those options. If you are on Arch Linux, do not apply `noexec` to `/var/tmp`.

### Disabling SUID

SUID allows a user to execute an application as the owner of that application, which in many cases, would be the `root` user. Vulnerable SUID executables could lead to privilege escalation vulnerabilities.

It is desirable to remove SUID from as many binaries as possible; however, this takes substantial effort and trial and error on the user's part, as some applications require SUID to function.

Kicksecure, and by extension, Whonix has an experimental [permission hardening service](https://github.com/Kicksecure/security-misc/blob/master/lib/systemd/system/permission-hardening.service) and [application whitelist](https://github.com/Kicksecure/security-misc/tree/master/etc/permission-hardening.d) to automate SUID removal from most binaries and libraries on the system. From our testing, these work perfectly fine on a minimal Kicksecure installation and both Qubes-Whonix Workstation and Gateway.

If you are using Kicksecure or Whonix, we recommend that you follow the [Kicksecure Wiki](https://www.kicksecure.com/wiki/SUID_Disabler_and_Permission_Hardener) to enable the permission hardener.

Users of other distributions can adapt the permission hardener to their own system based on the source code linked above.

### Secure Time Synchronization

Most Linux distributions by default (especially Arch based distributions with `systemd-timesyncd`) use un-encrypted NTP for time synchronization. Securing NTP can be achieved by [configuring NTS with chronyd](https://fedoramagazine.org/secure-ntp-with-nts/) or by using [swdate](https://github.com/Kicksecure/sdwdate) on Debian based distributions.

### Linux Pluggable Authentication Modules (PAM)

The security of [PAM](https://en.wikipedia.org/wiki/Linux_PAM) can be [hardened](https://madaidans-insecurities.github.io/guides/linux-hardening.html#pam) to allow secure authentication to your system.

On Red Hat distributions you can use [`authselect`](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/configuring_authentication_and_authorization_in_rhel/configuring-user-authentication-using-authselect_configuring-authentication-and-authorization-in-rhel) to configure this e.g.:

```bash
sudo authselect select <profile_id, default: sssd> with-faillock without-nullok with-pamaccess
```

On systems where [`pam_faillock`](https://man7.org/linux/man-pages/man8/pam_tally.8.html) is not available, consider using [`pam_tally2`](https://man7.org/linux/man-pages/man8/pam_tally.8.html) instead.

### USB port protection

To better protect your [USB](https://en.wikipedia.org/wiki/USB) ports from attacks such as [BadUSB](https://en.wikipedia.org/wiki/BadUSB), we recommend [USBGuard](https://github.com/USBGuard/usbguard). USBGuard has [documentation](https://github.com/USBGuard/usbguard#documentation) as does the [Arch Wiki](https://wiki.archlinux.org/title/USBGuard).

Another alternative option if you’re using the [linux-hardened](#linux-hardened) is the [`deny_new_usb`](https://github.com/GrapheneOS/linux-hardened/commit/96dc427ab60d28129b36362e1577b6673b0ba5c4) sysctl. See [Preventing USB Attacks with `linux-hardened`](https://blog.lizzie.io/preventing-usb-attacks-with-linux-hardened.html).

### Secure Boot

[Secure Boot](https://en.wikipedia.org/wiki/Unified_Extensible_Firmware_Interface#Secure_Boot) can be used to secure the boot process by preventing the loading of [unsigned](https://en.wikipedia.org/wiki/Public-key_cryptography) [UEFI](https://en.wikipedia.org/wiki/Unified_Extensible_Firmware_Interface) drivers or [boot loaders](https://en.wikipedia.org/wiki/Bootloader).

One of the problems with Secure Boot, particularly on Linux is, that only the [chainloader](https://en.wikipedia.org/wiki/Chain_loading#Chain_loading_in_boot_manager_programs) (shim), the [boot loader](https://en.wikipedia.org/wiki/Bootloader) (GRUB), and the [kernel](https://en.wikipedia.org/wiki/Kernel_(operating_system)) are verified and that's where verification stops. The [initramfs](https://en.wikipedia.org/wiki/Initial_ramdisk) is often left unverified, unencrypted, and open up the window for an [evil maid](https://en.wikipedia.org/wiki/Evil_maid_attack) attack. The firmware on most devices is also configured to trust Microsoft's keys for Windows and its partners, leading to a large attacks surface.

To eliminate the need to trust Microsoft's keys, follow the "Using your own keys" section on the [Arch Wiki](https://wiki.archlinux.org/title/Unified_Extensible_Firmware_Interface/Secure_Boot). The important thing that needs to be done here is to replace the OEM's key with your own Platform Key.

There are several ways to work around the unverified initramfs:

The first way is to [encrypt the /boot partition](https://wiki.archlinux.org/title/GRUB#Encrypted_/boot). If you are on Fedora Workstation (not Silverblue), you can follow [this guide](https://mutschler.eu/linux/install-guides/fedora-btrfs-33/) to convert the existing installation to encrypted `/boot`. openSUSE comes with this that by default.

Encrypting `/boot` however have its own issues, one being that [GRUB](https://en.wikipedia.org/wiki/GNU_GRUB) only supports [LUKS1](https://en.wikipedia.org/wiki/Linux_Unified_Key_Setup) and not the newer default LUKS2 scheme. As the bootloader runs in [protected mode](https://en.wikipedia.org/wiki/Protected_mode) and the encryption module lacks [SSE acceleration](https://en.wikipedia.org/wiki/Streaming_SIMD_Extensions) so the boot process will take minutes to complete. Another problem with this is that you have to type the encryption password twice, which could be solved by following the [openSUSE Wiki](https://en.opensuse.org/SDB:Encrypted_root_file_system#Avoiding_to_type_the_passphrase_twice).

There are a few options depending on your configuration:

- If you enroll your own keys as described above, and your distribution supports Secure Boot by default, you can add your distribution's EFI Key into the list of trusted keys (db keys). It can then be enrolled into the firmware. Then, you should move all of your keys off your local storage device.
- If you enroll your own keys as described above, and your distribution does **not** support Secure Boot out of the box (like Arch Linux), you have to leave the keys on the disk and setup automatic signing of the [kernel](https://wiki.archlinux.org/title/Unified_Extensible_Firmware_Interface/Secure_Boot#Signing_the_kernel_with_a_pacman_hook) and bootloader. If you are using Grub, you can install it with the `--no-shim-lock` option and remove the need for the chainloader.

The second option is to creating an [EFI Boot Stub](https://wiki.archlinux.org/title/Unified_kernel_image) that contains the [kernel](https://en.wikipedia.org/wiki/Kernel_(operating_system)), [initramfs](https://en.wikipedia.org/wiki/Initial_ramdisk), and [microcode](https://en.wikipedia.org/wiki/Microcode). This EFI stub can then be signed. If you use [dracut](https://en.wikipedia.org/wiki/Dracut_(software)) this can easily be done with the [`--uefi-stub` switch](https://man7.org/linux/man-pages/man8/dracut.8.html) or the [`uefi_stub` config](https://www.man7.org/linux/man-pages/man5/dracut.conf.5.html) option. This option also requires you to leave the keys on the disk to setup automatic signing, which weakens the security model.

After setting up Secure Boot it is crucial that you set a “firmware password” (also called a “supervisor password”, “BIOS password” or “UEFI password”), otherwise an adversary can simply disable Secure Boot.

These recommendations can make you a little more resistant to [evil maid](https://en.wikipedia.org/wiki/Evil_maid_attack) attacks, but they not good as a proper verified boot process such as that found on [Android](https://source.android.com/security/verifiedboot), [ChromeOS](https://support.google.com/chromebook/answer/3438631) or [Windows](https://docs.microsoft.com/en-us/windows/security/information-protection/secure-the-windows-10-boot-process).

### Automatic Kernel Module Signing