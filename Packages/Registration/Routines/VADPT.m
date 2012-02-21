VADPT	;ALB/MRL/MJK,ERC - RETURN PATIENT VARIABLE ARRAYS [DRIVER] ; 8/1/08 1:29pm
	;;5.3;Registration;**193,343,389,415,489,498,688**;Aug 13, 1993;Build 29
	;DFN = Patient IFN [if not passed entire array returned as null]
	;
DEM	;Demographic Variables
	S VAN=1,VAN(1)=12,VAV="VADM" D ^VADPT0 Q
	;
OPD	;Other Patient Data
	S VAN=2,VAN(1)=7,VAV="VAPD" D ^VADPT0 Q
	;
ADD	;Current Address
	S VAN=3,VAN(1)=28,VAV="VAPA" D ^VADPT0 Q
	;
OAD	;Other Patient Variables
	S VAN=4,VAN(1)=11,VAV="VAOA" D ^VADPT0 Q
	;
INP	;Inpatient Data [pre-version 5]
	N VAINDTT S VAN=5,VAN(1)=11,VAV="VAIN",VAINDTT=$G(VAINDT) N VAINDT S:VAINDTT VAINDT=$$DATIM(VAINDTT) D ^VADPT0 Q
	;
IN5	;Inpatient Data [v5.0 and above]
	N VAINDTT S VAN=6,VAN(1)=19,VAV=$S('$D(VAIP("V")):"VAIP",VAIP("V")'?1A.E:"VAIP",1:VAIP("V")),VAINDTT=$G(VAIP("D")) S:$L(VAINDTT) VAIP("D")=VAINDTT S:VAINDTT VAIP("D")=$$DATIM(VAINDTT) D ^VADPT0 S:$L(VAINDTT) VAIP("D")=VAINDTT Q
	;
ELIG	;Eligibility Information
	S VAN=7,VAN(1)=9,VAV="VAEL" D ^VADPT0 Q
	;
MB	;Monetary Benefits
	S VAN=8,VAN(1)=9,VAV="VAMB" D ^VADPT0 Q
	;
SVC	;Service Information
	S VAN=9,VAN(1)=14,VAV="VASV" D ^VADPT0 Q
	;
REG	;Registration data
	S VAN=10,VAV="VARP" D ^VADPT0 Q
	;
SDE	;Enrollment Information
	S VAN=11,VAV="VAEN" D ^VADPT0 Q
	;
SDA	;Appointment Information
	S VAN=12,VAV="VASD" D ^VADPT0 Q
	;
PID	;Patient Id
	S VAN=13,VAV="VA" D ^VADPT0 Q
	;
TESTPAT(DFN)	   ;Test patient ?  Returns 0 (No) or 1 (Yes)
	S DFN=+$G(DFN) I 'DFN Q 0
	I $D(^DPT("ATEST",DFN)) Q 1
	N NODE S NODE=$G(^DPT(DFN,0))
	I $P(NODE,"^",21)=1 Q 1
	I $E($P(NODE,"^",9),1,5)="00000" Q 1
	Q 0
	;
V5	S X=$S($D(^DG(43,1,"VERSION")):+^("VERSION"),1:""),VADPT("V")=$S(X<5:0,1:1) K X Q
OERR	;
1	S VATAG=1 D MULT Q
2	S VATAG=2 D MULT Q
3	S VATAG=3 D MULT Q
4	S VATAG=4 D MULT Q
5	S VATAG=5 D MULT Q
6	S VATAG=6 D MULT Q
7	S VATAG=7 D MULT Q
8	S VATAG=8 D MULT Q
9	S VATAG=9 D MULT Q
10	S VATAG=10 D MULT Q
51	S VATAG=11 D MULT Q
52	S VATAG=12 D MULT Q
53	S VATAG=13 D MULT Q
ALL	S VATAG=14 D MULT Q
A5	S VATAG=15 D MULT Q
SEL	Q:$O(VARRAY(0))']""  S VATAG=0,VATAG(2)=$P($T(TAG),";;",2)
	F VATAG(1)=0:0 S VATAG=$O(VARRAY(VATAG)) Q:VATAG=""  I VATAG(2)[("^"_VATAG_"^") S VARRAY(VATAG)=1,VAROOT=$S($D(VAROOT(VATAG)):VAROOT(VATAG),1:"") D @VATAG
	G Q
	;
MULT	S VATAG=$P($T(TG+VATAG),";;",2)
	F VATAG(1)=1:1 S VATAG(2)=$P(VATAG,"^",VATAG(1)) Q:VATAG(2)=""  S VAROOT=$S($D(VAROOT(VATAG(2))):VAROOT(VATAG(2)),1:"") D @(VATAG(2))
Q	S VAROOT="" K:$D(VAROOT)'=11 VAROOT K VATAG Q
	;
KVA	K VA
KVAR	D KVAR^VADPT0 K:$D(VAIP("V")) @(VAIP("V")) K I,X,Y,VARRAY,VADM,VAPD,VADPT,VAOA,VASV,VAEL,VAMB,VARP,VAEN,VASD,VAIN,VAIP,VAPA,VAHOW,VAINDT,VAERR,^UTILITY("VADPT",$J),VA200,VATEST Q
DATIM(DATIM)	;If time not specified see if movement on that date
	Q:DATIM'?7N DATIM
	N A,B S A=$O(^DGPM("ADFN"_DFN,DATIM)),B=+$O(^(+A,0))
	I 'A Q DATIM
	I $P($G(^DGPM(+B,0)),"^",2)=3 Q DATIM  ;Next movement is discharge
	F  Q:"^4^5^7^"'[(U_$P($G(^DGPM(+B,0)),"^",2))  S A=$O(^DGPM("ADFN"_DFN,A)),B=+$O(^(+A,0)) I $E(A,1,7)'=DATIM Q
	I 'A Q DATIM
	I $E(A,1,7)'=DATIM Q DATIM
	Q A
	;
TG	;
	;;DEM^INP
	;;DEM^ELIG
	;;ELIG^INP
	;;DEM^ADD
	;;ADD^INP
	;;DEM^ELIG^ADD
	;;ELIG^SVC
	;;ELIG^SVC^MB
	;;DEM^REG^SDE^SDA
	;;SDE^SDA
	;;DEM^IN5
	;;ELIG^IN5
	;;ADD^IN5
	;;DEM^OPD^INP^ADD^ELIG^SVC^OAD^MB^REG^SDE^SDA
	;;DEM^OPD^IN5^ADD^ELIG^SVC^OAD^MB^REG^SDE^SDA
	;
TAG	;;^DEM^OPD^INP^IN5^ADD^OAD^ELIG^SVC^MB^REG^SDE^SDA^
