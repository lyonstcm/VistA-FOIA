BCHRC9P ; IHS/TUCSON/LAB - = print all visit report ;  [ 04/02/01  10:14 AM ]
 ;;1.0;IHS RPMS CHR SYSTEM;**7,11,12,16**;OCT 28, 1996
START ;
 D NOW^%DTC S Y=X D DD^%DT S BCHDT=Y
 K BCHQUIT S BCHPG=0
 S Y=BCHBD D DD^%DT S BCHBDD=Y S Y=BCHED D DD^%DT S BCHEDD=Y
 I '$D(^XTMP("BCHRC9",BCHJOB,BCHBTH)) W !!,"NO DATA TO REPORT",!! G DONE
TOTAL ;
 D @("HEAD"_(2-($E(IOST,1,2)="C-")))
 ;
 I $Y>(IOSL-4) D HEAD G:$D(BCHQUIT) DONE
 W !,"TOTAL" S J=25 F I=1,2 S X=$P(^XTMP("BCHRC9",BCHJOB,BCHBT,"TOTAL"),U,I) W ?J,$J($FN(X,",",0),10) S J=J+11
 F I=3:1:5 S X=$P(^XTMP("BCHRC9",BCHJOB,BCHBT,"TOTAL"),U,I),X=X/60 W ?J,$J($FN(X,",",0),10) S J=J+11
 W !
PROV ;
 S BCHPROV="" F  S BCHPROV=$O(^XTMP("BCHRC9",BCHJOB,BCHBT,"PROV",BCHPROV)) Q:BCHPROV=""!($D(BCHQUIT))  D
 .I $Y>(IOSL-4) D HEAD Q:$D(BCHQUIT)
 .W !,BCHPROV S J=25 F I=1,2 S X=$P(^XTMP("BCHRC9",BCHJOB,BCHBT,"PROV",BCHPROV),U,I) W ?J,$J($FN(X,",",0),10) S J=J+11
 .F I=3:1:5 S X=$P(^XTMP("BCHRC9",BCHJOB,BCHBT,"PROV",BCHPROV),U,I),X=X/60 W ?J,$J($FN(X,",",0),10) S J=J+11
 .Q
 .Q
DONE ;
 D DONE^BCHUTIL1
 K ^XTMP("BCHRC9",BCHJOB,BCHBTH),BCHJOB,BCHBTH
 Q
HEAD ;
 I $E(IOST)="C",IO=IO(0) W ! S DIR(0)="EO" D ^DIR K DIR I Y=0!(Y="^")!($D(DTOUT)) S BCHQUIT="" Q
HEAD1 ; if terminal
 W:$D(IOF) @IOF
HEAD2 ; if printer
 S BCHPG=BCHPG+1
 W !,$P(^VA(200,DUZ,0),U,2),?58,BCHDT,?72,"Page ",BCHPG,!
 W $$CTR^BCHRLU($$LOC^BCHRLU),!
 W !?20,"**********  CHR REPORT NO. 9  **********"
 W !!?28,"DATA SUMMARY BY PROVIDER"
 S BCHPROGN=$S(BCHPRG:$P(^BCHTPROG(BCHPRG,0),U)_" ("_$P(^(0),U,5)_")",1:"ALL"),X=$L(BCHPROGN)+10
 W !?((80-X)/2),"PROGRAM:  ",BCHPROGN
 W !?17,"REPORT DATES:  ",BCHBDD,"  TO  ",BCHEDD,!
 W !,"**Note:  S&T HRS stands for Service and Travel Hours"
 W !!?25,"TOT NUM OF",?36,"    NUMBER",?47,"   S&T HRS",?58,"   S&T HRS",?69,"   S&T HRS"
 W !,"PROVIDER",?25,"ACTIVITIES",?36,"    SERVED",?47,"  ALL SRVS",?58,"   NON-ADM",?69,"   ADM SRV"
 W !,$TR($J(" ",80)," ","-")
 Q