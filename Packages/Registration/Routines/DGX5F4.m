DGX5F4 ; ;09/19/10
 D DE G BEGIN
DE S DIE="^DGPT(D0,""M"",",DIC=DIE,DP=45.02,DL=2,DIEL=1,DU="" K DG,DE,DB Q:$O(^DGPT(D0,"M",DA,""))=""
 I $D(^(0)) S %Z=^(0) S %=$P(%Z,U,8) S:%]"" DE(1)=% S %=$P(%Z,U,9) S:%]"" DE(5)=%
 I $D(^(300)) S %Z=^(300) S %=$P(%Z,U,2) S:%]"" DE(12)=% S %=$P(%Z,U,3) S:%]"" DE(16)=% S %=$P(%Z,U,4) S:%]"" DE(21)=%,DE(25)=% S %=$P(%Z,U,5) S:%]"" DE(29)=% S %=$P(%Z,U,6) S:%]"" DE(33)=% S %=$P(%Z,U,7) S:%]"" DE(37)=%
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
BEGIN S DNM="DGX5F4",DQ=1
1 D:$D(DG)>9 F^DIE17,DE S DQ=1,DW="0;8",DV="*P80'X",DU="",DLB="ICD 4",DIFLD=8
 S DE(DW)="C1^DGX5F4",DE(DW,"INDEX")=1
 S DU="ICD9("
 G RE
C1 G C1S:$D(DE(1))[0 K DB
 S X=DE(1),DIC=DIE
 K ^DGPT(DA(1),"M","AC",$E(X,1,30),DA)
 S X=DE(1),DIC=DIE
 X "N X S X=""DGRUDD01"" X ^%ZOSF(""TEST"") Q:'$T  N DG1 S DG1=+$P(^DGPT(DA(1),0),""^"",1) D:(DG1>0) ADGRU^DGRUDD01(DG1)"
C1S S X="" G:DG(DQ)=X C1F1 K DB
 S X=DG(DQ),DIC=DIE
 S ^DGPT(DA(1),"M","AC",$E(X,1,30),DA)=""
 S X=DG(DQ),DIC=DIE
 X "N X S X=""DGRUDD01"" X ^%ZOSF(""TEST"") Q:'$T  N DG1 S DG1=+$P(^DGPT(DA(1),0),""^"",1) D:(DG1>0) ADGRU^DGRUDD01(DG1)"
C1F1 S DIEZRXR(45.02,DIIENS)=$$OREF^DILF($NA(@$$CREF^DILF(DIE)))
 F DIXR=465 S DIEZRXR(45.02,DIXR)=""
 Q
X1 D ICDEN^DGPTF5 Q:X=""  K K S DIC("S")="S DGI=8 D EN^DGPTFJC I 'DGER" S DIC(0)=$P(DIC(0),"E")_$P(DIC(0),"E",2) D ^DIC K DIC S DIC=DIE,X=+Y K:Y<0 X
 Q
 ;
2 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=2 D X2 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X2 I X K DGPTIT S DGNFLD="@60",Y="@800",DGPTIT(X_$C(59)_"ICD9(")=""
 Q
3 S DQ=4 ;@60
4 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=4 D X4 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X4 S DGNFLD="@70"
 Q
5 D:$D(DG)>9 F^DIE17,DE S DQ=5,DW="0;9",DV="*P80'X",DU="",DLB="ICD 5",DIFLD=9
 S DE(DW)="C5^DGX5F4",DE(DW,"INDEX")=1
 S DU="ICD9("
 G RE
C5 G C5S:$D(DE(5))[0 K DB
 S X=DE(5),DIC=DIE
 K ^DGPT(DA(1),"M","AC",$E(X,1,30),DA)
 S X=DE(5),DIC=DIE
 X "N X S X=""DGRUDD01"" X ^%ZOSF(""TEST"") Q:'$T  N DG1 S DG1=+$P(^DGPT(DA(1),0),""^"",1) D:(DG1>0) ADGRU^DGRUDD01(DG1)"
C5S S X="" G:DG(DQ)=X C5F1 K DB
 S X=DG(DQ),DIC=DIE
 S ^DGPT(DA(1),"M","AC",$E(X,1,30),DA)=""
 S X=DG(DQ),DIC=DIE
 X "N X S X=""DGRUDD01"" X ^%ZOSF(""TEST"") Q:'$T  N DG1 S DG1=+$P(^DGPT(DA(1),0),""^"",1) D:(DG1>0) ADGRU^DGRUDD01(DG1)"
C5F1 S DIEZRXR(45.02,DIIENS)=$$OREF^DILF($NA(@$$CREF^DILF(DIE)))
 F DIXR=466 S DIEZRXR(45.02,DIXR)=""
 Q
X5 D ICDEN^DGPTF5 Q:X=""  K K S DIC("S")="S DGI=9 D EN^DGPTFJC I 'DGER" S DIC(0)=$P(DIC(0),"E")_$P(DIC(0),"E",2) D ^DIC K DIC S DIC=DIE,X=+Y K:Y<0 X
 Q
 ;
6 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=6 D X6 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X6 I X K DGPTIT S DGNFLD="@70",Y="@800",DGPTIT(X_$C(59)_"ICD9(")=""
 Q
7 S DQ=8 ;@70
8 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=8 D X8 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X8 K DGNFLD,DGDUP S Y=""
 Q
9 S DQ=10 ;@800
10 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=10 D X10 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X10 D SCAN^DGPTSCAN S:'$D(DGBPC) Y="@899"
 Q
11 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=11 D X11 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X11 I '$D(DGBPC(2))!(DGDUP(2)) S Y="@820"
 Q
12 D:$D(DG)>9 F^DIE17,DE S DQ=12,DW="300;2",DV="SX",DU="",DLB="SUICIDE/SELF INFLICT INDICATOR",DIFLD=300.02
 S DU="1:Attempted Suicide;2:Accomplished Suicide;3:Self Inflicted Injury;"
 G RE
X12 S DGFLAG=2 D 501^DGPTSC01 K:DGER X K DGER,DGFLAG Q
 Q
 ;
13 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=13 D X13 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X13 S:X]"" DGDUP(2)=1
 Q
14 S DQ=15 ;@820
15 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=15 D X15 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X15 I '$D(DGBPC(3))!(DGDUP(3)) S Y="@830"
 Q
16 S DW="300;3",DV="SX",DU="",DLB="LEGIONNAIRE'S DISEASE",DIFLD=300.03
 S DU="1:Yes;2:No;"
 G RE
X16 S DGFLAG=3 D 501^DGPTSC01 K:DGER X K DGER,DGFLAG Q
 Q
 ;
17 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=17 D X17 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X17 S:X]"" DGDUP(3)=1
 Q
