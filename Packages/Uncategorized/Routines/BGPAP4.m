BGPAP4 ; IHS/CMI/LAB -print ind 4 ;
 ;;7.0;IHS CLINICAL REPORTING;;JAN 24, 2007
 ;
 ;
I4A ;EP ; 
 ;Q:'$D(BGPIND(9))
 D HEADER^BGPAPH
 W !,"Indicator 4A:  Diabetes-Reduce Diabetic Complications-Assessed for Dyslipidemia"
 W !,"Denominator is all patients with a DM diagnosis ever."
 W !,"Continue the trend of increasing the proportion of I/T/U clients with"
 W !,"diagnosed diabetes who have been assessed for dyslipidemia using LDL as",!,"the screening test.",!,"% with LDL done",!
 I $Y>(IOSL-5) D HEADER^BGPAPH Q:BGPQUIT
 D H
 S BGPRPT=0 F  S BGPRPT=$O(BGPSUL(BGPRPT)) Q:BGPRPT'=+BGPRPT!(BGPQUIT)  D
 .S BGPCYD=$P($$V(BGPRPT,10,10),"!",1)+$P($$V(BGPRPT,10,10),"!",2),BGPCYN=$$V(BGPRPT,14,6),BGPCYP=$S(BGPCYD:((BGPCYN/BGPCYD)*100),1:"")
 .S BGP98D=$P($$V(BGPRPT,80,10),"!",1)+$P($$V(BGPRPT,80,10),"!",2),BGP98N=$$V(BGPRPT,84,6),BGP98P=$S(BGP98D:((BGP98N/BGP98D)*100),1:"")
 .S BGPPRD=$P($$V(BGPRPT,40,10),"!",1)+$P($$V(BGPRPT,40,10),"!",2),BGPPRN=$$V(BGPRPT,44,6),BGPPRP=$S(BGPPRD:((BGPPRN/BGPPRD)*100),1:"")
 .D LOCW Q:BGPQUIT
 Q
I4B ;EP ; 
 ;Q:'$D(BGPIND(10))
 D HEADER^BGPAPH
 W !,"Indicator 4B:  Diabetes-Reduce Diabetic Complications-Assessed for Dyslipidemia"
 W !,"Denominator is all patients with a DM diagnosis ever, with at least",!,"2 visits in the year prior to the end of the time period and the first",!,"ever recorded diagnosis of Diabetes > 1year prior to the end of the time period."
 W !,"Continue the trend of increasing the proportion of I/T/U clients with"
 W !,"diagnosed diabetes who have been assessed for dyslipidemia using LDL as",!,"the screening test.",!,"% with LDL done",!
 I $Y>(IOSL-5) D HEADER^BGPAPH Q:BGPQUIT
 D H
 S BGPRPT=0 F  S BGPRPT=$O(BGPSUL(BGPRPT)) Q:BGPRPT'=+BGPRPT!(BGPQUIT)  D
 .S BGPCYD=$$V(BGPRPT,12,5),BGPCYN=$$V(BGPRPT,14,14),BGPCYP=$S(BGPCYD:((BGPCYN/BGPCYD)*100),1:"")
 .S BGP98D=$$V(BGPRPT,82,5),BGP98N=$$V(BGPRPT,84,14),BGP98P=$S(BGP98D:((BGP98N/BGP98D)*100),1:"")
 .S BGPPRD=$$V(BGPRPT,42,5),BGPPRN=$$V(BGPRPT,44,14),BGPPRP=$S(BGPPRD:((BGPPRN/BGPPRD)*100),1:"")
 .D LOCW Q:BGPQUIT
 Q
