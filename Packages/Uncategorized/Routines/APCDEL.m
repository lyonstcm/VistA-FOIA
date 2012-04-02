APCDEL ; IHS/CMI/LAB - NO DESCRIPTION PROVIDED 21-SEP-1996 ;
 ;;2.0;IHS PCC SUITE;;MAY 14, 2009
 ;; ;
START ;
 W:$D(IOF) @IOF
 F J=1:1:5 S X=$P($T(TEXT+J),";;",2) W !?80-$L(X)\2,X
 K X,J
 W !!
 S APCDPAT="" D GETPAT
 I APCDPAT="" W !!,"No PATIENT selected!" D EOJ Q
 D GETVISIT
 I APCDVSIT="" W !!,"No VISIT selected!" D EOJ Q
 D ^APCDEIN
 D EN,FULL^VALM1,EXIT K APCDPAT
 D EOJ
 Q
GETPAT ; GET PATIENT
 W !
 S APCDPAT=""
 S DIC="^AUPNPAT(",DIC(0)="AEMQ" D ^DIC K DIC
 Q:Y<0
 S APCDPAT=+Y
 Q
 ;
GETVISIT ;
 S APCDLOOK="",APCDVSIT=""
 K APCDVLK
 D ^APCDVLK
 I APCDLOOK S AUPNVSIT=APCDLOOK D MOD^AUPNVSIT
 S DIE="^AUPNPAT(",DR=".16///TODAY",DA=APCDPAT D ^DIE
 Q
 ;
EN ;PEP  -- main entry point for APCDELM PCC DATA ENTRY
 ;APCDPAT must = patient ien
 ;APCDVSIT  must = visit ien
 ;caller must set APCDVSIT,APCDPAT
 ;caller must kill APCDVSIT,APCDPAT and must call
 ;D ^APCDEKL to clean up d/e variables
 Q:'$G(APCDPAT)
 Q:'$G(APCDVSIT)
 Q:'$D(^AUPNVSIT(APCDVSIT))
 Q:$P(^AUPNVSIT(APCDVSIT,0),U,11)
 Q:'$D(^DPT(APCDPAT))
 D ^APCDEIN
 D EN^VALM("APCD EL PCC DATA ENTRY")
 D CLEAR^VALM1
 K APCDDISP,APCDSEL,^TMP("APCDEL",$J),C,X,I,K,J,APCDHIGH,APCDCUT,APCDCSEL,APCDCNTL
 D ^XBFMK
 Q
 ;
HDR ;EP -- header code
 S VALMHDR(2)="Patient Name: "_IORVON_$P(^DPT(APCDPAT,0),U)_IOINORM_"   DOB: "_$$FTIME^VALM1($P(^DPT(APCDPAT,0),U,3))_"   Sex: "_$P(^DPT(APCDPAT,0),U,2)
 S VALMHDR(2)=VALMHDR(2)_"   HRN: "_$S($D(^AUPNPAT(APCDPAT,41,DUZ(2),0)):$P(^AUPNPAT(APCDPAT,41,DUZ(2),0),U,2),1:"????")
 I $G(APCDVSIT) S VALMHDR(3)="Visit Date:  "_$$FMTE^XLFDT($P(^AUPNVSIT(APCDVSIT,0),U))_"      Clinic:  "_$$VAL^XBDIQ1(9000010,APCDVSIT,.08)
 Q
 ;
INIT ;EP -- init variables and list array
 D GATHER ;gather up all problems
 S APCDOVRR="" ;for provider narrative lookup
 Q
 ;
GATHER ;EP
 K APCDDISP,APCDSEL,APCDHIGH,^TMP("APCDEL",$J),APCDCUT
 S APCDHIGH=0,X=0 F  S X=$O(^APCDTKW("AD",X)) Q:X'=+X  S Y=$O(^APCDTKW("AD",X,"")) S APCDHIGH=APCDHIGH+1,APCDSEL(APCDHIGH)=Y
 ;S APCDCUT=((APCDHIGH/3)+1)\1
 S APCDCUT=APCDHIGH/3 S:APCDCUT'=(APCDCUT\1) APCDCUT=(APCDCUT\1)+1
 S (C,I)=0,J=1,K=1 F  S I=$O(APCDSEL(I)) Q:I'=+I!($D(APCDDISP(I)))  D
 .S C=C+1,^TMP("APCDEL",$J,C,0)=I_") "_$S($D(APCDCSEL(I)):"*",1:" ")_$S($P(^APCDTKW(APCDSEL(I),0),U,12)="":$E($P(^(0),U),1,20),1:$P(^(0),U,12)) S APCDDISP(I)="",^TMP("APCDEL",$J,"IDX",C,C)=""
 .S J=I+APCDCUT I $D(APCDSEL(J)),'$D(APCDDISP(J)) S $E(^TMP("APCDEL",$J,C,0),28)=J_") "_$S($D(APCDCSEL(J)):"*",1:" ")_$S($P(^APCDTKW(APCDSEL(J),0),U,12)="":$E($P(^APCDTKW(APCDSEL(J),0),U),1,20),1:$P(^(0),U,12)) S APCDDISP(J)=""
 .S K=J+APCDCUT I $D(APCDSEL(K)),'$D(APCDDISP(K)) S $E(^TMP("APCDEL",$J,C,0),55)=K_") "_$S($D(APCDCSEL(K)):"*",1:" ")_$S($P(^APCDTKW(APCDSEL(K),0),U,12)="":$E($P(^APCDTKW(APCDSEL(K),0),U),1,20),1:$P(^(0),U,12)) S APCDDISP(K)=""
 K APCDDISP,APCDCUT
 S VALMCNT=C
 Q
 ;
