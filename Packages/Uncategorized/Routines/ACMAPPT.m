ACMAPPT ; IHS/TUCSON/TMJ - EDIT OR DELETE AN APPOINTMENT ; [ 07/11/1999  7:38 PM ]
 ;;2.0;ACM CASE MANAGEMENT SYSTEM;*1*;JAN 10, 1996
 ;Patch #1 alows Edit of Existing Recall Data Date
 ;MAKE, DELETE OR CHANGE A RECALL DATE ENTRY
 ;CALLS ACMAPP1, NO INTERNAL ENTRY POINTS.
EN K ACMQUIT
 D HEAD,CHOICE
 I $D(ACMAPX) K ACMAPX G EN
 I $D(ACMQUIT) D EXIT Q
 D ADD:'$D(ACMQUIT)
 D APPTDIE:'$D(ACMQUIT)&$D(DA)
 D EXIT
 G:'$D(ACMQUIT) EN
 Q
 ;
ADD ;
 S DIR(0)="9002249,.01",DIR("A")="Enter Date of Recall" K DA D ^DIR K DIR
 Q:X="^"!(X="")
 S X=Y
 S DIC="^ACM(49,",DIC(0)="L",DIC("DR")=".02////"_ACMPTNO_";.03////"_ACMRGDFN_";.04////"_ACMRG
 K DD,DO D FILE^DICN
 S DA=+Y
 D APPTDIE
 Q
 Q
HEAD D HEAD^ACMMENU
 W !!?14,"Update ",@ACMRVON,"RECALL DATES",@ACMRVOFF,!?17,"for ",@ACMRVON,ACMPTNA2,@ACMRVOFF,!!?40,"NEXT APPT",?59,"REFERRAL",!?0,"NO.",?5,"RECALL DT",?17,"PURPOSE",?40,"DATE        TIME",?59,"ORG/PROVIDER"
 W !?0,"---  ---------",?15,"------------",?40,"-----------------",?59,"------------"
 S (ACMA,ACMAA)="",ACMCREG1=""
 F ACMCNT=1:1 S ACMA=$O(^ACM(49,"C",ACMPTNO,ACMA)) Q:'ACMA  D LST
 S ACMCNT=ACMCNT-1 K ACMCREG,ACMCREG1
 Q
 ;
