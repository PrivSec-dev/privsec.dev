---
title: "Building GrapheneOS with Windows Subsystem for Linux"
date: 2022-10-13T19:37:58-07:00
tags: ['Operating Systems', 'Android']
author: "June"
canonicalURL: "https://akc3n.page/posts/grapheneos-wsl/"
ShowCanonicalLink: true
---

# Introduction

This guide only mentions Arch Linux as it's the only good alternative to building AOSP on besides Ubuntu. It utilises Docker Desktop for the Arch Linux image as it's very close to stock Arch Linux instead of using tools like ArchWSL which are not very close to stock Arch Linux. Docker Desktop uses the official Arch Linux Docker image.

<hr>

## AOSP and GrapheneOS dependencies:

### Specs:

- At least 400GB of fast SSD (preferably NVMe) storage
- At least 20GB of DDR4 memory.
- At least a quad core processor

### Arch deps:

- base-devel
- repo
- python3
- python3-protobuf (python-protobuf on Arch)
- gpg (gnupg on Arch)
- libgcc (gcc-libs on Arch)
- binutils
- diffutils
- freetype2
- ttf-liberation or any other TrueType/OpenType font
- ncurses5 ([ncurses5-compat-libs](https://aur.archlinux.org/packages/ncurses5-compat-libs) on AUR)
- ncurses
- openssl
- openssh
- rsync
- unzip
- zip
- e2fsprogs
- OpenJDK (jdk8-openjdk or jdk11-openjdk or jdk-openjdk for 17 on Arch)
- jq
- yarn
- lib32-gcc-libs
- lib32-glibc
- signify

### Arch deps for WSLg and AOSP emulator:

- vulkan-swrast
- vulkan-icd-loader
- xorg-fonts-encoding
- xorg-server
- xorg-server-common
- sdl2
- sdl
- libpulse

<hr>

## WSL2 / WSLg dependencies:

- Windows 11 Professional (Enterprise preferred, Home will not work)
- Windows 11 supported hardware
- Intel VT-x or similar
- Intel VT-d or similar
- Up to date BIOS/UEFI
- Windows 11 installed with UEFI
- TPM 1.2 or 2.0

<hr>

## Initial setup:

1. Open "Turn Windows features on or off"

2. Enable:

- Hyper-V
- Virtual Machine Platform
- Windows Hypervisor Platform
- Windows Subsystem for Linux
- then reboot

3. Install the Linux kernel update package: https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi

4. Open PowerShell and update WSL: `wsl --update`

5. Set WSL2 as the default version: `wsl --set-default-version 2`

<hr>

## Docker Desktop setup:

1. Install Docker Desktop: https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe

2. During install, install the WSL components as it says.

3. Open Docker and if asked to install wsl_update_x64.msi again, install it again.

4. Make sure in Docker settings it's using WSL backends.

<hr>

## Arch Linux Docker install:

1. Using PowerShell, pull the official Arch Linux image: `docker pull archlinux`

2. Run the image with the name `archlinux-wsl` to setup the base image:  

```powershell
docker run -it --name archlinux-wsl archlinux
```

3. Perform the following setup commands:

```bash
pacman -Syu
pacman -S sudo vim

EDITOR=vim visudo
# uncomment wheel

useradd -G wheel,users -m <username>
passwd <username>
# make a password

pwconv
grpconv
# no output is expected

# perform any extra setup yourself if you want as this is the base image

exit
```

4. Export the docker container's state to a tar file:   

```powershell
docker export --output archlinux-image-files.tar archlinux-wsl
```

5. Import the container files to a drive you have more than 500GB on (can be your C drive if you have that space): 

```powershell
wsl --import archlinux <directory to store the files> .\archlinux-image-files.tar
```

6. Verify Arch Linux is using WSL version 2: `wsl -l -v`

7. Open Arch Linux: `wsl -d archlinux`

<hr>

## Arch Linux post-install

### Root size:

The default Virtual Hard Disk (.vhdx) created is only 256GB as shown by `df -h`. This is not enough for AOSP. We need to resize it (at this point I assume the drive you have the .vhdx file on is more than 500GB).

Shut down WSL: `wsl --shutdown`

1. Locate the .vhdx file from step 5 above and get the absolute path.

2. Open `diskpart` (WINKEY + R then `diskpart`)

3. Enter: `select vdisk file="<PathToVHDX>"`

4. Expand the .vhdx file to at least 500GB: `expand vdisk maximum=500000` (500GB)

5. Verify it has expanded: `detail vdisk`

Now we must expand it in Arch Linux.

1. Open Arch Linux

2. Find the root disk (`df -h`)

3. Resize it: `sudo resize2fs /dev/sdX` (X being your root)

4. Verify it has resized under the Size column: `df -h`

### wsl.conf:

We need to create a wsl.conf due to: 

- poor disk and network performance of NTFS <-> ext4 directories
- conflicting binaries with Windows PATH being appended to the Linux PATH
- poor disk and network performance of Windows binaries in WSL
- poor network performance of the internal DNS server
- and AOSP, Chromium, and Linux require strict case-sensitive filesystems.

1. Open Arch Linux

2. Create and edit the VM's wsl.conf:  

```bash
sudo vim /etc/wsl.conf
```

3. Enter:

```Ini
[automount]

options = "case=dir"

[interop]

appendWindowsPath = false

[user]

default = <username>

[network]

generateResolvConf = false
```

Save.

4. Edit resolv.conf `sudo vim /etc/resolv.conf`

5. Remove everything and enter `nameserver <DNS server of your choice>`

6. Because we don't have proper systemd (for resolved and resolvconf), the file gets cleared and never saves. Lock it from all modifications to save it permanently:  

```bash
sudo chattr +i /etc/resolv.conf
```

7. Exit and shutdown WSL: `wsl --shutdown`

8. Create a system `.wslconfig` in your Windows user directory: 

```powershell
C:\Users\<main user>\.wslconfig
```

9. Enter:

```Ini
[wsl2]

swap = 70G
localhostForwarding = true
nestedVirtualization = true
guiApplications = true
```

AOSP requires a lot of memory so create a swapfile just in case. Production builds of GrapheneOS are extremely memory intensive. Can be any size you want. Then save.

10. Start up WSL and make sure you have a `$DISPLAY` variable: `echo $DISPLAY`

### AOSP emulator pre-configuration and nested virtualisation:

Emulator can make use of nested virtualisation (KVM). Permissions are weird on WSL though and due to lack of proper systemd, require some workarounds.

1. Open Arch Linux

2. Add yourself to the `kvm` group.

3. In your `.bashrc`, append `ulimit -n 1048575` as the soft limit is hardcoded `1024` and can't be changed even though emulator requires more than 1024 file descriptors or it will crash and freak out. It also doesn't seem to know how to ask for the hard limit of file descriptors. `/etc/security/limits.conf` doesn't seem to work on WSL and systemd ignores `DefaultNOFILE` on WSL.

***DO NOT*** raise 1048575 ANY HIGHER. There is a bug with pam_limits where if the file descriptors limit is greater than or equal to `sysctl fs.nr_open`, it will break sudo. The default seems to be 1048576, so set it one below that. `/etc/sysctl.conf` is ignored on WSL so no reason to attempt to modify it.

If you do happen to lock yourself out from this, open a new window and run `wsl -d archlinux --user root` and make the proper change. Don't ask how I know.

It's possible KVM may not work still because it can't access `/dev/kvm` despite being added to the `kvm` group, also due to weird WSL things. I just do `sudo chmod 777 /dev/kvm`. It doesn't matter if it's 777 because all files are created with a 000 umask on NTFS drives anyways since metadata isn't included by default and is still experimental. WSL is not for security.

If you want to automatically set `/dev/kvm` to 777, you can set it as a WSL2 startup command in `/etc/wsl.conf`:

```Ini
[boot]
command = chmod 777 /dev/kvm
```

From this point on, you will ***ALWAYS*** need to do stuff in the actual Linux ext4 root. `/home` is apart of `/` so you should just do your stuff in `~/`. DO NOT do stuff in NTFS drives (`/mnt/c` for example) as I mentioned above it's extremely slow. This is the closest to a real Linux setup.

You can now follow https://grapheneos.org/build like you would on normal Linux exactly as-is. Building emulator yields near-bare-metal times (2 hours 46 minutes on WSL Arch Linux, 2 hours 6 minutes on bare-metal Arch Linux).

### AOSP emulator segmentation fault and poor performance

You (might) need to disable the GPU (yeah, weird) to get high performance 60 FPS in the Android Virtual Device's config.

1. Assuming you built emulator successfully at this point navigate to the output, example:  

```bash
/home/herbcookie/grapheneos-12.1/out/target/product/emulator_x86_64
```

2. Edit `config.ini`

3. Set `hw.gpu.enabled` from `yes` to `no`

Then start emulator again. You should have high performance, extremely fluid, 60 FPS. It might also fix a possible segfault.

It's possible this isn't necessary and I suggest just trying to run emulator as-is before deciding if you need it. On my old machine (i7-8700k + NVIDIA GTX 1070) this was mandatory, but on my new machine (Ryzen 9 3900XT, NVIDIA RTX 3080) this was not needed.

---

## Acknowledgment

Thanks and credit to author of this article:

```prolog
commit a8d58587976f9c479f30cb4a69b032af412de70f
Author: June <june@******.**>
Date: Sunday, May 1, 2022
```
### Note

Author of this paper is my friend, June. I do not take any credit for this. I am simply hosting it as June is no longer on GitHub. Several people have asked me for this guide since the original repo does not exist anymore.