---
title: "Banking Applications Compatibility with GrapheneOS"
date: "2022-01-26"
tags: ['Applications', 'Android', 'Banking', 'Compatibility', 'GrapheneOS']
author: akc3n, Tommy
---
  
**Maintained Compatibility List for International Banking Apps**    
   
This list includes banking apps that have been tested, submitted, reviewed, and verified as compatible.   
    
**[LIST](#international-banking-apps) | [SUBMIT](#submit-a-new-app-report) | [UPDATE](#update-status-of-app-report) | [POSSIBLE WORKAROUND SOLUTIONS](https://discuss.grapheneos.org/d/8330-app-compatibility-with-grapheneos)**  

## Introduction

Welcome to the crowd-sourced dataset for [GrapheneOS](https://grapheneos.org) users on currently [supported devices](https://grapheneos.org/faq#supported-devices).   
  
New visitors are encouraged to read the [official usage guide on banking apps](https://grapheneos.org/usage#banking-apps) for comprehensive details about how these apps function on GrapheneOS.  

### IMPORTANT 

Please read GrapheneOS's important announcement, officially released on Dec 1, 2023:  
[Twitter](https://twitter.com/GrapheneOS/status/1730491676760633426) / [Nitter](https://nitter.cz/GrapheneOS/status/1730491676760633426) | [Mastodon](https://grapheneos.social/@GrapheneOS/111504057316755618) | [Bluesky](https://bsky.app/profile/grapheneos.org/post/3kfhrujfcih2m)   
   
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

### Argentina

- [Galicia - El banco en tu celu](https://play.google.com/store/apps/details?id=com.mosync.app_Banco_Galicia) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/216)

### Australia

- [ANZ Australia](https://play.google.com/store/apps/details?id=com.anz.android.gomoney) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/157)
- [ANZ Plus](https://play.google.com/store/apps/details?id=com.anz.lotus) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/313)
- [Bank Australia App](https://play.google.com/store/apps/details?id=com.fusion.banking) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/55)
- [Bendigo Bank](https://play.google.com/store/apps/details?id=com.bendigobank.mobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/88)
- [CommBank](https://play.google.com/store/apps/details?id=com.commbank.netbank) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/75)
- [ME Bank](https://play.google.com/store/apps/details?id=au.com.mebank.banking) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/203)
- [MyState: The human way to bank](https://play.google.com/store/apps/details?id=com.mystate.app) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/345)
- [NAB Mobile Banking](https://play.google.com/store/apps/details?id=au.com.nab.mobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/76)
- [Ubank Money App](https://play.google.com/store/apps/details?id=au.com.bank86400) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/156)
- [Up — Easy Money](https://play.google.com/store/apps/details?id=au.com.up.money) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/102)
- [Westpac](https://play.google.com/store/apps/details?id=org.westpac.bank) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/77)

### Austria

- [bank99 | Online Banking ex-ING](https://play.google.com/store/apps/details?id=at.ing.diba.client.onlinebanking) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/275)
- [Bank Austria MobileBanking](https://play.google.com/store/apps/details?id=com.bankaustria.android.olb) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/15)
- [Mein ELBA-App](https://play.google.com/store/apps/details?id=at.rsg.pfp) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/62)
- [s Identity](https://play.google.com/store/apps/details?id=at.erstebank.securityapp) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/278)

### Belgium

- [Argenta Banking](https://play.google.com/store/apps/details?id=be.argenta.bankieren) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/274)
- [Belfius Mobile](https://play.google.com/store/apps/details?id=be.belfius.directmobile.android) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/110)
- [ING Banking](https://play.google.com/store/apps/details?id=com.ing.banking) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/45)
- [itsme](https://play.google.com/store/apps/details?id=be.bmid.itsme) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/276)
- [Payconiq by Bancontact](https://play.google.com/store/apps/details?id=mobi.inthepocket.bcmc.bancontact) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/277)

### Brazil

- [Banco da Amazônia](https://play.google.com/store/apps/details?id=la.foton.basa.mybankmobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/238)
- [Banco do Brasil: abrir conta](https://play.google.com/store/apps/details?id=br.com.bb.android) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/235)
- [Bradesco: Conta, Cartão e Pix!](https://play.google.com/store/apps/details?id=com.bradesco) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/236)
- [Bradesco Net Empresa](https://play.google.com/store/apps/details?id=br.com.bradesco.netempresa) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/237)
- [CAIXA](https://play.google.com/store/apps/details?id=br.com.gabba.Caixa) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/89)
- ~~[gov.br](https://play.google.com/store/apps/details?id=br.gov.meugovbr)~~ - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/310)
- [Nubank: conta, cartão e mais](https://play.google.com/store/apps/details?id=com.nu.production) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/92)
- [Santander Brasil](https://play.google.com/store/apps/details?id=com.santander.app) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/151)
- [Santander Empresas](https://play.google.com/store/apps/details?id=com.santandermovelempresarial.app) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/153)
- [Santander Way: App de cartões](https://play.google.com/store/apps/details?id=br.com.santander.way) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/152)
- [Sicoob](https://play.google.com/store/apps/details?id=br.com.sicoobnet) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/239)

### Bulgaria

- [KBC Mobile Bulgaria](https://play.google.com/store/apps/details?id=com.raiffeisen.online.mobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/357)
- ~~[My Fibank](https://play.google.com/store/apps/details?id=com.bfs.fibank)~~ - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/359)

### Canada

- [Affinity Mobile](https://play.google.com/store/apps/details?id=ca.affinitycu.mobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/71)
- [Coast Capital Savings](https://play.google.com/store/apps/details?id=com.coastcapitalsavings.dcu) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/175)
- [BMO Mobile Banking](https://play.google.com/store/apps/details?id=com.bmo.mobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/19)
- [EQ Bank Mobile Banking](https://play.google.com/store/apps/details?id=com.eqbank.eqbank) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/103)
- [HSBC Canada](https://play.google.com/store/apps/details?id=ca.hsbc.hsbccanada) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/304)
- [IBKR Mobile](https://play.google.com/store/apps/details?id=atws.app) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/241)
- [KOHO Financial](https://play.google.com/store/apps/details?id=ca.koho) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/104)
- [RBC Mobile](https://play.google.com/store/apps/details?hl=en&id=com.rbc.mobile.android) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/32)
- [QuestMobile: Invest & Trade](https://play.google.com/store/apps/details?id=com.questrade.questmobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/115)
- [Questrade](https://play.google.com/store/apps/details?id=com.questrade.my) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/114)
- [Scotiabank Mobile Banking](https://play.google.com/store/apps/details?id=com.scotiabank.banking) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/176)
- [Simplii Financial](https://play.google.com/store/apps/details?id=com.pcfinancial.mobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/17)
- [Tangerine Mobile Banking](https://play.google.com/store/apps/details?id=ca.tangerine.clients.banking.app) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/16)
- [TD Canada](https://play.google.com/store/apps/details?id=com.td) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/199)
- [Wealthsimple - Grow your money](https://play.google.com/store/apps/details?id=com.wealthsimple.trade) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/117)

### Chile

- [Santander Chile](https://play.google.com/store/apps/details?id=cl.santander.smartphone) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/360)

### Croatia

- [George Croatia](https://play.google.com/store/apps/details?id=hr.erstebank.george) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/373)

### Czech Republic

- [CREDITAS Banking](https://play.google.com/store/apps/details?id=cz.creditas.richee) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/78)
- [ČSOB Smart Key](https://play.google.com/store/apps/details?id=cz.csob.smartklic) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/258)
- [George Česko](https://play.google.com/store/apps/details?id=cz.csas.georgego) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/251)
- [George klíč](https://play.google.com/store/apps/details?id=cz.csas.app.georgeklic) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/251)
- [My Air](https://play.google.com/store/apps/details?id=cz.airbank.android) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/31)
- [Raiffeisen bankovnictví](https://play.google.com/store/apps/details?id=cz.rb.app.smartphonebanking) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/347)

### Denmark

- [Jyske Bank](https://play.google.com/store/apps/details?id=dk.jyskebank.drb) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/307)
- [MitID](https://play.google.com/store/apps/details?id=dk.mitid.app.android) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/286)
- [Mobilbank DK – Danske Bank](https://play.google.com/store/apps/details?id=com.danskebank.mobilebank3.dk) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/5)
- [MobilePay](https://play.google.com/store/apps/details?id=dk.danskebank.mobilepay) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/7)
- [NemID nøgleapp](https://play.google.com/store/apps/details?id=dk.e_nettet.mobilekey.everyone) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/10)
- [Nordea Mobile - Denmark](https://play.google.com/store/apps/details?id=dk.nordea.mobilebank) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/118)

### Ecuador

- [Banco del Pacífico](https://play.google.com/store/apps/details?id=com.pacifico.movilmatico) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/225)
- [Banco Guayaquil](https://play.google.com/store/apps/details?id=com.bancodeguayaquil) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/226)

### Finland

- [Nordea ID](https://play.google.com/store/apps/details?id=com.nordea.mobiletoken) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/280)
- [S-mobiili](https://play.google.com/store/apps/details?id=fi.spankki) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/43)

### France

- [Banxo](https://play.google.com/store/apps/details?id=com.caisseepargne.android.mobilebanking) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/215)
- [BoursoBank](https://play.google.com/store/apps/details?id=com.boursorama.android.clients) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/147)
- [Credit Coopératif](https://play.google.com/store/apps/details?id=com.credit_coop.android.mobilebanking) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/232)
- [Crédit Mutuel de Bretagne](https://play.google.com/store/apps/details?id=com.arkea.android.application.cmb) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/150)
- [Fortuneo, ma Banque & Bourse](https://play.google.com/store/apps/details?id=com.fortuneo.android) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/208)
- [Hello bank!](https://play.google.com/store/apps/details?id=com.bnpp.hellobank) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/163)
- [La Banque Postale](https://play.google.com/store/apps/details?id=com.fullsix.android.labanquepostale.accountaccess) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/14)
- [Ma Banque](https://play.google.com/store/apps/details?id=fr.creditagricole.androidapp) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/73)
- [Mes Comptes BNP Paribas](https://play.google.com/store/apps/details?id=net.bnpparibas.mescomptes) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/165)
- [Mes Comptes - LCL](https://play.google.com/store/apps/details?id=fr.lcl.android.customerarea) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/196)

### Germany

- [1822direkt Banking](https://play.google.com/store/apps/details?id=de.direkt1822.banking) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/167)
- [1822TAN+](https://play.google.com/store/apps/details?id=de.direkt1822.tanplus) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/368)
- [comdirect](https://play.google.com/store/apps/details?id=de.comdirect.app) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/348)
- [comdirect photoTAN App](https://play.google.com/store/apps/details?id=com.comdirect.phototan) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/349)
- [Commerzbank Banking](https://play.google.com/store/apps/details?id=de.commerzbanking.mobil) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/22)
- [Deutsche Bank Mobile](https://play.google.com/store/apps/details?id=com.db.pwcc.dbmobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/38)
- [Digitales Bezahlen](https://play.google.com/store/apps/details?id=de.fiduciagad.android.wlwallet) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/160)
- [DKB](https://play.google.com/store/apps/details?id=com.dkbcodefactory.banking) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/106)
- [ElsterSecure - sicherer Login](https://play.google.com/store/apps/details?id=de.elster.elstersecure.app) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/353)
- [finanzen.net zero Aktien & ETF](https://play.google.com/store/apps/details?id=de.gratisbroker.android.mobileapp) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/321)
- [finanzen.net zero Secure TAN](https://play.google.com/store/apps/details?id=de.gratisbroker.android.securetan) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/322)
- [flatex next: Aktien und ETF](https://play.google.com/store/apps/details?id=de.xcom.flatexde) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/59)
- [GLS Banking](https://play.google.com/store/apps/details?id=de.gls.banking.app) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/344)
- [GLS mBank Classic](https://play.google.com/store/apps/details?id=de.gls.mbank) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/352)
- [ING Banking to go](https://play.google.com/store/apps/details?id=de.ingdiba.bankingapp) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/48)
- [Klarna | Shop now. Pay later.](https://play.google.com/store/apps/details?id=com.myklarnamobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/314)
- [Kontist](https://play.google.com/store/apps/details?id=com.kontist) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/23)
- [N26 — Love your bank](https://play.google.com/store/apps/details?id=de.number26.android) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/21)
- [Pay – Die Bezahl-App](https://play.google.com/store/apps/details?id=de.fiduciagad.android.vrwallet) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/35)
- [Penta — Business Banking App](https://play.google.com/store/apps/details?id=com.getpenta.app) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/24)
- [PSD Banking](https://play.google.com/store/apps/details?id=de.psd.banking.app) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/159)
- [Santander Banking](https://play.google.com/store/apps/details?id=de.santander.presentation) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/119)
- [SecureGo plus](https://play.google.com/store/apps/details?id=de.fiduciagad.securego.wl) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/161)
- [Sparkasse Ihre mobile Filiale](https://play.google.com/store/apps/details?id=com.starfinanz.smob.android.sfinanzstatus) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/44)
- [DKB-TAN2go](https://play.google.com/store/apps/details?id=com.starfinanz.mobile.android.dkbpushtan) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/279)
- [Tomorrow: Mobile Banking](https://play.google.com/store/apps/details?id=one.tomorrow.app) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/20)
- [VR Banking - einfach sicher](https://play.google.com/store/apps/details?id=de.fiduciagad.banking.vr) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/36)

### Ghana

- [SC Mobile Ghana](https://play.google.com/store/apps/details?id=com.breezeghana.ui) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/174)

### Greece

- [Eurobank Mobile App](https://play.google.com/store/apps/details?id=com.EurobankEFG) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/302)
- [winbank app (Piraeus Bank S.A.)](https://play.google.com/store/apps/details?id=gr.winbank.mobile.redesign) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/301)

### Hong Kong

- [HSBC HK Mobile Banking](https://play.google.com/store/apps/details?id=hk.com.hsbc.hsbchkmobilebanking) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/303)

### Hungary

- [OTP Bank HU](https://play.google.com/store/apps/details?id=hu.otpbank.mobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/245)
- [Simple Classic](https://play.google.com/store/apps/details?id=com.otpmobil.simple) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/263)
- [UniCredit mBanking](https://play.google.com/store/apps/details?id=hr.asseco.android.jimba.mUCI.hu) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/87)

### India

- [Axis Mobile: Pay, Invest & UPI](https://play.google.com/store/apps/details?id=com.axis.mobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/139)
- [Bajaj Finserv: UPI,Loan,FD,MF](https://play.google.com/store/apps/details?id=org.altruist.BajajExperia) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/340)
- [BHIM - MAKING INDIA CASHLESS](https://play.google.com/store/apps/details?id=in.org.npci.upiapp) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/135)
- [BHIM PNB](https://play.google.com/store/apps/details?id=com.mgs.pnbupi) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/337)
- [BHIM SBI Pay:Retail & Business](https://play.google.com/store/apps/details?id=com.sbi.upi) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/338)
- ~~[BOI Mobile](https://play.google.com/store/apps/details?id=com.boi.ua.android)~~ - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/329)
- [Cent Mobile](https://play.google.com/store/apps/details?id=com.infrasofttech.CentralBank) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/142)
- [HDFC Bank MobileBanking App](https://play.google.com/store/apps/details?id=com.snapwork.hdfc) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/138)
- [IDFC FIRST Bank: MobileBanking](https://play.google.com/store/apps/details?id=com.idfcfirstbank.optimus) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/339)
- [iMobile Pay-Banking,Cards,Loan](https://play.google.com/store/apps/details?id=com.csam.icici.bank.imobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/296)
- [IndOASIS Indian Bank MobileApp](https://play.google.com/store/apps/details?id=com.IndianBank.IndOASIS) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/293)
- [Kotak Mobile Banking App](https://play.google.com/store/apps/details?id=com.msf.kbank.mobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/137)
- [Paytm: Secure UPI Payments](https://play.google.com/store/apps/details?id=net.one97.paytm) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/140)
- [PhonePe UPI, Payment, Recharge](https://play.google.com/store/apps/details?id=com.phonepe.app) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/134)
- [PNB ONE](https://play.google.com/store/apps/details?id=com.Version1) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/328)
- [Vyom - Union Bank of India](https://play.google.com/store/apps/details?id=com.infrasoft.uboi) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/141)
- [YONO SBI: Banking & Lifestyle](https://play.google.com/store/apps/details?id=com.sbi.lotusintouch) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/79)
- [Yono Lite SBI - Mobile Banking](https://play.google.com/store/apps/details?id=com.sbi.SBIFreedomPlus) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/327)

### Indonesia

- [BCA Mobile](https://play.google.com/store/apps/details?id=com.bca) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/306)

### Ireland

- [AIB Mobile](https://play.google.com/store/apps/details?id=aib.ibank.android) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/202)

### Israel

- [Bit ביט](https://play.google.com/store/apps/details?id=com.bnhp.payments.paymentsapp&hl=en&gl=US) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/221)
- [כאל- הטבות, מידע, אשראי](https://play.google.com/store/apps/details?id=com.onoapps.cal4u&hl=he&gl=US) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/217)
- [ישראכרט - ארנקים, אשראי והטבות](https://play.google.com/store/apps/details?id=com.isracard.hatavot&hl=he&gl=US) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/219)
- [Max](https://play.google.com/store/apps/details?id=com.ideomobile.leumicard) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/218)
- [פייבוקס ארנק דיגיטלי - PayBox](https://play.google.com/store/apps/details?id=com.payboxapp&hl=he&gl=US) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/220)
- [בנק דיסקונט](https://play.google.com/store/apps/details?id=com.ideomobile.discount&hl=he&gl=US) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/223)

### Italy

- [BancoBPM YouApp](https://play.google.com/store/apps/details?id=com.lynxspa.bancopopolare) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/284)
- [BancoPosta](https://play.google.com/store/apps/details?id=posteitaliane.posteapp.appbpol) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/181)
- [BNL](https://play.google.com/store/apps/details?id=it.bnl.apps.banking) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/144)
- [Fineco](https://play.google.com/store/apps/details?id=com.fineco.it) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/131)
- [Hype](https://play.google.com/store/apps/details?id=it.hype.app) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/264)
- [illimity](https://play.google.com/store/apps/details?id=com.illimity.mobile.rtl) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/281)
- [Intesa Sanpaolo Mobile](https://play.google.com/store/apps/details?id=com.latuabancaperandroid) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/197)
- [Satispay](https://play.google.com/store/apps/details?id=com.satispay.customer) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/282)

### Japan

- [PayPay-ペイペイ](https://play.google.com/store/apps/details?id=jp.ne.paypay.android.app) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/367)
- [三菱ＵＦＪ銀行](https://play.google.com/store/apps/details?id=jp.mufg.bk.applisp.app) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/364)
- [三井住友銀行アプリ](https://play.google.com/store/apps/details?id=jp.co.smbc.direct) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/370)

### Kazakhstan

- [Kaspi.kz суперприложение](https://play.google.com/store/apps/details?id=kz.kaspi.mobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/149)

### Luxembourg

- [S-Net Mobile](https://play.google.com/store/apps/details?id=lu.bcee.snetmobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/211)

### Lithuania

- [Revolut](https://play.google.com/store/apps/details?id=com.revolut.revolut) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/90)
- [Swedbank Lietuva](https://play.google.com/store/apps/details?id=lt.swedbank.mobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/244)

### Malaysia

- [CIMB Clicks Malaysia](https://play.google.com/store/apps/details?id=com.cimbmalaysia) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/246)
- [MAE by Maybank2u](https://play.google.com/store/apps/details?id=com.maybank2u.life) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/247)
- [Maybank2u MY](https://play.google.com/store/apps/details?id=my.com.maybank2u.m2umobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/248)
- [Touch 'n Go eWallet](https://play.google.com/store/apps/details?id=my.com.tngdigital.ewallet) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/249)

### Netherlands

- [ABN AMRO](https://play.google.com/store/apps/details?id=com.abnamro.nl.mobile.payments) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/108)
- [ASN Bank (De Volksbank)](https://play.google.com/store/apps/details?id=nl.devolksbank.asn.bankieren) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/105)
- [ASN Mobiel Betalen](https://play.google.com/store/apps/details?id=nl.asnbank.mobielbetalen) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/105)
- [ING Bankieren](https://play.google.com/store/apps/details?id=com.ing.mobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/182)
- [Rabobank](https://play.google.com/store/apps/details?id=nl.rabomobiel) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/47)
- [Regio Bank (De Volksbank)](https://play.google.com/store/apps/details?id=nl.devolksbank.regio.bankieren) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/105)
- [RegioBank - Mobiel Betalen](https://play.google.com/store/apps/details?id=nl.regiobank.mobielbetalen) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/105)
- [SNS Bank (De Volksbank)](https://play.google.com/store/apps/details?id=nl.devolksbank.sns.bankieren) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/105)
- [SNS Mobiel Betalen](https://play.google.com/store/apps/details?id=nl.snsbank.mobielbetalen) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/105)
- [Triodos Bankieren NL](https://play.google.com/store/apps/details?id=com.triodos.bankingnl) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/133)

### Norway

- [BankID](https://play.google.com/store/apps/details?id=no.vipps.bankid) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/255)
- [Bank Norwegian](https://play.google.com/store/apps/details?id=com.banknorwegian) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/95)
- [Spare](https://play.google.com/store/apps/details?id=no.dnb.spare) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/98)
- [Eika Mobilbank](https://play.google.com/store/apps/details?id=no.eika.mobilbank) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/256)
- [SpareBank 1 Mobile Banking](https://play.google.com/store/apps/details?id=no.sparebank1.mobilbank) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/100)
- [Kron - Investering for alle](https://play.google.com/store/apps/details?id=com.kronmobilapp) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/97)
- [Nordnet: Stocks & Funds](https://play.google.com/store/apps/details?id=com.nordnet) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/99)
- [Obos Mobilbank](https://play.google.com/store/apps/details?id=com.evry.mobile.android.smartbankmobile.obos) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/192)
- [Sbanken](https://play.google.com/store/apps/details?id=no.skandiabanken) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/96)
- [Sparebanken Sogn og Fjordane](https://play.google.com/store/apps/details?id=no.kamikazemedia.android.ssf) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/312)
- [Sparebanken Vest](https://play.google.com/store/apps/details?id=no.spv.mobilbank) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/336)
- [Trumf Visa](https://play.google.com/store/apps/details?id=com.evry.android.cardcompanion.ngtv) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/101)
- [Vipps](https://play.google.com/store/apps/details?id=no.dnb.vipps) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/74)

### Poland

- [Bank Millenium](https://play.google.com/store/apps/details?id=wit.android.bcpBankingApp.millenniumPL) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/171)
- [IKO](https://play.google.com/store/apps/details?id=pl.pkobp.iko) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/25)
- [Kantor Walutowy Alior Banku](https://play.google.com/store/apps/details?id=pl.alior.mobile.exchange.prd) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/172)
- [mBank PL](https://play.google.com/store/apps/details?id=pl.mbank) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/136)
- [Moje ING mobile](https://play.google.com/store/apps/details?id=pl.ing.mojeing) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/169)
- [PeoPay](https://play.google.com/store/apps/details?id=softax.pekao.powerpay) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/298)
- [Santander mobile](https://play.google.com/store/apps/details?id=pl.bzwbk.bzwbk24) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/371)

### Portugal

- [ActivoBank](https://play.google.com/store/apps/details?id=wit.android.bcpBankingApp.activoBank) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/300)
- [Caixadirecta Empresas](https://play.google.com/store/apps/details?id=pt.cgd.caixadirectaempresas) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/120)
- [Caixadirecta](https://play.google.com/store/apps/details?id=cgd.pt.caixadirectaparticulares) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/214)
- [CA Mobile](https://play.google.com/store/apps/details?id=ca.mobile.explorer) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/288)
- [MB WAY](https://play.google.com/store/apps/details?id=pt.sibs.android.mbway) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/289)

### Romania

- [BT Pay](https://play.google.com/store/apps/details?id=ro.btrl.pay) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/83)
- [George Romania](https://play.google.com/store/apps/details?id=ro.bcr.georgego) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/179)
- [ING HomeBank](https://play.google.com/store/apps/details?id=ro.ing.mobile.banking.android.activity) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/356)
- [Raiffeisen Smart Mobile PI](https://play.google.com/store/apps/details?id=ro.raiffeisen.smartmobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/86)

### Russia

- [Tinkoff](https://play.google.com/store/apps/details?id=com.idamob.tinkoff.android) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/198)

### Serbia

- [Moja mBanka](https://play.google.com/store/apps/details?id=rs.Raiffeisen.mobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/70)

### Singapore

- [BigPay – financial services](https://play.google.com/store/apps/details?id=com.tpaay.bigpay) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/271)
- [CIMB Clicks](https://play.google.com/store/apps/details?id=com.cimb.sg.clicksMobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/268)
- [Citibank SG](https://play.google.com/store/apps/details?id=com.citibank.mobile.sg) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/267)
- [DBS digibank - wealth](https://play.google.com/store/apps/details?id=com.dbs.sg.iwealth) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/183)
- [Grab - Taxi & Food Delivery](https://play.google.com/store/apps/details?id=com.grabtaxi.passenger) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/316)
- [GXS Bank](https://play.google.com/store/apps/details?id=sg.com.gxs.app) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/315)
- [HLF FA$TPAY](https://play.google.com/store/apps/details?id=com.hongleongfinance.hlf) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/269)
- [iChange](https://play.google.com/store/apps/details?id=com.iapps.slide.userapp.ichange) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/320)
- [Instarem: Send money overseas](https://play.google.com/store/apps/details?id=com.instarem.mobileapp) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/272)
- [OCBC Digital - Mobile Banking](https://play.google.com/store/apps/details?id=com.ocbc.mobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/146)
- [SFL Go](https://play.google.com/store/apps/details?id=sg.sfl.ib) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/273)
- [SIF Mobile](https://play.google.com/store/apps/details?id=com.sif.retailbanking) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/270)
- [Wise](https://play.google.com/store/apps/details?id=com.transferwise.android) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/266)

### Slovakia

- [365.bank](https://play.google.com/store/apps/details?id=bank.sk365.app) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/326)
- [George Slovakia](https://play.google.com/store/apps/details?id=sk.slsp.georgego) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/343)
- [Tatra banka](https://play.google.com/store/apps/details?id=sk.tb.ib.tatraandroid) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/325)

### Slovenia

- [DH Denarnik](https://play.google.com/store/apps/details?id=si.delavskahranilnica.dhdenarnik) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/178)
- [DH Mobilni](https://play.google.com/store/apps/details?id=com.hrc.eb.mobile.android.hibismobiledh) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/177)

### South Korea

- [하나은행 - Hanabank](https://play.google.com/store/apps/details?id=com.kebhana.hanapush) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/259)
- [웰컴디지털뱅크](https://play.google.com/store/apps/details?id=kr.co.welcomebank.omb) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/260)
- [우리WON뱅킹](https://play.google.com/store/apps/details?id=com.wooribank.smart.npib) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/261)
- [PAYCO](https://play.google.com/store/apps/details?id=com.nhnent.payapp) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/262)

### Spain

- [Banco Sabadell App](https://play.google.com/store/apps/details?id=net.inverline.bancosabadell.officelocator.android) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/257)
- [BBVA Spain | Online Banking](https://play.google.com/store/apps/details?id=com.bbva.bbvacontigo) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/213)
- [CaixaBankNow](https://play.google.com/store/apps/details?id=es.lacaixa.mobile.android.newwapicon) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/355)
- [CaixaBank Sign - Digital sign](https://play.google.com/store/apps/details?id=es.caixabank.caixabanksign) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/354)
- [EVO Banco móvil](https://play.google.com/store/apps/details?id=es.evobanco.bancamovil) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/112)
- [Openbank – banca móvil](https://play.google.com/store/apps/details?id=es.openbank.mobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/240)

### Sweden

- [Avanza](https://play.google.com/store/apps/details?id=se.avanzabank.androidapplikation) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/11)
- [BankID säkerhetsapp](https://play.google.com/store/apps/details?id=com.bankid.bus) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/8)
- [Handelsbanken SE - Privat](https://play.google.com/store/apps/details?id=com.handelsbanken.mobile.android) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/324)
- [ICA Banken](https://play.google.com/store/apps/details?id=se.icabanken) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/365)
- [Kivra Sweden](https://play.google.com/store/apps/details?id=com.kivra.Kivra) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/193)
- [Länsförsäkringar](https://play.google.com/store/apps/details?id=se.lf.mobile.android) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/91)
- [Mobilbank SE — Danske Bank](https://play.google.com/store/apps/details?id=com.danskebank.mobilebank3.se) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/4)
- [Nordea Mobile — Sverige](https://play.google.com/store/apps/details?id=se.nordea.mobilebank) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/9)
- [Nordnet: Stocks & Funds](https://play.google.com/store/apps/details?id=com.nordnet) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/363)
- [SBAB](https://play.google.com/store/apps/details?id=se.sbab.bankapp) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/362)
- [SEB](https://play.google.com/store/apps/details?id=se.seb.privatkund) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/361)
- [Swedbank private](https://play.google.com/store/apps/details?id=se.swedbank.mobil) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/12)
- [Swish payments](https://play.google.com/store/apps/details?id=se.bankgirot.swish) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/6)

### Switzerland

- [ABS Mobile Banking](https://play.google.com/store/apps/details?id=com.abs.android.mbanking) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/233)
- [Airlock 2FA](https://play.google.com/store/apps/details?id=com.airlock.iam.a2fa) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/229)
- [BCN Mobile banking](https://play.google.com/store/apps/details?id=com.bcn.android.mbanking) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/145)
- [BCV Mobile](https://play.google.com/store/apps/details?id=ch.bcv.mobile.android) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/231)
- [Credit Suisse – CSX](https://play.google.com/store/apps/details?id=com.csg.cs.dnmb) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/72)
- [debiX+](https://play.google.com/store/apps/details?id=com.sixgroup.debixplus) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/227)
- [neon - your account app](https://play.google.com/store/apps/details?id=com.neonbanking.app) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/207)
- [Prepaid TWINT & other banks](https://play.google.com/store/apps/details?id=ch.twint.payment) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/228)
- [Raiffeisen E-Banking](https://play.google.com/store/apps/details?id=ch.raiffeisen.android) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/26)
- [ZKB Access](https://play.google.com/store/apps/details?id=ch.zkb.digipass) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/94)
- [ZKB Mobile Banking](https://play.google.com/store/apps/details?id=ch.zkb.slv.mobile.client.android) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/93)

### Taiwan

- [Cathay United Bank](https://play.google.com/store/apps/details?id=com.cathaybk.mymobibank.android) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/29)
- [Chunghwa Post](https://play.google.com/store/apps/details?id=com.mitake.android.epost) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/27)
- [CTBC Bank Home Bank](https://play.google.com/store/apps/details?id=com.chinatrust.mobilebank) -[Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/30)
- [E.Sun Bank](https://play.google.com/store/apps/details?id=com.esunbank) -[Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/162)
- [Taishin Mobile Bank](https://play.google.com/store/apps/details?id=tw.com.taishinbank.mobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/28)

### Thailand

- [K PLUS](https://play.google.com/store/apps/details?id=com.kasikorn.retail.mbanking.wap) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/265)
- [SCB Easy](https://play.google.com/store/apps/details?id=com.scb.phone) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/195)
- [ShopeePay](https://play.google.com/store/apps/details?id=com.beeasy.airpay) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/335)
- [UOB TMRW Thailand](https://play.google.com/store/apps/details?id=com.uob.mightyth2) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/333)

### Ukraine

- [Privat24](https://play.google.com/store/apps/details?id=ua.privatbank.ap24) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/124)
- [monobank — банк у телефоні](https://play.google.com/store/apps/details?id=com.ftband.mono) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/323)

### United Arab Emirates

- [ADCB](https://play.google.com/store/apps/details?id=com.adcb.bank) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/123)
- [FAB Mobile](https://play.google.com/store/apps/details?id=com.fab.personalbanking) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/180)

### United Kingdom

- [Amex United Kingdom](https://play.google.com/store/apps/details?id=com.americanexpress.android.acctsvcs.uk) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/40)
- ~~[Bank of Scotland Mobile App](https://play.google.com/store/apps/details?id=com.grppl.android.shell.BOS)~~ - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/243)
- [Barclaycard](https://play.google.com/store/apps/details?id=com.barclays.bca) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/42)
- [Barclays](https://play.google.com/store/apps/details?id=com.barclays.android.barclaysmobilebanking) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/341)
- [Chase UK](https://play.google.com/store/apps/details?id=com.chase.intl) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/69)
- [The Co-operative Bank](https://play.google.com/store/apps/details?id=com.cooperativebank.bank) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/205)
- [first direct](https://play.google.com/store/apps/details?id=com.firstdirect.bankingonthego) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/128)
- ~~[Halifax Mobile Banking](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/309)~~ - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/309)
- [HSBC UK Mobile Banking](https://play.google.com/store/apps/details?id=uk.co.hsbc.hsbcukmobilebanking) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/33)
- ~~[Lloyds Bank Mobile Banking](https://play.google.com/store/apps/details?id=com.grppl.android.shell.CMBlloydsTSB73)~~ - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/53)
- [M&T Mobile Banking](https://play.google.com/store/apps/details?id=com.mtb.mbanking.sc.retail.prod) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/305)
- [Marcus by Goldman Sachs®](https://play.google.com/store/apps/details?id=com.marcus.android) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/212)
- [Monzo Bank - Mobile Banking](https://play.google.com/store/apps/details?id=co.uk.getmondo) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/58)
- [Metro Bank](https://play.google.com/store/apps/details?id=uk.co.metrobankonline.mobile.android.production) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/209)
- [Nationwide Banking App](https://play.google.com/store/apps/details?id=co.uk.Nationwide.Mobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/332)
- [NatWest Mobile Banking](https://play.google.com/store/apps/details?id=com.rbs.mobile.android.natwest) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/34)
- [Paysend Money Transfer App](https://play.google.com/store/apps/details?id=com.paysend.app) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/222)
- [Revolut](https://play.google.com/store/apps/details?id=com.revolut.revolut) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/90)
- [Santander Mobile Banking](https://play.google.com/store/apps/details?id=uk.co.santander.santanderUK) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/210)
- [Starling Bank - Mobile Banking](https://play.google.com/store/apps/details?id=com.starlingbank.android) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/39)
- [Tesco Bank and Clubcard Pay+](https://play.google.com/store/apps/details?id=com.tescobank.mobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/129)
- [Tide - Business Bank Account](https://play.google.com/store/apps/details?id=com.tideplatform.banking) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/206)
- [Triodos Bank UK](https://play.google.com/store/apps/details?id=com.triodos.bankinguk) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/132)
- [TSB Mobile Banking](https://play.google.com/store/apps/details?id=uk.co.tsb.newmobilebank) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/143)
- [Virgin Money Mobile Banking](https://play.google.com/store/apps/details?id=com.virginmoney.uk.mobile.android) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/54)

### United States

- [Alliant Mobile Banking](https://play.google.com/store/apps/details?id=org.alliant.mobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/85)
- [Ally: Banking & Investing](https://play.google.com/store/apps/details?id=com.ally.MobileBanking) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/113)
- [America First Mobile Banking](https://play.google.com/store/apps/details?id=com.afcu.mobilebanking) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/148)
- [Amex](https://play.google.com/store/apps/details?id=com.americanexpress.android.acctsvcs.us) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/125)
- [Bank of America Mobile Banking](https://play.google.com/store/apps/details?id=com.infonow.bofa) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/242)
- [BECU](https://play.google.com/store/apps/details?id=org.becu.androidapp) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/60)
- [Capital One Mobile](https://play.google.com/store/apps/details?id=com.konylabs.capitalone) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/107)
- [Chase Mobile](https://play.google.com/store/apps/details?id=com.chase.sig.android) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/13)
- [Chime – Mobile Banking](https://play.google.com/store/apps/details?id=com.onedebit.chime) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/46)
- [Citi Mobile®](https://play.google.com/store/apps/details?id=com.citi.citimobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/366)
- [Citizens Bank Mobile Banking](https://play.google.com/store/apps/details?id=com.citizensbank.androidapp) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/66)
- [CommunityAmerica Mobile](https://play.google.com/store/apps/details?id=com.ifs.banking.fiid1454) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/154)
- [CoreFirst Bank & Trust Mobile](https://play.google.com/store/apps/details?id=com.q2e.corefirst3104android.corefirst.uwnmobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/369)
- [DCU Digital Banking](https://play.google.com/store/apps/details?id=com.projectfinance.android.dcu) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/67)
- [Discover Mobile](https://play.google.com/store/apps/details?id=com.discoverfinancial.mobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/64)
- [E*TRADE: Invest. Trade. Save.](https://play.google.com/store/apps/details?id=com.etrade.mobilepro.activity) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/334)
- [Fidelity Investments](https://play.google.com/store/apps/details?id=com.fidelity.android) - [Repor](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/65)
- [Fifth Third Mobile Banking](https://play.google.com/store/apps/details?id=com.clairmail.fth) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/41)
- [First Entertainment Mobile](https://play.google.com/store/apps/details?id=com.firstentertainmentcu.firstentertainmentcu) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/285)
- [First Merchants Mobile](https://play.google.com/store/apps/details?id=com.mfoundry.mb.android.mb_lx7) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/158)
- [GreenState CU Mobile](https://play.google.com/store/apps/details?id=com.q2e.universityofiowacommunitycreditunion5086.mobile.production) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/122)
- [Grow Mobile Banking](https://play.google.com/store/apps/details?id=com.growfinancialfcu.growfinancialfcu) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/68)
- [GTE Mobile](https://play.google.com/store/apps/details?id=org.gtefinancial.mobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/81)
- [GTE Cards](https://play.google.com/store/apps/details?id=com.a84102934.wallet.cardcontrol) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/82)
- [Mainstreet Credit Union](https://play.google.com/store/apps/details?id=org.mainstreetcu.grip) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/111)
- [MSUFCU](https://play.google.com/store/apps/details?id=org.msufcu.mobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/311)
- [PayPal - Send, Shop, Manage](https://play.google.com/store/apps/details?id=com.paypal.android.p2pmobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/127)
- [SchoolsFirst FCU Mobile](https://play.google.com/store/apps/details?id=org.schoolsfirstfcu.mobile.banking.isam) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/126)
- [Schwab Mobile](https://play.google.com/store/apps/details?id=com.schwab.mobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/61)
- [Service CU Mobile Banking](https://play.google.com/store/apps/details?id=com.ifs.mobilebanking.fiid9094) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/166)
- [TD Bank (US)](https://play.google.com/store/apps/details?id=com.tdbank) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/358)
- [Texan CU Mobile](https://play.google.com/store/apps/details?id=com.texanscu.texanscu) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/56)
- [USAA Mobile](https://play.google.com/store/apps/details?id=com.usaa.mobile.android.usaa) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/80)
- [U.S. Bank Mobile Banking](https://play.google.com/store/apps/details?id=com.usbank.mobilebanking) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/84)
- [Wells Fargo Mobile](https://play.google.com/store/apps/details?id=com.wf.wellsfargomobile) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/63)

### Vietnam

- [SHB Mobile Banking](https://play.google.com/store/apps/details?id=vn.shb.mbanking) - [Report](https://github.com/PrivSec-dev/banking-apps-compat-report/issues/254)
  
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
