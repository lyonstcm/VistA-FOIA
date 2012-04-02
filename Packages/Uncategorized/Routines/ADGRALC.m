ADGRALC ; IHS/ADC/PDW/ENM - READMISSION LISTINGS (CALC) ; [ 03/25/1999  11:48 AM ]
 ;;5.0;ADMISSION/DISCHARGE/TRANSFER;;MAR 25, 1999
 ;
 K ^TMP("DGZRAL",$J)
A ; -- driver
 D LP1 G ^ADGRALP
 ;
LP1 ; -- loop admissions
 N WARD,DX,DGRE,DGDSA,DGDS,NAME,DGDT,TS,DFN,IFN,UTL,WD,N,ED
 S DGDT=DGBDT-.0001,ED=DGEDT+.2400
 F  S DGDT=$O(^DGPM("AMV1",DGDT)) Q:'DGDT!(DGDT>ED)  D
 . S DFN=0 F  S DFN=$O(^DGPM("AMV1",DGDT,DFN)) Q:'DFN  D
 .. S IFN=0 F  S IFN=$O(^DGPM("AMV1",DGDT,DFN,IFN)) Q:'IFN  D 1
 Q
 ;
1 ; -- check for readmission
 NEW DGPMDA,NAME,WARD,TS,DX,UTL
 S DGPMDA=IFN D ^ADGREADM Q:'$D(DGRE)
 S NAME=$P($G(^DPT(DFN,0)),U)
 S N=$G(^DGPM(IFN,0)),WD=$P(N,U,6),DX=$P(N,U,10)
 I DGTYP=2,DGSRT'="A" Q:WD'=+DGSRT
 S WARD=$P($G(^DIC(42,+WD,0)),U),TS=$$TS
 I DGTYP=3,DGSRT'="A" Q:TS'=+DGSRT
 S TS=$S('TS:"NO SERVICE",1:$P($G(^DIC(45.7,+TS,0)),U))
 ; -- date, alpha
 I DGTYP=1 D  Q
 . S UTL=WARD_U_TS_U_DX_U_DGRE_U_DGDSA_U_DGDS_U_$$M1PD_U_$$M1P
 . S ^TMP("DGZRAL",$J,$P(DGDT,"."),DGDT,DFN)=UTL
 ; -- ward, date, alpha
 I DGTYP=2 D  Q
 . S UTL=TS_U_DX_U_DGRE_U_DGDSA_U_DGDS_U_$$M1PD_U_$$M1P
 . S ^TMP("DGZRAL",$J,WARD,DGDT,NAME,DFN)=UTL
 ; -- service, date, alpha
 S UTL=WARD_U_DX_U_DGRE_U_DGDSA_U_DGDS_U_$$M1PD_U_$$M1P
 S ^TMP("DGZRAL",$J,TS,DGDT,NAME,DFN)=UTL
 Q
 ;
Q ; -- cleanup
 K WARD,DX,DGRE,DGDSA,DGDS,NAME,DGDT,TS,DFN,IFN,UTL,WD,N,ED Q
 ;
M1P() ; -- movement, admission, previous
 Q $O(^DGPM("ATID1",DFN,+$O(^DGPM("ATID1",DFN,9999999.9999999-DGDT)),0))
 ;
M1PD() ; -- movement, admission, previous, date
 Q +$G(^DGPM(+$$M1P,0))
 ;
TS() ; -- treating specialty
 Q $P($G(^DGPM(+$O(^DGPM("APHY",IFN,0)),0)),U,9)