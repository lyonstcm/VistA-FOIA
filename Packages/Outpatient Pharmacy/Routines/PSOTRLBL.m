PSOTRLBL ;BHAM ISC/AMC/SAB - MULTI RX REFILL REQUEST FORM ;11/16/92 15:37
 ;;7.0;OUTPATIENT PHARMACY;**19,92,107,110**;DEC 1997
 ;External reference ^PS(59.7 supported by DBIA 694
 ;External reference to ^PS(55 supported by DBIA 2228
CHK S PSDO=$O(^PS(52.5,"C",ZI,D0)),DFN=$P(^PS(52.5,D0,0),"^",3) I PSDO>0 S PSDFN=$P(^PS(52.5,PSDO,0),"^",3) Q:PSDFN=DFN
 G BUILD
CHCK2 Q:'$G(PPL)  S:'$D(PI) PI=0 Q:COPIES  G:$G(PSOLAPPL)!($G(PSDFNFLG)) CHEDI I $P(PPL,",",PI+1)'="" Q
CHEDI S $P(PSLN,"_",39)="" I $O(PSORX("PSOL",$G(PPL1))) S PPL1=$O(PSORX("PSOL",PPL1)),PPL=PSORX("PSOL",PPL1) F PI=0:1 G:$P(PPL,",",PI)="" INST S RX=$P(PPL,",",PI) D C^PSOLBL
BUILD Q:'DFN  S PS1=$G(^PS(59,PSOSITE,1)),PSOSITE7=$G(^("IB")),PSOSYS=$G(^PS(59.7,1,40.1)) I '$D(PSSPND) F PSRX=0:0 S PSRX=$O(RX(PSRX)) Q:'PSRX  K RX(PSRX)
 F PSRX=0:0 S PSRX=$O(^PS(55,DFN,"P",PSRX)) Q:'PSRX  D RZX
 G:'$O(RX(0))&($P($G(PSOPAR),"^",28)) EXIT
 S PSINF("STREET")=VAPA(1),PSINF("STREET 2")=VAPA(2),PSINF("CITY")=VAPA(4),PSINF("ZIP")=$S($G(VAPA(11))]"":$P($G(VAPA(11)),"^",2),1:$G(VAPA(6))),PSINF("STATE")=$P(VAPA(5),"^",2)
 S:VAPA(1)="" PSINF("STREET")="NO ADDRESS",(PSINF("CITY"),PSINF("STATE"),PSINF("ZIP"))="" S PSINF("NAME")=$P(^DPT(DFN,0),"^") D PID^VADPT S PSINF("SSAN")=VA("PID")
 S PSA=0,VASTREET=$P(^PS(59,PSOSITE,0),"^",2),VAADDR1=$P(^(0),"^")
 I $P(PSOSYS,"^",4),$D(^PS(59,+$P($G(PSOSYS),"^",4),0)) S PS=^PS(59,$P($G(PSOSYS),"^",4),0),VASTREET=$P(^PS(59,$P(PSOSYS,"^",4),0),"^",2),VAADDR1=$P(^PS(59,$P(PSOSYS,"^",4),0),"^")
 S COUNT=$S($G(PSOBARS)&($P(PSOPAR,"^",19)):3,1:10)
 I '$P(^PS(59,PSOSITE,1),"^",28) D DOCOLD Q
 ;NEW LABEL
DOCNEW W ?54,PSINF("NAME")_"   "_$E(PSINF("SSAN"),5,12)
 ;I $P(PSOSYS,"^",4),$D(^PS(59,+$P($G(PSOSYS),"^",4),0)) S PS=^PS(59,$P($G(PSOSYS),"^",4),0),VASTREET=$P(^PS(59,$P(PSOSYS,"^",4),0),"^",2),VAADDR1=$P(^PS(59,$P(PSOSYS,"^",4),0),"^")
 I PSINF("STREET 2")="" S PSINF("STREET 2")=PSINF("STREET"),PSINF("STREET")=""
 W !,?54,$G(VAPA(1)),!,?54,$G(ADDR(2))
 I $G(ADDR(3))="",$G(ADDR(4))="" G ADD
 I $G(ADDR(3))'="",$G(ADDR(4))="" W !,?54,$G(ADDR(3)) G ADD
 W !,?54,$G(ADDR(3)),!,?54,$G(ADDR(4))
ADD W !,?54,"Please check prescriptions to be refilled"
 F J=1:1:COUNT S PSA=$O(RX(PSA)) S:'PSA J=J-1 Q:'PSA  D SCRPTNEW
 W !,?54,"(",PSLN,")",!,?60,"PATIENT'S SIGNATURE   ",$E(DT,4,5),"/",$E(DT,6,7),"/",($E(DT,1,3)+1700)
DOCEND W @IOF I PSA,$O(RX(PSA)) G DOCNEW
INST ;
EXIT K PSINF,AMC,PSA,PSDFN,PSDO,PSDT2,PSRFL,PSRX,PSLN,PSRXX,PSSS,PSST,PSOCR,DIWL,DIWR,DIWF,PSO9 Q
SCRPTNEW W !,?54,"(___) ",$$ZZ^PSOSUTL(PSA) K ZDRUG
 ;W !,?54,"(___) ",$S($D(TN):TN,$D(^PSDRUG(+$P(^PSRX(PSA,0),"^",6),0)):$P(^(0),"^"),1:"DRUG NOT ON FILE ("_$P(^PSRX(PSA,0),"^",6)_")")
 W !,?60,$P(RX(PSA),"^",2)," " D DTCONNW W ?64,"Expires ",PSDT2,"  Rx# ",$P(^PSRX(PSA,0),"^") K TN
 I $G(PSOBARS),$P($G(PSOPAR),"^",19) S X="S",X2=PSOINST_"-"_PSA W !,?60 S X1=$X W @PSOBAR1,X2,@PSOBAR0
 Q
DTCONNW S PSDT2=$P(RX(PSA),"^"),PSDT2=$E(PSDT2,4,5)_"/"_$E(PSDT2,6,7)_"/"_($E(PSDT2,1,3)+1700) Q
 ;OLD LABEL
DOCOLD W $C(13) S $X=0 W ?38,PSINF("SSAN"),"    FEE: " I $P($G(PSOPAR),"^",17) W $P($G(^DPT(DFN,.17)),"^",2)
 W ?63,"REFILL REQUEST: PLEASE CHECK PRESCRIPTIONS TO BE REFILLED",!?38,PSINF("NAME"),?79,"YOUR SIGNATURE IS REQUIRED"
 W !?38,PSINF("STREET"),?60,"REFILLS" W:PSINF("STREET 2")]"" !?38,PSINF("STREET 2") W !?38,PSINF("CITY"),?59,"REMAINING  EXPIRES",!?38,PSINF("STATE")," ",PSINF("ZIP")
 F J=1:1:COUNT S PSA=$O(RX(PSA)) S:'PSA J=J-1 Q:'PSA  D SCRPTOLD
 W !!! W ?40,"(",PSLN,")","  PATIENT'S SIGNATURE   ",$E(DT,4,5),"/",$E(DT,6,7),"/",($E(DT,1,3)+1700)
 W @IOF I PSA,$O(RX(PSA)) G DOCOLD
 K PSINF,AMC,PSA,PSDFN,PSDO,PSDT2,PSRFL,PSRX,PSRXX,PSSS,PSST,PSLN Q
