AMHLEFPP ; IHS/CMI/LAB - MENTAL HLTH ROUTINE ;
 ;;4.0;IHS BEHAVIORAL HEALTH;;MAY 14, 2010
 ;
 ;CMI/TUCSON/LAB - added setting of % variable 9/22/97
 ;
 I AMHEFT="B" S AMHEFT="S" D PRINT1 Q:AMHQUIT  S AMHEFT="F" D PRINT1 K AMHEFT Q
 I AMHEFT="T" S AMHEFT="S" D PRINT1 Q:AMHQUIT  S AMHEFT="S" D PRINT1 K AMHEFT Q
 I AMHEFT="E" S AMHEFT="F" D PRINT1 Q:AMHQUIT  S AMHEFT="F" D PRINT1 K AMEFT Q
PRINT1 ;EP - CALLED FROM LAST VISIT DISPLAY
 S AMHR0=^AMHREC(AMHR,0)
 S AMHQUIT=0 I $E(IOST,1,2)'="P-" W:$D(IOF) @IOF
 W !!?13,"********** CONFIDENTIAL PATIENT INFORMATION **********"
 W !?15,"PCC BEHAVIORAL HEALTH ENCOUNTER RECORD"
 W !?18,"***  Computer Generated Encounter Record  ***"
 W !!,$TR($J("",80)," ","*")
 I $Y>(IOSL-5) D FF Q:AMHQUIT
 W !!?3,"Date:  " S Y=$P($P(AMHR0,U),".") D DD^%DT W Y
 W ?31,"Primary Provider: ",$$PPNAME^AMHUTIL(AMHR)
 S AMHX=0 F  S AMHX=$O(^AMHRPROV("AD",AMHR,AMHX)) Q:AMHX'=+AMHX!(AMHQUIT)  I $P(^AMHRPROV(AMHX,0),U,4)'="P" W !?35,$P(^VA(200,$P(^AMHRPROV(AMHX,0),U),0),U)
 I $Y>(IOSL-5) D FF Q:AMHQUIT
TIME W !?3,"Arrival Time:  " S Y=$P(AMHR0,U) D DD^%DT W $P(Y,"@",2) I $P(AMHR0,U,27)]"" W ?31,"Flag:  ",$P(AMHR0,U,27)
 W !?3,"Program:  ",$$EXTSET^XBFUNC(9002011,.02,$P(AMHR0,U,2))
 W !?3,"Clinic:  " I $P(AMHR0,U,25) W $P(^DIC(40.7,$P(AMHR0,U,25),0),U)
 W !?3,"Appointment Type:  ",$$EXTSET^XBFUNC(9002011,.11,$P(AMHR0,U,11))
 W !,$TR($J("",80)," ","_")
COMM ;
 I $Y>(IOSL-7) D FF Q:AMHQUIT
 W !?53,"Number",?64,"Activity/Service"
 W !?3,"Community: " W:$P(AMHR0,U,5) $E($P(^AUTTCOM($P(AMHR0,U,5),0),U),1,15)
 W ?32,"Activity:  " I $P(AMHR0,U,6) W $P(^AMHTACT($P(AMHR0,U,6),0),U),"-",$P(^AMHTACT($P(AMHR0,U,6),0),U,8)
 W ?53,"Served: ",$P(AMHR0,U,9),?64,"Time: ",$P(AMHR0,U,12)
 W !?32,"Type of Contact:   " I $P(AMHR0,U,7) W $P(^AMHTSET($P(AMHR0,U,7),0),U)
 W !,$TR($J("",80)," ","_")
 I $Y>(IOSL-4) D FF Q:AMHQUIT
 W !?3,"CHIEF COMPLAINT:  " I AMHEFT="F" S AMHTICL=18,AMHTNRQ=$G(^AMHREC(AMHR,21)),AMHTTXT="" D PRTTXT
 I AMHEFT="S" W !?3,"Chief Complaint/Presenting Problem Suppressed for Confidentiality",!
