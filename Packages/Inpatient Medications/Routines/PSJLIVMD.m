PSJLIVMD	;BIR/MV-SETUP LM TEMPLATE FOR INPT MED. IV ; 4/28/08 3:11pm
	;;5.0; INPATIENT MEDICATIONS ;**37,50,63,58,81,91,80,116,110,111,180,134,209**;16 DEC 97;Build 1
	;
	;Reference to ^PS(55 is supported by DBIA #2191.
	;
EN	; Build LM template to display IV order.
	D GTOT^PSIVUTL(P(4))
	S:'$D(PSJSTAR) PSJSTAR="" S:'$D(PSGP) PSGP=DFN
	I $E(P("OT"))'="I" D EN^PSJLIVFD Q
	K ^TMP("PSJI",$J)
	S UL80="",$P(UL80,"=",80)=""
	S PSJLN=1
	I $G(PSIV531),P("PON")["P" S (P(2),P(3),P(4))=""
AD	;
	NEW VALMEVL S VALMEVL=1
	S PSJL="" D FLDNO^PSJLIUTL("(1)",1)
	S PSJL=PSJL_" Additives:"
	S:$G(P("PON"))["V"&(P(17)'="N") PSJL=$$SETSTR^VALM1("Order number:",PSJL,28,14)_+P("PON")
	S PSJL=$$SETSTR^VALM1("Type:",PSJL,57,6)_$$TYPE^PSJLIUTL
	NEW PSJVD S PSJVD=$$DINFLIV^PSJDIN(.DRG)
	S PSJL=$$SETSTR^VALM1(PSJVD,PSJL,75,6)
	I $D(IORVON),(PSJVD]"") D CNTRL^VALM10(1,76,5,IORVON,IORVOFF,0) K PSJVD
	D SETTMP^PSJLMPRU("PSJI",PSJL)
	D:+$G(PSJLMX) CLRDSPL
	;PSJLMX count number of lines needed to display the add/sol
	S PSJLMX=0 D WRTDRG^PSJLIUTL("AD")
SOL	;
	S PSJL="" D FLDNO^PSJLIUTL("(2)",1)
	S PSJL=PSJL_" Solutions:"
	I P("SYRS")]"" D
	. S PSJL=$$SETSTR^VALM1("Syr. Size:",PSJL,52,11)_$E(P("SYRS"),1,13)
	. S:$L(P("SYRS"))>13 PSJL=PSJL_"..."
	D SETTMP^PSJLMPRU("PSJI",PSJL)
	D WRTDRG^PSJLIUTL("SOL")
	D DUR
START	;
	NEW PSGRSD,PSGRSDN,PSGRFD,PSGRFDN
	I $G(P("OT"))="I",$G(P(4))]"" D
	.Q:$G(ON)["V"  I $G(PSIVAC)="" N PSIVAC S PSIVAC="CF"
	.Q:$G(P(3))
	.D ENT^PSIVCAL,ENSTOP^PSIVCAL
	D REQDT(ON)
	D FLDNO^PSJLIUTL("(4)",47)
	S PSJL=$$SETSTR^VALM1("Start:",PSJL,56,7)_$$STARTDT^PSJLIUTL
	D SETTMP^PSJLMPRU("PSJI",PSJL)
INFRATE	;
	S PSJL="" D FLDNO^PSJLIUTL("(3)",1)
	S PSJL=$$SETSTR^VALM1("Infusion Rate:",PSJL,7,15)
	D LONG^PSJLIUTL(P(8),22,23)
RSTART	;
	I $G(ON)["P" N PSGNDT S PSGRNDT=$$LASTREN^PSJLMPRI(DFN,ON) D
	. I PSGRNDT S PSGRNDT=$$ENDTC^PSGMI(+PSGRNDT),PSJL=$$SETSTR^VALM1("Renewed: "_PSGRNDT,PSJL,54,32) Q
	. Q:'$G(PSGRDTX)  N PSJRQB,PSJRQL,RSDLABL,PSGRSD,PSGRSDN
	. S RSDLABL="     REQUESTED START: ",PSJRQB=41,PSJRQL=39,PSGRSD="",PSGRSDN=""
	. I $G(PSGRDTX(+$G(PSJORD),"PSGRSD")),$G(P(2)) S PSJRQB=51,PSJRQL=29 D
	.. S PSGRSD=PSGRDTX(+$G(PSJORD),"PSGRSD"),PSGRSDN=$$ENDTC^PSGMI(+PSGRSD),RSDLABL="Calc Start: "
	. I '$G(P(2)),'$P(PSGRDTX,U,3) S PSGRSD=+PSGRDTX,PSGRSDN=$$ENDTC^PSGMI(PSGRSD)
	. I $G(PSGRSD),($G(PSGRSDN)]"") D DSPLYDT(PSJLMX+5,.PSGRSD,.PSGRSDN,RSDLABL,1,PSJRQB,PSJRQL)  ;,SETTMP^PSJLMPRU("PSJI",PSJL)
	I $G(ON)["V" N PSGRNDT S PSGRNDT=$$LASTREN^PSJLMPRI(DFN,ON) I PSGRNDT S PSGRNDT=$$ENDTC^PSGMI(+PSGRNDT),PSJL=$$SETSTR^VALM1("Renewed: "_PSGRNDT,PSJL,54,32)
	I PSJL]"" D SETTMP^PSJLMPRU("PSJI",PSJL)
	;
MR	;
	S PSJL="" D FLDNO^PSJLIUTL("(5)",1)
	S PSJL=$$SETSTR^VALM1("Med Route:",PSJL,11,11)
	S PSJL=PSJL_$P(P("MR"),U,2)
STOP	;
	S:'$D(PSGP) PSGP=DFN
	D FLDNO^PSJLIUTL("(6)",47)
	;PSJ*5*180 - If CPRS sends invalid duration/limit - Cannot Calculate Stop Date.
	S PSJL=$$SETSTR^VALM1("Stop:",PSJL,57,6)_$S($G(PSJBADD)=1:"CANNOT CALCULATE",1:$$STOPDT^PSJLIUTL)
	D SETTMP^PSJLMPRU("PSJI",PSJL)
	S PSJL=""
	N PSJBCMA S PSJBCMA=$$BCMALG^PSJUTL2(PSGP,PSJORD)
	I $G(PSJBCMA)]"",$G(DFN) S PSJL=$$SETSTR^VALM1(PSJBCMA,PSJL,1,52)
	I $G(PSJORD)["P",$G(PSGRDTX(+$G(PSJORD),"PSGRFD")),$G(P(3)) S PSGRFDN=$$ENDTC^PSGMI(PSGRDTX(+PSJORD,"PSGRFD")) D
	. D DSPLYDT(PSJLMX+7,.PSGRFD,.PSGRFDN," Calc Stop: ",1,51,29)
	I ($G(PSJBCMA)]"")!($G(PSGRDTX(+$G(PSJORD),"PSGRFD"))&$G(P(3))) D SETTMP^PSJLMPRU("PSJI",PSJL)
SCH	;
	S PSJL="" D FLDNO^PSJLIUTL("(7)",1)
	S PSJL=$$SETSTR^VALM1("Schedule:",PSJL,12,11)
	D LONG^PSJLIUTL(P(9)_$S(P(7):"@0 labels a day",1:"")_$G(SCHMSG),22,31)
LASTFL	;
	S PSJL=$$SETSTR^VALM1("Last Fill:",PSJL,52,11)
	S PSJL=PSJL_$$ENDTC^PSGMI(P("LF"))
	D SETTMP^PSJLMPRU("PSJI",PSJL)
ADM	;
	S PSJL="" D FLDNO^PSJLIUTL("(8)",1)
	S PSJL=$$SETSTR^VALM1("Admin Times:",PSJL,9,14)
	NEW NOECH
	D LONG^PSJLIUTL(P(11),22,29)
QTY	;
	S PSJL=$$SETSTR^VALM1("Quantity:",PSJL,53,10)_+P("LFA")
	D SETTMP^PSJLMPRU("PSJI",PSJL)
PROVIDER	;
	S PSJL="" D FLDNO^PSJLIUTL("(9)",1)
	S PSJL=$$SETSTR^VALM1("Provider:",PSJL,12,10)_$$PROVIDER^PSJLIUTL
CUMDOSES	;
	S PSJL=$$SETSTR^VALM1("Cum. Doses:",PSJL,51,12)_P("CUM")
	D SETTMP^PSJLMPRU("PSJI",PSJL)
OI	;
	S PSJL="" D FLDNO^PSJLIUTL("(10)",1)
	S PSJL=$$SETSTR^VALM1("Orderable Item:",PSJL,6,16)_$P(P("PD"),U,2)_$$OINF^PSJDIN(+P("PD"))
	D SETTMP^PSJLMPRU("PSJI",PSJL)
INS	;
	S PSJL=""
	S PSJL=$$SETSTR^VALM1("Instructions:",PSJL,8,14)
	D LONG^PSJLIUTL(P("INS"),22,58)
	D SETTMP^PSJLMPRU("PSJI",PSJL)
OPI	;
	S PSJL="" D FLDNO^PSJLIUTL("(11)",1)
	S PSJL=$$SETSTR^VALM1("Other Print"_$S($P(P("OPI"),"^",2)=1:"!: ",1:": "),PSJL,9,13)_$P(P("OPI"),"^")
	D SETTMP^PSJLMPRU("PSJI",PSJL)
PC	;
	S PSJL=""
	S PSJL=$$SETSTR^VALM1("Provider Comments:",PSJL,3,18) D WTPC^PSJLIUTL
REMARK	;
	D SETTMP^PSJLMPRU("PSJI","")
	S PSJL="" D FLDNO^PSJLIUTL("(12)",1)
	S PSJL=$$SETSTR^VALM1("Remarks :",PSJL,8,10)
	D LONG^PSJLIUTL(P("REM"),18,62)
	D SETTMP^PSJLMPRU("PSJI",PSJL)
IVROOM	;
	S PSJL=""
	S PSJL=$$SETSTR^VALM1("IV Room:",PSJL,9,9)_$P(P("IVRM"),U,2)
	D SETTMP^PSJLMPRU("PSJI",PSJL)
ENTRY	;
	S PSJL="",PSJL=$$SETSTR^VALM1("Entry By:",PSJL,8,10)
	S PSJL=PSJL_$S($P(P("CLRK"),U,2)]"":$E($P(P("CLRK"),U,2),1,24),1:"*** Undefined")
	S PSJL=$$SETSTR^VALM1("Entry Date:",PSJL,51,12)_$$ENDTC^PSGMI(P("LOG"))
	D SETTMP^PSJLMPRU("PSJI",PSJL)
	S PSJL="" S PSGLRN=$$LASTRNBY^PSJLMPRI(DFN,$S($G(PSJORD):PSJORD,1:$G(ON))) I PSGLRN D
	. S PSJL=$$SETSTR^VALM1("Renewed By: ",PSJL,6,12)_$$ENNPN^PSGMI(PSGLRN) D SETTMP^PSJLMPRU("PSJI",PSJL) K PSGLRN
	S VALM("TITLE")=$$CODES^PSIVUTL(P(17),$S($G(ON)["P":53.1,1:55.01),$S($G(ON)["P":28,1:100))_" IV "
	I $G(P("PRY"))="D"!($G(P("PON"))["P") S VALM("TITLE")=VALM("TITLE")_$S($G(P("PRY"))="":"",1:"("_$$CODES^PSIVUTL(P("PRY"),53.1,.24)_")")
	I $G(P("PON"))["P" D ORDCHK^PSJLIVFD
	S VALMCNT=PSJLN-1,^TMP("PSJI",$J,0)=VALMCNT
	Q
DSPLYDT(PSJLN,PSGRDT,PSGRDTN,TXT,PSJFSH,PSJRDBEG,PSJRDLEN)	 ;
	;LINE   : Line number the Requested Start and Stop dates are display in
	;PSGRDT : Either it is the requested start or stop date in FM format
	;PSGRDTN: Either it is the requested start or stop date in IPM format
	;TXT    : The display text
	;PSJFSH     : if it is 1 then flash
	;
	S:'$G(PSJRDBEG) PSJRDBEG=41,PSJRDLEN=39
	S PSJL=$$SETSTR^VALM1(TXT_PSGRDTN,PSJL,PSJRDBEG,PSJRDLEN)
	Q
CLRDSPL	;
	;Clear the blinking after edit the pending order.
	;Without it more than the requested start and stop dates are blinking at the ac/edit screen
	;PSJLMX: # ad/sol counted in WRTDRG^PSJLIUTL
	Q:'$D(IOBOFF)
	NEW PSJX
	F PSJX=5:1:PSJLMX+7 D CNTRL^VALM10(PSJX,36,80,IOBOFF,IOINORM)
	Q
REQDT(ORDER)	      ;Get requested date if it is a pending order
	;ORDER  : Pending Order Number (PSJORD or PSGORD)
	Q:ORDER'["P"  D REQDT^PSJLIUTL(ORDER)
	Q
	;
GETDUR(PAT,ORD,PKG,RAW)	;
	; PAT= Patient DFN
	; ORD= Order #
	; PKG= 5(UD), "IV"(IV), "P"(Pending)
	N ACT,DUR,ND,ND25,F25,ND0,ND2,OLDORD S DUR="",ORD=+ORD K IVLIMIT
	S:PKG="V" PKG="IV"
	I PKG="P" S ND=$G(^PS(53.1,+ORD,0)) D  I '$G(OLDORD) Q DUR
	. I $G(P("OVRIDE")) S DUR="" Q
	. D PENDING(ORD) Q:DUR]""
	. S ND0=$G(^PS(53.1,ORD,0)) I $P(ND0,U,24)="E" S OLDORD=$P(ND0,U,25) I OLDORD S PKG=$S(OLDORD["V":"IV",OLDORD["U":5,OLDORD["P":"P",1:"")
	. Q:($G(OLDORD)'["P")
	. D PENDING(OLDORD) S OLDORD=""
	I PKG="IV" S ND2=$G(^PS(55,PAT,PKG,ORD,2)) I $P(ND2,U,8)="E" S OLDORD=$P(ND2,U,5) S:OLDORD'["V" OLDORD="" I OLDORD D
	.N ACTND S ACTND=0 F  S ACTND=$O(^PS(55,PAT,"IV",ORD,"A",ACTND)) Q:'ACTND  D
	..I $G(^PS(55,PAT,"IV",ORD,"A",ACTND,0))["IV LIMIT OVERRIDDEN" S OLDORD=""
	I $G(P("LIMIT"))]"" S DUR=P("LIMIT"),IVLIMIT=1 I '$G(RAW) S DUR=$$FMTDUR(DUR) Q DUR
	I PKG=5 S ND0=$G(^PS(55,PAT,PKG,ORD,0)) I $P(ND0,U,24)="E" S OLDORD=$P(ND0,U,25) S:OLDORD'["U" OLDORD=""
	S F25="^PS(55,PAT,PKG,ORD,2.5)" I '$G(OLDORD) Q:'$D(@(F25)) DUR
	S ND25=$G(@(F25)) S DUR=$P(ND25,U,2) I DUR="" S DUR=$P(ND25,U,4) I DUR]"" S IVLIMIT=1
	;PSJ*5*209 stop forcing null duration to previous.
	;I DUR="",$G(OLDORD) S ORD=+OLDORD Q:'$D(@(F25)) DUR  D
	;. S ND25=$G(@(F25)) S DUR=$P(ND25,U,2) I DUR="" S DUR=$P(ND25,U,4) I DUR]"" S IVLIMIT=1
	I '$G(RAW),DUR]"" S DUR=$$FMTDUR(DUR)
	Q DUR
	;
PENDING(PNDON)	;
	S ND=$G(^PS(53.1,+ORD,0))
	I ND S ND25=$S(($P(ND,U,15)=PAT):$G(^PS(53.1,+ORD,2.5)),1:"")
	S DUR=$P(ND25,U,4) I DUR]"" D  Q
	.S:($E(DUR)="s")!($E(DUR)="m")!($E(DUR)="l")!($E(DUR)="d")!($E(DUR)="h")!($E(DUR)="a") IVLIMIT=1 S DUR=$S($G(RAW):DUR,1:$$FMTDUR(DUR))
	S DUR=$P(ND25,U,2) I DUR]"" S DUR=$S($G(RAW):DUR,1:$$FMTDUR(DUR))
	Q
	;
FMTDUR(DURCODE)	;
	N DUNIT,DNUM,BAD S BAD=0
	;PSJ*5*180 - Add PSJBADD variable
	K PSJBADD S PSJBADD=0
	S DUNIT=$E(DURCODE),DNUM=$P(DURCODE,DUNIT,2) I 'DNUM S BAD=1
	I DUNIT'="",DUNIT'?1(1U,1L) S PSJBADD=1
	S DUNIT=$S(DUNIT="D"!(DUNIT="d"):" day",DUNIT="H"!(DUNIT="h"):" hour",DUNIT="W":" week",DUNIT="L":" month",DUNIT="M":" minute",DUNIT="S":" second",DUNIT="m":" ml",DUNIT="l":" liter",DUNIT="a":" dose",1:"")
	S:DUNIT="" BAD=1 I (DNUM'=1),(DUNIT'["ml") S DUNIT=DUNIT_"s"
	I PSJBADD=1 S PSGACT=$TR($G(PSGACT),"F")
	Q $S(PSJBADD=1:"*INVALID DURATION/LIMIT*",BAD:"",1:DNUM_DUNIT)
	;
DURMIN(DCOD)	;
	N DUR,DMIN,CHR S DUR="" F I=1:1:$L(DCOD) S CHR=$E(DCOD,I) I CHR?1N S DUR=DUR_CHR
	S DMIN=DUR*$S(DCOD["L":43200,DCOD["W":10080,DCOD["M":1,DCOD["S":(1/60),DCOD["D":1440,1:0) S DMIN=+$FN(DMIN,"",1)
	Q DMIN
	;
DUR	;
	N DUROUT,LABEL,IVLIMIT
	Q:'$G(PSJORD)  S PSJL=""
	S DUROUT=$$GETDUR^PSJLIVMD(PSGP,+PSJORD,$S(PSJORD["P":"P",1:"IV"))
	S LABEL=$S($G(IVLIMIT):"IV Limit: ",1:"Duration: ") K IVLIMIT
	S PSJL=$$SETSTR^VALM1(LABEL,PSJL,12,10)
	S PSJL=PSJL_DUROUT
	Q
