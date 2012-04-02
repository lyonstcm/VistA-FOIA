APCHS7C ; IHS/CMI/LAB - PART 7 OF APCHS -- SUMMARY PRODUCTION COMPONENTS ;
 ;;2.0;IHS PCC SUITE;**2,5**;MAY 14, 2009
 ;
 ;
MEDSNDUP ; ************* ALL, NON DUPLICATED *************
 S APCHSMTY="NODUP"
 ;
CONT ; <SETUP>
 ;Q:'$D(^AUPNVMED("AC",APCHSPAT))
 X APCHSCKP Q:$D(APCHSQIT)  I 'APCHSNPG W ! X APCHSBRK
 ; <BUILD>
 K ^TMP($J,"APCHSMED")
 S APCHSIVD=0 F  S APCHSIVD=$O(^AUPNVMED("AA",APCHSPAT,APCHSIVD)) Q:APCHSIVD=""!(APCHSIVD>APCHSDLM)  S APCHSMX=0 F  S APCHSMX=$O(^AUPNVMED("AA",APCHSPAT,APCHSIVD,APCHSMX)) Q:APCHSMX=""  D
 .Q:$P($G(^AUPNVMED(APCHSMX,11)),U,8)
 .S M=+^AUPNVMED(APCHSMX,0)
 .Q:'$D(^PSDRUG(M,0))
 .Q:'$$CS(M)  ;controlled substances only
 .S $P(^TMP($J,"APCHSMED",M),U)=$P($G(^TMP($J,"APCHSMED",M)),U)+1
 .S X=$P(^TMP($J,"APCHSMED",M),U)
 .I X<99 S $P(^TMP($J,"APCHSMED",M),U,(X+1))=$$FMTE^XLFDT((9999999-APCHSIVD),5)_";"_$$VAL^XBDIQ1(9000010.14,APCHSMX,1202)_";"_$$VAL^XBDIQ1(9000010,$P(^AUPNVMED(APCHSMX,0),U,3),.06)
 K ^TMP($J,"APCHSMTB"),^TMP($J,"APCHSMTP"),^TMP($J,"APCHSNO")
 S APCHSIVD=0 F APCHSQ=0:0 S APCHSIVD=$O(^AUPNVMED("AA",APCHSPAT,APCHSIVD)) Q:APCHSIVD=""!(APCHSIVD>APCHSDLM)  S APCHSMX=0 F APCHSQ=0:0 S APCHSMX=$O(^AUPNVMED("AA",APCHSPAT,APCHSIVD,APCHSMX)) Q:APCHSMX=""  D MEDBLD
 D NONVA
 ; <DISPLAY>
 ;REBUILD LIST BY NAME (TRADE OR GENERIC) AND DATE
 S (APCHSIVD,APCHSCC,APCHSCRX)=0 F APCHSQ=0:0 S APCHSIVD=$O(^TMP($J,"APCHSMTP",APCHSIVD)) Q:'APCHSIVD  I $P(^TMP($J,"APCHSMTP",APCHSIVD),U,2)="C",$P(^TMP($J,"APCHSMTP",APCHSIVD),U,3)=0 D
 .S APCHSCC=APCHSCC+1 D MEDDSP
 S (APCHSIVD)=0 F APCHSQ=0:0 S APCHSIVD=$O(^TMP($J,"APCHSMTP",APCHSIVD)) Q:'APCHSIVD  I $P(^TMP($J,"APCHSMTP",APCHSIVD),U,2)="C",$P(^TMP($J,"APCHSMTP",APCHSIVD),U,3)=1 D
 .S APCHSCC=APCHSCC+1 D MEDDSP
 S (APCHSIVD,APCHSCC)=0 F APCHSQ=0:0 S APCHSIVD=$O(^TMP($J,"APCHSMTP",APCHSIVD)) Q:'APCHSIVD  I $P(^TMP($J,"APCHSMTP",APCHSIVD),U,2)'="C",$P(^TMP($J,"APCHSMTP",APCHSIVD),U,3)=0 D
 .S APCHSCC=APCHSCC+1 D MEDDSP
 S (APCHSIVD)=0 F APCHSQ=0:0 S APCHSIVD=$O(^TMP($J,"APCHSMTP",APCHSIVD)) Q:'APCHSIVD  I $P(^TMP($J,"APCHSMTP",APCHSIVD),U,2)'="C",$P(^TMP($J,"APCHSMTP",APCHSIVD),U,3)=1 D
 .S APCHSCC=APCHSCC+1 D MEDDSP
 ;CLEANUP
 ;hold meds
 ;D HOLDDSP^APCHS7
 ;Q:$D(APCHSQIT)
 ;now display MED refusals
 ;S APCHST="MEDICATION",APCHSFN=50 D DISPREF^APCHS3C
 D MEDRU^APCHS7
 K APCHST,APCHSFN
