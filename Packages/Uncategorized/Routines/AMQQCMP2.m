AMQQCMP2 ; IHS/CMI/THL - NON "OR" SEARCH CRITERIA COMPILATATION ;
 ;;2.0;IHS PCC SUITE;**2**;MAY 14, 2009
 ;-----
RUN F  S AMQQSER=$O(@AMQQ@(AMQQSER)) Q:AMQQSER=""  F AMQQUATN=0:0 S AMQQUATN=$O(@AMQQ@(AMQQSER,AMQQUATN)) Q:'AMQQUATN  S (Q,AMQQQ)=^UTILITY("AMQQ",$J,"Q",AMQQUATN) D TEMPLATE
 D ^AMQQCMP4
 D ^AMQQCMP6
 I $D(^UTILITY("AMQQ",$J,"SQ",0)) D EN1^AMQQCMP3
 S AMQV(AMQQLINO)="D ^AMQQDO"
 I $D(AMQQFFF) S AMQV(AMQQLINO)="D OUTPUT^AMQQRMFF"
 I $D(AMQQYY(0)) S AMQV(AMQQLINO)="D OUTPUT^AMQQCMPS"
 I '$D(AMQQCNAM),AMQQCCLS="P" S AMQQCNAM="PATIENTS"
 S AMQV(0)="K AMQQQUIT S AMQQTOT=0,AMQQCCLS="""_AMQQCCLS_""",AMQQCNAM="""_AMQQCNAM_""" D LOG^AMQQMGR2 X AMQV(1) D TIME^AMQQMGR2"
EXIT K AMQQ,AMQQCOMP,AMQQFVAR,AMQQHOLD,AMQQINDX,AMQQLINK,AMQQNVAR,AMQQSER,AMQQSF,AMQQVALU,AMQQVAR,%,Y,Z,A,B,C,D,E,I,Q,AMQQZLIN,AMQQZNN,AMQQQ,AMQQUSQN,AMQQI,AMQQIQ
 Q
 ;
TEMPLATE ; ENTRY POINT FROM AMQQCMPK
 S AMQQLINK=+Q
 S Z=""
 S AMQQNVAR=$P(Q,U,14)
 I $P(Q,U,9)[";NULL",$D(^AMQQ(1,+Q,5)),^(5)'="" S AMQQSBSC=5 G T1
 I $P(Q,U,9)[";ANY",$D(^AMQQ(1,+Q,7)),^(7)'="" S AMQQSBSC=7 G T1
 I $P(Q,U,9)[";INVERSE",$D(^AMQQ(1,+Q,8)),^(8)'="" S AMQQSBSC=8 G T1
 S AMQQSBSC=$S(AMQQLINO>1:2,$D(AMQQKGNO):2,1:1)
 I AMQQLINO>1,AMQQLINK[455!(AMQQLINK[681),Q'[(";ANY"),Q'[";ALL",Q'[";NULL" S AMQQSBSC=1
 S %=$P(Q,U,11)
 S %=$P(%,":",2)
 I %=2 S AMQQSBSC=2
 S %=$P(Q,U,9)
 I %[";NULL"!(%["EXIST")!(%[";INVERSE") S:+Q'=758 AMQQNVAR=1
T1 F AMQQCSC=AMQQSBSC:.1 Q:'$D(^AMQQ(1,AMQQLINK,AMQQCSC))  I ^(AMQQCSC)'="" S AMQV(AMQQLINO)=$S($G(AMQV(1))'["DIBT("&($G(AMQV(2))'["DPT(""B""")!(AMQQCSC'=1.1):^(AMQQCSC),'$D(^(1.11)):^(AMQQCSC),1:^(1.11)) D TSET K AMQQTFLG
 S %=0
 F AMQQI=1:1:AMQQNVAR S %=$O(^AMQQ(1,AMQQLINK,4,%)) Q:'%  I '$D(AMQQKGNO) D GROUP I $D(AMQQIQ) K AMQQIQ Q
 S AMQQVAR=AMQQVAR+AMQQNVAR
 I $P(Q,U,17),$P(Q,U,4) S %=$P(Q,U,9),%=$P(%,";",5) I %'="" S AMQV(AMQQLINO-1,%)=""
 I $P(Q,U,3)="I" S %=$P(Q,U,9),%=$P(%,";",5) I %'="" S AMQV(AMQQLINO-1,%)=""
 K AMQQSBSC,AMQQCSC
 Q
 ;
