BGOIN004 ; IHS/MSC/DKM - BGO*1.1*4 ;04-Feb-2008 10:54;DKM
 ;;1.1;BGO COMPONENTS;**4**;Sep 18, 2007
EC Q
 ; Preinit
PRE Q
 ; Postinit
POST N OPT,VER,FDA,PID,IEN,X
 D BMES^XPDUTL("Disabling BGO ENABLE CHARGEMASTER ENTRY menu...")
 S OPT=$$FIND1^DIC(19,,"X","BGO ENABLE CHARGEMASTER ENTRY")
 I OPT D
 .N FDA
 .S FDA(19,OPT_",",2)="This option is not yet implemented"
 .S FDA(19,OPT_",",3)="BGOZ OUT OF ORDER"
 .D UPDATE^DIE(,"FDA")
 D BMES^XPDUTL("Updating version numbers...")
 F VER=0:1 S X=$P($T(VER+VER),";;",2) Q:'$L(X)  D
 .S PID=$$PRGID^CIAVMCFG($P(X,";"))
 .S:PID FDA(19930.2,PID_",",2)=$P(X,";",2)
 D:$D(FDA) FILE^DIE(,"FDA")
 Q
VER ;;FILE:IHSBGOVCDATE.OCX;1.1.0.60
 ;;FILE:IHSBGOCONTAINER.OCX;1.2.0.17
 ;;IHSBGOCHIEFCOMPLAINT.BGOCC;1.1.0.302
 ;;IHSBGOPROBLEM.BGOPROBLEM;1.1.0.359
 ;;IHSBGOIMMUNIZATION.BGOIMM;1.1.0.613
 ;;IHSBGOEXAMS.BGOEXAMS;1.1.0.335
 ;;IHSBGOHEALTHFACTORS.BGOHF;1.1.0.270
 ;;IHSBGOITEMS.BGOITEMS;1.1.0.334
 ;;IHSBGOPROCEDURESVIEWER.BGOPROCVIEW;1.1.0.236
 ;;IHSBGOREPHISTORY.IHSBGOREPHISTCTRL;1.1.0.414
 ;;IHSBGOSKINTEST.IHSBGOSK;1.1.0.615
 ;;IHSBGOVCPT.BGOVCPT;1.1.0.288
 ;;IHSBGOVPOV.BGOVPOV;1.1.0.292
 ;;IHSBGOTRIAGESUMMARY.BGOTRIAGESUMMARY;1.1.0.150
 ;;IHSBGOPOVHISTORY.BGOPOVHISTORY;1.1.0.199
 ;;IHSBGOICDPICKLIST.ICDPICKLIST;1.1.0.245
 ;;IHSBGOPATIENTED.BGOPATED;1.1.0.465
 ;;IHSBGOEM.BGOEMCTRL;1.1.0.202
 ;;IHSBGOTRIAGE.BGOTRIAGE;1.2.0.1
 Q