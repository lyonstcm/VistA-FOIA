ACHSUDF ; IHS/ITSC/PMF - FORMAT DOCUMENT DATA FOR PRINT/DISPLAY(1/2) ;    [ 01/10/2005  9:14 AM ]
 ;;3.1;CONTRACT HEALTH MGMT SYSTEM;**7,11,12,15,16,19**;JUNE 11,2001
 ;ITSC/SET/JVK ACHS*3.1*7 - USE E-SIG IN DOCUMENT GLOBAL
 ;ITSC/SET/JVK ACHS*3.1*11 MODIFIED TO DISPLAY MEDICARE PROVIDER
 ;ITSC/SET/JVK ACHS*3.1*12- 1.4.04 MOD FOR PAWNEE BEN PKG
 ;ACHS*3.1*16 11/12/2009 IHS.OIT.FCJ CHNG THE DISPLAY OF SSN AND THE DUNS INSTEAD OF UPIN
 ;
PTA ;
 G FAC:$D(ACHSBLKF)!$D(ACHSSLOC)
 S:$D(ACHSDIEN) ACHSPATF=$P(^ACHSF(DUZ(2),"D",ACHSDIEN,0),U,20)
 S A(1)="Fac: "_$S(ACHSPATF]"":$P(^AUTTLOC(ACHSPATF,0),U,10),1:$P(^AUTTLOC(DUZ(2),0),U,10))
 S:$D(ACHSDIEN) ACHSHRN=$P(^ACHSF(DUZ(2),"D",ACHSDIEN,0),U,21)
 I ACHSHRN<1 S ACHSHRN=$$HRN^ACHS(DFN,DUZ(2))
 S ACHSHRN=$E(1000000+ACHSHRN,2,7),A(1)=A(1)_"  IHS#: "_ACHSHRN
 ;
 ;12/1/00  pmf  added for special Pawnee benefit
 I $P($G(^AUTTLOC($S($D(ACHSDUZ2):ACHSDUZ2,1:DUZ(2)),0)),U,10)=505613 D PBPPN
 ;
 S T=""
 I $D(^AUPNPAT(DFN,11)) S X=$P($G(^AUPNPAT(DFN,11)),U,8) I X,$D(^AUTTTRI(X,0)) S T=$P($G(^AUTTTRI(X,0)),U,2)
 S (D,L,A(5))=""
 F  S D=$O(^AUPNPAT(DFN,51,D)) Q:L&(D="")  G P3:D="" S:$D(^(D,0)) L=$P(^(0),U,3)
 G P3:'$D(^AUTTCOM(L,0)) S X=$G(^AUTTCOM(L,0)),A(5)=$P(X,U,7)_"-",L=$P(X,U,2)
 I L,$D(^AUTTCTY(L,0)) S A(5)=A(5)_$P(^(0),U,3)_"-"
 E  S A(5)=A(5)_"  -"
 S X=$P(X,U,3)
 I X,$D(^DIC(5,X,0)) S A(5)=A(5)_$P(^(0),U,3)
P3 ;
 I $D(^DPT(DFN,0)) D
 . S X=$G(^DPT(DFN,0))
 . S Y=$P(X,U)
 . S A(2)=$P(Y,",")_", "_$P(Y,",",2,99)
 . S A(2)=$E(A(2),1,37)
 . Q
 ;
 S A(3)=""
 G P4:'$D(^DPT(DFN,.11)) S X=$G(^DPT(DFN,.11)),Y=$P(X,U,4),A(3)=Y
 I $L(Y)<1 S A(3)="   "
 S A(3)=A(3)_", ",Y=$P(X,U,5)
 I Y,$D(^DIC(5,Y,0)) S A(3)=A(3)_$P($G(^DIC(5,Y,0)),U,2)_"  "
 S Y=$P(X,U,6)
 I $L(Y)<1 S Y="  "
 S A(3)=A(3)_Y
