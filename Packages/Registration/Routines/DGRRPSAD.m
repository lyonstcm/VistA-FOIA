DGRRPSAD ; ALB/SGG - rtnDGRR PatientServices ADT Information ;09/30/03  ; Compiled December 9, 2003 15:22:22
 ;;5.3;Registration;**557**;Aug 13, 1993
 ;
DOC ;<DataSet Name='ADT'
 ;
 ;.102      CURRENT MOVEMENT (*P405'), [.102;1]
 ;           FILE (#405) PATIENT MOVEMENT STORED IN: ^DGPM(
 ;                 .01       DATE/TIME (RDX), [0;1]
 ;                 
 ;.1        WARD LOCATION (FX), [.1;E1,30]
 ;.101      ROOM-BED (F), [.101;1]    
 ;.103      TREATING SPECIALTY (P45.7'), [.103;1]
 ;.104      PROVIDER (*P200'), [.104;1]
 ;.1041     ATTENDING PHYSICIAN (*P200'), [.1041;1]
 ;.105      CURRENT ADMISSION (*P405'), [.105;1]   
 ;.107      LODGER WARD LOCATION (F), [.107;1]     ; LODGER ONLY
 ;.108      CURRENT ROOM (P405.4'), [.108;1]       ; LODGER ONLY
 ;          ^DG(405.4
 ;          PREVIOUS DISCHARGE DATE                ; NON CURRENT NON LODGER
 ;
 ;
 ;A DIFFERENT LOGIC HAS BEEN ADOPTED FOR THE ADT DATASET
 ;
 ;USING IN5^VADPT:
 ;   first CALL IN5^VADPT for CURRENT INFO based on the requested
 ;   date passed to RPC.  If no date sent, defaults to current date.
 ;   if no CURRENT CALL IN5^VADPT for LODGER INFO
 ;   if no LODGER INFO CALL IN5^VADPT for LAST DISCHARGE DATE
 ;
 ;Rows of ADT movements associated with the admission are also returned.
 ;See BLD for list of data elements returned for each movement.
 ;   
GETPSARY(PSARRAY,REQDT) ;
 ;
 ; GET CURRENT MOVEMENT DATA FROM IN5^VADPT
 NEW INDATA,VAIP,VAINDT,DFN,VAROOT,VAHOW,ADTTYPE
 SET DFN=PTID
CURRENT K INDATA,VAIP,VAINDT
 SET VAROOT="INDATA",VAHOW=2
 DO IN5^VADPT SET ADTTYPE="CURRENT"
LODGER IF $P($G(INDATA(1)),"^",1)="" DO  ; NO CURRENT DO LODGER
 .KILL INDATA,VAIP,VAINDT
 .SET VAROOT="INDATA",VAHOW=2,VAIP("L")=""
 .DO IN5^VADPT SET ADTTYPE="LODGER"
LAST IF $P($G(INDATA(1)),"^",1)="" DO  ; NO CURRENT AND NO LODGER DO PREVIOUS
 .K INDATA,VAIP,VAINDT
 .SET VAROOT="INDATA",VAHOW=2,VAIP("D")="LAST"
 .DO IN5^VADPT SET ADTTYPE="DISCHARGE"
 ;
 NEW CNT
 SET CNT=$G(CNT)+1,PSARRAY(CNT)="<DataSet Name='ADT'"
 SET CNT=$G(CNT)+1,PSARRAY(CNT)="^RequestDate^"_DT
 SET CNT=$G(CNT)+1,PSARRAY(CNT)="^CurrentMovement^"_$$CURMOVE()
 SET CNT=$G(CNT)+1,PSARRAY(CNT)="^WardLocation^"_$$WARDLOC()
 SET CNT=$G(CNT)+1,PSARRAY(CNT)="^Service^"_$$SERVICE()
 SET CNT=$G(CNT)+1,PSARRAY(CNT)="^RoomBed^"_$$ROOMBED()
 SET CNT=$G(CNT)+1,PSARRAY(CNT)="^TreatingSpecialty^"_$$TRETSPC()
 SET CNT=$G(CNT)+1,PSARRAY(CNT)="^Provider^"_$$PROVIDE()
 SET CNT=$G(CNT)+1,PSARRAY(CNT)="^AttendingPhysician^"_$$ATTPHY()
 SET CNT=$G(CNT)+1,PSARRAY(CNT)="^CurrentAdmission^"_$$CURADM()
 SET CNT=$G(CNT)+1,PSARRAY(CNT)="^TransactionType^"_$$TRANSTYP()
 SET CNT=$G(CNT)+1,PSARRAY(CNT)="^MovementType^"_$$MVTTYP()
 SET CNT=$G(CNT)+1,PSARRAY(CNT)="^LastAdmissionDate^"_$$LASTADM()
 SET CNT=$G(CNT)+1,PSARRAY(CNT)="^LodgerWardLocation^"_$$LODWLOC()
 SET CNT=$G(CNT)+1,PSARRAY(CNT)="^LodgerRoom^"_$$LODROOM()
 SET CNT=$G(CNT)+1,PSARRAY(CNT)="^DischargeDate^"_$$DISDATE()
 D ADTC(REQDT,.CNT)
 SET CNT=$G(CNT)+1,PSARRAY(CNT)="></DataSet>"_"^^^1"
 QUIT
 ;
ADTC(ADTDT,CNT) ;ADT Collection of all movements associated with a specifed date
 NEW ROWCNT
 K VAIP,VAROOT,INDATA,VAHOW
 SET ADTDT=$S($G(ADTDT)'="":ADTDT\1,1:DT)
 SET ROWCNT=0
 SET VAIP("D")=ADTDT
 SET VAIP("M")=0
 SET VAIP("L")=""
 DO IN5^VADPT
 IF VAIP(1)'="" DO
 . NEW DGRRMIEN,DGRRCA,DGRRMVDT
 . SET DGRRCA=VAIP(1)
 . K ^TMP($J,"DGRRMVTS")
 . SET DGRRMIEN=""
 . F  SET DGRRMIEN=$O(^DGPM("CA",+DGRRCA,DGRRMIEN)) Q:DGRRMIEN=""  D
 ..; Set up TMP global to assure movements are in date/time order
 ..S DGRRMVDT=+$P($G(^DGPM(+DGRRMIEN,0)),"^")
 ..I DGRRMVDT>0 S ^TMP($J,"DGRRMVTS",DGRRMVDT,DGRRMIEN)=""
 . ;Loop through TMP global
 .N DGRRMDT,DGRRIEN
 .S DGRRMDT=""
 .F  S DGRRMDT=$O(^TMP($J,"DGRRMVTS",DGRRMDT)) Q:DGRRMDT=""  D
 .. S DGRRIEN=""
 .. F  S DGRRIEN=$O(^TMP($J,"DGRRMVTS",DGRRMDT,DGRRIEN)) Q:DGRRIEN=""  D
 ... K INDATA,VAROOT,VAIP
 ... SET ROWCNT=$G(ROWCNT)+1
 ... SET VAIP("E")=DGRRIEN
 ... SET VAROOT="INDATA"
 ... DO IN5^VADPT
 ... S ADTTYPE=$S(+$G(INDATA(2))=4!(+$G(INDATA(2))=5):"LODGER",+$G(INDATA(2))=3:"DISCHARGE",1:"CURRENT")
 ... DO BLD
 .K ^TMP($J,"DGRRMVTS")
 IF ROWCNT=0 D
 .SET ROWCNT=ROWCNT+1
 .DO BLD
 Q
 ;
BLD ;Build array of data elements for each movement.  Similar to elements
 ;defined for current inpatient and lodger activity.  The word 'current'
 ;removed from element names. 
 ;
 SET CNT=$G(CNT)+1,PSARRAY(CNT)="><ADTMovements Row='"_ROWCNT_"'"
 SET CNT=$G(CNT)+1,PSARRAY(CNT)="^RequestDate^"_ADTDT
 SET CNT=$G(CNT)+1,PSARRAY(CNT)="^MovementDate^"_$$CURMOVE()
 SET CNT=$G(CNT)+1,PSARRAY(CNT)="^WardLocation^"_$$WARDLOC()
 SET CNT=$G(CNT)+1,PSARRAY(CNT)="^Service^"_$$SERVICE()
 SET CNT=$G(CNT)+1,PSARRAY(CNT)="^RoomBed^"_$$ROOMBED()
 SET CNT=$G(CNT)+1,PSARRAY(CNT)="^TreatingSpecialty^"_$$TRETSPC()
 SET CNT=$G(CNT)+1,PSARRAY(CNT)="^Provider^"_$$PROVIDE()
 SET CNT=$G(CNT)+1,PSARRAY(CNT)="^AttendingPhysician^"_$$ATTPHY()
 SET CNT=$G(CNT)+1,PSARRAY(CNT)="^AdmissionDate^"_$$CURADM()
 SET CNT=$G(CNT)+1,PSARRAY(CNT)="^TransactionType^"_$$TRANSTYP()
 SET CNT=$G(CNT)+1,PSARRAY(CNT)="^MovementType^"_$$MVTTYP()
 SET CNT=$G(CNT)+1,PSARRAY(CNT)="^LodgerWardLocation^"_$$LODWLOC()
 SET CNT=$G(CNT)+1,PSARRAY(CNT)="^LodgerRoom^"_$$LODROOM()
 SET CNT=$G(CNT)+1,PSARRAY(CNT)="^DischargeDate^"_$$DISDATE()
 SET CNT=$G(CNT)+1,PSARRAY(CNT)="></ADTMovements"
 Q
CURMOVE() ;
 NEW DATA
 SET DATA=""
 IF ADTTYPE'="DISCHARGE" SET DATA=$P($G(INDATA(3)),"^",1)
 QUIT DATA
 ;
WARDLOC() ;
 NEW DATA
 SET DATA=""
 IF ADTTYPE="CURRENT" SET DATA=$P($G(INDATA(5)),"^",2)
 QUIT DATA
 ;
SERVICE() ;
 NEW DATA
 SET DATA=""
 IF ADTTYPE="CURRENT" SET DATA=$P($G(INDATA(5)),"^",1)
 IF ADTTYPE="CURRENT" SET DATA=$P($G(^DIC(42,+DATA,0)),"^",3)
 IF ADTTYPE="DISCHARGE" SET DATA=$P($G(INDATA(17,4)),"^",1)
 IF ADTTYPE="DISCHARGE" SET DATA=$P($G(^DIC(42,+DATA,0)),"^",3)
 QUIT DATA
 ;
ROOMBED() ;
 NEW DATA
 SET DATA=""
 IF ADTTYPE="CURRENT" SET DATA=$P($G(INDATA(6)),"^",2)
 QUIT DATA
 ;
TRETSPC() ;
 NEW DATA
 SET DATA=""
 IF ADTTYPE'="DISCHARGE" SET DATA=$P($G(INDATA(8)),"^",2)
 QUIT DATA
 ;
PROVIDE() ;
 NEW DATA
 SET DATA=""
 IF ADTTYPE'="DISCHARGE" SET DATA=$P($G(INDATA(7)),"^",2)
 QUIT DATA
 ;
ATTPHY() ;
 NEW DATA
 SET DATA=""
 IF ADTTYPE'="DISCHARGE" SET DATA=$P($G(INDATA(18)),"^",2)
 QUIT DATA
 ;
CURADM() ;
 NEW DATA
 SET DATA=""
 IF ADTTYPE'="DISCHARGE" SET DATA=$P($G(INDATA(13,1)),"^",1)
 QUIT DATA
 ;
TRANSTYP() ;
 NEW DATA
 SET DATA=""
 I ADTTYPE'="DISCHARGE" SET DATA=$P($G(INDATA(2)),"^",2)
 I ADTTYPE="DISCHARGE" SET DATA=$P($G(INDATA(17,2)),"^",2)
 QUIT DATA
 ;
MVTTYP() ;
 NEW DATA
 SET DATA=""
 I ADTTYPE'="DISCHARGE" SET DATA=$P($G(INDATA(4)),"^",2)
 I ADTTYPE="DISCHARGE" SET DATA=$P($G(INDATA(17,3)),"^",2)
 QUIT DATA
 ;
LASTADM() ;
 NEW DATA
 SET DATA=""
 IF ADTTYPE="DISCHARGE" SET DATA=$P($G(INDATA(13,1)),"^",1)
 QUIT DATA
 ;
LODWLOC() ;
 NEW DATA
 SET DATA=""
 IF ADTTYPE="LODGER" SET DATA=$P($G(INDATA(5)),"^",2)
 QUIT DATA
 ;
LODROOM() ;
 NEW DATA
 SET DATA=""
 IF ADTTYPE="LODGER" SET DATA=$P($G(INDATA(6)),"^",2)
 QUIT DATA
 ;
DISDATE() ;
 NEW DATA
 SET DATA=""
 IF ADTTYPE="DISCHARGE" SET DATA=$P($G(INDATA(17,1)),"^",1)
 QUIT DATA
