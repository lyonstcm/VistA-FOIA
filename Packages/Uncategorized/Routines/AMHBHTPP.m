AMHBHTPP ; IHS/CMI/LAB - behavioral health display for GUI ;
 ;;4.0;IHS BEHAVIORAL HEALTH;;MAY 14, 2010
 ;
 ;
 ;
TEST ;
 S TEST(3061010)=""
 S TEST(3061020)=""
 D TPP(.RETVAL,167,"B",.TEST)
 Q
TPP(AMHARRAY,AMHIEN,AMHPREV,AMHREVP) ;EP CALL FROM REMOTE PROC: AMHBH SUICIDE FORM DSP
 ;
 S JOB=$J,AMHGUI=1,XWBWRAP=1
 S ZTIO="",ZTQUEUED=1
 S AMHARRAY="^XTMP(""AMHTP"","_$J_")"
 S AMHTP=AMHIEN,AMHBROW=1
 S AMHPREV=$G(AMHPREV)
 I '$D(AMHREVP) D
 .S X=0 F  S X=$O(^AMHPTXP(AMHTP,41,X)) Q:X'=+X  S AMHREVP(X)=""
 K ^XTMP("AMHTP",JOB)
 S ^XTMP("AMHTPRUN",JOB)=""
 D ^XBKSET
 ;S ZTRTN="TSK^AMHBHTPP",ZTIO="",ZTDESC="AMH TP DISPLAY",ZTSAVE("AMH*")="",ZTSAVE("JOB")="",ZTDTH=$H D ^%ZTLOAD
 ;F I=1:1:60 Q:$G(^XTMP("AMHTPRUN",$J))="DONE"  H 1
 D TSK
 D KILL
 Q
 ;
TSK ;
 D ^XBKSET
 S ^XTMP("AMHTPRUN",JOB)="START"
 D GUIR^XBLM("PRINT^AMHLETPP","^XTMP(""AMHTP"",JOB)")
 S ^XTMP("AMHTP",JOB,.5)=$O(^XTMP("AMHTP",JOB,""),-1)+1
 S ^XTMP("AMHTPRUN",JOB)="DONE"
 Q
 ;
KILL ;
 K AMHCTR,AMHGUI,AMHTP,DIC,JOB,X,Y,ZTDESC,ZTDTH,ZTIO,ZTRTN,ZTSAVE,AMHPREV
 Q