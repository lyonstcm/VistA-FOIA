PXQZIS ;ISL/JVS - QUEUEING UTILITY (%ZTLOAD) ;8/29/96  10:34
 ;;1.0;PCE PATIENT CARE ENCOUNTER;**4**;Aug 12, 1996
 ;
Q1 S ZTDTH=$H
QUEZ K IO("Q") I '$D(ZTIO),$D(ION),ION="" S ZTIO=""
 I '$D(ZTDESC) S ZTDESC=$S($D(DGPGM):DGPGM,$D(PGM):PGM,1:"MAS UNKNOWN OPTION")
 I '$D(ZTRTN) S DGPGM=$S($D(DGPGM):DGPGM,$D(PGM):PGM,1:"") G:DGPGM="" CLOSE S ZTRTN="DQ^DGUTQ"
 S DGZTSAVE=$S($D(DGVAR):DGVAR,$D(VAR):VAR,1:"*") D SAVE
 I $D(DGPGM),'$D(ZTSAVE("DGPGM")) S ZTSAVE("DGPGM")=""
LOAD D ^%ZTLOAD W:'$D(DGUTQND) !!,$S($D(ZTSK):"Request Queued!",1:"Request Cancelled!") S:'$D(ZTSK) X="^" S:$D(ZTSK) X="" G CLOSE:$D(ZTSK),END
 Q
ZIS W ! K IOP,IO("Q") S POP=0,%ZIS="QMP" D ^%ZIS K %ZIS,IOP Q:POP  I $D(IO("Q")) D
 .I $G(OPTION)=1 D QUE1
 .I $G(OPTION)=2 D QUE2
 .I $G(OPTION)=3 D QUE3
 .I $G(OPTION)=4 D QUE4
 .I $G(OPTION)="5D" D QUE5D
 .I $G(OPTION)="5E" D QUE5E
 .I $G(OPTION)="5S" D QUE5S
 .I $G(OPTION)="5A" D QUE5A
 .I $G(OPTION)="6D" D QUE6D
 .I $G(OPTION)="6E" D QUE6E
 .I $G(OPTION)="6S" D QUE6S
 .I $G(OPTION)="6A" D QUE6A
 .I $G(OPTION)=7 D QUE7
 .I $G(OPTION)="9P" D QUE9P
 .I $G(OPTION)="9L" D QUE9L
 .I $G(OPTION)=10 D QUE10
 .S POP=1
 I POP=1 G CLOSE
 U IO Q
QUE1 ;--DEPENDENT ENTRY COUNTS (VISITS AND ENCOUNTERS)
 S ZTDESC="PCE DEBUGGING UTILITIES DEPENDENT ENTRY COUNTS"
 S ZTRTN="DEP^PXQMAIN"
 S ZTSAVE("PXQRECI")=0
 S ZTSAVE("VISIT")=""
 S ZTSAVE("IEN")=""
 D ^%ZTLOAD
 I $G(ZTSK) W !,"Task number is "_$G(ZTSK)
 Q
QUE2 ;--EXPANDED DEPENDENT ENTRY COUNTS
 S ZTDESC="PCE DEBUGGING UTILITIES EXPANDED DEPENDENT ENTRY COUNTS"
 S ZTRTN="EXP^PXQMAIN"
 S ZTSAVE("PXQRECI")=0
 S ZTSAVE("VISIT")=""
 S ZTSAVE("IEN")=""
 D ^%ZTLOAD
 W !,"Task number is "_ZTSK
 Q
QUE3 ;--INTERNAL VIEW OF VISITS
 S ZTDESC="PCE DEBUGGING UTILITIES INTERNAL VIEW OF VISITS"
 S ZTRTN="INT^PXQMAIN"
 S ZTSAVE("PXQRECI")=0
 S ZTSAVE("VISIT")=""
 S ZTSAVE("IEN")=""
 D ^%ZTLOAD
 W !,"Task number is "_ZTSK
 Q
QUE4 ;--SOURCE OF THE PCE DATA
 S ZTDESC="PCE DEBUGGING UTILITIES SOURCE OF THE PCE DATA"
 S ZTRTN="INT^PXQMAIN"
 S ZTSAVE("PXQRECI")=0
 S ZTSAVE("VISIT")=""
 S ZTSAVE("IEN")=""
 D ^%ZTLOAD
 W !,"Task number is "_ZTSK
 Q
QUE5D ;--VISIT IEN-DEPENDENT ENTRIES
 S ZTDESC="PCE DEBUGGING UTILITIES VISIT IEN-DEPENDENT ENTRIES"
 S ZTRTN="DEC5D^PXQMAIN1"
 S ZTSAVE("PXQRECI")=0
 S ZTSAVE("VISIT")=""
 S ZTSAVE("IEN")=""
 D ^%ZTLOAD
 W !,"Task number is "_ZTSK
 Q
QUE5E ;--VISIT IEN-EXPANDED
 S ZTDESC="PCE DEBUGGING UTILITIES VISIT IEN-EXPANDED"
 S ZTRTN="EXP5E^PXQMAIN1"
 S ZTSAVE("PXQRECI")=0
 S ZTSAVE("VISIT")=""
 S ZTSAVE("IEN")=""
 D ^%ZTLOAD
 W !,"Task number is "_ZTSK
 Q
QUE5S ;--VISIT IEN-SOURCES
 S ZTDESC="PCE DEBUGGING UTILITIES VISIT IEN-SOURCE"
 S ZTRTN="SOR5S^PXQMAIN1"
 S ZTSAVE("PXQRECI")=0
 S ZTSAVE("VISIT")=""
 S ZTSAVE("IEN")=""
 D ^%ZTLOAD
 W !,"Task number is "_ZTSK
 Q