P4 ;
 S X=$G(^DPT(DFN,0)),Y=$P(X,U,3),A(4)=$S('Y:"        ",1:$E(Y,4,5)_"-"_$E(Y,6,7)_"-"_($E(Y,1,3)+1700))
 S Y=$P(X,U,2),A(4)=A(4)_"  "_$S(Y="M":"M",Y="F":"F",1:"")_"  "_T,ACHSVAL1=$P($G(^AUPNPAT(DFN,11)),U,9) I ACHSVAL1="" S ACHSVAL1=$P($G(^AUPNPAT(DFN,11)),U,10)
 D QUANTCV
 S A(4)=A(4)_"  00"_Y
 ;ACHS*3.1*16 11/12/2009 IHS.OIT.FCJ CHNG THE DISPLAY OF SSN
 ;I $P($G(^DPT(DFN,0)),U,9)]"" S A(1)=A(1)_"   "_$P($G(^DPT(DFN,0)),U,9),A(11)=$P($G(^DPT(DFN,0)),U,9)
 I $P($G(^DPT(DFN,0)),U,9)]"" S A(1)=A(1)_"   "_"XXXXX"_$E($P($G(^DPT(DFN,0)),U,9),6,9),A(11)="XXXXX"_$E($P($G(^DPT(DFN,0)),U,9),6,9)
 I '$D(ACHSDIEN) S A(6)="",A(7)=$G(ACHSDES)
 I $D(ACHSDIEN) S:$D(^ACHSF(DUZ(2),"D",ACHSDIEN,3)) ACHSFDT=$P(^ACHSF(DUZ(2),"D",ACHSDIEN,3),U) S:$D(^ACHSF(DUZ(2),"D",ACHSDIEN,1)) A(7)=ACHSDES
 K ACHSVAL1
 Q
 ;
PBPPN ;
 ;12/4/00  pmf  add this tag for special Pawnee Benefit
 ;ITSC/SET/JVK ACHS*3.1*12 MOD FOR IHS/OKCAO/KJR
 ;S ACHSBPNO=$P($G(^AZOPBPP(DFN,0)),U,2) I ACHSBPNO'="" Q
 S ACHSBPNO=$P($G(^AZOPBPP(DFN,0)),U,2) I ACHSBPNO="" Q
 ;S A(1)=A(1)_" BP#: "_ACHSBPNO
 S A(1)=$E(A(1),1,11)_" BP#: "_ACHSBPNO
 Q
 ;
FAC ;EP - Set CHS Mailing Address into "B" arrary.
 Q:'$G(DUZ(2))
 Q:'$D(^AUTTLOC(DUZ(2),0))
 I $D(^ACHSF(DUZ(2),0)),$P(^(0),U,3)]"" G FAC1
 S B(1)=$$LOC^ACHS,X=$G(^AUTTLOC(DUZ(2),0)),B(2)=$P(X,U,12),B(3)=$P(X,U,13),Y=$P(X,U,14)
 I Y,$D(^DIC(5,Y,0)) S B(3)=B(3)_$S(B(3)="":"",1:" ")_$P(^(0),U,2)
 S B(3)=B(3)_" "_$P(X,U,15)
 G FAC2
 ;
FAC1 ;
 S X=$G(^ACHSF(DUZ(2),0)),B(1)=$$LOC^ACHS,B(2)=$P(X,U,2),B(3)=$P(X,U,3),DIC(15)=$P(X,U,11),Y=$P(X,U,4)
 I Y,$D(^DIC(5,Y,0)) S B(3)=B(3)_$S(B(3)="":"",1:" ")_$P(^(0),U,2)
 S B(3)=B(3)_" "_$P(X,U,5)
FAC2 ;
 S B(4)=$P(^AUTTLOC(DUZ(2),0),U,10)
 I $$PARM^ACHS(2,25)="Y" S X=$P(^ACHSF(DUZ(2),0),U,12) S:+X>0 B(4)=$P(^AUTTLOC(X,0),U,10)
 Q
 ;
PRO ; Modified from PRO to P9 for Rate/AGR of Providers.
 S ACHSAGRP=$G(ACHSAGRP),ACHSCONP=$G(ACHSCONP),ACHSDRG=$G(ACHSDRG)
 S ACHSMPP=$G(ACHSMPP)
 G P9:'$D(ACHSPROV),P9:'ACHSPROV,P9:'$D(^AUTTVNDR(ACHSPROV,0)) S D(14)=$P(^(0),U,6),X=$P(^(0),U)
 S:X["," X=$P(X,",",2)_" "_$P(X,",")
 S D(1)=$E($P(X,U),1,35)
 G PRO2:'$D(^AUTTVNDR(ACHSPROV,11)) S X=$G(^AUTTVNDR(ACHSPROV,11)),D(4)=$P(X,U),D(6)=$P(X,U,9)
 S:$P(X,U,3)?1N.N D(7)=$G(^AUTTVTYP($P(X,U,3),0)),D(7)=$P(D(7),U)
 I $P(X,U,2)]"" S D(4)=D(4)_"-"_$P(X,U,2)
 I $P(X,U,14)]"" S D("FAX")=$P(X,U,14) ;ACHS*3.1*19 IHS/BJI/WFD 01/11 Adding Fax var
 I D(6)'="" S D(6)=$TR(D(6),"()- ","") D
 . I D(6)?1N.N S:$L(D(6))>7 D(6)=$E(D(6),1,3)_"    "_$E(D(6),4,6)_"-"_$E(D(6),7,13) S:$L(D(6))=7 D(6)="       "_$E(D(6),1,3)_"-"_$E(D(6),4,7) S:$L(D(6))<7 D(6)="" Q
 . S:$L(D(6))>7 D(6)="       "_$E(D(6),1,3)_"-"_$E(D(6),4,7)_" "_$E(D(6),8,13)
 . S:$L(D(6))<7 D(6)=""
 .Q
 S D(5)=""
 I $D(ACHSDEST) S D(5)=$S(ACHSDEST="I":"IHS",1:"FI")
