DGRPTX20 ; ;07/14/09
 D DE G BEGIN
DE S DIE="^DPT(",DIC=DIE,DP=2,DL=1,DIEL=0,DU="" K DG,DE,DB Q:$O(^DPT(DA,""))=""
 I $D(^(.3)) S %Z=^(.3) S %=$P(%Z,U,1) S:%]"" DE(8)=% S %=$P(%Z,U,2) S:%]"" DE(10)=%
 I $D(^(.321)) S %Z=^(.321) S %=$P(%Z,U,2) S:%]"" DE(4)=% S %=$P(%Z,U,3) S:%]"" DE(5)=%
 I $D(^(.322)) S %Z=^(.322) S %=$P(%Z,U,13) S:%]"" DE(6)=%
 I $D(^(.36)) S %Z=^(.36) S %=$P(%Z,U,2) S:%]"" DE(7)=%
 I $D(^(.53)) S %Z=^(.53) S %=$P(%Z,U,3) S:%]"" DE(1)=% S %=$P(%Z,U,4) S:%]"" DE(2)=%
 K %Z Q
 ;
W W !?DL+DL-2,DLB_": "
 Q
O D W W Y W:$X>45 !?9
 I $L(Y)>19,'DV,DV'["I",(DV["F"!(DV["K")) G RW^DIR2
 W:Y]"" "// " I 'DV,DV["I",$D(DE(DQ))#2 S X="" W "  (No Editing)" Q
TR R X:DTIME E  S (DTOUT,X)=U W $C(7)
 Q
A K DQ(DQ) S DQ=DQ+1
B G @DQ
RE G PR:$D(DE(DQ)) D W,TR
N I X="" G NKEY:$D(^DD("KEY","F",DP,DIFLD)),A:DV'["R",X:'DV,X:D'>0,A
RD G QS:X?."?" I X["^" D D G ^DIE17
 I X="@" D D G Z^DIE2
 I X=" ",DV["d",DV'["P",$D(^DISV(DUZ,"DIE",DLB)) S X=^(DLB) I DV'["D",DV'["S" W "  "_X
T G M^DIE17:DV,^DIE3:DV["V",P:DV'["S" X:$D(^DD(DP,DIFLD,12.1)) ^(12.1) I X?.ANP D SET I 'DDER X:$D(DIC("S")) DIC("S") I  W:'$D(DB(DQ)) "  "_% G V
 K DDER G X
P I DV["P" S DIC=U_DU,DIC(0)=$E("EN",$D(DB(DQ))+1)_"M"_$E("L",DV'["'") S:DIC(0)["L" DLAYGO=+$P(DV,"P",2) G:DV["*" AST^DIED D NOSCR^DIED S X=+Y,DIC=DIE G X:X<0
 G V:DV'["N" D D I $L($P(X,"."))>24 K X G Z
 I $P(DQ(DQ),U,5)'["$",X?.1"-".N.1".".N,$P(DQ(DQ),U,5,99)["+X'=X" S X=+X
V D @("X"_DQ) K YS
Z K DIC("S"),DLAYGO I $D(X),X'=U D:$G(DE(DW,"INDEX")) SAVEVALS G:'$$KEYCHK UNIQFERR^DIE17 S DG(DW)=X S:DV["d" ^DISV(DUZ,"DIE",DLB)=X G A
X W:'$D(ZTQUEUED) $C(7),"??" I $D(DB(DQ)) G Z^DIE17
 S X="?BAD"
QS S DZ=X D D,QQ^DIEQ G B
D S D=DIFLD,DQ(DQ)=DLB_U_DV_U_DU_U_DW_U_$P($T(@("X"_DQ))," ",2,99) Q
Y I '$D(DE(DQ)) D O G RD:"@"'[X,A:DV'["R"&(X="@"),X:X="@" S X=Y G N
PR S DG=DV,Y=DE(DQ),X=DU I $D(DQ(DQ,2)) X DQ(DQ,2) G RP
R I DG["P",@("$D(^"_X_"0))") S X=+$P(^(0),U,2) G RP:'$D(^(Y,0)) S Y=$P(^(0),U),X=$P(^DD(X,.01,0),U,3),DG=$P(^(0),U,2) G R
 I DG["V",+Y,$P(Y,";",2)["(",$D(@(U_$P(Y,";",2)_"0)")) S X=+$P(^(0),U,2) G RP:'$D(^(+Y,0)) S Y=$P(^(0),U) I $D(^DD(+X,.01,0)) S DG=$P(^(0),U,2),X=$P(^(0),U,3) G R
 X:DG["D" ^DD("DD") I DG["S" S %=$P($P(";"_X,";"_Y_":",2),";") S:%]"" Y=%
RP D O I X="" S X=DE(DQ) G A:'DV,A:DC<2,N^DIE17
I I DV'["I",DV'["#" G RD
 D E^DIE0 G RD:$D(X),PR
 Q
SET N DIR S DIR(0)="SV"_$E("o",$D(DB(DQ)))_U_DU,DIR("V")=1
 I $D(DB(DQ)),'$D(DIQUIET) N DIQUIET S DIQUIET=1
 D ^DIR I 'DDER S %=Y(0),X=Y
 Q
SAVEVALS S @DIEZTMP@("V",DP,DIIENS,DIFLD,"O")=$G(DE(DQ)) S:$D(^("F"))[0 ^("F")=$G(DE(DQ))
 I $D(DE(DW,"4/")) S @DIEZTMP@("V",DP,DIIENS,DIFLD,"4/")=""
 E  K @DIEZTMP@("V",DP,DIIENS,DIFLD,"4/")
 Q
NKEY W:'$D(ZTQUEUED) "??  Required key field" S X="?BAD" G QS
KEYCHK() Q:$G(DE(DW,"KEY"))="" 1 Q @DE(DW,"KEY")
BEGIN S DNM="DGRPTX20",DQ=1
1 S DW=".53;3",DV="S",DU="",DLB="CURRENT PURPLE HEART REMARKS",DIFLD=.533
 S DE(DW)="C1^DGRPTX20"
 S DU="1:UNACCEPTABLE DOCUMENTATION;2:NO DOCUMENTATION REC'D;3:ENTERED IN ERROR;4:UNSUPPORTED PURPLE HEART;5:VAMC;6:UNDELIVERABLE MAIL;"
 S X="VAMC"
 S Y=X
 S X=Y,DB(DQ)=1 G:X="" N^DIE17:DV,A I $D(DE(DQ)),DV["I"!(DV["#") D E^DIE0 G A:'$D(X)
 G RD
C1 G C1S:$D(DE(1))[0 K DB
 S X=DE(1),DIC=DIE
 D EVENT^IVMPLOG(DA)
C1S S X="" G:DG(DQ)=X C1F1 K DB
 S X=DG(DQ),DIC=DIE
 D EVENT^IVMPLOG(DA)
C1F1 Q
X1 Q
2 D:$D(DG)>9 F^DIE17,DE S DQ=2,DW=".53;4",DV="P4'",DU="",DLB="PH DIVISION",DIFLD=.535
 S DU="DIC(4,"
 S X=$$DIV^DGRPLE()
 S Y=X
 S X=Y,DB(DQ)=1 G:X="" N^DIE17:DV,A I $D(DE(DQ)),DV["I"!(DV["#") D E^DIE0 G A:'$D(X)
 G RD
X2 Q
3 S DQ=4 ;@53
4 S DW=".321;2",DV="RSX",DU="",DLB="AGENT ORANGE EXPOS. INDICATED?",DIFLD=.32102
 S DE(DW)="C4^DGRPTX20"
 S DU="Y:YES;N:NO;U:UNKNOWN;"
 G RE
C4 G C4S:$D(DE(4))[0 K DB
 S X=DE(4),DIC=DIE
 ;
 S X=DE(4),DIC=DIE
 ;
 S X=DE(4),DIC=DIE
 ;
 S X=DE(4),DIC=DIE
 D AUTOUPD^DGENA2(DA)
 S X=DE(4),DIC=DIE
 ;
C4S S X="" G:DG(DQ)=X C4F1 K DB
 S X=DG(DQ),DIC=DIE
 K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(0)=X S Y(1)=$C(59)_$P($G(^DD(2,.32102,0)),U,3) S X=$P($P(Y(1),$C(59)_Y(0)_":",2),$C(59))="NO" I X S X=DIV S Y(1)=$S($D(^DPT(D0,.321)):^(.321),1:"") S X=$P(Y(1),U,7),X=X S DIU=X K Y S X="" X ^DD(2,.32102,1,1,1.4)
 S X=DG(DQ),DIC=DIE
 X ^DD(2,.32102,1,2,1.3) I X S X=DIV S Y(1)=$S($D(^DPT(D0,.321)):^(.321),1:"") S X=$P(Y(1),U,10),X=X S DIU=X K Y S X="" S DIH=$G(^DPT(DIV(0),.321)),DIV=X S $P(^(.321),U,10)=DIV,DIH=2,DIG=.3211 D ^DICR
 S X=DG(DQ),DIC=DIE
 K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(0)=X S Y(1)=$C(59)_$P($G(^DD(2,.32102,0)),U,3) S X=$P($P(Y(1),$C(59)_Y(0)_":",2),$C(59))="NO" I X S X=DIV S Y(1)=$S($D(^DPT(D0,.321)):^(.321),1:"") S X=$P(Y(1),U,9),X=X S DIU=X K Y S X="" X ^DD(2,.32102,1,3,1.4)
 S X=DG(DQ),DIC=DIE
 D AUTOUPD^DGENA2(DA)
 S X=DG(DQ),DIC=DIE
 X ^DD(2,.32102,1,5,1.3) I X S X=DIV S Y(1)=$S($D(^DPT(D0,.321)):^(.321),1:"") S X=$P(Y(1),U,13),X=X S DIU=X K Y S X="" S DIH=$G(^DPT(DIV(0),.321)),DIV=X S $P(^(.321),U,13)=DIV,DIH=2,DIG=.3213 D ^DICR
C4F1 Q
X4 S DFN=DA D SV^DGLOCK
 Q
 ;
5 D:$D(DG)>9 F^DIE17,DE S DQ=5,DW=".321;3",DV="RSX",DU="",DLB="RADIATION EXPOSURE INDICATED?",DIFLD=.32103
 S DE(DW)="C5^DGRPTX20"
 S DU="Y:YES;N:NO;U:UNKNOWN;"
 G RE
C5 G C5S:$D(DE(5))[0 K DB
 S X=DE(5),DIC=DIE
 ;
 S X=DE(5),DIC=DIE
 ;
 S X=DE(5),DIC=DIE
 D AUTOUPD^DGENA2(DA)
C5S S X="" G:DG(DQ)=X C5F1 K DB
 S X=DG(DQ),DIC=DIE
 X ^DD(2,.32103,1,1,1.3) I X S X=DIV S Y(2)=";"_$S($D(^DD(2,.3212,0)):$P(^(0),U,3),1:""),Y(1)=$S($D(^DPT(D0,.321)):^(.321),1:"") S X=$P($P(Y(2),";"_$P(Y(1),U,12)_":",2),";",1) S DIU=X K Y S X=DIV S X="" X ^DD(2,.32103,1,1,1.4)
 S X=DG(DQ),DIC=DIE
 X ^DD(2,.32103,1,2,1.3) I X S X=DIV S Y(1)=$S($D(^DPT(D0,.321)):^(.321),1:"") S X=$P(Y(1),U,11) S DIU=X K Y S X=DIV S X="" X ^DD(2,.32103,1,2,1.4)
 S X=DG(DQ),DIC=DIE
 D AUTOUPD^DGENA2(DA)
C5F1 Q
X5 S DFN=DA D SV^DGLOCK
 Q
 ;
6 D:$D(DG)>9 F^DIE17,DE S DQ=6,DW=".322;13",DV="RSX",DU="",DLB="SOUTHWEST ASIA CONDITIONS?",DIFLD=.322013
 S DE(DW)="C6^DGRPTX20"
 S DU="Y:YES;N:NO;U:UNKNOWN;"
 G RE
C6 G C6S:$D(DE(6))[0 K DB
 S X=DE(6),DIC=DIE
 K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(1)=$S($D(^DPT(D0,.322)):^(.322),1:"") S X=$P(Y(1),U,14),X=X S DIU=X K Y S X="" S DIH=$G(^DPT(DIV(0),.322)),DIV=X S $P(^(.322),U,14)=DIV,DIH=2,DIG=.322014 D ^DICR
 S X=DE(6),DIC=DIE
 K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(1)=$S($D(^DPT(D0,.322)):^(.322),1:"") S X=$P(Y(1),U,15),X=X S DIU=X K Y S X="" S DIH=$G(^DPT(DIV(0),.322)),DIV=X S $P(^(.322),U,15)=DIV,DIH=2,DIG=.322015 D ^DICR
 S X=DE(6),DIC=DIE
 D AUTOUPD^DGENA2(DA)
C6S S X="" G:DG(DQ)=X C6F1 K DB
 S X=DG(DQ),DIC=DIE
 X ^DD(2,.322013,1,1,1.3) I X S X=DIV S Y(1)=$S($D(^DPT(D0,.322)):^(.322),1:"") S X=$P(Y(1),U,14),X=X S DIU=X K Y S X="" S DIH=$G(^DPT(DIV(0),.322)),DIV=X S $P(^(.322),U,14)=DIV,DIH=2,DIG=.322014 D ^DICR
 S X=DG(DQ),DIC=DIE
 X ^DD(2,.322013,1,2,1.3) I X S X=DIV S Y(1)=$S($D(^DPT(D0,.322)):^(.322),1:"") S X=$P(Y(1),U,15),X=X S DIU=X K Y S X="" S DIH=$G(^DPT(DIV(0),.322)),DIV=X S $P(^(.322),U,15)=DIV,DIH=2,DIG=.322015 D ^DICR
 S X=DG(DQ),DIC=DIE
 D AUTOUPD^DGENA2(DA)
C6F1 Q
X6 S DFN=DA D SV^DGLOCK
 Q
 ;
7 D:$D(DG)>9 F^DIE17,DE S DQ=7,DW=".36;2",DV="RSX",DU="",DLB="DISABILITY RET. FROM MILITARY?",DIFLD=.362
 S DE(DW)="C7^DGRPTX20"
 S DU="0:NO;1:YES, RECEIVING MILITARY RETIREMENT;2:YES, RECEIVING MILITARY RETIREMENT IN LIEU OF VA COMPENSATION;3:UNKNOWN;"
 G RE
C7 G C7S:$D(DE(7))[0 K DB
 S X=DE(7),DIC=DIE
 ;
 S X=DE(7),DIC=DIE
 D AUTOUPD^DGENA2(DA)
C7S S X="" G:DG(DQ)=X C7F1 K DB
 S X=DG(DQ),DIC=DIE
 X "S DFN=DA D EN^DGMTR K DGREQF"
 S X=DG(DQ),DIC=DIE
 D AUTOUPD^DGENA2(DA)
C7F1 Q
X7 S DFN=DA D SV^DGLOCK
 Q
 ;
8 D:$D(DG)>9 F^DIE17,DE S DQ=8,DW=".3;1",DV="RSXa",DU="",DLB="SERVICE CONNECTED?",DIFLD=.301
 S DE(DW)="C8^DGRPTX20"
 S DU="Y:YES;N:NO;"
 G RE
C8 G C8S:$D(DE(8))[0 K DB
 D ^DGRPTX21
C8S S X="" G:DG(DQ)=X C8F1 K DB
 D ^DGRPTX22
C8F1 Q
X8 S DFN=DA D EV^DGLOCK I $D(X),X="Y" D VET^DGLOCK
 Q
 ;
9 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=9 D X9 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X9 S:X'="Y" Y="@50"
 Q
10 D:$D(DG)>9 F^DIE17,DE S DQ=10,DW=".3;2",DV="NJ3,0Xa",DU="",DLB="SERVICE CONNECTED PERCENTAGE",DIFLD=.302
 S DE(DW)="C10^DGRPTX20"
 G RE
C10 G C10S:$D(DE(10))[0 K DB
 D ^DGRPTX23
C10S S X="" G:DG(DQ)=X C10F1 K DB
 D ^DGRPTX24
C10F1 Q
X10 S DFN=DA D EV^DGLOCK Q:'$D(X)  K:+X'=X!(X>100)!(X<0)!(X?.E1"."1N.N) X I $D(X),$D(^DPT(DA,.3)),$P(^(.3),U,1)'="Y" W !?4,*7,"Only applies to service-connected applicants." K X
 Q
 ;
11 S DQ=12 ;@50
12 D:$D(DG)>9 F^DIE17 G ^DGRPTX25