MEDX K APCHSIVD,APCHSMX,APCHSMFX,APCHSQTY,APCHSIG,APCHSSGY,APCHSEXP,APCHSMTS,APCHSMED,APCHSDTM,APCHSDAT,APCHSDYS,APCHSN,APCHSDC,APCHSVDF,APCHSP,APCHSNON,APCHSDLU,APCHSIEN
 K APCHSNFL,APCHSNSH,APCHSNAB,APCHSVSC,APCHSITE,APCHSRX,APCHSDRG,APCHSCRN,APCHSREF,APCHSRFL,APCHSALL,APCHSTXT,APCHSMTY,APCHSALT
 K ^TMP($J,"APCHSMTB"),^TMP($J,"APCHSMTP"),^TMP($J,"APCHSNO"),^TMP($J,"APCHSMED")
 K X1,X2,X,Y
 Q
NONVA ;EP ;quit if chronic
 S X=0 F  S X=$O(^PS(55,APCHSPAT,"NVA",X)) Q:X'=+X  D
 .;S L=$P(^PS(55,APCHSPAT,"NVA",X,0),U,9)
 .I $P($G(^PS(55,APCHSPAT,"NVA",X,999999911)),U,1),$D(^AUPNVMED($P(^PS(55,APCHSPAT,"NVA",X,999999911),U,1),0)) Q
 .;S L=$P(^PS(55,APCHSPAT,"NVA",X,0),U,9)
 .;:'L
 .S L=$P($P($G(^PS(55,APCHSPAT,"NVA",X,0)),U,10),".")
 .S L=9999999-L
 .Q:L>APCHSDLM
 .;S M=$P($G(^PS(55,APCHSPAT,"NVA",X,999999911)),U,1)  ;passed to PCC so got it already
 .;I M,$D(^AUPNVMED(M)) Q  ;passed to PCC and v med exists so we already got it from V MED
 .S D=$P(^PS(55,APCHSPAT,"NVA",X,0),U,2)
 .I D="" S D="NO DRUG IEN" Q
 .Q:'$$CS(D)
 .S APCHSCRX=0 I D S APCHSCRX=$$CS(D)
 .S N=$S(D:$P(^PSDRUG(D,0),U,1),1:$P(^PS(50.7,$P(^PS(55,APCHSPAT,"NVA",X,0),U,1),0),U,1))
 .;S ^TMP($J,"APCHSMTP",L_"-"_N)=U_$P(^PS(55,APCHSPAT,"NVA",X,0),U,6)_U_N_U_$P(^PS(55,APCHSPAT,"NVA",X,0),U,5)_U_$P(^PS(55,APCHSPAT,"NVA",X,0),U,7)
 .;S ^TMP($J,"APCHSMTB",N)=$P(^PS(55,APCHSPAT,"NVA",X,0),U,6)
 .S ^TMP($J,"APCHSMTP",L_"-"_N)="^"_"Z"_"^"_APCHSCRX_"^"_N_"^"_$P(^PS(55,APCHSPAT,"NVA",X,0),U,7)_U_$P(^PS(55,APCHSPAT,"NVA",X,0),U,5)
 .I $D(^TMP($J,"APCHSMTB",N)) Q
 .S ^TMP($J,"APCHSMTB",N)=$P(^PS(55,APCHSPAT,"NVA",X,0),U,6)  ;,^TMP($J,"APCHSMTP",L_"-"_N)=APCHSMX_"^"_APCHSCHR_"^"_APCHSCRX
 Q
MEDBLD ;BUILD ARRAY OF MEDICATIONS 
 ;APCHSDC=DATE DISCONTINUED,DYS=DAYS PRESCRIBED,SIG=DIRECTIONS
 ;VDF=VISIT FILE DATE
 Q:'$D(^AUPNVMED(APCHSMX,0))
 Q:$P($G(^AUPNVMED(APCHSMX,11)),U,8)]""
 S APCHSN=^AUPNVMED(APCHSMX,0)
 Q:'$D(^PSDRUG($P(APCHSN,U,1)))
 Q:'$$CS($P(APCHSN,U,1))
 S APCHSDTM=-APCHSIVD\1+9999999
 S APCHSDC=$P(APCHSN,U,8),APCHSDYS=$P(APCHSN,U,7),APCHSMFX=$S($P(APCHSN,U,4)="":+APCHSN,$P(APCHSN,U,4)=$P(^PSDRUG(+APCHSN,0),U):+APCHSN,1:$P(APCHSN,U,4)),APCHSCHR=$$CHRONIC^APCHS72(APCHSMX),APCHSCHR=$S(APCHSCHR=1:"C",1:"Z")
 S APCHSCRX=$$CS($P(APCHSN,U))
 D @APCHSMTY
 Q
