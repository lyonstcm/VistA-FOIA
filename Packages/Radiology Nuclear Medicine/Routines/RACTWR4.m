RACTWR4 ; ;09/19/10
 D DE G BEGIN
DE S DIE="^RARPT(",DIC=DIE,DP=74,DL=1,DIEL=0,DU="" K DG,DE,DB Q:$O(^RARPT(DA,""))=""
 I $D(^(0)) S %Z=^(0) S %=$P(%Z,U,5) S:%]"" DE(1)=%,DE(3)=%,DE(18)=% S %=$P(%Z,U,7) S:%]"" DE(21)=% S %=$P(%Z,U,9) S:%]"" DE(6)=%,DE(8)=% S %=$P(%Z,U,10) S:%]"" DE(13)=% S %=$P(%Z,U,17) S:%]"" DE(15)=%
 I $D(^("P")) S %Z=^("P") S %=$E(%Z,1,240) S:%'?." " DE(24)=%
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
BEGIN S DNM="RACTWR4",DQ=1
1 S DW="0;5",DV="RSX",DU="",DLB="REPORT STATUS",DIFLD=5
 S DE(DW)="C1^RACTWR4"
 S DU="V:VERIFIED;R:RELEASED/NOT VERIFIED;PD:PROBLEM DRAFT;D:DRAFT;EF:ELECTRONICALLY FILED;X:DELETED;"
 S X="^"
 S Y=X
 S X=Y,DB(DQ)=1 G:X="" N^DIE17:DV,A I $D(DE(DQ)),DV["I"!(DV["#") D E^DIE0 G A:'$D(X)
 G RD
C1 G C1S:$D(DE(1))[0 K DB
 S X=DE(1),DIC=DIE
 X "D ^RABUL2 Q"
 S X=DE(1),DIC=DIE
 N RAXREF K RASET S RAXREF="ARES",RARAD=12,RAKILL="" D XREF^RAUTL2 S RASECOND="SRR" D SECXREF^RADD1 K RAKILL,RARAD
 S X=DE(1),DIC=DIE
 N RAXREF K RASET S RAXREF="ASTF",RARAD=15,RAKILL="" D XREF^RAUTL2 S RASECOND="SSR" D SECXREF^RADD1 K RAKILL,RARAD
 S X=DE(1),DIC=DIE
 K ^RARPT("ASTAT",$E(X,1,30),DA)
C1S S X="" G:DG(DQ)=X C1F1 K DB
 S X=DG(DQ),DIC=DIE
 ;
 S X=DG(DQ),DIC=DIE
 N RAXREF K RAKILL I X'="V" S RAXREF="ARES",RARAD=12,RASET="" D XREF^RAUTL2 S RASECOND="SRR" D SECXREF^RADD1 K RARAD,RASET
 S X=DG(DQ),DIC=DIE
 N RAXREF K RAKILL I X'="V" S RAXREF="ASTF",RARAD=15,RASET="" D XREF^RAUTL2 S RASECOND="SSR" D SECXREF^RADD1 K RARAD,RASEC
 S X=DG(DQ),DIC=DIE
 S:"Vv"'[$E(X) ^RARPT("ASTAT",$E(X,1,30),DA)=""
C1F1 Q
X1 D EN1^RAUTL4
 Q
 ;
2 S DQ=3 ;@40
3 D:$D(DG)>9 F^DIE17,DE S DQ=3,DW="0;5",DV="RSX",DU="",DLB="REPORT STATUS",DIFLD=5
 S DE(DW)="C3^RACTWR4"
 S DU="V:VERIFIED;R:RELEASED/NOT VERIFIED;PD:PROBLEM DRAFT;D:DRAFT;EF:ELECTRONICALLY FILED;X:DELETED;"
 S X=RASTATX
 S Y=X
 S X=Y,DB(DQ)=1 G:X="" N^DIE17:DV,A I $D(DE(DQ)),DV["I"!(DV["#") D E^DIE0 G A:'$D(X)
 G RD
C3 G C3S:$D(DE(3))[0 K DB
 S X=DE(3),DIC=DIE
 X "D ^RABUL2 Q"
 S X=DE(3),DIC=DIE
 N RAXREF K RASET S RAXREF="ARES",RARAD=12,RAKILL="" D XREF^RAUTL2 S RASECOND="SRR" D SECXREF^RADD1 K RAKILL,RARAD
 S X=DE(3),DIC=DIE
 N RAXREF K RASET S RAXREF="ASTF",RARAD=15,RAKILL="" D XREF^RAUTL2 S RASECOND="SSR" D SECXREF^RADD1 K RAKILL,RARAD
 S X=DE(3),DIC=DIE
 K ^RARPT("ASTAT",$E(X,1,30),DA)
C3S S X="" G:DG(DQ)=X C3F1 K DB
 S X=DG(DQ),DIC=DIE
 ;
 S X=DG(DQ),DIC=DIE
 N RAXREF K RAKILL I X'="V" S RAXREF="ARES",RARAD=12,RASET="" D XREF^RAUTL2 S RASECOND="SRR" D SECXREF^RADD1 K RARAD,RASET
 S X=DG(DQ),DIC=DIE
 N RAXREF K RAKILL I X'="V" S RAXREF="ASTF",RARAD=15,RASET="" D XREF^RAUTL2 S RASECOND="SSR" D SECXREF^RADD1 K RARAD,RASEC
 S X=DG(DQ),DIC=DIE
 S:"Vv"'[$E(X) ^RARPT("ASTAT",$E(X,1,30),DA)=""
C3F1 Q
X3 D EN1^RAUTL4
 Q
 ;
4 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=4 D X4 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X4 S:RASTATX="V" RACT=RASTATX S:RASTATX'="V" Y=$S($E(RASTATX)="P":"@50",1:"@99") I $E(RASTATX)'="P" K ^RARPT(DA,"P")
 Q
5 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=5 D X5 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X5 I X="V",'$D(^XUSEC("RA VERIFY",DUZ)) W !!,$C(7),"You do not have the appropriate privileges to verify a report." S Y="@35"
 Q
6 D:$D(DG)>9 F^DIE17,DE S DQ=6,DW="0;9",DV="*P200'X",DU="",DLB="VERIFYING PHYSICIAN",DIFLD=9
 S DU="VA(200,"
 S X=$S($D(RAELESIG):DUZ,1:"")
 S Y=X
 S X=Y,DB(DQ)=1 G:X="" N^DIE17:DV,A I $D(DE(DQ)),DV["I"!(DV["#") D E^DIE0 G A:'$D(X)
 G RD
X6 S DIC("S")="N RAINADT X ^DD(74,9,9.2) I $S('RAINADT:1,DT'>RAINADT:1,1:0),$D(^XUSEC(""RA VERIFY"",+Y)),($D(^VA(200,""ARC"",""R"",+Y))!($D(^VA(200,""ARC"",""S"",+Y))))" D ^DIC K DIC S DIC=DIE,X=+Y K:Y<0 X
 Q
 ;
7 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=7 D X7 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X7 S:$D(RAELESIG) Y="@33"
 Q
8 S DW="0;9",DV="*P200'X",DU="",DLB="VERIFYING PHYSICIAN",DIFLD=9
 S DU="VA(200,"
 G RE
X8 S DIC("S")="N RAINADT X ^DD(74,9,9.2) I $S('RAINADT:1,DT'>RAINADT:1,1:0),$D(^XUSEC(""RA VERIFY"",+Y)),($D(^VA(200,""ARC"",""R"",+Y))!($D(^VA(200,""ARC"",""S"",+Y))))" D ^DIC K DIC S DIC=DIE,X=+Y K:Y<0 X
 Q
 ;
9 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=9 D X9 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X9 I X=""!('X) W !!,$C(7),"You must enter the 'VERIFYING PHYSICIAN'." S Y="@35"
 Q
10 S DQ=11 ;@33
11 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=11 D X11 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X11 I '$D(RASIG("PER"))#2!('$D(RASIG("NAME"))#2) S Y="@34"
 Q
12 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=12 D X12 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X12 S X1=RASIG("PER"),X=RASIG("NAME"),X2=DA D EN^XUSHSHP S RASIGCDE=X
 Q
13 S DW="0;10",DV="FIO",DU="",DLB="ELECTRONIC SIGNATURE CODE",DIFLD=10
 S DQ(13,2)="S Y(0)=Y S Y=""  <Hidden>"""
 S X=RASIGCDE
 S Y=X
 S X=Y,DB(DQ)=1 G:X="" N^DIE17:DV,A I $D(DE(DQ)),DV["I"!(DV["#") D E^DIE0 G A:'$D(X)
 G RD
X13 K:$L(X)>50!($L(X)<1) X
 I $D(X),X'?.ANP K X
 Q
 ;
14 S DQ=15 ;@34
15 S DW="0;17",DV="P200'",DU="",DLB="STATUS CHANGED TO VERIFIED BY",DIFLD=17
 S DU="VA(200,"
 S X=DUZ
 S Y=X
 S X=Y,DB(DQ)=1,DE(DW,"4/")="" G:X="" N^DIE17:DV,A I $D(DE(DQ)),DV["I"!(DV["#") D E^DIE0 G A:'$D(X)
 G RD:X="@",Z
X15 Q
16 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=16 D X16 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X16 S Y="@45"
 Q
17 S DQ=18 ;@35
18 S DW="0;5",DV="RSX",DU="",DLB="REPORT STATUS",DIFLD=5
 S DE(DW)="C18^RACTWR4"
 S DU="V:VERIFIED;R:RELEASED/NOT VERIFIED;PD:PROBLEM DRAFT;D:DRAFT;EF:ELECTRONICALLY FILED;X:DELETED;"
 S Y="DRAFT"
 S X=Y,DB(DQ)=1 G:X="" N^DIE17:DV,A I $D(DE(DQ)),DV["I"!(DV["#") D E^DIE0 G A:'$D(X)
 G RD
C18 G C18S:$D(DE(18))[0 K DB
 S X=DE(18),DIC=DIE
 X "D ^RABUL2 Q"
 S X=DE(18),DIC=DIE
 N RAXREF K RASET S RAXREF="ARES",RARAD=12,RAKILL="" D XREF^RAUTL2 S RASECOND="SRR" D SECXREF^RADD1 K RAKILL,RARAD
 S X=DE(18),DIC=DIE
 N RAXREF K RASET S RAXREF="ASTF",RARAD=15,RAKILL="" D XREF^RAUTL2 S RASECOND="SSR" D SECXREF^RADD1 K RAKILL,RARAD
 S X=DE(18),DIC=DIE
 K ^RARPT("ASTAT",$E(X,1,30),DA)
C18S S X="" G:DG(DQ)=X C18F1 K DB
 S X=DG(DQ),DIC=DIE
 ;
 S X=DG(DQ),DIC=DIE
 N RAXREF K RAKILL I X'="V" S RAXREF="ARES",RARAD=12,RASET="" D XREF^RAUTL2 S RASECOND="SRR" D SECXREF^RADD1 K RARAD,RASET
 S X=DG(DQ),DIC=DIE
 N RAXREF K RAKILL I X'="V" S RAXREF="ASTF",RARAD=15,RASET="" D XREF^RAUTL2 S RASECOND="SSR" D SECXREF^RADD1 K RARAD,RASEC
 S X=DG(DQ),DIC=DIE
 S:"Vv"'[$E(X) ^RARPT("ASTAT",$E(X,1,30),DA)=""
C18F1 Q
X18 D EN1^RAUTL4
 Q
 ;
19 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=19 D X19 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X19 S Y="@30"
 Q
20 S DQ=21 ;@45
21 D:$D(DG)>9 F^DIE17,DE S DQ=21,DW="0;7",DV="DI",DU="",DLB="VERIFIED DATE",DIFLD=7
 S DE(DW)="C21^RACTWR4"
 S X="NOW"
 S Y=X
 S X=Y,DB(DQ)=1 G:X="" N^DIE17:DV,A I $D(DE(DQ)),DV["I"!(DV["#") D E^DIE0 G A:'$D(X)
 G RD
C21 G C21S:$D(DE(21))[0 K DB
 S X=DE(21),DIC=DIE
 K ^RARPT("AA",9999999.9999-$E(X,1,30),DA)
C21S S X="" G:DG(DQ)=X C21F1 K DB
 S X=DG(DQ),DIC=DIE
 S ^RARPT("AA",9999999.9999-$E(X,1,30),DA)=""
C21F1 Q
X21 S %DT="TX" D ^%DT S X=Y K:Y<1 X
 Q
 ;
22 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=22 D X22 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X22 S Y="@15"
 Q
23 S DQ=24 ;@50
24 D:$D(DG)>9 F^DIE17,DE S DQ=24,DW="P;E1,240",DV="F",DU="",DLB="PROBLEM STATEMENT",DIFLD=25
 G RE
X24 K:$L(X)>240!($L(X)<2) X
 I $D(X),X'?.ANP K X
 Q
 ;
25 S DQ=26 ;@99
26 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=26 D X26 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X26 K RASTATX,RATRSC,RANODE,RASIGCDE
 Q
27 G 0^DIE17
