DGPTFTR ;ALB/JDS - TRANSMISSION OF PTF ; 6/29/10 3:57pm
 ;;5.3;Registration;**37,415,530,601,614,645,787**;Aug 13, 1993;Build 1
 ;
ENN L +^DGP(45.83):$G(DILOCKTM,5) I '$T W !,"Already transmitting" Q  ;787 add +,DILOCKTM
 D CEN^DGPTUTL
 I '$D(DGRTY) S Y=1 D RTY^DGPTUTL
 D FDT^DGPTUTL S DGFMTDT=Y
 ;
EN5 K DIC S DIC=45.83,DIC(0)="AMZEQ",DIC("A")="Enter Start Date: "
 S DIC("S")="I $O(^DGP(45.83,+Y,""P"",0)) F DGX=0:0 S DGX=$O(^DGP(45.83,+Y,""P"",DGX)) Q:'DGX  I '$P(^DGP(45.83,+Y,""P"",DGX,0),U,2),$D(^DGPT(DGX,0)),$D(^(70)),+^(70)>2901000,$P(^(0),U,11)=+DGRTY Q"
 S D="ANT" D IX^DIC G ENQ1:X["^"!(X=""),EN5:Y'>0
 S DGSD=+Y(0),DIC(0)="EAMZQ",DIC("S")="I Y'<DGSD"_" "_DIC("S"),DIC("A")="Enter Through Date: TODAY//  ",D="ANT" D IX^DIC K DIC,D
 ;
 G ENQ1:X["^" S DGED=$S(Y>0:+Y(0),1:DT)
 ; -- 125 cols
 S VATNAME="PTF125" D ^VATRAN I VATERR K VATNAME,VATERR,VAT L -^DGP(45.83) G ENQ
 S DGFMT=2 D SCAN G:DGOUTX ENQ1
ENQ D SCAN^DGPTFTR3
ENQ1 L -^DGP(45.83) K DGACNT,DGXM,XMDUN,XMY,DGOUTX,DGSTCNT,DIC,DGX,DGRTY,DGRTY0,DGCN,DGCN0,DGPTFMT,DGFMT,DGFMTDT,DGLOGIC,VAT,VATERR,VATNAME,DGSD,DGED ;787 change L to  full - lock.
 Q
 ;
SCAN K DGERR S DGPTFMT=2 D LOG S DGCNT=1,DGD=DGSD-.01,DGTR=0,DGID=1
 ; DG*5.3*614 - DGFIRST identifies first record in a batch
 N DGFIRST S DGFIRST=1
 W !!,"Now transmitting 125 column ",$P(DGRTY0,U)," records..."
 W !,"Includes records of "
 ;
DAT D:DGCNT>1 XMIT S DGD=$O(^DGP(45.83,DGD))
 I DGD>0,DGD'>DGED D SETTRAN^DGPTUTL1 Q:DGOUTX
 I DGD'>0!(DGD>DGED) D BULL^DGPTFTR3 G DATQ
 S J=0 G PWR
DATQ Q
 ;
PWR S P=J,J=$O(^DGP(45.83,DGD,"P",J)) G DAT:J'>0,PWR:$P(^(J,0),U,2)
 I $D(^DGPT(J,0)),$P(^(0),U,11)'=+DGRTY G PWR
 I $P(DGCN0,U,3)>DT,DGRTY=1 D CEN^DGPTFTR3 G PWR:'Y
 S Y=$S($D(^DGPT(J,70)):+^(70),1:0) D FMT^DGPTUTL G PWR:DGPTFMT'=DGFMT
 S T1=0,T2=9999999,Y=J,X=0 S:DGRTY=2 T2=+DGCN0_".9",T1=+$P(DGCN0,U,5) D LINES^DGPTFVC2 I (DGCNT+X)>VAT("F"),'$G(DGFIRST) S J=P G XMIT
 I $G(DGFIRST)=1 S DGFIRST=0
 K DICR S DGERR=0,DGSTCNT("P",J)=DGCNT
 W !,$E($P(^DPT(+^DGPT(J,0),0),U),1,25),?27,"(#",J,")" S X=^DGPT(J,0) D WR^DGPTF
 K ^TMP("AEDIT",$J),^TMP("AERROR",$J) S DGACNT=0
 I DGRTY=1 D COM
 I DGRTY=2 S T2=+DGCN0_".9",T1=+$P(DGCN0,U,5),(PTF,DGCI)=J D COM1
 I DGERR D OPEN^DGPTFTR3
 K ^TMP("AEDIT",$J)
 I 'DGERR W ?70," Okay" S DGTR=DGTR+1 G XMIT:DGCNT>VAT("F")
 G PWR
 Q
 ;
XMIT K XMY D ROUTER
 S XMZ=DGXMZ,^XMB(3.9,XMZ,2,0)="^3.92A^"_(DGCNT-1)_"^"_(DGCNT-1)_"^"_DT,DGJ=J
 S XMDUZ=.5,XMDUN=$P(^VA(200,DUZ,0),U) D ENT1^XMD
 W !,"Transmission Queued" S DGIDN(DGID)=XMZ
 F DGK=0:0 S DGK=$O(DGSTCNT("P",DGK)) Q:DGK'>0  D REC
 S DGFIRST=1
 K DGK S DGCNT=1,DGID=DGID+1,J=DGJ Q:J'>0  D SETTRAN^DGPTUTL1 G:'DGOUTX PWR
 Q
 ;
REC ;
 S DGSENFLG=""
 S DIE="^DGP(45.83,",DA=DGD,DR="10///"_DGK,DR(2,45.831)="1///TODAY;2///"_XMZ D ^DIE K DA,DR,DIE
 S DIE="^DGPT(",DR="6///3",DA=DGK D ^DIE K DA,DR,DIE
 K DGSENFLG
 Q
 ;
COM S T1=0,T2=9999999 S:'$D(PTF) PTF=J S:PTF'=J PTF=J
COM1 F K=0,70,71,101,"401P" S @("DG"_K)=$S($D(^DGPT(J,K)):^(K),1:"")
 F K=10,.11,.3,.32,.321,.52,57 S @("DG"_$S(K[".":$E(K,2,99),1:K))=$S($D(^DGP(45.84,J,K)):^(K),$D(^DPT(+^DGPT(J,0),$S(K'=10:K,1:0))):$S(K'=10:^(K),1:^(0)),1:"")
 F K=.02,.06 M @("DG"_$S(K[".":$E(K,2,99),1:K))=^DPT(+^DGPT(J,0),K)
 D ^DGPTFTR0:DGPTFMT=1,^DGPTR0:DGPTFMT=2
 ;
Q L -^DGP(45.83) F K=0,10,701,"401P",101,11,3,32,41,52,57,70,321,502,702,"02","06" K @("DG"_K) ;787 change L  to full - lock.
 K DGCDR,DGT,DIC,DGADM,DGAO,DGDOB,DGHEAD,DGJ,DGK,DGL,DGM,DGNAM,DGNT,DGO,DGSSN,DGSUD,DGSUR,DGTD,DGX,DGXLS,E,ERR,F,G,H,I,K,L,T,W,Z,DGPROC,DGPROCD ;** NOTE: do not kill variables needed by PTF load/edit option!!!
 I $D(DGERR),DGERR<1 D ^DGPTFVC1 D:'T1 ^DGPTFVC3
 I $D(DGERR),DGERR<1 D EN^DGPTFVC2
 Q
 ;
LOG ;called from PRINT+1^DGPTF2,CLS+1^DGPTF2,EN^DGPTFVC
 D LOG^DGPTFTR1:DGPTFMT=1,LOG^DGPTR1:DGPTFMT=2,COM:$D(DGERR)
 Q
 ;
 ;-- check for real queue if census should be removed for national rel
ROUTER S XMDUZ=.5 F DGSDI=0:0 S DGSDI=$O(VAT(DGSDI)) Q:'DGSDI  S X=VAT(DGSDI),XMN=0,XMDF="" D INST^XMA21 K XMN,XMDF
 S XMY(DUZ)=""
 Q
