BARUFRP3 ; IHS/SD/TPF - UFMS REPORTS SECONDARY CALLS ;
 ;;1.8;IHS ACCOUNTS RECEIVABLE;**6,13,20**;OCT 26, 2005
 Q
GRNTOT ;EP;
 K PAGE
 D NOW^%DTC S Y=% X ^DD("DD") S DATE=Y
 S Y=START X ^DD("DD") S EXSTART=Y
 S Y=END X ^DD("DD") S EXEND=Y
 S ESC=0
 S RPTTYP="G"
 D BATHDR^BARUFRPT(DATE,RPTTYP)
 S:END'[(".") END=END_".999999"
 D SUMINIT^BARUFRPT
 W !,"TRANSMISSIONS:"
 S BATCH=START-.000001
 F  S BATCH=$O(^BARSESS(DUZ(2),"F",BATCH)) Q:'BATCH!(ESC)!(BATCH>END)  D
 .W !?2,$$TDT^BARDUTL(BATCH)
 .S UDUZ=""
 .F  S UDUZ=$O(^BARSESS(DUZ(2),"F",BATCH,UDUZ)) Q:'UDUZ!(ESC)  D
 ..S SESSID=""
 ..F  S SESSID=$O(^BARSESS(DUZ(2),"F",BATCH,UDUZ,SESSID)) Q:'SESSID!(ESC)  D
 ...S TRDATE=0
 ...F  S TRDATE=$O(^BARSESS(DUZ(2),UDUZ,11,SESSID,2,TRDATE)) Q:'TRDATE!(ESC)  D
 .... ;IHS/SD/PKD 11/30/10 1.8*20 HEAT P/U TRX ONLY IF IN EXPORT DATE RANGE
 .... N TRQUIT S TRQUIT=^BARSESS(DUZ(2),UDUZ,11,SESSID,2,TRDATE,0)
 .... Q:$P(TRQUIT,U,2)'=1  ; Not Transmitted
 .... S TRQUIT=$P(TRQUIT,U,4)  ; Date this TRX went to UFMS
 .... Q:TRQUIT<(START-.000001)!(TRQUIT>END)
 .... ; END 1.8*20
 ....S IENS=TRDATE_","
 ....D GETDATA
 ....Q:'BILL
 ....I $Y>(IOSL-4) W ! D:$D(IO("S")) BATHDR^BARUFRPT(DATE,RPTTYP) Q:$D(IO("S"))  K DIR S DIR(0)="E" D:'$D(ZTQUEUED)&(IO=IO(0)) ^DIR S ESC=X=U Q:ESC  D BATHDR^BARUFRPT(DATE,RPTTYP)
 ....D COUNT^BARUFRPT(.TOTALS)
 S TRDATE=0
 F  S TRDATE=$O(^BARSESS(DUZ(2),"DS",TRDATE)) Q:'TRDATE!(ESC)!(TRDATE>END)  D
 .S SESSID=""
 .F  S SESSID=$O(^BARSESS(DUZ(2),"DS",TRDATE,SESSID)) Q:'SESSID!(ESC)  D
 ..S UDUZ=""
 ..F  S UDUZ=$O(^BARSESS(DUZ(2),"DS",TRDATE,SESSID,UDUZ)) Q:'UDUZ!(ESC)  D
 ...I $P($G(^BARSESS(DUZ(2),UDUZ,11,SESSID,2,TRDATE,0)),U,8)="" Q
 ...I '$D(BARFLST($P($G(^BARSESS(DUZ(2),UDUZ,11,SESSID,2,TRDATE,0)),U,8))) Q
 ...S IENS=TRDATE_","
 ...D GETDATA
 ...Q:'BILL
 ...I $Y>(IOSL-4) W ! D:$D(IO("S")) BATHDR^BARUFRPT(DATE,RPTTYP) Q:$D(IO("S"))  K DIR S DIR(0)="E" D:'$D(ZTQUEUED)&(IO=IO(0)) ^DIR S ESC=X=U Q:ESC  D BATHDR^BARUFRPT(DATE,RPTTYP)
 ...D COUNT^BARUFRPT(.TOTALS)
 W !,DASH,!,?10,"SESSION TOTALS",?30,"DS TOTALS",?46,"NS TOTALS",?63,"TRANS. TOTALS",!,DASH
 D LIST^BARUFRPT(.TOTALS)
 I $D(IO("S")) W @IOF  ;flush buffer
 Q
 ;
