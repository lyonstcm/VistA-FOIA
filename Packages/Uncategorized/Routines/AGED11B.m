AGED11B ; IHS/ASDS/EFG - RHI ARRAY AND DATES ;    
 ;;7.1;PATIENT REGISTRATION;;AUG 25,2005
 ;
SETARRAY ;LOAD ARRAY WITH PATIENT'S RHI RECORDS
 K AGRHI1,AGRHI2,AG("RHISEL"),AG("SELH")
 I '$D(^AUPNRHI("B",DFN)) W !!,"No Restricted Health Information on file" Q
 W !!,"Restricted Health Information on File"
 W !!,?2,"#",?5,"Patient",?28,"Current",?41,"Status"
 W !,?5,"Name",?28,"Status",?41,"Entered on"
 W !
 S (RHINO,AGSEL)=0
 F  S RHINO=$O(^AUPNRHI("B",DFN,RHINO)) Q:'RHINO  D
 . S RHIREC=$G(^AUPNRHI(RHINO,0))
 . S RHIPTIEN=$P(RHIREC,U)
 . S RHIPAT=$P($G(^DPT(RHIPTIEN,0)),U)
 . S RHIRHI=$P(RHIREC,U,2)
 . S RHISTAT=$P(RHIREC,U,3)
 . S RHIDA=$S(RHISTAT="P":1,RHISTAT="A":2,RHISTAT="N":3,RHISTAT="R":4,1:5)
 . I RHIDA=1 S RHIENT=$P($G(^AUPNRHI(RHINO,RHIDA)),U,3)
 . I RHIDA=5 S RHIENT=$P($G(^AUPNRHI(RHINO,RHIDA)),U,2)
 . I RHIDA'=1&(RHIDA'=5) S RHIENT=$P($G(^AUPNRHI(RHINO,RHIDA)),U,4)
 . I RHIENT="" S RHIENT=999999 I RHISTAT="" S RHISTAT="IMCOMPLETE RECORD"
 . S AGRHI1(RHIENT)=RHIPAT_"^"_RHISTAT_"^"_RHIENT_"^"_RHIRHI_"^"_RHINO
 S ENTDAT=""
 F  S ENTDAT=$O(AGRHI1(ENTDAT),-1) Q:'ENTDAT  D
 . S AGSEL=AGSEL+1
 . S AGRHI2(AGSEL)=$G(AGRHI1(ENTDAT))
 . S RHIPAT=$P(AGRHI2(AGSEL),U)
 . S RHISTAT=$P(AGRHI2(AGSEL),U,2)
 . S RHIENT=$P(AGRHI2(AGSEL),U,3)
 . S RHIRHI=$P(AGRHI2(AGSEL),U,4)
 . W !,?2,AGSEL,?5,RHIPAT,?31,RHISTAT,?41,$S(RHIENT'=999999:$E(RHIENT,4,5)_"/"_$E(RHIENT,6,7)_"/"_($E(RHIENT,1,3)+1700),1:"")
 . W !,RHIRHI,!
 S AG("SELH")=AGSEL
 K DIR,DTOUT,DFOUT,DUOUT,DLOUT,DIROUT
 S DIR("A")="Select  1 - "_AG("SELH")_" ( Press ENTER to add a new record or ""^"" to exit ) "
 S DIR(0)="FO"
 D ^DIR S AG("RHISEL")=Y K DIR
 Q:$D(DTOUT)!$D(DUOUT)!$D(DIROUT)
 Q:AG("RHISEL")=""
 I AG("RHISEL")<1!(AG("RHISEL")>AG("SELH")) W !,"You must enter a number from 1 - ",AG("SELH") H 2 G SETARRAY
 S AG("RHISEL")=$P(AGRHI2(AG("RHISEL")),U,5)
 K RHINO,RHIDA,RHIREC,RHIPTIEN,RHIPAT,RHIRHI,RHISTAT,RHIENT,AGSEL
 Q
DATES ;
 I $P($G(^AUPNRHI(DA,0)),U,3)="A" D ADATE Q
 I $P($G(^AUPNRHI(DA,0)),U,3)="N" D NDATE Q
 I $P($G(^AUPNRHI(DA,0)),U,3)="P" D PDATE Q
 I $P($G(^AUPNRHI(DA,0)),U,3)="R" D RDATE Q
 I $P($G(^AUPNRHI(DA,0)),U,3)="E" D EDATE Q
 Q
ADATE ;ENTER/EDIT APPROVED DATE
 D NOW^%DTC S AG("STAMP")=%
 S DR=".21;.22;.23////^S X=DUZ;.24////^S X=AG(""STAMP"")"
 D ^DIE Q:$D(Y)>9
 Q
NDATE ;ENTER/EDIT NOT APPROVED DATE
 D NOW^%DTC S AG("STAMP")=%
 S DR=".31;.32;.33////^S X=DUZ;.34////^S X=AG(""STAMP"")"
 D ^DIE Q:$D(Y)>9
 Q
PDATE ;ENTER/EDIT PENDING DATE
 D NOW^%DTC S AG("STAMP")=%
 S DR=".11;.12////^S X=DUZ;.13////^S X=AG(""STAMP"")"
 D ^DIE Q:$D(Y)>9
 Q
RDATE ;ENTER/EDIT REVOKED DATE
 D NOW^%DTC S AG("STAMP")=%
 S DR=".41;.42;.43////^S X=DUZ;.44////^S X=AG(""STAMP"")"
 D ^DIE Q:$D(Y)>9
 Q
EDATE ;ENTER/EDIT ENTERED IN ERROR DATE
 D NOW^%DTC S AG("STAMP")=%
 S DR=".51////^S X=DUZ;.52////^S X=AG(""STAMP"")"
 D ^DIE Q:$D(Y)>9
 Q
FINDRHI ;EP - FIND THE PATIENT'S LAST RHI ENTRY AND DISPLAY ON SCREEN
 K AG("RHISTAT")
 I $D(RHIFLAG)&(RHIFLAG="A") W "APPROVED" Q
 K AG("RHINUM")
 S AG("RHINUM")=$O(^AUPNRHI("B",DFN,""),-1)
 I AG("RHINUM")>0  D
 . S AG("RHISTAT")=$P($G(^AUPNRHI(AG("RHINUM"),0)),U,3)
 . S AG("STATUS")=$S(AG("RHISTAT")="A":"APPROVED",AG("RHISTAT")="N":"NOT APPROVED",AG("RHISTAT")="R":"REVOKED",AG("RHISTAT")="P":"PENDING",1:"ENTERED IN ERROR")
 . W AG("STATUS")
 Q
RHICHK ;EP - CHECK FOR EXISTANCE OF RHI RECORD
 K AG("RHICHK")
 S AG("RHICHK")=$O(^AUPNRHI("B",DFN,""))
 Q
ADDRHI ;EP - ADD AN RHI RECORD
 N DIC,DIE,DR,DA,DLAYGO,Y
 K AG("STAMP")
 S DIC="^AUPNRHI("
 S DLAYGO=9000039
 S DIC(0)="L"
 I '$D(AG("RHISEL")) S X="`"_DFN
 I $D(AG("RHISEL"))  D
 . I AG("RHISEL")="" S X="`"_DFN
 D ^DIC
 Q:$D(DTOUT)!$D(DUOUT)!(Y=-1)
 S DIE=DIC
 K DIC,DA,DR,X
 S DA=+Y
 D NOW^%DTC S AG("STAMP")=%
 S DR=.02
 D ^DIE
 I $P($G(^AUPNRHI(DA,0)),U,2)="" S DIK="^AUPNRHI(" D ^DIK Q
 S DR=.03
 D ^DIE
 D DATES
 I '$G(^AUPNRHI(DA,1))&('$G(^AUPNRHI(DA,2)))&('$G(^AUPNRHI(DA,3)))&('$G(^AUPNRHI(DA,4)))&('$G(^AUPNRHI(DA,5))) S DR=".01////@" D ^DIE Q
 K AG("RHISEL"),AGRHI1,AGRHI2
 Q
EDITRHI ;EP - EDIT AN RHI RECORD
 N DIE,DR,X,Y,REC
 S DIC(0)="MQZ"
 D SETARRAY
 I AG("RHISEL")="" G ADDRHI
 Q:$D(DTOUT)!$D(DUOUT)
 S DIC="^AUPNRHI("
 S DA=AG("RHISEL")
 S DIC(0)="AEMQZ"
 S DIE=DIC
 S DR=".02;.03"
 S AG("STAT")=$P($G(^AUPNRHI(DA,0)),U,3)
 D ^DIE Q:$D(Y)>9
 Q:$D(DTOUT)!$D(DUOUT)
 D DATES
 I $D(Y)>9  D
 . S DR=".03////^S X=AG(""STAT"")"
 . D ^DIE
 K AG("RHISEL"),AGRHI1,AGRHI2
 Q