AMHRPTX ; IHS/CMI/LAB - CLEANUP FOR REPORT ;
 ;;4.0;IHS BEHAVIORAL HEALTH;;MAY 14, 2010
 ;
 ;
KILL ;EP
 K AMHODAT,AMHPCNT,AMHRPT,AMHSORT,AMHSRT,AMHTCW,AMHA,AMHBT,AMHBTH,AMHJOB,AMHLENG,AMHRPREP,AMHTACT,AMHTYPE,AMHCTYP
 K AMHSPROG,AMHSPROV,AMHSPVDS,AMHSPROB,AMHSTACT,AMHSCONT,ABHCOM,ABHLOC,AMHSPAT,AMHSPCOM,ABHEX,AMHSTRI,AMHANS,AMHC,AMHCNT,AMHCUT,AMHRPTC,AMHRPTI,AMHRPTP,AMHPTPA,AMHRPTST,AMHSCNT,AMHSKIP,AMHSORV,AMHSPAG,AMHLSS
 K AMHSEL,AMHQUIT,AMHRANS,AMHCRIT,AMHRI,AMHTEXT,AMHRTN,AMHBD,AMHED,AMHSD,AMHBDD,AMHEDD,AMHRTYPE,AMHHIGH,AMHVAR,AMHVAR1,AMH80E,AMH80D,AMH132E,AMH132D,AMHP,AMHPG,AMHR0,AMHRCNT,AMHRDFN,AMHACT,AMHACTC,AMHCAT,AMHCOMM,AMHCW,AMHDATE,AMHDISC
 K AMHDONE,AMHDT,AMHHD1,AMHHD2,AMHINF,AMHINFO,AMHLINE,AMHPPOV,AMHPRNM,AMHPRNT,AMHPROB,AMHPROG,AMHPROV,AMHPTOT,AMHR1325,AMHRAGE,AMHRBIN,AMHRDOB,AMHRDOBS,AMHRDT,AMHRLENG,AMHRNN,AMHRPG,AMHRPRCR,AMHRPROC,AMHRPTPA,AMHRRPT,AMHRSEX
 K AMHRSRT,AMHRSRT2,AMHRZ,AMHSEL,AMHRSRT2,AMHSU,AMHTITL,AMHTOT,AMHTRPT,AMHTTOT,AMHVLOC,AMHTEXT,AMHSRTR,AMHCHRT,AMHCLS,AMHCODE,AMHCOUNT,AMHFORM
 D ^AMHEKL
 K X,X1,X2,IO("Q"),%,Y,POP,DIRUT,ZTSK,ZTQUEUED,H,S,TS,M,ZTIO,DUOUT,DIR,DTOUT,V,Z,I,A,B,X,Y
 Q