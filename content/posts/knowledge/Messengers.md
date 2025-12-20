---
title: "Messengers"
date: 2022-03-06
tags: ['Knowledge base', 'Privacy', 'Security']
author: madaidan
---

[Telegram](https://telegram.org/) is [not end-to-end encrypted by default](https://telegram.org/faq#q-why-not-just-make-all-chats-secret), which allows the Telegram server to see all of your messages unless you use a "Secret Chat". Telegram uses [custom, unaudited encryption](https://core.telegram.org/mtproto), and the first version of MTProto had [severe security issues](https://eprint.iacr.org/2015/1177.pdf), although these were fixed with MTProto 2.0. However, Telegram still uses strange cryptographic primitives, such as AES-IGE, for "performance", although they use it in a way that they [aren't affected by its known security issues](https://core.telegram.org/techfaq#q-do-you-use-ige-ige-is-broken). Telegram has also been criticised by well-known cryptographers, such as [Moxie Marlinspike](https://news.ycombinator.com/item?id=6913456), [Matthew Green](https://x.com/matthew_d_green/status/726428912968982529)and [Filippo Valsorda](https://buttondown.email/cryptography-dispatches/archive/cryptography-dispatches-the-most-backdoor-looking/).

Telegram has [held crypto cracking contests](https://telegram.org/crypto_contest), but these [were](https://www.schneier.com/crypto-gram/archives/1998/1215.html#contests) [rigged](https://archive.vn/SIl9M). Although the [clients are open source](https://telegram.org/apps#source-code), the server is not, so self-hosting is not a possibility. The creators of Telegram [have also spread unfounded misinformation](https://x.com/durov/status/872891017418113024) about competing apps before.

Telegram, along with most other messengers, leak significant [metadata](https://en.wikipedia.org/wiki/Metadata) about your messages, even if the message itself was end-to-end encrypted.

## Silence

[Silence](https://silence.im) is dead, and the only commits for a long time [have been translations](https://git.silence.dev/Silence/Silence-Android/-/commits/master), not code updates.

## Wire

[Wire](https://wire.com/en/) [stores all metadata unencrypted on their servers](https://www.vice.com/en_us/article/gvzw5x/secure-messaging-app-wire-stores-everyone-youve-ever-contacted-in-plain-text), and [plans to correct this have not been acted on for several years](https://github.com/wireapp/wire/issues/214). Unlike Telegram, however, [Wire has been audited](https://wire.com/en/security/#audits), and its server code is [fully open source](https://github.com/wireapp/wire-server), allowing it to be self-hosted.

## Conclusion

Use [Signal](https://www.signal.org/). It [uses the gold standard of encryption](https://www.signal.org/docs/), [conceals metadata well](https://www.signal.org/docs/), [has a great track record](https://signal.org/bigbrother/eastern-virginia-grand-jury/), is recommended by countless experts in the field and more. Most other messengers are subpar.