INIT2 ;EP
 K APCDDISP,APCDSEL,APCDHIGH,^TMP("APCDEL",$J)
 S APCDHIGH=0,X=0 F  S X=$O(^APCDTKW("ASEC",X)) Q:X'=+X  S Y=$O(^APCDTKW("ASEC",X,"")) S APCDHIGH=APCDHIGH+1,APCDSEL(APCDHIGH)=Y
 ;S APCDCUT=((APCDHIGH/3)+1)\1
 S APCDCUT=APCDHIGH/3 S:APCDCUT'=(APCDCUT\1) APCDCUT=(APCDCUT\1)+1
 S (C,I)=0,J=1,K=1 F  S I=$O(APCDSEL(I)) Q:I'=+I!($D(APCDDISP(I)))  D
 .S C=C+1,^TMP("APCDEL",$J,C,0)=I_") "_$S($D(APCDCSEL(I)):"*",1:" ")_$S($P(^APCDTKW(APCDSEL(I),0),U,12)="":$E($P(^(0),U),1,20),1:$P(^(0),U,12)) S APCDDISP(I)="",^TMP("APCDEL",$J,"IDX",C,C)=""
 .S J=I+APCDCUT I $D(APCDSEL(J)),'$D(APCDDISP(J)) S $E(^TMP("APCDEL",$J,C,0),28)=J_") "_$S($D(APCDCSEL(J)):"*",1:" ")_$S($P(^APCDTKW(APCDSEL(J),0),U,12)="":$E($P(^APCDTKW(APCDSEL(J),0),U),1,20),1:$P(^(0),U,12)) S APCDDISP(J)=""
 .S K=J+APCDCUT I $D(APCDSEL(K)),'$D(APCDDISP(K)) S $E(^TMP("APCDEL",$J,C,0),55)=K_") "_$S($D(APCDCSEL(K)):"*",1:" ")_$S($P(^APCDTKW(APCDSEL(K),0),U,12)="":$E($P(^APCDTKW(APCDSEL(K),0),U),1,20),1:$P(^(0),U,12)) S APCDDISP(K)=""
 K APCDDISP,APCDOTHR
 S VALMCNT=C
 Q
 ;
INIT3 ;EP
 K APCDDISP,APCDSEL,APCDHIGH,^TMP("APCDEL",$J)
 S APCDHIGH=0,X=0 F  S X=$O(^APCDTKW("AH",X)) Q:X'=+X  S Y=$O(^APCDTKW("AH",X,"")) S APCDHIGH=APCDHIGH+1,APCDSEL(APCDHIGH)=Y
 S APCDCUT=((APCDHIGH/3)+1)\1
 S (C,I)=0,J=1,K=1 F  S I=$O(APCDSEL(I)) Q:I'=+I!($D(APCDDISP(I)))  D
 .S C=C+1,^TMP("APCDEL",$J,C,0)=I_") "_$S($D(APCDCSEL(I)):"*",1:" ")_$S($P(^APCDTKW(APCDSEL(I),0),U,12)="":$E($P(^(0),U),1,20),1:$P(^(0),U,12)) S APCDDISP(I)="",^TMP("APCDEL",$J,"IDX",C,C)=""
 .S J=I+APCDCUT I $D(APCDSEL(J)),'$D(APCDDISP(J)) S $E(^TMP("APCDEL",$J,C,0),28)=J_") "_$S($D(APCDCSEL(J)):"*",1:" ")_$S($P(^APCDTKW(APCDSEL(J),0),U,12)="":$E($P(^APCDTKW(APCDSEL(J),0),U),1,20),1:$P(^(0),U,12)) S APCDDISP(J)=""
 .S K=J+APCDCUT I $D(APCDSEL(K)),'$D(APCDDISP(K)) S $E(^TMP("APCDEL",$J,C,0),55)=K_") "_$S($D(APCDCSEL(K)):"*",1:" ")_$S($P(^APCDTKW(APCDSEL(K),0),U,12)="":$E($P(^APCDTKW(APCDSEL(K),0),U),1,20),1:$P(^(0),U,12)) S APCDDISP(K)=""
 K APCDDISP,APCDOTHR
 S VALMCNT=C
 Q
 ;
HELP ; -- help code
 S X="?" D DISP^XQORM1 W !!
 Q
 ;
EXIT ; -- exit code
 K DISP,APCDSEL,APCHIGH,APCDCUT,APCDANS,APCDC,APCDI,APCDX,APCDY,APCDCRIT,APCDTEXT,APCDMOD,APCDMODE,APCDMNE,APCDVLK,APCDLOOK
 Q
 ;
EOJ ;
 K VALMHDR,VALMCNT
 D EN1^APCDEKL
 D EN2^APCDEKL
 D ^XBFMK
 K APCDPAT,APCDVSIT,APCDCUT,APCDHIGH,APCDSEL,APCDDISP,APCDANS,APCDC,APCDI
 K X,Y,C,I
 D KILL^AUPNPAT
 Q
EXPND ; -- expand code
 Q
 ;
TEXT ;
 ;;Patient Care Component (PCC)
 ;;
 ;;************************************************
 ;;*****  PCC DATA ENTRY UPDATE VISIT BY ITEM *****
 ;;************************************************
 ;;
 Q