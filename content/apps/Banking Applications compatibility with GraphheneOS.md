---
title: "Banking Applications Compatibility with GrapheneOS"
date: "2022-01-26"
tags: ['Applications', 'Android']
author: akc3n
---

This is a list of banking applications known to work with [GrapheneOS](https://grapheneos.org).

Banking apps are a very problematic app for security and privacy focused operating systems, or even alternative OSes, due to the app being incompatible with majority of hardening, having a hard dependency on Google Play services, or require passing SafetyNet `ctsProfileMatch` and `basicIntegrity`.

GrapheneOS passes SafetyNet `basicIntegrity`, but it is not certified by Google so it does not pass `ctsProfileMatch`.[^1]

[GrapheneOS's usage guide](https://grapheneos.org/usage) on [banking apps](https://grapheneos.org/usage#banking-apps).

---

## List of Banking Apps

### Australia

- [Bank Australia App](https://play.google.com/store/apps/details?id=com.fusion.banking&gl=US) - [Report](https://github.com/akc3n/banking/issues/55)
- [Bendigo Bank](https://play.google.com/store/apps/details?id=com.bendigobank.mobile) - [Report](https://github.com/akc3n/banking/issues/88)
- [CommBank](https://play.google.com/store/apps/details?id=com.commbank.netbank) - [Report](https://github.com/akc3n/banking/issues/75)
- [NAB Mobile Banking](https://play.google.com/store/apps/details?id=au.com.nab.mobile) - [Report](https://github.com/akc3n/banking/issues/76)
- [Up Money](https://play.google.com/store/apps/details?id=au.com.up.money&hl=en) - [Report](https://github.com/akc3n/banking/issues/102)
- [Westpac](https://play.google.com/store/apps/details?id=org.westpac.bank) - [Report](https://github.com/akc3n/banking/issues/77)

### Austria

- [Bank Austria Mobile Banking](https://play.google.com/store/apps/details?id=com.bankaustria.android.olb) - [Report](https://github.com/akc3n/banking/issues/15)
- [Mein ELBA-App](https://play.google.com/store/apps/details?id=at.rsg.pfp) - [Report](https://github.com/akc3n/banking/issues/62)

### Belgium

- [Belfius Mobile](https://play.google.com/store/apps/details?id=be.belfius.directmobile.android) - [Report](https://github.com/akc3n/banking/issues/110)
- [ING Belgium](https://play.google.com/store/apps/details?id=com.ing.banking) - [Report](https://github.com/akc3n/banking/issues/45)

### Brazil

- [Caixa](https://play.google.com/store/apps/details?id=br.com.gabba.Caixa) - [Report](https://github.com/akc3n/banking/issues/89)
- [Nubank](https://play.google.com/store/apps/details?id=com.nu.production) - [Report](https://github.com/akc3n/banking/issues/92)

### Canada

- [Affinity Credit Union](https://play.google.com/store/apps/details?id=ca.affinitycu.mobile&hl=en) - [Report](https://github.com/akc3n/banking/issues/71)
- [BMO Mobile Banking](https://play.google.com/store/apps/details?id=com.bmo.mobile) - [Report](https://github.com/akc3n/banking/issues/19)
- [EQ Bank Mobile Banking](https://play.google.com/store/apps/details?id=com.eqbank.eqbank) - [Report](https://github.com/akc3n/banking/issues/103)
- [KOHO Financial](https://play.google.com/store/apps/details?id=ca.koho) - [Report](https://github.com/akc3n/banking/issues/104)
- [RBC Mobile](https://play.google.com/store/apps/details?hl=en&id=com.rbc.mobile.android) - [Report](https://github.com/akc3n/banking/issues/32)
- [QuestMobile: Invest & Trade](https://play.google.com/store/apps/details?id=com.questrade.questmobile) - [Report](https://github.com/akc3n/banking/issues/115)
- [Questrade](https://play.google.com/store/apps/details?id=com.questrade.my) - [Report](https://github.com/akc3n/banking/issues/114)
- [Simplii Financial](https://play.google.com/store/apps/details?id=com.pcfinancial.mobile) - [Report](https://github.com/akc3n/banking/issues/17)
- [Tangerine Mobile App](https://play.google.com/store/apps/details?id=ca.tangerine.clients.banking.app) - [Report](https://github.com/akc3n/banking/issues/16)
- [Wealthsimple](https://play.google.com/store/apps/details?id=com.wealthsimple) - [Report](https://github.com/akc3n/banking/issues/116)
- [Wealthsimple Invest](https://play.google.com/store/apps/details?id=com.wealthsimple.trade) - [Report](https://github.com/akc3n/banking/issues/117)

### Czech Republic

- [AirBank](https://play.google.com/store/apps/details?id=cz.airbank.android) - [Report](https://github.com/akc3n/banking/issues/31)
- [CREDITAS Banking](https://play.google.com/store/apps/details?id=cz.creditas.richee) - [Report](https://github.com/akc3n/banking/issues/78)

[ToC ↩︎](#table-of-contents)

### Denmark

- [Mobilbank DK – Danske Bank](https://play.google.com/store/apps/details?id=com.danskebank.mobilebank3.dk) - [Report](https://github.com/akc3n/banking/issues/5)
- [MobilePay](https://play.google.com/store/apps/details?id=dk.danskebank.mobilepay) - [Report](https://github.com/akc3n/banking/issues/7)
- [MitID](https://play.google.com/store/apps/details?id=dk.mitid.app.android) - [Report](https://github.com/akc3n/banking/issues/121)
- [NemID nøgleapp](https://play.google.com/store/apps/details?id=dk.e_nettet.mobilekey.everyone) - [Report](https://github.com/akc3n/banking/issues/10)
- [Nordea Mobile](https://play.google.com/store/apps/details?id=dk.nordea.mobilebank) - [Report](https://github.com/akc3n/banking/issues/118)

### Finland

- [S-mobiili](https://play.google.com/store/apps/details?id=fi.spankki) - [Report](https://github.com/akc3n/banking/issues/43)

### France

- [La Banque Postale](https://play.google.com/store/apps/details?id=com.fullsix.android.labanquepostale.accountaccess) - [Report](https://github.com/akc3n/banking/issues/14)
- [Ma Banque](https://play.google.com/store/apps/details?id=fr.creditagricole.androidapp&gl=FR) - [Report](https://github.com/akc3n/banking/issues/73)

### Germany

- [Commerzbank Banking](https://play.google.com/store/apps/details?id=de.commerzbanking.mobil&hl=en_US&gl=US) - [Report](https://github.com/akc3n/banking/issues/22)
- [Deutsche Bank Mobile](https://play.google.com/store/apps/details?id=com.db.pwcc.dbmobile) - [Report](https://github.com/akc3n/banking/issues/38)
- [DKB](https://play.google.com/store/apps/details?id=com.dkbcodefactory.banking) - [Report](https://github.com/akc3n/banking/issues/106)
- [flatex next](https://play.google.com/store/apps/details?id=de.xcom.flatexde) - [Report](https://github.com/akc3n/banking/issues/59)
- [ING Banking to go](https://play.google.com/store/apps/details?id=de.ingdiba.bankingapp&hl=de&gl=US) - [Report](https://github.com/akc3n/banking/issues/48)
- [Kontist](https://play.google.com/store/apps/details?id=com.kontist&hl=en_US&gl=US) - [Report](https://github.com/akc3n/banking/issues/23)
- [N26 — The Mobile Bank](https://play.google.com/store/apps/details?id=de.number26.android&hl=en_US&gl=US) - [Report](https://github.com/akc3n/banking/issues/21)
- [Penta — Business Banking App](https://play.google.com/store/apps/details?id=com.getpenta.app&hl=en_US&gl=US) - [Report](https://github.com/akc3n/banking/issues/24)
- [Santander Banking](https://play.google.com/store/apps/details?id=de.santander.presentation) - [Report](https://github.com/akc3n/banking/issues/119)
- [Sparkasse](https://play.google.com/store/apps/details?id=com.starfinanz.smob.android.sfinanzstatus) - [Report](https://github.com/akc3n/banking/issues/44)
- [Tomorrow Mobile Banking](https://play.google.com/store/apps/details?id=one.tomorrow.app&hl=en_US&gl=US) - [Report](https://github.com/akc3n/banking/issues/20)
- [Volksbanken Raiffeisenbanken](https://play.google.com/store/apps/details?id=de.fiduciagad.banking.vr) - [Report](https://github.com/akc3n/banking/issues/36)
- [Volksbanken Raiffeisenbanken — Companion App](https://play.google.com/store/apps/details?id=de.fiduciagad.android.vrwallet) - [Report](https://github.com/akc3n/banking/issues/35)

### Hungary

- [UniCredit mBanking](https://play.google.com/store/apps/details?id=hr.asseco.android.jimba.mUCI.hu&hl=en&gl=US) - [Report](https://github.com/akc3n/banking/issues/87)

### India

- [Axis Mobile](https://play.google.com/store/apps/details?id=com.axis.mobile) - [Report](https://github.com/akc3n/banking/issues/139)
- [BHIM](https://play.google.com/store/apps/details?id=in.org.npci.upiapp) - [Report](https://github.com/akc3n/banking/issues/135)
- [Cent Mobile](https://play.google.com/store/apps/details?id=com.infrasofttech.CentralBank) - [Report](https://github.com/akc3n/banking/issues/142)
- [HDFC Bank](https://play.google.com/store/apps/details?id=com.snapwork.hdfc) - [Report](https://github.com/akc3n/banking/issues/138)
- [Kotak - 811 & Mobile Banking](https://play.google.com/store/apps/details?id=com.msf.kbank.mobile) - [Report](https://github.com/akc3n/banking/issues/137)
- [PhonePe](https://play.google.com/store/apps/details?id=com.phonepe.app) - [Report](https://github.com/akc3n/banking/issues/134)
- [Paytm](https://play.google.com/store/apps/details?id=net.one97.paytm) - [Report](https://github.com/akc3n/banking/issues/140)
- [Union Bank of India - nxt](https://play.google.com/store/apps/details?id=com.infrasoft.uboi) - [Report](https://github.com/akc3n/banking/issues/141)
- [YONO SBI](https://play.google.com/store/apps/details?id=com.sbi.lotusintouch&hl=en_IN&gl=US) - [Report](https://github.com/akc3n/banking/issues/79)

## Italy

- [Fineco](https://play.google.com/store/apps/details?id=com.fineco.it) - [Report](https://github.com/akc3n/banking/issues/131)

### Lithuania

- [Revolut](https://play.google.com/store/apps/details?id=com.revolut.revolut) - [Report](https://github.com/akc3n/banking/issues/90)

### Netherlands

- [ABN AMRO](https://play.google.com/store/apps/details?id=com.abnamro.nl.mobile.payments) - [Report](https://github.com/akc3n/banking/issues/108)
- [ASN Bank](https://play.google.com/store/search?q=asn%20bank&c=apps&hl=nl&gl=US) - [Report](https://github.com/akc3n/banking/issues/105)
- [Rabobank](https://play.google.com/store/apps/details?id=nl.rabomobiel) - [Report](https://github.com/akc3n/banking/issues/47)

### Norway

- [Bank Norwegian](https://play.google.com/store/search?q=bank+norwegian&c=apps) - [Report](https://github.com/akc3n/banking/issues/95)
- [DNB Spare](https://play.google.com/store/search?q=dnb+spare+app&c=apps) - [Report](https://github.com/akc3n/banking/issues/98)
- [Engangskode sparebank 1](https://play.google.com/store/search?q=engangskode+sparebank+1&c=apps) - [Report](https://github.com/akc3n/banking/issues/100)
- [Kron](https://play.google.com/store/search?q=kron&c=apps) - [Report](https://github.com/akc3n/banking/issues/97)
- [Nordnet](https://play.google.com/store/search?q=nordnet&c=apps) - [Report](https://github.com/akc3n/banking/issues/99)
- [Sbanken](https://play.google.com/store/search?q=Sbanken&c=apps) - [Report](https://github.com/akc3n/banking/issues/96)
- [Trumf Visa](https://play.google.com/store/search?q=trumf+visa&c=apps) - [Report](https://github.com/akc3n/banking/issues/101)
- [Vipps](https://play.google.com/store/apps/details?id=no.dnb.vipps&hl=en&gl=US) - [Report](https://github.com/akc3n/banking/issues/74)
- [Triodos Bankieren NL](https://play.google.com/store/apps/details?id=com.triodos.bankingnl) - [Report](https://github.com/akc3n/banking/issues/133)

### Poland

- [IKO](https://play.google.com/store/apps/details?id=pl.pkobp.iko) - [Report](https://github.com/akc3n/banking/issues/25)
- [mBank PL](https://play.google.com/store/apps/details?id=pl.mbank) - [Report](https://github.com/akc3n/banking/issues/136)

### Portugal

- [Caixadirecta Empresas](https://play.google.com/store/apps/details?id=pt.cgd.caixadirectaempresas) - [Report](https://github.com/akc3n/banking/issues/120)

### Romania

- [BT Pay — Banca Transilvania](https://play.google.com/store/apps/details?id=ro.btrl.pay) - [Report](https://github.com/akc3n/banking/issues/83)
- [Raiffeisen Smart Mobile PI](https://play.google.com/store/apps/details?id=ro.raiffeisen.smartmobile) - [Report](https://github.com/akc3n/banking/issues/86)

### Serbia

- [Moja mBanka Raiffeisen](https://play.google.com/store/apps/details?id=rs.Raiffeisen.mobile) - [Report](https://github.com/akc3n/banking/issues/70)

### Spain

- [Evo Banco](https://play.google.com/store/apps/details?id=es.evobanco.bancamovil) - [Report](https://github.com/akc3n/banking/issues/112)

### Sweden

- [Avanza](https://play.google.com/store/apps/details?id=se.avanzabank.androidapplikation) - [Report](https://github.com/akc3n/banking/issues/11)
- [BankID säkerhetsapp](https://play.google.com/store/apps/details?id=com.bankid.bus) - [Report](https://github.com/akc3n/banking/issues/8)
- [Länsförsäkringar](https://play.google.com/store/apps/details?id=se.lf.mobile.android) - [Report](https://github.com/akc3n/banking/issues/91)
- [Mobilbank SE — Danske Bank](https://play.google.com/store/apps/details?id=com.danskebank.mobilebank3.se) - [Report](https://github.com/akc3n/banking/issues/4)
- [Nordea Mobile — Sverige](https://play.google.com/store/apps/details?id=se.nordea.mobilebank&hl=sv&gl=US) - [Report](https://github.com/akc3n/banking/issues/9)
- [Swedbank private](https://play.google.com/store/apps/details?id=se.swedbank.mobil) - [Report](https://github.com/akc3n/banking/issues/12)
- [Swish payments](https://play.google.com/store/apps/details?id=se.bankgirot.swish) - [Report](https://github.com/akc3n/banking/issues/6)

### Switzerland

- [Credit Suisse](https://play.google.com/store/apps/details?id=com.csg.cs.dnmb) - [Report](https://github.com/akc3n/banking/issues/72)
- [Raiffeisen E-Banking](https://play.google.com/store/apps/details?id=ch.raiffeisen.android) - [Report](https://github.com/akc3n/banking/issues/26)
- [ZKB Access](https://play.google.com/store/apps/details?id=ch.zkb.digipass) - [Report](https://github.com/akc3n/banking/issues/94)
- [ZKB Mobile Banking](https://play.google.com/store/apps/details?id=ch.zkb.slv.mobile.client.android) - [Report](https://github.com/akc3n/banking/issues/93)

### Taiwan

- [Cathay United Bank](https://play.google.com/store/apps/details?id=com.cathaybk.mymobibank.android) - [Report](https://github.com/akc3n/banking/issues/29)
- [Chunghwa Post](https://play.google.com/store/apps/details?id=com.mitake.android.epost) - [Report](https://github.com/akc3n/banking/issues/27)
- [CTBC Bank Home Bank](https://play.google.com/store/apps/details?id=com.chinatrust.mobilebank) -[Report](https://github.com/akc3n/banking/issues/30)
- [Taishin International Bank](https://play.google.com/store/apps/details?id=tw.com.taishinbank.mobile) - [Report](https://github.com/akc3n/banking/issues/28)

### Ukraine

- [Privat24](https://play.google.com/store/apps/details?id=ua.privatbank.ap24) - [Report](https://github.com/akc3n/banking/issues/124)

### United Arab Emirates

- [ADCB](https://play.google.com/store/apps/details?id=com.adcb.bank) - [Report](https://github.com/akc3n/banking/issues/123)

### United Kingdom

- [Amex United Kingdom](https://play.google.com/store/apps/details?id=com.americanexpress.android.acctsvcs.uk) - [Report](https://github.com/akc3n/banking/issues/40)
- [Barclaycard](https://play.google.com/store/apps/details?id=com.barclays.bca) - [Report](https://github.com/akc3n/banking/issues/42)
- [Chase UK](https://play.google.com/store/apps/details?id=com.chase.intl) - [Report](https://github.com/akc3n/banking/issues/69)
- [First Direct](https://play.google.com/store/apps/details?id=com.firstdirect.bankingonthego&gl=UK) - [Report](https://github.com/akc3n/banking/issues/128)
- [HSBC UK Mobile Banking](https://play.google.com/store/apps/details?id=uk.co.hsbc.hsbcukmobilebanking&hl=en) - [Report](https://github.com/akc3n/banking/issues/33)
- [Lloyds Bank Mobile Banking](https://play.google.com/store/apps/details?id=com.grppl.android.shell.CMBlloydsTSB73) - [Report](https://github.com/akc3n/banking/issues/53)
- [Monzo Bank](https://play.google.com/store/apps/details?id=co.uk.getmondo) - [Report](https://github.com/akc3n/banking/issues/58)
- [NatWest Mobile Banking](https://play.google.com/store/apps/details?id=com.rbs.mobile.android.natwest&hl=en) - [Report](https://github.com/akc3n/banking/issues/34)
- [Revolut](https://play.google.com/store/apps/details?id=com.revolut.revolut) - [Report](https://github.com/akc3n/banking/issues/90)
- [Starling Bank - Mobile Banking](https://play.google.com/store/apps/details?id=com.starlingbank.android) - [Report](https://github.com/akc3n/banking/issues/39)
- [Tesco Bank](https://play.google.com/store/apps/details?id=com.tescobank.mobile&gl=UK) - [Report](https://github.com/akc3n/banking/issues/129)
- [Triodos Bank UK](https://play.google.com/store/apps/details?id=com.triodos.bankinguk) - [Report](https://github.com/akc3n/banking/issues/132)
- [TSB Internet Banking](https://play.google.com/store/apps/details?id=uk.co.tsb.newmobilebank&hl=en_GB&gl=US) - [Report](https://github.com/akc3n/banking/issues/143)
- [Virgin Money Mobile Banking](https://play.google.com/store/apps/details?id=com.virginmoney.uk.mobile.android) - [Report](https://github.com/akc3n/banking/issues/54)

### United States

- [Alliant Mobile Banking](https://play.google.com/store/apps/details?id=org.alliant.mobile&gl=US) - [Report](https://github.com/akc3n/banking/issues/85)
- [Ally: Banking & Investing](https://play.google.com/store/apps/details?id=com.ally.MobileBanking&hl=en_US&gl=US) - [Report](https://github.com/akc3n/banking/issues/113)
- [American Express](https://play.google.com/store/apps/details?id=com.americanexpress.android.acctsvcs.us) - [Report](https://github.com/akc3n/banking/issues/125)
- [BECU](https://play.google.com/store/apps/details?id=org.becu.androidapp&gl=US) - [Report](https://github.com/akc3n/banking/issues/60)
- [Chase Mobile](https://play.google.com/store/appds/details?id=com.chase.sig.android) - [Report](https://github.com/akc3n/banking/issues/13)
- [Chime Mobile Banking](https://play.google.com/store/apps/details?id=com.onedebit.chime&gl=US) - [Report](https://github.com/akc3n/banking/issues/46)
- [Citizens Bank Mobile](https://play.google.com/store/apps/details?id=com.citizensbank.androidapp) - [Report](https://github.com/akc3n/banking/issues/66)
- [DCU Digital Banking](https://play.google.com/store/apps/details?id=com.projectfinance.android.dcu) - [Report](https://github.com/akc3n/banking/issues/67)
- [Discover Mobile](https://play.google.com/store/apps/details?id=com.discoverfinancial.mobile) - [Report](https://github.com/akc3n/banking/issues/64)
- [Fidelity Investments](https://play.google.com/store/apps/details?id=com.fidelity.android) - [Repor](https://github.com/akc3n/banking/issues/65)
- [Fifth Third Mobile Banking](https://play.google.com/store/apps/details?id=com.clairmail.fth) - [Report](https://github.com/akc3n/banking/issues/41)
- [Greenstate CU Mobile](https://play.google.com/store/apps/details?id=com.q2e.universityofiowacommunitycreditunion5086.mobile.production&hl=en_US&gl=US) - [Report](https://github.com/akc3n/banking/issues/122)
- [Grow Mobile Banking](https://play.google.com/store/apps/details?id=com.growfinancialfcu.growfinancialfcu&gl=US) - [Report](https://github.com/akc3n/banking/issues/68)
- [GTE Mobile](https://play.google.com/store/apps/details?id=org.gtefinancial.mobile) - [Report](https://github.com/akc3n/banking/issues/81)
- [GTE Cards (GTE Financial - Debit/Credit card management)](https://play.google.com/store/apps/details?id=com.a84102934.wallet.cardcontrol) - [Report](https://github.com/akc3n/banking/issues/82)
- [Mainstreet Credit Union](https://play.google.com/store/apps/details?id=org.mainstreetcu.grip) - [Report](https://github.com/akc3n/banking/issues/111)
- [PayPal Mobile](https://play.google.com/store/apps/details?id=com.paypal.android.p2pmobile) - [Report](https://github.com/akc3n/banking/issues/127)
- [SchoolsFirst FCU Mobile](https://play.google.com/store/apps/details?id=org.schoolsfirstfcu.mobile.banking.isam) - [Report](https://github.com/akc3n/banking/issues/126)
- [Schwab Mobile](https://play.google.com/store/apps/details?id=com.schwab.mobile&gl=US) - [Report](https://github.com/akc3n/banking/issues/61)
- [Texan CU Mobile](https://play.google.com/store/apps/details?id=com.ifs.banking.fiid1373) - [Report](https://github.com/akc3n/banking/issues/56)
- [USAA Mobile](https://play.google.com/store/apps/details?id=com.usaa.mobile.android.usaa&gl=US) - [Report](https://github.com/akc3n/banking/issues/80)
- [U.S. Bank Mobile](https://play.google.com/store/apps/details?id=com.usbank.mobilebanking&gl=US) - [Report](https://github.com/akc3n/banking/issues/84)
- [Wells Fargo Mobile](https://play.google.com/store/apps/details?id=com.wf.wellsfargomobile&hl=en_US&gl=US) - [Report](https://github.com/akc3n/banking/issues/63)

---
## List of Submitted Banking Apps

Here you will find a current list of submitted Banking Apps that work on GrapheneOS via this projects [issue-tracker](https://github.com/akc3n/banking/issues).

## Submit a Banking App

**Report a banking app's compatibility on GrapheneOS**  

Please use this issue form to submit a report on the banking app that you use on GrapheneOS:  

**[SUBMIT REPORT](https://github.com/akc3n/banking/issues/new?assignees=&labels=&template=app_report.yml)**  

## Alternative Ways to Submit

For non-GitHub users that would like to contribute:  
- [Gist](https://gist.github.com/akc3n/e845078ddbbb28ada0dd055c51ec45af)
- [Screenshot](https://akc3n.org/assets/issue-form.webp)
- [Download Raw](https://gist.githubusercontent.com/akc3n/e845078ddbbb28ada0dd055c51ec45af/raw/63b2d2444bf0b9881c22c2a0514a1163116ec27f/issue-form.md) *(Right Click → Save Link As)*
  
```
curl -O https://gist.githubusercontent.com/akc3n/e845078ddbbb28ada0dd055c51ec45af/raw/63b2d2444bf0b9881c22c2a0514a1163116ec27f/issue-form.md
```
My [Contact](https://akc3n.org/about/#contact) info for alternative method of submitting banking app report.  

---

## Notes

If you have any issues with what is listed on this site or about this project page, you may open an issue on this [issue-tracker](https://github.com/PrivSec-dev/banking-apps-compat-report/issues) or [contact](https://akc3n.org/about/#contact) me directly.

 - GrapheneOS has a [detailed guide](https://grapheneos.org/articles/attestation-compatibility-guide) for app developers on how to support GrapheneOS with the hardware attestation API. Direct use of the hardware attestation API provides much higher assurance than using SafetyNet so these apps have nothing to lose by using a more meaningful API and supporting a more secure OS.  

> GrapheneOS users are strongly encouraged to share this documentation with app developers enforcing only being able to use the stock OS. Send an email to the developers and leave a review of the app with a link to this information. Share it with other users and create pressure to support GrapheneOS rather than locking users into the stock OS without a valid security reason. GrapheneOS not only upholds the app security model but substantially reinforces it, so it cannot be justified with reasoning based on security, anti-fraud, etc.

### Contributors

Thank you for collaborating on project and contributing:  
- [JollyRoger](https://github.com/Peter-Easton) - [PR](https://github.com/akc3n/banking/pull/18/commits) 

[^1]: [GrapheneOS Banking apps - paras. 3, ln. 2](https://grapheneos.org/usage#banking-apps)