AUPNPAT ;IHS/OHPRD/EDE - POST SELECTION SETS FOR PATIENT LOOKUP ; 24-MAY-1993
 ;;1.0;PCE PATIENT CARE ENCOUNTER;;Aug 12, 1996
 ;;93.2;IHS PATIENT DICTIONARIES.;;JUL 01, 1993
 ;
 ; This routine sets standard patient variables
 ;
START ;
 S:$D(X) AUPNPATX=X
 S AUPNPAT=+Y
 S AUPNSEX=$P(^DPT(AUPNPAT,0),U,2),AUPNDOB=$P(^(0),U,3),AUPNDOD="" S:$D(^(.35)) AUPNDOD=$P(^(.35),U,1)
 S X2=AUPNDOB,X1=$S('AUPNDOD:DT,AUPNDOD:AUPNDOD,1:DT) D ^%DTC S AUPNDAYS=X K X,X1,X2
 S:$D(AUPNPATX) X=AUPNPATX
 K %T,%Y,AUPNPATX
 Q
 ;
KILL ; KILL VARIABLES SET BY THIS ROUTINE
 K AUPNPAT,AUPNSEX,AUPNDOB,AUPNDOD,AUPNDAYS
 Q
HRN(X1,X2) ;
 Q 1
 ;
