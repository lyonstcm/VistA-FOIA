LRCAPL2 ;SLC/DCM- CAP STATISTICS BY LOCATION PRINT ;4/4/89  20:24 ;
 ;;V~5.0~;LAB;;02/27/90 17:09
 S LRPG=0,LRSITE=0
 F II=0:0 S LRSITE=$O(^UTILITY($J,LRSITE)) Q:LRSITE<1  S (T2,T3,T4)=0,LRSTA=$S($D(^DIC(4,LRSITE,0)):$P(^(0),"^"),1:"STATION #"_LRSITE) D HEAD,MAJ Q:LREND  D GTOT
 D:'LREND WAIT W @IOF K II,T2,T3,T4,LRSTA,LRSITE,LRMAJ,LOC,S2,S3,S4,LL,M1,MM,LRX,LRPG Q
MAJ S LRMAJ=0 F JJ=0:0 S LRMAJ=$O(^UTILITY($J,LRSITE,LRMAJ)) Q:LRMAJ=""  D LOC Q:LREND
 Q
LOC S LOC="" F KK=0:0 S LOC=$O(^UTILITY($J,LRSITE,LRMAJ,LOC)) Q:LOC=""  S (S2,S3,S4)=0 W !,LOC D SUB Q:LREND  D TOT
 Q
SUB F LL=0:0 S LL=$N(^UTILITY($J,LRSITE,LRMAJ,LOC,LL)) Q:LL<1  D TEST Q:LREND
 Q
TEST S MM="" F M1=0:0 S MM=$O(^UTILITY($J,LRSITE,LRMAJ,LOC,LL,MM)) Q:MM=""  S LRX=^(MM) D PRINT Q:LREND
 Q
PRINT S S2=S2+$P(LRX,"^",2),S3=S3+$P(LRX,"^",3),S4=S4+($P(LRX,"^",1)*$P(LRX,"^",2))
 S T2=T2+$P(LRX,"^",2),T3=T3+$P(LRX,"^",3),T4=T4+($P(LRX,"^",1)*$P(LRX,"^",2))
 I $Y>(IOSL-7) D EQUALS^LRX W !!?(IOM-14),"Continued..." D WAIT Q:LREND  D HEAD
 S M1=$N(^LAM("B",MM,0)) W !?25,$E(MM,1,23),?48,$J("["_$P(^LAM(M1,0),"^",3)_"]",7),$J($P(LRX,"^",2),8),$J($P(LRX,"^",3),8),$J($P(LRX,"^",2)*$P(LRX,"^",1),8)
 Q
TOT W !?56,"------- ------- -------",!,?10,"Total for ",LOC,?55,$J(S2,8),$J(S3,8),$J(S4,8) S M(LOC)=S2_"^"_S3_"^"_S4
 Q
GTOT W !?56,"======= ======= =======",!,?10,"Grand total",?55,$J(T2,8),$J(T3,8),$J(T4,8) W ! D EQUALS^LRX
 D %
 Q
HEAD W @IOF S LRPG=LRPG+1,%DT="T",X="N" D ^%DT X ^DD("DD") W !,Y
 S LRCL=IOM\2-($L(LRSTA)\2) W ?LRCL,LRSTA,?(IOM-9),"PAGE ",LRPG
 S LRCL=IOM\2-10 W !?LRCL,"CAP STATISTICS BY CODE"
 S LRCL=IOM\2-(6+$L(LRH1)+$L(LRH2)\2) W !?LRCL,LRH1," thru ",LRH2
 D DASH^LRX
 W !?51,"[UW]","  RAW  | STAT  | UNIT  |",!,"TREATING AREA",?25,"PROCEDURE",?55," COUNT | COUNT | COUNT |" D DASH^LRX
 Q
WAIT Q:IOST'["C-"  W !,"...Press RETURN to continue, '^' to stop..." R X:DTIME I X="^" S LREND=1
 Q
% D H1 S L=""
 F RR=0:0 S L=$O(M(L)) Q:L=""  D:$Y>(IOSL-7) H1 Q:LREND  W !,L,?55 F I=1:1:3 S Y="T"_(I+1),X=$S(@Y'=0:$J($P(M(L),"^",I)/@Y,0,2),1:0) W $J((X*100),6),"%"
 W ! D EQUALS^LRX K M
 Q
H1 D WAIT W @IOF S LRPG=LRPG+1,%DT="T",X="N" D ^%DT X ^DD("DD") W !,Y
 S LRCL=IOM\2-($L(LRSTA)\2) W ?LRCL,LRSTA,?(IOM-9),"PAGE ",LRPG S LRCL=IOM\2-20 W !?LRCL,"WORKLOAD PERCENTAGE BY TREATING AREA"
 S LRCL=IOM\2-(6+$L(LRH1)+$L(LRH2)\2) W !?LRCL,LRH1," thru ",LRH2 D DASH^LRX W !?56,"  RAW  | STAT | UNIT  |",!,"TREATING AREA",?56,"  LOAD | LOAD | LOAD  |" D DASH^LRX
 Q