BMCFPRNP ; IHS/OIT/FCJ - PRINT PHYSICIAN CONSULT LETTER ;   [ 10/31/2006  2:40 PM ]
 ;;4.0;REFERRED CARE INFO SYSTEM;**2**;JAN 09, 2006
 ;
 ;Consultation Letter to recieve information back from the consult visit
 ;letter to be sent with patient
 ;
PRINT ;print consult letter
 S BMCR0=^BMCREF(BMCREF,0),BMCPG=0,BMCDFN=$P(BMCR0,U,3)
 D @("HEAD"_(2-($E(IOST,1,2)="C-")))
 S BMCQUIT=0
 S X="CONSULT REQUEST" S N=1,C=1 D W
 S BMCFTYP=$S($E($P(^BMCTFORM(BMCFTYPE,0),U),1,4)="CALL":"CI",1:"S")
 S Y=DT X ^DD("DD")
 S X="DATE: "_Y S N=1,C=0,T=0 D W
PHY ;PHYSICIAN INFORMATION; REFERRED TO AND REFERRED FROM
 D @$$VALI^XBDIQ1(90001,BMCREF,.04) Q:BMCQUIT
 ;
PURPOSE ;
 S X="REASON FOR REQUEST: "_$$VAL^XBDIQ1(90001,BMCREF,1201)
 I $L(X)>IOM D  I 1
 .S BMCX=X S X=$E(BMCX,1,IOM),N=2,C=0,T=0 D W Q:BMCQUIT
 .S X=$E(BMCX,(IOM+1),IOM),N=1,C=0,T=22 D W Q:BMCQUIT
 E  S C=0,N=1,T=0 D W Q:BMCQUIT
PERTMED ;
 S BMCCMT=0
 F  S BMCCMT=$O(^BMCCOM("AD",BMCREF,BMCCMT)) Q:BMCCMT'?1N.N  D
 .Q:$P(^BMCCOM(BMCCMT,0),U,5)'="M"
 .S BMCNODE=1,BMCIOM=70,BMCFILE=90001.03,BMCDA=BMCCMT,BMCNODE=1
 .D WP K BMCIOM
 .S Y=0 F  S Y=$O(BMCWP(Y)) Q:Y'=+Y!(BMCQUIT)  D
 ..I $Y>(IOSL-3) D HEAD Q:BMCQUIT
 ..W !?5,BMCWP(Y)
DX S X="PROVISIONAL DIAGNOSIS: "_$$VAL^XBDIQ1(90001,BMCREF,.21),C=0,T=0,N=2 D W Q:BMCQUIT
 I BMCFTYP'="CI" S X="PHYSICIAN'S SIGNATURE (ELECTONIC SIGNATURE):  "_$$VAL^XBDIQ1(90001,BMCREF,.06),N=2,T=0,C=0 D W Q:BMCQUIT
CONSULT ;CONSULT INFORMATION
 S X="CONSULTATION REPORT:" S N=2,C=1,T=0 D W
 S X="CONSULTING PHYSICIAN SIGNATURE:                  "
 S X=X_"              DATE:" S N=10,C=0,T=0 D W
REFFROM ;
 S BMCV=$P(BMCR0,U,5)
 S Y=$P(BMCR0,U,4)
 S X="Return To: "_$$VAL^XBDIQ1(90001,BMCV,.05),N=2,C=0,T=0 D W
 I $$VAL^XBDIQ1(90001.31,BMCV,201)'="" D
 .S X=$$VAL^XBDIQ1(90001.31,BMCV,201)
 .I BMCV,X]"" S N=1,C=0,T=11 D W Q:BMCQUIT
 .S X=$$VAL^XBDIQ1(90001.31,BMCV,202)
 .I BMCV,X]"" D
 ..S X=X_",  "_$$VAL^XBDIQ1(90001.31,BMCV,203)
 ..S X=X_"   "_$$VAL^XBDIQ1(90001.31,BMCV,204),N=1,C=0,T=11 D W Q:BMCQUIT
 E  I $$VAL^XBDIQ1(9999999.06,BMCV,.14)'="" D
 .S X=$$VAL^XBDIQ1(9999999.06,BMCV,.14)
 .I BMCV,X]"" S N=1,C=0,T=11 D W Q:BMCQUIT
 .S X=$$VAL^XBDIQ1(9999999.06,BMCV,.15)
 .I BMCV,X]"" D
 ..S X=X_",  "_$$VAL^XBDIQ1(9999999.06,BMCV,.16)
 ..S X=X_"   "_$$VAL^XBDIQ1(9999999.06,BMCV,.17),N=1,C=0,T=11 D W Q:BMCQUIT
 S X=$$VAL^XBDIQ1(90001.31,BMCV,.17)
 S X=X_"     (phone:  "_$$VAL^XBDIQ1(90001.31,BMCV,.18)_")",N=1,C=0,T=11 D W Q:BMCQUIT
 ;
