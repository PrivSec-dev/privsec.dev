---
title: "Choosing Your Desktop Linux Distribution"
tags: ['operating system', 'security', 'linux']
author: Tommy
---

Not all Linux distributions are created equal. When choosing a Linux distribution, there are several things you need to keep in mind.

### Release cycle

You should choose a distribution which stays close to the stable upstream software releases, typically rolling release distributions. This is because frozen release cycle distributions often don’t update package versions and fall behind on security updates.

For frozen distributions, package maintainers are expected to backport patches to fix vulnerabilities (Debian is one such [example](https://www.debian.org/security/faq#handling)) rather than bump the software to the “next version” released by the upstream developer. Some security fixes [do not](https://arxiv.org/abs/2105.14565) receive a [CVE](https://en.wikipedia.org/wiki/Common_Vulnerabilities_and_Exposures) (particularly less popular software) at all and therefore do not make it into the distribution with this patching model. As a result minor security fixes are sometimes held back until the next major release.

Holding packages back and applying interim patches is generally not a good idea, as it diverges from the way the developer might have intended the software to work. [Richard Brown](https://rootco.de/aboutme/) has a presentation about this:

{{< youtube id="i8c0mg_mS7U">}}

### Traditional and Atomic updates

Traditionally, Linux distributions update by sequentially updating the desired packages. Traditional updates such as those used in Fedora, Arch Linux, and Debian based distributions can be less reliable if an error occurs while updating.

Atomic updating distributions apply updates in full or not at all. Typically, transactional update systems are also atomic.

A transactional update system creates a snapshot that is made before and after an update is applied. If an update fails at any time (perhaps due to a power failure), the update can be easily rolled back to a “last known good state."

[Adam Šamalík](https://twitter.com/adsamalik) has a presentation with `rpm-ostree` in action:

{{< youtube id="-hpV5l-gJnQ">}}

Even if you are worried about the stability of the system because of regularly updated packages (which you shouldn't), it makes more sense to use a system which you can safely update and rollback instead of an outdated distribution partially made up of unreliable backport packages without an easy to actually roll back in case something goes wrong like Debian.

### Arch-based distributions

Acrh Linux has very up to date packages with minimal downstream patching. That being said, Arch based distributions are not recommended for those new to Linux, regardless of the distribution. Arch does not have an distribution update mechanism for the underlying software choices. As a result you have to stay aware with current trends and adopt technologies as they supersede older practices on your own.

For a secure system, you are also expected to have sufficient Linux knowledge to properly set up security for their system such as adopting a [mandatory access control](https://en.wikipedia.org/wiki/Mandatory_access_control) system, setting up [kernel module](https://en.wikipedia.org/wiki/Loadable_kernel_module#Security) blacklists, hardening boot parameters, manipulating [sysctl](https://en.wikipedia.org/wiki/Sysctl) parameters, and knowing what components they need such as [Polkit](https://en.wikipedia.org/wiki/Polkit).

If you are experienced with Linux and wish to use an Arch-based distribution, you should use Arch Linux proper, not any of its derivatives. Here are some examples of why that is the case:

- **Manjaro**: This distribution holds packages back for 2 weeks to make sure that their own changes do not break, not to make sure that upstream is stable. When AUR packages are used, they are often built against the latest [libraries](https://en.wikipedia.org/wiki/Library_(computing)) from Arch’s repositories.
- **Garuda**: They use [Chaotic-AUR](https://aur.chaotic.cx/) which automatically and blindly compiles packages from the AUR. There is no verification process to make sure that the AUR packages don’t suffer from supply chain attacks.

### Kicksecure

While you should not use an outdated distributions like Debian, if you decide to use it, it would be a good idea to [convert](https://www.kicksecure.com/wiki/Debian) it into [Kicksecure](https://www.kicksecure.com/). Kicksecure, in oversimplified terms, is a set of scripts, configurations, and packages that substantially reduce the attack surface of Debian. It covers a lot of privacy and hardening recommendations by default.

### “Security-focused” distributions

There is often some confusion about “security-focused” distributions and “pentesting” distributions. A quick search for “the most secure Linux distribution” will often give results like Kali Linux, Black Arch and Parrot OS. These distributions are offensive penetration testing distributions that bundle tools for testing other systems. They don’t include any “extra security” or defensive mitigations intended for regular use.

### Linux-libre kernel and “Libre” distributions

**Do not** the Linux-libre kernel, since it [removes security mitigations](https://www.phoronix.com/scan.php?page=news_item&px=GNU-Linux-Libre-5.7-Released) and [suppresses kernel warnings](https://news.ycombinator.com/item?id=29674846) about vulnerable microcode for ideological reasons.

If you want to use one of these distributions for reasons other than ideology, you should make sure that they there is a way to easily obtain, install and update a proper kernel and missing firmware. For example, if you are looking to use [GUIX](https://guix.gnu.org/en/download/), you should absolutely use something like the [Nonguix](https://gitlab.com/nonguix/nonguix) repository and get all of the fixes as mentioned above.

### Wayland

You should a desktop environment that supports the [Wayland](https://en.wikipedia.org/wiki/Wayland_(display_server_protocol)) display protocol as it developed with security [in mind](https://lwn.net/Articles/589147/). Its predecessor, [X11](https://en.wikipedia.org/wiki/X_Window_System), does not support GUI isolation, allowing all windows to [record screen, log and inject inputs in other windows](https://blog.invisiblethings.org/2011/04/23/linux-security-circus-on-gui-isolation.html), making any attempt at sandboxing futile. While there are options to do nested X11 such as [Xpra](https://en.wikipedia.org/wiki/Xpra) or [Xephyr](https://en.wikipedia.org/wiki/Xephyr), they often come with negative performance consequences and are not convenient to set up and are not preferable over Wayland.

Fortunately, common environments such as [GNOME](https://www.gnome.org), [KDE](https://kde.org), and the window manager [Sway](https://swaywm.org) have support for Wayland. Some distributions like Fedora and Tumbleweed use it by default, and some others may do so in the future as X11 is in [hard maintenance mode](https://www.phoronix.com/scan.php?page=news_item&px=X.Org-Maintenance-Mode-Quickly). If you’re using one of those environments it is as easy as selecting the “Wayland” session at the desktop display manager ([GDM](https://en.wikipedia.org/wiki/GNOME_Display_Manager), [SDDM](https://en.wikipedia.org/wiki/Simple_Desktop_Display_Manager)).

Try **not** to use desktop environments or window managers that do not have Wayland support such as Cinnamon (default on Linux Mint), Pantheon (default on Elementary OS), MATE, Xfce, and i3.