---
title: "Messengers"
date: 2022-03-06
tags: ['Knowledge base', 'Privacy', 'Security']
author: madaidan
---

## Telegram

[Telegram](https://telegram.org/) is [not end-to-end encrypted by default](https://telegram.org/faq#q-why-not-just-make-all-chats-secret), which allows the Telegram server to see all of your messages unless you use a "Secret Chat". Telegram uses [custom, unaudited encryption](https://core.telegram.org/mtproto), and the first version of MTProto had [severe security issues](https://eprint.iacr.org/2015/1177.pdf), although these were fixed with MTProto 2.0. However, Telegram still uses strange cryptographic primitives, such as AES-IGE, for "performance", although they use it in a way that they [aren't affected by its known security issues](https://core.telegram.org/techfaq#q-do-you-use-ige-ige-is-broken). Telegram has also been criticized by well-known cryptographers, such as [Moxie Marlinspike](https://news.ycombinator.com/item?id=6913456), [Matthew Green](https://x.com/matthew_d_green/status/726428912968982529)and [Filippo Valsorda](https://buttondown.email/cryptography-dispatches/archive/cryptography-dispatches-the-most-backdoor-looking/).

Telegram has [held crypto cracking contests](https://telegram.org/crypto_contest), but these [were](https://www.schneier.com/crypto-gram/archives/1998/1215.html#contests) [rigged](https://archive.vn/SIl9M). Although the [clients are open source](https://telegram.org/apps#source-code), the server is not, so self-hosting is not a possibility. The creators of Telegram [have also spread unfounded misinformation](https://x.com/durov/status/872891017418113024) about competing apps before.

Telegram, along with most other messengers, leak significant [metadata](https://en.wikipedia.org/wiki/Metadata) about your messages, even if the message itself was end-to-end encrypted.

## Wire

[Wire](https://wire.com/en/) [stores all metadata unencrypted on their servers](https://www.vice.com/en_us/article/gvzw5x/secure-messaging-app-wire-stores-everyone-youve-ever-contacted-in-plain-text), and [plans to correct this have not been acted on for several years](https://github.com/wireapp/wire/issues/214). Unlike Telegram, however, [Wire has been audited](https://wire.com/en/security/#audits), and its server code is [fully open source](https://github.com/wireapp/wire-server), allowing it to be self-hosted.

Previously, Wire's privacy policy stated [they would only share user data when required by law](https://web.archive.org/web/20180324221043/https://wire.com/en/legal/#privacy-7), but they have quietly changed it to say that they will share data when "necessary". The ambiguity of this raises some red flags.

## Threema

Threema is a paid service that [claims to be more private and secure than Signal](https://web.archive.org/web/20211103081337/https://threema.ch/en/messenger-comparison).

They have [downplayed security audits](https://arstechnica.com/information-technology/2023/01/messenger-billed-as-better-than-signal-is-riddled-with-vulnerabilities/) by saying that those audits refer to an older protocol and provide outdated advice. This fails to mention that this is because the researchers behind the audit revealed the vulnerabilities to Threema, and Threema then fixed them. Threema has also been [criticized](https://soatok.blog/2021/11/05/threema-three-strikes-youre-out/#summary-of-results) by the cryptographer Soatok.

## XMPP

[XMPP](https://xmpp.org/) is a federated protocol that allows encryption through OMENO. It has been [criticized by Soatok](https://soatok.blog/2024/08/04/against-xmppomemo/). He highlights how XMPP clients have outdated protocol implementations, how OMENO has vague design choices, and how the popular XMPP client [Conversations](https://conversations.im/) has security issues.

## Matrix

[Matrix](https://matrix.org) is another federated protocol that primarily features the [Element](https://element.io/)/Element X client. Soatok's [criticisms of Matrix](https://soatok.blog/2024/08/14/security-issues-in-matrixs-olm-library/) include lack of forward secrecy and vulnerabilities in Matrix's Olm library that he found easy to find. He also criticizes unsatisfactory attitudes by Matrix developers, who failed to address vulnerabilities that they knew for years.

# Better Messengers

These messengers have forward secrecy, post-compromise secrecy, and general security practices that make them stand out among the rest. However, as you'll see below, they are not perfect.

## Signal

[Signal](https://www.signal.org/) uses [audited and solid encryption](https://www.signal.org/docs/), conceals some metadata with [Sealed Sender](https://signal.org/blog/sealed-sender), has [private groups](https://signal.org/blog/signal-private-group-system), [has a better track record than most](https://signal.org/bigbrother/eastern-virginia-grand-jury/), and is recommended by several experts.

To hide your phone number, you can use Signal usernames and change the Who Can See Your Phone Number setting to Nobody.

Note that Signal [stores the encryption key in a plaintext file on macOS](https://github.com/signalapp/Signal-Desktop/issues/1017), and [has no plans to fix this](https://mastodon.world/@Mer__edith/112756436049179443). Signal [doesn't sandbox media or RTC](https://x.com/GrapheneOS/status/1905405000810889540#m), they haven't resolved [issues relating to outdated TLS proxies](/proxies/update-your-signal-tls-proxy/), and they haven't addressed a very severe and near-untraceable potential attack called [Careless Whisper](https://arxiv.org/pdf/2411.11194).

# Molly

Molly is an alternative Signal client for Android which allows you to encrypt the local database with a passphrase at rest, to have unused RAM data securely shredded, use SOCKS proxies to route your connection via Tor as an alternative to TLS proxies, and more. It also has usability improvements including scheduled backups, automatic locking, the ability to use your Android phone as a linked device instead of the primary device for a Signal account, and support for [UnifiedPush](https://unifiedpush.org/) through a [MollySocket](https://github.com/mollyim/mollysocket) instance. UnifiedPush can be especially useful with the Molly-FOSS client, which lacks proprietary code allowing support for battery-efficient notifications using Google Play Services.

Note that Molly currently cannot address Signal's media and RTC sandboxing issues, and Molly is also vulnerable to Careless Whisper.

## SimpleX

SimpleX is a messenger that does not require user IDs to sign up. Some metadata leakage is mitigated through unidirectional [SimpleX queues](https://github.com/simplex-chat/simplexmq/blob/stable/protocol/simplex-messaging.md#simplex-queue), and SimpleX has been [audited](https://simplex.chat/blog/20241014-simplex-network-v6-1-security-review-better-calls-user-experience.html#simplex-cryptographic-design-review-by-trail-of-bits). 

Note that SimpleX describes itself as decentralized, even though only [two entities are in charge of servers by default](https://simplex.chat/blog/20241125-servers-operated-by-flux-true-privacy-and-decentralization-for-all-users.html). SimpleX also claims to have some of the strongest metadata leakage protections, however [they do not see leaking IP addresses to the server as a problem](https://discuss.privacyguides.net/t/simplex-vs-cwtch-who-is-right/19256/112). Most messengers like Signal don't bother to hide your IP address from them, but IP addresses are metadata that SimpleX fails to recognize in importance.

## Attributions (not endorsements)
- https://www.privacyguides.org/en/real-time-communication