PRO2 ;
 G PRO3:'$D(^AUTTVNDR(ACHSPROV,13)) S X=^AUTTVNDR(ACHSPROV,13),D(2)=$P(X,U),D(3)=$P(X,U,2),Y=$P(X,U,3)
 I Y,$D(^DIC(5,Y,0)) S Y=$P(^(0),U,2),D(3)=D(3)_$S(D(3)="":"",1:", ")_Y
 S D(3)=D(3)_"  "_$P(X,U,4)
PRO3 ;
 S ACHSARCO=$P(^ACHSF(DUZ(2),0),U,11)
 ;ACHS*3.1*16 11.12.2009 IHS.OIT.FCJ TEST FOR DUNS PARAMETER PRINT DUNS INSTEAD OF UPIN
 ;S:$D(^AUTTVNDR(ACHSPROV,17)) D(8)=$P(^(17),U)
 ;I D(8)=$S($$PARM^ACHS(2,13)="Y":$P(^AUTTVNDR(ACHSPROV,0),U,7),$D(^AUTTVNDR(ACHSPROV,17)):D(8)=$P(^(17),U),1:"")
 I $$PARM^ACHS(2,13)="Y" S D(8)=$P(^AUTTVNDR(ACHSPROV,0),U,7)
 E  I $D(^AUTTVNDR(ACHSPROV,17)) S D(8)=$P(^(17),U)
 S D(9)=ACHSARCO_"-"
 S:ACHSCONP'="" D(10)=13
 I ACHSAGRP="" G P9
 I '$D(^AUTTVNDR(ACHSPROV,18,ACHSAGRP,0)) S ACHSAGRP="" G P9
 S Z=$S($D(^AUTTVNDR(ACHSPROV,18,ACHSAGRP,0)):$P(^(0),U,10),1:"")
 I Z="" G P9
 I Z="RQ" S D(10)=37,Y=$S($D(^AUTTVNDR(ACHSPROV,18,ACHSAGRP,0)):$P(^(0),U,6),1:"") X:Y'="" ^DD("DD") S D(11)=Y
 S:Z="PA" D(10)=24
 S ACHSDRG=$S(ACHSTYP=1:$S($D(^AUTTVNDR(ACHSPROV,18,ACHSAGRP,0)):$P(^(0),U,4),1:""),(ACHSTYP=3)!(ACHSTYP=2):$S($D(^AUTTVNDR(ACHSPROV,18,ACHSAGRP,0)):$P(^(0),U,5),1:""))
 S D(12)=$S(ACHSDRG="Y":22,ACHSDRG="N":37,1:"")
 S D(14)=$S(D(14)="S":3,D(14)="SD":21,D(14)="SW":46,(D(14)="L")!(D(14)="O"):67,1:"")
 G P9
 ;
PRO4 ;THIS SECTION NEVER EXECUTED
13 ;
 S D(9)=ACHSARCO_"-"_$E(ACHSCFY,3,4)_"-"
 Q
 ;
24 ;
 S D(9)=ACHSARCO_"-PA-"_$E(ACHSRATE,1,2)
 Q
 ;
37 ;
 S D(11)=$$FMTE^XLFDT($P(^AUTTVNDR(ACHSPROV,18,ACHSRATE,0),U,6)),D(9)=ACHSARCO_"-"_$E(ACHSRATE,1,2)_"-"
 Q
 ;
P9 ;
 Q
 ;