I4C ;EP ; 
 ;Q:'$D(BGPIND(11))
 D HEADER^BGPAPH
 W !,"Indicator 4C:  Diabetes-Reduce Diabetic Complications-Assessed for Dyslipidemia"
 W !,"Denominator is all patients with a DM diagnosis ever, who are 19 or older",!,"who had at least 2 diabetes related encounters ever, at least one",!,"encounter in a primary clinic with a primary provider for diabetes,"
 W !,"and an absence of a creatinine value of 5.0 or greater."
 W !,"Continue the trend of increasing the proportion of I/T/U clients with"
 W !,"diagnosed diabetes who have been assessed for dyslipidemia using LDL as",!,"the screening test.",!,"% with LDL done",!
 I $Y>(IOSL-5) D HEADER^BGPAPH Q:BGPQUIT
 D H
 S BGPRPT=0 F  S BGPRPT=$O(BGPSUL(BGPRPT)) Q:BGPRPT'=+BGPRPT!(BGPQUIT)  D
 .S BGPCYD=$$V(BGPRPT,12,10),BGPCYN=$$V(BGPRPT,14,22),BGPCYP=$S(BGPCYD:((BGPCYN/BGPCYD)*100),1:"")
 .S BGP98D=$$V(BGPRPT,82,10),BGP98N=$$V(BGPRPT,84,22),BGP98P=$S(BGP98D:((BGP98N/BGP98D)*100),1:"")
 .S BGPPRD=$$V(BGPRPT,42,10),BGPPRN=$$V(BGPRPT,44,22),BGPPRP=$S(BGPPRD:((BGPPRN/BGPPRD)*100),1:"")
 .D LOCW Q:BGPQUIT
 Q
CALC(N,O) ;ENTRY POINT
 NEW Z
 I O=0!(N=0)!(O="")!(N="") Q "**"
 NEW X,X2,X3
 S X=N,X2=1,X3=0 D COMMA^%DTC S N=X
 S X=O,X2=1,X3=0 D COMMA^%DTC S O=X
 I +O=0 Q "**"
 S Z=(((N-O)/O)*100),Z=$FN(Z,"+,",1)
 Q Z
 Q
H ;write header
 W !?44,"% CHANGE",?62,"% CHANGE",!?44,"FROM BASE YR",?62,"FROM PREV YR"
 Q
LOCW ;
 I $Y>(IOSL-3) D HEADER^BGPDPH Q:BGPQUIT
 W !?3,$P(^BGPD(BGPRPT,0),U,5)
 S X=$P(^BGPD(BGPRPT,0),U,5)
 I X="" W ?11,"?????" Q
 S X=$O(^AUTTLOC("C",X,0))
 I X="" W ?11,"?????" Q
 W ?11,$E($P(^DIC(4,X,0),U),1,20)
 S BGPX=$J($$CALC(BGPCYP,BGP98P),6),$E(BGPX,20)=$J($$CALC(BGPCYP,BGPPRP),6)
 W ?46,BGPX
 Q
WLOC ;
 I $Y>(IOSL-3) D HEADER^BGPDPH Q:BGPQUIT
 W !?3,$P(^BGPD(BGPRPT,0),U,5)
 S X=$P(^BGPD(BGPRPT,0),U,5)
 I X="" W ?11,"?????" Q
 S X=$O(^AUTTLOC("C",X,0))
 I X="" W ?11,"?????" Q
 W ?11,$E($P(^DIC(4,X,0),U),1,20)
 Q
V(R,N,P) ;
 NEW Y
 I $G(BGPAREAA),'$G(BGPSUMR) G VA
 Q $P($G(^BGPD(R,N)),U,P)
VA ;
 NEW X,C,V,MT,FT,M,F,B S X=0,C="" F  S X=$O(BGPSUL(X)) Q:X'=+X  D
 .S V=$P($G(^BGPD(X,N)),U,P)
 .I C="" S C=V Q
 .S MT=$P(C,"!"),FT=$P(C,"!",2),M=$P(V,"!"),F=$P(V,"!",2)
 .F B=1:1:6 S $P(MT,"~",B)=$P(MT,"~",B)+$P(M,"~",B)
 .F B=1:1:6 S $P(FT,"~",B)=$P(FT,"~",B)+$P(F,"~",B)
 .S C=MT_"!"_FT
 .Q
 Q C
C(X,X2,X3) ;
 D COMMA^%DTC
 Q X