SUB W !?3,"SUBJECTIVE/OBJECTIVE:  ",!
 I AMHEFT="F" S AMHX=0 F  S AMHX=$O(^AMHREC(AMHR,31,AMHX)) Q:AMHX'=+AMHX!(AMHQUIT)  D
 .I $Y>(IOSL-6) D FF Q:AMHQUIT
 .W !?4,^AMHREC(AMHR,31,AMHX,0)
 .Q
 I AMHEFT="S" W ?3,"Mental Health or Social Services Contact",!?3,"See ",$$PPNAME^AMHUTIL(AMHR)," for details.",!
 I $Y>(IOSL-5) D FF Q:AMHQUIT
 I $D(^AMHREC(AMHR,61))!($P(AMHR0,U,14)]"") D  Q:AMHQUIT
 .I $Y>(IOSL-5) D FF Q:AMHQUIT
 .W !,$TR($J("",80)," ","_")
 .W !?3,"AXIS IV:  " S Y=0 F  S Y=$O(^AMHREC(AMHR,61,Y)) Q:Y'=+Y  S I=$P(^AMHREC(AMHR,61,Y,0),U) W ?14,$P(^AMHTAXIV(I,0),U)_" - "_$P(^AMHTAXIV(I,0),U,2),!
 .W ?3,"AXIS V:  ",$P(AMHR0,U,14)
 .Q
 W !,$TR($J("",80)," ","_")
 W !?3,"BH POV CODE      PURPOSE OF VISIT (POV)",!?3,"OR DSM DIAGNOSIS    [PRIMARY ON FIRST LINE]"
 W !,$TR($J("",80)," ","_")
POV ;
 S (AMHX,AMHC)=0 F  S AMHX=$O(^AMHRPRO("AD",AMHR,AMHX)) Q:AMHX'=+AMHX!(AMHQUIT)  D
 .I $Y>(IOSL-3) D FF Q:AMHQUIT
 .W !?8,$P(^AMHPROB($P(^AMHRPRO(AMHX,0),U),0),U)
 .S AMHTNRQ=$S(AMHEFT="F":$P(^AMHPROB($P(^AMHRPRO(AMHX,0),U),0),U,2),1:""),AMHTICL=23,AMHTTXT="" D PRTTXT
 .S AMHTNRQ=$P(^AMHRPRO(AMHX,0),U,4) S AMHTNRQ=$S(AMHTNRQ]"":$P(^AUTNPOV(AMHTNRQ,0),U),1:"<<none>>"),AMHTICL=23,AMHTTXT="" D PRTTXT
 .S AMHC=AMHC+2
 .Q
 Q:AMHQUIT
 F I=AMHC:1:3 D:$Y>(IOSL-3) FF Q:AMHQUIT  W !
 D:$Y>(IOSL-3) FF Q:AMHQUIT  W !,$TR($J("",80)," ","_")
INPT ;
 I $P(AMHR0,U,17)]"" D  Q:AMHQUIT
 .I $Y>(IOSL-4) D FF Q:AMHQUIT
 .W ?3,"Inpatient Disposition: ",$$VAL^XBDIQ1(9002011,AMHR,.17),!?3,"Facility:  ",$P(AMHR0,U,18)
 .W !,$TR($J("",80)," ","_")
 .Q
TMP ;treated med problems
 W !?3,"TREATED MEDICAL PROBLEMS:"
 S (AMHX,AMHC)=0 F  S AMHX=$O(^AMHRTMDP("AD",AMHR,AMHX)) Q:AMHX'=+AMHX!(AMHQUIT)  D
 .I $Y>(IOSL-3) D FF Q:AMHQUIT
 .W !?8,$P(^AUTNPOV($P(^AMHRTMDP(AMHX,0),U),0),U)
 .Q
 W !,$TR($J("",80)," ","_")
MEDS ;
 W !?3,"MEDICATIONS PRESCRIBED:"
 S AMHX=0 F  S AMHX=$O(^AMHREC(AMHR,41,AMHX)) Q:AMHX'=+AMHX!(AMHQUIT)  D
 .I $Y>(IOSL-3) D FF Q:AMHQUIT
 .W !?4,^AMHREC(AMHR,41,AMHX,0)
 .Q
 W !,$TR($J("",80)," ","_")