TSET S Y=$P(Q,U,15)
 S X=AMQQLINO
 K AMQQUSQN
 S %=$P(AMQQQ,U,9)
 S Z="|13|;|14|"
 I $D(AMQQTFLG) K AMQQTFLG S $P(AMQV(X),";",15)=2 ; S AMQV(X)=$P(AMQV(X),"|6|")_"|6|;;;2"_$P(AMQV(X),"|6|",2,9)
 I $P(%,";",5)="NULL",AMQV(X)[Z S AMQV(X)=$P(AMQV(X),Z)_$P(Y,";",4)_"~~"_$P(Y,";",4)_";NULL"_$P(AMQV(X),Z,2,99) G TSET1
 S %=$P(%,";",4)
 I %'="",";SAVE;NULL;EXISTS;ANY;"[(";"_%),AMQV(X)[Z S AMQV(X)=$P(AMQV(X),Z)_$P(Y,";",4)_"~~"_$P(Y,";",5)_";"_%_$P(AMQV(X),Z,2,99)
 I AMQV(X)'["~~",AMQV(X)[Z,$P($P(AMQQQ,U,9),";",6)="NULL" S AMQV(X)=$P(AMQV(X),Z)_$P(Y,";",4)_"~~"_$P(Y,";",5)_";NULL"_$P(AMQV(X),Z,2,99)
TSET1 F I=1:1:10 S Z=$P(Y,";",I) Q:$P(Y,";",I,99)=""  S %="|"_(I+9)_"|" F  Q:AMQV(X)'[%  S AMQV(X)=$P(AMQV(X),%,1)_Z_$P(AMQV(X),%,2,99)
 S %="|20|"
 F  Q:AMQV(X)'[%  S AMQV(X)=$P(AMQV(X),%)_X_$P(AMQV(X),%,2,99)
 S %="|23|"
 S A=$P(Q,U,8)
 S B=(A'="'="&(A'="'><"))
 F  Q:AMQV(X)'[%  S AMQV(X)=$P(AMQV(X),%)_$S(B:"*",1:"+")_$P(AMQV(X),%,2,99)
 I '$D(AMQQKGNO) S %="|30|",AMQV(X)=$P(AMQV(X),%)_"X:AMQT("_X_") AMQV("_(X+1)_")" I +AMQQQ=681.1 S AMQV(X)=AMQV(X)_" Q"
 S %="|7|"
 S Z=$P(Q,U,14)
 S:Z="" Z=1
 F  Q:AMQV(X)'[%  S AMQV(X)=$P(AMQV(X),%)_Z_$P(AMQV(X),%,2,99)
 S %=AMQV(X)
 S A="|6|"
 S B="|5|"
 F I=1:1 Q:%'[A  D CKER
 S AMQV(X)=%
 I $D(AMQQMULL),AMQQMULL=AMQQUATN,%["AMQQX=" D ADDMULL
 I $D(^UTILITY("AMQQ",$J,"SQXQ",AMQQUATN)),%["AMQQX=" S AMQQUSQN=$O(^(AMQQUATN,"")) D ^AMQQCMP3
 S AMQQLINO=AMQQLINO+1
 S Q=AMQQQ
 K A,B,C,D,E,%
 Q
 ;
CKER S C=$P(%,A)
 S D=$P(%,A,2)
 S E=$E(%,4+$L(C)+$L(D),255)
 F  Q:D'[B  S D=$P(D,B)_(AMQQVAR+I)_$P(D,B,2,99)
 S %=C_(AMQQVAR+I)_D_E
 Q
 ;
GROUP I +Q=33,Q[";;;NULL" Q
 I +Q=133 Q
 N X,Z
 S X=AMQQLINK_U_%
 I AMQQI=1,'$P(Q,U,17),$D(^AMQQ(1,+X,4,1,0)),$P(^(0),U,8) S $P(X,U,4)=+$P(Q,U,14)
 I $P(Q,U,17) S Z=$P(Q,U,9),Z=$P(Z,";",5) I Z'="",Z'=+Z S $P(X,U,5)=Z
 I AMQQI=1,$D(AMQQRED) S:$P(AMQQRED,U,3) AMQQRED=$P(AMQQRED,U,1,2),AMQQIQ="" S X=X_U_AMQQRED
 S ^UTILITY("AMQQ",$J,"VAR NAME",AMQQVAR+AMQQI)=X
 K AMQQRED
 Q
 ;
ADDMULL N X,Y,Z,%
 S %=AMQV(AMQQLINO)
 S X=$P(%,"AMQQX=")
 S Y=$P(%,"AMQQX=",2)
 S Z=$P(Y,""" D ^AMQQ",2)
 S Y=$P(Y,""" D ^AMQQ")
 I X["S AMQQB=" S $P(Y,";",8)=AMQQMULL
 S $P(Y,";",18)=AMQQMULL
 S AMQV(AMQQLINO)=X_"AMQQX="_Y_""" D ^AMQQ"_Z
 K AMQQMULL
 Q
 ;