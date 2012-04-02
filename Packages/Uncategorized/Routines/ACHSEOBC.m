ACHSEOBC ; IHS/ITSC/TPF/PMF - AUTOMATICALLY DELETE EOBR FILES AT FACILITY ;  
 ;;3.1;CONTRACT HEALTH MGMT SYSTEM;**18**;JUN 11, 2001
 ;
 U IO(0)
 W !,*7,?10,"NOT AN ENTRY POINT"
 Q
 ;
FILDEL ;EP - Delete EOBR import files.
 S ACHSI=""
FILDELA ;
 S ACHSI=$O(ACHSUFLS(ACHSI))
 G FILDELC:+ACHSI=0
 S ACHSDATE=$P(ACHSUFLS(ACHSI)," ",2)
 G FILDELA:$L(ACHSDATE)=0
 S ACHSRDAT=9999999-ACHSDATE,ACHSUFLS("C",ACHSRDAT,ACHSI)=""
 G FILDELA
 ;
FILDELC ;
 S (ACHSR,ACHSRR,ACHSDELD,ACHSCNT,ACHSDSAV)=0
FILDELC1 ;
 S ACHSR=$O(ACHSUFLS("C",ACHSR))
 G FILDELF:+ACHSR=0
FILDELC2 ;
 S ACHSRR=$O(ACHSUFLS("C",ACHSR,ACHSRR))
 G FILDELC1:+ACHSRR=0
 S ACHSCNT=ACHSCNT+1
 I ACHSCNT=3 S ACHSDELD=9999999-ACHSR
 G FILDELC2
 ;
FILDELF ;
 G FILDEND:+ACHSDELD=0
 U IO(0)
 ;ACHS*3.1*18 4.6.2010 IHS.OIT.FCJ CHANGED DEFAULT TO NO IN NXT LINE
 I '$$DIR^XBDIR("Y","Delete ALL FI EOBR FILES With Process Date BEFORE "_$$FMTE^XLFDT(ACHSDELD),"N","","","",1) G FILDEND
 S ACHSR=9999999-ACHSDELD
FILDELK1 ;
 S ACHSR=$O(ACHSUFLS("C",ACHSR))
 G FILDEND:+ACHSR=0
 S ACHSRR="",ACHSRR=$O(ACHSUFLS("C",ACHSR,ACHSRR))
 G FILDELK1:+ACHSRR=0
 I +$P(^ACHSF(DUZ(2),2),U,21)<10,$P(ACHSUFLS(ACHSRR)," ",4)>990 G FILDELK2
 G FILDELK1:$P(ACHSUFLS(ACHSRR)," ",4)'<+$P(^ACHSF(DUZ(2),2),U,21)
FILDELK2 ;
 G FILDELK1:$P(ACHSUFLS(ACHSRR)," ",4)=+$P(^ACHSF(DUZ(2),2),U,21)
 S ACHSZFN=$P(ACHSUFLS(ACHSRR)," ",1)
 I '$$DEL^%ZISH($$IM^ACHS,ACHSZFN) U IO(0) W !!?10,ACHSZFN,"  has been DELETED" K ACHSUFLS("C",ACHSR,ACHSRR),ACHSUFLS(ACHSRR)
 G FILDELK1
 ;
FILDEND ;
 Q
 ;
REPORT ;EP - Print EOBR processing summary report.
 S ACHSPG=0,ACHSZFPT="",ACHSERR=0
 D NOW^ACHS
 S IOP=ZTIO
 D ^%ZIS
 I POP S ACHSERR=1 D HOME^%ZIS Q
 U IO
 D HDR
REPORT1 ;
 S ACHSZFPT=$O(ACHSZFCT(ACHSZFPT))
 G TOT:ACHSZFPT=""
 W !?10,$P(^DIC(4,ACHSZFPT,0),U,1),?55,$J($FN(ACHSZFCT(ACHSZFPT),","),10),!
 G REPORT1
 ;
HDR ;
 S ACHSPG=ACHSPG+1
 W @IOF,ACHSTIME,!,?28,"CHS EOBR PROCESSING REPORT",?67,"PAGE ",$J(ACHSPG,3),!,?22,"for Documents Processed on: ",$$FMTE^XLFDT(ACHSEOBD),!,?40-(($L($$LOC^ACHS)+4)\2),"for ",$$LOC^ACHS,!
HDR1 ;
 W !!?20,"Facility",?60,"# EOBR's",!?10,$$REPEAT^XLFSTR("-",60),!!
 Q
 ;
TOT ;
 W !!?10,$$REPEAT^XLFSTR("=",60),!
 W:$D(ACHSZRC) !!?20,"Total For All Facilities = ",?55,$J($FN(ACHSZRC,","),10)
 D RTRN^ACHS
 W @IOF
 Q
 ;