DGPTX11 ; ;09/19/10
 D DE G BEGIN
DE S DIE="^DPT(",DIC=DIE,DP=2,DL=2,DIEL=0,DU="" K DG,DE,DB Q:$O(^DPT(DA,""))=""
 I $D(^(0)) S %Z=^(0) S %=$P(%Z,U,5) S:%]"" DE(3)=%
 I $D(^(.321)) S %Z=^(.321) S %=$P(%Z,U,1) S:%]"" DE(10)=% S %=$P(%Z,U,2) S:%]"" DE(11)=% S %=$P(%Z,U,3) S:%]"" DE(14)=% S %=$P(%Z,U,12) S:%]"" DE(16)=% S %=$P(%Z,U,13) S:%]"" DE(13)=%
 I $D(^(.52)) S %Z=^(.52) S %=$P(%Z,U,5) S:%]"" DE(17)=%
 I $D(^(57)) S %Z=^(57) S %=$P(%Z,U,4) S:%]"" DE(6)=%
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
BEGIN S DNM="DGPTX11",DQ=1
1 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=1 D X1 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X1 S:+DGJUMP'=2 Y="@991"
 Q
2 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=2 D X2 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X2 S DGJUMP=$P(DGJUMP,"2,",2)
 Q
3 S DW="0;5",DV="RP11'a",DU="",DLB="MARITAL STATUS",DIFLD=.05
 S DE(DW)="C3^DGPTX11"
 S DU="DIC(11,"
 G RE
