APCHS3B ; IHS/CMI/LAB - PART 3A OF APCHS -- SUMMARY PRODUCTION COMPONENTS ;
 ;;2.0;IHS PCC SUITE;;MAY 14, 2009
 ;PATCH 2 commented out writing of date
 ;
 ;
 ;CHANGED TO REVERSE CHRONOLOGICAL ORDER
MRL ; ******************** MOST RECENT LAB * 9000010.09 *******
 I '$D(^AUPNVLAB("AA",APCHSPAT)) D EKGLAB G MRLX
 X APCHSCKP Q:$D(APCHSQIT)
 X:'APCHSNPG APCHSBRK
 ; <SETUP>
 ; <PROCESS>
 D LBLD,LPRT1
 D EKGLAB
 ;now display lab refusals
 S APCHST="LAB",APCHSFN=60 D DISPREF^APCHS3C
 K APCHST,APCHSFN
 ; <CLEANUP>
MRLX K APCHSLT,APCHSLR,APCHSLTX,APCHSLRT,APCHSLL,APCHSLW,APCHSNMX,APCHSDFN,APCHSIVD,APCHSLTD,APCHSN,Y
 K ^TMP($J,"APCHS")
 Q
 ; <BUILD>
LBLD K ^TMP($J,"APCHS","LAB"),^TMP($J,"APCHS1")
 S APCHSLRT="" F APCHSQ=0:0 S APCHSLRT=$O(^AUPNVLAB("AA",APCHSPAT,APCHSLRT)) Q:APCHSLRT=""  D LDATE
 D REORDER
 Q
REORDER ;reorder by accession, parent and child
 S X=0 F  S X=$O(^TMP($J,"APCHS","LAB",X)) Q:X'=+X  D
 .S Y=$P(^TMP($J,"APCHS","LAB",X),U,3)
 .S D=(9999999-$P(^TMP($J,"APCHS","LAB",X),U,1))
 .S %=$E($P(^AUPNVLAB(Y,0),U,6),1,2) S:%="" %="ZZ"
 .S %1=$S($P($G(^AUPNVLAB(Y,12)),U,8)]"":$P(^AUPNVLAB(Y,12),U,8),1:Y)
 .S %2=$S($P($G(^AUPNVLAB(Y,12)),U,8)="":0,1:Y)
 .S ^TMP($J,"APCHS1",D,%,%1,%2,X)=^TMP($J,"APCHS","LAB",X)
 .Q
 K ^TMP($J,"APCHS")
 Q
 ;OLD STUFF
 ;S X=0 F  S X=$O(^TMP($J,"APCHS","LAB",X)) Q:X'=+X  D
 ;.S Y=$P(^TMP($J,"APCHS","LAB",X),U,1)
 ;.S ^TMP($J,"APCHS1",9999999-Y,X)=^TMP($J,"APCHS","LAB",X)
 ;.Q
 ;K ^TMP($J,"APCHS")
 ;Q
LDATE S APCHSIVD=0 S APCHSIVD=$O(^AUPNVLAB("AA",APCHSPAT,APCHSLRT,APCHSIVD)) D
 .S APCHSDFN=0 F  S APCHSDFN=$O(^AUPNVLAB("AA",APCHSPAT,APCHSLRT,APCHSIVD,APCHSDFN)) Q:APCHSDFN=""  D:APCHSIVD&(APCHSIVD'>APCHSDLM) LSET
 Q
LSET ;
 Q:'$D(^AUPNVLAB(APCHSDFN,0))
 S APCHSN=^AUPNVLAB(APCHSDFN,0),APCHSLR=$P(APCHSN,U,4)
 I $P($G(^AUPNVLAB(APCHSDFN,11)),U,9)="R",APCHSLR="",$$VALI^XBDIQ1(60,$P(APCHSN,U),999999901) Q  ;do not display tests that are resulted, result is null and flag says don't display
 I APCHSLR]"",APCHSLR'=" ",$P(APCHSN,U,5)]"" S APCHSLR=APCHSLR_" ("_$P(APCHSN,U,5)_")"
 I APCHSLR="",$P($G(^TMP($J,"APCHS","LAB",APCHSLRT)),U,2)]"" Q
 ;Q:$D(^TMP($J,"APCHS","LAB",APCHSLRT))
 S ^TMP($J,"APCHS","LAB",APCHSLRT)=(-APCHSIVD\1+9999999)_U_APCHSLR_U_APCHSDFN S APCHSLTX=$P(^LAB(60,APCHSLRT,0),U,1)
 Q
 ; <PRINT>
LPRT1 ;ALTERNATE ROUTE IHS/OKCAO/POC 1/20/00
 ;W ?55,"UNITS",?64,"REF RANGE",!
 W ?2,"TEST",?23,"RESULT DT/TIME",?39,"VISIT",?47,"RESULT",?60,"UNITS",?70,"REF RANGE",!
 S APCHDATE="" F  S APCHDATE=$O(^TMP($J,"APCHS1",APCHDATE)) Q:APCHDATE=""!($D(APCHSQIT))  D LPRT11
 Q
 ;.S APCHSLT="" F  S APCHSLT=$O(^TMP($J,"APCHS1",APCHDATE,APCHSLT)) Q:APCHSLT=""!($D(APCHSQIT))  D
 ;..S APCHNODE=^TMP($J,"APCHS1",APCHDATE,APCHSLT)
 ;..S APCHSDFN=$P(APCHNODE,U,3)
 ;..S Y=$P(APCHNODE,U,1)
 ;..S APCHSLR=$P(APCHNODE,U,2)
 ;..S APCHCHIL=$S($P($G(^AUPNVLAB(APCHSDFN,12)),U,8)="":0,1:Y)
 ;..X APCHSCVD S APCHSLTD=Y
 ;..D LPRT2
 ;K APCHSLT,APCHNODE,APCHSDFN,APCHSLR,APCHCHIL,APCHDATE
 ;Q
