BQITRRUN ;VNGT/HS/ALA-Get last Treatment Prompt Run ; 08 Aug 2008  12:14 PM
 ;;2.1;ICARE MANAGEMENT SYSTEM;;Feb 07, 2011
 ;
 Q
 ;
EN(DATA,BQIDFN) ; EP - BQI GET LAST TRMT RUN
 ;
 ; Input
 ;  BQIDFN - Patient internal entry number
 ;  
 ; Get the beginning and ending times of the Flag run
 NEW UID,II,BDT,EDT,X,DA
 S UID=$S($G(ZTSK):"Z"_ZTSK,1:$J)
 S DATA=$NA(^TMP("BQITRRUN",UID))
 S BQIDFN=$G(BQIDFN,"")
 K @DATA
 ;
 S II=0
 NEW $ESTACK,$ETRAP S $ETRAP="D ERR^BQITRRUN D UNWIND^%ZTER" ; SAC 2006 2.2.3.3.2
 ;
 S HDR="D00030LAST_UPDATE_DATETIME"
 ;S HDR="D00030LAST_NIGHT_RUN_START_DATETIME^D00030LAST_NIGHT_RUN_END_DATETIME^"
 ;S HDR=HDR_"D00030LAST_UPDATE_START_DATETIME^D00030LAST_UPDATE_END_DATETIME"
 S @DATA@(II)=HDR_$C(30)
 ;
 S DA=$O(^BQI(90508,0)) I 'DA G DONE
 ;
 ;S BDT=$$FMTE^BQIUL1($$GET1^DIQ(90508,DA_",",3.13,"I"))
 ;S EDT=$$FMTE^BQIUL1($$GET1^DIQ(90508,DA_",",3.14,"I"))
 ;S BUDT=$$FMTE^BQIUL1($$GET1^DIQ(90508,DA_",",4.1,"I"))
 S BUEDT=$$FMTE^BQIUL1($$GET1^DIQ(90508,DA_",",4.11,"I"))
 I BQIDFN="" S DTLCHK=BUEDT
 I BQIDFN'="" D
 . I $G(^BQIPAT(BQIDFN,0))="" S DTLCHK="" Q
 . S DTLCHK=$S($P(^BQIPAT(BQIDFN,0),U,7)\1>(BUEDT\1):$P(^BQIPAT(BQIDFN,0),U,7),1:BUEDT)
 S II=II+1,@DATA@(II)=$$FMTE^BQIUL1(DTLCHK)_$C(30)
 ;
DONE ;
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