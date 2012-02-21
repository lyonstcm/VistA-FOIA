PSOHLEXP	;BIR/RTR-Auto expire prescriptions ; 10/10/07 11:16am
	;;7.0;OUTPATIENT PHARMACY;**10,22,36,73,148,257**;DEC 1997;Build 19
	;
	;External reference to ^PS(59.7 supported by DBIA 694
	;External reference to STATUS^ORQOR2 is supported by DBIA 3458
	;External references to LOCK1^ORX2 and UNLK1^ORX2 are supported by DBIA 867
EN	N PSOEXRX,PSOEXCOM,PSOEXSTS,SUSD,PSOEXSTA,ZZDT,ZZEDT,IFN,NODE,RF,PIFN,PSUSD,PRFDT,PDA,PSDTEST,ORN,CPRSDC
	I '$G(DT) S DT=$$DT^XLFDT
	S X1=DT,X2=-1 D C^%DTC S ZZEDT=X
	S ZZDT=$P($G(^PS(59.7,1,49.99)),"^",8) I +ZZDT=0 S X1=DT,X2=-2 D C^%DTC S ZZDT=X
	F  S ZZDT=$O(^PSRX("AG",ZZDT)) Q:ZZDT>ZZEDT  Q:ZZDT=""  D EN1
	Q
EN1	F PSOEXRX=0:0 S PSOEXRX=$O(^PSRX("AG",ZZDT,PSOEXRX)) Q:'PSOEXRX  D:$D(^PSRX(PSOEXRX,0))
	.N CPRSDC,CPRSSTA
	.S CPRSDC=",1,7,12,13,"
	.S ORN=$P($G(^PSRX(PSOEXRX,"OR1")),"^",2),CPRSSTA=""
	.I ORN S CPRSSTA=+$$STATUS^ORQOR2(ORN) I CPRSSTA=0 S ORN=""
	.Q:$P($G(^PSRX(PSOEXRX,2)),"^",6)'=ZZDT
	.K CMOP S DA=PSOEXRX I DA D ^PSOCMOPA  ;*257 ;SET UP CMOP() ARRAY
	.S DA=$O(^PS(52.5,"B",PSOEXRX,0))
	.I DA S SUSD=$P($G(^PS(52.5,DA,0)),"^",2) I SUSD,$P($G(^(0)),"^",3) S DIK="^PS(52.5," D ^DIK K DIK
	.I $D(^PS(52.4,PSOEXRX,0)) S DIK="^PS(52.4,",DA=PSOEXRX D ^DIK K DIK
	.I $G(^PSRX(PSOEXRX,"H"))]"" K:$P(^PSRX(PSOEXRX,"H"),"^") ^PSRX("AH",$P(^PSRX(PSOEXRX,"H"),"^"),PSOEXRX) S ^PSRX(PSOEXRX,"H")=""
	.S PSOEXSTA=$P($G(^PSRX(PSOEXRX,"STA")),"^")
	.I PSOEXSTA=13 D  Q
	..I 'ORN D EN^PSOHDR("PRES",PSOEXRX)
	.I PSOEXSTA=12!(PSOEXSTA=14)!(PSOEXSTA=15) I ORN,CPRSDC'[(","_CPRSSTA_",") D
	..D EN^PSOHLSN1(PSOEXRX,"OD","","","A")
	..I ORN S CPRSSTA=+$$STATUS^ORQOR2(ORN)
	.I PSOEXSTA=11 I ORN,CPRSDC'[(","_CPRSSTA_",") D
	..S $P(^PSRX(PSOEXRX,0),"^",19)=1
	..D EN^PSOHLSN1(PSOEXRX,"SC","ZE","Prescription is expired")
	.I PSOEXSTA>9&(PSOEXSTA'=16) Q
	.S $P(^PSRX(PSOEXRX,"STA"),"^")=11
	.D REVERSE^PSOBPSU1(PSOEXRX,0,"DE",5,"RX EXPIRED")
	.S (PIFN,PSUSD,PRFDT)=0 F  S PIFN=$O(^PSRX(PSOEXRX,1,PIFN)) Q:'PIFN  S PSUSD=PIFN,PRFDT=+$P($G(^PSRX(PSOEXRX,1,PIFN,0)),"^")
	.S ORN=$P($G(^PSRX(PSOEXRX,"OR1")),"^",2)
	.I $G(PSUSD) I '$P($G(^PSRX(PSOEXRX,1,PSUSD,0)),"^",18) S PSDTEST=0 D  I 'PSDTEST K ^PSRX(PSOEXRX,1,PSUSD),^PSRX("AD",PRFDT,PSOEXRX,PSUSD),^PSRX(PSOEXRX,1,"B",PRFDT,PSUSD) D NSET
	..D REVERSE^PSOBPSU1(PSOEXRX,PSUSD,"DE",5,"RX EXPIRED")
	..F PDA=0:0 S PDA=$O(^PSRX(PSOEXRX,"L",PDA)) Q:'PDA  I $P($G(^PSRX(PSOEXRX,"L",PDA,0)),"^",2)=PSUSD S PSDTEST=1
	..I $G(CMOP(CMOP("L")))="",".L.X."[("."_$G(CMOP("S"))_".") S PSDTEST=1
	..N PSOORL
	..S PSOORL=$$LOCK1^ORX2(ORN) S:'PSOORL PSDTEST=1 I PSOORL D UNLK1^ORX2(ORN)
	..N PDA0
	..;S PDAQ=0
	..F PDA=0:0 S PDA=$O(^PSRX(PSOEXRX,4,PDA)) Q:'PDA  D
	...S PDA0=$G(^PSRX(PSOEXRX,4,PDA,0))
	...I $P(PDA0,"^",3)=PSUSD S PSDTEST=1   ;*257
	..;Q:'PDAQ
	..;S PSDTEST=1
	.I 'ORN D EN^PSOHDR("PRES",PSOEXRX) Q
	.I CPRSDC[(","_CPRSSTA_",") D EN^PSOHDR("PRES",PSOEXRX) Q
	.S $P(^PSRX(PSOEXRX,0),"^",19)=1
	.S PSOEXCOM="Prescription past expiration date" D EN^PSOHLSN1(PSOEXRX,"SC","ZE",PSOEXCOM)
	S DIE=59.7,DA=1,DR="49.95///"_ZZDT D ^DIE K DIE,DA,DR
	Q
NSET	;
	N PSONM,PSONMX
	S PSONM="" F PSONMX=0:0 S PSONMX=$O(^PSRX(PSOEXRX,1,PSONMX)) Q:'PSONMX  S PSONM=PSONMX
	S ^PSRX(PSOEXRX,1,0)="^52.1DA^"_$G(PSONM)_"^"_$G(PSONM)
	Q
SETUP	;
	K %DT,DIC,DTOUT S DIC(0)="XZM",DIC="^DIC(19.2,",X="PSO EXPIRE PRESCRIPTIONS" D ^DIC
	I +Y>0 D EDIT^XUTMOPT("PSO EXPIRE PRESCRIPTIONS") K DIC,Y,X Q
	D RESCH^XUTMOPT("PSO EXPIRE PRESCRIPTIONS","","","24H","L"),EDIT^XUTMOPT("PSO EXPIRE PRESCRIPTIONS") K DIC,Y,X
OUT	Q
