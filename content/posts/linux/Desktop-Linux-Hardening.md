---
title: "Desktop Linux Hardening"
date: 2022-08-17
tags: ['Operating Systems', 'Linux', 'Privacy', 'Security']
author: Tommy
---

Linux is [not a secure desktop operating system](/posts/linux/linux-insecurities/). However, there are steps you can take to harden it, reduce its attack surface, and improve its privacy.

**Before we start...**

Some of the sections will include mentions of unofficial builds of packages like linux&#8209;hardened, lkrg&#8209;akmod, hardened_malloc, and so on. These are not endorsements&nbsp;--- they are merely to show that you have options to easily obtain and update these packages. Using unofficial builds of packages means adding more parties to trust, and you have to evaluate whether it is worth doing so for the potential privacy/security benefits or not.

![Fedora Tux](/images/fedora-tux.png)

## During Installation

### Drive Encryption

Most Linux distributions have an option within its installer for enabling LUKS full disk encryption. If this option isn't set at installation time, you will have to backup your data and re-install, as encryption is applied after [disk partitioning](https://en.wikipedia.org/wiki/Disk_partitioning) but before [filesystem](https://en.wikipedia.org/wiki/File_system) creation.

### Encrypted Swap

Consider using [encrypted swap](https://wiki.archlinux.org/title/Dm-crypt/Swap_encryption) or [ZRAM](https://wiki.archlinux.org/title/Swap#zram-generator) instead of unencrypted swap to avoid potential security issues with sensitive data being pushed to [swap space](https://en.wikipedia.org/wiki/Memory_paging). While ZRAM can be set up post-installation, if you want to use encrypted swap, you should set it up while partitioning your drive.

Depending on your distribution, encrypted swap may be automatically set up if you choose to encrypt your drive. Fedora [uses ZRAM by default](https://fedoraproject.org/wiki/Changes/SwapOnZRAM), regardless of whether you enable drive encryption or not.

## Privacy Tweaks

### NetworkManager Trackability Reduction

Most desktop Linux distributions including Fedora, openSUSE, Ubuntu, and so on come with [NetworkManager](https://en.wikipedia.org/wiki/NetworkManager) by default to configure Ethernet and Wi-Fi settings.

WfKe9vLwSvv7rN has detailed guide on [trackability reduction with NetworkManager](/posts/linux/networkmanager-trackability-reduction/) which I highly recommend you check out.

In short, if you use NetworkManager, add the following to your `/etc/NetworkManager/conf.d/00-macrandomize.conf`:
```
[device]
wifi.scan-rand-mac-address=yes

[connection]
wifi.cloned-mac-address=random
ethernet.cloned-mac-address=random
```

Next, disable transient hostname management by adding the following to your `/etc/NetworkManager/conf.d/01-transient-hostname.conf`:

```
[main]
hostname-mode=none
```

Then, restart your NetworkManager service:

```bash
sudo systemctl restart NetworkManager
```

Finally, set your hostname to `localhost`:

```bash
sudo hostnamectl hostname "localhost"
```

Note that randomizing Wi-Fi MAC addresses depends on support from the Wi-Fi card firmware.

### Other Identifiers

There are other system identifiers which you may wish to be careful about. You should give this some thought to see if it applies to your [threat model](/posts/knowledge/threat-modeling/):

Username
: Your username is used in a variety of ways across your system. Consider using generic terms like "user" rather than your actual name.

Machine ID
: During installation a unique machine ID is generated and stored on your device. Consider [setting it to a generic ID](https://madaidans-insecurities.github.io/guides/linux-hardening.html#machine-id).

#### System Counting

Many Linux distributions sends some telemetry data by default to count how many systems are using their software. Consider disabling this depending on your threat model.

The Fedora Project offers a ["countme" variable](https://dnf.readthedocs.io/en/latest/conf_ref.html#countme-label) to much more accurately [count unique systems accessing its mirrors](https://fedoraproject.org/wiki/Changes/DNF_Better_Counting) without involving unique IDs. While currently disabled by default, you could add `countme=false` to `/etc/dnf/dnf.conf` in case the default changes in the future. On rpm&#8209;ostree systems such as Fedora Silverblue and Kinoite, the `countme` option can be disabled by [masking the rpm-ostree-countme timer](https://coreos.github.io/rpm-ostree/countme/).

[openSUSE uses a unique ID to count systems](https://en.opensuse.org/openSUSE:Statistics), which can be disabled by deleting the `/var/lib/zypp/AnonymousUniqueId` file.

[Zorin OS also uses a unique ID to count systems.](https://zorin.com/legal/privacy/#census) You can opt&#8209;out by running `sudo apt purge zorin-os-census` and optionally holding the package with `sudo apt-mark hold zorin-os-census` to avoid accidental reinstallation.

[snapd (Snap) assigns a unique ID to your installation and uses it for telemetry.](https://snapcraft.io/docs/snap-store-metrics) While this is generally not a problem, if your threat model calls for anonymity, you should avoid using Snap packages and uninstall snapd. Accidental reinstallation on Ubuntu can be prevented with `sudo apt-mark hold snapd`.

_Of course, this is a non&#8209;exhaustive list of telemetry on different Linux distributions. If you are aware of other tracking mechanisms used by these or other distributions, feel free to make a [pull request](https://github.com/PrivSec-dev/privsec.dev/blob/main/content/posts/linux/Linux-Desktop-Hardening.md) or [discussion post](https://github.com/PrivSec-dev/privsec.dev/discussions) detailing them!_

### Keystroke Anonymization

You could be [fingerprinted based on soft biometric traits](https://www.whonix.org/wiki/Keystroke_Deanonymization) when you use the keyboard. The [Kloak](https://github.com/vmonaco/kloak) package could help you mitigate this threat. It is available as a .deb package from [Kicksecure's repository](https://www.kicksecure.com/wiki/Packages_for_Debian_Hosts) and an [AUR package](https://aur.archlinux.org/packages/kloak-git).

With that being said, if your threat model calls for using something like Kloak, you are probably better off just using Whonix.

## Application Confinement

Some sandboxing solutions for desktop Linux distributions do exist; however, they are not as strict as those found in macOS or ChromeOS. Software installed with distro package managers (DNF, APT, etc.) typically have **no** sandboxing or confinement whatsoever. Several projects which aim to tackle this problem are discussed here.

### Flatpak

{{< youtube id="GkgPIJp8_30">}}

[Flatpak](https://flatpak.org) aims to be a distribution-agnostic package manager for Linux. One of its main goals is to provide a universal package format which can be used in most Linux distributions. It provides some [permission control](https://docs.flatpak.org/en/latest/sandbox-permissions.html). With that being said, [Flatpak sandboxing is quite weak](https://madaidans-insecurities.github.io/linux.html#flatpak).

You can restrict applications further by setting [Flatpak overrides](https://docs.flatpak.org/en/latest/flatpak-command-reference.html#flatpak-override). This can be done with the command&nbsp;line or by using [Flatseal](https://github.com/tchx84/Flatseal). Some sample overrides are provided by [me](https://github.com/tommytran732/Flatpak-Overrides) and [rusty-snake](https://github.com/rusty-snake/kyst/tree/main/flatpak). Note that this only helps with lax high&#8209;level default permissions and cannot solve the low&#8209;level issues like `/proc` and `/sys` access or an insufficient seccomp blacklist.

Some sensitive permissions of note:

- `--share=network`: network and internet access
- `--socket=pulseaudio`: the PulseAudio socket, grants access to all audio devices (including inputs)
- `--device=all`: access to all devices (including webcams)
- `--talk-name=org.freedesktop.secrets`: D&#8209;Bus access to secrets stored on your keychain

If an application works natively with Wayland (*not* running through the [XWayland](https://wayland.freedesktop.org/xserver.html) compatibility layer), consider revoking its access to X11 (`--nosocket=x11`) and the [inter&#8209;process communications (IPC)](https://en.wikipedia.org/wiki/Unix_domain_socket) socket (`--unshare=ipc`) as well.

Many Flatpak apps ship with broad filesystem permissions such as `--filesystem=home` and `--filesystem=host`. Some applications implement the [Portal API](https://docs.flatpak.org/en/latest/portal-api-reference.html), which allows a file manager to pass files to the Flatpak application (e.g. VLC) without specific filesystem access privileges. Despite this, many of them [still declare `--filesystem=host`](https://github.com/flathub/org.videolan.VLC/blob/master/org.videolan.VLC.json).

My strategy to deal with this is to revoke all filesystem access first, then test if an application works without it. If it does, it means the app is already using portals and no further action is needed. If it doesn't, then I start granting permission to specific directories.

As odd as this may sound, **you should not enable (blind) unattended updates of Flatpak packages**. If you or a Flatpak frontend (app store) simply executes `flatpak update -y`, Flatpaks will be automatically granted any new permissions declared upstream without notifying you. Using automatic update with GNOME Software is fine, as it does not automatically update Flatpaks with permission changes and notifies the user instead.

### Snap

Snap is another distribution-agnostic package manager with some sandboxing support. It is developed by Canonical and heavily promoted in Ubuntu.

Snap packages come in [two variants](https://snapcraft.io/docs/snap-confinement): classic, with no confinement, and strictly confined, where AppArmor and cgroups&nbsp;v1 are used to facilitate sandboxing. If a snap uses classic confinement ("classic snap"), you are better off installing an equivalent package from your distribution's repository if possible. If your system does not have AppArmor, then you should avoid Snap entirely. Additionally, most modern systems outside of Ubuntu and its derivatives use cgroups&nbsp;v2 by default, so you have to set `systemd.unified_cgroup_hierarchy=0` in your kernel parameters to get cgroups&nbsp;v1 working.

Snap permissions can be managed via the Snap Store or Ubuntu's custom patched GNOME Control Center.

One caveat with Snap packages is that you only have control over the interfaces declared in their manifests. For example, Snap has separate interfaces for `audio-playback` and `audio-record`, but some packages will only declare the legacy `pulseaudio` interface which grants access to both play and record audio. Likewise, some applications may work perfectly fine with Wayland, but the package maintainer may only declare the X11 interface in their manifest. For these cases, you need to reach out to the maintainer of the snap to update the manifest accordingly.

### Firejail

{{< youtube id="N-Mso2bSr3o">}}

[Firejail](https://firejail.wordpress.com/) is another method of sandboxing. As it is a large [setuid](https://en.wikipedia.org/wiki/Setuid) binary, it has a large attack surface which increase susceptibility to [privilege escalation vulnerabilities](https://en.wikipedia.org/wiki/Privilege_escalation). [Madaidan offers additional details on how Firejail can worsen the security of your device.](https://madaidans-insecurities.github.io/linux.html#firejail)

If you do use Firejail, [Firetools](https://github.com/netblue30/firetools) can help to quickly manage application permissions and launch sandboxed applications. Note that Firetools configurations are temporary with no option to save profiles for long&#8209;term use.

Firejail can also confine X11 windows using Xpra or Xephr, something that Flatpak and Snap cannot do. I highly recommend checking out [their documentation on X11 sandboxing](https://firejail.wordpress.com/documentation-2/x11-guide/).

One trick to launch applications with their Firejail profile is to use the `sudo firecfg` command. This will create a symlink `/usr/local/bin/app_name_here` pointing to Firejail, which will get used automatically by most .desktop files (which do not specify the absolute paths of their binaries) to use will launch the application through the symlink and have Firejail sandbox them this way. Of course, this is bypassable if you or some other applications launch the application directly from `/usr/bin/app_name_here` instead.

### Mandatory Access Control

Common Linux [mandatory access control (MAC)](https://en.wikipedia.org/wiki/Mandatory_access_control) frameworks require policy files in order to force constraints on the system. The two most notable are [SELinux](https://github.com/SELinuxProject/selinux) (used on Android and Fedora&#8209;based distributions) and [AppArmor](https://gitlab.com/apparmor/apparmor) (used on Debian&#8209;based distributions and most openSUSE variants).

Fedora includes SELinux preconfigured with some policies to confine system daemons (background processes). You should keep it in _enforcing_ mode.

openSUSE gives the choice of SELinux or AppArmor during the installation process. You should stick to the default for each variant (AppArmor for [Tumbleweed](https://get.opensuse.org/tumbleweed/) and SELinux for [MicroOS](https://microos.opensuse.org/)). openSUSE’s SELinux policies are derived from Fedora.

Arch and its derivatives often do not come with a mandatory access control system, and you must manually install and configure [AppArmor](https://wiki.archlinux.org/title/AppArmor).

Note that, unlike Android, traditional desktop Linux distributions typically do not have full system Mandatory Access Control policies; only a few system daemons are actually confined.

### Making Your Own Policies/Profiles

You can make your own AppArmor profiles, SELinux policies, [bubblewrap](https://github.com/containers/bubblewrap) profiles, and [seccomp](https://docs.kernel.org/userspace-api/seccomp_filter.html) blacklist to have better confinement of applications. This is an advanced and sometimes tedious task, but there are various projects you could use as reference:

- [Kicksecure's apparmor-profile-everything](https://github.com/Kicksecure/apparmor-profile-everything)
- [Krathalan’s AppArmor profiles](https://github.com/krathalan/apparmor-profiles)
- [noatsecure’s SELinux templates](https://github.com/noatsecure/hardhat-selinux-templates)
- [Seirdy’s bubblewrap scripts](https://sr.ht/~seirdy/bwrap-scripts)

### Securing Linux Containers

If you’re running a server, you may have heard of containers. They are more common in server environments where individual services are built to operate independently. However, you may sometimes see them on desktop systems as well, especially for development purposes.

[Docker](https://www.docker.com/) is one of the most popular container solutions. It does **not** offer a proper sandbox, meaning there is a large kernel attack surface. You should follow the [Docker and OCI Hardening guide](/posts/linux/docker-and-oci-hardening/) to mitigate this problem. In short, there are things you can do like using rootless containers (via configuration changes or [Podman](https://podman.io/)), using a runtime which provides a psuedo&#8209;kernel for each container ([gVisor](https://gvisor.dev/)), and so on.

Another option is [Kata Containers](https://katacontainers.io/) which masquerades virtual machines as containers. Each Kata container has its own kernel and is isolated from the host.

## Security Hardening

![opensuse-computer.jpg](/images/opensuse-computer.jpg)

### Umask 077

On distributions besides openSUSE, consider changing the default [umask](https://wiki.archlinux.org/title/Umask) for both root and regular users to `077` (symbolically, `u=rwx,g=,o=`). _On openSUSE, a umask of 077 can break snapper and is thus not recommended._

The configuration for this varies per distribution, but typically it can be set in `/etc/profile`, `/etc/bashrc`, or `/etc/login.defs`.

Note that, unlike on macOS, this will only change the umask for the shell. Files created by running applications will not have their permissions set to 600.

### Microcode Updates

You should make sure your system receives microcode updates to get fixes and mitigations for CPU vulnerabilities like [Meltdown and Spectre](https://meltdownattack.com/).

Debian does not ship microcode updates by default, so be sure to [enable the non-free repository](https://wiki.debian.org/SourcesList) and install the `microcode` package.

On Arch Linux, make sure you have the `intel-ucode` or `amd-ucode` package installed.

If you are looking to use the [GNU Guix](https://guix.gnu.org/en/download/) distribution, you should absolutely use the [Nonguix channel](https://gitlab.com/nonguix/nonguix) or similar to get microcode updates.

Avoid the Linux-libre kernel at all costs, as they [actively block loading binary&#8209;only microcode](https://www.phoronix.com/news/GNU-Linux-Libre-5.13).

### Firmware Updates

Many hardware vendors offer firmware updates to Linux systems through the [Linux Vendor Firmware Service](https://fwupd.org/). You can download and install updates using the following commands:

```bash
# Update metadata
fwupdmgr refresh

# Download and install firmware updates
fwupdmgr update
```

Some distributions like Debian do not have fwupd installed by default, so you should check for its existence on your system and install it if needed.

Several graphical frontends integrate with fwupd to offer firmware updates (GNOME Software, KDE Discover, Snap Store, [GNOME Firmware](https://gitlab.gnome.org/World/gnome-firmware), Pop!\_OS Settings app). However, not all distributions offer this integration by default, so you should check your specific system and setup scheduled updates or update notifications using [systemd timers](https://wiki.archlinux.org/title/systemd/Timers) or [cron](https://wiki.archlinux.org/title/Cron) if needed.

Note that fwupd, like Windows Update, supports updating the UEFI. Power loss or forced shutdown in the middle of a UEFI update can brick your system, so unattended UEFI updating is not recommended unless you have the means to recover from a corrupted UEFI (motherboard flashback functionality or EEPROM flashing tools). fwupd UEFI updates can be disabled by adding `uefi_capsule` to `DisabledPlugins` in `/etc/fwupd/daemon.conf` and then restarting the fwupd daemon (`sudo systemctl restart fwupd`). **Keeping your UEFI up&#8209;to&#8209;date is important for security patches, so make sure to periodically revert this setting and apply updates manually or install UEFI updates via other methods supported by some motherboards.**

### Firewall

A [firewall](https://en.wikipedia.org/wiki/Firewall_(computing)) may be used to secure connections to your system.

Red&nbsp;Hat distributions (such as Fedora) and openSUSE typically use [firewalld](https://firewalld.org/). Red&nbsp;Hat maintains [extensive documentation about firewalld and its graphical frontend firewall-config](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/configuring_and_managing_networking/using-and-configuring-firewalld_configuring-and-managing-networking).

Distributions based on Debian or Ubuntu typically use the [Uncomplicated Firewall (ufw)](https://wiki.ubuntu.com/UncomplicatedFirewall). As the name suggests, it is much less sophisticated than firewalld. One notable missing feature is the ability to apply different firewall rules for different connections (see _zones_ in firewalld).

You could also set your default firewall zone to drop packets. To implement this with firewalld (with the necessary exceptions for IPv6):

```
firewall-cmd --set-default-zone=drop
firewall-cmd --add-protocol=ipv6-icmp --permanent
firewall-cmd --add-service=dhcpv6-client --permanent
```

These firewalls use the [netfilter](https://netfilter.org/) framework and therefore cannot (without the help of strict [mandatory access control](#mandatory-access-control)) protect against malicious software running privileged on the system, which can insert their own routing rules that sidestep firewalld/ufw.

There are some per&#8209;binary outbound firewalls such as [OpenSnitch](https://github.com/evilsocket/opensnitch) and [Portmaster](https://safing.io/portmaster/) that you could use as well. But, just like firewalld and ufw, they are bypassable.

If you are using Flatpak packages, you can [set an override to block network access](#flatpak). This is not bypassable.

If you are using non&#8209;classic Snap packages on a system that [supports proper confinement (both AppArmor and cgroups&nbsp;v1 present)](#snap), you can use the Snap&nbsp;Store to revoke network permission. This is also not bypassable.

### Kernel Hardening

There are several things you can do to harden the Linux kernel, including setting appropriate [kernel parameters](https://wiki.archlinux.org/title/Kernel_parameters) and blacklisting unnecessary kernel modules.

_This section extensively references [Madaidan's Linux Hardening Guide](https://madaidans-insecurities.github.io/guides/linux-hardening.html) and in the interest of brevity does not repeat all the information contained there. You are strongly encouraged to read through the relevant sections of Madaidan's guide (linked for convenience)._

#### Runtime Kernel Parameters (sysctl)

_See ["2.2&nbsp;Sysctl"](https://madaidans-insecurities.github.io/guides/linux-hardening.html#sysctl) in Madaidan's guide._

Madaidan recommends that you disable [unprivileged user namespaces](https://www.containerlabs.kubedaily.com/LXC/Linux%20Containers/User_namespaces.html) due to the [significant attack surface for privilege escalation](https://madaidans-insecurities.github.io/linux.html#kernel). However, some software such as Podman and LXC relies on unprivileged user namespaces. If you wish to use such software, do not disable `kernel.unprivileged_userns_clone`.

If you are using Kicksecure or Whonix, most of this hardening is included by default. If you are using Debian, you should consider [morphing it into Kicksecure](https://www.kicksecure.com/wiki/Debian). On other distributions, you can copy the [configuration files from Kicksecure](https://github.com/Kicksecure/security-misc/tree/master/etc/sysctl.d) into `/etc/sysctl.d/` (but note that these configurations do not disable unprivileged user namespaces). There are also a few things in `30_security-misc.conf` to keep in mind:

- The `bluetooth` and `btusb` kernel modules are disabled. You need to comment out `install bluetooth /bin/disabled-bluetooth-by-security-misc` and `install btusb /bin/disabled-bluetooth-by-security-misc` to use Bluetooth.
- Apple filesystems are disabled. This is generally fine on non-Apple systems; however, if you are using an Apple device, you **must** check what filesystem your EFI partition uses. For example, if your EFI filesystem is HFS+, you need to comment out `install hfsplus /bin/disabled-filesys-by-security-misc`, otherwise your computer will not be able to boot Linux.
- The `cdrom` and `sr_mod` modules are merely _blacklisted_ (can still be loaded at runtime with `modprobe`). If you have no intention to ever use CD&#8209;ROM devices, they should be _disabled_ by *un*commenting the respective `install` lines. ([More about how this works on the ArchWiki](https://wiki.archlinux.org/title/Kernel_module#Using_files_in_/etc/modprobe.d/_2))
- To produce informative errors when utilising the configuration file, all 10 of the corresponding [debugging scripts](https://github.com/Kicksecure/security-misc/tree/master/bin) should be copied into `/bin/`.

#### Boot Parameters

_See ["2.3&nbsp;Boot parameters"](https://madaidans-insecurities.github.io/guides/linux-hardening.html#boot-parameters) in Madaidan's guide and [Kicksecure boot parameters](https://github.com/Kicksecure/security-misc/tree/master/etc/default/grub.d). If desired, [formal documentation of boot parameters](https://www.kernel.org/doc/html/latest/admin-guide/kernel-parameters.html) is available upstream._

Copy these parameters into [your bootloader's configuration](https://wiki.archlinux.org/title/Kernel_parameters#Configuration). On rpm&#8209;ostree distributions, make sure to use `rpm-ostree kargs` rather than editing GRUB configuration directly.

##### CPU mitigations

```
spectre_v2=on spec_store_bypass_disable=on l1tf=full,force mds=full,nosmt tsx=off tsx_async_abort=full, mds=full,nosmt kvm.nx_huge_pages=force nosmt=force l1d_flush=on mmio_stale_data=full,nosmt
```

[Simultaneous multithreading (SMT)](https://en.wikipedia.org/wiki/Simultaneous_multithreading) has been the cause of numerous hardware&#8209;level vulnerabilities and is thus disabled here. If the option is available, you should disable SMT/"Hyper&#8209;Threading" in your firmware as well.

Note however that disabling SMT may have a significant performance impact&nbsp;--- [for this reason the popular linux&#8209;hardened kernel for Arch does not disable SMT](https://github.com/anthraxx/linux-hardened/issues/37#issuecomment-619597365) by default. Assess your own risk tolerance, and, if you choose to keep SMT enabled, simply remove all occurrences of `nosmt` and `nosmt=force` from these parameters.

##### Kernel

```
slab_nomerge init_on_alloc=1 init_on_free=1 pti=on vsyscall=none page_alloc.shuffle=1 randomize_kstack_offset=on extra_latent_entropy debugfs=off oops=panic quiet loglevel=0
```

Kicksecure does not enforce either `module.sig_enforce=1` or `lockdown=confidentiality` by default as they lead to a lot of hardware compatibility issues; consider enabling these if possible on your system. Additionally, [`mce=0` is no longer recommended](https://forums.whonix.org/t/kernel-hardening/7296/493).

##### Entropy generation

```
random.trust_cpu=off random.trust_bootloader=off
```

Some implementations of the RDRAND instruction (by which the CPU offers a random number generator to the OS) have proven to be [vulnerable](https://en.wikipedia.org/wiki/RDRAND#Security_issues) or [outright defective](https://arstechnica.com/gadgets/2019/10/how-a-months-old-amd-microcode-bug-destroyed-my-weekend/). RDRAND is also impossible to audit, being part of the CPU itself.

As a precaution for the integrity of cryptographic operations, the CPU and bootloader should not be used as _credited_ entropy sources. Note that this change will increase boot time.

Further reading:

- [systemd: Random Seeds](https://systemd.io/RANDOM_SEEDS/)
- [Madaidan: RDRAND](https://madaidans-insecurities.github.io/guides/linux-hardening.html#rdrand)
- [Linux kernel mailing list](https://lore.kernel.org/lkml/20220605171539.417872-1-Jason@zx2c4.com/T/)
- [Hacker News discussion](https://news.ycombinator.com/item?id=33223232)
- [NixOS discussion](https://github.com/NixOS/nixpkgs/pull/165355) (also cites many additional sources)

##### DMA mitigations

```
intel_iommu=on amd_iommu=on efi=disable_early_pci_dma iommu.passthrough=0 iommu.strict=1
```

[Direct memory access (DMA) attacks](https://en.wikipedia.org/wiki/DMA_attack) can be mitigated via IOMMU and [disabling certain kernel modules](#kernel-modules). Furthermore, [strict enforcement of IOMMU TLB invalidation](https://github.com/Kicksecure/security-misc/blob/master/etc/default/grub.d/40_enable_iommu.cfg) should be applied so devices will never be able to access stale data contents.

[These parameters **do not provide comprehensive DMA protection**.](https://github.com/PrivSec-dev/privsec.dev/pull/81#issuecomment-1367511126) In early boot (before the kernel has loaded), only the system firmware can enforce IOMMU and thus provide DMA protection. A DMA attack in early boot can patch the kernel in memory to completely undermine these parameters.

_Note that disabling the busmaster bit on all PCI bridges during very early boot (`efi=disable_early_pci_dma`) can cause complete boot failure on certain systems with inadequate resources. Therefore, as always, ensure you have a fallback option to boot into the system whenever modifying any kernel parameters._

Further reading:

- [IOMMU Groups, inside and out](https://vfio.blogspot.com/2014/08/iommu-groups-inside-and-out.html)
- [IOMMU introduction](https://terenceli.github.io/%E6%8A%80%E6%9C%AF/2019/08/04/iommu-introduction)
- [intel IOMMU driver analysis](https://terenceli.github.io/%E6%8A%80%E6%9C%AF/2019/08/10/iommu-driver-analysis)
- [Avoiding gaps in IOMMU protection at boot](https://mjg59.dreamwidth.org/54433.html)
- [Madaidan: DMA attacks](https://madaidans-insecurities.github.io/guides/linux-hardening.html#dma-attacks)

#### Kernel Modules

_See ["2.5.2&nbsp;Blacklisting kernel modules"](https://madaidans-insecurities.github.io/guides/linux-hardening.html#kasr-kernel-modules) in Madaidan's guide._

Once again, Kicksecure includes this hardening by default and provides a config file which can be used on other distros: [`/etc/modprobe.d/30_security-misc.conf`](https://github.com/Kicksecure/security-misc/blob/master/etc/modprobe.d/30_security-misc.conf)

There are a few things in this config to keep in mind:

- Bluetooth is disabled. Comment out the `install bluetooth` and `install btusb` lines to use Bluetooth.
- Thunderbolt is disabled. Comment out the `install thunderbolt` line to use Thunderbolt devices.
- Apple filesystems are disabled. While generally fine on non&#8209;Apple systems, if you are using an Apple device you **must** check the filesystem of your EFI partition and comment out the relevant `install` line, otherwise your Linux install will not boot. For example, comment out the `install hfsplus` line if your ESP filesystem is HFS+.

#### Restricting access to /proc and /sys

_See ["2.4&nbsp;hidepid"](https://madaidans-insecurities.github.io/guides/linux-hardening.html#hidepid) and ["2.7&nbsp;Restricting access to sysfs"](https://madaidans-insecurities.github.io/guides/linux-hardening.html#restricting-sysfs) in Madaidan's guide._

Disabling access to `/sys` without a proper whitelist will lead to various applications breaking. Developing such a whitelist will unfortunately be extremely tedious for most users. Kicksecure, and by extension Whonix, has the experimental [proc-hidepid](https://github.com/Kicksecure/security-misc/blob/master/lib/systemd/system/proc-hidepid.service) and [hide-hardware-info](https://github.com/Kicksecure/security-misc/blob/master/lib/systemd/system/hide-hardware-info.service) services which do just this. From my testing, these work perfectly fine on minimal Kicksecure installations and both Qubes-Whonix-Workstation and Qubes-Whonix-Gateway.

#### linux-hardened

Some distributions like Arch Linux offer the [linux&#8209;hardened](https://github.com/anthraxx/linux-hardened) kernel package. It includes [hardening patches](https://wiki.archlinux.org/title/security#Kernel_hardening) and more security-conscious defaults.

linux&#8209;hardened has unprivileged user namespaces (`kernel.unprivileged_userns_clone`) disabled by default. [This may impact some software.](#runtime-kernel-parameters-sysctl)

#### Linux Kernel Runtime Guard (LKRG)

LKRG is a kernel module which self&#8209;describes as a runtime kernel integrity checker and exploit detector:

> As controversial as this concept is, LKRG attempts to _post_&#8209;detect and _hopefully_ promptly respond to unauthorized modifications to the running Linux kernel (integrity checking) or to credentials such as user IDs of the running processes (exploit detection). For process credentials, LKRG attempts to detect the exploit and take action before the kernel would grant access (such as open a file) based on the unauthorized credentials.
>
> LKRG defeats many pre-existing exploits of Linux kernel vulnerabilities, and will likely defeat many future exploits (including of yet unknown vulnerabilities) that do not specifically attempt to bypass LKRG. While LKRG is _bypassable by design_, such bypasses tend to require more complicated and/or less reliable exploits.

_(From [LKRG - Linux Kernel Runtime Guard](https://lkrg.org).)_

If you can get LKRG and maintain module updates, it provides a worthwhile improvement to security.

Debian-based distributions can get the LKRG DKMS package [from Kicksecure](https://www.kicksecure.com/wiki/Linux_Kernel_Runtime_Guard_LKRG), though Kicksecure does not install it by default. Packaging for Fedora is available through a [Copr repository](https://copr.fedorainfracloud.org/coprs/fepitre/lkrg/) maintained by Qubes OS developer fepitre. Arch users can obtain the LKRG DKMS package [from the AUR](https://aur.archlinux.org/packages/lkrg-dkms).

#### grsecurity

[Grsecurity](https://grsecurity.net/) offers a set of kernel patches that attempt to improve security of the Linux kernel. Payment is required, but grsecurity is worth using if you have a subscription.

### Hardened Memory Allocator

The [hardened memory allocator (hardened_malloc)](https://github.com/GrapheneOS/hardened_malloc) from GrapheneOS can be used on general Linux distributions, though [only for some programs](https://www.kicksecure.com/wiki/Hardened_Malloc).

Kicksecure installs it by default (though not enabled by default) and provides [in&#8209;depth usage instructions](https://www.kicksecure.com/wiki/Hardened_Malloc) relevant to all distributions. On Arch-based systems, hardened_malloc is [available through the AUR](https://wiki.archlinux.org/title/Security#Hardened_malloc). Divested Computing Group maintains a [Fedora build](https://github.com/divestedcg/rpm-hardened_malloc).

### Mountpoint Hardening

Consider adding the [mount options](https://man7.org/linux/man-pages/man8/mount.8.html#FILESYSTEM-INDEPENDENT_MOUNT_OPTIONS) `nodev`, `noexec`, and `nosuid` to mountpoints which do not need the respective capabilities. Typically, these can be applied to `/boot`, `/boot/efi`, and `/var`. These flags could also be applied to `/home` and `/root`, however `noexec` will prevent applications that require binary execution in those locations from working (including Flatpak and Snap).

It should be noted that `noexec` is not foolproof and actually [quite easy to bypass](https://chromium.googlesource.com/chromiumos/docs/+/HEAD/security/noexec_shell_scripts.md#what-about-interpreted-code).

If you use [Toolbox](https://docs.fedoraproject.org/en-US/fedora-silverblue/toolbox/), do not set any of these mount options on `/var/log/journal`. From my testing, the Toolbox container will fail to start if you have `nodev`, `nosuid`, or `noexec` on said directory. If you are on Arch&nbsp;Linux, you probably do not want to set `noexec` on `/var/tmp`, as some AUR packages will then fail to build.

### Disabling SUID

SUID allows a user to execute an application as the owner of that application, which in many cases is the `root` user. Vulnerable SUID executables could lead to privilege escalation vulnerabilities.

It is desirable to remove SUID from as many binaries as possible; however, this takes substantial effort and trial and error on the user's part, as some applications require SUID to function.

Kicksecure, and by extension Whonix, has an experimental [permission hardening service](https://github.com/Kicksecure/security-misc/blob/master/lib/systemd/system/permission-hardening.service) and [application whitelist](https://github.com/Kicksecure/security-misc/tree/master/etc/permission-hardening.d) to automate SUID removal from most binaries and libraries on the system. From my testing, these work perfectly fine on minimal Kicksecure installations and both Qubes-Whonix-Workstation and Qubes-Whonix-Gateway.

### DNSSEC

Most Linux distributions do not enable [DNSSEC](https://www.icann.org/resources/pages/dnssec-what-is-it-why-important-2019-03-05-en) by default. I recommend that you enable it to make sure that the responses to your DNS queries are authentic. You will need a DNS provider that supports DNSSEC. Ideally, you should use a VPN which provides this feature with its DNS servers so that you can also blend in with other people.

On systems with `systemd-resolved`, you can edit the `/etc/systemd/resolved.conf` file and add `DNSSEC=yes` to enable it. Do `systemctl restart systemd-resolved` after you are done editing to apply your configuration.

If you are a Whonix or Tails user, you can disregard setting up DNSSEC, as Tor DNS resolution does not support it. Alternatively, you can [use a non-Tor resolver](https://www.whonix.org/wiki/Alternative_DNS_Resolver), though it is not recommended that you do this for an extended amount of time.

### Time Synchronization

Most Linux distributions by default use the unencrypted and unauthenticated [Network Time Protocol (NTP)](https://en.wikipedia.org/wiki/Network_Time_Protocol) for time synchronization. There are two ways to easily solve this problem:

- [Configure Network Time Security (NTS) with chronyd](https://fedoramagazine.org/secure-ntp-with-nts/)
- Use Kicksecure's [sdwdate](https://github.com/Kicksecure/sdwdate) on Debian&#8209;based distributions.

If decide on using NTS with chronyd, consider using multiple, independent time providers and setting [`minsources`](https://chrony.tuxfamily.org/doc/devel/chrony.conf#minsources) greater than 1.

GrapheneOS uses a [quite nice chrony configuration](https://github.com/GrapheneOS/infrastructure/blob/main/chrony.conf) for their infrastructure. I recommend that you replicate their `chrony.conf` on your system.

### Pluggable Authentication Modules (PAM)

[PAM](https://wiki.archlinux.org/title/PAM)'s [settings can be hardened](https://madaidans-insecurities.github.io/guides/linux-hardening.html#pam) to improve authentication security (though keep in mind the bypassable nature of PAM as opposed to encryption).

On Red&nbsp;Hat distributions, you can use [authselect](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/configuring_authentication_and_authorization_in_rhel/configuring-user-authentication-using-authselect_configuring-authentication-and-authorization-in-rhel) to configure this, e.g.:

```
sudo authselect select <profile_id, default: sssd> with-faillock without-nullok with-pamaccess
```

On systems where `pam_faillock` is not available, consider using [`pam_tally2`](https://www.man7.org/linux/man-pages/man8/pam_tally2.8.html) instead.

If you have a YubiKey or other U2F/FIDO2 authenticator, you can use [pam-u2f](https://github.com/Yubico/pam-u2f) to implement two&#8209;factor authentication for login. **Make sure to use a hardcoded `origin` and `appid` as [indicated in the ArchWiki](https://wiki.archlinux.org/title/Universal_2nd_Factor#Authentication_for_Arch_Linux). Do not use the default identifier `pam://$HOSTNAME` which will break if your hostname changes.**

### Storage Media Handling

Some Linux distributions and desktop environments automatically mount arbitary filesystems upon storage media insertion. This is a security risk, as an adversary can attach a malicious storage device to your computer to exploit vulnerable filesystem drivers.

_This behavior is disabled by default on Whonix._

#### UDisks

GNOME users on systems with UDisks can mitigate this risk by running the following commands:

```bash
echo '[org/gnome/desktop/media-handling]
automount=false
automount-open=false' | sudo tee /etc/dconf/db/local.d/automount-disable

echo 'org/gnome/desktop/media-handling/automount
org/gnome/desktop/media-handling/automount-open' | sudo tee /etc/dconf/db/local.d/locks/automount-disable

sudo dconf update
```

This will disable automounting and prevent users from overriding that setting (without privileges).

_Cinnamon uses the same configuration/commands except with `cinnamon` substituted in place of `gnome`. Other desktop environments based on GNOME&nbsp;3 likely follow a similar pattern&nbsp;--- use `gsettings` to investigate._

#### autofs

On older systems where `autofs` is used, you should mask the `autofs` service to disable this behavior.

### USB Port Protection

To better protect your USB ports from attacks such as [BadUSB](https://www.srlabs.de/bites/usb-peripherals-turn) and the infamous [Hak5 USB Rubber Ducky](https://hak5.org/products/usb-rubber-ducky), I recommend [USBGuard](https://usbguard.github.io). Documentation is available on the [USBGuard website](https://usbguard.github.io) and [ArchWiki](https://wiki.archlinux.org/title/USBGuard).

If you are using [linux&#8209;hardened](#linux-hardened), you can alternatively use the `deny_new_usb` kernel parameter&nbsp;--- see ["Preventing USB Attacks with `linux&#8209;hardened`"](https://blog.lizzie.io/preventing-usb-attacks-with-linux-hardened.html).

## Secure Boot

[Secure Boot](https://en.wikipedia.org/wiki/Unified_Extensible_Firmware_Interface#Secure_Boot) can be used to secure the boot process by preventing the loading of unsigned UEFI drivers and bootloaders.

One of the problems with Secure Boot, particularly on Linux, is that [only the chainloader (shim), bootloader (GRUB), and kernel are verified in a typical setup](https://wiki.ubuntu.com/UEFI/SecureBoot#How_UEFI_Secure_Boot_works_on_Ubuntu). The [initramfs](https://wiki.ubuntu.com/Initramfs#Detailed_Description) is often left unverified and unencrypted, leaving the door open for an [evil maid attack](https://en.wikipedia.org/wiki/Evil_maid_attack).

The firmware on most devices is also preconfigured to trust Microsoft's keys for both Windows and third&#8209;parties, leading to a [large attacks surface](https://github.com/ventoy/Ventoy/issues/135).

### Enrolling your own keys

---

_**Please note that this procedure [will brick some non&#8209;compliant UEFI implementations](https://forums.lenovo.com/t5/Other-Linux-Discussions/Reports-of-custom-secure-boot-keys-bricking-recent-X-P-and-T-series-laptops/m-p/5105571).** You should research your specific computer/motherboard, looking for reported successes and failures alike, before attempting. Ideally, you should be prepared to reprogram the EEPROM to a known&#8209;good state if something goes catastrophically wrong. Integrated 'BIOS&nbsp;flashback' functionality may be an adequate recovery option._

---

To eliminate the need to trust the OEM's keys, I recommend using [sbctl](https://github.com/Foxboron/sbctl).

First, you need to boot into your firmware interface and enter Secure Boot setup mode. Then boot back into Linux and [follow the instructions](https://github.com/Foxboron/sbctl/blob/master/README.md#key-creation-and-enrollment) to generate and enroll your own keys.

On certain hardware, this will not work. Instead, you will need to export the public key to your EFI partition and manually import it through your firmware interface:

```
openssl x509 -in /usr/share/secureboot/keys/db/db.pem -outform DER -out /boot/efi/EFI/fedora/DB.cer
```

### Unified Kernel Image

On most desktop Linux systems, it is possible to create a [unified kernel image](https://wiki.archlinux.org/title/Unified_kernel_image) (UKI) that contains the kernel, initramfs, and microcode. This unified kernel image can then be signed with the keys created by sbctl.

For Fedora Workstation, you can follow [H&aring;vard Moen's guide](https://haavard.name/2022/06/22/full-uefi-secure-boot-on-fedora-using-signed-initrd-and-systemd-boot/) which covers sbctl installation, unified kernel image generation with [dracut](https://wiki.archlinux.org/title/Dracut), and automatic signing with systemd&#8209;boot.

On Arch, the process is very similar, though sbctl is already included in the official repositories and you will need to switch from [mkinitpcio](https://wiki.archlinux.org/title/Mkinitcpio) to dracut. Arch with linux&#8209;hardened works well with sbctl, but some level of tedious pacman hooks are required for appropriately timing the re&#8209;signing of all relevant files every time the kernel or bootloader is updated.

In my opinion, this is the most straightforward setup, with a lot of potential such as [systemd's future UKI plans including support for early&#8209;boot attestation](https://0pointer.de/blog/brave-new-trusted-boot-world.html). With that being said, it does not appear to work well with specialized setups such as Fedora Silverblue/Kinoite or Ubuntu with [ZSys](https://github.com/ubuntu/zsys). More testing is needed to see if they can be made to work.

### Encrypted /boot

#### openSUSE

openSUSE and its derivatives come with encrypted /boot out of the box (as part of the root partition). This setup does work, using encryption to sidestep the unverified initramfs problem.

However, there are some caveats:

- openSUSE uses LUKS1 instead of LUKS2 for encryption.
- GRUB supports PBKDF2 key derivation only, not Argon2 (the LUKS2 default).
- Some extra steps are necessary to [avoid typing the encryption password twice](https://en.opensuse.org/SDB:Encrypted_root_file_system#Avoiding_to_type_the_passphrase_twice_in_Leap_and_Tumbleweed).
- Though rather tedious, you could potentially improve security by:
  - [Enrolling your own Secure Boot keys](#enrolling-your-own-keys)
  - Reinstalling GRUB with `--no-shim-lock`
  - Signing GRUB and the kernel with your own keys
  - Removing shim and MOK from the boot chain
  - Setting up hooks to automate these tasks for every update

#### Other Distributions

On systems which use [grub&#8209;btrfs](https://github.com/Antynea/grub-btrfs) to mimic openSUSE (such as [my old Arch setup](https://github.com/tommytran732/Arch-Setup-Script)), there are a few things to keep in mind:

- It will be easier to use LUKS1 than LUKS2 with PBKDF2 for this setup.
  - I have run into issues where GRUB will detect a LUKS1 partition converted to LUKS2 with PBKDF2 but not a pre&#8209;existing LUKS2 partition.
- Include /boot in your root partition instead of as a seperate partition.
  - With a seperate /boot partition, an evil maid attack can theoretically replace it with a malicious /boot partition. Unlocking the drive through a fake decryption prompt on the malicious partition will subsequently compromise the rest of the system.
- [Enroll your own Secure Boot keys](#enrolling-your-own-keys)
- Install GRUB with the `--no-shim-lock` option. The full command I use on Arch is:
  ```
  grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB --modules="normal test efi_gop efi_uga search echo linux all_video gfxmenu gfxterm_background gfxterm_menu gfxterm loadenv configfile gzio part_gpt cryptodisk luks gcry_rijndael gcry_sha256 btrfs tpm" --disable-shim-lock
  ```
- Sign GRUB and the kernel with your own keys
- Remove shim and MOK from the boot chain (if applicable)
- Set up hooks to automate these tasks for every update ([pacman hooks for Arch](https://wiki.archlinux.org/title/Unified_Extensible_Firmware_Interface/Secure_Boot#Signing_the_kernel_with_a_pacman_hook))
- Disable the TPM from your firmware to prevent GRUB attempting [measured boot](https://www.gnu.org/software/grub/manual/grub/html_node/Measured-Boot.html), which [does not work with grub-btrfs](https://github.com/Antynea/grub-btrfs/issues/156).

### Notes on Secure Boot

After setting up Secure Boot, it is crucial that you password-protect your UEFI settings (sometimes called 'supervisor' or 'administrator' password)&nbsp;--- otherwise an adversary can simply disable Secure Boot.

These recommendations can make you a little more resistant to evil maid attacks, but they [do not constitute a proper verified boot process](https://madaidans-insecurities.github.io/guides/linux-hardening.html#verified-boot) as found on [Android](https://source.android.com/security/verifiedboot), [ChromeOS](https://support.google.com/chromebook/answer/3438631), or [Windows](https://docs.microsoft.com/en-us/windows/security/information-protection/secure-the-windows-10-boot-process).