DEMO ;Demographic Data
 S X="Patient Name:  "_$$VAL^XBDIQ1(90001,BMCREF,.03),C=0,T=0,N=2 D W Q:BMCQUIT
 S X="DOB:  "_$$VAL^XBDIQ1(2,$P(BMCR0,U,3),.03),N=0,T=54,C=0 D W Q:BMCQUIT
 S X="IHS ID Number:  "_$$HRN^AUPNPAT($P(BMCR0,U,3),DUZ(2),2),N=1,T=0,C=0 D W Q:BMCQUIT
 S X="Referral #: "_$$VAL^XBDIQ1(90001,BMCREF,.02),N=0,C=0,T=25 D W Q:BMCQUIT
 S X="Date of Service: "_$$AVDOS^BMCRLU(BMCREF,"E"),N=0,C=0,T=54 D W Q:BMCQUIT
 Q
TEXT ;
 W ! D S
 K BMCWP
 S BMCCHSAS=$P($G(^BMCREF(BMCREF,11)),U,12)
 I $P(BMCR0,U,4)="C" S BMCNODE=$S(BMCCHSAS="A":1,BMCCHSAS="D":2,BMCCHSAS="P":3,1:3) S BMCFILE=90001.33,BMCDA=BMCFTYPE D WPTXT
 I $P(BMCR0,U,4)="O" S BMCNODE=2,BMCFILE=90001.33,BMCDA=BMCFTYPE D WPTXT
 I $P(BMCR0,U,4)="I"!($P(BMCR0,U,4)="N") W ! S BMCWP(1)=""
 ;
 S BMCY=0 F  S BMCY=$O(BMCWP(BMCY)) Q:BMCY'=+BMCY!(BMCQUIT)  D
 .I $Y>(IOSL-3) D HEAD Q:BMCQUIT
 .W !,BMCWP(BMCY)
 ;
W ;
 Q:X=""
 NEW %
 S %=$L(X)
 I $Y>(IOSL-4) D HEAD Q:BMCQUIT
 I N F I=1:1:N W !
 I $G(C) W ?(IOM-$L(X)/2),X Q
 S %=$S($G(T):T,1:0) W ?%,X
 Q
S ;
 S T=0,X=$TR($J(" ",IOM)," ","*"),N=1,C=0 D W
 Q
C ;
 S BMCV=$P(BMCR0,U,7)
 Q:'BMCV
 S X="To:  "_$$VAL^XBDIQ1(90001,BMCREF,.07)_$S($$VAL^XBDIQ1(9999999.11,BMCV,1109)]"":"  ("_$$VAL^XBDIQ1(9999999.11,BMCV,1109)_")",1:""),N=2,C=0,T=0 D W Q:BMCQUIT
 S X="Referring Provider: "_$$VAL^XBDIQ1(90001,BMCREF,.06),N=0,T=40,C=0 D W Q:BMCQUIT
 I $P(BMCR0,U,9) S X="("_$$VAL^XBDIQ1(90001,BMCREF,.09)_")",N=1,C=0,T=5 D W Q:BMCQUIT
 S X=$$VAL^XBDIQ1(9999999.11,BMCV,1301),N=1,C=0,T=5 D W Q:BMCQUIT
 I $G(^AUTTVNDR(BMCV,13))'="" D  Q:BMCQUIT
 .S BMCVIEN=$P(^AUTTVNDR(BMCV,13),U,3)
 .S X=$$VAL^XBDIQ1(9999999.11,BMCV,1302)_", "
 .I BMCVIEN'="" S X=X_$$VAL^XBDIQ1(5,BMCVIEN,1)_" "_$$VAL^XBDIQ1(9999999.11,BMCV,1304)
 .S N=1,C=0,T=5 D W
 W !
 Q
