APCPDR2 ; IHS/TUCSON/LAB - OHPRD-TUCSON/EDE - VISIT PROCESSING FOR PCC TX TRANSACTIONS AUGUST 14, 1992 ; [ 03/29/04  7:51 AM ]
 ;;2.0;IHS PCC DATA EXTRACTION SYSTEM;**1,3,4,6,7**;APR 03, 1998
 ;IHS/CMI/LAB - patch 4 commented out 2N check in disc
 ;IHS/CMI/LAB - patch 1 - reworked so delimited stat records only
 ;
 I $P(^AUTTSITE(1,0),U,16)]"",$P(^AUTTSITE(1,0),U,16)'="N",$P(^AUPNVSIT(APCP("V DFN"),0),U,23)=.5 S APCP("MFI")=$G(APCP("MFI"))+1,APCPV("DEP COUNT")=$P(APCPV("V REC"),U,9),APCPV("TYPE")=$P(APCPV("V REC"),U,3) Q
 I $P(APCPV("V REC"),U,11),$P(APCPV("V REC"),U,14)="" S APCP("DEL NEVER SENT")=APCP("DEL NEVER SENT")+1,APCPV("DEP COUNT")=0,APCPV("TYPE")=$P(APCPV("V REC"),U,3) Q
 D VISIT
 I $D(APCPE) S APCPE("EDFN")=APCP("V DFN"),APCPE("FILE")=9000010,APCPV("T-TCODE")=99 D COUNT I $G(APCPV("SRV CAT"))="H" D RESET^APCPDR21
 Q:$D(APCPE)
 I APCPV("PATIENT NAME")["DEMO,PATIENT" S APCP("DEMO PAT")=$G(APCP("DEMO PAT"))+1 Q
 S APCPV("IHS LOCATION CODE")=APCPV("IHS LOCATION CODE")_$E("      ",1,6-$L(APCPV("IHS LOCATION CODE")))
 D PROCTX
 K APCPE,APCPT,APCPH
 Q
 ;
COUNT ;EP
 I $D(APCPE("ERROR")) S APCP("ERROR COUNT")=APCP("ERROR COUNT")+1 D ^APCPERR Q
 Q
VISIT ;EP
 S APCPV("TYPE")=$P(APCPV("V REC"),U,3),APCPV("DEP COUNT")=$P(APCPV("V REC"),U,9)
 I 'APCPV("DEP COUNT"),'$P(APCPV("V REC"),U,11) S APCPE("ERROR")="E100" Q
 I APCPV("TYPE")="" S APCPE("ERROR")="E130" Q
 S APCPV("SRV CAT")=$P(APCPV("V REC"),U,7)
 I APCPV("SRV CAT")="" S APCPE("ERROR")="E132" Q
 S X=$P(APCPV("V REC"),U,8),APCPV("CLINIC CODE")=$S(X="":"",$D(^DIC(40.7,X,0)):$P(^DIC(40.7,X,0),U,2),1:"")
 S APCPV("LOC DFN")=$P(APCPV("V REC"),U,6)
 I APCPV("LOC DFN")="" S APCPE("ERROR")="E111" Q
 S APCPV("IHS LOCATION CODE")=$P(^AUTTLOC(APCPV("LOC DFN"),0),U,10) I APCPV("IHS LOCATION CODE")="" S APCPE("ERROR")="E113" Q
 S APCPV("T-LOCAS")=$E(APCPV("IHS LOCATION CODE"),1,4),APCPV("ELOC")=$E(APCPV("IHS LOCATION CODE"),5,6)
DEM ;
 D DEM^APCPDR21 ;check demographic data q:error found
 Q:APCPV("PATIENT NAME")["DEMO,PATIENT"
 Q:$D(APCPE)
 S APCPV("T-INIT")="  "
 ;get discharge date if hospitalization
 D:$P(APCPV("V REC"),U,7)="H" FINDDSCH
 Q
FINDDSCH ;
 S X=$O(^AUPNVINP("AD",APCP("V DFN"),"")) I X S APCPV("DISCHARGE DATE")=$J($P(^AUPNVINP(X,0),U),7) Q
 S X=$O(^AUPNVCHS("AD",APCP("V DFN"),"")) I X S APCPV("DISCHARGE DATE")=$J($P(^AUPNVCHS(X,0),U,7),7) Q
 Q
 ;
PROCTX ; process and generate appropriate statistical record
 D PRIMTX
 Q:$D(APCPE)
 D STATMEGA
 ;D CHA
 Q
 ;
PRIMTX ;PROCESS PRIMARY TX (PCIS,APC OR INPT)
 K APCPE
INPT ;
 I APCPV("SRV CAT")="H","CV"'[APCPV("TYPE"),'$P(^AUPNVSIT(APCP("V DFN"),0),U,11) D ^APCPAH D:$D(APCPE) RESET^APCPDR21 Q  ;IHS/CMI/LAB - line above replaced with this line
 ;
APC ;generate APC record
 ;send all amb,observ,nursing home,day surg,chart rev,tele - per Larry Claycomb 2/14/96
 ;I $D(APCPS("APC")),"AORSCT"[APCPV("SRV CAT") D ^APCPAPC ;IHS/CMI/LAB - commented out
 I "AORSCT"[APCPV("SRV CAT"),'$P(^AUPNVSIT(APCP("V DFN"),0),U,11) D ^APCPAPC ;IHS/CMI/LAB - new line
 Q
 ;
STATMEGA ;generate area mega database record
 Q:'$D(APCPS("STAT"))
 ;I "E"[APCPV("SRV CAT") S APCP("EVENTS")=$G(APCP("EVENTS"))+1 Q
 ;I '$D(^AUPNVPOV("AD",APCP("V DFN"))),APCPV("SRV CAT")="I" S APCP("IN NO PP")=$G(APCP("IN NO PP"))+1 Q
 ;I '$D(^AUPNVPOV("AD",APCP("V DFN"))),"CV"[APCPV("TYPE") S APCP("IN NO PP")=$G(APCP("IN NO PP"))+1 Q
 ;I '$D(^AUPNVPRV("AD",APCP("V DFN"))),"CV"[APCPV("TYPE") S APCP("IN NO PP")=$G(APCP("IN NO PP"))+1 Q
 ;I '$D(^AUPNVPRV("AD",APCP("V DFN"))),APCPV("SRV CAT")="I" S APCP("IN NO PP")=$G(APCP("IN NO PP"))+1 Q
 I APCPV("SRV CAT")="H","CVO"'[APCPV("TYPE") D  Q:'Y
 .S Y=0 S Z=$O(^AUPNVINP("AD",APCP("V DFN"),0))
 .Q:'Z
 .I $P($G(^AUPNVINP(Z,0)),U,15) Q
 .S Y=1
 D DELSTAT
 Q
DELCNT ;
 S APCP("STAT")=APCP("STAT")+1,APCP("COUNT")=APCP("COUNT")+1
 S ^BAPCDATA(APCP("COUNT"))=APCP("X")
 Q
DELSTAT ;generate new delimited format of the statistical record
 S APCP("VISITS STAT")=$G(APCP("VISITS STAT"))+1
 S APCPV("TX GENERATED")=1,^XTMP("APCP"_$S(APCPO("RUN")="NEW":"DR",APCPO("RUN")="REDO":"REDO",APCPO("RUN")="DATE":"SRE",1:"DR"),"MAIN TX",APCP("V DFN"))=APCP("MAIN TX DATE") ;IHS/CMI/LAB - patch 3
 S APCP("X")=$$VREC(APCP("V DFN"),"STATISTICAL RECORD 1")
 D DELCNT
 S APCP("X")=$$VREC(APCP("V DFN"),"STATISTICAL RECORD 2")
 D DELCNT
 S APCP("X")=$$VREC(APCP("V DFN"),"STATISTICAL RECORD 3")
 D DELCNT
 S APCP("X")=$$VREC(APCP("V DFN"),"STATISTICAL RECORD 4")
 D DELCNT
 S APCP("X")=$$VREC(APCP("V DFN"),"STATISTICAL RECORD 5")
 D DELCNT
 ;cpt records
 K AUPNCPT S X=$$CPT^AUPNCPT(APCP("V DFN"))
 I $D(AUPNCPT) D
 .S (X,APCPV("CPT COUNT"))=0 F  S X=$O(AUPNCPT(X)) Q:X'=+X  S APCPV("CPT COUNT")=APCPV("CPT COUNT")+1
 .S APCPV("CPT RECS")=$S(APCPV("CPT COUNT")#25=0:APCPV("CPT COUNT")/25,1:(APCPV("CPT COUNT")\25)+1) ;IHS/CMI/LAB
 .F APCPV("CPT X")=1:1:APCPV("CPT RECS") D
 ..S P=1,Y=(APCPV("CPT X")*25)-25 K APCPV("CPT SET") F  S Y=$O(AUPNCPT(Y)) Q:Y=""!(Y>(APCPV("CPT X")*25))  S $P(APCPV("CPT SET"),U,P)=$P(AUPNCPT(Y),U)_"^" D  S P=P+2
 ...Q:$P(AUPNCPT(Y),U,4)'=9000010.18
 ...S E=$P(AUPNCPT(Y),U,5) S $P(APCPV("CPT SET"),U,(P+1))=$P($G(^AUPNVCPT(E,0)),U,16)
 ..S APCP("X")=$$VREC(APCP("V DFN"),"STATISTICAL RECORD 6",APCPV("CPT SET"),APCPV("CPT X"))
 ..D DELCNT
 ;MEDS
 K APCPMED,APCPMX,APCPMC,APCPMD,APCPMNDC,APCPMCLS,APCPMQ
 I 'APCPS("ORYX") D
 .S (APCPMX,APCPMC)=0 F  S APCPMX=$O(^AUPNVMED("AD",APCP("V DFN"),APCPMX)) Q:APCPMX'=+APCPMX  D
 ..S APCPMD=$P(^AUPNVMED(APCPMX,0),U) Q:'$D(^PSDRUG(APCPMD,0))
 ..S APCPMC=APCPMC+1
 ..S APCPMD=$P(^PSDRUG(APCPMD,0),U)
 ..S APCPMQ=$P(^AUPNVMED(APCPMX,0),U,6)
 ..S APCPMNDC=$P($G(^PSDRUG($P(^AUPNVMED(APCPMX,0),U),2)),U,4)
 ..S APCPMCLS=$P(^PSDRUG($P(^AUPNVMED(APCPMX,0),U),0),U,2)
 ..S APCP("X")=$$VREC(APCP("V DFN"),"STATISTICAL RECORD 7",APCPMC,APCPMD,APCPMNDC,APCPMCLS,APCPMQ)
 ..D DELCNT
 S APCPV("STAT TX GEN")=1
 Q
 ;
VREC(APCPVIEN,APCPRTYP,APCPVAR1,APCPVAR2,APCPVAR3,APCPVAR4,APCPVAR5,APCPVAR6) ;generate 1 record delimited format
 S APCPVIEN(0)=^AUPNVSIT(APCPVIEN,0)
 S DFN=$P(^AUPNVSIT(APCPVIEN,0),U,5)
 NEW APCPRIEN S APCPRIEN=$O(^APCPREC("B",APCPRTYP,0))
 I 'APCPRIEN Q ""
 NEW APCPY,APCPT S APCPY=0,APCPT="" F  S APCPY=$O(^APCPREC(APCPRIEN,11,"B",APCPY)) Q:APCPY'=+APCPY  D
 .S X=""
 .NEW APCPZ S APCPZ=$O(^APCPREC(APCPRIEN,11,"B",APCPY,0))
 .Q:'$D(^APCPREC(APCPRIEN,11,APCPZ,1))
 .I 'APCPS("ORYX") X ^APCPREC(APCPRIEN,11,APCPZ,1)
 .I APCPS("ORYX"),$P(^APCPREC(APCPRIEN,11,APCPZ,0),U,3) S X=""
 .I APCPS("ORYX"),'$P(^APCPREC(APCPRIEN,11,APCPZ,0),U,3) X ^APCPREC(APCPRIEN,11,APCPZ,1)
 .S $P(APCPT,U,APCPY)=X
 .;S LORICNT=$G(LORICNT)+1,^LORITEST(LORICNT)=APCPVIEN_"^"_$P(^APCPREC(APCPRIEN,11,APCPZ,0),U,1)_"^"_$P(^APCPREC(APCPRIEN,11,APCPZ,0),U,2)_"^"_X
 Q APCPT
DATE(D) ;EP - return YYYYMMDD from internal fm format
 ;IHS/CMI/LAB - added this for Y2K compliance and "^" pieced statistical record
 I $G(D)="" Q ""
 Q ($E(D,1,3)+1700)_$E(D,4,7)
EXAM(V,N) ;EP - return nth v exam on this visit
 I 'V Q ""
 I '$D(^AUPNVSIT(V)) Q ""
 I '$G(N) Q ""
 NEW %,Y,P,C,Z
 S (Z,P)="",(Y,C)=0
 S Y=0 F  S Y=$O(^AUPNVXAM("AD",V,Y)) Q:Y'=+Y   S C=C+1 I C=N S P=$P(^AUPNVXAM(Y,0),U),Z=Y
 I 'P Q P
 I '$D(^AUTTEXAM(P)) Q ""
 Q $P(^AUTTEXAM(P,0),U,2)
 ;
PED(V,N) ;EP - return nth v patient ed on this visit
 I 'V Q ""
 I '$D(^AUPNVSIT(V)) Q ""
 I '$G(N) Q ""
 NEW %,Y,P,C,Z
 S (Z,P)="",(Y,C)=0
 S Y=0 F  S Y=$O(^AUPNVPED("AD",V,Y)) Q:Y'=+Y   S C=C+1 I C=N S P=$P(^AUPNVPED(Y,0),U),Z=Y
 I 'P Q P
 I '$D(^AUTTEDT(P)) Q ""
 Q $P(^AUTTEDT(P,0),U,2)
 ;
RZERO(V,L) ;ep right zero fill 
 NEW %,I
 S %=$L(V),Z=L-% F I=1:1:Z S V=V_"0"
 Q V
LZERO(V,L) ;EP - left zero fill
 NEW %,I
 S %=$L(V),Z=L-% F I=1:1:Z S V="0"_V
 Q V
LBLK(V,L) ;left blank fill
 NEW %,I
 S %=$L(V),Z=L-% F I=1:1:Z S V=" "_V
 Q V
RBLK(V,L) ;EP right blank fill
 NEW %,I
 S %=$L(V),Z=L-% F I=1:1:Z S V=V_" "
 Q V