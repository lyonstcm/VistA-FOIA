ABPARPTH ;STANDARD REPORT HEADER; [ 02/06/91  12:13 PM ]
 ;;1.4;AO PVT-INS TRACKING;*0*;IHS-OKC/KJR;JULY 25, 1991
 ;
 ;PREREQUISITES: 1) ABPA("HD") ARRAY MUST BE DEFINED IN RANGE 1..N
 ;               2) DUZ(2) MUST BE DEFINED
 ;               3) ABPAPG MUST BE DEFINED AS PAGE COUNTER
 ;
START S X=0,SITENAME=$P(^DIC(4,DUZ(2),0),"^",1)
NXTX F I=0:0 D  Q:+X=0
 .S X=$O(ABPA("HD",X)) Q:+X=0  S AU("MAX")=X
MOVE F I=AU("MAX"):-1:1 S ABPA("HD",I+2)=ABPA("HD",I)
WRITE S ABPA("HD",1)=SITENAME,$P(AU("LINE"),"-",$L(SITENAME)+1)=""
 S ABPA("HD",2)=AU("LINE"),AU("MAX")=AU("MAX")+2,$P(XX,"*",+IOM)=""
 D NOW^%DTC S Y=% X ^DD("DD") S RUNTM=$P(Y,"@",2)
 S RUNDT=+%I(1)_"/"_+%I(2)_"/"_+$E(+%I(3),2,3)_" AT "_RUNTM
 S ABPAPG=ABPAPG+1 S PG="PAGE: "_ABPAPG W @IOF
 W "RUN DATE: ",RUNDT I $D(ZTSK)=1 D
 .S X="(Task #"_ZTSK_")"
 .W ?((+IOM/2)-($L(X)/2)),X
 W ?((+IOM-1)-($L(PG))),PG,!,XX
 F I=1:1:AU("MAX") D  W:I=AU("MAX") !,XX
 .W !,"*",?(+IOM/2)-(($L(ABPA("HD",I))/2)),ABPA("HD",I),?(+IOM-2),"*"
 W ! K X,Y,I,AU("MAX"),SITENAME,XX,AU("LINE"),RUNDT,RUNTM,PG
 F I=3:1 Q:$D(ABPA("HD",I))=0  D  K ABPA("HD",I)
 .S ABPA("HD",(I-2))=ABPA("HD",I)
QUIT Q