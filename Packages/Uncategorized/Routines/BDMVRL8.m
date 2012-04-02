BDMVRL8 ; cmi/anch/maw - VIEW PT RECORD & DIAGNOSIS DATA ;
 ;;2.0;DIABETES MANAGEMENT SYSTEM;;AUG 11, 2006
 ;
 ;
CDISP ;EP;DISPLAY AND EDIT DIAGNOSIS
 D REG^BDMFUTIL
 Q:$D(BDMQUIT)
 S BDMVALM="BDMV DIAGNOSIS"
 D VALM^BDMVRL(BDMVALM)
 Q
CADD ;EP;TO ADD DIAGNOSIS
 D REG^BDMFUTIL
 Q:$D(BDMQUIT)
 W !?5,"ADD Diagnosis for ",$P(BDMPAT0,U)
 D CLIST
 Q:'$G(BDMJ)
 S DIR(0)="LO^1:"_BDMJ
 S DIR("A")="Which DIAGNOSIS(S)"
 W !
 D DIR^BDMFDIC
 Q:+Y<1
B F BDMJ=1:1 S BDMX=$P(BDMY,",",BDMJ) Q:'BDMX  D CADD1:$D(BDM("DIAG",BDMX))
 K BDM("DIAG")
 Q
CADD1 ;
 S X=+BDM("DIAG",BDMX)
 I $D(^ACM(44,"AC",BDMRPDA,DFN,X)) W !!,"Patient already has ",$P(^ACM(44.1,X,0),U)," as a diagnosis.  Use Edit or Delete to modify this diagnosis" D PAUSE Q
 S DIC="^ACM(44,"
 S DIC(0)="L"
 S DIC("DR")=".02////"_DFN_";.03////"_BDMRPDA_";.04////"_BDMRDA
 D FILE^BDMFDIC
 Q:+Y<1
 S BDMCDA=+Y
 D CE1
 Q
CEDIT ;EP;TO EDIT DIAGNOSIS
 D REG^BDMFUTIL
 Q:$D(BDMQUIT)
 D CSEL
 I $D(BDMQUIT) K BDMQUIT Q
 N BDMX,BDMZ
 F BDMJ=1:1 S BDMX=$P(BDMY,",",BDMJ) Q:BDMX=""  I $D(BDM("DIAG",BDMX)) S BDMCDA=+$G(BDM("DIAG",BDMX)) D CE1
 Q
CE1 S DA=BDMCDA
 S DIE="^ACM(44,"
 S DR="[BDM DIAGNOSIS]"
 D DDS^BDMFDIC
 Q
CDELETE ;EP;TO DELETE DIAGNOSIS FROM PATIENT'S DIAGNOSIS LIST
 D REG^BDMFUTIL
 Q:$D(BDMQUIT)
 D CSEL
 I $D(BDMQUIT) K BDMQUIT Q
 N BDMX,BDMZ
 F BDMJ=1:1 S BDMX=$P(BDMY,",",BDMJ) Q:BDMX=""  I $D(BDM("DIAG",BDMX)) S BDMCDA=+$G(BDM("DIAG",BDMX)) D CD1
 Q
CD1 S DA=BDMCDA
 S DIK="^ACM(44,"
 D DIK^BDMFDIC
 NEW BDMX,DA,DIK
 S BDMX=0 F  S BDMX=$O(^ACM(44,"C",DFN,BDMX)) Q:'BDMX  D
 .S DA=BDMX,DIK="^ACM(44," D IX^DIK K DA,DIK
 Q
CLDELETE ;EP;TO DELETE DIAGNOSIS LIST ENTRY
 D REG^BDMFUTIL
 Q:$D(BDMQUIT)
 K BDMQUIT
 D CSEL
 I $D(BDMQUIT) K BDMQUIT D BACK Q
 N BDMJ,BDMX
 F BDMJ=1:1 S BDMX=$P(BDMY,",",BDMJ) Q:BDMX=""  I $D(BDM("DIAG",BDMX)) D CLD1
 D BACK
 Q