GETDATA ;
 S CREDIT=$$GET1^DIQ(90050.03,IENS,2)
 S DEBIT=$$GET1^DIQ(90050.03,IENS,3)
 S (CREDDEBT,AMT)=$$GET1^DIQ(90050.03,IENS,3.5,"E")
 S BILL=$$GET1^DIQ(90050.03,IENS,4)
 Q:'BILL
 S BLLIEN=$$GET1^DIQ(90050.03,IENS,4,"I")
 S ENTRYBY=$$GET1^DIQ(90050.03,IENS,13,"E")
 S TPBIEN=$$GET1^DIQ(90050.01,BLLIEN_",",17,"I")
 S TRANTYP=$$GET1^DIQ(90050.03,IENS,101,"E")
 S ADJCAT=$$GET1^DIQ(90050.03,IENS,102,"E")
 S BARIIEN=$$INSIEN^BARUTL("BILL",BLLIEN,DUZ(2))
 I BARIIEN'="" D
 .S BARALLC=$$GET1^DIQ(9999999.18,BARIIEN,.21,"I")
 .S BARALLC=$P($T(@BARALLC^BARRNEGB),";;",2)
 ;I BARALLC="" S BARALLC="OTHER"  ;default, just in case
 I $G(BARALLC)="" S BARALLC="OTHER"  ;default, just in case ;IHS/SD/TPF BAR*1.8*13 4/21/2009
 Q
SETVAR ;EP;
 S (ADJACNT,ADJAAMT,REFACNT,REFAAMT)=0
 S (BARAPCNT,BARAPAMT)=0
 S (BARRCCNT,BARRCAMT)=0
 S (BARNPCNT,BARNPAMT,BARTPCNT,BARTPAMT)=0
 S (REFTCNT,REFTAMT,REFNCNT,REFNAMT)=0
 S (ADJTCNT,ADJTAMT,ADJNCNT,ADJNAMT)=0
 S (BARCACNT,BARCAAMT,BARCNCNT,BARCNAMT,BARCTCNT,BARCTAMT)=0
 S (BARDPCNT,BARDPAMT,BARDACNT,BARDAAMT,BARDRCNT,BARDRAMT,BARDCCNT,BARDCAMT)=0
 S (BARZPCNT,BARZPAMT,BARZDCNT,BARZDAMT,BARZNCNT,BARZNAMT)=0
 S (BARZACNT,BARZAAMT,BARZDCNT,BARZDAMT,BARZNAMT)=0
 Q