PROC ;
 W !?3,"PROCEDURES (CPT):"
 S (AMHX,AMHC)=0 F  S AMHX=$O(^AMHRPROC("AD",AMHR,AMHX)) Q:AMHX'=+AMHX!(AMHQUIT)  D
 .I $Y>(IOSL-3) D FF Q:AMHQUIT
 .;W !?8,$P(^ICPT($P(^AMHRPROC(AMHX,0),U),0),U),"  ",$P(^ICPT($P(^AMHRPROC(AMHX,0),U),0),U,2)
 .W !?8,$P($$CPT^ICPTCOD($P(^AMHRPROC(AMHX,0),U),$P($P(^AMHREC(AMHR,0),U),".")),U,2)_"  "_$P($$CPT^ICPTCOD($P(^AMHRPROC(AMHX,0),U),$P($P(^AMHREC(AMHR,0),U),".")),U,3)
 .Q
COMMENT ;
 W !,$TR($J("",80)," ","_")
 I $Y>(IOSL-4) D FF Q:AMHQUIT
 S %="" W !?3,"COMMENT:",! ;CMI/TUCSON/LAB - added setting of % 09/22/97
 I AMHEFT="S",$P($G(^AMHSITE(DUZ(2),0)),U,27)'="N" S %=0
 I AMHEFT="F" S %=1
 I AMHEFT="S",$P($G(^AMHSITE(DUZ(2),0)),U,27)="N" S %=1
 I '% W !
 I % D
 .S AMHTICL=4,AMHTNRQ=$G(^AMHREC(AMHR,12)),AMHTTXT=""
 .I AMHTNRQ]"" D PRTTXT
 W !,$TR($J("",80)," ","_")
DEMO ;EP demographics
 D DEMO^AMHLEFP1
 Q
PRTTXT ; GENERALIZED TEXT PRINTER
 S AMHTDLT=1,AMHTILN=80-AMHTICL-1
 F AMHTQ=0:0 S:AMHTNRQ]""&(($L(AMHTNRQ)+$L(AMHTTXT)+2)<255) AMHTTXT=$S(AMHTTXT]"":AMHTTXT_"; ",1:"")_AMHTNRQ,AMHTNRQ="" Q:AMHTTXT=""  D PRTTXT2
 K AMHTILN,AMHTDLT,AMHTF,AMHTC,AMHTTXT,AMHTDOO
 Q
PRTTXT2 D GETFRAG W ?AMHTICL W AMHTF,! S AMHTICL=AMHTICL+AMHTDLT,AMHTILN=AMHTILN-AMHTDLT,AMHTDLT=0
 Q
GETFRAG I $L(AMHTTXT)<AMHTILN S AMHTF=AMHTTXT,AMHTTXT="" Q
 F AMHTC=AMHTILN:-1:1 Q:$E(AMHTTXT,AMHTC)=" "
 S AMHTF=$E(AMHTTXT,1,AMHTC-1),AMHTTXT=$E(AMHTTXT,AMHTC+1,255)
 Q
 ;
FF ;EP
 I $E(IOST)="C",IO=IO(0) W ! S DIR(0)="EO" D ^DIR K DIR I Y=0!(Y="^")!($D(DTOUT)) S AMHQUIT=1 Q
 I $E(IOST)'="C" Q:'$P(AMHR0,U,8)  W !!,$TR($J(" ",79)," ","*"),!,$P(^DPT($P(AMHR0,U,8),0),U),?32,"HRN: " D
 .S AMHHRN=$P($G(^AUPNPAT($P(AMHR0,U,8),41,DUZ(2),0)),U,2)
 .W AMHHRN,?46,"DOB: ",$$FMTE^XLFDT($P(^DPT($P(AMHR0,U,8),0),U,3),"2D"),?59,"SSN: ",$$SSN^AMHUTIL($P(AMHR0,U,8)),!
 W:$D(IOF) @IOF
 Q