CLD1 S DA=+$G(BDM("DIAG",BDMX))
 I $D(^ACM(44,"B",DA)) D  Q
 .W !!,$P(BDM("DIAG",BDMX),U,2)," is being referenced and cannot be deleted."
 .H 2
 S DIK="^ACM(44.1,"
 D DIK^BDMFDIC
 Q
CINIT ;EP;INITIALIZE LIST OF PATIENTS DIAGNOSIS
 D REG^BDMFUTIL
 Q:$D(BDMQUIT)
 K ^TMP("BDMVR",$J),BDMJ,BDM("TMP")
 N A,B,C,X,Y,Z
 S X=""
 S VALMCNT=0
 S X="    Diagnosis"
 D Z(X)
 S X="    NO.  Diagnosis                       ONSET DATE"
 D Z(X)
 S X="    ---  ------------------------------  ----------"
 D Z(X)
 S A=0,C=0
 F  S A=$O(^ACM(44,"C",DFN,A)) Q:'A  D
 .S Y=$G(^ACM(44,A,0))
 .Q:'Y
 .Q:$P(Y,U,4)'=BDMRDA
 .S C=C+1
 .S Y=$G(^ACM(44.1,+Y,0))
 .S BDM("TMP",Y,C)=A
 S BDMJ=0
 S A=""
 F  S A=$O(BDM("TMP",A)) Q:A=""  S C=0 F  S C=$O(BDM("TMP",A,C)) Q:C'=+C  D
 .S BDMJ=BDMJ+1
 .S Y=BDM("TMP",A,C)
 .S Y=$P($G(^ACM(44,Y,"SV")),U,2)
 .X ^DD("DD")
 .S X=""
 .S $E(X,5)=BDMJ
 .S $E(X,10)=A
 .S $E(X,42)=Y
 .D Z(X)
 .S ONSET=Y
 .S BDM("DIAG",BDMJ)=BDM("TMP",A,C)
BACK S VALMBCK="R"
 Q
COMDISP ;EP;TO DISPLAY AND EDIT CASE COMMENTS
 D REG^BDMFUTIL
 Q:$D(BDMQUIT)
 S BDMVALM="BDMV COMMENTS"
 D VALM^BDMVRL(BDMVALM)
 Q
COMEDIT ;EP;TO EDIT COMMENTS
 D REG^BDMFUTIL
 Q:$D(BDMQUIT)
 D CLEAR^VALM1
 S DA=BDMRPDA
 S DIE="^ACM(41,"
 S DR=13
 D DIE^BDMFDIC
 Q
COMINIT ;EP;INITIALIZE LIST OF COMMENTS
 D REG^BDMFUTIL
 Q:$D(BDMQUIT)
 K ^TMP("BDMVR",$J)
 N X,Y,Z
 S VALMCNT=0
 S X="Case Comments"
 D Z(X)
 S X="----------------------------------------"
 D Z(X)
 S A=0
 F  S A=$O(^ACM(41,BDMRPDA,1,A)) Q:'A  D
 .S Y=$G(^ACM(41,BDMRPDA,1,A,0))
 .Q:Y=""
 .S X=Y
 .D Z(X)
 D BACK
 Q
CSEL ;SELECT DIAGNOSIS
 S DIR(0)="LO^1:"_BDMJ
 S DIR("A")="Which Diagnosis(s)"
 W !
 D DIR^BDMFDIC
 I Y<1 S BDMQUIT="" Q
 S BDMY=Y
 Q
DIAGLIST ;CREATE DIAGNOSIS LIST ARRAY
 K BDM("DIAGLIST"),BDM("DIAG")
 S X=0
 F  S X=$O(^ACM(44.1,"RG",BDMRDA,X)) Q:'X  D
 .S Y=$G(^ACM(44.1,X,0))
 .Q:Y=""
 .S BDM("DIAGLIST",$P(Y,U))=X
 S BDMJ=0
 S Y=""
 F  S Y=$O(BDM("DIAGLIST",Y)) Q:Y=""  D
 .S BDMJ=BDMJ+1
 .S BDM("DIAG",BDMJ)=BDM("DIAGLIST",Y)_U_Y
 Q
