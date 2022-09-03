---
title: "Securing OpenSSH with FIDO2"
date: 2022-04-09T17:43:12Z
tags: ['Operating Systems', 'Linux', 'Security']
author: Wonderfall
canonicalURL: https://wonderfall.dev/openssh-fido2/
ShowCanonicalLink: true
---

Passwordless authentication with OpenSSH keys has been the *de facto* security standard for years. SSH keys are more robust since they're cryptographically sane by default, and are therefore resilient to most bruteforce atacks. They're also easier to manage while enabling a form of decentralized authentication (it's easy and painless to revoke them). So, what's the next step? And more exactly, why would one need something even better?


## Why?

The main problem with SSH keys is that they're not magic: they consist of a key pair, of which the private key is stored on your disk. You should be wary of various exfiltration attempts, depending on your theat model:

- If your disk is not encrypted, any physical access could compromise your keys.
- If your private key isn't encrypted, malicious applications could compromise it.
- Even with both encrypted, malicious applications could register your keystrokes.

All these attempts are particularly a thing on desktop platforms, because they don't have a proper sandboxing model. On Windows, non-UWP apps could likely have full access to your `.ssh` directory. On desktop Linux distributions, sandboxing is also lacking, and the situation is even worse if you're using X.org since it allows apps to spy on each other (and on your keyboard) by design. A first good step would be to only use SSH from a trusted & decently secure system.

Another layer of defense would obviously be multi-factor authentication, or the fact that you're relying on a shared secret instead. We can use FIDO2 security keys for that. That way, even if your private key is compromised, the attacker needs physical access to your security key. TOTP is another common 2FA technique, but it's vulnerable to various attacks, and relies on the quality of the implementation on the server.


## How?

Fortunately for us, [OpenSSH 8.2](https://www.openssh.com/txt/release-8.2) (released in February 2020) introduced native support for FIDO2/U2F. Most OpenSSH distributions should have the middleware set to use the `libfido2` library, including portable versions such as the one [for Win32](https://github.com/PowerShell/Win32-OpenSSH).

Basically, `ssh-keygen -t ${key_type}-sk` will generate for us a token-backed key pair. The key types that are supported depend on your security key. Newer models should support both ECDSA-P256 (`ecdsa-sk`) and Ed25519 (`ed25519-sk`). If the latter is available, you should prefer it.

### Client configuration
To get started:

```
ssh-keygen -t ed25519-sk
```

This will generate a `id_ed25519_sk` private key and a `id_ed25519_sk.pub` public key in `.ssh`. These are defaults, but you can change them if you want. We will call this key pair a "handle", because they're not sufficient by themselves to derive the real secret (as you guessed it, the FIDO2 token is needed). `ssh-keygen` should ask you to touch the key, and enter the PIN prior to that if you did set one (you probably should).

You can also generate a **resident key** (referred to as *discoverable credential* in the WebAuthn specification):

```
ssh-keygen -t ed25519-sk -O resident -O application=ssh:user1
```

As you can see, a few options must be specified:

- `-O resident` will tell `ssh-keygen` to generate a resident key, meaning that the private "handle" key will also be stored on the security key itself. This has security implications, but you may want that to move seamlessly between different computers. In that case, you should absolutely protect your key with a PIN beforehand.
- `-O application=ssh:` is necessary to instruct that the resident key will use a particular slot, because the security key will have to index the resident keys (by default, they use `ssh:` with an empty user ID). If this is not specified, the next key generation might overwrite the previous one.
- `-O verify-required` is optional but instructs that a PIN is required to generate/access the key.

Resident keys can be retrieved using `ssh-keygen -K` or `ssh-add -K` if you don't want to write them to the disk.

### Server configuration
Next, transfer your public key over to the server (granted you have already access to it with a regular key pair):

```
ssh-copy-id -i ~/.ssh/id_ed25519_sk.pub user@server.domain.tld
```

*Ta-da!* But one last thing: we need to make sure the server supports this public key format in `sshd_config`:

```
PubkeyAcceptedKeyTypes ssh-ed25519,sk-ssh-ed25519@openssh.com
```

Adding `sk-ssh-ed25519@openssh.com` to `PubkeyAcceptedKeyTypes` should suffice. It's best practice to only use the cryptographic primitives that you need, and hopefully ones that are also modern. This isn't a full-on SSH hardening guide, but you should take a look at the [configuration file GrapheneOS uses](https://github.com/GrapheneOS/infrastructure/blob/main/sshd_config) for their servers to give you an idea on a few good practices.

Restart the `sshd` service and try to connect to your server using your key handle (by passing `-i ~/.ssh/id_ed25519_sk` to `ssh` for instance). If that works for you (your FIDO2 security key should be needed to derive the real secret), feel free to remove your previous keys from `.ssh/authorized_keys` on your server.

## That's cool, right?
If you don't have a security key, you can buy one from [YubiKey](https://www.yubico.com/fr/store/) (I'm very happy with my 5C NFC by the way), [Nitrokey](https://www.nitrokey.com/), [SoloKeys](https://solokeys.com/) or [OnlyKey](https://onlykey.io/) (to name a few). If you have an Android device with a hardware security module (HSM), such as the Google Pixels equipped with Titan M (Pixel 3+), you could even use them as bluetooth security keys.

*No reason to miss out on the party if you can afford it!*