ABMDACK ; IHS/ASDST/DMJ - APC Visit Edits ;
 ;;2.6;IHS 3P BILLING SYSTEM;;NOV 12, 2009
 ;Original;TMD;02/27/96 11:42 AM
 ;
 S U="^" K ABM,ABMP,ABML
V ;
 S ABMP("ENDT")="" F  S ABMP("ENDT")=$O(^AAPCRCDS("ABILL",ABMP("ENDT"))) Q:ABMP("ENDT")=""  D
 .S ABMP("VDFN")="" F  S ABMP("VDFN")=$O(^AAPCRCDS("ABILL",ABMP("ENDT"),ABMP("VDFN"))) Q:ABMP("VDFN")=""  D V2 K ^AAPCRCDS("ABILL",ABMP("ENDT"),ABMP("VDFN"))
 G XIT
 ;
V2 Q:'$D(^AAPCRCDS(ABMP("VDFN"),0))  S ABMP("V0")=^(0),ABMP("VDT")=$P($P(ABMP("V0"),U,3),".") Q:$D(^AAPCRCDS("ACAN",ABMP("VDFN")))
 I $D(^ABMDBILL(DUZ(2),"APC",ABMP("VDFN"))) Q
 I +$P($G(^ABMDPARM(DUZ(2),1,0)),U,16) S X1=DT,X2=0-($P(^(0),U,16)*30.417) D C^%DTC Q:ABMP("VDT")<X
 S ABMP("PDFN")=$P(ABMP("V0"),U),ABMP("CLN")=$P(ABMP("V0"),U,13),ABMP("LDFN")=$P(ABMP("V0"),U,2)
 I ABMP("PDFN")=""!(ABMP("LDFN")="") Q
 I $D(^ABPVFAC("PC",ABMP("PDFN"),ABMP("VDT"))) Q
 I ABMP("CLN")]"" Q:$D(^ABMDPARM(DUZ(2),1,15,ABMP("CLN")))
 I ABMP("CLN")="" S ABMP("CLN")=1
 I '$D(^DPT(ABMP("PDFN"),0))!'$D(^AUTTLOC(ABMP("LDFN"),0))!'$D(^DIC(40.7,ABMP("CLN"),0)) Q
 S ABM=0,ABM("QIT")=0
 F  S ABM=$O(^ABMDCLM(DUZ(2),"B",ABMP("PDFN"),ABM)) Q:'ABM  D
 .Q:$D(^ABMDCLM(DUZ(2),ABM,15,0))
 .Q:$P($G(^ABMDCLM(DUZ(2),ABM,0)),U,2)='ABMP("VDT")
 .Q:$P(^ABMDCLM(DUZ(2),ABM,0),U,3)='ABMP("LDFN")
 .Q:$P(^ABMDCLM(DUZ(2),ABM,0),U,6)='ABMP("CLN")
 .S ABM("QIT")=1
 Q:ABM("QIT")
 S ABMDFN=ABMP("PDFN"),ABMVDT=ABMP("VDT")
 D ELG^ABMDLCK("",.ABML,ABMDFN,ABMVDT) Q:'$D(ABML)
 S ABM("PRI")="" F  S ABM("PRI")=$O(ABML(ABM("PRI"))) Q:'ABM("PRI")  D INS
 Q
 ;
INS S ABMP("INS")="" F  S ABMP("INS")=$O(ABML(ABM("PRI"),ABMP("INS"))) Q:'ABMP("INS")  S ABM("INS")=ABMP("INS") D ^ABMDAST L
 Q
 ;
XIT K ABM,ABMP,ABML,ABMI,ABMR
 Q