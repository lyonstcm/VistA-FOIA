GMRCONS1 ;ALB/MRY - Consult/Scheduling link report ;4/10/06  14:21
 ;;3.0;CONSULT/REQUEST TRACKING;**52**;DEC 27, 1997
EN ;
 K GMRNOSRV D SERV Q:$D(GMRNOSRV)
 D EN^VALM("GMRC SD PENDING CONSULTS")
 Q
SERV I $D(IOTM),$D(IOBM),$D(IOSTBM) D FULL^VALM1
 K GMRRS,STAT,DIC,TOT,TOTAL
 S TOTAL=0,DIC=123.5,DIC(0)="QAEMZ",DIC("A")="Select Service/Specialty: ",D="B^D" D MIX^DIC1 K DIC S:Y=-1 GMRNOSRV="" Q:Y=-1
 K ST,STAT S SRVNM=Y(0,0),RS=+Y,ST="",ORD=0 F  S ORD=$O(^ORD(100.01,ORD)) Q:'+ORD  S STAT(ORD)=$P(^ORD(100.01,ORD,0),U)
SD S %DT="EAT",%DT("A")="Enter Starting Date: " D ^%DT S:Y=-1 GMRNOSRV="" Q:Y=-1  S PSD=Y,SD=Y-.01
 S %DT="EAT",%DT("A")="Enter  Ending  Date: " D ^%DT S:Y=-1 GMRNOSRV="" Q:Y=-1  S ED=Y_.24
 I ED<SD W !!,$C(7),"Ending Date Can Not Be Before Starting Date.",! G SD
 Q
START D WAIT^DICD K ^TMP($J),^TMP("GMRCR",$J) S GMRRS("RS",RS)="",CS=RS D SERVICE
 S GRP=0 F  S GRP=$O(^GMR(123.5,RS,10,GRP)) Q:'+GRP  S CS=$P(^GMR(123.5,RS,10,GRP,0),U) I $P(^GMR(123.5,CS,0),U,2)'=9 S GMRRS("RS",CS)="" D SERVICE
 K ST F I="COMPLETE","DISCONTINUED","PENDING","ACTIVE","SCHEDULED","PARTIAL RESULTS","DISCONTINUED/EDIT","CANCELLED" S TOT(I)=0
 S SDI=SD F  S SDI=$O(^GMR(123,"E",SDI)) Q:'+SDI!(SDI>ED)  S GIEN=0 F  S GIEN=$O(^GMR(123,"E",SDI,GIEN)) Q:'+GIEN  S ND=^GMR(123,GIEN,0),SERV=$P(ND,U,5),STATUS=$P(ND,U,12) I SERV'="",$D(GMRRS("RS",SERV)),$D(STAT(STATUS)) D
 .S LSTACT=$P($G(^GMR(123.1,$P(ND,U,13),0)),U),PTIEN=$P(ND,U,2),ATDPT=$G(^DPT(PTIEN,0)),PTNM=$P(ATDPT,U),L4=$E($P(ATDPT,U,9),6,9),SRVCON=$P($G(^DPT(PTIEN,.3)),U,2),SRVCON=$S(SRVCON="":"",1:SRVCON_"%")
 .S AWAS1=$S($D(^SC("AWAS1",GIEN)):"LINKED",1:"NOT LINKED"),AHST1=$S($D(^SC("AHST1",GIEN)):"HAS HISTORY",1:"NO HISTORY"),STATS=$P(STAT(STATUS),U)
 .S ^TMP($J,"S",STATS,SDI,GIEN)=PTNM_U_PTIEN_U_LSTACT_U_AWAS1_U_AHST1_U_SERV_U_STATS_U_SDI_U_L4_U_SRVCON
 .S:$D(TOT(STATS)) TOT(STATS)=TOT(STATS)+1 S:'$D(TOT(STATS)) TOT(STATS)=1 S TOTAL=TOTAL+1
 D ^GMRCONS2
