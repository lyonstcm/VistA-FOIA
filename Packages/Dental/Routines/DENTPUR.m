DENTPUR ; HISC/NCA - Purge Old Dental Activities ;8/16/96  10:37
 ;;1.2;DENTAL;**21,24**;JAN 26, 1989
 S DENTYR=$E(DT,1,3)-5,DENTDTE=DENTYR_$E(DT,4,7)
D1 W !!,"Purge Prior To: ",$E(DENTDTE,4,5),"-",$E(DENTDTE,6,7),"-",(1700+$E(DENTDTE,1,3))," // " R X:DTIME G:'$T!(X="^") KIL G:X="" SITE S %DT="EXP" D ^%DT G:U[X!$D(DTOUT) KIL G:Y<1 D1
 I Y>DENTDTE W *7,!!,"CANNOT PURGE DATA LATER THAN 5 YEARS!" G D1
 S DENTDTE=+Y
SITE S DENTSTA=$O(^DENT(225,0)) I DENTSTA'<1,$O(^DENT(225,DENTSTA))<1 S DENTSTA=$P($G(^DENT(225,DENTSTA,0)),"^",1) G D2
 W !! S DIC="^DENT(225,",DIC(0)="AEMQ" D ^DIC G:Y<0 KIL S DENTSTA=$P(Y,"^",2) K DIC
D2 K ZTUCI,ZTDTH,ZTIO,ZTSAVE S ZTRTN="Q1^DENTPUR",ZTREQ="@",ZTSAVE("ZTREQ")="",ZTSAVE("DENTDTE")="",ZTSAVE("DENTSTA")=""
 W !!,"Request will be Queued."
 S ZTIO="",ZTDESC="Purge Old Dental Activities." D ^%ZTLOAD K ZTSK Q
Q1 ; Process Purge
 F DENTD=0:0 S DENTD=$O(^DENT(221,DENTD)) Q:DENTD<1  S X=$G(^(DENTD,0)),DENTX=$P(X,"^",1),DENTX1=$P(X,"^",40) I DENTX1=DENTSTA,DENTX<DENTDTE S DENTFLE=221 D K0
 F DENTD=0:0 S DENTD=$O(^DENT(222,DENTD)) Q:DENTD<1  S X=$G(^(DENTD,0)),DENTX=$P(X,"^",1),DENTX1=$P(X,"^",28) I DENTX1=DENTSTA,DENTX<DENTDTE S DENTFLE=222 D K0
 F DENTD=0:0 S DENTD=$O(^DENT(223,DENTD)) Q:DENTD<1  S X=$G(^(DENTD,0)),DENTX=$P(X,"^",1),DENTX1=$P(X,"^",29) I DENTX1=DENTSTA,DENTX<DENTDTE S DENTFLE=223 D K0
 F DENTD=0:0 S DENTD=$O(^DENT(224,DENTD)) Q:DENTD<1  S X=$G(^(DENTD,0)),DENTX=$P(X,"^",1),DENTX1=$P(X,"^",10) I DENTX1=DENTSTA,DENTX<DENTDTE S DENTFLE=224 D K0
 F DENTD=0:0 S DENTD=$O(^DENT(226,DENTD)) Q:DENTD<1  S X=$G(^(DENTD,0)),DENTX=$P(X,"^",1),DENTX1=$P(X,"^",2) I DENTX1=DENTSTA,DENTX<DENTDTE S DENTFLE=226 D K0
KIL K %DT,DA,DENTD,DENTDTE,DENTFLE,DENTSTA,DENTX,DENTX1,DENTYR,DIC,DIK,X,Y Q
K0 S DIK="^DENT("_DENTFLE_",",DA=DENTD D ^DIK K DIK,DA Q