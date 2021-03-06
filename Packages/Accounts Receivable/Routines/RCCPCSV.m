RCCPCSV  ;WASH-ISC@ALTOONA,PA/LDB-Receive and Process CCPC messages ;1/6/97  11:36 AM
V ;;4.5;Accounts Receivable;**34,70,87**;Mar 20, 1995
 ;;Per VHA Directive 10-93-142, this routine should not be modified.
 ;
EN ;INPUT FROM MESSAGE
RREC ;READ INCOMING MESSAGE
 N DAT,DEB,END,ERR,ERROR,EVN,KEY,LABEL,LN,MSG,P,RCMSG,RCTR,RCX,RCX1,RE,SBAL,STOT,TR,TR0,TR1,TXT
 K ^TMP($J)
 S (LN,MSG,RCX,RE)=0
 S TXT=0 F  X XMREC Q:XMER<0!(XMRG="")  S TXT=TXT+1,^TMP($J,"MSG",TXT)=XMRG
 S DA(1)=""
 S TXT=1 F  S TXT=$O(^TMP($J,"MSG",TXT)) Q:'TXT  D
 .S:^TMP($J,"MSG",TXT)?1"PA^".E DA(1)=4 S:^TMP($J,"MSG",TXT)?1"IS".E DA(1)=3
 .I $G(XMZ)=""!('DA(1)) Q
 .S RCX=RCX+1
 .I "PAISADID"[$E(^TMP($J,"MSG",TXT),1,2) S ^RCT(349.1,DA(1),5,+$G(XMZ)_RCX,0)=$P(^TMP($J,"MSG",TXT),"^",1,3)
 K DA(1)
 D SEG,KILL^XM
 I $O(^TMP($J,"ERR",0)) D
 .S XMSUB="CCPC ERROR MESSAGE TO STATION"
 .S XMDUZ="AR PACKAGE"
 .S XMTEXT="^TMP($J,"_"""ERR"","
 .I $O(^XMB(3.8,"B","RCCPC STATEMENTS",0)) S XMY("G.RCCPC STATEMENTS")=""
 .D ^XMD
 .K ^TMP($J)
 .D:$G(RE)="R" ^RCCPCML
 E  S XMZ=XQMSG,XMSER="S."_XQSOP D REMSBMSG^XMA1C
 Q
 ;
SEG S RCMSG=1 S RCMSG=$O(^TMP($J,"MSG",RCMSG)) D
 .S RCTR=^TMP($J,"MSG",RCMSG)
 .S LABEL=$S(($P(RCTR,"^")]"")&($T(@($P(RCTR,"^")))]""):$P(RCTR,"^"),1:"ERROR")
 .D @(LABEL)
 Q
 ;
ERROR ;SEND ERROR MESSAGE TO MAIL GROUP
 ;
 S ERR="CCPC ERROR - CANNOT READ MESSAGE FROM CCPC" D ERRMSG
 S ERR="An error has occurred in reading a message from the CCPC."
 D ERRMSG
 S ERR="Please contact your IRM for assistance."
 D ERRMSG
 S ERR="The MESSAGE WAS AS FOLLOWS:"
 D ERRMSG
 S ERR=^TMP($J,"MSG",RCMSG)
 D ERRMSG
 Q
 ;
IS ;INVALID STATEMENT
 D IS^RCCPCSV1
 Q
 ;
PA ;STATEMENT ACKNOWLEDGEMENT
 D PA^RCCPCSV1
 Q
 ;
IT ;INVALID TRANSMISSION
 D IT^RCCPCSV1
 Q
 ;
ERRMSG ;ERROR MESSAGE
 S LN=LN+1,^TMP($J,"ERR",LN)=ERR
 Q
