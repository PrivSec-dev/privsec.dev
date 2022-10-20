---
title: "Using IVPN on Qubes OS"
date: 2022-10-20
tags: ['Applications', 'Qubes OS', 'Privacy']
author: Tommy
---

![IVPN](/images/ivpn-1.png)

IVPN is a fairly popular and generally trustworthy VPN provider and is one of my favorites. In this post, I will walk you through how to use the official IVPN client in a ProxyVM on Qubes OS. 

## Preparing your TemplateVM

I recommend that you make a new TemplateVM based on latest Fedora template and remove all unnecessary packages that you might not use. This way, you can minimize the attack surface while not having to deal with missing dependencies like on a minimal template. With that being said, if you do manage to get the minimal template to fully work with IVPN, feel free to [open a discussion on GitHub](https://github.com/orgs/PrivSec-dev/discussions) or [contact me directly](https://tommytran.io/contact) and I will update the post accordingly.

This is what I run on my template to trim it down:
```bash
sudo dnf remove firefox thunderbird totem gnome-remote-desktop gnome-calendar gnome-disk-utility gnome-calculator gnome-connections gnome-weather gnome-contacts gnome-clocks gnome-maps gnome-screenshot gnome-logs gnome-characters gnome-font-viewer gnome-color-manager simple-scan keepassxc cheese baobab yelp evince* httpd mozilla* cups rygel -y
sudo dnf autoremove -y
```

Next, you need to create the bind directories for IVPN's configurations:

```bash
sudo mkdir -p /etc/qubes-bind-dirs.d
sudo tee /etc/qubes-bind-dirs.d/50_user.conf << EOF > /dev/null
binds+=( '/opt/ivpn/mutable' )
EOF
```

## Installing the IVPN App

Inside of the TemplateVM you have just created, do the following:

```bash
sudo dnf config-manager --add-repo https://repo.ivpn.net/stable/fedora/generic/ivpn.repo
sudo dnf install ivpn-ui
sudo shutdown now
```

## Creating the ProxyVM

Create an AppVM based on the TemplateVM you have just created. Set `sys-firewall` (or whatever FirewallVM you have connected to your `sys-net`) as the net qube. If you do not have such FirewallVM, use `sys-net` as the net qube. Next, go to the advanced tab and tick the `provides network access to other qubes` box.

![Provides Network](/images/provides-network.png)

To work around [issue 191](https://github.com/ivpn/desktop-app/issues/191), you need to select **Force management of DNS using resolv.conf** in the app's settings.

![IVPN DNS Settings](/images/ivpn-dns-settings.png)

Edit `/rw/config/rc.local` to workaround [issue 216](https://github.com/ivpn/desktop-app/issues/216):

```bash
echo "sleep 10 # Waiting a bit so that IVPN can establish a connection
/usr/lib/qubes/qubes-setup-dnat-to-ns" | sudo tee -a /rw/config/rc.local
```

Restart the ProxyVM. You can now use this ProxyVM as the net qube for other qubes!

## Notes

With this current setup, the ProxyVM you have just created will be responsible for handling Firewall rules for the qubes behind it. This is not ideal, as this is still a fairly large VM, and there is a risk that IVPN or some other apps may interfere with its firewall handling.

Instead, I highly recommend that you [create a minimal Mirage FirewallVM](/content/qubes/firewalling-with-mirageos-on-qubes-os/) and use it as a firewall **behind** the IVPN ProxyVM. Other AppVMs then should use the Mirage Firewall as the net qube instead. This way, you can make sure that firewall rules are properly enforced.

![MirageOS](/images/mirageos.png)

A collection of posts about Qubes OS and related applications	A collection of posts about Qubes OS and related applications. This section contains MirageOS setup, Split SSH configuration, and guides on setting up proxies on Qubes OS.