LPRT11 ;
 S APCHSACC="" F  S APCHSACC=$O(^TMP($J,"APCHS1",APCHDATE,APCHSACC)) Q:APCHSACC=""!($D(APCHSQIT))  D
 .S APCHSPAR=0 F  S APCHSPAR=$O(^TMP($J,"APCHS1",APCHDATE,APCHSACC,APCHSPAR)) Q:APCHSPAR'=+APCHSPAR!($D(APCHSQIT))  D
 ..S APCHCHIL="" F  S APCHCHIL=$O(^TMP($J,"APCHS1",APCHDATE,APCHSACC,APCHSPAR,APCHCHIL)) Q:APCHCHIL=""  D
 ...S APCHSLT=$O(^TMP($J,"APCHS1",APCHDATE,APCHSACC,APCHSPAR,APCHCHIL,0))
 ...S APCHSDFN=$P(^TMP($J,"APCHS1",APCHDATE,APCHSACC,APCHSPAR,APCHCHIL,APCHSLT),U,3)
 ...S Y=$P(^TMP($J,"APCHS1",APCHDATE,APCHSACC,APCHSPAR,APCHCHIL,APCHSLT),U,1),APCHSLR=$P(^TMP($J,"APCHS1",APCHDATE,APCHSACC,APCHSPAR,APCHCHIL,APCHSLT),U,2) X APCHSCVD S APCHSLTD=Y
 ...D LPRT2
 K APCHCHIL,APCHSPAR,APCHSACC,APCHSLT
 Q
LPRT2 ;
 S APCHSLTX=$P(^LAB(60,APCHSLT,0),U)
 S APCHSRDT=$P($G(^AUPNVLAB(APCHSDFN,12)),U,12) I APCHSRDT]"" S APCHSRDT=$$DATE^APCHSMU($P(APCHSRDT,"."))_"@"_$P($P($$FMTE^XLFDT(APCHSRDT),"@",2),":",1,2)
 X APCHSCKP Q:$D(APCHSQIT)  I APCHSNPG W ?2,"TEST",?23,"RESULT DT/TIME",?39,"VISIT",?47,"RESULT",?60,"UNITS",?70,"REF RANGE",!
 W:APCHCHIL " " W $E(APCHSLTX,1,20),?23,APCHSRDT,?38,APCHSLTD,?47,APCHSLR
 W ?60,$P($G(^AUPNVLAB(APCHSDFN,11)),U)
 I $P($G(^AUPNVLAB(APCHSDFN,11)),U,4)]""!($P($G(^AUPNVLAB(APCHSDFN,11)),U,5)]"") W ?70,$P(^AUPNVLAB(APCHSDFN,11),U,4)_"-"_$P(^AUPNVLAB(APCHSDFN,11),U,5)
 I '$P(^APCHSCTL(APCHSTYP,0),U,7) W ! Q
 ;print out comments per Dorothy
 S APCHSX=0 F  S APCHSX=$O(^AUPNVLAB(APCHSDFN,21,APCHSX)) Q:APCHSX'=+APCHSX!($D(APCHSQIT))  D
 .X APCHSCKP Q:$D(APCHSQIT)
 .W !,?1,^AUPNVLAB(APCHSDFN,21,APCHSX,0)
 F APCHSX=1:1:3 Q:$D(APCHSQIT)  I $P($G(^AUPNVLAB(APCHSDFN,13)),U,APCHSX)]"" D
 .X APCHSCKP Q:$D(APCHSQIT)
 .W !,$P(^AUPNVLAB(APCHSDFN,13),U,APCHSX)
 ;W ?78," ",$P($G(^AUPNVLAB(APCHSDFN,11)),U,9)
 W !
 Q
 ;
EKGLAB ;ENTRY POINT - EKG display in most recent lab panel
 Q:'$D(^AUPNVDXP("AC",APCHSPAT))
 K APCHS
 S APCHSERR=$$START1^APCLDF(APCHSPAT_"^LAST DIAGNOSTIC ECG SUMMARY","APCHS(")
 G:APCHSERR EKGLABX
 ; *array APCHS(1)="DATE^RESULT^DIAG PROC^VDIAG PROCEDURE IEN^AUPNVDXP^VISIT IEN"
 K APCHSERR
 S APCHSIVD=$S($D(APCHS(1)):9999999-$P($P(APCHS(1),U,1),".",1),1:"")
 Q:'APCHSIVD!(APCHSIVD>APCHSDLM)
 S (APCHSLTX,APCHSLT)="EKG"
 S APCHSLRT("EKG")=$P(APCHS(1),U,1)_"^"_$P(APCHS(1),U,2)
 D EKGPRT  ;                           computes/prints ekg info
EKGLABX ;
 K APCHSERR,APCHS(1)
 Q
 ;
EKGPRT ;computers/prints ekg info
 S Y=$P(APCHSLRT(APCHSLT),U,1) X APCHSCVD S APCHSLTD=Y
 S APCHSLR=$P(APCHSLRT(APCHSLT),U,2)
 S APCHSLR=$S(APCHSLR="N":"NORMAL",APCHSLR="A":"ABNORMAL",APCHSLR="B":"BORDERLINE",1:"<none recorded>") ;IHS/CMI/LAB added borderline
 S APCHSLW=$S($G(APCHSLW):APCHSLW,1:28)
 W !,APCHSLTX,?APCHSLW,APCHSLTD,"  ",APCHSLR,!
 Q
 ;