QUE5A ;--VISIT IEN-ALL
 S ZTDESC="PCE DEBUGGING UTILITIES VISIT IEN-ALL"
 S ZTRTN="ALL5A^PXQMAIN1"
 S ZTSAVE("PXQRECI")=0
 S ZTSAVE("VISIT")=""
 S ZTSAVE("IEN")=""
 D ^%ZTLOAD
 W !,"Task number is "_ZTSK
 Q
QUE6D ;--ENCOUNTER IEN-DEPENDENT ENTRIES
 S ZTDESC="PCE DEBUGGING UTILITIES ENCOUNTER IEN-DEPENDENT ENTRIES"
 S ZTRTN="DEC6D^PXQMAIN3"
 S ZTSAVE("PXQRECI")=0
 S ZTSAVE("VISIT")=""
 S ZTSAVE("IEN")=""
 D ^%ZTLOAD
 W !,"Task number is "_ZTSK
 Q
QUE6E ;--ENCOUNTER IEN-EXPANDED
 S ZTDESC="PCE DEBUGGING UTILITIES ENCOUNTER IEN-EXPANDED"
 S ZTRTN="EXP6E^PXQMAIN3"
 S ZTSAVE("PXQRECI")=0
 S ZTSAVE("VISIT")=""
 S ZTSAVE("IEN")=""
 D ^%ZTLOAD
 W !,"Task number is "_ZTSK
 Q
QUE6S ;--ENCOUNTER IEN-SOURCES
 S ZTDESC="PCE DEBUGGING UTILITIES ENCOUNTER IEN-SOURCE"
 S ZTRTN="SOR6S^PXQMAIN3"
 S ZTSAVE("PXQRECI")=0
 S ZTSAVE("VISIT")=""
 S ZTSAVE("IEN")=""
 D ^%ZTLOAD
 W !,"Task number is "_ZTSK
 Q
QUE6A ;--ENCOUNTER IEN-ALL
 S ZTDESC="PCE DEBUGGING UTILITIES ENOCUNTER IEN-ALL"
 S ZTRTN="ALL6A^PXQMAIN3"
 S ZTSAVE("PXQRECI")=0
 S ZTSAVE("VISIT")=""
 S ZTSAVE("IEN")=""
 D ^%ZTLOAD
 W !,"Task number is "_ZTSK
 Q
QUE7 ;--PCE/VISIT PARAMETER SETUP
 S ZTDESC="PCE DEBUGGING UTILITIES PCE/VISIT PARAMETERS SETUP"
 S ZTRTN="SET7^PXQMAIN"
 S ZTSAVE("PXQRECI")=0
 D ^%ZTLOAD
 W !,"Task number is "_ZTSK
 Q
QUE9P ;--PATIENT/IHS AND LOCATION FILES
 S ZTDESC="PCE DEBUGGING UTILITIES PATIENT FILES"
 S ZTRTN="PAT9P^PXQMAIN2"
 S ZTSAVE("PXQRECI")=0
 D ^%ZTLOAD
 W !,"Task number is "_ZTSK
 Q
QUE9L ;--PATIENT/IHS AND LOCATION FILES
 S ZTDESC="PCE DEBUGGING UTILITIES LOCATION FILES"
 S ZTRTN="LOC9L^PXQMAIN2"
 S ZTSAVE("PXQRECI")=0
 D ^%ZTLOAD
 W !,"Task number is "_ZTSK
 Q
QUE10 ;--USER VISIT REVIEW
 S ZTDESC="PCE DEBUGGING UTILITIES USER VISIT REVIEW"
 S ZTRTN="REPORT^PXQMAIN4"
 S ZTSAVE("PXQRECI")=0
 S ZTSAVE("VISIT")=""
 S ZTSAVE("PXQFORM")=""
 S ZTSAVE("IEN")=""
 D ^%ZTLOAD
 W !,"Task number is "_ZTSK
 Q
SAVE D:DGZTSAVE["#" ARRAY F DGI=1:1 S DGVAR=$P(DGZTSAVE,"^",DGI) Q:DGVAR']""  I '$D(ZTSAVE(DGVAR)) S ZTSAVE(DGVAR)="" S:$E(DGVAR,$L(DGVAR))="(" ZTSAVE($E(DGVAR,1,($L(DGVAR)-1)))=""
 Q
ARRAY F DGJ=1:1:$L(DGZTSAVE) I $E(DGZTSAVE,DGJ)="#" S DGZTSAVE=$E(DGZTSAVE,1,(DGJ-1))_"("_$E(DGZTSAVE,DGJ+1,$L(DGZTSAVE))
 Q
CLOSE Q:$D(ZTQUEUED)  N POP D ^%ZISC
END K ZTSK,ZTDESC,ZTRTN,ZTREQ,ZTSAVE,ZTIO,ZTDTH,ZTUCI,DGUTQND,DGVAR,VAR,DGPGM,PGM,DGZTSAVE,DGI,IO("Q"),IO("C")
 Q
DQ D @($S($D(DGPGM):DGPGM,$D(PGM):PGM,1:"CLOSE"))
 D KILL^%ZTLOAD,CLOSE
 Q
DTQ I $D(ZTSK("D")) S DGX=ZTSK("D"),%H=$P(DGX,",") D YMD^%DTC S DGX=$P(DGX,",",2),Z=X_((DGX#3600\60)/100+(DGX\3600)/100) ;Find time queued
 Q