ENLBL15 ;(WASH ISC)/DH-Print Bar Coded Equipment Labels ;10.10.97
 ;;7.0;ENGINEERING;**12,35,45**;Aug 17, 1993
LOCID ;By LOCAL IDENTIFIER
 S ENERR=0 D STA^ENLBL3 G:ENEQSTA="^" QUIT^ENLBL3
 N DIC,DIE,DA,DR,X,X1,X2,I,J,K,I1
 D EN^ENLBL9 I $D(DIRUT) G EXIT1^ENLBL8
 I '$D(ENEQIO),%<0 G EXIT1^ENLBL8
 S DIC="^ENG(6914,",ENDX="L",ENLOCSRT=1
LOCID1 S (X,ENLID)="" R !,"Start with: ",X:DTIME G:X="^"!(X="") EXIT1^ENLBL8 S:X=" " X="?" G:$E(X)="?" LOCID15
 S X2=$L(X) I $D(^ENG(6914,"L",X)) S ENLID("FR")=X G LOCID2
 I $E($O(^ENG(6914,"L",X)),1,X2)=X D IX^ENLIB1 G:X="" LOCID1 G:X="^" EXIT1^ENLBL8 S ENLID("FR")=X W "   ",ENLID("FR") G LOCID2
 S ENX=X,ENIX=0 I X?.N D IX^ENLIB1 G:X="^" EXIT1^ENLBL8 I $E(X,1,X2)=ENX S ENLID("FR")=X W "   ",ENLID("FR") G LOCID2
 I 'ENIX W !,"There is no LOCAL IDENTIFIER in the Equipment File that begins with:",!,?5,ENX
 K ENIX
LOCID15 W !,"Would you like a list of all LOCAL IDENTIFIERS" S %=1 D YN^DICN S:%<0 X="^" G:%<0 EXIT1^ENLBL8 G:%'=1 LOCID1
 S X="" D IX^ENLIB1 G:X="" LOCID1 G:X="^" EXIT1^ENLBL8 S ENLID("FR")=X W "   ",ENLID("FR")
LOCID2 S X="" R !,"Go to: ",X:DTIME G:X="^"!(X="") EXIT1^ENLBL8 S:X=" " X="?"
 I $E(X)="?" W !,"Please enter a character string which follows (or equals):",!,ENLID("FR"),!,"This will be the end point of our print job." G LOCID2
 I ENLID("FR")?.N,$L(X)>0,X'?.N G LOCID25
 I ENLID("FR")?.N,X?.N,X'<ENLID("FR") G LOCID25
 I ENLID("FR")]X W !,"Your entry (",X,") does not follow ",ENLID("FR"),".",*7 G LOCID2
LOCID25 S ENLID("TO")=X W !,"OK, including everything from ",ENLID("FR")," to ",ENLID("TO"),"."
LOCID3 W !,"Sort labels by LOCATION" S %=1 D YN^DICN G:%<0 EXIT1^ENLBL8 I %=0 W !,"Say YES to sort labels by DIVISION, BUILDING, and then by ROOM.",!,"If you say NO, labels will be sorted by LOCAL IDENTIFIER." G LOCID3
 S:%=2 ENLOCSRT=0
 S %ZIS("A")="Select BAR CODE PRINTER: ",%ZIS("B")="",%ZIS="Q" I $D(ENEQIO),ENEQIO=IO S %ZIS=""
 K IO("Q") D ^%ZIS K %ZIS G:POP EXIT1^ENLBL8
 S ENBCIO=IO,ENBCIOSL=IOSL,ENBCIOF=IOF,ENBCION=ION,ENBCIOST=IOST,ENBCIOST(0)=IOST(0),ENBCIOS=IOS S:$D(IO("S")) ENBCIO("S")=IO("S")
 I $D(IO("Q")) K IO("Q") S ZTIO=ION,ZTRTN="LOCID4^ENLBL15",ZTSAVE("EN*")="",ZTDESC="All Equipment Labels (Bar Code)" D ^%ZTLOAD K ZTSK G EXIT1^ENLBL8
LOCID4 S ENEQBY="Local Identifier: "_ENLID("FR")_" to "_ENLID("TO")_"."
 I $D(ENEQIO) D OPEN^ENLBL9 I POP G:$D(ZTQUEUED) REQ^ENLBL8 W !,*7,"Companion Printer UNAVAILABLE." D HOLD G EXIT1^ENLBL8
 K ^TMP($J) I $D(^ENG(6914,"L",ENLID("FR"))) S I1=ENLID("FR"),ENDA=0 F  S ENDA=$O(^ENG(6914,"L",I1,ENDA)) Q:ENDA'>0  S DA=ENDA D STATCK^ENLBL3 I DA]"" D:ENLOCSRT SORT^ENLBL3 I 'ENLOCSRT D LIDSRT
 I $G(I1)]"" F  S I1=$O(^ENG(6914,"L",I1)) Q:I1=""  D NEXT Q:I1=""  S ENDA=0 F  S ENDA=$O(^ENG(6914,"L",I1,ENDA)) Q:ENDA'>0  S DA=ENDA D STATCK^ENLBL3 I DA]"" D:ENLOCSRT SORT^ENLBL3 D:'(ENDA#10) DOTS^ENLBL3 I 'ENLOCSRT D LIDSRT
 I $D(^TMP($J)) U ENBCIO D FORMAT^ENLBL7 S I1="" F  S I1=$O(^TMP($J,I1)) Q:I1=""  S DA=0 F  S DA=$O(^TMP($J,I1,DA)) Q:DA'>0  U ENBCIO D NXPRT^ENLBL7 D:$D(ENEQIO) CPRNT^ENLBL9 D:'(DA#10) DOTS^ENLBL3 D BCDT^ENLBL7
 G EXIT^ENLBL8
 ;
NEXT ;Time to quit?
 I I1=+I1,ENLID("TO")'=+ENLID("TO") Q
 I I1=+I1,ENLID("TO")=+ENLID("TO") S:I1>ENLID("TO") I1="" Q
 I I1'=+I1,ENLID("TO")=+ENLID("TO") S I1="" Q
 I I1]ENLID("TO") S I1=""
 Q
 ;
LIDSRT S ^TMP($J,I1,DA)="" Q
HOLD W !,"Press <RETURN> to continue..." R X:DTIME
 Q
 ;ENLBL15
