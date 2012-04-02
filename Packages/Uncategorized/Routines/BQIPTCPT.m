BQIPTCPT ;VNGT/HS/ALA-Patient CPT data ; 10 Dec 2008  11:48 AM
 ;;2.1;ICARE MANAGEMENT SYSTEM;;Feb 07, 2011
 ;
 Q
 ;
EN(DATA,DFN,DRANGE) ; EP -- BQI PATIENT CPTS
 ;
 ;Description - all the education that a patient has
 ;
 ;Input
 ;  DFN - Patient internal entry number
 ;
 NEW UID,II,IEN
 S UID=$S($G(ZTSK):"Z"_ZTSK,1:$J)
 S DATA=$NA(^TMP("BQIPTCPT",UID))
 K @DATA
 ;
 S II=0
 NEW $ESTACK,$ETRAP S $ETRAP="D ERR^BQIPTCPT D UNWIND^%ZTER" ; SAC 2006 2.2.3.3.2
 ;
 S DRANGE=$$DATE^BQIUL1($G(DRANGE))
 S @DATA@(II)="I00010CPT_IEN^I00010VISIT_IEN^D00030VISIT_DATETIME^T00050APCDTCPT^T00025APCDTM1^T00015APCDTM2^T00005APCDTUN"_$C(30)
 S IEN=""
 F  S IEN=$O(^AUPNVCPT("AC",DFN,IEN),-1) Q:IEN=""  D
 . S CPTN=$$GET1^DIQ(9000010.18,IEN_",",.01,"I") I CPTN="" Q
 . S CPT=$$GET1^DIQ(81,CPTN_",",.01,"E")_" - "_$$GET1^DIQ(81,CPTN_",",2,"E")
 . S VISIT=$$GET1^DIQ(9000010.18,IEN_",",.03,"I") I VISIT="" Q
 . S VSDTM=$$GET1^DIQ(9000010,VISIT_",",.01,"I") I VSDTM=0 Q
 . I DRANGE'="",(VSDTM\1<DRANGE) Q
 . S MOD1=$$GET1^DIQ(9000010.18,IEN_",",.08,"E")
 . S MOD2=$$GET1^DIQ(9000010.18,IEN_",",.09,"E")
 . S QTY=$$GET1^DIQ(9000010.18,IEN_",",.16,"E")
 . S II=II+1,@DATA@(II)=IEN_U_VISIT_U_$$FMTE^BQIUL1(VSDTM)_U_CPT_U_MOD1_U_MOD2_U_QTY_$C(30)
 ;
 ; Check for refusals
 D REF
 ;
 S II=II+1,@DATA@(II)=$C(31)
 Q
 ;
ERR ;
 D ^%ZTER
 NEW Y,ERRDTM
 S Y=$$NOW^XLFDT() X ^DD("DD") S ERRDTM=Y
 S BMXSEC="Recording that an error occurred at "_ERRDTM
 I $D(II),$D(DATA) S II=II+1,@DATA@(II)=$C(31)
 Q
 ;
REF ; Check for refusals
 NEW TOP,RVDT,REVDT,RFIEN,CPT,MOD1,MOD2,QTY,CPTN
 S TOP=""
 F  S TOP=$O(^AUPNPREF("AA",DFN,81,TOP)) Q:TOP=""  D
 . S RVDT=""
 . F  S RVDT=$O(^AUPNPREF("AA",DFN,81,TOP,RVDT)) Q:RVDT=""  D
 .. ; Reverse the reverse date
 .. S REVDT=9999999-RVDT
 .. I DRANGE'="",(REVDT\1)<DRANGE Q
 .. S RFIEN=""
 .. F  S RFIEN=$O(^AUPNPREF("AA",DFN,81,TOP,RVDT,RFIEN)) Q:RFIEN=""  D
 ... S CPTN=$$GET1^DIQ(9000022,RFIEN_",",.06,"I")
 ... S CPT=$$GET1^DIQ(81,CPTN_",",.01,"E")_" - "_$$GET1^DIQ(81,CPTN_",",2,"E")
 ... S RSLT=$$GET1^DIQ(9000022,RFIEN_",",.07,"E")
 ... S MOD2="",QTY=""
 ... S II=II+1,@DATA@(II)=U_U_$$FMTE^BQIUL1(REVDT)_U_CPT_U_RSLT_U_MOD2_U_QTY_$C(30)
 Q