NODUP ;
 ;I $D(^TMP($J,"APCHSMTB",APCHSMFX)) Q
 ;S X="" F  S X=$O(^TMP($J,"APCHSMTP",X)) Q:X=""  I $P(X,"-",2)=APCHSMFX K ^TMP($J,"APCHSMTP",X)
 I $D(^TMP($J,"APCHSMTP",APCHSIVD_"-"_APCHSMFX)) S ^TMP($J,"APCHSMTP",APCHSIVD_"-"_APCHSMFX)=APCHSMX_"^"_APCHSCHR_"^"_APCHSCRX
 I $D(^TMP($J,"APCHSMTB",APCHSMFX)) Q
 S ^TMP($J,"APCHSMTB",APCHSMFX)=APCHSDC,^TMP($J,"APCHSMTP",APCHSIVD_"-"_APCHSMFX)=APCHSMX_"^"_APCHSCHR_"^"_APCHSCRX
 Q
MEDDSP ;DISPLAY MEDICATION
 ;APCHSRX=RX# in FILE 52,CHRN=CHRONIC FLAG,REF=#REFILLS
 S APCHSMX=$P(^TMP($J,"APCHSMTP",APCHSIVD),U)
 I 'APCHSMX D NVADSP Q
 S APCHSCRX=$P(^TMP($J,"APCHSMTP",APCHSIVD),U,3)
 S APCHSN=^AUPNVMED(APCHSMX,0)
 S APCHSIEN=+APCHSN
 S APCHSRX=$S($D(^PSRX("APCC",APCHSMX)):$O(^(APCHSMX,0)),1:0)
 S APCHSCRN=$S(+APCHSRX:$D(^PS(55,APCHSPAT,"P","CP",APCHSRX)),1:0)
 S (Y,APCHSDTM)=-APCHSIVD\1+9999999 X APCHSCVD S APCHSDAT=Y
 S APCHSDC=$P(APCHSN,U,8),APCHSDYS=$P(APCHSN,U,7),APCHSQTY=$P(APCHSN,U,6),APCHSIG=$P(APCHSN,U,5),APCHSVDF=$P(APCHSN,U,3),APCHSMFX=+APCHSN
 S X1=DT,X2=APCHSDTM D ^%DTC ;Q:X>60&(X>(2*APCHSDYS))
 S APCHSEXP=""
 S APCHSMED=$S($P(APCHSN,U,4)="":$P(^PSDRUG(APCHSMFX,0),U,1),1:$P(APCHSN,U,4))
 S APCHSALT=$P($G(^AUPNVMED(APCHSMX,12)),U,12)  ;IHS/CMI/GRL
 S APCHEXPD=$$VALI^XBDIQ1(52,APCHSRX,26) S APCHEXPD=$$FMTE^XLFDT(APCHEXPD,5)
 I APCHSDC S Y=APCHSDC X APCHSCVD S APCHSEXP="-- D/C "_Y
 S APCHORTS=$P($G(^AUPNVMED(APCHSMX,11)),U)
 I APCHORTS["RETURNED TO STOCK",APCHSDC S APCHSEXP="--RTS "_Y
 D SIG S APCHSIG=APCHSSGY
 D REF I APCHSREF S APCHSIG=APCHSIG_" "_APCHSREF_$S(APCHSREF=1:" refill",1:" refills")_" left."
 S V=$P(^AUPNVMED(APCHSMX,0),U,3) I $P($G(^AUPNVSIT(+V,0)),U,7)="E" S APCHSIG=APCHSIG_"  (OUTSIDE MEDICATION)"
 D SITE
 X APCHSCKP Q:$D(APCHSQIT)
 W APCHSDAT,?10,?14,APCHSMED W:APCHSQTY " #",APCHSQTY
 W:APCHSDYS " (",APCHSDYS," days) " W APCHSEXP
 I APCHEXPD]"" W "(expires "_APCHEXPD_")"
 W !
 I APCHSITE]"" W ?14,"Dispensed at: ",APCHSITE,!
 I $G(APCHSALT)]"" I $E($G(APCHSALT),1,6)'=$E($G(APCHSMED),1,6) W ?14,"("_APCHSALT_")",!  ;IHS/CMI/GRL
 X APCHSCKP Q:$D(APCHSQIT)
 S APCHSICL=14,APCHSNRQ="",APCHSTXT="  "_APCHSIG D PRTTXT^APCHSUTL K APCHSICL,APCHSNRQ,APCHSP
 S Y=$P(^TMP($J,"APCHSMED",APCHSIEN),U)
 Q:Y<2
 X APCHSCKP Q:$D(APCHSQIT)
 W ?16,"Previous fill dates:",!
 F APCHI=3:1 Q:$P(^TMP($J,"APCHSMED",APCHSIEN),U,APCHI)=""  D
 .X APCHSCKP Q:$D(APCHSQIT)
 .W ?16,$P($P(^TMP($J,"APCHSMED",APCHSIEN),U,APCHI),";",1)
 .W ?27,$P($P(^TMP($J,"APCHSMED",APCHSIEN),U,APCHI),";",2)
 .W ?57,$P($P(^TMP($J,"APCHSMED",APCHSIEN),U,APCHI),";",3),!
 W !
 Q
 ;
