APCDELAB ; IHS/CMI/LAB - LAB LOG ENTRY ;
 ;;2.0;IHS PCC SUITE;**2**;MAY 14, 2009
 ;
HDR ;
 W:$D(IOF) @IOF
 F APCDJ=1:1:5 S APCDX=$P($T(TEXT+APCDJ),";;",2) W !?80-$L(APCDX)\2,APCDX
 K APCDJ,APCDX
 W !!
 D ^APCDEIN
 Q:APCDFLG
 S APCDPAT="",APCDLAB=1
 S APCDLOC="" F  D GETLOC Q:APCDLOC=""  S APCDTYPE="" F  D GETTYPE Q:APCDTYPE=""  S APCDCAT="" F  D GETCAT Q:APCDCAT=""  D RESTOFIT
 D EOJ
 Q
 ;
RESTOFIT S APCDDATE="" F  D GETDATE Q:APCDDATE=""  S APCDPATE="" F  D RDPV Q:APCDPATE=""  D PROCESS
 Q
 ;
RDPV ; 
 S APCDPATE=""
 W !
 S DIR(0)="S^1:TEST TYPE;2:PATIENT",DIR("A")="Enter Lab Test Results By" D ^DIR K DIR S:$D(DUOUT) DIRUT=1
 Q:Y=""
 I $D(DUOUT)!($D(DTOUT)) Q
 S Y=$E(Y),APCDPATE=$S(Y=1:"T",Y=2:"P")
 Q
GETLOC ; GET LOCATION OF ENCOUNTER
 S APCDLOC=""
 S DIC="^AUTTLOC(",DIC(0)="AEMQ" D ^DIC K DIC,DA
 Q:Y<0
 S APCDLOC=+Y
 Q
 ;
GETTYPE ; GET TYPE OF ENCOUNTER
 S APCDTYPE=""
 K DTOUT,DUOUT,DIRUT,DIROUT,DIR,DA
 S DIR(0)="9000010,.03O",DIR("A")="TYPE" D ^DIR K DIR
 I $D(DIRUT) S X="" Q
 S APCDTYPE=Y
 K DIR,DIRUT,DIROUT,DTOUT,DUOUT
 Q
 ;
 ;
GETCAT ; GET SERVICE CATEGORY
 S APCDCAT=""
 K DTOUT,DUOUT,DIRUT,DIROUT,DIR,DA
 S DIR(0)="9000010,.07O",DIR("A")="SERVICE CATEGORY" D ^DIR K DIR
 I $D(DIRUT) S X="" Q
 S APCDCAT=Y
 K DIR,DIRUT,DIROUT,DTOUT,DUOUT,DA,X,Y
 Q
 ;
GETDATE ; GET DATE
 W ! S APCDDATE="",%DT="AEPX",%DT("A")="Enter VISIT DATE: " D ^%DT
 Q:Y<0
 S APCDDATE=+Y
 K %DT("A")
 Q
 ;
 ;
PROCESS ; PROCESS MNEMONIC
 I APCDPATE="P" D LABLOG Q
 I APCDPATE="T" D LABTEST Q
 Q
 ;
GETPAT ; GET PATIENT
 D GETPAT^APCDEA
 Q:APCDPAT=""
 I AUPNDOB]"" S X2=AUPNDOB,X1=APCDDATE D ^%DTC S AUPNDAYS=X ; re-set days of age to visit date-dob
 Q
 ;
LABLOG ;
 S X="LABLOG",DIC="^APCDTKW(",DIC(0)="",DIC("S")="I $L($P(^(0),U))>5" D ^DIC K DIC("B"),DIC("A"),DIC("S")
 I Y<0 W !!,$C(7),$C(7),"LAB LOG TEMPLATE MISSING, NOTIFY YOUR SUPERVISOR" Q
 S APCDTPLT=+Y,APCDTPLT("NAME")=$P(Y,U,2)
 S APCDPAT="" F  D GETPAT Q:APCDPAT=""  K APCDADD,APCDALVR D ^APCDEA2,GETMNEK
 Q
LABTEST ;
 S APCDLABT=""
 S X="LABTEST",DIC="^APCDTKW(",DIC(0)="",DIC("S")="I $L($P(^(0),U))>3" D ^DIC K DIC
 I Y<0 W !!,$C(7),$C(7),"LAB TEST TEMPLATE MISSING, NOTIFY YOUR SUPERVISOR" Q
 S APCDTPLT=+Y,APCDTPLT("NAME")=$P(Y,U,2)
 S DIC("A")="Enter LAB TEST type: ",DIC="^LAB(60,",DIC(0)="AEMQ" D ^DIC I Y<0 K DIC Q
 K DIC S APCDLABT="`"_+Y
 S APCDPAT="" F  D GETPAT Q:APCDPAT=""  K APCDADD,APCDALVR D ^APCDEA2,GETMNEK
 Q
GETMNEK ; KILL GETMNE SPECIFIC VARIABLES
 K APCDVSIT,APCDPATE
 Q
 ;
EOJ ; END OF JOB
 D ^APCDEKL
 K POP,X,Y,DI,DX,DQ,D,DIG,DIH,DIW,DK,DL,DLOUT
 K APCDLAB,APCDLABT,APCDPATE
 K %DT,%
 Q
 ;
TEXT ;
 ;;PCC Data Entry Module
 ;;
 ;;**************************
 ;;*   Lab Log ENTER Mode   *
 ;;**************************
 ;;