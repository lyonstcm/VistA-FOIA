APCHS81 ; IHS/CMI/LAB - PART 2 OF APCHS -- SUMMARY PRODUCTION COMPONENTS ;
 ;;2.0;IHS PCC SUITE;;MAY 14, 2009
NT ; ******************** NARRATIVE TEXT 9000010.34 ******
 K APCHSTXA
 ; <SETUP>
 Q:'$D(^AUPNVNT("AA",APCHSPAT))
 X APCHSBRK
 ; <DISPLAY>
 X APCHSCKP Q:$D(APCHSQIT)  W !
 S APCHSTT="" F APCHSQ=0:0 S APCHSTT=$O(^AUPNVNT("AA",APCHSPAT,APCHSTT)) Q:APCHSTT=""  S APCHSND2=APCHSNDM D NTDTYP Q:$D(APCHSQIT)
 D WRITE
 ; <CLEANUP>
NTX K APCHSTT,APCHSTT2,APCHSTT3,APCHSDFN,APCHSND2,APCHSDAT,APCHSIVD,APCHSTXA,APCHWP,APCHX,APCHSNDM
 Q
NTDTYP S APCHSTT2=$S($D(^AUTTNTYP(APCHSTT,0)):$P(^(0),U,1),1:APCHSTT) S APCHSTT3=APCHSTT2
 S (APCHSIVD,APCHSDFN)="" F  S APCHSIVD=$O(^AUPNVNT("AA",APCHSPAT,APCHSTT,APCHSIVD)) Q:APCHSIVD=""!(APCHSIVD>APCHSDLM)  S APCHSND2=APCHSND2-1 Q:APCHSND2=-1  D NTDSP
 Q
NTDSP ;
 S APCHSDFN=0 F  S APCHSDFN=$O(^AUPNVNT("AA",APCHSPAT,APCHSTT,APCHSIVD,APCHSDFN)) Q:APCHSDFN'=+APCHSDFN!($D(APCHSQIT))  S Y=-APCHSIVD\1+9999999 D
 .S APCHSTXA(APCHSIVD,APCHSTT,APCHSDFN)=""
 Q
 ;
WRITE ;write out Narrative text
 S APCHSIVD=0 F  S APCHSIVD=$O(APCHSTXA(APCHSIVD)) Q:APCHSIVD=""!($D(APCHSQIT))  D
 .S APCHSTT=0 F  S APCHSTT=$O(APCHSTXA(APCHSIVD,APCHSTT)) Q:APCHSTT=""!($D(APCHSQIT))  D
 ..S APCHSDFN=0 F  S APCHSDFN=$O(APCHSTXA(APCHSIVD,APCHSTT,APCHSDFN)) Q:APCHSDFN'=+APCHSDFN!($D(APCHSQIT))  D
 ...X APCHSCKP Q:$D(APCHSQIT)
 ...W !,$$FMTE^XLFDT(9999999-APCHSIVD),?23,$P(^AUTTNTYP(APCHSTT,0),U)
 ... K APCHWP D WP
 ...S APCHX=0 F  S APCHX=$O(APCHWP(APCHX)) Q:APCHX'=+APCHX!($D(APCHSQIT))  D
 ....X APCHSCKP Q:$D(APCHSQIT)
 ....W !?3,APCHWP(APCHX)
 ....Q
 ...Q
 ..Q
 .Q
 Q
WP ;EP - Entry point to print wp fields pass node in APCHWP
 NEW APCHG,APCHX,CNT
 K ^UTILITY($J,"W")
 S APCHX=0
 S DIWL=1,DIWR=70 F  S APCHX=$O(^AUPNVNT(APCHSDFN,11,APCHX)) Q:APCHX'=+APCHX  D
 .S X=^AUPNVNT(APCHSDFN,11,APCHX,0) D ^DIWP
 .Q
 S (Z,CNT)=0 F  S Z=$O(^UTILITY($J,"W",DIWL,Z)) Q:Z'=+Z  S CNT=CNT+1,APCHWP(CNT)=^UTILITY($J,"W",DIWL,Z,0)
 K DIWL,DIWR,DIWF,Z
 K ^UTILITY($J,"W"),APCHG,CNT,APCHX
 Q