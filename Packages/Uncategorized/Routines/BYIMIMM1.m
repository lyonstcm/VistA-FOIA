BYIMIMM1 ;IHS/CIM/THL - IMMUNIZATION DATA INTERCHANGE;
 ;;2.0;BYIM IMMUNIZATION DATA EXCHANGE INTERFACE;**2**;MAY 01, 2011
 ;;CONTINUATION OF BYIMIMM
 ;
 ;;PATCH 2
 ;;
 ;;  IMM   - RE-CODE EXISTING IMMUNIZATION COMPARISON
 ;;        - ADD MANUFACTURER TO LOT NUMBER CHECK
 ;;  I1    - RE-SEQUENCE DISPLAY OF IMPORT INFO
 ;;        - ADD KILL OF TEMP IMPORT GLOBAL
 ;;  VISIT - CHANGE SET OF OUTSIDE LOCATION
 ;;  READ  - K ^BYIMTMP($J,"BYIM IMM")
 ;;          CHANGE $J,"BYIM" TO $J,"BYIM IMM"
 ;;  NI1   - ADD MANUFACTURER
 ;;  DEXIT - CLEAN UP AFTER IZAD
 ;
 ;-----
FILE ;ENTER FILE NAME OF IMPORT FILE
 K BYIMQUIT
 D PATH^BYIMIMM
 I IPATH="" D NOPATH^BYIMIMM Q
 S DIR(0)="FO^3:50"
 S DIR("A",1)="The file from the State Registry must be in the drive/directory: "
 S DIR("A",2)="          ** "_IPATH_" **"
 S DIR("A")="Enter the name of the file from the State Registry"
 W !
 D ^DIR
 K DIR
 I X=""!(X[U) S BYIMQUIT="" Q
 S FILE=X
 Q
 ;-----
IMPORT ;EP;IMMUNIZATION IMPORT
 N AUTO,BYIMERR,BYIMJ,BYIMX,DATE,DIC,DIE,DIK,DR,DA,DLAYGO,HRN,IMM,IVDA,JJ,LOC,MSHX,NAME,NUM,PID,SEX,DOB,FACILITY,INHDA,STATUS,T,VALMBCK,VALMCC,VALMCNT,VDATE,X1,X2,YY,ZTQUEUED,DFNCNT,BYIMIMM,IMMCNT,NODFNCNT,NEWIMCNT,ADDIMCNT,MSGCNT,RXACNT
 D FILE
 Q:$D(BYIMQUIT)
 D PATH^BYIMIMM
 I IPATH="" D  Q
 .W:'$D(ZTQUEUED) !!,"No directory path found."
 .H 4
I1 ;EP;FOR AUTO IMPORT MODE
 S Y=$$OPEN^%ZISH(IPATH,FILE,"R")
 I Y D  Q:$D(BYIMQUIT)
 .W:'$G(AUTOADD) !,*7,"CANNOT OPEN (OR ACCESS) FILE '",IPATH,FILE,"'."
 .S BYIMQUIT=""
 D CLOSE^%ZISH()
 D:'$G(AUTOIMP)
 .W !!,"Import of immunizations of patients from the"
 .W !,"State Immunization registry may take several minutes."
 .S DIR(0)="YO"
 .S DIR("A")="Do you want to proceed"
 .S DIR("B")="NO"
 .W !
 .D ^DIR
 .K DIR
 .S:Y'=1 BYIMQUIT=""
 Q:$D(BYIMQUIT)
 W:'$G(AUTOIMP) !!,"Please do not interrupt."
 S (DFNCNT,NODFNCNT,IMMCNT,NEWIMCNT,BYIMIMM,ADDIMCNT,MSGCNT,RXACNT)=0
 D READ(IPATH,FILE)
 D S1:$G(AUTOADD)
 D LOG^BYIMIMM2(FILE,"I",DFNCNT,RXACNT,NODFNCNT,NEWIMCNT,ADDIMCNT,IPATH)
 ;PATCH 2 - CHANGE SEQUENCE FOR IMPORT SUMMARY
 I '$G(AUTOIMP),'$G(AUTOADD),'$D(ZTQUEUED) D MATCH^BYIMIMM2
 D ADDIM
 K AUTOIMP,AUTOADD
 Q
 ;-----
READ(IPATH,FILE)    ;PEP pull up a file into the TMP global for display
 N Y,X,I,J,OPATH
 S MSGCNT=0
 S RXACNT=0
 S J=1
 S Y=$$OPEN^%ZISH(IPATH,FILE,"R")
 I Y D  Q
 .W:'$G(AUTOIMP) !,*7,"CANNOT OPEN (OR ACCESS) FILE '",IPATH,FILE,"'."
 .S BYIMQUIT=""
 ;THE READ STATEMENT BELOW IS A READ FROM A HOST FILE WHICH REQUIRES A
 ;DIRECT READ VS AN FM/DIR CALL SAC EXEMPTION REQUESTED
 K ^BYIMTMP($J,"BYIM IMM")
 N RX
 S RX="R"_" X:"_"DTIME"
 F I=1:1 U IO X RX S STATUS=$$STATUS^%ZISH Q:STATUS=1!(STATUS=-1)!(X="")  D:"|MSH|PID|RXA|"[("|"_$E(X,1,3)_"|") INSET^BYIMIMM2
 D CLOSE^%ZISH()
 Q:'$D(^BYIMTMP($J,"BYIM IMM"))
 D SET
 K ^BYIMTMP($J,"BYIM IMM")
 Q
 ;-----
SET ;ID PATIENTS AND SET NEW IMMUNIZATIONS
 S AUTOADD=$P($G(^BYIMPARA(DUZ(2),0)),U,5)
 S INHDA=0
 F  S INHDA=$O(^BYIMTMP($J,"BYIM IMM",INHDA)) Q:'INHDA  D
 .D ID ;VERIFY PATIENT ID
 .I $D(BYIMQUIT) K BYIMQUIT Q
 .S DFNCNT=DFNCNT+1
 .D IMM ;CHECK EACH INCOMING IMMUNIZATION
 .;PATCH 2
 .I '$D(ZTQUEUED) U 0 W "/"
 I $G(OLDDUZ(2)) S Z=2,DUZ(Z)=OLDDUZ(2) K OLDDUZ
 Q:'$D(^BYIMXTMP("BYIM"))
 D FMINIT
 S BYIMCNT=BYIMJ
 Q
 ;-----
ID ;ID PATIENT
 I $G(OLDDUZ(2)) S Z=2,DUZ(Z)=OLDDUZ(2) K OLDDUZ
 S PID=$G(^INTHU(INHDA,3,2,0))
 I PID="" S BYIMQUIT="" Q
 S PIDX=$P(PID,"|",4)
 F J=1:1:$L(PIDX,"~") S X=$P($P(PIDX,"~",J),U) S:$E(X,1,4)="RPMS" X=$E(X,5,99) Q:$L(X)=12
 S HRN=+$E(X,7,12)
 S FACILITY=$E(X,1,6)
 S X=$P(PID,"|",6)
 S X=$P(X,U)_","_$P(X,U,2)_$S($P(X,U,3)]"":" "_$P(X,U,3),1:"")
 S (NAME,FULLNAME)=X
 I FACILITY]"",$O(^AUTTLOC("C",FACILITY,0)) S Z=2,OLDDUZ(Z)=DUZ(2),DUZ(Z)=$O(^AUTTLOC("C",FACILITY,0))
 S DOB=$E($P(PID,"|",8),1,8)-17000000
 S SEX=$P(PID,"|",9)
 S X=HRN
 S DIC="^DPT("
 S DIC(0)="MZ"
 S DIC("S")="I $P(^DPT(+Y,0),U,3)=DOB,$P(^(0),U,2)=SEX"
 S AUPNLK("ALL")=""
 S AUPNLK("INAC")=""
 D ^DIC
 K DIC,DINUM,DR,DA,DLAYGO
 S:$G(OLDDUZ(2)) Z=2,DUZ(Z)=OLDDUZ(2)
 I +Y<1 D
 .S X=$P(PID,"|",6)
 .S X=$P(X,U)_","_$P(X,U,2)_$S($P(X,U,3)]"":" "_$P(X,U,3),1:"")
 .S DIC="^DPT("
 .S DIC(0)="MZ"
 .S DIC("S")="I $P(^DPT(+Y,0),U,3)=DOB,$P(^(0),U,2)=SEX"
 .S AUPNLK("ALL")=""
 .S AUPNLK("INAC")=""
 .D ^DIC
 .K DIC,DINUM,DR,DA,DLAYGO
 I +Y<1 D
 .S X=$TR($P(PID,"|",6),".","")
 .S X=$P(X,U)_","_$P(X,U,2)
 .S DIC="^DPT("
 .S DIC(0)="MZ"
 .S DIC("S")="I $P(^DPT(+Y,0),U,3)=DOB,$P(^(0),U,2)=SEX"
 .D ^DIC
 .K DIC,DINUM,DR,DA,DLAYGO
 I +Y<1 D  Q:Y<1
 .D DIRECT
 .Q:Y>0
 .S BYIMQUIT=""
 .I $L(FULLNAME),$L(DOB),$L(SEX),'$D(^BYIMPARA(DUZ(2),"NMNAME",FULLNAME)) D
 ..;RECORD NO MATCH PATIENTS
 ..S DA(1)=DUZ(2)
 ..S DIC="^BYIMPARA("_DUZ(2)_",4,"
 ..S DIC(0)="LZ"
 ..S X=FULLNAME
 ..S DIC("DR")=".02////"_(DOB+17000000)_";.03////"_$E(FILE,7,14)_";.04////"_SEX_";.05////"_$G(MM)_";.06////"_$G(UIF)
 ..D FILE^DICN
 ..S NODFNCNT=NODFNCNT+1
 ..S Y=-1
 S DFN=+Y
 I '$D(^AUPNPAT(DFN,41,DUZ(2),0)) D
 .K OLDDUZ
 .N XX
 .S XX=0
 .F  S XX=$O(^AUPNPAT(DFN,41,XX)) Q:'XX!$G(OLDDUZ(2))  D
 ..S Z=2,OLDDUZ(Z)=DUZ(2)
 ..S Z=2,DUZ(Z)=XX
 ..K BYIMQUIT
 .S:'$G(OLDDUZ(2)) BYIMQUIT=""
 I $G(^DPT(DFN,.35)) S BYIMQUIT=""
 Q
 ;-----
