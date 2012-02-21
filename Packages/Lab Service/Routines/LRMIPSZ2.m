LRMIPSZ2	;AVAMC/REG/SLC/CJS/BA - MICRO PATIENT REPORT - BACTERIA, SIC/SBC, MIC ;3/28/90  15:23 ;
	;;5.2;LAB SERVICE;**388**;Sep 27, 1994;Build 2
ANTI	;from LRMIPSZ1
	I $P(^LR(LRDFN,"MI",LRIDT,14,0),U,4)>0 W !!,?28,"Antibiotic Level(s):",!,"ANTIBIOTIC",?20,"CONC RANGE (ug/ml)",?42,"DRAW TIME"
	I  S B=0 F I=0:0 S B=$O(^LR(LRDFN,"MI",LRIDT,14,B)) Q:B<1  W !,$P(^LR(LRDFN,"MI",LRIDT,14,B,0),U),?20,$P(^(0),U,3),?42,$$EXTERNAL^DILFD(63.42,1,"",$P(^(0),U,2))
	Q
BACT	;from LRMIPSZ1
	I '$L($P(^LR(LRDFN,"MI",LRIDT,1),U)) Q:'$D(LRWRDVEW)  Q:LRSB'=1
	D BUG
	I $D(^LR(LRDFN,"MI",LRIDT,2,0)) D FH^LRMIPSU Q:LREND  D GRAM
	I $D(^LR(LRDFN,"MI",LRIDT,25,0)) D FH^LRMIPSU Q:LREND  D BSMEAR
	I $D(^LR(LRDFN,"MI",LRIDT,3,0)) D FH^LRMIPSU Q:LREND  D BRMK Q:LREND  D BACT^LRMIPSZ5 Q:LREND
	I $D(^LR(LRDFN,"MI",LRIDT,4,0)),$P(^(0),U,4)>0 D FH^LRMIPSU Q:LREND  W:LRHC ! W !,"Bacteriology Remark(s):" S B=0 F I=0:0 S B=+$O(^LR(LRDFN,"MI",LRIDT,4,B)) Q:B<1  W !,?3,^LR(LRDFN,"MI",LRIDT,4,B,0)
	Q
BUG	S LRTUS=$P(^LR(LRDFN,"MI",LRIDT,1),U,2),DZ=$P(^(1),U,3),LRUS=$P(^(1),U,6),LRNS=$P(^(1),U,5),Y=$P(^(1),U) D D^LRU
	D:$Y>(IOSL-LRFLIP) WAIT^LRMIPSU Q:LREND
	W:LRHC ! W !,"* BACTERIOLOGY ",$S(LRTUS="F":"FINAL",LRTUS="P":"PRELIMINARY",1:"")," REPORT => "_Y_"   TECH CODE: "_DZ
	S LRPRE=19 D PRE^LRMIPSU
	I $L(LRUS) W !,"URINE SCREEN: "_$S(LRUS="N":"Negative",LRUS="P":"Positive",1:LRUS) W:LRHC !
	I $L(LRNS) W !,"SPUTUM SCREEN:  ",LRNS W:LRHC !
	Q
GRAM	W !,"GRAM STAIN:" S LRGRM=0 F I=0:0 S LRGRM=+$O(^LR(LRDFN,"MI",LRIDT,2,LRGRM)) Q:LRGRM<1  W ?14,^(LRGRM,0),!
	W:LRHC !
	Q
BSMEAR	W !,"BACTERIOLOGY SMEAR/PREP:",! S LRMYC=0 F I=0:0 S LRMYC=+$O(^LR(LRDFN,"MI",LRIDT,25,LRMYC)) Q:LRMYC<1  W ?5,^(LRMYC,0),!
	Q
BRMK	S (LRBUG,LR2ORMOR)=0 F LRAX=1,2 S LRBUG=+$O(^LR(LRDFN,"MI",LRIDT,3,LRBUG)) Q:LRBUG<1  S:LRAX=2 LR2ORMOR=1
	I LRAX'=1 S (LRBUG,LRTSTS)=0 F LRAX=1:1 S LRBUG=+$O(^LR(LRDFN,"MI",LRIDT,3,LRBUG)) Q:LRBUG<1  D LST
	Q
LST	S (LRBUG(LRAX),LRORG)=$P(^LR(LRDFN,"MI",LRIDT,3,LRBUG,0),U),LRQU=$P(^(0),U,2),LRSSD=$P(^(0),U,3,8),LRORG=$P(^LAB(61.2,LRORG,0),U)
	I LRSSD'?."^" S LRSIC1=$P(LRSSD,U),LRSBC1=$P(LRSSD,U,2),LRDRTM1=$P(LRSSD,U,3),LRSIC2=$P(LRSSD,U,4),LRSBC2=$P(LRSSD,U,5),LRDRTM2=$P(LRSSD,U,6),LRSSD=1
	W:LRHC ! W:LRAX=1 !,"CULTURE RESULTS:" W:LRAX>1 ! W ?17,$S(LR2ORMOR:LRBUG_". ",1:""),LRQU,LRORG
	I LRSSD D FH^LRMIPSU Q:LREND  D SSD W:LRHC !
	S:$D(^LR(LRDFN,"MI",LRIDT,3,LRBUG,2)) LRTSTS=LRTSTS+1 I $D(^LR(LRDFN,"MI",LRIDT,3,LRBUG,3,0)),$P(^(0),U,4)>0 D MIC
	I $D(^LR(LRDFN,"MI",LRIDT,3,LRBUG,1,0)),$P(^(0),U,4)>0 D CMNT
	Q
SSD	W ! S LRDRTM1=$S(LRDRTM1="P":"PEAK",LRDRTM1="T":"TROUGH",1:LRDRTM1),LRDRTM2=$S(LRDRTM2="P":"PEAK",LRDRTM2="T":"TROUGH",1:LRDRTM2)
	I $L(LRSIC1) W !,?20,"SIT " W:$L(LRDRTM1) "(",LRDRTM1,")" W ": ",LRSIC1
	I $L(LRSBC1) W !,?20,"SBT " W:$L(LRDRTM1) "(",LRDRTM1,")" W ": ",LRSBC1
	I $L(LRSIC2) W !,?20,"SIT " W:$L(LRDRTM2) "(",LRDRTM2,")" W ": ",LRSIC2
	I $L(LRSBC2) W !,?20,"SBT " W:$L(LRDRTM2) "(",LRDRTM2,")" W ": ",LRSBC2
	Q
MIC	W !,?18,"Antibiotic" S B=0 F I=0:0 S B=+$O(^LR(LRDFN,"MI",LRIDT,3,LRBUG,3,B)) Q:B<1  I $L($P(^(B,0),U,2,3))>0 W ?35,"MIC (ug/ml)",?50,"MBC (ug/ml)" Q
	S B=0 F I=0:0 S B=+$O(^LR(LRDFN,"MI",LRIDT,3,LRBUG,3,B)) Q:B<1  W !,?18,$P(^(B,0),U),?35,$J($P(^(0),U,2),7),?50,$J($P(^(0),U,3),7)
	Q
CMNT	S LRPC=0 F A=0:1 S LRPC=+$O(^LR(LRDFN,"MI",LRIDT,3,LRBUG,1,LRPC)) Q:LRPC<1  W !?20 W:A=0 "Comment: " W ?29,^(LRPC,0)
	Q