18 S DQ=19 ;@830
19 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=19 D X19 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X19 I '$D(DGBPC(4))!(DGDUP(4)) S Y="@840"
 Q
20 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=20 D X20 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X20 D DRUG^DGPTSC01 I $D(DGTX) S Y="@835"
 Q
21 S DW="300;4",DV="P45.61'X",DU="",DLB="SUBSTANCE ABUSE",DIFLD=300.04
 S DU="DIC(45.61,"
 G RE
X21 S DGFLAG=4 D 501^DGPTSC01 K:DGER X K DGER,DGFLAG
 Q
 ;
22 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=22 D X22 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X22 S:X]"" DGDUP(4)=1
 Q
23 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=23 D X23 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X23 S Y="@840"
 Q
24 S DQ=25 ;@835
25 S DW="300;4",DV="P45.61'X",DU="",DLB="SUBSTANCE ABUSE",DIFLD=300.04
 S DU="DIC(45.61,"
 S X=DGTX
 S Y=X
 G Y
X25 S DGFLAG=4 D 501^DGPTSC01 K:DGER X K DGER,DGFLAG
 Q
 ;
26 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=26 D X26 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X26 S:X]"" DGDUP(4)=1
 Q
27 S DQ=28 ;@840
28 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=28 D X28 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X28 I '$D(DGBPC(5))!(DGDUP(5)) S Y="@850"
 Q
29 S DW="300;5",DV="SX",DU="",DLB="PSYCHIATRY CLASS. SEVERITY",DIFLD=300.05
 S DU="0:INADEQUATE INFO OR NO CHANGE;1:NONE;2:MILD;3:MODERATE;4:SEVERE;5:EXTREME;6:CATASTROPHIC;"
 G RE
X29 S DGFLAG=5 D 501^DGPTSC01 K:DGER X K DGER,DGFLAG
 Q
 ;
30 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=30 D X30 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X30 S:X]"" DGDUP(5)=1
 Q
31 S DQ=32 ;@850
32 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=32 D X32 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X32 I '$D(DGBPC(6))!(DGDUP(6)) S Y="@860"
 Q
33 S DW="300;6",DV="NJ2,0X",DU="",DLB="CURRENT PSYCH CLASS ASSESS",DIFLD=300.06
 G RE
X33 S DGFLAG=6 D 501^DGPTSC01 S:DGER X="" K DGFLAG,DGER K:+X'=X!(X>90)!(X<1)!(X?.E1"."1N.N) X
 Q
 ;
34 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=34 D X34 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X34 S:X]"" DGDUP(6)=1
 Q
35 S DQ=36 ;@860
36 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=36 D X36 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X36 I '$D(DGBPC(7))!(DGDUP(7)) S Y="@899"
 Q
37 S DW="300;7",DV="NJ2,0X",DU="",DLB="HIGH LEVEL PSYCH CLASS",DIFLD=300.07
 G RE
X37 S DGFLAG=7 D 501^DGPTSC01 S:DGER X="" K DGER,DGFLAG K:+X'=X!(X>90)!(X<1)!(X?.E1"."1N.N) X
 Q
 ;
38 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=38 D X38 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X38 S:X]"" DGDUP(7)=1
 Q
39 S DQ=40 ;@899
40 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=40 D X40 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X40 K DGPTIT S Y=DGNFLD
 Q
41 S DQ=42 ;@900
42 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=42 D X42 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X42 K DGEXQ D CHQUES^DGPTSPQ I '$D(DGEXQ) S Y="@999"
 Q
43 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=43 D X43 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X43 I '$D(DGEXQ(6)) S Y="@904"
 Q
44 D:$D(DG)>9 F^DIE17 G ^DGX5F5