DIRECT ;DIRECT FIND OF PATIENT
 K Y,MM
 N X,Z,DFN,NAMEX
 S NAME=$P(NAME,",")_","_$P($P(NAME,",",2)," ")
 S NAME=$TR(NAME,".","")
 S (X,NAMEX)=$E(NAME,1,$L(NAME)-1)
 F  S X=$O(^DPT("B",X)) Q:X=""!(X'[NAMEX)  D
 .S Y=0
 .F  S Y=$O(^DPT("B",X,Y)) Q:'Y  D
 ..S Z=$G(^DPT(Y,0))
 ..I $P(Z,U,3)=DOB,$P(Z,U,2)=SEX S DFN=Y Q
 ..I $P(Z,U,3)=DOB,$P(Z,U,2)'=SEX S MM="SEX"
 ..I $P(Z,U,3)'=DOB,$P(Z,U,2)=SEX S MM="DOB"
 I $G(DFN) S Y=DFN Q
 S Y=0
 F  S Y=$O(^AUPNPAT("D",HRN,Y)) Q:'Y  D
 .S Z=$G(^DPT(Y,0))
 .I $P(Z,U,3)=DOB,$P(Z,U,2)=SEX S DFN=Y
 .I $P(Z,U,3)=DOB,$P(Z,U,2)'=SEX S MM="SEX"
 .I $P(Z,U,3)'=DOB,$P(Z,U,2)=SEX S MM="DOB"
 S:$G(DFN) Y=DFN
 S:$G(MM)="" MM="NAME"
 Q
 ;-----
IMM ;COMPARE INCOMING IMMUNIZATIONS WITH EXISTING IMMUNIZATIONS
 N X,Y,Z,ZZ,BYIMY,LOT
 S J=2
 F  S J=$O(^INTHU(INHDA,3,J)) Q:'J  S BYIMY=^(J,0) D:$E(BYIMY,1,3)="RXA"
 .S Z=$E($P(BYIMY,"|",4),1,8)-17000000
 .S Y=+$P($P(BYIMY,"|",6),U)
 .Q:'Y!'Z
 .S IMMCNT=IMMCNT+1
 .S IMM=Y
 .D CONVERT
 .S Y=IMM
 .S X=$P(BYIMY,"|",12)
 .S X=$P(X,U,4)_U_$P(X,U)
 .;PATCH 2 ADD MANUFACTURER
 .S LOT=$P(BYIMY,"|",16)
 .S MAN=$P($P(BYIMY,"|",18),U,1,2)
 .S ^BYIMXTMP("BYIM",DOB,NAME,DFN,Y,Z)=INHDA_U_Z_U_X_U_LOT_U_MAN
 .Q:'$O(IMM(0))
 .S Y=0
 .F  S Y=$O(IMM(Y)) Q:'Y  D
 ..S ^BYIMXTMP("BYIM",DOB,NAME,DFN,Y,Z)=INHDA_U_Z_U_X
 S X=0
 F  S X=$O(^AUPNVIMM("AC",DFN,X)) Q:'X  D
 .S Y=$G(^AUPNVIMM(X,0))
 .S Z=$P($G(^AUPNVSIT(+$P(Y,U,3),0)),".")
 .S Y=+Y
 .Q:'Y!'Z
 .K ^BYIMXTMP("BYIM",DOB,NAME,DFN,Y,Z)
 .D KILL^BYIMIMM2
 Q
 ;-----
DEL ;EP;DEL IMMUNIZATIONS FROM THE STATE REGISTRY LIST
 N DEL
 S DEL=""
ADD ;EP;ADD NEW IMMUNIZATIONS FROM THE STATE REGISTRY
 K BYIMQUIT
 D SELECT
 I $D(BYIMQUIT) K BYIMQUIT Q
 D CLEAR^VALM1
 D NEWIMM
BACK S VALMBCK="R"
 Q
 ;-----
SELECT ;SELECT CHILD TO ADD
 I BYIMJ-3=0 D  Q
 .W !!,"No Immunizations to ",$S('$D(DEL):"Add",1:"Delete"),"..."
 .H 3
 S DIR(0)="LO^1:"_(BYIMJ-3)
 S DIR("A")="Select Immunization(s) to "_$S('$D(DEL):"add to RPMS",1:"delete from the list")
 W !
 D ^DIR
 K DIR
 I 'Y S BYIMQUIT="" Q
 M BYIMY=Y
 Q
 ;-----
S1 ;FOR AUTOADD TO SET ADD ARRAY
 N X,Y,Z,J
 F J=1:1:$G(BYIMJ)-3 S BYIMY(J)=J
NEWIMM ;ADD NEW IMMUNIZATION
 N XX
 S XX=""
 F  S XX=$O(BYIMY(XX)) Q:XX=""  D
 .S YY=BYIMY(XX)
 .F JJ=1:1 S ZZ=$P(YY,",",JJ) Q:ZZ=""  D NI1
 Q
NI1 ;NEW IMMUNIZATION
 K NEWLOT
 S NUM=ZZ+3
 S (X,BYIMX)=$G(^BYIMTMP($J,"BYIM DISP","DFN",NUM))
 Q:$E(X)="*"!(X="")
 S NAME=$P(X,U)
 S DFN=$P(X,U,2)
 S VDATE=$P(X,U,3)
 S IMM=$P(X,U,4)
 D CONVERT
 S IVDA=$P(X,U,5)
 S LOC=$P(X,U,6)
 S LOC2=$P(X,U,8)
 I LOC="",LOC2]"" S LOC=LOC2
 S:LOC="" LOC="OTHER"
 S DOB=$P(X,U,7)
 ;PATCH 2
 S LOT=$P(X,U,9)
 S MAN=$P(X,U,10)
 D LOT^BYIMIMM4(LOT,MAN,IVDA)
 K APCDALVR("APCDAFLG"),BYIMERR
 N BYIMDUZ
 S BYIMDUZ=DUZ
 D VISIT:'$D(DEL)
 S X="DUZ"
 S @X=BYIMDUZ
 D ILOT^BYIMIMM4(LOTDA)
 Q:$G(BYIMERR)]""&'$D(DEL)
 S X=BYIMX
 K ^BYIMXTMP("BYIM",$P(X,U,7),$P(X,U),$P(X,U,2),$P(X,U,4),$P(X,U,3))
 K ^BYIMTMP($J,"BYIM IMM","DFN",NUM)
 S Z=VDATE
 S Y=$O(^AUTTIMM("C",IMM,0))
 Q:'Y!'Z
 D KILL^BYIMIMM2
 Q
 ;-----
VISIT ;FIND OR CREATE VISIT
 K BYIMDUZ
 S BYIMDUZ=DUZ
 D DUZ
 S:LOC="" LOC="OTHER"
 S LOCDA=$S($O(^DIC(4,"B",LOC,0)):$O(^DIC(4,"B",LOC,0)),1:$O(^DIC(4,"B","OTHER",0)))
 ;PATCH 2
 ;I LOC["OTHER",LOC2]"",$O(^DIC(4,"B",LOC2,0)) S LOCDA=$O(^DIC(4,"B",LOC2,0))
 I $P($G(^DIC(4,+LOCDA,0)),U)="OTHER",LOC2]"",$O(^DIC(4,"B",LOC2,0)) S LOCDA=$O(^DIC(4,"B",LOC2,0)),LOC=LOC2
 I $P(^DIC(4,+LOCDA,0),U)="OTHER",$P($G(^BISITE($S($G(OLDDUZ(2)):OLDDUZ(2),1:+$G(DUZ(2))),0)),U,3),LOCDA'=$P(^(0),U,3) S LOCDA=$P(^(0),U,3)
 N P
 S P="|"
 S BYIMERR=""
 S $P(BYIMDATA,P,1)="I"
 S $P(BYIMDATA,P,2)=DFN
 S $P(BYIMDATA,P,3)=IVDA
 S $P(BYIMDATA,P,6)=VDATE_".12"
 S $P(BYIMDATA,P,7)=LOCDA
 ;PATCH 2
 ;S $P(BYIMDATA,P,8)=$S($E(LOC2)?1U&(LOC2'=LOC):LOC2,1:"")
 S $P(BYIMDATA,P,8)=$S($E(LOC2)?1U&(LOC2'=LOC):LOC2,1:LOC)
 S $P(BYIMDATA,P,9)="E"
 S $P(BYIMDATA,P,23)=DUZ(2)
 S $P(BYIMDATA,P,25)=1
 D ADDEDIT^BIRPC3(.BYIMERR,BYIMDATA)
 I $G(OLDDUZ(2)) S Z=2,DUZ(Z)=OLDDUZ(2) K OLDDUZ
 I BYIMERR]"" D  Q
 .K BYIMQUIT
 .S BYIMERR=BYIMERR_" - V IMMUNIZATIONN CREATION FAILED"
 .S X="DUZ",@X=BYIMDUZ
 .N %X,%Y,X,XMB,XMDT,XMDUZ,Y1
 .S XMB="BYIM V IMM CREATION FAILED"
 .S XMB(1)=$P(^DPT(DFN,0),U)
 .S XMB(2)=IMM_" - "_$P($G(^AUTTIMM(IVDA,0)),U)
 .S XMB(3)=VDATE+17000000
 .S XMB(4)=BYIMERR
 .S XMDUZ=.5
 .D ^XMB
 S ADDIMCNT=$G(ADDIMCNT)+1
 S X="DUZ",@X=BYIMDUZ
 D LV^BYIMIMM4(DFN,IVDA,LOTDA)
 Q
 ;-----
CONVERT ;CONVERT INACTIVE VACCINE TO ACTIVE EQUIVALENT
 S:IMM=105 IMM=75,OLDIMM=105
 S:IMM=17 IMM=47,OLDIMM=17
 S:IMM=31 IMM=83,OLDIMM=31
 Q
 ;-----
FMINIT ;EP;PUT NEW IMMUNIZATIONS INTO TMP STORAGE FOR
 K ^BYIMTMP($J,"BYIM DISP")
 N A,B,C,X,Y,Z,J,XXX
 S J=3
 S DOB=9999999
 F  S DOB=$O(^BYIMXTMP("BYIM",DOB),-1) Q:'DOB  D
 .S A=""
 .F  S A=$O(^BYIMXTMP("BYIM",DOB,A)) Q:A=""  D
 ..S B=0
 ..F  S B=$O(^BYIMXTMP("BYIM",DOB,A,B)) Q:'B  D
 ...S C=0
 ...F  S C=$O(^BYIMXTMP("BYIM",DOB,A,B,C)) Q:'C  D
 ....S X=0
 ....F  S X=$O(^BYIMXTMP("BYIM",DOB,A,B,C,X)) Q:'X  S XXX=^(X) D FM
 S (BYIMJ,VALMCNT)=J
 S NEWIMCNT=J-3
 D BACK
 Q
 ;-----
FM ;SET DISPLAY GLOBAL
 S XX=$P(XXX,U,2)
 S DATE=$E(XX,4,5)_"/"_$E(XX,6,7)_"/"_(1700+$E(XX,1,3))
 S IVDA=+$O(^AUTTIMM("C",C,0))
 I 'IVDA S ^BYIMTMP($J,"BYIM TEST","NO IMM CODE: "_C)="" Q
 S IMM=$P($G(^AUTTIMM(+IVDA,0)),U,2)
 I IMM="" S ^BYIMTMP($J,"BYIM TEST","NO IMM CODE 2: "_IMM)="" Q
 S J=J+1
 S IMM=IMM_" ("_C_")"
 S T=J-3
 S $E(T,7)=DOB+17000000
 S $E(T,16)=$E(A,1,30)
 S $E(T,47)=IMM
 S $E(T,66)=DATE
 S ^BYIMTMP($J,"BYIM DISP",J,0)=T
 S ^BYIMTMP($J,"BYIM DISP","DFN",J)=A_U_B_U_XX_U_C_U_IVDA_U_$P(XXX,U,3)_U_DOB_U_$P(XXX,U,4)_U_$P(XXX,U,5)
 S BYIMCNT=+T
 Q
 ;-----
HDR ;EP;FOR LIST HEADER
 S ^BYIMTMP($J,"BYIM DISP",1,0)="    "_$S($G(VALMCNT):"  ("_(VALMCNT-3)_")",1:"")_" Immunizations from the State Registry"
 S T="NUM"
 S $E(T,7)="DOB"
 S $E(T,16)="NAME"
 S $E(T,47)="IMMUNIZATION"
 S $E(T,66)="DATE RECEIVED"
 S ^BYIMTMP($J,"BYIM DISP",2,0)=T
 S T="-----"
 S $E(T,7)="--------"
 S $E(T,16)="------------------------------"
 S $E(T,47)="------------------"
 S $E(T,66)="-------------"
 S ^BYIMTMP($J,"BYIM DISP",3,0)=T
 Q
 ;-----
START ;EP;
 S BYIMVALM="BYIM STATE IMMUNIZATIONS"
 D VALM(BYIMVALM)
 Q
VALM(BYIMVALM) ;EP; -- main entry point for list templates
 S VALMCC=1 ;1=screen mode, 0=scrolling mode
 D TERM^VALM0
 D CLEAR^VALM1
 D EN^VALM(BYIMVALM)
 D CLEAR^VALM1
 Q
 ;-----
PARAM ;EP;TO UPDATE PARAMETERS
 N DA,DR,DIC,DIE,BYIMDA
 D PADD
 Q:DA<1
 S DIE="^BYIMPARA("
 S DR="[BYIM SET PARAMETERS]"
 W @IOF
 W !!,"UPDATE Data Exchange Parameters for ",$P(^DIC(4,DA,0),U)
 W !
 D ^DIE
 D ASITE^BYIMIMM4
 Q
 ;-----
PADD ;EP;TO ADD PARAMETER SITE
 K DIE,DIC,DINUM,DR,DA,DD,DO,DIK,DLAYGO
 S DIC="^BYIMPARA("
 S DIC(0)="AEMLQZ"
 S DIC("A")="Select SITE for Data Exchange Parameters: "
 S DIC("B")=$P(^DIC(4,DUZ(2),0),U)
 W @IOF
 W !!,"ADD Data Exchange Parameter Site"
 W !
 D ^DIC
 K DIE,DIC,DINUM,DR,DA,DD,DO,DIK,DLAYGO
 S (BYIMDA,DA)=+Y
 Q
 ;-----
DUZ ;SET DUZ FOR VISIT 'CREATED BY USER'
 K DIE,DIC,DINUM,DR,DA,DD,DO,DIK,DLAYGO
 N X,Y,Z
 S X="USER,IMMUNIZATION INTERFACE"
 S Y=$O(^VA(200,"B",X,0))
 D:'Y
 .S DIC="^VA(200,"
 .S DIC(0)="M"
 .S DIC("DR")="3////@"
 .D FILE^DICN
 .K DIE,DIC,DINUM,DR,DA,DD,DO,DIK,DLAYGO
 .S Y=+Y
 S:Y<1 Y=.5
 S X="DUZ",@X=+Y
 Q
 ;-----
ADDIM ;EP;PROCESS ADDITIONAL IMPORT FILES
 N BYIMAS
 S BYIMDA=DUZ(2)
 S BYIMAS=0
 F  S BYIMAS=$O(^BYIMPARA(BYIMDA,3,BYIMAS)) Q:'BYIMAS  D
 .S X=^BYIMPARA(BYIMDA,3,BYIMAS,0)
 .S IPATH=$P(X,U,3)
 .D ADDIM1
 Q
 ;-----
ADDIM1 ;PROCESS EACH ADDIONAL IMPORT SITE
 I '$G(AUTOIMP) D
 .W:'$D(ZTQUEUED) !!,"Processing additional import files."
 .W:'$D(ZTQUEUED) !,"Please do not interrupt."
 S (DFNCNT,NODFNCNT,IMMCNT,NEWIMCNT,BYIMIMM,ADDIMCNT,MSGCNT,RXACNT)=0
 D READ(IPATH,FILE)
 D S1:$G(AUTOADD)
 D LOG^BYIMIMM2(FILE,"I",DFNCNT,RXACNT,NODFNCNT,NEWIMCNT,ADDIMCNT,IPATH)
 I '$G(AUTOIMP),'$G(AUTOADD),'$D(ZTQUEUED) D MATCH^BYIMIMM2
 Q
 ;-----