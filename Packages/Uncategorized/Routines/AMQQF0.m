AMQQF0 ; IHS/CMI/THL - GETS OVERFLOW FROM AMQQF ;
 ;;2.0;IHS PCC SUITE;;MAY 14, 2009
 ;-----
REL N A,B,C,D,X,Y,Z,I,%,N,P,Q,R,AMQQD
 S %=AMQQCOMP
 S A=$P(%,";")
 S B=$P(%,";",2)
 S C=$P(%,";",3)
 D @$S(C:"RAGE",A>B:"RDOD",1:"RDOB")
 F I=0:0 S I=$O(^UTILITY("AMQQ",$J,AMQQAG,AMQQUATN,I)) Q:'I  S %=$P(^(I),U,2) I ('%)!(%<AMQQD(1))!(%>AMQQD(2)) K ^(I)
 Q
 ;
RAGE D RDB
 I 'X Q
 S %=C
 D RD
 S AMQQD(0)=X
 S %=A
 D RD
 S AMQQD(1)=X
 S X=AMQQD(0)
 S %=B
 D RD
 S AMQQD(2)=X
 Q
 ;
RDOB D RDB
 I 'X Q
 S AMQQD(0)=X
 S %=A
 D RD
 S AMQQD(1)=X
 S X=AMQQD(0)
 S %=B
 D RD
 S AMQQD(2)=X
 Q
 ;
RDOD D RDD
 I 'X Q
 S AMQQD(0)=X
 S %=A*-1
 D RD
 S AMQQD(1)=X
 S X=AMQQD(0)
 S %=B*-1
 D RD
 S AMQQD(2)=X
 Q
 ;
RD S X1=X
 S X2=%
 D C^%DTC
 K %H,%T
 Q
 ;
RDB S X=$G(^DPT(AMQP(0),0))
 S X=$P(X,U,3)
 G RDCK
RDD S X=+$G(^DPT(AMQP(0),.35))
RDCK I 'X K ^UTILITY("AMQQ",$J,AMQQAG,AMQQUATN)
 Q
 ;
EARLY N I,X,Y,Z,%
 S Y=9999999
 F I=0:0 S I=$O(^UTILITY("AMQQ",$J,AMQQAG,AMQQUATN,I)) Q:'I  S Z=$P(^(I),U,2) I Z'="",Z<Y S Y=Z,X=I
 I Y<9999999 S %=^UTILITY("AMQQ",$J,AMQQAG,AMQQUATN,X) K ^UTILITY("AMQQ",$J,AMQQAG,AMQQUATN) S ^UTILITY("AMQQ",$J,AMQQAG,AMQQUATN,1)=%
 Q
 ;
LATEST N I,X,Y,Z,%
 S Y=0
 F I=0:0 S I=$O(^UTILITY("AMQQ",$J,AMQQAG,AMQQUATN,I)) Q:'I  S Z=$P(^(I),U,2) I Z'="",Z>Y S Y=Z,X=I
 I Y>0 S %=^UTILITY("AMQQ",$J,AMQQAG,AMQQUATN,X) K ^UTILITY("AMQQ",$J,AMQQAG,AMQQUATN) S ^UTILITY("AMQQ",$J,AMQQAG,AMQQUATN,1)=%
 Q
 ;
CHANGE N A,B,X,Y,Z,%,I
 S I=0
 F X=0:0 S X=$O(^UTILITY("AMQQ",$J,AMQQAG,AMQQUATN,X)) Q:'X  S Y=+^(X),Z=$P(^(X),U,2),I=I+1 S:'$D(A) (A,B)=Z_U_Y S:+Z<A A=Z_U_Y S:+Z>B B=Z_U_Y
 K ^UTILITY("AMQQ",$J,AMQQAG,AMQQUATN) I I>1 S ^(AMQQUATN,1)=$P(B,U,2)-$P(A,U,2)
 Q
 ;
SUM N Z,I
 S Z=0
 F I=0:0 S I=$O(^UTILITY("AMQQ",$J,AMQQAG,AMQQUATN,I)) Q:'I  I +^(I)'="" S Z=+^(I)+Z
 K ^UTILITY("AMQQ",$J,AMQQAG,AMQQUATN) S ^(AMQQUATN,1)=Z
 Q
 ;
SPAN N A,B,I,N,%,X S I=0
 F X=0:0 S X=$O(^UTILITY("AMQQ",$J,AMQQAG,AMQQUATN,X)) Q:'X  S %=+^(X) S:'$D(A) (A,B)=% S:%<A A=% S:%>B B=% S I=I+1
 K ^UTILITY("AMQQ",$J,AMQQAG,AMQQUATN) I I>1 S ^(AMQQUATN,1)=B-A
 Q
 ;
SQRD ; ENTRY POINT FROM METADICTIONARY
 I $E(AMQQRDX)?1P D SQREL G SQRDEXIT
 I $P(AMQQRDX,";",3)'>$P(AMQQRDX,";",2),$P(AMQQRDX,";",3)'<+AMQQRDX
SQRDEXIT K AMQQRDX,Y,X,X1,X2
 Q
 ;
SQREL S X1=+^AUPNVSIT(AMQP(1),0)
 S X2=$P(AMQQRDX,";")
 I $E(X2)="+" S X2=+$E(X2,2,9)
 D C^%DTC
 I $P(AMQQRDX,";",3)>X X "I 0" Q
 S X1=+^AUPNVSIT(AMQP(1),0)
 S X2=$P(AMQQRDX,";",2)
 D C^%DTC
 I $P(AMQQRDX,";",3)<X X "I 0" Q
 I 1
 Q
 ;