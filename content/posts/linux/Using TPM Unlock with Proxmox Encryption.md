# Using TPM unlock with Proxmox Encryption

Currently, the Proxmox installer does not support setting up encryption with ZFS. Previously, I have written on how to setup Proxmox with native ZFS encryption and remote unlock with Dropbear. Today, I will guide you through the process of setting it up with TPM unlock and Secure Boot.

By the end of this guide, you will have:
- Secure Boot setup with your custom key and Unified Kernel Image
- Autheticated Drive Encryption (AEAD)
- Automatic unlock and *some* tamper detection with the TPM

Limitations:
- No rollback protection. This could theoratically be solved with [PCR Oracle](https://github.com/okirch/pcr-oracle), though I have not looked into it in depth yet. I will update this guide in the future when I have figured it out :)
- The TPM is fully trusted. An adversary will be able to decrypt your drive if they can get the internal state of the TPM, such as with the [FaulTPM](https://arxiv.org/pdf/2304.14717.pdf) vulnerability.

## The Design

There is currently no nice solution for unlocking native ZFS encryption with a TPM. While theoratically possible, the tooling for it does not exist as of this writing, to my knowledge. ZFS on LUKS will work with TPM unlock (via `systemd-cryptenroll`), but is suboptimal as ZFS will not get direct access to the disk.

To get the best of both worlds, we will set up a ZFS encryption partition with LUKS for Proxmox itself. After the system has booted, we will unlock and mount a second ZFS partition encrypted with native ZFS encryption using a key stored inside the ZFS partiton encrypted with LUKS. This way, we can get TPM unlock and use it to provide some basic tamper detection, while still allowing ZFS direct access to the disk for where the virtual machines are stored and achieve optimal performance.

UEFI Firmware -> Signed UKI --(TPM Unlock)--> PVE partition (ZFS on LUKS) -> VM storage (Native ZFS Encryption)