TOT ;EP;
 I $P($G(^BARSESS(DUZ(2),UDUZ,11,SESSID,2,TRDATE,0)),U,8)="" D
 .S TOTALS(CAT,BARALLC,"ALL")=$G(TOTALS(CAT,BARALLC,"ALL"))+AMT
 .S TOTALS(CAT,BARALLC,"ALL","CNT")=$G(TOTALS(CAT,BARALLC,"ALL","CNT"))+1
 I CAT="AAZERO" D
 .S TOTALS(CAT,BARALLC,"ZP")=$G(TOTALS(CAT,BARALLC,"ZP"))+AMT
 .S TOTALS(CAT,BARALLC,"ZP","CNT")=$G(TOTALS(CAT,BARALLC,"ZP","CNT"))+1
 I CAT="ADJZERO" D
 .S TOTALS(CAT,BARALLC,"ZA")=$G(TOTALS(CAT,BARALLC,"ZA"))+AMT
 .S TOTALS(CAT,BARALLC,"ZA","CNT")=$G(TOTALS(CAT,BARALLC,"ZA","CNT"))+1
 I $P($G(^BARSESS(DUZ(2),UDUZ,11,SESSID,2,TRDATE,0)),U,8)'="" D
 .S TOTALS(CAT,BARALLC,"DS","CNT")=$G(TOTALS(CAT,BARALLC,"DS","CNT"))+1
 .S TOTALS(CAT,BARALLC,"DS")=$G(TOTALS(CAT,BARALLC,"DS"))+AMT
 I $P($G(^BARSESS(DUZ(2),UDUZ,11,SESSID,2,TRDATE,0)),U,6)=1!(TRANTYP="REMARK CODE") D
 .S TOTALS(CAT,BARALLC,"NS","CNT")=$G(TOTALS(CAT,BARALLC,"NS","CNT"))+1
 .S TOTALS(CAT,BARALLC,"NS")=$G(TOTALS(CAT,BARALLC,"NS"))+AMT
 I $P($G(^BARSESS(DUZ(2),UDUZ,11,SESSID,2,TRDATE,0)),U,6)'=1,((TRANTYP'="REMARK CODE")!(CAT'="ZERO")) D
 .S TOTALS(CAT,BARALLC,"TR","CNT")=$G(TOTALS(CAT,BARALLC,"TR","CNT"))+1
 .S TOTALS(CAT,BARALLC,"TR")=$G(TOTALS(CAT,BARALLC,"TR"))+AMT
 Q
WRITEDET ;EP;
 W !?2,$S(BARALLC["PRIVATE":"PVT",BARALLC["MEDICARE":"MCR",BARALLC["MEDICAID":"MCD",1:"OTH")
 W ?7,$J(TOTALS(CATEGORY,BARALLC,"ALL","CNT"),6)
 W ?14,"$"_$J(TOTALS(CATEGORY,BARALLC,"ALL"),10,2)
 W ?27,$J(TOTALS(CATEGORY,BARALLC,"DS","CNT"),4)
 W ?32,"$"_$J(TOTALS(CATEGORY,BARALLC,"DS"),8,2)
 W ?43,$J($S(CATEGORY="AAZERO":BARZPCNT,CATEGORY="ADJZERO":BARZACNT,1:TOTALS(CATEGORY,BARALLC,"NS","CNT")),4)
 W ?48,"$"_$J($S(CATEGORY="AAZERO":BARZPAMT,CATEGORY="ADJZERO":BARZAAMT,1:TOTALS(CATEGORY,BARALLC,"NS")),8,2)
 W ?59,$J(TOTALS(CATEGORY,BARALLC,"TR","CNT"),6)
 W ?66,"$"_$J(TOTALS(CATEGORY,BARALLC,"TR"),10,2)
 Q
WRITETOT ;EP;
 W !,?7,"------------------"
 W ?27,"--------------"
 W ?43,"--------------"
 W ?59,"------------------"
 W !?2,"TOTAL"
 I $P(CATEGORY," ")="AAA" D
 .W ?7,$J(BARAPCNT,6)
 .W ?14,"$"_$J(BARAPAMT,10,2)
 .W ?27,$J(BARDPCNT,4)
 .W ?32,"$"_$J(BARDPAMT,8,2)
 .W ?43,$J(BARNPCNT,4)
 .W ?48,"$"_$J(BARNPAMT,8,2)
 .W ?59,$J(BARTPCNT,6)
 .W ?66,"$"_$J(BARTPAMT,10,2)
 ;
 I CATEGORY="AAZERO" D
 .W ?7,$J(BARZPCNT,6)
 .W ?14,"$"_$J(BARZPAMT,10,2)
 .W ?27,$J(BARZDCNT,4)
 .W ?32,"$"_$J(BARZDAMT,8,2)
 .W ?43,$J(BARZNCNT,4)
 .W ?48,"$"_$J(BARZNAMT,8,2)
 .W ?59,$J(BARZPCNT,6)
 .W ?66,"$"_$J(BARZPAMT,10,2)
 ;
 I CATEGORY="ADJZERO" D
 .W ?7,$J(BARZACNT,6)
 .W ?14,"$"_$J(BARZAAMT,10,2)
 .W ?27,$J(BARZDCNT,4)
 .W ?32,"$"_$J(BARZDAMT,8,2)
 .W ?43,$J(BARZNCNT,4)
 .W ?48,"$"_$J(BARZNAMT,8,2)
 .W ?59,$J(BARZACNT,6)
 .W ?66,"$"_$J(BARZAAMT,10,2)
 ;
 I $P(CATEGORY," ")="ADJ" D
 .W ?7,$J(ADJACNT,6)
 .W ?14,"$"_$J(ADJAAMT,10,2)
 .W ?27,$J(BARDACNT,4)
 .W ?32,"$"_$J(BARDAAMT,8,2)
 .W ?43,$J(ADJNCNT,4)
 .W ?48,"$"_$J(ADJNAMT,8,2)
 .W ?59,$J(ADJTCNT,6)
 .W ?66,"$"_$J(ADJTAMT,10,2)
 ;
 I $P(CATEGORY," ")="ZZZ" D
 .W ?7,$J(REFACNT,6)
 .W ?14,"$"_$J(REFAAMT,10,2)
 .W ?27,$J(BARDRCNT,4)
 .W ?32,"$"_$J(BARDRAMT,8,2)
 .W ?43,$J(REFNCNT,4)
 .W ?48,"$"_$J(REFNAMT,8,2)
 .W ?59,$J(REFTCNT,6)
 .W ?66,"$"_$J(REFTAMT,10,2)
 ;
 I $P(CATEGORY," ")="RRR" D
 .W ?7,$J(BARRCCNT,6)
 .W ?14,"$"_$J(BARRCAMT,10,2)
 .W ?27,$J(BARDCCNT,4)
 .W ?32,"$"_$J(BARDCAMT,8,2)
 .W ?43,$J(BARCNCNT,4)
 .W ?48,"$"_$J(BARCNAMT,8,2)
 .W ?59,$J(BARCTCNT,6)
 .W ?66,"$"_$J(BARCTAMT,10,2)
 Q