SCRPTOLD W !?56,"(____) ",$P(RX(PSA),"^",2)," " D DTCONOD W ?67,PSDT2," ",$P(^PSRX(PSA,0),"^")
 W ?85,$$ZZ^PSOSUTL(PSA) K ZDRUG
 I $G(PSOBARS),+$P($G(PSOPAR),"^",19) S X="S",X2=PSOINST_"-"_PSA W !,?80 S X1=$X W @PSOBAR1,X2,@PSOBAR0
 Q
DTCONOD S PSDT2=$P(RX(PSA),"^"),PSDT2=$E(PSDT2,4,5)_"/"_$E(PSDT2,6,7)_"/"_($E(PSDT2,1,3)+1700) Q
REFILL F AMC=0:0 S AMC=$O(^PSRX(PSRXX,1,AMC)) Q:'AMC  S PSRFL=PSRFL-1
 I PSRFL>0 S X1=DT,X2=$P(^PSRX(PSRXX,0),"^",8)-10 D C^%DTC I X'<$P(^(2),"^",6) S PSRFL=0
 Q
RZX S PSRXX=+^PS(55,DFN,"P",PSRX,0) I $D(^PSRX(PSRXX,0)) S PSRFL=$P(^(0),"^",9) D:$D(^(1))&PSRFL REFILL I PSRFL>0,$P($G(^PSRX(PSRXX,"STA")),"^")<10,134'[$E(+$P($G(^("STA")),"^")),$P(^(2),"^",6)>DT S RX(PSRXX)=$P(^(2),"^",6)_"^"_PSRFL
 Q
