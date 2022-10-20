---
title: "Using Mullvad VPN on Qubes OS"
date: 2022-09-03
tags: ['Applications', 'Qubes OS', 'Privacy']
author: Tommy
---

![Mullvad VPN](/images/mullvad-vpn-1.png)

Mullvad is a fairly popular and generally trustworthy VPN provider. In this post, I will walk you through how to use the official Mullvad client in a ProxyVM on Qubes OS. This method is a lot more convenient than the [official guide](https://mullvad.net/en/help/qubes-os-4-and-mullvad-vpn/) from Mullvad (which recommends that you manually load in OpenVPN or Wireguard profiles) and will let you seamlessly switch between different location and network setups just as you would on a normal Linux installation.

## Preparing your TemplateVM

I recommend that you make a new TemplateVM based on latest Fedora template and remove all unnecessary packages that you might not use. This way, you can minimize the attack surface while not having to deal with missing dependencies like on a minimal template. With that being said, if you do manage to get the minimal template to fully work with Mullvad, feel free to [open a discussion on GitHub](https://github.com/orgs/PrivSec-dev/discussions) or [contact me directly](https://tommytran.io/contact) and I will update the post accordingly.

This is what I run on my template to trim it down:
```bash
sudo dnf remove firefox thunderbird totem gnome-remote-desktop gnome-calendar gnome-disk-utility gnome-calculator gnome-connections gnome-weather gnome-contacts gnome-clocks gnome-maps gnome-screenshot gnome-logs gnome-characters gnome-font-viewer gnome-color-manager simple-scan keepassxc cheese baobab yelp evince* httpd mozilla* cups rygel -y
sudo dnf autoremove -y
```

Next, you need to create the bind directories for Mullvad's configurations:

```bash
sudo mkdir -p /etc/qubes-bind-dirs.d
sudo tee /etc/qubes-bind-dirs.d/50_user.conf << EOF > /dev/null
binds+=( '/etc/mullvad-vpn' )
EOF
```

## Installing the Mullvad App

Inside of the TemplateVM you have just created, do the following:

```bash
sudo dnf install https://mullvad.net/media/app/MullvadVPN-2022.5_x86_64.rpm
sudo systemctl enable mullvad-daemon
```

Replace `https://mullvad.net/media/app/MullvadVPN-2022.5_x86_64.rpm` with whatever the latest URL for the Mullvad App is. I will try to update this post to give you the accurate command, but you should just take them from [their website](https://mullvad.net/en/download/linux/).

![Mullvad VPN URL](/images/mullvad-vpn-2.png)

Shutdown the TemplateVM:

```bash
sudo shutdown now
```

## Creating the ProxyVM

Create an AppVM based on the TemplateVM you have just created. Set `sys-firewall` (or whatever FirewallVM you have connected to your `sys-net`) as the net qube. If you do not have such FirewallVM, use `sys-net` as the net qube. Next, go to the advanced tab and tick the `provides network access to other qubes` box.

![Provides Network](/images/provides-network.png)

Edit `/rw/config/rc.local` to workaround [issue 3803](https://github.com/mullvad/mullvadvpn-app/issues/3803):

```bash
echo "sleep 10 # Waiting a bit so that Mullvad can establish a connection
/usr/lib/qubes/qubes-setup-dnat-to-ns" | sudo tee -a /rw/config/rc.local
```

Restart the ProxyVM. You can now use this ProxyVM as the net qube for other qubes!

## Notes

With this current setup, the ProxyVM you have just created will be responsible for handling Firewall rules for the qubes behind it. This is not ideal, as this is still a fairly large VM, and there is a risk that Mullvad or some other apps may interfere with its firewall handling.

Instead, I highly recommend that you [create a minimal Mirage FirewallVM](/posts/qubes/firewalling-with-mirageos-on-qubes-os/) and use it as a firewall **behind** the Mullvad ProxyVM. Other AppVMs then should use the Mirage Firewall as the net qube instead. This way, you can make sure that firewall rules are properly enforced.

![MirageOS](/images/mirageos.png)