EXIT2 K A,ACT,AD,AHST1,ATDPT,AW,AWAS1,B,CHKOT,CLNC,CMMT,CS,CSS,ED,EN,EN2,GIEN,GMRND,GRP,GXHEC,H2,HEC,HECA,HEX,I,L4,LC,LGTH,LGTH1,LSTACT,ND,ORD,ORDATE,P3,P8,P9,PTIEN,PTNM,RS,S,SC,SCDT,SCLNC,SD,SDI,SDWL,SDWLND,SERV
 K SIEN,ST,STAT,STATUS,STOPCD,STPCOD,SUM,SUM2,TEXT,TND,TOT,TOTALTX,TYPE
 K BB,C,CLNCNM,D,GMRRS,SRV,SRVNM,STATS,SUBTOT,TOTAL,TX
 K PD,PSD
 K ASP8,ASP9,CMHD,CNSDT,CNSLT,CNSLTND,DIC,P4,POP,PRTCNDT,SRVCON,STCD,X,Y
 Q
SERVICE ;
 S STPCLNC="",SC=0 F  S SC=$O(^GMR(123.5,CS,688,SC)) Q:'+SC  S STPCOD=$P(^GMR(123.5,CS,688,SC,0),U) I STPCOD'="" S STPCLNC=$P(^DIC(40.7,STPCOD,0),U)_","_STPCLNC
 S SC=0 F  S SC=$O(^GMR(123.5,CS,688,SC)) Q:'+SC  S STPCOD=$P(^GMR(123.5,CS,688,SC,0),U) I STPCOD'="" D
 .S STPCOD=$P(^DIC(40.7,STPCOD,0),U,2) S:$D(^TMP($J,"SC",STPCOD)) ^TMP($J,"SC",STPCOD)=STPCLNC_^TMP($J,"SC",STPCOD) S:'$D(^TMP($J,"SC",STPCOD)) ^TMP($J,"SC",STPCOD)=STPCLNC
 Q
CLINIC ;
 S CLNC=$P(^GMR(123.5,A,0),U) W @IOF,CLNC," (",A,")",!
 Q
ACTIVE I '$D(^SC("AHST1",CS)) D ASP D  Q
 .I ASP9 S ^TMP($J,"A","ACTWOLHWL")=^TMP($J,"A","ACTWOLHWL")+1,^TMP($J,"A","ACTWOLHWL",SRV,AD,CS)=TND,WL="" D KILNODE Q
 .I ASP8 S ^TMP($J,"A","ACTWOLHWL")=^TMP($J,"A","ACTWOLHWL")+1,^TMP($J,"A","ACTWOLHWL",SRV,AD,CS)=TND,WL="" D KILNODE Q
 .I '$D(WL) D
 ..I $P($G(^GMR(123,CS,12)),U,5)="P" D
 ...S ^TMP($J,"A","ACTWOLHIFC")=^TMP($J,"A","ACTWOLHIFC")+1,^TMP($J,"A","ACTWOLHIFC",SRV,AD,CS)=TND
 ..E  D
 ...S ^TMP($J,"A","ACTWOLHNWL",SRV,AD,CS)=TND,^TMP($J,"A","ACTWOLHNWL")=^TMP($J,"A","ACTWOLHNWL")+1
 ..D KILNODE Q
 I LSTACT="EDIT/RESUBMITTED"!(LSTACT="ADDED COMMENT")!(LSTACT="STATUS CHANGE") K FND S EN2=$O(^GMR(123,CS,40,":"),-1),EN=":" F  S EN=$O(^GMR(123,CS,40,EN),-1) Q:'+EN!($D(FND))  D EDITRSB
 Q
