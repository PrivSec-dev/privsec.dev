---
title: "Choosing Your Desktop Linux Distribution"
date: 2022-07-17
tags: ['Operating Systems', 'Linux', 'Security']
author: Tommy
---

Not all Linux distributions are created equal. When choosing a Linux distribution, there are several things you need to keep in mind.

## Release Cycle

You should choose a distribution which stays close to the stable upstream software releases, typically rolling release distributions. This is because frozen release cycle distributions often don’t update package versions and fall behind on security updates.

For frozen distributions, package maintainers are expected to backport patches to fix vulnerabilities (Debian is one such [example](https://www.debian.org/security/faq#handling)) rather than bump the software to the “next version” released by the upstream developer. Some security fixes [do not](https://arxiv.org/abs/2105.14565) receive a [CVE](https://en.wikipedia.org/wiki/Common_Vulnerabilities_and_Exposures) (particularly less popular software) at all and therefore do not make it into the distribution with this patching model. As a result minor security fixes are sometimes held back until the next major release.

In fact, in certain cases, there have been vulnerabilities introduced by Debian because of their patching process. [Bug 1633467](https://bugzilla.mozilla.org/show_bug.cgi?id=1633467) and [DSA-1571](https://www.debian.org/security/2008/dsa-1571) are examples of this.

![Upstream / Distros Gap](upstream-distros-gap.png)

The practice of holding packages back and applying interim patches is generally not a good idea, as it diverges from the way the developer might have intended the software to work. [Richard Brown](https://rootco.de/aboutme/) has a presentation about this:

{{< youtube id="i8c0mg_mS7U">}}

## Traditional and Atomic updates

Traditionally, Linux distributions update by sequentially updating the desired packages. Traditional updates such as those used in Fedora, Arch Linux, and Debian based distributions can be less reliable if an error occurs while updating.

Distributions that use atomic updates apply updates in full or not at all. Typically, transactional update systems are also atomic.

A transactional update system creates a snapshot that is made before and after an update is applied. If an update fails at any time (perhaps due to a power failure), the update can be easily rolled back to a “last known good state."

[Adam Šamalík](https://twitter.com/adsamalik) has a presentation with `rpm-ostree` in action:

{{< youtube id="-hpV5l-gJnQ">}}

Even if you are worried about the stability of the system because of regularly updated packages (which you shouldn't be), it makes more sense to use a system which you can safely update and rollback instead of an outdated distribution partially made up of unreliable backport packages without an easy rollback mechanism in case something goes wrong like Debian.

## Arch-based Distributions

Arch Linux has very up-to-date packages with minimal downstream patching. That being said, Arch-based distributions are not recommended for those new to Linux, regardless of the distribution. Arch does not have an distribution update mechanism for the underlying software choices. As a result, you have to stay aware with current trends and adopt technologies as they supersede older practices on your own.

For a secure system, you are also expected to have sufficient Linux knowledge to properly set up security for your system such as adopting a [mandatory access control](https://en.wikipedia.org/wiki/Mandatory_access_control) system, setting up [kernel module](https://en.wikipedia.org/wiki/Loadable_kernel_module#Security) blacklists, hardening boot parameters, manipulating [sysctl](https://en.wikipedia.org/wiki/Sysctl) parameters, and knowing what components you need such as [Polkit](https://en.wikipedia.org/wiki/Polkit).

If you are experienced with Linux and wish to use an Arch-based distribution, you should use Arch Linux proper, not any of its derivatives. Here are some examples of why that is the case:

- **Manjaro**: This distribution holds packages back for 2 weeks to make sure that their own changes do not break, not to make sure that upstream is stable. When AUR packages are used, they are often built against the latest [libraries](https://en.wikipedia.org/wiki/Library_(computing)) from Arch’s repositories.
- **Garuda**: They use [Chaotic-AUR](https://aur.chaotic.cx/) which automatically and blindly compiles packages from the AUR. There is no verification process to make sure that the AUR packages don’t suffer from supply chain attacks. Beyond that, they promote incredibly bad advice in their official communication channels such as to [keep Secure Boot off](https://t.me/garudalinux/292499) because it is somehow bad and evil.

## Kicksecure

While you should not use outdated distributions like Debian, if you decide to use it, it would be a good idea to [convert](https://www.kicksecure.com/wiki/Debian) it into [Kicksecure](https://www.kicksecure.com/). Kicksecure, in oversimplified terms, is a set of scripts, configurations, and packages that substantially reduce the attack surface of Debian. It covers a lot of privacy and hardening recommendations by default.

## “Security-focused” Distributions

There is often some confusion about “security-focused” distributions and “pentesting” distributions. A quick search for “the most secure Linux distribution” will often give results like Kali Linux, Black Arch and Parrot OS. These distributions are offensive penetration testing distributions that bundle tools for testing other systems. They don’t include any “extra security” or defensive mitigations intended for regular use.

## Linux-libre Kernel and “Libre” Distributions

**Do not** use the Linux-libre kernel, since it [removes security mitigations](https://www.phoronix.com/scan.php?page=news_item&px=GNU-Linux-Libre-5.7-Released) and [suppresses kernel warnings](https://news.ycombinator.com/item?id=29674846) about vulnerable microcode for ideological reasons.

If you want to use one of these distributions for reasons other than ideology, you should make sure that they there is a way to easily obtain, install, and update a proper kernel and missing firmware. For example, if you are looking to use [GUIX](https://guix.gnu.org/en/download/), you should absolutely use something like the [Nonguix](https://gitlab.com/nonguix/nonguix) repository and get all of the fixes as mentioned above.

## Desktop Environments

You should use GNOME as your desktop environment. It supports [Wayland](https://en.wikipedia.org/wiki/Wayland_(display_server_protocol)), a display protocol developed with security [in mind](https://lwn.net/Articles/589147), and implements permission control for privileged Wayland protocols like screencopy. There are other desktop environments and window managers with Wayland support, but I am not aware of any permission control implemented by them.

Wayland's predecessor, [X11](https://en.wikipedia.org/wiki/X_Window_System), does not support GUI isolation, allowing all windows to [record screen, log and inject inputs in other windows](https://blog.invisiblethings.org/2011/04/23/linux-security-circus-on-gui-isolation.html), making any attempt at sandboxing futile. While there are options to run nested X11 sessions such as [Xpra](https://en.wikipedia.org/wiki/Xpra) or [Xephyr](https://en.wikipedia.org/wiki/Xephyr), they often come with negative performance consequences, are not convenient to set up, and are not preferable to Wayland. You should avoid desktop environments and window managers which only support X11.

## Recommended Distributions

Here is a quick, non-authoritative list of distributions we recommend over others:

### Fedora Workstation

![Fedora](fedora-screenshot.png)

[Fedora Workstation](https://getfedora.org/en/workstation/) is a great general-purpose Linux distribution, especially for those who are new to Linux. It is a semi-rolling release distribution. While some packages like GNOME are frozen until the next Fedora release, most packages (including the kernel) are updated frequently throughout the lifespan of the release. Each Fedora release is supported for one year, with a new version released every 6 months.

With that, Fedora generally adopts newer technologies before other distributions e.g., [Wayland](https://wayland.freedesktop.org/) and [PipeWire](https://pipewire.org/). These new technologies often come with improvements in security, privacy, and usability in general.

While lacking transactional or atomic updates, Fedora's package manager, `dnf`, has a great rollback and undo feature that is generally missing from other package managers. You can read more about it on [Red Hat's documentation](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/9/html/managing_software_with_the_dnf_tool/assembly_handling-package-management-history_managing-software-with-the-dnf-tool).

### Fedora Silverblue

[Fedora Silverblue](https://silverblue.fedoraproject.org/) is an immutable variant of Fedora with a strong focus on container workflows. It follows the same release schedule as Fedora Workstation, benefiting from the same fast updates and staying very close to upstream.

You can refer to the video by [Adam Šamalík](https://twitter.com/adsamalik) linked [above](#traditional-and-atomic-updates) on how these distributions work.

### openSUSE Tumbleweed and Aeon

Fedora Workstation and Silverblue's European counterpart. These are rolling release, fast updating distributions with [transactional updates](https://kubic.opensuse.org/blog/2018-04-04-transactionalupdates/) using [Btrfs](https://en.wikipedia.org/wiki/Btrfs) and [Snapper](https://en.opensuse.org/openSUSE:Snapper_Tutorial).

[Aeon](https://microos.opensuse.org/) has a much smaller base system than [Tumbleweed](https://get.opensuse.org/tumbleweed) and mounts the running BTRFS subvolumes as read-only (hence its name and why it is considered an immutable distribution). Currently, it is still in a [Release Candidate (RC) stage](https://en.opensuse.org/Portal:Aeon), so changes are to be expected. Nevertheless, it is an awesome project.

{{< youtube id="jcl_4Vh6qP4">}}

### Whonix

[Whonix](https://www.whonix.org/) is a distribution focused on anonymity based on [Kicksecure](https://www.whonix.org/wiki/Kicksecure). It is meant to run as two virtual machines: a “Workstation” and a Tor “Gateway.” All communications from the Workstation must go through the Tor gateway. This means that even if the Workstation is compromised by malware of some kind, the true IP address remains hidden. It is currently the best solution that I know of if your threat model requires anonymity.

Some of its features include Tor Stream Isolation, [keystroke anonymization](https://www.whonix.org/wiki/Keystroke_Deanonymization#Kloak), [boot clock randomization](https://www.kicksecure.com/wiki/Boot_Clock_Randomization), [encrypted swap](https://github.com/Whonix/swap-file-creator), hardened boot parameters, and hardened kernel settings. One downside of Whonix is that it still inherits outdated packages with lots of downstream patching from Debian.

Although Whonix is best used [in conjunction with Qubes](https://www.whonix.org/wiki/Qubes/Why_use_Qubes_over_other_Virtualizers), Qubes-Whonix has [various disadvantages](https://forums.whonix.org/t/qubes-whonix-security-disadvantages-help-wanted/8581) when compared to other hypervisors.