SIG ;CONSTRUCT THE FULL TEXT FROM THE ENCODED SIG
 S APCHSSGY="" F APCHSP=1:1:$L(APCHSIG," ") S X=$P(APCHSIG," ",APCHSP) I X]"" D
 . S Y=$O(^PS(51,"B",X,0)) I Y>0 S X=$P(^PS(51,Y,0),"^",2) I $D(^(9)) S Y=$P(APCHSIG," ",APCHSP-1),Y=$E(Y,$L(Y)) S:Y>1 X=$P(^(9),"^",1)
 . S APCHSSGY=APCHSSGY_X_" "
 Q
 ;
REF ;EP - DETERMINE THE NUMBER OF REFILLS REMAINING
 I 'APCHSRX S APCHSREF=0 Q
 S APCHSRFL=$P(^PSRX(APCHSRX,0),U,9) S APCHSREF=0 F  S APCHSREF=$O(^PSRX(APCHSRX,1,APCHSREF)) Q:'APCHSREF  S APCHSRFL=APCHSRFL-1
 S APCHSREF=APCHSRFL
 Q
 ;
 ;
SITE ;DETERMINE IF OUTSIDE LOCATION INFO PRESENT
 S APCHSITE=""
 I $D(^AUPNVSIT(APCHSVDF,21))#2 S APCHSITE=$P(^(21),U) Q
 Q:$P(^AUPNVSIT(APCHSVDF,0),U,6)=""
 I $P(^AUPNVSIT(APCHSVDF,0),U,6)'=DUZ(2) S APCHSITE=$E($P(^DIC(4,$P(^AUPNVSIT(APCHSVDF,0),U,6),0),U),1,30)
 Q
 ;
CS(D) ;
 I $P(^PSDRUG(D,0),U,3)="" Q 0
 NEW Y S Y=$P(^PSDRUG(D,0),U,3)
 ;I Y[1 Q 1
 I Y[2 Q 1
 I Y[3 Q 1
 I Y[4 Q 1
 I Y[5 Q 1
 ;I Y["C" Q 1
 ;I Y["A" Q 1
 Q 0
 ;
CTR(X,Y) ;EP - Center X in a field Y wide.
 Q $J("",$S($D(Y):Y,1:IOM)-$L(X)\2)_X
NVADSP ;
 S APCHSEXP=""
 S (Y,APCHSDTM)=-APCHSIVD\1+9999999 X APCHSCVD S APCHSDAT=Y
 S APCHSDC=$P(^TMP($J,"APCHSMTP",APCHSIVD),U,5)
 S APCHSCRX=$P(^TMP($J,"APCHSMTP",APCHSIVD),U,3)
 S APCHSMED=$P(^TMP($J,"APCHSMTP",APCHSIVD),U,4)
 I APCHSDC S Y=APCHSDC X APCHSCVD S APCHSEXP="-- D/C "_Y
 S APCHSIG=$P(^TMP($J,"APCHSMTP",APCHSIVD),U,6)
 X APCHSCKP Q:$D(APCHSQIT)
 W APCHSDAT,?10,$S(APCHSCRX:"CRX",1:""),?14,APCHSMED,"  ",APCHSEXP,!
 X APCHSCKP Q:$D(APCHSQIT)
 S APCHSICL=14,APCHSNRQ="",APCHSTXT=APCHSIG_"  (EHR OUTSIDE MEDICATION)" D PRTTXT^APCHSUTL K APCHSICL,APCHSNRQ,APCHSP
 Q