ALL ;EP.
 S:$D(ACHSDES) A(7)=ACHSDES
 D PTA,FAC,PRO
 G UDF1
 ;
PRT ;EP.
 D PTA:DFN]"",PRO
 G UDF1
 ;
QUANTCV ;
 S Y=7
 I +ACHSVAL1'>0 G QUANTIHS
 S X1=$P(ACHSVAL1,"/",1),X2=$P(ACHSVAL1,"/",2)
 I +X2=0 Q
 S X=X1/X2
 G QUANTCVB
 ;
QUANTIHS ;
 I ACHSVAL1="FULL" S Y=1 Q
 I ACHSVAL1="NONE" S Y=5 Q
 I ACHSVAL1="UNSPECIFIED" S Y=6 Q
 I ACHSVAL1="UNKNOWN" S Y=7 Q
 Q:+ACHSVAL1'>0
QUANTCVB ;
 S Y=$S(X=1:1,X'<.5:2,X'<.25:3,1:4)
 Q
 ;
UDF1 ;
 S X=ACHSESDO,X2="2$",X3=0
 D COMMA^%DTC
 S E(9)=X,E(7)=$E(ACHSODT,4,5)_"-"_(+$E(ACHSODT,6,7))_"-"_$E(ACHSODT,2,3)
 S F(6)="Open Market"
 I ACHSCONP,$D(^AUTTVNDR(ACHSPROV,"CN",ACHSCONP,0)) S F(6)=$P(^(0),U),D(13)=$P(^(0),U,5),D(9)=F(6)
 ;ITSC/SET/JVK ACHS*3.1*11 GET FOR MEDICARE PROVIDER INFO
 I ACHSMPP,$L(ACHSDS)=1 S ACHSDS=$$EXTSET^XBFUNC(9999999.112303,2,ACHSDS)
 I ACHSMPP S F(6)="Medicare #:"_$P(ACHSMPN,U),D(13)=ACHSDS,D(9)=$P(ACHSMPN,U)
 ;
 I +ACHSAGRP<1 G A5
 S X=$G(^AUTTVNDR(ACHSPROV,18,ACHSAGRP,0)),Z=$P(X,U,10)
 S F(6)=$E($P(X,U,1),1,2)_$S(Z="PA":"-PA-",Z="RQ":"-R-",Z="BPA":"-A-",1:"unkn")
 S Y=$E($P(X,U,1),3,6)
 S:Z'="PA" F(6)=F(6)_$E(Y,1,4)
 S:Z="PA" F(6)=F(6)_$E(Y,2,4)
 S:$D(D(9)) D(9)=D(9)_F(6)
 ;ACHS*3.1*15 IHS.OIT.FCJ ADDED NXT LINE FOR NEW RATE/AGREEMENT FORMATS
 I $L($P(^AUTTVNDR(ACHSPROV,18,ACHSAGRP,0),U))>6 S (F(6),D(9))=$P(^AUTTVNDR(ACHSPROV,18,ACHSAGRP,0),U)
 S:ACHSDRG'="N" D(13)=$S(ACHSTYP=1:"IP:"_$P(^AUTTVNDR(ACHSPROV,18,ACHSAGRP,0),U,2),(ACHSTYP=3)!(ACHSTYP=2):"OP:"_$P(^AUTTVNDR(ACHSPROV,18,ACHSAGRP,0),U,3))
 I $P(^AUTTVNDR(ACHSPROV,18,ACHSAGRP,0),U,7)'="" S D(15)="PS:"_$P(^AUTTVNDR(ACHSPROV,18,ACHSAGRP,0),U,7)