I ;
 S BMCV=$P(BMCR0,U,8)
 Q:'BMCV
 S X="To: "_$$VAL^XBDIQ1(90001,BMCREF,.08)_$S($$VAL^XBDIQ1(9999999.06,BMCV,.13)]"":"  ("_$$VAL^XBDIQ1(9999999.06,BMCV,.13)_")",1:"") S N=2,C=0,T=0 D W Q:BMCQUIT
 S X="Referring Provider: "_$$VAL^XBDIQ1(90001,BMCREF,.06),N=0,T=40,C=0 D W Q:BMCQUIT
 I $P(BMCR0,U,9) S X="("_$$VAL^XBDIQ1(90001,BMCREF,.09)_")" S N=1,C=0,T=5 D W Q:BMCQUIT
 I $$VAL^XBDIQ1(9999999.06,BMCV,.14)]"" S X=$$VAL^XBDIQ1(9999999.06,BMCV,.14) S N=1,C=0,T=5 D W Q:BMCQUIT
 I $$VAL^XBDIQ1(9999999.06,BMCV,.15)]"" S X=$$VAL^XBDIQ1(9999999.06,BMCV,.15)_",  "_$$VAL^XBDIQ1(9999999.06,BMCV,.16)_"   "_$$VAL^XBDIQ1(9999999.06,BMCV,.17),N=1,C=0,T=5 D W Q:BMCQUIT
 Q
N ;
 S X="IN HOUSE REFERRAL",N=1,C=0,T=0 D W Q:BMCQUIT
 S X="To:  "_$$VAL^XBDIQ1(90001,BMCREF,.23)_" clinic",N=1,C=0,T=0 D W Q:BMCQUIT
 S X="Referring Provider: "_$$VAL^XBDIQ1(90001,BMCREF,.06),N=0,T=40,C=0 D W Q:BMCQUIT
 Q
O ;
 S BMCV=$P(BMCR0,U,7)
 I BMCV D  I 1
 .S X="To:  "_$$VAL^XBDIQ1(90001,BMCREF,.07)_$S($$VAL^XBDIQ1(9999999.11,BMCV,1109)]"":"  ("_$$VAL^XBDIQ1(9999999.11,BMCV,1109)_")",1:"") S N=1,C=0,T=0 D W Q:BMCQUIT
 .S X="Referring Provider: "_$$VAL^XBDIQ1(90001,BMCREF,.06),N=0,T=40,C=0 D W Q:BMCQUIT
 .I $P(BMCR0,U,9) S X="("_$$VAL^XBDIQ1(90001,BMCREF,.09)_")" S N=1,C=0,T=5 D W Q:BMCQUIT
 .I $$VAL^XBDIQ1(9999999.11,BMCV,1301)]"" S X=$$VAL^XBDIQ1(9999999.11,BMCV,1301)_$S($$VAL^XBDIQ1(9999999.11,BMCV,1310)]"":",  "_$$VAL^XBDIQ1(9999999.11,BMCV,1310),1:"") S N=1,C=0,T=5 D W Q:BMCQUIT
 .I $$VAL^XBDIQ1(9999999.11,BMCV,1302)]"" S X=$$VAL^XBDIQ1(9999999.11,BMCV,1302)_",  "_$$VAL^XBDIQ1(9999999.11,BMCV,1303)_"   "_$$VAL^XBDIQ1(9999999.11,BMCV,1304),N=1,C=0,T=5 D W Q:BMCQUIT
 E  S X="To:  "_$$VAL^XBDIQ1(90001,BMCREF,.09),N=1,C=0,T=0 D W Q:BMCQUIT
 Q
WPTXT ;
 ; get site-specific text (if any)
 I $P(BMCR0,U,4)="C" D
 .I BMCCHSAS="A",$D(^BMCPARM(DUZ(2),31)) S BMCFILE=90001.31,BMCDA=DUZ(2),BMCNODE=31
 .I BMCCHSAS="D",$D(^BMCPARM(DUZ(2),32)) S BMCFILE=90001.31,BMCDA=DUZ(2),BMCNODE=32
 .I BMCCHSAS="P"!(BMCCHSAS=""),$D(^BMCPARM(DUZ(2),33)) S BMCFILE=90001.31,BMCDA=DUZ(2),BMCNODE=33
 I $P(BMCR0,U,4)="O",$D(^BMCPARM(DUZ(2),33)) S BMCFILE=90001.31,BMCDA=DUZ(2),BMCNODE=34
 ; fall through to WP to get the text
WP ;
 D WP^BMCFDR
 Q
HEAD ;
 NEW N,T,C,X,Y
 I $E(IOST)="C",IO=IO(0) W ! S DIR(0)="EO" D ^DIR K DIR I Y=0!(Y="^")!($D(DTOUT)) S BMCQUIT=1 Q
HEAD1 ;
 W:$D(IOF) @IOF
HEAD2 ;
 I 'BMCPG S BMCPG=BMCPG+1 Q
 S BMCPG=BMCPG+1 W:$D(IOF) @IOF W !,?(IOM-20),"Page ",BMCPG
 Q