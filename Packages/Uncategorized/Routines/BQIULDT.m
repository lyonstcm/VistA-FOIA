BQIULDT ;PRXM/HC/ALA-Return FileMan Date ; 12 Apr 2007  5:17 PM
 ;;2.1;ICARE MANAGEMENT SYSTEM;;Feb 07, 2011
 ;
 Q
 ;
EN(DATA,DATE) ; EP -- BQI GET FILEMAN DATE
 ;
 ; Input
 ;   DATE - Date in a standard, non-FileMan format
 NEW UID,II,FDATE
 S UID=$S($G(ZTSK):"Z"_ZTSK,1:$J)
 S DATA=$NA(^TMP("BQIULDT",UID))
 K @DATA
 S II=0
 NEW $ESTACK,$ETRAP S $ETRAP="D ERR^BQIULDT D UNWIND^%ZTER" ; SAC 2006 2.2.3.3.2
 S @DATA@(II)="T00025FILEMAN_DATE"_$C(30)
 S FDATE=$$DATE^BQIUL1(DATE)
 S II=II+1,@DATA@(II)=FDATE_$C(30)
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
DTM(DATA,FAKE) ;EP - BQI GET SYSTEM DATETIME
 ;
 NEW UID,II
 S UID=$S($G(ZTSK):"Z"_ZTSK,1:$J)
 S DATA=$NA(^TMP("BQIULDTM",UID))
 K @DATA
 S II=0
 NEW $ESTACK,$ETRAP S $ETRAP="D ERR^BQIULDT D UNWIND^%ZTER" ; SAC 2006 2.2.3.3.2
 S @DATA@(II)="D00030SYSTEM_DATETIME"_$C(30)
 S II=II+1,@DATA@(II)=$$FMTE^BQIUL1($$NOW^XLFDT())_$C(30)
 S II=II+1,@DATA@(II)=$C(31)
 Q