CHOICE S DIR(0)="SO^A:ADD"_$S(ACMCNT>0:";C:CHANGE;D:DELETE;E:EDIT DATE ONLY",1:""),DIR("A")=" Enter CHOICE",DIR("?")="Enter 'A', 'D', or 'C' or Press <RETURN> to Exit" ;IHS/CMI/LAB
 D DIR
 I U=$E(X)!(X="") S ACMQUIT="" S:U=$E(X) ACMOUT="" Q
 S ACMX=Y
 I ACMCNT>0,"CDE"[$E(ACMX) D DD S ACMAPX="" Q  ;IHS/CMI/LAB
 I ACMCNT<1,"A"'[$E(ACMX) W *7,!!?14,"??" S ACMAPX="" Q
 Q
 ;
APPTDIE W !
 S DIE="^ACM(49,",DR="11T;4T;5T;3T;7T;1T;2T"
 I ACMX="C" S DA=$P(ACMCNT(ACMCNT1),U,3)
 D DIE
 S DIE="^ACM(41,",DA=ACMRGDFN,DR="11///TODAY"
 D DIE
 Q
 ;
APPTDT ;
 ;IHS/CMI/LAB - new subroutine patch 1
 W !
 S DIE="^ACM(49,",DR=".01"
 I ACMX="E" S DA=$P(ACMCNT(ACMCNT1),U,3)
 D DIE
 S DIE="^ACM(41,",DA=ACMRGDFN,DR="11///TODAY"
 D DIE
 Q
EXIT K ACMA,ACM1,ACM2,ACMY,ACMZ,ACMZZ,ACMX,ACMCNT,ACMCNT1,ACMQUIT,ACMPV
 Q
 ;
LST I '$D(^ACM(49,ACMA,"DT")) S ACMCNT=ACMCNT-1 Q
 I $P(^ACM(49,ACMA,0),U,4)'=ACMRG S ACMCNT=ACMCNT-1 Q
 S ACMAPP1=^ACM(49,ACMA,"DT"),ACMY=$P(ACMAPP1,U),ACMZ=$P(ACMAPP1,U,5),ACMZZ=$P(ACMAPP1,U,3),ACMPV=$P(ACMAPP1,U,4),ACM1=$P(^ACM(49,ACMA,0),U)
 K ACMAPP1
 I ACMY'="" S Y=ACMY X ^DD("DD") S ACMY=Y I 1
 E  S ACMY="NOT RECORDED"
 I ACMZ'="" S ACMZ=$E(ACMZ,1,22)
 E  S ACMZ="NOT RECORDED"
 I ACMZZ'="" S Y=ACMZZ X ^DD("DD") S ACMZZ=Y I 1
 E  S ACMZZ="NONE ON FILE"
 I ACM1 S ACM2=^ACM(49,ACMA,0),ACM2=$E(ACM2,1,7)
 E  S ACM2="UNSPECIFIED"
 S ACMCNT(ACMCNT)=ACMCNT_"^"_ACM2_"^"_ACMA_"^"_ACMZ,ACMCREG=$P(^ACM(41.1,$P(^ACM(49,ACMA,0),U,4),0),U)
 I ACMCREG'=ACMCREG1 W ! S ACMCREG1=ACMCREG
 I ACM2'="" S Y=ACM2 X ^DD("DD") S ACM2=Y
 I ACMZZ'="" S ACMZZ=$E(ACMZZ,1,20)
 W !,ACMCNT,?5,ACM2,?17,ACMZ,?40,ACMY,?58,ACMZZ
 W !,?58,ACMPV
 Q
 ;
DD S:ACMCNT=1 ACMCNT1=ACMCNT
DD1 I ACMCNT>1 D
 .S DIR(0)="NO^1:"_ACMCNT,DIR("A")=$S(ACMX="D":"DELETE",ACMX="C":"CHANGE",ACMX="E":"EDIT DATE OF")_" WHICH RECALL DATE",DIR("?")="ENTER A NUMBER FROM 1 - "_ACMCNT
 .D DIR
 .S ACMCNT1=Y
 Q:ACMCNT1["^"!(ACMCNT1="")
 S ACM2=$P(ACMCNT(ACMCNT1),U,2),ACMA=$P(ACMCNT(ACMCNT1),U,3),ACMZ=$P(ACMCNT(ACMCNT1),U,4),ACMD=$S(ACMX="C":"APPTDIE",ACMX="D":"DELETE",ACMX="E":"APPTDT") ;IHS/CMI/LAB
 S Y=ACM2 X ^DD("DD") S ACM3=Y ;Recall Date Conversion
 W:ACMD="APPTDIE" !!?4,"RECALL DATE: ",ACM3," (PURPOSE: ",ACMZ,")"
 W:ACMD="APPTDT" !!,?24,"RECALL DATE: ",ACM3," (PURPOSE): ",ACMZ,")",!,?6,"Enter a New Recall Date at Current Date Display" ;IHS/CMI/LAB
 D @ACMD
 K ACMD
 Q
 ;
DELETE I $P(^ACM(49,ACMA,0),U,4)'=ACMRG W *7,!!?10,"You cannot delete appointments made by another register." H 2 Q
 W !!,"DELETE ",@ACMRVON,ACM3,@ACMRVOFF," RECALL DATE FOR "
 W @ACMRVON,ACMZ,@ACMRVOFF
 S %=1 D YN^DICN
 Q:%=-1!(%=2)!(%=0)
 S DIE="^ACM(49,",DR=".01///@",DA=ACMA
 D DIE
 Q
 ;
DIR D ^DIR S:$D(DIRUT) ACMQUIT="" K DIR,DIRUT,DUOUT,DTOUT Q
DIE D ^DIE K DIC,DIE,DA,DR Q