CLIST ;LIST ALL DIAGNOSIS
 D CLEAR^VALM1
 N X,Y,Z
 K BDM("DIAG"),BDMJ
 D DIAGLIST
 I '$D(BDM("DIAG")) D  Q
 .W !!,"NO DIAGNOSIS TO LIST."
 .D PAUSE^BDMFMENU
 W !!?5,"NO.",?10,"DIAG"
 W !?5,"---",?10,"--------------------"
 S X=0
 F  S X=$O(BDM("DIAG",X)) Q:'X  D
 .W !?5,X,?10,$P(BDM("DIAG",X),U,2)
 Q
CLINIT ;EP;TO INITIALIZE DIAGNOSIS LIST
 D REG^BDMFUTIL
 Q:$D(BDMQUIT)
 K ^TMP("BDMVR",$J)
 K BDM("DIAGLIST")
 N J,X,Y,Z
 D DIAGLIST
 S VALMCNT=0
 S X="    Diagnosis"
 D Z(X)
 S X="    NO.  Diagnosis"
 D Z(X)
 S X="    ---  ------------------------------"
 D Z(X)
 S A=""
 F  S A=$O(BDM("DIAGLIST",A)) Q:A=""  D
 .S X=""
 .S $E(X,5)=(VALMCNT-2)
 .S $E(X,10)=A
 .D Z(X)
 .S BDM("DIAG",VALMCNT-2)=+BDM("DIAGLIST",A)
 S BDMJ=VALMCNT-3
 Q
CLADD ;EP;TO ADD NEW DIAGNOSIS
 D REG^BDMFUTIL
 Q:$D(BDMQUIT)
 S DIC="^ACM(44.1,"
 S DIC(0)="AEMLQZ"
 S DIC("A")="Name of New Diagnosis: "
 W !
 D DIC^BDMFDIC
 Q:'+Y
 S X=BDMRDA
 S (DA,DA(1))=+Y
 S DIC="^ACM(44.1,"_DA_",""RG"","
 S DIC(0)="L"
 S:'$D(^ACM(44.1,DA,"RG",0)) ^ACM(44.1,DA,"RG",0)="^9002244.11P"
 D FILE^BDMFDIC
 D BACK
 Q
CLEDIT ;EP;TO EDIT EXISTING DIAGNOSIS LIST ENTRY
 D REG^BDMFUTIL
 Q:$D(BDMQUIT)
 K BDMQUIT
 D CSEL
 I $D(BDMQUIT) K BDMQUIT D BACK Q
 F BDMI=1:1 S X=$P(BDMY,",",BDMI) Q:X=""  I $G(BDM("DIAG",X)) D CLE1
 D BACK
 Q
CLE1 W @IOF
 W !,"Edit DIAGNOSIS NAME:"
 S DA=+BDM("DIAG",X)
 S DIE="^ACM(44.1,"
 S DR=".01;1101"
 W !
 D FULL^VALM1
 D DIE^BDMFDIC
 Q
CL ;EP;FOR DIAGNOSIS LIST FUNCTIONS
 D REG^BDMFUTIL
 Q:$D(BDMQUIT)
 S BDMVALM="BDMV DIAGNOSIS LIST"
 D VALM^BDMVRL(BDMVALM)
 Q
DL ;EP;FOR DIAGNOSIS LIST FUNCTIONS
 D REG^BDMFUTIL
 Q:$D(BDMQUIT)
 S BDMVALM="BDMV DIAGNOSES LIST"
 D VALM^BDMVRL(BDMVALM)
 Q
Z(X) ;SET TMP NODE
 S VALMCNT=VALMCNT+1
 S ^TMP("BDMVR",$J,VALMCNT,0)=X
 Q
PAUSE ;
 K DIR
 S DIR(0)="E",DIR("A")="Press enter to continue" D ^DIR K DIR
 Q