SCHEDULE I '$D(^SC("AHST1",CS)) D ASP D  Q
 .I ASP9 S ^TMP($J,"A","SCHWOLHWL")=^TMP($J,"A","SCHWOLHWL")+1,^TMP($J,"A","SCHWOLHWL",SRV,AD,CS)=TND,WL="" D KILNODE Q
 .I ASP8 S ^TMP($J,"A","SCHWOLHWL")=^TMP($J,"A","SCHWOLHWL")+1,^TMP($J,"A","SCHWOLHWL",SRV,AD,CS)=TND,WL="" D KILNODE Q
 .I '$D(WL) D
 ..I $P($G(^GMR(123,CS,12)),U,5)="P" D
 ...S ^TMP($J,"A","SCHWOLHIFC")=^TMP($J,"A","SCHWOLHIFC")+1,^TMP($J,"A","SCHWOLHIFC",SRV,AD,CS)=TND
 ..E  D
 ...S ^TMP($J,"A","SCHWOLHNWL",SRV,AD,CS)=TND,^TMP($J,"A","SCHWOLHNWL")=^TMP($J,"A","SCHWOLHNWL")+1
 ..D KILNODE Q
 I $D(^SC("AWAS1",CS)) S AW="AWAS1" K FND S SCLNC=$O(^SC(AW,CS,":"),-1),SCDT=$O(^SC(AW,CS,SCLNC,":"),-1),SIEN=$O(^SC(AW,CS,SCLNC,SCDT,":"),-1),CSS=$P($G(^SC(SCLNC,"S",SCDT,1,SIEN,"CONS")),U) D  Q
 .I CSS=CS S CHKOT=$P($G(^SC(SCLNC,"S",SCDT,1,SIEN,"C")),U,3) D
 ..I CHKOT'="" S ^TMP($J,"A","SCHWALCO")=^TMP($J,"A","SCHWALCO")+1,^TMP($J,"A","SCHWALCO",SRV,AD,CS)=TND D KILNODE Q
 ..I CHKOT="" S ^TMP($J,"A","SCHWALNCO")=^TMP($J,"A","SCHWALNCO")+1,^TMP($J,"A","SCHWALNCO",SRV,AD,CS)=TND D KILNODE Q
 I $D(^SC("AHST1",CS))&('$D(^SC("AWAS1",CS))) S ^TMP($J,"A","SCHWHNAL")=^TMP($J,"A","SCHWHNAL")+1,^TMP($J,"A","SCHWHNAL",SRV,AD,CS)=TND D KILNODE
 Q
PENDING D ASP D
 .I ASP9 S ^TMP($J,"A","PENWL")=^TMP($J,"A","PENWL")+1,^TMP($J,"A","PENWL",SRV,AD,CS)=TND,WL="" D KILNODE Q
 .I ASP8 S ^TMP($J,"A","PENWL")=^TMP($J,"A","PENWL")+1,^TMP($J,"A","PENWL",SRV,AD,CS)=TND,WL="" D KILNODE Q
 I '$D(WL) S ^TMP($J,"A","PENNWL")=^TMP($J,"A","PENNWL")+1,^TMP($J,"A","PENNWL",SRV,AD,CS)=TND D KILNODE
 Q
ASP ;
 S ASP9=0,ASP8=0,STAT="",SDWL=0 F  S SDWL=$O(^SDWL(409.3,"B",PTIEN,SDWL)) Q:'+SDWL  S SDWLND=$G(^SDWL(409.3,SDWL,0)),STAT=$P(SDWLND,U,17),ORDATE=$P(SDWLND,U,2) D  Q:$D(WL)
 .S P9=$P(SDWLND,U,9),P8=$P(SDWLND,U,8)
 .I P9'="" S CLNC=$P(^SDWL(409.32,P9,0),U) I CLNC'="" S STCD=$P(^SC(CLNC,0),U,7) I STCD'="" S STOPCD=$P(^DIC(40.7,STCD,0),U,2),CLNC2=$P(^DIC(40.7,STCD,0),U) D:$D(^TMP($J,"SC",STOPCD))  Q
 ..I STAT="O"&(ORDATE=$P(AD,".")!(ORDATE>AD))&(STPCLNC[CLNC2) S ASP9=1 Q
 .I P8'="" S CLNC=$P(^SDWL(409.31,P8,0),U) I CLNC'="" S STOPCD=$P(^DIC(40.7,CLNC,0),U,2),CLNC2=$P(^DIC(40.7,CLNC,0),U) I STOPCD'="" D:$D(^TMP($J,"SC",STOPCD))  Q
 ..I STAT="O"&(ORDATE=$P(AD,".")!(ORDATE>AD))&(STPCLNC[CLNC2) S ASP8=1 Q
 Q
INCMPLTE S ^TMP($J,"A","INCMPLTE")=^TMP($J,"A","INCMPLTE")+1,^TMP($J,"A","INCMPLTE",SRV,AD,CS)=TND
 Q
CANCELED S ^TMP($J,"A","CANCELED")=^TMP($J,"A","CANCELED")+1,^TMP($J,"A","CANCELED",SRV,AD,CS)=TND
 Q
DSCNTUED S ^TMP($J,"A","DSCNTUED")=^TMP($J,"A","DSCNTUED")+1,^TMP($J,"A","DSCNTUED",SRV,AD,CS)=TND
 Q
COMPLETE S ^TMP($J,"A","COMPLETE")=^TMP($J,"A","COMPLETE")+1,^TMP($J,"A","COMPLETE",SRV,AD,CS)=TND
 Q
CLOSE S ^TMP($J,"A","CLOSE")=^TMP($J,"A","CLOSE")+1,^TMP($J,"A","CLOSE",SRV,AD,CS)=TND
 Q
TOC S ^TMP($J,"A","TOC")=^TMP($J,"A","TOC")+1,^TMP($J,"A","TOC",SRV,AD,CS)=TND
 Q
TCC S ^TMP($J,"A","TCC")=^TMP($J,"A","TCC")+1,^TMP($J,"A","TCC",SRV,AD,CS)=TND
 Q
EDITRSB S GMRND=^GMR(123,CS,40,EN,0),ACT=$P(GMRND,U,2),ACT=$P(^GMR(123.1,ACT,0),U)
 S:(ACT'="EDIT/RESUBMITTED")!(ACT'="STATUS CHANGE") EN2=EN I (ACT="EDIT/RESUBMITTED")!(ACT="STATUS CHANGE") D
 .S CMMT=$G(^GMR(123,CS,40,EN2,1,1,0))
ACTERNS .I CMMT["was a no-show" S ^TMP($J,"A","ACTERNS")=^TMP($J,"A","ACTERNS")+1,^TMP($J,"A","ACTERNS",SRV,AD,CS)=TND,FND="" D KILNODE Q
ACTERCP .I CMMT["was cancelled by the Patient" S ^TMP($J,"A","ACTERCP")=^TMP($J,"A","ACTERCP")+1,^TMP($J,"A","ACTERCP",SRV,AD,CS)=TND,FND="" D KILNODE Q
ACTERCC .I CMMT["was cancelled by the Clinic"!(CMMT["was cancelled, whole clinic") S ^TMP($J,"A","ACTERCC")=^TMP($J,"A","ACTERCC")+1,^TMP($J,"A","ACTERCC",SRV,AD,CS)=TND,FND="" D KILNODE Q
ACTERAP .I CMMT["was cancelled for" S ^TMP($J,"A","ACTERAP")=^TMP($J,"A","ACTERAP")+1,^TMP($J,"A","ACTERAP",SRV,AD,CS)=TND,FND="" D KILNODE Q
ACTEROW .S ^TMP($J,"A","ACTEROW")=^TMP($J,"A","ACTEROW")+1,^TMP($J,"A","ACTEROW",SRV,AD,CS)=TND,FND="" D KILNODE Q
 Q
KILNODE K ^TMP($J,"S",ST,AD,CS)
 Q
CHKLIN I ($Y>(IOSL-4)) S HLD="" D PROMPT Q:HLD[U  X CMHD S PG=PG+1
 Q
IOSL Q:($Y>(IOSL-3))
PROMPT I IOST["C-" R !!,"Press enter to continue or '^' to exit. ",HLD:DTIME S PROMPT="" I HLD[" " S HLD=U
 Q
