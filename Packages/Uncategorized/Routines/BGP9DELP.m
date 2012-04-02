BGP9DELP ; IHS/CMI/LAB - IHS HEDIS print ;
 ;;9.0;IHS CLINICAL REPORTING;;JUL 1, 2009
 ;
 ;
PRINT ;
 K ^TMP($J)
 S BGPIOSL=$S($G(BGPGUI):55,1:IOSL)
 I BGPROT="D" G DEL
 D ^BGP9ELH
 S BGPGPG=0
 S BGPQUIT=""
 D PRINT1
 K ^TMP($J)
 I BGPROT="P" K ^XTMP("BGP9D",BGPJ,BGPH),^TMP($J) Q
 ;
DEL ;create delimited output file
 D ^%ZISC ;close printer device
 K ^TMP($J)
 D ^BGP9ELL ;create ^tmp of delimited report
 K ^XTMP("BGP9D",BGPJ,BGPH)
 K ^TMP($J)
 Q
 ;
PRINT1 ;EP
 S BGPIC=0 F  S BGPIC=$O(BGPIND(BGPIC)) Q:BGPIC=""!(BGPQUIT)  D
 .D HEADER^BGP9DPH ;header for all measures
 .I $Y>(BGPIOSL-3) D HEADER^BGP9DPH Q:BGPQUIT
 .W !,$P(^BGPELIN(BGPIC,0),U,3),!
 .I $Y>(BGPIOSL-3) D HEADER^BGP9DPH Q:BGPQUIT
 .W !,"Denominator(s):"
 .S BGPX=0 F  S BGPX=$O(^BGPELIN(BGPIC,61,"B",BGPX)) Q:BGPX'=+BGPX!(BGPQUIT)  D
 ..S BGPY=0 F  S BGPY=$O(^BGPELIN(BGPIC,61,"B",BGPX,BGPY)) Q:BGPY'=+BGPY!(BGPQUIT)  D
 ...S BGPZ=0 F  S BGPZ=$O(^BGPELIN(BGPIC,61,BGPY,1,BGPZ)) Q:BGPZ'=+BGPZ!(BGPQUIT)  D
 ....I $Y>(BGPIOSL-3) D HEADER^BGP9DPH Q:BGPQUIT
 ....W !,^BGPELIN(BGPIC,61,BGPY,1,BGPZ,0)
 ....Q
 ...;W !
 ...Q
 ..Q
 .I $Y>(BGPIOSL-3) D HEADER^BGP9DPH Q:BGPQUIT
 .W !!,"Numerator(s):"
 .S BGPX=0 F  S BGPX=$O(^BGPELIN(BGPIC,62,"B",BGPX)) Q:BGPX'=+BGPX!(BGPQUIT)  D
 ..S BGPY=0 F  S BGPY=$O(^BGPELIN(BGPIC,62,"B",BGPX,BGPY)) Q:BGPY'=+BGPY!(BGPQUIT)  D
 ...S BGPZ=0 F  S BGPZ=$O(^BGPELIN(BGPIC,62,BGPY,1,BGPZ)) Q:BGPZ'=+BGPZ!(BGPQUIT)  D
 ....I $Y>(BGPIOSL-3) D HEADER^BGP9DPH Q:BGPQUIT
 ....W !,^BGPELIN(BGPIC,62,BGPY,1,BGPZ,0)
 ....Q
 ...Q
 ..Q
 .I $O(^BGPELIN(BGPIC,11,0)) W !,"Logic",! S BGPX=0 F  S BGPX=$O(^BGPELIN(BGPIC,11,BGPX)) Q:BGPX'=+BGPX  D
 ..I $Y>(BGPIOSL-3) D HEADER^BGP9DPH Q:BGPQUIT
 ..W !,^BGPELIN(BGPIC,11,BGPX,0)
 .I $O(^BGPELIN(BGPIC,51,0)) W !,"Performance Measure Description",! S BGPX=0 F  S BGPX=$O(^BGPELIN(BGPIC,51,BGPX)) Q:BGPX'=+BGPX  D
 ..I $Y>(BGPIOSL-3) D HEADER^BGP9DPH Q:BGPQUIT
 ..W !,^BGPELIN(BGPIC,51,BGPX,0)
 .I $O(^BGPELIN(BGPIC,52,0)) W !,"Past Performance and/or Target",! S BGPX=0 F  S BGPX=$O(^BGPELIN(BGPIC,52,BGPX)) Q:BGPX'=+BGPX  D
 ..I $Y>(BGPIOSL-3) D HEADER^BGP9DPH Q:BGPQUIT
 ..W !,^BGPELIN(BGPIC,52,BGPX,0)
 .X ^BGPELIN(BGPIC,3)
 ;
 D ^BGP9ELS
 D EXIT
 Q
EXIT ;
 I $E(IOST)="C",IO=IO(0),'$D(ZTQUEUED) W ! S DIR(0)="EO",DIR("A")="End of report.  Press ENTER" D ^DIR K DIR S:$D(DUOUT) DIRUT=1
 Q
C(X,X2,X3) ;
 D COMMA^%DTC
 Q X