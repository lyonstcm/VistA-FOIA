IBCEXTR1 ;ALB/JEH IB READY FOR EXTRACT STATUS SCREEN ;3/8/00 5:22am
 ;;2.0;INTEGRATED BILLING;**137**;21-MAR-1994
 ;Per VHA Directive 10-93-142, this routine should not be modified.
 ;
BLD ;Build list entry point
 K ^TMP("IBCERP6",$J),^TMP("IBCERP61",$J)
 N IBI,IBIFN,IBSTAT,IBREC,IBVSIT,IBCAT,IBILL,IBINS,IBPREC
 N IBEVDT,IBSTA,IBTYP,IBQUIT
 S (IBI,IBQUIT,IBIFN)=0 F  S IBI=$O(^IBA(364,"ASTAT","X",IBI)) Q:'IBI  S IBIFN=+$G(^IBA(364,IBI,0)) D
 .S IBSTAT=$$WNRBILL^IBEFUNC(IBIFN)
 .I 'IBSTAT,IBPARAM>0 Q
 .I IBSTAT Q
 .S IBREC=$G(^DGCR(399,+IBIFN,0))
 .S IBVSIT=$S($$INPAT^IBCEF(IBIFN,1)=1:"INP",1:"OPT")
 .S IBCAT=$S($$FT^IBCEF(IBIFN)=3:"INST",1:"PROF")
 .S IBILL=$$BN1^PRCAFN(IBIFN)
 .S IBINS=$P($G(^DIC(36,$$CURR^IBCEF2(IBIFN),0)),U)
 .S IBPREC=$P(^DPT($P(IBREC,U,2),0),U),IBSSN=$E($P(^DPT($P(IBREC,U,2),0),U,9),6,9)
 .S IBEVDT=$P($G(^DGCR(399,IBIFN,"U")),U) ;get statement date
 .S IBSTA=$$EXPAND^IBTRE(399,.13,$P(IBREC,U,13))
 .S IBTYP=$P(IBREC,U,24)_$P($G(^DGCR(399.1,$P(IBREC,U,25),0)),U,2)_$P(IBREC,U,26)
 .S ^TMP("IBCERP6",$J,IBSTAT,IBILL)=IBIFN_U_IBILL_U_IBVSIT_U_IBCAT_U_IBPREC_U_IBSSN_U_IBEVDT_U_IBTYP_U_IBINS_U_IBSTA
 ;
SCRN ;--screen display
 S (IBCNT,VALMCNT)=0
 I '$D(^TMP("IBCERP6",$J)) D
 .S (VALMCNT,IBCNT)=2
 .S ^TMP("IBCERP61",$J,1,0)=" "
 .S ^TMP("IBCERP61",$J,2,0)="No records trapped in a Ready for Extract status found"
 S IBSTAT="" F  S IBSTAT=$O(^TMP("IBCERP6",$J,IBSTAT)) Q:IBSTAT=""!(IBQUIT)  D
 .S IBILL="" F  S IBILL=$O(^TMP("IBCERP6",$J,IBSTAT,IBILL)) Q:IBILL=""!(IBQUIT)  S IBREC=^(IBILL) D
 ..S IBCNT=IBCNT+1
 ..S IBIFN=+$P(IBREC,U)
 ..S X=$$SETFLD^VALM1(IBCNT,"","NUMBER")
 ..S X=$$SETFLD^VALM1($P(IBREC,U,2),X,"BILL")
 ..S X=$$SETFLD^VALM1($P(IBREC,U,3),X,"VISIT")
 ..S X=$$SETFLD^VALM1($P(IBREC,U,4),X,"CAT")
 ..S X=$$SETFLD^VALM1($E($P(IBREC,U,5),1,25),X,"NAME")
 ..S X=$$SETFLD^VALM1($P(IBREC,U,6),X,"SSN")
 ..S X=$$SETFLD^VALM1($$FDATE^VALM1($P(IBREC,U,7)),X,"STAMT")
 ..S X=$$SETFLD^VALM1($P(IBREC,U,8),X,"TYPE")
 ..S X=$$SETFLD^VALM1($E($P(IBREC,U,9),1,13),X,"INS")
 ..S X=$$SETFLD^VALM1($E($P(IBREC,U,10),1,7),X,"STAT")
 ..D SET(X,IBCNT,IBIFN)
 Q
SET(X,CNT,IBIFN)  ;list manager screen setup
 S VALMCNT=VALMCNT+1
 S ^TMP("IBCERP61",$J,VALMCNT,0)=X
 S ^TMP("IBCERP61",$J,"IDX",VALMCNT,CNT)=""
 S ^TMP("IBCERP61",$J,CNT)=VALMCNT_U_IBIFN_U_IBILL_U_IBSTAT
 Q
 ;