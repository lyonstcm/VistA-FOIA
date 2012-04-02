ACHSACT ; IHS/ITSC/PMF - DOCUMENT ACTIONS ;  [ 10/16/2001   8:16 AM ]
 ;;3.1;CONTRACT HEALTH MGMT SYSTEM;;JUN 11, 2001
 ;
DISP ;EP - Display actions on a document.
 N ACHSDIEN,ACHSDUZ
 D ^ACHSUD
 Q:$D(DTOUT)!$D(DUOUT)!'$D(ACHSDIEN)
 S %=$$PB^ACHS
 Q:$D(DTOUT)!$D(DUOUT)
 I %="B" D VIEWR^XBLM("EN^ACHSACT"),EN^XBVK("VALM") Q
EN ;EP - From List Manager.      
 K ^UTILITY($J,"W")
 N ACHSDUZ,DA,DIWF,DIWL,DIWR
 S DIWF="W",DIWL=46,DIWR=IOM-2,ACHSDUZ=DUZ,DA(1)=DUZ(2),DA=ACHSDIEN
 W @IOF,!,"ACTIONS For document ",$$VAL^XBDIQ1(9002080.01,.DA,.01)," at ",$$LOC^ACHS,!,"WHEN",?22,"WHO",?45,"WHAT"
 W !,$$REPEAT^XLFSTR("-",21),?22,$$REPEAT^XLFSTR("-",22),?45,$$REPEAT^XLFSTR("-",33)
 S DA(1)=0
 F  S DA(1)=$O(^ACHSF(DUZ(2),"D",ACHSDIEN,"A",DA(1))) Q:'DA(1)  D
 . W !,$$FMTE^XLFDT($P($G(^ACHSF(DUZ(2),"D",ACHSDIEN,"A",DA(1),0)),U))
 . S ACHSYAYA=99,DUZ=$P($G(^ACHSF(DUZ(2),"D",ACHSDIEN,"A",DA(1),0)),U,2)
 . W ?22,$$USR^ACHS
 . F DA=0:0 S DA=$O(^ACHSF(DUZ(2),"D",ACHSDIEN,"A",DA(1),1,DA)) Q:'DA  S X=$G(^ACHSF(DUZ(2),"D",ACHSDIEN,"A",DA(1),1,DA,0)) D ^DIWP
 . D ^DIWW
 .Q
 S ACHSYAYA=99,DUZ=ACHSDUZ
 K ^UTILITY($J,"W"),ACHSYAYA
 Q
 ;
ENTER ;EP - Enter actions on a document.
 N ACHS,ACHSDIEN,DA,DIC,DIE,DR
 D ^ACHSUD
 Q:$D(DTOUT)!$D(DUOUT)!'$D(ACHSDIEN)
 S ACHS=$$NOW^XLFDT
 D ACT(ACHSDIEN,ACHS)
 Q:Y<1
 W !!,"Entered ",$$FMTE^XLFDT(ACHS)," by ",$$USR^ACHS
 S DIE="^ACHSF(DUZ(2),""D"",ACHSDIEN,""A"",",DA=+Y,DR=1
 D ^DIE
 Q
 ;
ACT(ACHSDIEN,ACHSTIME,ACHSACT) ;EP - Non-Interactive entry of an action on a document.
 N ACHS,DA,DIC,DIE,DR
 I '$D(^ACHSF(DUZ(2),"D",ACHSDIEN,"A",0)) S ^ACHSF(DUZ(2),"D",ACHSDIEN,"A",0)=$$ZEROTH^ACHS(9002080.01,101)
 S DIC(0)="",DIC="^ACHSF(DUZ(2),""D"",ACHSDIEN,""A"",",X=ACHSTIME,DA(2)=DUZ(2),DA(1)=ACHSDIEN,DIC("DR")=".02////"_DUZ_";1///"_$G(ACHSACT)
 K DO,DD D FILE^DICN
 Q
 ;