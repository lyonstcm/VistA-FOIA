LR7OSUM3 ;slc/dcm - Silent Patient cum cont. ;8/11/97
 ;;5.2;LAB SERVICE;**121,201,187,228,250**;Sep 27, 1994
 S LRAG=0,LRYESCOM=0,LRIL=0,LRFULL=0
 D LRMH S LRMH="MISC" G PRE^LR7OSUM6
LRMH S LRMH=0 F  S LRMH=$O(^TMP($J,LRDFN,LRMH)) Q:LRMH<1  S X=^(LRMH) D MH1
 Q
MH1 S LRMHN=$P(X,U,1),LRSH=0
 S LRPG=1
 D TOP^LR7OSUM6
 S LROFMT="",LRFDE=0 D LRSH D:'LRFDE LRBOT^LR7OSUM6 K LRTM,^TMP($J,"TM") S LRFULL=0,LRTM=0,LROFMT="",LRFDE=0
 Q
LRSH ;from LR7OSUM4, LR7OSUM5
 S LRSH=$O(^TMP($J,LRDFN,LRMH,LRSH)) Q:LRSH<1  G:$D(^(LRSH))'=11 LRSH S X=^(LRSH),LRSHN=$P(X,U,1),LRTOPP=$P(X,U,2),LRSHD=$P(X,U,3),LRFMT=$P(X,U,4),LRFMT(1)=$E(LRFMT,1),LROFMT(1)=$E(LROFMT,1)
 Q:$S('$D(SUBHEAD):0,1:'$D(SUBHEAD(LRSHN)))
 I (LROFMT["V"&(LRFMT["V"))!(LROFMT'=""&(LRFMT(1)'=LROFMT(1))) S LROFMT="" D HEAD^LR7OSUM6
 S LROFMT=LRFMT,LRTOPP=$E($P(^LAB(61,LRTOPP,0),U,1),1,13),LRTOT=0,LRPL=1,LRACT=0,LRJS=0,LRTS=0,LRFDE=0
 S LRNP=0,LRFDT=0,LRLFDT=0,LRFFDT=0 D LRNP
LOOP ;from LR7OSUM5
 I LRACT<LRPL S LRFDT=LRFFDT G:LRFMT["H" TS^LR7OSUM5 I LRFMT["V" S LRMULT=99999,LRMU=0 G BS^LR7OSUM4
 D TXT1^LR7OSUM5 I LRCTR'<LRLNS S LRFULL=1 S:'LRFDT LRFED=1 D:LRFDE LRBOT^LR7OSUM6 D:'LRFDT HEAD^LR7OSUM6 S LRFULL=0 G LRSH
 G LRSH
LRNP ;from LR7OSUM4
 S I=0 F  S I=$O(^LAB(64.5,1,1,LRMH,1,LRSH,1,I)) Q:I<1  S LRTOT=LRTOT+$P(^(I,0),U,2) I LRTOT>(GIOM-20) S LRPL=LRPL+1,LRTOT=$P(^(0),U,2)
LRLNS ;from LR7OSUM5
 K LRTM,^TMP($J,"TM") S LRTM=0
 S LRLNS=((GIOSL-18)-(GCNT+(6*LRPL)))\LRPL
 S LRCL=(GIOM/2)-(5+($L(LRSHN)/2)) S GCNT=GCNT+1,CCNT=1,^TMP("LRC",$J,GCNT,0)=$$S^LR7OS(LRCL,CCNT,"---- "_LRSHN_" ----")
 S ^TMP("LRH",$J,LRSHN)=GCNT ;Set x-ref of minor headers with data
 S LRACT=0,LRJS=0,LRNP=1
 Q
UDT ;from LR7OSUM4, LR7OSUM5
 N LRBDT
 S LRBDT=LRFDT
 ;S LRFDT=$S($P(^LAB(64.5,1,1,LRMH,1,LRSH,0),U,3)["I":$P(^TMP($J,LRDFN,LRMH,LRSH,LRFDT,0),U,2),1:LRFDT),LRTIM=$E(LRFDT,9,12)
 S LRFDT=$P(^TMP($J,LRDFN,LRMH,LRSH,LRFDT,0),U,2),LRTIM=$E(LRFDT,9,12) ;Forces all formats to be inverse date/time regardless of parameter in file 64.5
 F I=0:0 Q:$L(LRTIM)=4  S LRTIM=LRTIM_0
 S LRTIM=$S(LRTIM?4"0":"     ",1:$E(LRTIM,1,2)_":"_$E(LRTIM,3,4))
 S LRUDT=$E($$Y2K^LRX($P(LRFDT,".")),1,5)_" "_$J(LRTIM,4)_" " S LRFDT=LRBDT D:LRTM LRTM
 Q
LRTM S LRNXSW=0 S:'$D(LRTM(0)) LRTM(0)=96
 I $D(^TMP($J,"TM",LRFDT)) S LRNXSW=1
 E  I $D(^TMP($J,LRDFN,LRMH,LRSH,LRFDT,"TX")) D
 . S I=LRTM(0)-96,LRTM(0)=LRTM(0)+1,LRNX=$C(96+(I#26+1))_$S(I\26>0:I\26,1:""),^TMP($J,"TM",LRFDT)=LRNX,LRNXSW=1
 . S I=0 F  S I=$O(^TMP($J,LRDFN,LRMH,LRSH,LRFDT,"TX",I)) Q:I<1  S ^TMP($J,"TM",LRFDT,I)=^(I,0)
 N LRUDT7 S LRUDT7=$$Y2K^LRX(9999999-LRFDT)
 S LRUDT=$P(LRUDT7,"@")_" "_$E($P(LRUDT7,"@",2),1,5)
 S:LRNXSW I=$P(^TMP($J,"TM",LRFDT),"^"),LRUDT=I_$E("   ",1,$S($L(I)>0:1,1:2))_LRUDT
 Q