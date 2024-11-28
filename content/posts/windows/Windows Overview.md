---
title: "Windows Security Overview"
date: 2024-10-26
tags: ['Windows', 'Security']
author: oppressor1761
---

## Hardware and Firmware Security

### Hardware Security

[Secured-Core PCs](https://www.microsoft.com/en-us/windows/business/windows-11-secured-core-computers) ensure the hardware has some essential security [features](https://learn.microsoft.com/en-us/windows-hardware/design/device-experiences/oem-highly-secure-11#what-makes-a-secured-core-pc) including Secure Boot, Trusted Platform Module 2.0 (TPM), Direct Memory Access (DMA) Protection, Enhanced Sign-in Security (ESS), Virtualization-based Security (VBS) and System Guard Secure Launch with System Management Mode (SMM) isolation/Firmware Attack Surface Reduction (FASR). Microsoft Pluton and Total Memory Encryption are also good to have.

[Secure Boot](https://learn.microsoft.com/en-us/windows/security/operating-system-security/system-security/trusted-boot) makes a safe and trusted path from the firmware to the Windows bootloader by making the firmware to examine the bootloader's digital signature to verify that it hasn't been modified. It may also allow drivers and applications from 3rd parties to run on the PC, which increases the attack surface of systems. You can disable Microsoft 3rd Party UEFI CAs (Microsoft Corporation UEFI CA 2011, Microsoft UEFI CA 2023) and Microsoft Option ROM CA (Microsoft Option ROM UEFI CA 2023) if you are not using third party operating system. Trusted Boot, which is not a hardware feature, picks up the process that started with Secure Boot. The Windows bootloader verifies the digital signature of the Windows kernel before loading it. The Windows kernel, in turn, verifies every other component of the Windows startup process, including boot drivers, startup files, and your anti-malware product's early-launch anti-malware (ELAM) driver. These mechanisms does not protect the firmware itself.

[Trusted Platform Module 2.0 (TPM)](https://learn.microsoft.com/en-us/windows/security/hardware-security/tpm/trusted-platform-module-overview) is a secure crypto-processor that is designed to carry out cryptographic operations. Some features rely on TPM such as BitLocker, Windows Hello, and System Guard Secure Launch.

[Direct Memory Access (DMA) Protection](https://learn.microsoft.com/en-us/windows/security/hardware-security/kernel-dma-protection-for-thunderbolt) protects against external peripherals from gaining unauthorized access to memory.

[Enhanced Sign-in Security (ESS)](https://learn.microsoft.com/en-us/windows-hardware/design/device-experiences/windows-hello-enhanced-sign-in-security) provides an additional level of security to biometric data with the use of specialized hardware and software components.

Memory Integrity is a [Virtualization-based Security (VBS)](https://learn.microsoft.com/en-us/windows/security/hardware-security/enable-virtualization-based-protection-of-code-integrity) feature that uses the Windows hypervisor to create an isolated virtual environment that becomes the root of trust of the OS that assumes the kernel can be compromised. VBS requires [virtualization](https://support.microsoft.com/en-us/windows/enable-virtualization-on-windows-c5578302-6e43-4b4b-a449-8ced115f58e1) to be enabled.

[System Guard Secure Launch with SMM isolation](https://learn.microsoft.com/en-us/windows/security/hardware-security/how-hardware-based-root-of-trust-helps-protect-windows) leverage Dynamic Root of Trust for Measurement (DRTM) to protect the firmware. It depends on CPU to function. Its equivalent without CPU dependency is [FASR](https://learn.microsoft.com/en-us/windows-hardware/drivers/bringup/firmware-attack-surface-reduction) which leverage Static Root of Trust for Measurement (SRTM) and Standalone Management Mode (MM) with MM Supervisor.

[Microsoft Pluton](https://learn.microsoft.com/en-us/windows/security/hardware-security/pluton/microsoft-pluton-security-processor) is a secure crypto-processor built into the CPU to provide the functionality of the TPM and deliver other security functionality beyond what is possible with the TPM 2.0 specification, and allows for other Pluton firmware and OS features to be delivered over time via Windows Update.

Total Memory Encryption encrypts all data passing to and from a PC's CPU. Thus, the data on memory is encrypted.

### Firmware Security

Hardware security features often requires related settings in firmware. You can also set a firmware password to protect firmware settings from being changed unexpectedly.

To reduce attack surface and prevent firmware to boot from external devices, you can configure Boot Sequence to exclusively boot from your hard drive while disabling all other items.

You should also choose a PC that has a long lifecycle of driver and firmware updates. You may find the lifecycle policy in Product Security and Telecommunication Infrastructure (PSTI) compliance report from OEM.

## Operating System Security

### Version and Edition

You should use the [latest version](https://learn.microsoft.com/en-us/windows/release-health/windows11-release-information) of Windows Enterprise edition, as it provides the most complete security and privacy features.

### Updates

Installing updates is crucial. Windows Update delivers updates to Windows automatically. You can also manually check for updates in Start → Settings → Windows Update → Check for Updates. You should [update](https://learn.microsoft.com/en-us/windows-hardware/manufacture/desktop/add-update-to-winre?view=windows-11#apply-the-update-to-a-running-pc) Windows Recovery Environment (Windows RE) by yourself. If you have other Windows installation media, such as Windows Preinstallation Environment (Windows PE) or Windows RE that is not recognized by the current Windows operating system, you should [update](https://learn.microsoft.com/en-us/windows/deployment/update/media-dynamic-update) them manually.

You can track update packages for Windows operating system, Windows RE and Windows PE using [this](https://support.microsoft.com/en-us/feed/rss/4ec863cc-2ecd-e187-6cb3-b50c6545db92) RSS feed. *Compatibility update for installing and recovering Windows* denotes updates for Windows RE. *Setup Dynamic Update for Windows* denotes updates for Windows PE. You can download update packages from the [Microsoft Update Catalog](https://www.catalog.update.microsoft.com/Home.aspx).

You should also enable automatic updates in Microsoft Store in Start → Microsoft Store → Personal Profile → Settings → App Updates.

**Feature updates** are released annually to add new features and functionality to Windows.

**Quality updates**, which encompass security and non-security fixes such as security updates, critical updates, servicing stack updates, and driver updates, are typically released on the second Tuesday of each month but can be released at any time.

### Security Baselines

A [security baseline](https://learn.microsoft.com/en-us/windows/security/operating-system-security/device-management/windows-security-configuration-framework/windows-security-baselines) is a group of Microsoft-recommended configuration settings that explains their security implication. It uses [Group Policy](https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/manage/group-policy/group-policy-overview), which is a type of configuration method that takes precedence over user-facing UI. You can leverage the [Local Group Policy Object (LGPO)](https://learn.microsoft.com/en-us/windows/security/operating-system-security/device-management/windows-security-configuration-framework/security-compliance-toolkit-10#what-is-the-local-group-policy-object-lgpo-tool) tool to deploy the security baseline. Apart from Windows, Microsoft Edge and Microsoft Office also have corresponding security baselines.

You can track security baseline updates using [this](https://techcommunity.microsoft.com/t5/s/gxcuf89792/rss/board?board.id=Microsoft-Security-Baselines) RSS feed. It's essential to keep security baseline updated after you update the operating system or applications.

### Application Security

Most applications on Windows are not sandboxed. In Microsoft Store, only the apps without the permission “This app can access all your files, peripheral devices, apps, programs, and registry” are sandboxed. If you sideload apps, only those with the file extensions `.msix`, `.msixbundle`, `.appx`, `.appxbundle`, and without the permission "This app can access all your files, peripheral devices, apps, programs, and registry" are sandboxed. If you are a developer or are skilled, you may deploy sandboxing to unsandboxed applications using [Win32 app isolation](https://learn.microsoft.com/en-us/windows/win32/secauthz/app-isolation-overview).

[Smart App Control](https://support.microsoft.com/en-us/topic/what-is-smart-app-control-285ea03d-fa88-4d56-882e-6698afdb7003) can check the security of apps while they are running.

You can also use [Windows Sandbox](https://learn.microsoft.com/en-us/windows/security/application-security/application-isolation/windows-sandbox/windows-sandbox-overview) to run untrusted apps. It provides a lightweight virtual machine to safely run applications in isolation. You can transfer files and apps into Windows Sandbox by copying them.

### Device Encryption

[BitLocker](https://support.microsoft.com/en-us/windows/bitlocker-overview-44c0c61c-989d-4a69-8822-b95cd49b1bbf) is a disk encryption feature. Before enabling Bitlocker, you should configure it to use [stronger encryption methods](https://learn.microsoft.com/en-us/windows/security/operating-system-security/data-protection/bitlocker/configure?tabs=common#choose-drive-encryption-method-and-cipher-strength), [stronger PIN complexity](https://learn.microsoft.com/en-us/windows/security/operating-system-security/data-protection/bitlocker/configure?tabs=os#allow-enhanced-pins-for-startup) as well as allow for more [secure unlocking methods](https://learn.microsoft.com/en-us/windows/security/operating-system-security/data-protection/bitlocker/configure?tabs=os#require-additional-authentication-at-startup). PIN leverages TPM thus have anti brute force feature while passwords do not. You should set a strong PIN/password for BitLocker and encrypt the entire disk space. You can also [prevent](https://learn.microsoft.com/en-us/windows/security/operating-system-security/data-protection/bitlocker/configure?tabs=os#disallow-standard-users-from-changing-the-pin-or-password) standard users from changing PIN/password. There's more [contermeatures](https://learn.microsoft.com/en-us/windows/security/operating-system-security/data-protection/bitlocker/countermeasures) you can implent such as disabling Standby depending on your threat model.

### Antivirus Protection and Firewall

Windows include [Windows Security](https://support.microsoft.com/en-us/windows/stay-protected-with-windows-security-2ae0363d-0ada-c064-8b56-6a39afb6a963), which provides the latest antivirus protection, system security settings, Exploit Protection and Controlled Folder Access. Some settings may not be changed in the UI if you have deployed security baselines.

You can manage applications and process connections in the [Firewall](https://support.microsoft.com/en-us/windows/turn-microsoft-defender-firewall-on-or-off-ec0844f7-aebd-0583-67fe-601ecf5d774f). You can also block all inbound connections.

For better security, you should [run Windows Security in a sandbox](https://learn.microsoft.com/en-us/defender-endpoint/sandbox-mdav).

### Account & Identity Security

You should use a local user account for daily tasks. Use complex passwords for your accounts. You can create a local user account in Start → Settings → Accounts → Other users → Add account → I don't have this person's sign-in information → Add a user without a Microsoft account.



lock screen after 10 min

turn on UAC

Windows Hello, including PIN, facial recognition, and fingerprint, leverages TPM, making it more secure than local user account passwords. Currently, there is no way to completely replace local user account passwords with Windows Hello without compromising user experience and operating system recoverability. If you are using a secured-core PC, execute the following command from an elevated command prompt:

    reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios" /v SecureBiometrics /t REG_DWORD /d 1 /f
    reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios" /v SecureFingerprint /t REG_DWORD /d 1 /f

Computer Configuration\Administrative Templates\System\Logon\Exclude credential providers. The value to enter in the policy to hide the password credential provider is `{60b78e88-ead8-445c-9cfd-0b87f74ea6cd}`.

### Network & Bluetooth Security

*   Disable all options in Start → Settings → Network & Internet → Advanced Network Setings → Advanced Sharing Setings → Private Networks/Public Networks. Set options in Start → Settings → Network & Internet → Advanced Network Setings → Advanced Sharing Setings → All Networks to disable public folder sharing, use 128-bit encryption and enable password protected sharing.

*   Enable MAC Address Randomization in Start → Settings → Network & Internet → Wi-Fi → Random Hardware Addresses and set the option in Start → Settings → Network & Internet → Wi-Fi → (Your Network Display Name) → Random Hardware Addresses to `Change every day`.

*   Turn off Bluetooth when not in use. Disable device discovery in Start → Settings → Devices → Devices → More Bluetooth Settings.

*   Set your encrypted DNS in Start → Settings → Network & Internet → Wi-Fi → (Your Network Properties) → DNS Server Assignment → Edit → Manual.

*   Consider automatically turn off Bluetooth using Power Automate

### Developer Mode

*   Disable Developer Mode in Start → Settings → System → For Developers → Developer Mode.

*   Disable Remote Desktop in Start → Settings → System → For Developers → Remote Desktop.

*   Enable all options in Start → Settings → System → For Developers → File Explorer.

### Additional Attack Surface Reduction Measures

In addition to the security baselines, there are some additional attack surface reduction measures.

*   Disable Remote Assistance. In the search box on the taskbar, type `remote assistance`, and then select `Allow Remote Assistance invitations to be sent from this computer` from the list of results. Then, on the `Remote` tab, unselect the Allow Remote Assistance connections to this computer check box, and then select OK.
    <https://support.microsoft.com/en-us/windows/system-configuration-tools-in-windows-f8a49657-b038-43b8-82d3-28bea0c5666b>

*   Disable kernel mode crash dump in advanced system settings.

*   Uninstall features you won't use like Internet Explorer mode in Start → Settings → System → Optional Fetures and Start → Settings → System → Optional Fetures → More Windows Features.

*   Enable the Group Policy `Computer Configuration\Administrative Templates\MS Security Guide\Enable Certificate Padding`.

*   (<https://support.microsoft.com/en-us/topic/kb5042562-guidance-for-blocking-rollback-of-virtualization-based-security-vbs-related-security-updates-b2e7ebf4-f64d-4884-a390-38d63171b8d3>)

*   (<https://support.microsoft.com/zh-cn/topic/kb5025885-%E5%A6%82%E4%BD%95%E9%92%88%E5%AF%B9%E4%B8%8E-cve-2023-24932-%E5%85%B3%E8%81%94%E7%9A%84%E5%AE%89%E5%85%A8%E5%90%AF%E5%8A%A8%E6%9B%B4%E6%94%B9%E7%AE%A1%E7%90%86-windows-%E5%BC%95%E5%AF%BC%E7%AE%A1%E7%90%86%E5%99%A8%E5%90%8A%E9%94%80-41a975df-beb2-40c1-99a3-b3ff139f832d#bkmk_risk>)

*   Add additional attack surface reduction rules and set them to warn mode. Enable the Group Policy `Computer Configuration\Administrative Templates\Windows Components\Microsoft Defender Antivirus\Microsoft Defender Exploit Guard\Attack surface reduction\Configure Attack Surface Reduction rules`. Select `Show...` and add the following [rule IDs](https://learn.microsoft.com/en-us/microsoft-365/security/defender-endpoint/attack-surface-reduction-rules-reference?view=o365-worldwide#asr-rule-to-guid-matrix) in the Value Name column. Then change the status of all rules to 6 in the Value column.

        56a863a9-875e-4185-98a7-b882c64b5ce5
        d1e49aac-8f56-4280-b9ba-993a6d77406c
        01443614-cd74-433a-b99e-2ecdc07bfc25

*   Execute the following command from an elevated command prompt:

        reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa" /v DisableRestrictedAdmin /t REG_DWORD /d 0 /f
        reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Ole\AppCompat\OLELinkConversionFromOLESTREAMToIStorage" /v Disabled /t REG_DWORD /d 1 /f

*   Enable [additional mitigations](https://support.microsoft.com/en-us/topic/kb4073119-windows-client-guidance-for-it-pros-to-protect-against-silicon-based-microarchitectural-and-speculative-execution-side-channel-vulnerabilities-35820a8a-ae13-1299-88cc-357f104f5b11) against silicon-based microarchitectural and speculative execution side-channel vulnerabilities without disabling Hyper-Threading (also known as Simultaneous Multi Threading (SMT)) in Intel processors by executing the following command from an elevated command prompt.

        reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v FeatureSettingsOverride /t REG_DWORD /d 0x00800048 /f 
        reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v FeatureSettingsOverrideMask /t REG_DWORD /d 3 /f
        reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Virtualization" /v MinVmVersionForCpuBasedMitigations /t REG_SZ /d "1.0" /f
        reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Virtualization" /v RetsPredictedFromRsbOnly /t REG_DWORD /d 1 /f

    Enable additional mitigations against silicon-based microarchitectural and speculative execution side-channel vulnerabilities with Hyper-Threading disabled in Intel processors by executing the following command from an elevated command prompt.

        reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v FeatureSettingsOverride /t REG_DWORD /d 0x00802048 /f 
        reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v FeatureSettingsOverrideMask /t REG_DWORD /d 3 /f
        reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Virtualization" /v MinVmVersionForCpuBasedMitigations /t REG_SZ /d "1.0" /f
        reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Virtualization" /v RetsPredictedFromRsbOnly /t REG_DWORD /d 1 /f

    Enable additional mitigations against silicon-based microarchitectural and speculative execution side-channel vulnerabilities in AMD processors by executing the following command from an elevated command prompt. To be fully protected, you might also need to disable Hyper-Threading (also known as Simultaneous Multi Threading (SMT)).

        reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v FeatureSettingsOverride /t REG_DWORD /d 0x05000048 /f 
        reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v FeatureSettingsOverrideMask /t REG_DWORD /d 3 /f
        reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Virtualization" /v MinVmVersionForCpuBasedMitigations /t REG_SZ /d "1.0" /f
        reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Virtualization" /v RetsPredictedFromRsbOnly /t REG_DWORD /d 1 /f

    Enable additional mitigations against silicon-based microarchitectural and speculative execution side-channel vulnerabilities in ARM processors by executing the following command from an elevated command prompt. To be fully protected, you might also need to disable Hyper-Threading (also known as Simultaneous Multi Threading (SMT)).

        reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v FeatureSettingsOverride /t REG_DWORD /d 64 /f 
        reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v FeatureSettingsOverrideMask /t REG_DWORD /d 3 /f
        reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Virtualization" /v MinVmVersionForCpuBasedMitigations /t REG_SZ /d "1.0" /f
        reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Virtualization" /v RetsPredictedFromRsbOnly /t REG_DWORD /d 1 /f


