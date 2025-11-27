---
title: "Banking Applications Compatibility with GrapheneOS"
date: "2022-01-26"
tags: ['Applications', 'Android', 'Banking', 'Compatibility', 'GrapheneOS']
author: akc3n, Tommy, spring-onion
---
  
**Maintained Compatibility List for International Banking Apps**    
   
This list includes banking apps that have been tested, submitted, reviewed, and verified as compatible.   
    
**[LIST](#international-banking-apps) | [SUBMIT](#submit-a-new-app-report) | [UPDATE](#update-status-of-app-report) | [POSSIBLE WORKAROUND SOLUTIONS](https://discuss.grapheneos.org/d/8330-app-compatibility-with-grapheneos)**  

## Introduction

Welcome to the crowd-sourced dataset for [GrapheneOS](https://grapheneos.org) users on currently [supported devices](https://grapheneos.org/faq#supported-devices).   
  
New visitors are encouraged to read the [official usage guide on banking apps](https://grapheneos.org/usage#banking-apps) for comprehensive details about how these apps function on GrapheneOS.  

### IMPORTANT 

Please read GrapheneOS's important announcement, officially released on Dec 1, 2023:  
[Twitter](https://twitter.com/GrapheneOS/status/1730491676760633426) | [Mastodon](https://grapheneos.social/@GrapheneOS/111504057316755618) | [Bluesky](https://bsky.app/profile/grapheneos.org/post/3kfhrujfcih2m)   
   
Also available as a [pinned issue](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/342), detailing the latest developments about [SafetyNet's replacement by Play Integrity API](https://akc3n.page/posts/banking-app-issues/#safetynet-replaced-by-play-integrity-api), which could impact _some_ banking app's [compatibility](https://discuss.grapheneos.org/d/8330-app-compatibility-with-grapheneos#:~:text=issuecomment%2D1766887298%29-,Not%20compatible,-Due%20to%20the) with GrapheneOS after the app updates.  

---

<!-- 
TODO: 
- remove language and geo-language from app store url link after testing locally
- i.e., users in different countries / languages locale defaults 

EXAMPLE:

  INCORRECT:
    Germany
    - [Commerzbank Banking](https://play.google.com/store/apps/details?id=de.commerzbanking.mobil&hl=en_US&gl=US)

  CORRECT:
    - [Commerzbank Banking](https://play.google.com/store/apps/details?id=de.commerzbanking.mobil)

  REMOVE:
    &hl=en_US&gl=US

NOTE: Some only have either/or, remove:
    - &hl=en
    - &gl=FR

    OTHER:
        - &hl=de&gl=US
        - &hl=en&gl=US
        - &hl=en_IN&gl=US

TEST: Test url again after removing the parameters and verify there is no mistakes in url
-->
## International banking apps

- ~~[Avalanche Card](https://play.google.com/store/apps/details?id=com.liquidity.financial)~~ - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/629)
- [Binance: Buy Bitcoin & Crypto](https://play.google.com/store/apps/details?id=com.binance.dev) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/536)
- [Curve - Your Smart Wallet](https://play.google.com/store/apps/details?id=com.imaginecurve.curve.prd) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/679)
- [eToro: Trade. Invest. Connect.](https://play.google.com/store/apps/details?id=com.etoro.openbook) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/535)
- [iCard – beyond a wallet](https://play.google.com/store/apps/details?id=eu.mobile.icard) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/565)
- [Klarna | Shop now. Pay later.](https://play.google.com/store/apps/details?id=com.myklarnamobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/314)
- [Moneco](https://play.google.com/store/apps/details?id=com.monecohq.mobile.android) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/780)
- [Payoneer](https://play.google.com/store/apps/details?id=com.payoneer.android) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/445)
- [PayPal - Send, Shop, Manage](https://play.google.com/store/apps/details?id=com.paypal.android.p2pmobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/127)
- [Paysend Money Transfer App](https://play.google.com/store/apps/details?id=com.paysend.app) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/222)
- [RedotPay: Crypto Card & Pay](https://play.google.com/store/apps/details?id=com.redotpay) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/779)
- [Revolut - Mobile Finance](https://play.google.com/store/apps/details?id=com.revolut.revolut) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/90)
- [Swoo: digital wallet](https://play.google.com/store/apps/details?id=com.cardsmobile.swoo) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/795)
- [UnionPay APP](https://play.google.com/store/apps/details?id=com.unionpay) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/421)
- [Wero](https://play.google.com/store/apps/details?id=eu.epicompany.wero.wallet) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/663)
- [Wise](https://play.google.com/store/apps/details?id=com.transferwise.android) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/266)
- [ZEN.COM for peaceful payments](https://play.google.com/store/apps/details?id=com.zen.application) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/785)

## National banking apps

### Algeria

- [BaridiMob](https://play.google.com/store/apps/details?id=ru.bpc.mobilebank.bpc) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/619)

### Argentina

- [Galicia - El banco en tu celu](https://play.google.com/store/apps/details?id=com.mosync.app_Banco_Galicia) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/216)

### Australia

- [ANZ Australia](https://play.google.com/store/apps/details?id=com.anz.android.gomoney) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/157)
- ~~[ANZ Plus](https://play.google.com/store/apps/details?id=com.anz.lotus)~~ - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/313)
- [Bank Australia App](https://play.google.com/store/apps/details?id=com.fusion.banking) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/55)
- [BankVic Mobile Banking](https://play.google.com/store/apps/details?id=com.bankvic.androidsmartapp) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/557)
- [Bankwest](https://play.google.com/store/apps/details?id=au.com.bankwest.mobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/757)
- [Bank of Melbourne Banking](https://play.google.com/store/apps/details?id=org.bom.bank) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/800)
- [Bendigo Bank](https://play.google.com/store/apps/details?id=com.bendigobank.mobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/88)
- [CoinSpot - Buy & Sell Bitcoin](https://play.google.com/store/apps/details?id=com.coinspot.app) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/566)
- [CommBank](https://play.google.com/store/apps/details?id=com.commbank.netbank) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/75)
- [Gateway Bank](https://play.google.com/store/apps/details?id=au.com.gateway.android) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/558)
- [HSBC Australia](https://play.google.com/store/apps/details?id=au.com.hsbc.hsbcaustralia) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/375)
- [ING Australia Banking](https://play.google.com/store/apps/details?id=au.com.ingdirect.android) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/500)
- [Macquarie Mobile Banking](https://play.google.com/store/apps/details?id=au.com.macquarie.banking) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/409)
- [ME Bank](https://play.google.com/store/apps/details?id=au.com.mebank.banking) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/203)
- [ME Go](https://play.google.com/store/apps/details?id=au.com.mebank.mobilebanking) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/667)
- [MyState: The human way to bank](https://play.google.com/store/apps/details?id=com.mystate.app) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/345)
- [NAB Mobile Banking](https://play.google.com/store/apps/details?id=au.com.nab.mobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/76)
- [Stake – Stocks | ETFs | SMSF](https://play.google.com/store/apps/details?id=com.stake.stake) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/801)
- [St.George Mobile Banking](https://play.google.com/store/apps/details?id=org.stgeorge.bank) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/570)
- [Ubank Money App](https://play.google.com/store/apps/details?id=au.com.bank86400) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/156)
- [UniBank Australia](https://play.google.com/store/apps/details?id=au.com.cuscal.redi2pay.unib01) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/806)
- [Up — Easy Money](https://play.google.com/store/apps/details?id=au.com.up.money) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/102)
- [Westpac](https://play.google.com/store/apps/details?id=org.westpac.bank) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/77)

### Austria

- [bank99 | Online Banking ex-ING](https://play.google.com/store/apps/details?id=at.ing.diba.client.onlinebanking) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/275)
- [Bank Austria MobileBanking](https://play.google.com/store/apps/details?id=com.bankaustria.android.olb) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/15)
- [BAWAG Banking App](https://play.google.com/store/apps/details?id=com.bawagpsk.bawagpsk) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/722)
- [complete Control](https://play.google.com/store/apps/details?id=com.cardcomplete.completecontrol) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/408)
- [easybank App](https://play.google.com/store/apps/details?id=com.easybank.easybank) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/597)
- [flatex next AT: Aktien und ETF](https://play.google.com/store/apps/details?id=de.xcom.flatexat) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/491)
- [George Österreich](https://play.google.com/store/apps/details?id=at.erstebank.george) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/490)
- [ID Austria](https://play.google.com/store/apps/details?id=at.gv.oe.app) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/794)
- [Mein ELBA-App](https://play.google.com/store/apps/details?id=at.rsg.pfp) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/62)
- ~~[RaiPay – Raiffeisen Österreich](https://play.google.com/store/apps/details?id=at.raiffeisen.mobilepay)~~ - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/804)
- [Renault Bank direkt](https://play.google.com/store/apps/details?id=at.plot.banking.mobile.rci) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/492)
- [s Identity](https://play.google.com/store/apps/details?id=at.erstebank.securityapp) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/278)
- [Wüstenrot App](https://play.google.com/store/apps/details?id=at.wuestenrot.klickmal.android) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/709)

### Bangladesh

- [bKash](https://play.google.com/store/apps/details?id=com.bKash.customerapp) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/454)

### Belarus

- [Belinvestbank (Белинвестбанк)](https://appgallery.huawei.com/app/C102330987) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/791)
- [BELKART PAY](https://play.google.com/store/apps/details?id=com.belkartpay.belkartpay) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/521)
- [DailyFin (Белгазпромбанк)](https://play.google.com/store/apps/details?id=by.bgpb.dailyfin) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/789)
- [INSNC: Mobile Banking, Bank (Альфа-Банк)](https://play.google.com/store/apps/details?id=by.alfabank.insync3) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/790)
- [iParitet](https://play.google.com/store/apps/details?id=by.iparitet) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/520)
- [МТБанк Moby (MTBank)](https://play.google.com/store/apps/details?id=by.mtbank.Moby) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/519)
- [Oplati (Оплати)](https://play.google.com/store/apps/details?id=by.lwo.oplati) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/792)
- [Prior Online (Приорбанк)](https://play.google.com/store/apps/details?id=by.st.priormobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/793)

### Belgium

- [Argenta Banking](https://play.google.com/store/apps/details?id=be.argenta.bankieren) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/274)
- [Belfius Mobile](https://play.google.com/store/apps/details?id=be.belfius.directmobile.android) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/110)
- [Beobank Mobile](https://play.google.com/store/apps/details?id=com.beobank_prod.bad) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/694)
- [CBC Mobile](https://play.google.com/store/apps/details?id=com.kbc.mobile.android.phone.cbc) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/701)
- [Crelan Mobile App](https://play.google.com/store/apps/details?id=be.crelan.channels.mobile.android.store) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/600)
- [Easy Banking App](https://play.google.com/store/apps/details?id=com.bnpp.easybanking) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/405)
- [Europabank eb online](https://play.google.com/store/apps/details?id=com.mobile.europabank) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/690)
- [Hello Bank Belgium](https://play.google.com/store/apps/details?id=com.bnpp.hellobank) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/399)
- [ING Banking](https://play.google.com/store/apps/details?id=com.ing.banking) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/45)
- [itsme](https://play.google.com/store/apps/details?id=be.bmid.itsme) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/276)
- [KBC Mobile](https://play.google.com/store/apps/details?id=com.kbc.mobile.android.phone.kbc) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/401)
- [Keytrade Bank](https://play.google.com/store/apps/details?id=be.keytradebank.phone) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/400)
- [MeDirect](https://play.google.com/store/apps/details?id=com.medirect.MobileApp) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/692)
- [mobile@vdk](https://play.google.com/store/apps/details?id=com.vdk.prod) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/691)
- [MyCPH Mobile](https://play.google.com/store/apps/details?id=be.cph.cphmobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/689)
- [Payconiq by Bancontact](https://play.google.com/store/apps/details?id=mobi.inthepocket.bcmc.bancontact) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/277)
- [Santander Consumer Bank](https://play.google.com/store/apps/details?id=com.santander.webbanking) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/697)
- [Triodos Banking BE](https://play.google.com/store/apps/details?id=com.triodos.bankingbe) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/688)

### Brazil

- [Banco da Amazônia](https://play.google.com/store/apps/details?id=la.foton.basa.mybankmobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/238)
- [Banco do Brasil: abrir conta](https://play.google.com/store/apps/details?id=br.com.bb.android) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/235)
- [Banco Itaú: Conta, Cartão e +](https://play.google.com/store/apps/details?id=com.itau) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/419)
- [Bradesco: Conta, Cartão e Pix!](https://play.google.com/store/apps/details?id=com.bradesco) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/236)
- [Bradesco Net Empresa](https://play.google.com/store/apps/details?id=br.com.bradesco.netempresa) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/237)
- [CAIXA](https://play.google.com/store/apps/details?id=br.com.gabba.Caixa) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/89)
- ~~[gov.br](https://play.google.com/store/apps/details?id=br.gov.meugovbr)~~ - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/310)
- [Inter&Co: Conta, Cartão e Pix](https://play.google.com/store/apps/details?id=br.com.intermedium) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/411)
- [Nubank: conta, cartão e mais](https://play.google.com/store/apps/details?id=com.nu.production) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/92)
- [Santander Brasil](https://play.google.com/store/apps/details?id=com.santander.app) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/151)
- [Santander Empresas](https://play.google.com/store/apps/details?id=com.santandermovelempresarial.app) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/153)
- [Santander Way: App de cartões](https://play.google.com/store/apps/details?id=br.com.santander.way) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/152)
- [Sicoob](https://play.google.com/store/apps/details?id=br.com.sicoobnet) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/239)
- [Sicredi X](https://play.google.com/store/apps/details?id=br.com.sicredi.app) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/412)
- [XP Investimentos](https://play.google.com/store/apps/details?id=br.com.xp.carteira) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/572)

### Bulgaria

- [KBC Mobile Bulgaria](https://play.google.com/store/apps/details?id=com.raiffeisen.online.mobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/357)
- [My Fibank](https://play.google.com/store/apps/details?id=com.bfs.fibank) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/359)

### Canada

- [Affinity Mobile](https://play.google.com/store/apps/details?id=ca.affinitycu.mobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/71)
- [Amex Canada](https://play.google.com/store/apps/details?id=com.americanexpress.android.acctsvcs.ca) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/683)
- [ATB Personal - Mobile Banking](https://play.google.com/store/apps/details?id=com.atb.ATBMobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/415)
- [BMO Mobile Banking](https://play.google.com/store/apps/details?id=com.bmo.mobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/19)
- [CIBC Mobile Banking®](https://play.google.com/store/apps/details?id=com.cibc.android.mobi) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/489)
- [Coast Capital Savings](https://play.google.com/store/apps/details?id=com.coastcapitalsavings.dcu) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/175)
- [connectFirst](https://play.google.com/store/apps/details?id=com.celero.connectfirst) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/769)
- ~~[EQ Bank Mobile Banking](https://play.google.com/store/apps/details?id=com.eqbank.eqbank)~~ - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/621)
- [HSBC Canada](https://play.google.com/store/apps/details?id=ca.hsbc.hsbccanada) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/304)
- [IBKR Mobile](https://play.google.com/store/apps/details?id=atws.app) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/241)
- [MBNA Canada](https://play.google.com/store/apps/details?id=com.td.mbna) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/753)
- [PC Financial Mobile](https://play.google.com/store/apps/details?id=ca.pcfinancial.bank) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/623)
- [QuestMobile: Invest & Trade](https://play.google.com/store/apps/details?id=com.questrade.questmobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/115)
- [RBC Mobile](https://play.google.com/store/apps/details?hl=en&id=com.rbc.mobile.android) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/32)
- [Rogers Bank](https://play.google.com/store/apps/details?id=com.rogers.banking) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/622)
- [Scotiabank Mobile Banking](https://play.google.com/store/apps/details?id=com.scotiabank.banking) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/176)
- [Services mobiles Desjardins](https://play.google.com/store/apps/details?id=com.desjardins.mobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/550)
- [Servus Mobile Banking](https://play.google.com/store/apps/details?id=ca.servus.mbanking) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/760)
- [Simplii Financial](https://play.google.com/store/apps/details?id=com.pcfinancial.mobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/17)
- [Tangerine Mobile Banking](https://play.google.com/store/apps/details?id=ca.tangerine.clients.banking.app) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/16)
- ~~[TD Authenticate](https://play.google.com/store/apps/details?id=com.td.softtoken)~~ - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/628)
  - This 2FA app is broken on GrapheneOS, but can be set up if you have a second phone in reach. The TD apps work fine otherwise.
- [TD Canada](https://play.google.com/store/apps/details?id=com.td) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/199)
- [TD Easy Trade](https://play.google.com/store/apps/details?id=com.td.investing.lite) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/680)
- [Wealthsimple - Grow your money](https://play.google.com/store/apps/details?id=com.wealthsimple.trade) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/117)

### Chile

- [App Scotia](https://play.google.com/store/apps/details?id=cl.scotiabank.go) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/756)
- [BancoEstado](https://play.google.com/store/apps/details?id=net.veritran.becl.prod) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/609)
- [Mi Banco Edwards](https://play.google.com/store/apps/details?id=cl.bancochile.mi_edwards) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/457)
- [Santander Chile](https://play.google.com/store/apps/details?id=cl.santander.smartphone) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/360)

### China

- [中国农业银行 (Agricultural Bank of China)](https://download.abchina.com.cn/#/) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/648)
- [支付宝 (Alipay)](https://play.google.com/store/apps/details?id=com.eg.android.AlipayGphone) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/562)
- [交通银行 (Bank of Communications)](https://mbank.95559.com.cn:8888/mobs6/downloadApp/DA0/NDA0001.html) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/646)
- [中国工商银行中国工商银行 (Industrial and Commercial Bank of China)](https://sj.qq.com/appdetail/com.icbc) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/561)
- [中国银行](https://www.bankofchina.com/ebanking/service/cs1/201009/t20100921_1151946.html) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/398)
- [招商银行 (China Merchants Bank)](https://play.google.com/store/apps/details?id=cmb.pb) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/420)
- [中信银行 (Citic Bank)](https://www.citicbank.com/personal/ebank/personal/) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/487)
- [兴业银行 (Industrial Bank)](https://www.cib.com.cn/common/download/client.html) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/486)
- [中国邮政储蓄银行 (Postal Savings Bank of China)](https://phone.psbc.com/) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/647)
- [上海浦东发展银行 (Shanghai Pudong Development Bank)](https://per.spdb.com.cn/personal_electronic_bank/tools_download/201701/t20170116_316975.shtml) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/649)

### Colombia

- [Bancolombia Personas](https://play.google.com/store/apps/details?id=com.todo1.mobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/568)
- [Banco Falabella Colombia](https://play.google.com/store/apps/details?id=co.com.bancofalabella.mobile.omc) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/387)
- [BBVA Colombia](https://play.google.com/store/apps/details?id=co.com.bbva.mb) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/386)
- [Davivienda](https://play.google.com/store/apps/details?id=com.davivienda.daviviendaapp) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/528)
- [Mi Bancolombia](https://play.google.com/store/apps/details?id=co.com.bancolombia.personas.superapp) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/571)
- [Nequi Colombia](https://play.google.com/store/apps/details?id=com.nequi.MobileApp) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/388)

### Costa Rica

- [Scotiabank CR, Banca Móvil](https://play.google.com/store/apps/details?id=com.mobtion.scotiabank.mobilebanking) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/678)

### Croatia

- [George Croatia](https://play.google.com/store/apps/details?id=hr.erstebank.george) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/373)
- [KEKS Pay](https://play.google.com/store/apps/details?id=agency.sevenofnine.erstewallet.production) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/402)
- [m-zaba](https://play.google.com/store/apps/details?id=hr.asseco.android.zaba.new) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/461)
- [m-zabaPS](https://play.google.com/store/apps/details?id=hr.asseco.android.mtoken.zabaPS) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/462)
- [PBZ mobile banking application](https://play.google.com/store/apps/details?id=hr.asseco.android.intesa.isbd.pbz) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/403)

### Cyprus

- [Bank Of Cyprus](https://play.google.com/store/apps/details?id=cy.com.netinfo.netteller.boc) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/665)

### Czech Republic

- [CREDITAS Banking](https://play.google.com/store/apps/details?id=cz.creditas.richee) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/78)
- [ČSOB Smart](https://play.google.com/store/apps/details?id=cz.csob.smart) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/748)
  - You can't open an account through the app but the rest works.
- [ČSOB Smart Key](https://play.google.com/store/apps/details?id=cz.csob.smartklic) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/803)
- [Fio Smartbanking CZ](https://play.google.com/store/apps/details?id=cz.fio.sb2) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/446)
- [George Česko](https://play.google.com/store/apps/details?id=cz.csas.georgego) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/251)
- [George klíč](https://play.google.com/store/apps/details?id=cz.csas.app.georgeklic) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/251)
- [KB Klíč](https://play.google.com/store/apps/details?id=cz.kb.paatproduction) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/377)
- [KB Mobilní banka](https://play.google.com/store/apps/details?id=eu.inmite.prj.kb.mobilbank) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/376)
- [My Air](https://play.google.com/store/apps/details?id=cz.airbank.android) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/31)
- [Raiffeisen bankovnictví](https://play.google.com/store/apps/details?id=cz.rb.app.smartphonebanking) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/347)
- [Smart Banka](https://play.google.com/store/apps/details?id=cz.moneta.smartbanka) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/554)

### Denmark

- [AL-Bank](https://play.google.com/store/apps/details?id=dk.bec.android.mb1.b00020.prod) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/675)
- [Jyske Bank](https://play.google.com/store/apps/details?id=dk.jyskebank.drb) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/307)
- ~~[MitID](https://play.google.com/store/apps/details?id=dk.mitid.app.android)~~ - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/286)
- [Mobilbank DK – Danske Bank](https://play.google.com/store/apps/details?id=com.danskebank.mobilebank3.dk) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/5)
- [MobilePay](https://play.google.com/store/apps/details?id=dk.danskebank.mobilepay) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/7)
- [Nordea Mobile - Denmark](https://play.google.com/store/apps/details?id=dk.nordea.mobilebank) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/118)

### Ecuador

- [Banco del Pacífico](https://play.google.com/store/apps/details?id=com.pacifico.movilmatico) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/225)
- [Banco Guayaquil](https://play.google.com/store/apps/details?id=com.bancodeguayaquil) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/226)
- [PICHINCHA BANCA MÓVIL](https://play.google.com/store/apps/details?id=com.yellowpepper.pichincha) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/645)

### Egypt

- [CIB Mobile Banking App](https://play.google.com/store/apps/details?id=com.cibeg.ddc1.digitalbanking.live) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/591)
- ~~[NBE Mobile](https://play.google.com/store/apps/details?id=com.ofss.obdx.and.nbe.com.eg)~~ - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/459)

### Estonia

- [Swedbank Eestis](https://play.google.com/store/apps/details?id=com.swedbank) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/540)

### Finland

- [Aktia Mobile Bank](https://play.google.com/store/apps/details?id=com.aktia.mobilebank) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/775)
- [Holvi – Business banking](https://play.google.com/store/apps/details?id=com.holvi.app) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/578)
- [Morrow Bank](https://play.google.com/store/apps/details?id=com.komplettbank.mobile_app) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/755)
- [MyEdenred](https://play.google.com/store/apps/details?id=com.edenred.eq.myedenred) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/652)
- [Nordea ID](https://play.google.com/store/apps/details?id=com.nordea.mobiletoken) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/280)
- [OP-mobiili](https://play.google.com/store/apps/details?id=fi.op.android.opmobiili) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/479)
- [POP Mobiili](https://play.google.com/store/apps/details?id=fi.poppankki.popmobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/480)
- ~~[POP Avain -tunnuslukusovellus](https://play.google.com/store/apps/details?id=fi.poppankki.avain)~~ - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/481)
- [S-mobiili](https://play.google.com/store/apps/details?id=fi.spankki) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/43)

### France

- [Banque Populaire](https://play.google.com/store/apps/details?id=fr.banquepopulaire.cyberplus) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/473)
- [Banxo](https://play.google.com/store/apps/details?id=com.caisseepargne.android.mobilebanking) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/215)
- [BoursoBank](https://play.google.com/store/apps/details?id=com.boursorama.android.clients) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/147)
- [CIC banque: Compte & Assurance](https://play.google.com/store/apps/details?id=com.cic_prod.bad) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/526)
- [CIC Pay : paiement mobile](https://play.google.com/store/apps/details?id=com.ei.payment.app.cic) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/527)
- [Credit Coopératif](https://play.google.com/store/apps/details?id=com.credit_coop.android.mobilebanking) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/232)
- [Crédit Mutuel Banque en ligne](https://play.google.com/store/apps/details?id=com.cm_prod.bad) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/613)
- [Crédit Mutuel de Bretagne](https://play.google.com/store/apps/details?id=com.arkea.android.application.cmb) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/150)
- [Fortuneo, ma Banque & Bourse](https://play.google.com/store/apps/details?id=com.fortuneo.android) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/208)
- [France Identité](https://play.google.com/store/apps/details?id=fr.gouv.franceidentite) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/664)
- [Hello bank!](https://play.google.com/store/apps/details?id=fr.bnpp.digitalbanking) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/163)
- [L'Appli SG](https://play.google.com/store/apps/details?id=mobi.societegenerale.mobile.lappli) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/407)
- [La Banque Postale](https://play.google.com/store/apps/details?id=com.fullsix.android.labanquepostale.accountaccess) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/14)
- [Ma Banque](https://play.google.com/store/apps/details?id=fr.creditagricole.androidapp) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/73)
- [Mes Comptes BNP Paribas](https://play.google.com/store/apps/details?id=net.bnpparibas.mescomptes) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/165)
- [Mes Comptes - LCL](https://play.google.com/store/apps/details?id=fr.lcl.android.customerarea) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/196)
  - Secure app spawning must be disabled for this app to run!
- [Nickel - An account for all](https://play.google.com/store/apps/details?id=com.fpe.comptenickel) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/631)
- [Qonto - Business Finance App](https://play.google.com/store/apps/details?id=eu.qonto.qonto) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/548)

### Germany

- [1822direkt Banking](https://play.google.com/store/apps/details?id=de.direkt1822.banking) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/167)
- [1822direkt QRTAN+](https://play.google.com/store/apps/details?id=de.direkt1822.qrtanplus) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/438)
- [1822TAN+](https://play.google.com/store/apps/details?id=de.direkt1822.tanplus) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/368)
- [apoTAN](https://play.google.com/store/apps/details?id=com.apobank_apotanplus) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/428)
- [BISON - Buy Bitcoin & Co](https://play.google.com/store/apps/details?id=de.bisonapp) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/605)
- [BW Mobilbanking Phone + Tablet](https://play.google.com/store/apps/details?id=com.starfinanz.smob.android.bwmobilbanking) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/523)
- [BW pushTAN pushTAN der BW-Bank](https://play.google.com/store/apps/details?id=com.starfinanz.mobile.android.bwpushtan) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/524)
- [C24 Bank](https://play.google.com/store/apps/details?id=de.c24.bankapp) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/380)
- [comdirect](https://play.google.com/store/apps/details?id=de.comdirect.app) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/348)
- [comdirect photoTAN App](https://play.google.com/store/apps/details?id=com.comdirect.phototan) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/349)
- [Commerzbank Banking](https://play.google.com/store/apps/details?id=de.commerzbanking.mobil) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/22)
- [Commerzbank photoTAN](https://play.google.com/store/apps/details?id=com.commerzbank.photoTAN) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/810)
  - App2App functionality doesn't work.
- [Consorsbank SecurePlus](https://play.google.com/store/apps/details?id=com.kobil.consors) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/168)
- [Deutsche Bank Mobile](https://play.google.com/store/apps/details?id=com.db.pwcc.dbmobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/38)
- [Digitales Bezahlen](https://play.google.com/store/apps/details?id=de.fiduciagad.android.wlwallet) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/160)
- [DKB](https://play.google.com/store/apps/details?id=com.dkbcodefactory.banking) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/106)
- [DKB-TAN2go](https://play.google.com/store/apps/details?id=com.starfinanz.mobile.android.dkbpushtan) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/279)
- [ElsterSecure - sicherer Login](https://play.google.com/store/apps/details?id=de.elster.elstersecure.app) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/353)
- [finanzen.net zero Aktien & ETF](https://play.google.com/store/apps/details?id=de.gratisbroker.android.mobileapp) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/321)
- [finanzen.net zero Secure TAN](https://play.google.com/store/apps/details?id=de.gratisbroker.android.securetan) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/322)
- [flatex next: Aktien und ETF](https://play.google.com/store/apps/details?id=de.xcom.flatexde) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/59)
- [FNZbanking](https://play.google.com/store/apps/details?id=com.ebase.banking) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/381)
- [GLS Banking](https://play.google.com/store/apps/details?id=de.gls.banking) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/344)
- [GLS mBank Classic](https://play.google.com/store/apps/details?id=de.gls.mbank) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/352)
- [Hanseatic Bank Mobile](https://play.google.com/store/apps/details?id=com.hanseaticbank.banking) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/686)
- [Hanseatic Bank Secure](https://play.google.com/store/apps/details?id=com.hanseaticbank.secure) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/687)
- [ING Banking to go](https://play.google.com/store/apps/details?id=de.ingdiba.bankingapp) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/48)
- [Kontist](https://play.google.com/store/apps/details?id=com.kontist) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/23)
- [KT Bank Mobile Banking](https://play.google.com/store/apps/details?id=de.kuveytturk.mobil) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/654)
- [N26 — Love your bank](https://play.google.com/store/apps/details?id=de.number26.android) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/21)
- [norisbank App](https://play.google.com/store/apps/details?id=com.db.mm.norisbank) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/425)
- [OLB appTAN](https://play.google.com/store/apps/details?id=de.olb.apptan) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/581)
- [Pay – Die Bezahl-App](https://play.google.com/store/apps/details?id=de.fiduciagad.android.vrwallet) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/35)
- [Penta — Business Banking App](https://play.google.com/store/apps/details?id=com.getpenta.app) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/24)
- [Postbank](https://play.google.com/store/apps/details?id=de.postbank.banking) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/575)
- [PSD Banking](https://play.google.com/store/apps/details?id=de.psd.banking.app) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/159)
- [Santander Banking](https://play.google.com/store/apps/details?id=de.santander.presentation) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/119)
- [Scalable Capital: ETF & Stocks](https://play.google.com/store/apps/details?id=capital.scalable.droid) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/567)
- [SecureGo+ Renault Bank direkt](https://play.google.com/store/apps/details?id=de.renaultbankdirekt.securego) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/439)
- [SecureGo plus](https://play.google.com/store/apps/details?id=de.fiduciagad.securego.wl) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/161)
- [SMARTBROKER+ Aktien & ETF](https://play.google.com/store/apps/details?id=de.smartbroker) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/394)
- [SpardaBanking App](https://play.google.com/store/apps/details?id=de.sparda.banking.app) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/552)
- [SpardaSecureApp](https://play.google.com/store/apps/details?id=de.sdvrz.ihb.mobile.secureapp.sparda.produktion) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/651)
- [SpardaSecureGo+](https://play.google.com/store/apps/details?id=de.sparda.securego) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/553)
- [Sparkasse Ihre mobile Filiale](https://play.google.com/store/apps/details?id=com.starfinanz.smob.android.sfinanzstatus) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/44)
- [S-pushTAN - sichere Freigaben](https://play.google.com/store/apps/details?id=com.starfinanz.mobile.android.pushtan) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/604)
- [SumUp Pay: mobile Finanzen](https://play.google.com/store/apps/details?id=com.sumup.pay) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/732)
- [TARGOBANK Mobile Banking](https://play.google.com/store/apps/details?id=com.targo_prod.bad) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/444)
- [TEO - Das neue Multibanking](https://play.google.com/store/apps/details?id=com.comeco.teo) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/650)
- [Tomorrow: Mobile Banking](https://play.google.com/store/apps/details?id=one.tomorrow.app) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/20)
- [Trade Republic: Broker & Bank](https://play.google.com/store/apps/details?id=de.traderepublic.app) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/395)
- [VR Banking - einfach sicher](https://play.google.com/store/apps/details?id=de.fiduciagad.banking.vr) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/36)
- [VR SecureGo plus](https://play.google.com/store/apps/details?id=de.fiduciagad.securego.vr) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/477)
- [VW Financial Services photoTAN](https://play.google.com/store/apps/details?id=com.vwfs.phototan) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/497)

### Ghana

- [SC Mobile Ghana](https://play.google.com/store/apps/details?id=com.breezeghana.ui) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/174)

### Greece

- [Eurobank Mobile App](https://play.google.com/store/apps/details?id=com.EurobankEFG) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/302)
- [myAlpha Mobile](https://play.google.com/store/apps/details/myAlpha_Mobile?id=com.mobileloft.alpha.droid) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/532)
- [NBG Mobile Banking](https://play.google.com/store/apps/details?id=mbanking.NBG) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/704)
- [winbank app)](https://play.google.com/store/apps/details?id=gr.winbank.mobile.redesign) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/301)

### Hong Kong

- [天星銀行Airstar Bank](https://play.google.com/store/apps/details?id=com.airstarbank.mobilebanking) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/708)
- [BOCHK中銀香港](https://play.google.com/store/apps/details?id=com.bochk.app.aos) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/482)
- ~~[DBS IDEAL Mobile](https://play.google.com/store/apps/details?id=com.dbs.ideal)~~ - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/494)
- [Hang Seng Personal Banking](https://play.google.com/store/apps/details?id=com.hangseng.rbmobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/529)
- [HSBC HK Mobile Banking](https://play.google.com/store/apps/details?id=hk.com.hsbc.hsbchkmobilebanking) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/303)
- [inMotion by CNCBI](https://play.google.com/store/apps/details?id=com.citic.inmotion) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/483)
- [OCBC Hong Kong](https://play.google.com/store/apps/details?id=com.winghang) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/484)
- [Octopus](https://play.google.com/store/apps/details?id=com.octopuscards.nfc_reader) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/485)

### Hungary

- [George Magyarország](https://play.google.com/store/apps/details?id=pegasus.project.ebh.mobile.android.bundle.mobilebank) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/673)
- [K&H mobilbank](https://play.google.com/store/apps/details?id=hu.khb) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/448)
- [MagNet MobilBank](https://play.google.com/store/apps/details?id=hu.netbank.netbankdroid) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/677)
- [my Raiffeisen mobile app](https://play.google.com/store/apps/details?id=com.rbinternational.retail.mobileapp) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/668)
- [OTP Bank HU](https://play.google.com/store/apps/details?id=hu.otpbank.mobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/245)
- [Simple Classic #MakeItEasy](https://play.google.com/store/apps/details?id=com.otpmobil.simple) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/263)
- [UniCredit mBanking](https://play.google.com/store/apps/details?id=hr.asseco.android.jimba.mUCI.hu) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/87)

### Iceland

- [Arion banki](https://play.google.com/store/apps/details?id=is.arionbanki.android) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/616)
- [indó](https://play.google.com/store/apps/details?id=is.indo.android) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/615)
- [Landsbankinn](https://play.google.com/store/apps/details?id=is.landsbankinn.personal) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/456)

### India

- [Axis Mobile: Pay, Invest & UPI](https://play.google.com/store/apps/details?id=com.axis.mobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/139)
- [Bajaj Finserv: UPI,Loan,FD,MF](https://play.google.com/store/apps/details?id=org.altruist.BajajExperia) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/340)
- [BHIM - MAKING INDIA CASHLESS](https://play.google.com/store/apps/details?id=in.org.npci.upiapp) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/135)
- [BHIM PNB](https://play.google.com/store/apps/details?id=com.mgs.pnbupi) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/337)
- [BHIM SBI Pay:Retail & Business](https://play.google.com/store/apps/details?id=com.sbi.upi) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/338)
- [bob World:Banking & Experience](https://play.google.com/store/apps/details?id=com.bankofbaroda.mconnect) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/724)
- [BOI Mobile](https://play.google.com/store/apps/details?id=com.boi.ua.android) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/329)
- [Cent Mobile](https://play.google.com/store/apps/details?id=com.infrasofttech.CentralBank) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/142)
- ~~[HDFC Bank App (Early Access)](https://play.google.com/store/apps/details?id=com.hdfcbank.android.now)~~ - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/799)
- [HDFC Bank Digital Rupee](https://play.google.com/store/apps/details?id=org.npci.token.hdfc) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/723)
- [HDFC Bank MobileBanking App](https://play.google.com/store/apps/details?id=com.snapwork.hdfc) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/138)
- [IDFC FIRST Bank: MobileBanking](https://play.google.com/store/apps/details?id=com.idfcfirstbank.optimus) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/339)
- [iMobile Pay: Banking, UPI](https://play.google.com/store/apps/details?id=com.csam.icici.bank.imobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/296)
- [IndOASIS Indian Bank MobileApp](https://play.google.com/store/apps/details?id=com.IndianBank.IndOASIS) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/293)
- [Kotak Mobile Banking App](https://play.google.com/store/apps/details?id=com.msf.kbank.mobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/137)
- [Paytm: Secure UPI Payments](https://play.google.com/store/apps/details?id=net.one97.paytm) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/140)
- [PhonePe UPI, Payment, Recharge](https://play.google.com/store/apps/details?id=com.phonepe.app) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/134)
- [PNB ONE](https://play.google.com/store/apps/details?id=com.Version1) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/328)
- [slice](https://play.google.com/store/apps/details?id=indwin.c3.shareapp) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/583)
- [Vyom - Union Bank of India](https://play.google.com/store/apps/details?id=com.infrasoft.uboi) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/141)
- [YONO SBI: Banking & Lifestyle](https://play.google.com/store/apps/details?id=com.sbi.lotusintouch) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/79)
- [Yono Lite SBI - Mobile Banking](https://play.google.com/store/apps/details?id=com.sbi.SBIFreedomPlus) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/327)

### Indonesia

- [BCA Mobile](https://play.google.com/store/apps/details?id=com.bca) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/306)
- [OCBC mobile Indonesia](https://play.google.com/store/apps/details?id=com.ocbcnisp.onemobileapp) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/765)
- [Permata ME](https://play.google.com/store/apps/details?id=net.myinfosys.PermataMobileX) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/764)

### Ireland

- [AIB Mobile](https://play.google.com/store/apps/details?id=aib.ibank.android) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/202)
- [Bank of Ireland Mobile Banking](https://play.google.com/store/apps/details?id=com.bankofireland.mobilebanking) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/389)

### Israel

- [bit ביט](https://play.google.com/store/apps/details?id=com.bnhp.payments.paymentsapp) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/221)
- [הבנק הבינלאומי](https://play.google.com/store/apps/details?id=com.fibi.nativeapp) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/564)
- [כאל- הטבות, מידע, אשראי](https://play.google.com/store/apps/details?id=com.onoapps.cal4u) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/217)
- [ישראכרט - ארנקים, אשראי והטבות](https://play.google.com/store/apps/details?id=com.isracard.hatavot) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/219)
- [max](https://play.google.com/store/apps/details?id=com.ideomobile.leumicard) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/218)
- [פייבוקס ארנק דיגיטלי - PayBox](https://play.google.com/store/apps/details?id=com.payboxapp) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/220)
- [בנק דיסקונט](https://play.google.com/store/apps/details?id=com.ideomobile.discount) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/223)

### Italy

- [Banca Etica](https://play.google.com/store/apps/details?id=it.bancaetica.bank) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/739)
- [BBVA Italia | Banca Online](https://play.google.com/store/apps/details?id=com.bbva.italy) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/374)
- [BNL](https://play.google.com/store/apps/details?id=it.bnl.apps.banking) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/144)
- [Fineco](https://play.google.com/store/apps/details?id=com.fineco.it) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/131)
- [HYPE](https://play.google.com/store/apps/details?id=it.hype.app) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/264)
- [illimity](https://play.google.com/store/apps/details?id=com.illimity.mobile.rtl) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/281)
- [Inbank](https://play.google.com/store/apps/details?id=it.phoenixspa.inbank) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/811)
- [ING Italia](https://play.google.com/store/apps/details?id=it.ingdirect.app) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/547)
- [Intesa Sanpaolo Mobile](https://play.google.com/store/apps/details?id=com.latuabancaperandroid) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/197)
- [isybank](https://play.google.com/store/apps/details?id=com.intesasanpaolo.isybank.mobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/718)
- [Mediolanum](https://play.google.com/store/apps/details?id=com.mediolanum.android.fullbanca) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/720)
- [Mobile Banking UniCredit](https://play.google.com/store/apps/details?id=com.unicredit) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/431)
- [Satispay](https://play.google.com/store/apps/details?id=com.satispay.customer) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/282)
- [Sella](https://play.google.com/store/apps/details?id=com.sella.BancaSella) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/741)
- [Webank - Conto online](https://play.google.com/store/apps/details?id=com.opentecheng.android.webank) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/796)
- [YouApp – Banco BPM Mobile](https://play.google.com/store/apps/details?id=com.lynxspa.bancopopolare) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/284)

### Japan

- [AEON Wallet](https://play.google.com/store/apps/details?id=jp.co.aeon.credit.android.wallet) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/467)
- [iDアプリ （MVNO/SIMロックフリー端末版）](https://play.google.com/store/apps/details?id=jp.id_credit_sp2.android) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/551)
- [iAEON](https://play.google.com/store/apps/details?id=jp.co.aeonst.app.myaeon) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/468)
- [Japan Post Bank Authenticator](https://play.google.com/store/apps/details?id=jp.japanpost.jp_bank.FIDOapp) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/464)
- [Japan Post Bank Passbook](https://play.google.com/store/apps/details?id=jp.japanpost.jp_bank.bankbookapp) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/463)
- [住信SBIネット銀行 - NEOBANK](https://play.google.com/store/apps/details?id=jp.co.netbk) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/669)
  - Secure app spawning must be disabled for this app to run!
- [PayPay-ペイペイ](https://play.google.com/store/apps/details?id=jp.ne.paypay.android.app) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/367)
- [三菱ＵＦＪ銀行](https://play.google.com/store/apps/details?id=jp.mufg.bk.applisp.app) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/364)
- [三井住友銀行アプリ](https://play.google.com/store/apps/details?id=jp.co.smbc.direct) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/370)

### Kazakhstan

- [Kaspi.kz суперприложение](https://play.google.com/store/apps/details?id=kz.kaspi.mobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/149)

### Latvia

- [Swedbank Latvia](https://play.google.com/store/apps/details?id=lv.swedbank.mobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/742)

### Luxembourg

- [LuxTrust Mobile](https://play.google.com/store/apps/details?id=com.LuxTrustMobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/700)
- [S-Net Mobile](https://play.google.com/store/apps/details?id=lu.bcee.snetmobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/211)

### Lithuania

- [Artea](https://play.google.com/store/apps/details?id=lt.sb.mobileapp) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/711)
- ~~[Paysera Super App](https://play.google.com/store/apps/details?id=lt.lemonlabs.android.paysera)~~ - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/758)
- [Swedbank Lietuva](https://play.google.com/store/apps/details?id=lt.swedbank.mobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/244)

### Macau

- [BNU](https://play.google.com/store/apps/details?id=com.bnu.mba) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/541)
- [BOC Macau](https://play.google.com/store/apps/details?id=com.bocmacau.com) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/542)

### Malaysia

- [CIMB Clicks Malaysia](https://play.google.com/store/apps/details?id=com.cimbmalaysia) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/246)
- [MAE by Maybank2u](https://play.google.com/store/apps/details?id=com.maybank2u.life) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/247)
- [Maybank2u MY](https://play.google.com/store/apps/details?id=my.com.maybank2u.m2umobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/248)
- [Touch 'n Go eWallet](https://play.google.com/store/apps/details?id=my.com.tngdigital.ewallet) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/249)

### Mexico

- [App Banamex](https://play.google.com/store/apps/details?id=com.citibanamex.banamexmobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/612)
- [BBVA México](https://play.google.com/store/apps/details?id=com.bancomer.mbanking) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/607)
- [Klar: Crédito, Cuenta y Ahorro](https://play.google.com/store/apps/details?id=mx.klar.app) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/498)
- [Mercado Pago: cuenta digital](https://play.google.com/store/apps/details?id=com.mercadopago.wallet) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/503)
- [Nu](https://play.google.com/store/apps/details?id=com.nu.production) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/92)
- [Vexi](https://play.google.com/store/apps/details?id=mx.vexi.appmovil) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/608)

### Moldova

- [maibank](https://play.google.com/store/apps/details?id=md.maib.maibank) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/786)

### Netherlands

- [ABN AMRO](https://play.google.com/store/apps/details?id=com.abnamro.nl.mobile.payments) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/108)
- [ASN Bank (De Volksbank)](https://play.google.com/store/apps/details?id=nl.devolksbank.asn.bankieren) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/105)
- [bunq](https://play.google.com/store/apps/details?id=com.bunq.android) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/656)
- [DEGIRO: Stock Trading App](https://play.google.com/store/apps/details?id=nl.degiro.trader) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/538)
- [ING Bankieren](https://play.google.com/store/apps/details?id=com.ing.mobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/182)
- [Knab Bankieren](https://play.google.com/store/apps/details?id=bvm.bvmapp) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/812)
- [Rabobank](https://play.google.com/store/apps/details?id=nl.rabomobiel) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/47)
- [Regio Bank (De Volksbank)](https://play.google.com/store/apps/details?id=nl.devolksbank.regio.bankieren) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/450)
- [SNS Bank (De Volksbank)](https://play.google.com/store/apps/details?id=nl.devolksbank.sns.bankieren) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/451)
- [Triodos Bankieren NL](https://play.google.com/store/apps/details?id=com.triodos.bankingnl) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/133)

### New Zealand

- [ANZ goMoney New Zealand](https://play.google.com/store/apps/details?id=nz.co.anz.android.mobilebanking) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/556)
- [ASB Mobile Banking](https://play.google.com/store/apps/details?id=nz.co.asb.asbmobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/383)
- [Kiwibank Mobile Banking](https://play.google.com/store/apps/details?id=nz.co.kiwibank.mobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/555)
- [The Co-operative Bank (NZ)](https://play.google.com/store/apps/details?id=nz.co.cooperativebank) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/560)

### Norway

- [BankID](https://play.google.com/store/apps/details?id=no.vipps.bankid) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/255)
- [Bank Norwegian](https://play.google.com/store/apps/details?id=com.banknorwegian) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/95)
- [Bulder](https://play.google.com/store/apps/details?id=no.bulder.bank) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/725)
- [DNB](https://play.google.com/store/apps/details?id=no.apps.dnbnor) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/630)
- [Eika Mobilbank](https://play.google.com/store/apps/details?id=no.eika.mobilbank) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/256)
- [KLP Mobilbank](https://play.google.com/store/apps/details?id=com.evry.mobile.android.smartbankmobile.klpbank) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/385)
- [Kron - Investering for alle](https://play.google.com/store/apps/details?id=com.kronmobilapp) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/97)
- [Morrow Bank](https://play.google.com/store/apps/details?id=com.komplettbank.mobile_app) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/755)
- [Nordea Mobile - Norge](https://play.google.com/store/apps/details?id=no.nordea.mobilebank) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/452)
- [Nordnet: Stocks & Funds](https://play.google.com/store/apps/details?id=com.nordnet) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/99)
- [radicant: next-generation Bank](https://play.google.com/store/apps/details?id=com.radicant.bank) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/726)
- [Sbanken](https://play.google.com/store/apps/details?id=no.skandiabanken) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/96)
- [Spare](https://play.google.com/store/apps/details?id=no.dnb.spare) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/98)
- [SpareBank 1 Mobile Banking](https://play.google.com/store/apps/details?id=no.sparebank1.mobilbank) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/100)
- [Sparebanken Sogn og Fjordane](https://play.google.com/store/apps/details?id=no.kamikazemedia.android.ssf) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/312)
- [Sparebanken Vest](https://play.google.com/store/apps/details?id=no.spv.mobilbank) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/336)
- [Trumf Visa](https://play.google.com/store/apps/details?id=com.evry.android.cardcompanion.ngtv) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/101)
- ~~[Vipps](https://play.google.com/store/apps/details?id=no.dnb.vipps)~~ - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/74)

### Pakistan

- [digiBOP- Simple|Speedy|Secure](https://play.google.com/store/apps/details?id=com.digibop.mobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/634)
- [HBL Mobile](https://play.google.com/store/apps/details?id=com.hbl.android.hblmobilebanking) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/504)
- [JazzCash - Your Mobile Account](https://play.google.com/store/apps/details?id=com.techlogix.mobilinkcustomer) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/505)
- [SadaPay: Money made simple](https://play.google.com/store/apps/details?id=com.sadapay.app) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/506)

### Panama

- [Banca Móvil CA](https://play.google.com/store/apps/details?id=pa.com.cajaDeAhorrosBanking.icBanking.androidUI) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/813)
- [Banca Móvil de Banco General](https://play.google.com/store/apps/details?id=com.bgeneral) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/814)
- [Banesco PA](https://play.google.com/store/apps/details?id=com.banesco.banescomovilpa.tcmbpa.android) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/731)

### Peru

- [BBVA Perú](https://play.google.com/store/apps/details?id=com.bbva.nxt_peru) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/417)
- [Yape](https://play.google.com/store/apps/details?id=com.bcp.innovacxion.yapeapp) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/416)

### Philippines

- [BPI](https://play.google.com/store/apps/details?id=com.bpi.ng.app) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/601)
- [GCash](https://play.google.com/store/apps/details?id=com.globe.gcash.android) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/382)
- [GoTyme Bank](https://play.google.com/store/apps/details?id=ph.com.gotyme) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/510)
- [RCBCpulz](https://play.google.com/store/apps/details?id=com.rcbc.pulz) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/602)
- [Security Bank App](https://play.google.com/store/apps/details?id=com.securitybank.bbx) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/598)

### Poland

- [Alior Mobile](https://play.google.com/store/apps/details?id=pl.aliorbank.aib) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/735)
- [Bank Millennium](https://play.google.com/store/apps/details?id=wit.android.bcpBankingApp.millenniumPL) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/171)
- [IKO](https://play.google.com/store/apps/details?id=pl.pkobp.iko) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/25)
- [Kantor Walutowy Alior Banku](https://play.google.com/store/apps/details?id=pl.alior.mobile.exchange.prd) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/172)
- [mBank PL](https://play.google.com/store/apps/details?id=pl.mbank) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/136)
- [Moje ING mobile](https://play.google.com/store/apps/details?id=pl.ing.mojeing) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/169)
- [Nest Bank](https://play.google.com/store/apps/details?id=pl.nestbank.nestbank) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/576)
- [PeoPay](https://play.google.com/store/apps/details?id=softax.pekao.powerpay) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/298)
- [Santander Consumer Bank](https://play.google.com/store/apps/details?id=pl.santanderconsumer) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/577)
- [Santander mobile](https://play.google.com/store/apps/details?id=pl.bzwbk.bzwbk24) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/371)
- [VeloBank](https://play.google.com/store/apps/details?id=com.getingroup.mobilebanking) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/606)

### Portugal

- [App novobanco](https://play.google.com/store/apps/details?id=pt.novobanco.nbsmarter) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/579)
- [ActivoBank](https://play.google.com/store/apps/details?id=wit.android.bcpBankingApp.activoBank) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/300)
- [Bankinter Portugal](https://play.google.com/store/apps/details?id=com.bankinter.portugal.bmb) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/808)
- [Santander Portugal](https://play.google.com/store/apps/details?id=pt.santander.oneappparticulares) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/750)
- [BPI APP](https://play.google.com/store/apps/details?id=pt.bancobpi.mobile.fiabilizacao) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/736)
- [Caixadirecta Empresas](https://play.google.com/store/apps/details?id=pt.cgd.caixadirectaempresas) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/120)
- [Caixadirecta](https://play.google.com/store/apps/details?id=cgd.pt.caixadirectaparticulares) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/214)
- [CA Mobile](https://play.google.com/store/apps/details?id=ca.mobile.explorer) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/288)
- [MB WAY](https://play.google.com/store/apps/details?id=pt.sibs.android.mbway) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/289)
- [moey!](https://play.google.com/store/apps/details?id=pt.moey.app) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/378)
- [M24](https://play.google.com/store/apps/details?id=caixaeconomica.androidmobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/710)
- [Openbank – banca móvil](https://play.google.com/store/apps/details?id=es.openbank.mobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/240)

### Romania

- [Banca Transilvania](https://play.google.com/store/apps/details?id=ro.btrl.mobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/427)
- ~~[BT Pay](https://play.google.com/store/apps/details?id=ro.btrl.pay)~~ - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/83)
  - App falsely considers GrapheneOS to be rooted. Most users have success reaching out to customer support who will often restore access.
- [George Romania](https://play.google.com/store/apps/details?id=ro.bcr.georgego) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/179)
- [ING HomeBank](https://play.google.com/store/apps/details?id=ro.ing.mobile.banking.android.activity) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/356)
- [Libra Mobile Banking](https://play.google.com/store/apps/details?id=libra.mobile.banking) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/404)
- [Raiffeisen Smart Mobile](https://play.google.com/store/apps/details?id=ro.raiffeisen.smartmobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/86)
- [Salt Bank](https://play.google.com/store/apps/details?id=ro.digibank.app) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/655)

### Russia

- [Mir Pay](https://appgallery.huawei.com/app/C103191567) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/495)
- [VTB](https://www.vtb.ru/personal/online-servisy/vtb-online-android/) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/516)
- [Сбербанк (Sberbank)](https://appgallery.cloud.huawei.com/appdl/C100994843) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/517)
- [T-Bank](https://www.tbank.ru/apps/android-bank/) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/522)
- [Yandex Pay](https://play.google.com/store/apps/details?id=com.yandex.bank) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/518)
- [Райффайзен Онлайн Банк Россия](https://www.rustore.ru/catalog/app/ru.raiffeisennews) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/777)


### Serbia

- [Moja mBanka](https://play.google.com/store/apps/details?id=rs.Raiffeisen.mobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/70)
- ~~[RaiPay Raiffeisen bank Srbija](https://play.google.com/store/apps/details?id=rs.raiffeisen.raipay)~~ - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/702)

### Singapore

- [Amex Singapore](https://play.google.com/store/apps/details?id=com.americanexpress.android.acctsvcs.sg) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/590)
- ~~[BigPay – financial services](https://play.google.com/store/apps/details?id=com.tpaay.bigpay)~~ - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/271)
- [Chocolate Finance](https://play.google.com/store/apps/details?id=com.chocolatefinance.app) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/585)
- [CIMB Clicks Singapore](https://play.google.com/store/apps/details?id=com.cimb.sg.clicksMobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/268)
- [Citibank SG](https://play.google.com/store/apps/details?id=com.citibank.mobile.sg) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/267)
- [DBS digibank - wealth](https://play.google.com/store/apps/details?id=com.dbs.sg.iwealth) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/183)
- [DBS IDEAL Mobile](https://play.google.com/store/apps/details?id=com.dbs.ideal) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/494)
- [DBS PayLah!](https://play.google.com/store/apps/details?id=com.dbs.dbspaylah) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/584)
- [Grab - Taxi & Food Delivery](https://play.google.com/store/apps/details?id=com.grabtaxi.passenger) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/316)
- [GXS Bank](https://play.google.com/store/apps/details?id=sg.com.gxs.app) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/315)
- [iChange](https://play.google.com/store/apps/details?id=com.iapps.slide.userapp.ichange) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/320)
- [Instarem: Send money overseas](https://play.google.com/store/apps/details?id=com.instarem.mobileapp) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/272)
- [MariBank](https://play.google.com/store/apps/details?id=sg.com.maribankmobile.digitalbank) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/586)
- [OCBC Business](https://play.google.com/store/apps/details?id=com.ocbc.mobilebv) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/587)
- [OCBC Digital - Mobile Banking](https://play.google.com/store/apps/details?id=com.ocbc.mobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/146)
- [SC Mobile Singapore](https://play.google.com/store/apps/details?id=air.app.scb.breeze.android.main.sg.prod) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/762)
- [SFL Go](https://play.google.com/store/apps/details?id=sg.sfl.ib) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/273)
- [SIF Mobile](https://play.google.com/store/apps/details?id=com.sif.retailbanking) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/270)
- [Trust Bank SG](https://play.google.com/store/apps/details?id=sg.trust) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/589)

### Slovakia

- [365.bank](https://play.google.com/store/apps/details?id=bank.sk365.app) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/326)
- [Fio Smartbanking SK](https://play.google.com/store/apps/details?id=sk.fio.sb2) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/513)
- [George Slovakia](https://play.google.com/store/apps/details?id=sk.slsp.georgego) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/343)
- [mBank SK](https://play.google.com/store/apps/details?id=sk.mbank) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/563)
- [SmartBanking](https://play.google.com/store/apps/details?id=com.zentity.sbank.csobsk) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/713)
- [Tatra banka](https://play.google.com/store/apps/details?id=sk.tb.ib.tatraandroid) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/325)
- [VÚB Mobile Banking](https://play.google.com/store/apps/details/V%C3%9AB_Mobile_Banking?id=sk.vub.mobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/633)

### Slovenia

- [DH Denarnik](https://play.google.com/store/apps/details?id=si.delavskahranilnica.dhdenarnik) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/178)
- [DH Mobilni](https://play.google.com/store/apps/details?id=com.hrc.eb.mobile.android.hibismobiledh) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/177)
- [INTESA SANPAOLO BANK MOBILE](https://play.google.com/store/apps/details?id=hr.asseco.android.intesa.isbd.isps) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/747)
- [NLB Klik Slovenia](https://play.google.com/store/apps/details?id=co.infinum.nlb) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/782)
- [NLB Pay](https://play.google.com/store/apps/details?id=si.nlbpay.slovenija) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/783)

### South Africa

- [Standard Bank / Stanbic Bank](https://play.google.com/store/apps/details?id=com.sbg.mobile.phone) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/797)

### South Korea

- [PAYCO](https://play.google.com/store/apps/details?id=com.nhnent.payapp) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/262)
- [SC Mobile Banking](https://play.google.com/store/apps/details?id=com.scbank.ma30) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/543)
  - Secure app spawning must be disabled for this app to run!
- [하나은행, 하나원큐는 돈기운 가득한 은행 앱](https://play.google.com/store/apps/details?id=com.kebhana.hanapush) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/259)
- [웰컴디지털뱅크(웰컴저축은행)](https://play.google.com/store/apps/details?id=kr.co.welcomebank.omb) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/260)
- [우리은행 우리WON뱅킹](https://play.google.com/store/apps/details?id=com.wooribank.smart.npib) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/261)
- [토스](https://play.google.com/store/apps/details?id=viva.republica.toss) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/432)
- [KB국민은행 스타뱅킹](https://play.google.com/store/apps/details?id=com.kbstar.kbbank) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/433)
- [신한 SOL뱅크-신한은행 스마트폰 뱅킹](https://play.google.com/store/apps/details?id=com.shinhan.sbanking) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/434)
- [삼성카드](https://play.google.com/store/apps/details?id=kr.co.samsungcard.mpocket) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/435)
- [네이버페이](https://play.google.com/store/apps/details?id=com.naverfin.payapp) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/436)
- [우체국뱅킹](https://play.google.com/store/apps/details?id=com.epost.psf.sdsi) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/544)
- [미래에셋증권 M-STOCK](https://play.google.com/store/apps/details?id=com.miraeasset.trade) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/545)
  - Secure app spawning must be disabled for this app to run!
- [현대카드](https://play.google.com/store/apps/details?id=com.hyundaicard.appcard) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/546)
  - Secure app spawning must be disabled for this app to run!
- [카카오뱅크](https://play.google.com/store/apps/details?id=com.kakaobank.channel) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/763)
- [카카오페이](https://play.google.com/store/apps/details?id=com.kakaopay.app) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/776)
  
### Spain

- [ABANCA - Mobile Banking](https://play.google.com/store/apps/details?id=com.abanca.bancamovil.particulares) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/749)
- [Banca March](https://play.google.com/store/apps/details?id=com.bancamarch.bancamovil) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/372)
- [Banco Sabadell App](https://play.google.com/store/apps/details?id=net.inverline.bancosabadell.officelocator.android) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/257)
- [Banco Santander](https://play.google.com/store/apps/details?id=es.bancosantander.apps) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/390)
- [BBVA Spain | Online Banking](https://play.google.com/store/apps/details?id=com.bbva.bbvacontigo) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/213)
- [B100 - The Healthy Banking](https://play.google.com/store/apps/details?id=es.b100.app) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/714)
- [CaixaBankNow](https://play.google.com/store/apps/details?id=es.lacaixa.mobile.android.newwapicon) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/355)
- [CaixaBank Sign - Digital sign](https://play.google.com/store/apps/details?id=es.caixabank.caixabanksign) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/354)
- [Caja Ingenieros Banca MÓVIL](https://play.google.com/store/apps/details?id=com.cajaingenieros.android.bancamovil) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/496)
- [EVO Banco móvil](https://play.google.com/store/apps/details?id=es.evobanco.bancamovil) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/112)
- [Openbank – banca móvil](https://play.google.com/store/apps/details?id=es.openbank.mobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/240)
- [Unicaja | Banca Online](https://play.google.com/store/apps/details?id=es.unicajabanco.app) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/715)

### Sweden

- [Amex SE](https://play.google.com/store/apps/details?id=com.americanexpress.android.acctsvcs.se) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/384)
- [Avanza](https://play.google.com/store/apps/details?id=se.avanzabank.androidapplikation) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/11)
- [BankID security app](https://play.google.com/store/apps/details?id=com.bankid.bus) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/8)
- [Handelsbanken SE - Privat](https://play.google.com/store/apps/details?id=com.handelsbanken.mobile.android) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/324)
- [ICA Banken](https://play.google.com/store/apps/details?id=se.icabanken) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/365)
- [Kivra Sweden](https://play.google.com/store/apps/details?id=com.kivra.Kivra) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/193)
- [Länsförsäkringar](https://play.google.com/store/apps/details?id=se.lf.mobile.android) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/91)
- [Mobilbank SE — Danske Bank](https://play.google.com/store/apps/details?id=com.danskebank.mobilebank3.se) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/4)
- [Morrow Bank](https://play.google.com/store/apps/details?id=com.komplettbank.mobile_app) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/755)
- [Nordea Mobile - Sweden](https://play.google.com/store/apps/details?id=se.nordea.mobilebank) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/9)
- [Nordnet: Stocks & Funds](https://play.google.com/store/apps/details?id=com.nordnet) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/363)
- [SBAB](https://play.google.com/store/apps/details?id=se.sbab.bankapp) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/362)
- [SEB](https://play.google.com/store/apps/details?id=se.seb.privatkund) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/361)
- [Swedbank plånbok!](https://play.google.com/store/apps/details?id=com.payair.converged.swed) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/530)
- [Swedbank private](https://play.google.com/store/apps/details?id=se.swedbank.mobil) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/12)
- [Swish payments](https://play.google.com/store/apps/details?id=se.bankgirot.swish) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/6)

### Switzerland

- [ABS Mobile Banking](https://play.google.com/store/apps/details?id=com.abs.android.mbanking) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/233)
- [ABS TWINT](https://play.google.com/store/apps/details?id=ch.abs.twint) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/569)
- [Airlock 2FA](https://play.google.com/store/apps/details?id=com.airlock.iam.a2fa) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/229)
- [Alpian - Banking & Investing](https://play.google.com/store/apps/details?id=com.alpian.alpian) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/515)
- [BCN Mobile banking](https://play.google.com/store/apps/details?id=com.bcn.android.mbanking) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/145)
- [BCV Mobile](https://play.google.com/store/apps/details?id=ch.bcv.mobile.android) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/231)
- [BKB Digital Banking](https://play.google.com/store/apps/details?id=ch.bkb.digital.banking.android) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/788)
- [Cembra App](https://play.google.com/store/apps/details?id=ch.cembra.cmf) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/639)
  - Secure app spawning must be disabled for this app to run!
- [Credit Suisse – CSX](https://play.google.com/store/apps/details?id=com.csg.cs.dnmb) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/72)
- [debiX+](https://play.google.com/store/apps/details?id=com.sixgroup.debixplus) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/227)
- [Migros Bank E-Banking](https://play.google.com/store/apps/details?id=ch.migrosbank.android) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/582)
- [neon - your account app](https://play.google.com/store/apps/details?id=com.neonbanking.app) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/207)
- [PostFinance App](https://play.google.com/store/apps/details?id=ch.postfinance.android) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/414)
  - Secure app spawning must be disabled for this app to run!
- [Prepaid TWINT & other banks](https://play.google.com/store/apps/details?id=ch.twint.payment) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/228)
- [Raiffeisen E-Banking](https://play.google.com/store/apps/details?id=ch.raiffeisen.android) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/26)
- [Raiffeisen PhotoTAN](https://play.google.com/store/apps/details?id=ch.raiffeisen.phototan) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/618)
- [Raiffeisen TWINT](https://play.google.com/store/apps/details?id=ch.raiffeisen.twint) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/617)
- [Swissquote](https://play.google.com/store/apps/details?id=com.swissquote.android) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/471)
  - This app officially supports GrapheneOS!
- [UBS Access: Secure login](https://play.google.com/store/apps/details?id=com.ubs.swidK2Y.android) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/508)
- [UBS TWINT](https://play.google.com/store/apps/details/UBS_TWINT?id=com.ubs.Paymit.android) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/507)
- [UBS & UBS key4](https://play.google.com/store/apps/details?id=com.ubs.swidKXJ.android) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/493)
- [ZKB Access](https://play.google.com/store/apps/details?id=ch.zkb.digipass) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/94)
- [ZKB Mobile Banking](https://play.google.com/store/apps/details?id=ch.zkb.slv.mobile.client.android) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/93)
- [Yuh - Your App. Your Money.](https://play.google.com/store/apps/details?id=com.yuh) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/509)
  - This app officially supports GrapheneOS!

### Taiwan

- [彰銀行動銀行ChaiBo](https://play.google.com/store/apps/details?id=com.chb.mobile.pmb) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/626)
- [彰銀行動網](https://play.google.com/store/apps/details?id=com.chb.mobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/625)
- [行動郵局](https://play.google.com/store/apps/details?id=tw.gov.post.mpost) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/624)
- [國泰世華 行動銀行](https://play.google.com/store/apps/details?id=com.cathaybk.mymobibank.android) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/29)
- [e動郵局](https://play.google.com/store/apps/details?id=com.mitake.android.epost) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/27)
- [一卡通 iPASS MONEY](https://play.google.com/store/apps/details?id=com.ipass.ipassmoney) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/632)
- ~~[中國信託行動銀行 Home Bank](https://play.google.com/store/apps/details?id=com.chinatrust.mobilebank)~~ - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/30)
- [將來銀行 NEXT BANK](https://play.google.com/store/apps/details?id=com.nextbank.ncbportal) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/627)
- [台新銀行 「行動銀行」](https://play.google.com/store/apps/details?id=tw.com.taishinbank.mobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/28)
- ~~[兆豐銀行](https://play.google.com/store/apps/details?id=tw.com.megabank.mobilebank.pre)~~ - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/716)

### Thailand

- [Bangkok Bank Mobile Banking](https://play.google.com/store/apps/details?id=com.bbl.mobilebanking) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/406)
- [K PLUS](https://play.google.com/store/apps/details?id=com.kasikorn.retail.mbanking.wap) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/265)
- ~~[krungsri](https://play.google.com/store/apps/details?id=com.krungsri.kma)~~ - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/771)
- ~~[Krungthai NEXT](https://play.google.com/store/apps/details?id=ktbcs.netbank)~~ - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/770)
- ~~[SCB Easy](https://play.google.com/store/apps/details?id=com.scb.phone)~~ - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/195)
- [ShopeePay](https://play.google.com/store/apps/details?id=com.beeasy.airpay) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/335)
- [TrueMoney - Pay & Earn Coins](https://play.google.com/store/apps/details?id=th.co.truemoney.wallet) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/784)
- [UOB TMRW Thailand](https://play.google.com/store/apps/details?id=com.uob.mightyth2) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/333)

### Turkey

- [Enpara.com Cep Şubesi](https://play.google.com/store/apps/details?id=finansbank.enpara) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/707)
- [İşCep: Banking & Finance](https://play.google.com/store/apps/details?id=com.pozitron.iscep) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/611)

### Ukraine

- [Ощад](https://play.google.com/store/apps/details?id=ua.oschadbank.flumo) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/539)
- [Privat24](https://play.google.com/store/apps/details?id=ua.privatbank.ap24) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/124)
- [monobank — банк у телефоні](https://play.google.com/store/apps/details?id=com.ftband.mono) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/323)

### United Arab Emirates

- [ADCB](https://play.google.com/store/apps/details?id=com.adcb.bank) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/123)
- [DIB alt mobile banking](https://play.google.com/store/apps/details?id=com.dib.app) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/662)
- [EI +](https://play.google.com/store/apps/details?id=com.emiratesislamic.android) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/660)
- [ENBD X](https://play.google.com/store/apps/details?id=com.emiratesnbd.android) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/534)
- ~~[FAB Mobile](https://play.google.com/store/apps/details?id=com.fab.personalbanking)~~ - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/180)
- [HSBC UAE](https://play.google.com/store/apps/details?id=ae.hsbc.hsbcuae) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/533)
- [Wio Personal](https://play.google.com/store/apps/details?id=io.wio.retail) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/659)

### United Kingdom

- ~~[AIB (NI) Mobile](https://play.google.com/store/apps/details?id=ftb.ibank.android)~~ - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/734)
- [Amex United Kingdom](https://play.google.com/store/apps/details?id=com.americanexpress.android.acctsvcs.uk) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/40)
- ~~[Bank of Scotland Mobile App](https://play.google.com/store/apps/details?id=com.grppl.android.shell.BOS)~~ - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/243)
- ~~[Barclaycard](https://play.google.com/store/apps/details?id=com.barclays.bca)~~ - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/42)
- ~~[Barclays](https://play.google.com/store/apps/details?id=com.barclays.android.barclaysmobilebanking)~~ - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/341)
  - This app only runs in the owner profile!
- [Capital On Tap](https://play.google.com/store/apps/details?id=com.cot.app) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/424)
- [Chase UK](https://play.google.com/store/apps/details?id=com.chase.intl) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/69)
- [Chip - Savings and Investments](https://play.google.com/store/apps/details?id=to.chip.app) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/440)
- [Coventry Building Society](https://play.google.com/store/apps/details?id=com.cbs.prod) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/423)
- [Cynergy Bank Authenticator](https://play.google.com/store/apps/details?id=co.uk.cynergybank.authenticator) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/447)
- [The Co-operative Bank](https://play.google.com/store/apps/details?id=com.cooperativebank.bank) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/205)
- [first direct](https://play.google.com/store/apps/details?id=com.firstdirect.bankingonthego) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/128)
- ~~[Halifax Mobile Banking](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/309)~~ - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/309)
- [HSBC UK Mobile Banking](https://play.google.com/store/apps/details?id=uk.co.hsbc.hsbcukmobilebanking) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/33)
- [InvestEngine: ETF Investing](https://play.google.com/store/apps/details?id=com.investengine.app) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/620)
- [Kroo Bank - Mobile Banking](https://play.google.com/store/apps/details?id=com.bsocial) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/449)
- ~~[Lloyds Bank Mobile Banking](https://play.google.com/store/apps/details?id=com.grppl.android.shell.CMBlloydsTSB73)~~ - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/53)
- [Marcus by Goldman Sachs®](https://play.google.com/store/apps/details?id=com.marcus.android) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/212)
- ~~[MBNA Mobile App](https://play.google.com/store/apps/details?id=uk.co.mbna.cardservices.android)~~ - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/537)
- [Monzo Bank - Mobile Banking](https://play.google.com/store/apps/details?id=co.uk.getmondo) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/58)
- [Metro Bank](https://play.google.com/store/apps/details?id=uk.co.metrobankonline.mobile.android.production) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/209)
- [M&S Banking](https://play.google.com/store/apps/details?id=com.mns.mnsuk.android) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/695)
- [Nationwide Banking App](https://play.google.com/store/apps/details?id=co.uk.Nationwide.Mobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/332)
- [NatWest Mobile Banking](https://play.google.com/store/apps/details?id=com.rbs.mobile.android.natwest) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/34)
- [Nomo Bank](https://play.google.com/store/apps/details?id=com.nomo.bank.app) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/661)
- [Royal Bank of Scotland](https://play.google.com/store/apps/details?id=com.rbs.mobile.android.rbs) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/397)
- [Santander Mobile Banking](https://play.google.com/store/apps/details?id=uk.co.santander.santanderUK) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/635)
  - Secure app spawning must be disabled for this app to run!
- [Starling Bank - Mobile Banking](https://play.google.com/store/apps/details?id=com.starlingbank.android) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/39)
- ~~[Tesco Bank and Clubcard Pay+](https://play.google.com/store/apps/details?id=com.tescobank.mobile)~~ - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/129)
- [Tide – Mobile Business Banking](https://play.google.com/store/apps/details?id=com.tideplatform.banking) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/206)
- [Trading 212: Stocks, ETFs, ISA](https://play.google.com/store/apps/details?id=com.avuscapital.trading212) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/703)
- [Triodos Bank UK](https://play.google.com/store/apps/details?id=com.triodos.bankinguk) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/132)
- [TSB Mobile Banking](https://play.google.com/store/apps/details?id=uk.co.tsb.newmobilebank) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/143)
- [Ulster Bank NI Mobile Banking](https://play.google.com/store/apps/details?id=com.rbs.mobile.android.ubn) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/766)
- [Virgin Money Mobile Banking](https://play.google.com/store/apps/details?id=com.virginmoney.uk.mobile.android) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/54)
- [Zopa Bank](https://play.google.com/store/apps/details?id=com.zopa.zeos) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/442)

### United States

- [ADP Mobile Solutions](https://play.google.com/store/apps/details?id=com.adpmobile.android) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/559)
- [Alliant Mobile Banking](https://play.google.com/store/apps/details?id=org.alliant.mobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/85)
- [Ally: Banking & Investing](https://play.google.com/store/apps/details?id=com.ally.MobileBanking) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/113)
- [America First Mobile Banking](https://play.google.com/store/apps/details?id=com.afcu.mobilebanking) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/148)
- [AmeriCU Credit Union](https://play.google.com/store/apps/details?id=com.ifs.banking.fiid1561) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/767)
  - This app officially supports GrapheneOS!
- [Amex](https://play.google.com/store/apps/details?id=com.americanexpress.android.acctsvcs.us) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/125)
  - You can't mark your device as trusted so you will have to authenticate yourself with 2FA every time you open this app.
- [Axos All-In-One Mobile Banking](https://play.google.com/store/apps/details?id=com.axos.udb) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/430)
- [Bank of America Mobile Banking](https://play.google.com/store/apps/details?id=com.infonow.bofa) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/242)
- [BECU](https://play.google.com/store/apps/details?id=org.becu.androidapp) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/60)
- [Beneficial State Bank Mobile](https://play.google.com/store/apps/details?id=com.beneficialstatebank.mobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/574)
- [Betterment Invest & Save Money](https://play.google.com/store/apps/details?id=com.betterment) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/573)
- [Capital One Mobile](https://play.google.com/store/apps/details?id=com.konylabs.capitalone) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/107)
- [Cash App](https://play.google.com/store/apps/details?id=com.squareup.cash) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/453)
- [CEFCU Mobile Banking](https://play.google.com/store/apps/details?id=com.cefcu5095.mobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/641)
- [Chase Mobile](https://play.google.com/store/apps/details?id=com.chase.sig.android) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/13)
- [Chime – Mobile Banking](https://play.google.com/store/apps/details?id=com.onedebit.chime) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/46)
- [Citadel Mobile Banking](https://play.google.com/store/apps/details?id=com.q2e.citadel5012android.citadelmobile.uwnmobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/773)
- [CitiManager – Corporate Cards](https://play.google.com/store/apps/details?id=com.citi.mobile.ccc) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/511)
- [Citi Mobile®](https://play.google.com/store/apps/details?id=com.citi.citimobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/366)
- ~~[Citizens Bank Mobile Banking](https://play.google.com/store/apps/details?id=com.citizensbank.androidapp)~~ - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/66)
- ~~[Coinbase: Buy BTC, ETH, SOL](https://play.google.com/store/apps/details?id=com.coinbase.android)~~ - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/778)
- [CommunityAmerica Mobile](https://play.google.com/store/apps/details?id=com.ifs.banking.fiid1454) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/154)
- [Consumers Credit Union](https://play.google.com/store/apps/details?id=com.ccubank.mobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/727)
- [CoreFirst Bank & Trust Mobile](https://play.google.com/store/apps/details?id=com.q2e.corefirst3104android.corefirst.uwnmobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/369)
- [Crew Finance](https://play.google.com/store/apps/details?id=com.trycrew.crew) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/807)
- [DCU Digital Banking](https://play.google.com/store/apps/details?id=com.projectfinance.android.dcu) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/67)
- [Discover Mobile](https://play.google.com/store/apps/details?id=com.discoverfinancial.mobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/64)
- [Enterprise Bank & Trust Mobile](https://play.google.com/store/apps/details?id=com.q2e.enterprise3114android.ebandtmobile.uwnmobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/752)
- [E*TRADE: Invest. Trade. Save.](https://play.google.com/store/apps/details?id=com.etrade.mobilepro.activity) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/334)
- [East West Bank Mobile](https://play.google.com/store/apps/details?id=com.ewbank.digital) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/392)
- [Fidelity Bloom®: Save & Spend](https://play.google.com/store/apps/details?id=com.fidelity.sqrl) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/391)
- [Fidelity Investments](https://play.google.com/store/apps/details?id=com.fidelity.android) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/65)
- [Fifth Third Mobile Banking](https://play.google.com/store/apps/details?id=com.clairmail.fth) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/41)
- [First Entertainment Mobile](https://play.google.com/store/apps/details?id=com.firstentertainmentcu.firstentertainmentcu) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/285)
- [First Merchants Mobile](https://play.google.com/store/apps/details?id=com.mfoundry.mb.android.mb_lx7) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/158)
- [First Savings Bank Personal](https://play.google.com/store/apps/details?id=com.fis.consumer283071788) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/666)
- [GreenState CU Mobile](https://play.google.com/store/apps/details?id=com.q2e.universityofiowacommunitycreditunion5086.mobile.production) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/122)
- [Grow Mobile Banking](https://play.google.com/store/apps/details?id=com.growfinancialfcu.growfinancialfcu) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/68)
- [GTE Mobile](https://play.google.com/store/apps/details?id=org.gtefinancial.mobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/81)
- [GTE Cards](https://play.google.com/store/apps/details?id=com.a84102934.wallet.cardcontrol) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/82)
- [Huntington Mobile Banking](https://play.google.com/store/apps/details?id=com.huntington.m) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/761)
- [Logix Banking](https://play.google.com/store/apps/details?id=com.logixbanking.mobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/676)
- [M&T Mobile Banking](https://play.google.com/store/apps/details?id=com.mtb.mbanking.sc.retail.prod) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/305)
- [Mainstreet Credit Union](https://play.google.com/store/apps/details?id=org.mainstreetcu.grip) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/111)
- [Mascoma Bank](https://play.google.com/store/apps/details?id=com.mascoma.mascoma) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/684)
- [MSUFCU Mobile](https://play.google.com/store/apps/details?id=org.msufcu.mobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/311)
- [Navy Federal Credit Union](https://play.google.com/store/apps/details?id=com.navyfederal.android) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/393)
- [NB|AZ Mobile Banking](https://play.google.com/store/apps/details?id=com.mfoundry.mb.android.mb_nba_pb) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/455)
- [Old Glory Bank](https://play.google.com/store/apps/details?id=com.oldgloryholdingcompany4930.mobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/429)
- [OnPoint Mobile](https://play.google.com/store/apps/details/OnPoint_Mobile?id=com.onpointcommunitycreditunion5123.mobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/501)
- ~~[Openbank U.S.](https://play.google.com/store/apps/details?id=us.openbank.digital)~~ - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/751)
- [Pentagon Federal Credit Union](https://play.google.com/store/apps/details?id=org.penfed.mobile.banking) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/466)
- ~~[PSECU Mobile](https://play.google.com/store/apps/details?id=com.PSECUMobilePlus.com)~~ - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/610)
- [SchoolsFirst FCU Mobile](https://play.google.com/store/apps/details?id=org.schoolsfirstfcu.mobile.banking.isam) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/126)
- [Schwab Mobile](https://play.google.com/store/apps/details?id=com.schwab.mobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/61)
- [Service CU Mobile Banking](https://play.google.com/store/apps/details?id=com.ifs.mobilebanking.fiid9094) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/166)
- [SoFi - Banking & Investing](https://play.google.com/store/apps/details?id=com.sofi.mobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/413)
- [Suncoast SunMobile](https://play.google.com/store/apps/details?id=org.suncoast.mobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/809)
- [TD Bank (US)](https://play.google.com/store/apps/details?id=com.tdbank) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/358)
- [Texans CU](https://play.google.com/store/apps/details?id=com.texanscu.texanscu) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/56)
- [University Credit Union](https://play.google.com/store/apps/details?id=org.ucu.mobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/465)
- [USAA Mobile](https://play.google.com/store/apps/details?id=com.usaa.mobile.android.usaa) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/80)
- [U.S. Bank Mobile Banking](https://play.google.com/store/apps/details?id=com.usbank.mobilebanking) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/84)
- [Valley Strong Mobile Banking](https://play.google.com/store/apps/details?id=com.ksfcu.ksfcu) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/706)
- [Venmo](https://play.google.com/store/apps/details?id=com.venmo) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/512)
- [WECU Mobile](https://play.google.com/store/apps/details?id=com.wecu.mobilebanking) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/681)
- [Wells Fargo Mobile](https://play.google.com/store/apps/details?id=com.wf.wellsfargomobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/63)
- [Westerra Credit Union](https://play.google.com/store/apps/details?id=com.westerra.release.prod.release) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/642)
- [WSECU Mobile Banking](https://play.google.com/store/apps/details?id=org.wsecu.n) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/614)

### Venezuela

- [Banesco VE](https://play.google.com/store/apps/details?id=com.banesco.samfbancamovilunificada) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/730)

### Vietnam

- [AB Ditizen](https://play.google.com/store/apps/details?id=com.vnpay.abbank) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/592)
- [Agribank Plus](https://play.google.com/store/apps/details?id=com.vnpay.Agribank3g) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/637)
- [MB Bank](https://play.google.com/store/apps/details?id=com.mbmobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/594)
- [MoMo -Trợ thủ Tài chính với AI](https://play.google.com/store/apps/details?id=com.mservice.momotransfer) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/595)
- [OCB OMNI 4.0](https://play.google.com/store/apps/details?id=vn.com.ocb.awe) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/596)
- [SHB Mobile Banking](https://play.google.com/store/apps/details?id=vn.shb.mbanking) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/254)
- [VietinBank iPay](https://play.google.com/store/apps/details?id=com.vietinbank.ipay) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/593)


---

## Prerequisites

This section covers how to submit or update a banking app report.

### Submit a new app report 

There are several methods for GrapheneOS users to contribute their banking app report:  

| Method | Description | Action |
| :--- | :--- | :---: |
| **GitHub** | Fill out form on [issue-tracker](https://github.com/PrivSec-dev/banking-apps-compat-report/issues) using your GitHub account | [`SUBMIT REPORT`](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/new?assignees=&labels=&template=app_report.yml) |
| **Non-GitHub** | View gist → Raw → Save template markdown file to fill out. | [`Gist`](https://gist.github.com/akc3n/e845078ddbbb28ada0dd055c51ec45af) |
| Curl | Terminal → `curl -O` → paste copied url (gist form `.md` template) ⟶ | [`Copy link address`](https://gist.githubusercontent.com/akc3n/e845078ddbbb28ada0dd055c51ec45af/raw/c2bb563db726b80491a59c68d7f15c0897f563a0/banking-app-report-issue-form.md) |  
  
Alternatively, curl and pipe the output directly into vi/vim/neovim for editing, example:  
  
```bash
curl https://gist.githubusercontent.com/akc3n/e845078ddbbb28ada0dd055c51ec45af/raw/c2bb563db726b80491a59c68d7f15c0897f563a0/banking-app-report-issue-form.md\?T | nvim -
```

### Update status of app report

Please avoid opening a new issue to update the status of a banking app report.  
  
Instead, use `CTRL` + `F` on this page or the [issue tracker to search](https://github.com/PrivSec-dev/banking-apps-compat-report/issues) for the app and open it's `Report`. Then, simply add your update as a comment to the existing report.  
  
For non-GitHub users, if you have tried all the combinations from these [possible workaround solutions](https://discuss.grapheneos.org/d/8330-app-compatibility-with-grapheneos) and still cannot resolve your specific banking app compatibility issue, feel free to [contact me](https://github.com/akc3n/akc3n?tab=readme-ov-file#connect) for further assistance.  

---

## Note

GrapheneOS has a [detailed guide](https://grapheneos.org/articles/attestation-compatibility-guide) for app developers on how to support GrapheneOS with the hardware attestation API. Direct use of the hardware attestation API provides much higher assurance than using SafetyNet so these apps have nothing to lose by using a more meaningful API and supporting a more secure OS.  

> GrapheneOS users are strongly encouraged to share this documentation with app developers enforcing only being able to use the stock OS. Send an email to the developers and leave a review of the app with a link to this information. Share it with other users and create pressure to support GrapheneOS rather than locking users into the stock OS without a valid security reason. GrapheneOS not only upholds the app security model but substantially reinforces it, so it cannot be justified with reasoning based on security, anti-fraud, etc.  
  
Refer to https://github.com/PrivSec-dev/banking-apps-compat-report/issues/342 or the official GrapheneOS announcement on [Mastodon](https://grapheneos.social/@GrapheneOS/111504057316755618)/[Twitter](https://twitter.com/GrapheneOS/status/1730491676760633426)/[Bluesky](https://bsky.app/profile/grapheneos.org/post/3kfhrujfcih2m) for more information.