C3 G C3S:$D(DE(3))[0 K DB
 S X=DE(3),DIC=DIE
 I ($T(AVAFC^VAFCDD01)'="") S VAFCF=".05;" D AVAFC^VAFCDD01(DA)
 S X=DE(3),DIC=DIE
 D:($T(ADGRU^DGRUDD01)'="") ADGRU^DGRUDD01(DA)
 S X=DE(3),DIC=DIE
 D EVENT^IVMPLOG(DA)
 S X=DE(3),DIIX=2_U_DIFLD D AUDIT^DIET
C3S S X="" G:DG(DQ)=X C3F1 K DB
 S X=DG(DQ),DIC=DIE
 I ($T(AVAFC^VAFCDD01)'="") S VAFCF=".05;" D AVAFC^VAFCDD01(DA)
 S X=DG(DQ),DIC=DIE
 D:($T(ADGRU^DGRUDD01)'="") ADGRU^DGRUDD01(DA)
 S X=DG(DQ),DIC=DIE
 D EVENT^IVMPLOG(DA)
 I $D(DE(3))'[0!(^DD(DP,DIFLD,"AUDIT")'="e") S X=DG(DQ),DIIX=3_U_DIFLD D AUDIT^DIET
C3F1 Q
X3 Q
4 D:$D(DG)>9 F^DIE17,DE S DQ=4,D=0 K DE(1) ;6
 S DIFLD=6,DGO="^DGPTX12",DC="2^2.06PA^.06^",DV="2.06*P10.2'X",DW="0;1",DOW="ETHNICITY",DLB=$P($$EZBLD^DIALOG(8042,DOW),": ") S:D DC=DC_D
 S DU="DIC(10.2,"
 I $D(DSC(2.06))#2,$P(DSC(2.06),"I $D(^UTILITY(",1)="" X DSC(2.06) S D=$O(^(0)) S:D="" D=-1 G M4
 S D=$S($D(^DPT(DA,.06,0)):$P(^(0),U,3,4),$O(^(0))'="":$O(^(0)),1:-1)
M4 I D>0 S DC=DC_D I $D(^DPT(DA,.06,+D,0)) S DE(4)=$P(^(0),U,1)
 G RE
R4 D DE
 G A
 ;
5 S D=0 K DE(1) ;2
 S DIFLD=2,DGO="^DGPTX13",DC="2^2.02P^.02^",DV="2.02M*P10'X",DW="0;1",DOW="RACE",DLB=$P($$EZBLD^DIALOG(8042,DOW),": ") S:D DC=DC_D
 S DU="DIC(10,"
 G RE:D I $D(DSC(2.02))#2,$P(DSC(2.02),"I $D(^UTILITY(",1)="" X DSC(2.02) S D=$O(^(0)) S:D="" D=-1 G M5
 S D=$S($D(^DPT(DA,.02,0)):$P(^(0),U,3,4),$O(^(0))'="":$O(^(0)),1:-1)
M5 I D>0 S DC=DC_D I $D(^DPT(DA,.02,+D,0)) S DE(5)=$P(^(0),U,1)
 G RE
R5 D DE
 S D=$S($D(^DPT(DA,.02,0)):$P(^(0),U,3,4),1:1) G 5+1
 ;
6 S DW="57;4",DV="S",DU="",DLB="SPINAL CORD INJURY",DIFLD=57.4
 S DU="1:PARAPLEGIA-TRAUMATIC;2:QUADRIPLEGIA-TRAUMATIC;3:PARAPLEGIA-NONTRAUMATIC;4:QUADRIPLEGIA-NONTRAUMATIC;X:NOT APPLICABLE;"
 G RE
X6 Q
7 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=7 D X7 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X7 S:+DGJUMP'=3 Y="@991"
 Q
8 S DQ=9 ;@31
9 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=9 D X9 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X9 S DGJUMP=$P(DGJUMP,"3,",2)
 Q
10 S DW=".321;1",DV="RSX",DU="",DLB="VIETNAM SERVICE INDICATED?",DIFLD=.32101
 S DE(DW)="C10^DGPTX11"
 S DU="Y:YES;N:NO;U:UNKNOWN;"
 G RE
C10 G C10S:$D(DE(10))[0 K DB
 S X=DE(10),DIC=DIE
 ;
 S X=DE(10),DIC=DIE
 ;
 S X=DE(10),DIC=DIE
 D EVENT^IVMPLOG(DA)
C10S S X="" G:DG(DQ)=X C10F1 K DB
 S X=DG(DQ),DIC=DIE
 X ^DD(2,.32101,1,1,1.3) I X S X=DIV S Y(1)=$S($D(^DPT(D0,.321)):^(.321),1:"") S X=$P(Y(1),U,4) S DIU=X K Y S X=DIV S X="" X ^DD(2,.32101,1,1,1.4)
 S X=DG(DQ),DIC=DIE
 X ^DD(2,.32101,1,2,1.3) I X S X=DIV S Y(1)=$S($D(^DPT(D0,.321)):^(.321),1:"") S X=$P(Y(1),U,5) S DIU=X K Y S X=DIV S X="" X ^DD(2,.32101,1,2,1.4)
 S X=DG(DQ),DIC=DIE
 D EVENT^IVMPLOG(DA)
C10F1 Q
X10 S DFN=DA D SV^DGLOCK
 Q
 ;
11 D:$D(DG)>9 F^DIE17,DE S DQ=11,DW=".321;2",DV="RSX",DU="",DLB="AGENT ORANGE EXPOS. INDICATED?",DIFLD=.32102
 S DE(DW)="C11^DGPTX11"
 S DU="Y:YES;N:NO;U:UNKNOWN;"
 G RE
C11 G C11S:$D(DE(11))[0 K DB
 S X=DE(11),DIC=DIE
 ;
 S X=DE(11),DIC=DIE
 ;
 S X=DE(11),DIC=DIE
 ;
 S X=DE(11),DIC=DIE
 D AUTOUPD^DGENA2(DA)
 S X=DE(11),DIC=DIE
 ;
C11S S X="" G:DG(DQ)=X C11F1 K DB
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
C11F1 Q
X11 S DFN=DA D SV^DGLOCK
 Q
 ;
12 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=12 D X12 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X12 S:X'="Y" Y=.32103
 Q
13 D:$D(DG)>9 F^DIE17,DE S DQ=13,DW=".321;13",DV="RSX",DU="",DLB="AGENT ORANGE EXPOSURE LOCATION",DIFLD=.3213
 S DE(DW)="C13^DGPTX11"
 S DU="K:KOREAN DMZ;V:VIETNAM;O:OTHER;"
 G RE
C13 G C13S:$D(DE(13))[0 K DB
 S X=DE(13),DIC=DIE
 D AUTOUPD^DGENA2(DA)
C13S S X="" G:DG(DQ)=X C13F1 K DB
 S X=DG(DQ),DIC=DIE
 D AUTOUPD^DGENA2(DA)
C13F1 Q
X13 Q
14 D:$D(DG)>9 F^DIE17,DE S DQ=14,DW=".321;3",DV="RSX",DU="",DLB="RADIATION EXPOSURE INDICATED?",DIFLD=.32103
 S DE(DW)="C14^DGPTX11"
 S DU="Y:YES;N:NO;U:UNKNOWN;"
 G RE
C14 G C14S:$D(DE(14))[0 K DB
 S X=DE(14),DIC=DIE
 ;
 S X=DE(14),DIC=DIE
 ;
 S X=DE(14),DIC=DIE
 D AUTOUPD^DGENA2(DA)
C14S S X="" G:DG(DQ)=X C14F1 K DB
 S X=DG(DQ),DIC=DIE
 X ^DD(2,.32103,1,1,1.3) I X S X=DIV S Y(2)=";"_$S($D(^DD(2,.3212,0)):$P(^(0),U,3),1:""),Y(1)=$S($D(^DPT(D0,.321)):^(.321),1:"") S X=$P($P(Y(2),";"_$P(Y(1),U,12)_":",2),";",1) S DIU=X K Y S X=DIV S X="" X ^DD(2,.32103,1,1,1.4)
 S X=DG(DQ),DIC=DIE
 X ^DD(2,.32103,1,2,1.3) I X S X=DIV S Y(1)=$S($D(^DPT(D0,.321)):^(.321),1:"") S X=$P(Y(1),U,11) S DIU=X K Y S X=DIV S X="" X ^DD(2,.32103,1,2,1.4)
 S X=DG(DQ),DIC=DIE
 D AUTOUPD^DGENA2(DA)
C14F1 Q
X14 S DFN=DA D SV^DGLOCK
 Q
 ;
15 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=15 D X15 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X15 S:X'="Y" Y=.525
 Q
16 D:$D(DG)>9 F^DIE17,DE S DQ=16,DW=".321;12",DV="SX",DU="",DLB="RADIATION EXPOSURE METHOD",DIFLD=.3212
 S DE(DW)="C16^DGPTX11"
 S DU="2:HIROSHIMA/NAGASAKI;3:ATMOSPHERIC NUCLEAR TESTING;4:H/N AND ATMOSPHERIC TESTING;5:UNDERGROUND NUCLEAR TESTING;6:EXPOSURE AT NUCLEAR FACILITY;7:OTHER;"
 G RE
C16 G C16S:$D(DE(16))[0 K DB
 S X=DE(16),DIC=DIE
 D AUTOUPD^DGENA2(DA)
C16S S X="" G:DG(DQ)=X C16F1 K DB
 S X=DG(DQ),DIC=DIE
 D AUTOUPD^DGENA2(DA)
C16F1 Q
X16 S DFN=DA D IR^DGLOCK Q
 Q
 ;
17 D:$D(DG)>9 F^DIE17,DE S DQ=17,DW=".52;5",DV="RSX",DU="",DLB="POW STATUS INDICATED?",DIFLD=.525
 S DE(DW)="C17^DGPTX11",DE(DW,"INDEX")=1
 S DU="Y:YES;N:NO;U:UNKNOWN;"
 G RE
C17 G C17S:$D(DE(17))[0 K DB
 D ^DGPTX14
C17S S X="" G:DG(DQ)=X C17F1 K DB
 D ^DGPTX15
C17F1 N X,X1,X2 S DIXR=646 D C17X1(U) K X2 M X2=X D C17X1("O") K X1 M X1=X
 D
 . D FC^DGFCPROT(.DA,2,.525,"KILL",$H,$G(DUZ),.X,.X1,.X2,$G(XQY0)) Q
 K X M X=X2 D
 . D FC^DGFCPROT(.DA,2,.525,"SET",$H,$G(DUZ),.X,.X1,.X2,$G(XQY0)) Q
 G C17F2
C17X1(DION) K X
 S X(1)=$G(@DIEZTMP@("V",2,DIIENS,.525,DION),$P($G(^DPT(DA,.52)),U,5))
 S X=$G(X(1))
 Q
C17F2 Q
X17 S DFN=DA D POWV^DGLOCK I $D(X) D SV^DGLOCK
 Q
 ;
18 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=18 D X18 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X18 S:X'="Y" Y="@42"
 Q
19 D:$D(DG)>9 F^DIE17 G ^DGPTX16
