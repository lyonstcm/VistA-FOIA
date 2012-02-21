YSCLTST4	;DALOI/LB/RLM-TRANSMIT RX AND lAB DATA FOR CLOZAPINE ;19 Feb 93
	;;5.01;MENTAL HEALTH;**92**;Dec 30, 1994;Build 7
	; Reference to ^LAB(60 supported by IA #333
	; Reference to ^LR7OR1 supported by IA #2503
	; 
CL1	;(DFN,DAYS) ;
	K ^TMP($J,"PSO"),RESULTS,YSCLYWBC,YSCLRANC,YSCLXWBC
	Q:'DFN
	S:'$G(DAYS) DAYS=90
	S YSCLFRQ=$O(^YSCL(603.01,"C",DFN,"")) I YSCLFRQ]""  S YSCLFRQ=$P(^YSCL(603.01,YSCLFRQ,0),"^",3)
	I $G(^YSCL(603.03,1,1))=1  Q "-1^0^0^0^0^0^"_YSCLFRQ
	S X1=DT,X2="-"_DAYS D C^%DTC S YSCLSD=X
	S YSCLA=0 F  S YSCLA=$O(^YSCL(603.04,1,1,YSCLA)) Q:'YSCLA  S YSCLTLS=^YSCL(603.04,1,1,YSCLA,0),YSCLTLS($P(YSCLTLS,"^",2),$P(YSCLTLS,"^",1))=$P(YSCLTLS,"^",3)
	S YSCLTL="" F  S YSCLTL=$O(^YSCL(603.04,1,1,"B",YSCLTL)) Q:'YSCLTL  D
	 . D RR^LR7OR1(DFN,,YSCLSD,DT,,YSCLTL,"L")
	 . S YSCLSB1="" F  S YSCLSB1=$O(^TMP("LRRR",$J,DFN,YSCLSB1)) Q:YSCLSB1=""  D
	 . . S YSCLTDT="" F  S YSCLTDT=$O(^TMP("LRRR",$J,DFN,YSCLSB1,YSCLTDT)) Q:YSCLTDT=""  I $P(YSCLTDT,".",2)]"" D
	 . . . S YSCLTA="" F  S YSCLTA=$O(^TMP("LRRR",$J,DFN,YSCLSB1,YSCLTDT,YSCLTA)) Q:YSCLTA=""  I YSCLTA D
	 . . . . S RESULTS1=^TMP("LRRR",$J,DFN,YSCLSB1,YSCLTDT,YSCLTA)
	 . . . . S RESULTS(YSCLTL,YSCLTDT)=$P(RESULTS1,"^",2)
	;Find all entries for WBC and sort by inverse date.
	S YSCLA="" F  S YSCLA=$O(YSCLTLS("W",YSCLA)) Q:'YSCLA  S YSCLXWBC(YSCLA)="" D
	 . S YSCLA1="" F  S YSCLA1=$O(RESULTS(YSCLA,YSCLA1)) Q:'YSCLA1  S YSCLYWBC(YSCLA1)=RESULTS(YSCLA,YSCLA1)*$S(YSCLTLS("W",YSCLA):1000,1:1)
	S YSCLRWBC=0 F  S YSCLRWBC=$O(YSCLYWBC(YSCLRWBC)) Q:YSCLRWBC=""  S YSCLRWBC(YSCLRWBC)=YSCLYWBC(YSCLRWBC) D
	. ;Match all ANC's and WBC's
	. S YSCLMTCH=0 F YSCLA="A","N","S","C" S YSCLTPT="" F  S YSCLTPT=$O(YSCLTLS(YSCLA,YSCLTPT)) Q:'YSCLTPT  D
	. . I $D(RESULTS(YSCLTPT,YSCLRWBC)),YSCLA="A",$D(YSCLRWBC(YSCLRWBC)) S ^TMP($J,"PSO",YSCLRWBC)=YSCLRWBC(YSCLRWBC)_"^"_(RESULTS(YSCLTPT,YSCLRWBC)*$S(YSCLTLS(YSCLA,YSCLTPT):1000,1:1)) Q
	. . I $D(RESULTS(YSCLTPT,YSCLRWBC)),YSCLA="N",$D(YSCLRWBC(YSCLRWBC)) S ^TMP($J,"PSO",YSCLRWBC)=YSCLRWBC(YSCLRWBC)_"^"_(YSCLRWBC(YSCLRWBC)*((RESULTS(YSCLTPT,YSCLRWBC)*.01))) Q
	. . I $D(RESULTS(YSCLTPT,YSCLRWBC)),YSCLA="S",$D(YSCLRWBC(YSCLRWBC)) D
	. . . S (YSCLSG1,YSCLSGS)="" F  S YSCLSGS=$O(YSCLTLS("B",YSCLSGS)) D  Q:'YSCLSGS
	. . . . I 'YSCLSG1,'YSCLSGS S YSCLSGS="Z",YSCLSG1=1
	. . . . I 'YSCLSGS,YSCLSG1 Q
	. . . . I '$D(RESULTS(YSCLSGS,YSCLRWBC)) S RESULTS(YSCLSGS,YSCLRWBC)=0
	. . . . S ^TMP($J,"PSO",YSCLRWBC)=YSCLRWBC(YSCLRWBC)_"^"_(YSCLRWBC(YSCLRWBC)*((RESULTS(YSCLTPT,YSCLRWBC)*.01)+(RESULTS(YSCLSGS,YSCLRWBC)*.01))) Q
	. . I $D(RESULTS(YSCLTPT,YSCLRWBC)),YSCLA="C" D
	. . . S YSCLSGS="" F  S YSCLSGS=$O(YSCLTLS("T",YSCLSGS)) D  Q:'YSCLSGS
	. . . . I '$G(YSCLSG1),'YSCLSGS S YSCLSGS="Z",YSCLSG1=1
	. . . . I 'YSCLSGS,$G(YSCLSG1) Q
	. . . . I '$D(RESULTS(YSCLSGS,YSCLRWBC)) S RESULTS(YSCLSGS,YSCLRWBC)=0
	. . . . S ^TMP($J,"PSO",YSCLRWBC)=YSCLRWBC(YSCLRWBC)_"^"_((RESULTS(YSCLTPT,YSCLRWBC)*$S(YSCLTLS(YSCLA,YSCLTPT):1000,1:1))+(RESULTS(YSCLSGS,YSCLRWBC))) Q
	K FDA,YSCLSGS,Y15,YSCLRWBC,YSCLANC,YSCLYWBC,YSCLFRQ,ZIENS,RESULTS,RESULTS1,YSCLA,YSCLA1,YSCLMTCH,YSCLSB1,YSCLSD
	K YSCLTA,YSCLTDT,YSCLTL,YSCLTLS,YSCLTPT,YSCLXWBC,YSCLMULT
	Q
	;
KILL	;
	K FDA,YSCLSGS,Y15,RESULTS,RESULTS1,YSCLA,YSCLA1,YSCLMTCH,YSCLSB1,YSCLSD,YSCLTA,YSCLMULT
	K YSCLTDT,YSCLTL,YSCLSG1,YSCLTLS,YSCLTPT,YSCLXWBC
	;
ZEOR	;YSCLTST4
