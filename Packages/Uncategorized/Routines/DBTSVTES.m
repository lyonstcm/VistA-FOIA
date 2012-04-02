DBTSVTES ;routine to replicate the visit to SQL for diabetes [ 10/20/1999  6:50 PM ]
 ;   copy of the DBTSVSIT  don't log
 ;                         use a global
 ;                         remote proce.  DBTS V TEST
 ;       
 ;
 ;
VSIT(DBTSGBL,DBTSP) ;
 ;  dmh changed the DBTSRET to DBTSGBL for global array test 10-20-99
TEST ;
 K ^DBTSTEMP($J)   ;dmh 10-20-99
 S DBTSGBL="^DBTSTEMP("_$J_")"   ;dmh 10-20-99
 S ARRAY=0
 ;S DBTSP=9024     ;uncomment if want to test with call to TEST directly
 ;
 D ^XBKVAR
 I DUZ(2)=4526 S DUZ(2)=2348
 S DBTS("LOC")=$P($G(^AUTTLOC(DUZ(2),0)),"^",10)
 I DBTS("LOC")="" S DBTSRET(1)="-1" Q
 S DBTS("FN")="9000010"
 S DBTS("IEN")=0
MEAS ;
 B
 F I=1:1 S DBTS("IEN")=$O(^AUPNVSIT("AC",DBTSP,DBTS("IEN"))) Q:+DBTS("IEN")=0  D  ;Q:ARRAY>500  dmh commented out this 500 part 10-20-99 for test   
 .;
 .;added the >500 to stop and not fill up partition
 .;
 .S REC=$G(^AUPNVSIT(DBTS("IEN"),0))
 .Q:REC=""
 .S DBTS("VDFN")=DBTS("IEN")
 .S DBTS("MODDT")=$P(REC,U,13)
 .S DBTS("VDATE")=$P(REC,U,1)
 .Q:DBTS("VDATE")=""
 .S DBTS("V")=$P(DBTS("VDATE"),".",1)
 .Q:DBTS("V")=""
 .S DBTS("DT")=DBTS("V")
 .D DTCHK^DBTSUT
 .Q:$D(DBTS("BADDT"))
 .S DBTS("VDATE")=$E(DBTS("V"),4,5)_"/"_$E(DBTS("V"),6,7)_"/"_($E(DBTS("V"),1,3)+1700)
 .;
 .;
 .;
 .S DBTS("FAC")=$P(REC,U,6) S DBTS("FAC")=$P($G(^AUTTLOC(DBTS("FAC"),0)),U,10)
 .S DBTS("SC")=$P(REC,U,7)
 .Q:DBTS("SC")=""
 .S DBTS("CLI")=$P(REC,U,8) 
 .I DBTS("CLI")'="" S DBTS("CLI")=$P($G(^DIC(40.7,DBTS("CLI"),0)),U,2)
 .Q:DBTS("CLI")=""
 .S DBTS("PAT")=DBTSP
 .S DBTS("CN")=$P($G(^AUPNPAT(DBTSP,41,DUZ(2),0)),"^",2)
 .S DBTS("ID")=DBTS("LOC")_"|"_DBTS("FN")_"|"_DBTS("IEN")
 . ;  commented out the next two so can just do hard set on the test
 . ;  for global transfer....added the set of DBTS("AU")="A"
 . ;  dmh 10-20-99
 . S DBTS("AU")="A"
 .;D MODCK
 .;Q:DBTS("OK")="N"
 .D PROV
 .S ARRAY=ARRAY+1
 .   ;
 .   ;Q:ARRAY>500   ; added so no pgmov errors on space 10-5-99
 .   ;  dmh commented out the above for global test 10-20-99
 .   ;
 .S DBTSRET(ARRAY)=DBTS("ID")_U_DBTS("AU")_U_DBTS("VDATE")_U_DBTS("LOC")_U_DBTS("FAC")_U_DBTS("PROV")_U_DBTS("CLI")_U_DBTS("SC")
 .S ^DBTSTEMP($J,ARRAY)=DBTSRET(ARRAY)_$C(13)_$C(10)
 .    ; dmh 10-20-99 added above line and commented out below
 .;D LOG
 .Q
 I ARRAY=0 S DBTSRET(1)="-2" S ^DBTSTEMP($J,1)="-2"_$C(13)_$C(10)
 ;I ARRAY=0 S DBTSRET(1)="-2" 
 ;  dmh 10-20-99  added the above and commented out the next one
 ;S $P(^DBTSPAT(DBTSP,"V"),"^",2)=DT
 Q
MODCK ;
 ;
 S DBTS("OK")="Y"
 S DBTS("AU")="A"
 Q:'$D(^DBTSPAT(DBTSP,"V"))
 I $P(^DBTSPAT(DBTSP,"V"),"^",2)="" Q
 S DBTS("MREC")=$G(^DBTSPAT(DBTSP,"V"))
 Q:DBTS("MREC")=""
 S DBTS("LDFN")=$P(DBTS("MREC"),U,1)
 Q:+DBTS("LDFN")<DBTS("IEN")
 S DBTS("LDT")=$P(DBTS("MREC"),U,2)
 I (+DBTS("LDT")>DBTS("MODDT")),(DBTS("LDFN")>DBTS("IEN")) S DBTS("OK")="N" Q
 I (DBTS("LDT")'>DBTS("MODDT")) S DBTS("AU")="U" Q
 S DBTS("OK")="N" Q
 Q
LOG ;  update the patient log for the type of VISIT
 Q
 I '$D(DT) D ^XBKVAR 
 I '$D(^DBTSPAT(DBTSP)) D
 .K ^DBTSPAT("B",DBTSP)
 .S X=DBTSP,DINUM=X,DIC(0)="XNL",DIC="^DBTSPAT(" D FILE^DICN
 I '$D(^DBTSPAT(DBTSP,"V")) S ^DBTSPAT(DBTSP,"V")=DBTS("IEN")_"^" Q
 I $G(DBTS("LDFN"))<DBTS("IEN") S $P(^DBTSPAT(DBTSP,"V"),"^",1)=DBTS("IEN")
 Q
PROV ;
 S PROVFL=0
 S DBTS("PROV")=""
 S PROV=0
 F  S PROV=$O(^AUPNVPRV("AD",DBTS("IEN"),PROV)) Q:PROV=""  D  I PROVFL=1 Q
 .I $P($G(^AUPNVPRV(PROV,0)),U,4)="P" D
 ..S PROVFL=1
 ..S DBTS("PROV")=$P($G(^AUPNVPRV(PROV,0)),U,1)
 ..S DBTS("PROV")=$P($G(^DIC(6,DBTS("PROV"),0)),U,1)
 ..S DBTS("PROV")=$P($G(^DIC(16,DBTS("PROV"),"A3")),U,1)
 ..I DBTS("PROV")="" S PROVFL=0
 Q