A5 ;
 S:ACHSDRG="Y" D(13)="Medicare Rate"
 I ACHSOBJC,$D(^ACHSOCC(ACHSOBJC,0)) S %=$P(^(0),U),F(9)=$E(%,1,2)_"."_$E(%,3,4)
 I ACHSSCC,$D(^ACHS(3,DUZ(2),1,ACHSSCC,0)) S X=$P(^(0),U),F(8)=$E(X,1,2)_"."_$E(X,3,99)
 I ACHSCAN,$D(^ACHS(2,ACHSCAN,0)) S F(7)=$P(^(0),U)
 I $D(ACHSHON),ACHSHON,$D(^ACHSF(DUZ(2),"D",ACHSHON,0)) S E(10)=$P(^(0),U,14)_"-"_ACHSFC_"-"_$P(^(0),U)
 ;ITSC/SET/JVK ACHS*3.1*7 ADD NEXT THREE LINES
 ;S ACHSSIG=$S($D(^ACHSF(DUZ(2),"P")):$P(^("P"),U,ACHSTYP),1:"")
 I $D(ACHSDIEN),$P(^ACHSF(DUZ(2),"D",ACHSDIEN,0),U,24)'="" S ACHSSIG=$$GET1^DIQ(200,($P(^ACHSF(DUZ(2),"D",ACHSDIEN,0),U,24)),20.3)
 I $D(ACHSDIEN),$P(^ACHSF(DUZ(2),"D",ACHSDIEN,0),U,24)="" S ACHSSIG=$S($D(^ACHSF(DUZ(2),"P")):$P(^("P"),U,ACHSTYP),1:"")
 I $D(ACHSDIEN),$D(^ACHSF(DUZ(2),"D",ACHSDIEN,0)) S ACHSDEST=$P(^(0),U,17),ACHSDCR=$P(^(0),U,19)
 I $D(ACHSEDOS) S A(6)="Est. date-of-svc.: "_$$FMTE^XLFDT(ACHSEDOS)
 I $D(ACHSDOS),ACHSDOS S A(8)="Actual DOS: "_$$FMTE^XLFDT(ACHSDOS)
 K C,X2,X3
 I ACHSTYP=2 S C(1)=" AUTHORIZATION PERIOD",C(2)="   FROM      TO",C(3)="----------   ----------",C(4)="" I ACHSFDT]"" S A(6)=$$FMTE^XLFDT(ACHSFDT)_"  "_$$FMTE^XLFDT(ACHSTDT),C(4)=A(6),C(5)=$$FMTE^XLFDT(ACHSFDT),C(6)=$$FMTE^XLFDT(ACHSTDT)
 I (ACHSTYP=3)!(ACHSTYP=1),ACHSFDT]"" S C(5)=$$FMTE^XLFDT(ACHSFDT),C(4)="Auth. From "_C(5) I ACHSTDT]"" S C(6)=$$FMTE^XLFDT(ACHSTDT),C(4)=C(4)_" to "_C(6)
BLN ; 
 G MCR:'$D(ACHSBLKF)&'$D(ACHSSLOC)
 S L=99,C=0
 F I=1:1 S X=$P(ACHSBLT," ",I) Q:X=""  S:$L(X)+L>37 C=C+1,L=0,A(C)="" S:A(C)]"" A(C)=A(C)_" " S A(C)=A(C)_X,L=L+$L(X)+1
 K Y
 G END
 ;
MCR ; Check/format MediCare eligible.
 S A(9)=""
 G:'$D(^AUPNMCR(DFN)) RRE
 S Y=+$P($G(^AUPNMCR(DFN,0)),U,3),Y(1)=$P($G(^AUPNMCR(DFN,0)),U,4)
 G:Y']"" RRE
 I Y(1)']"" S A(9)="MCR="_Y G MCD
 I $D(^AUTTMCS(Y(1))) S A(9)="MCR="_Y_$P(^AUTTMCS(Y(1),0),U)
 G MCD
 ;
RRE ; Check/format RailRoad eligible.
 I $D(^AUPNRRE(DFN,0)) S X=$G(^AUPNRRE(DFN,0)),Y=$P(X,U,3),Y(1)=$P(X,U,4),A(9)="RRR=<unknown>"_Y(1) I Y,$D(^AUTTRRP(Y,0)) S A(9)="RRR="_$P($G(^AUTTRRP(Y,0)),U)_Y(1)
 ;
MCD ; Check/format MediCaid eligible.
 G PVT:'$D(^AUPNMCD("B",DFN))
 S (X,Y)=0
 F  S Y=$O(^AUPNMCD("B",DFN,Y)) Q:+Y'=Y  S X=Y
 I X S A(9)=A(9)_$S($L(A(9)):" ",1:"")_"MCD="_$P(^AUPNMCD(X,0),U,3)_" "
 ;
PVT ; Check/format Private ins. eligible.
 I $D(^AUPNPRVT(DFN,11)),$O(^(11,0)) S X=0 F  S X=$O(^AUPNPRVT(DFN,11,X)) Q:'X  S Y=$P(^(X,0),U,7) I Y=""!(Y>ACHSEDOS) S A(9)=A(9)_"PVT INS" Q
 S A(10)=$S(ACHSTYP=1:"Est. Days: "_ACHSESDA,((ACHSTYP=3)&($D(E(10)))):"Hosp Ord #: "_E(10),1:"")
END ;
 Q
 ;