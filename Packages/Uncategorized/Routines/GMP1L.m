GMP1L ; List Template Exporter ; 01-SEP-1995
 ;;2.0;Problem List;**3**;Aug 25, 1994
 W !,"'GMPL SELECTION GROUP BUILD' List Template..."
 S DA=$O(^SD(409.61,"B","GMPL SELECTION GROUP BUILD",0)),DIK="^SD(409.61," D ^DIK:DA
 K DO,DD S DIC(0)="L",DIC="^SD(409.61,",X="GMPL SELECTION GROUP BUILD" D FILE^DICN S VALM=+Y
 I VALM>0 D
 .S ^SD(409.61,VALM,0)="GMPL SELECTION GROUP BUILD^1^^^5^14^1^1^Problem^GMPL MENU BUILD GROUP^EDIT PROBLEM CATEGORY^1^^1"
 .S ^SD(409.61,VALM,1)="^VALM HIDDEN ACTIONS"
 .S ^SD(409.61,VALM,"ARRAY")=" ^TMP(""GMPLST"",$J)"
 .S ^SD(409.61,VALM,"COL",0)="^409.621^1^1"
 .S ^SD(409.61,VALM,"COL",1,0)="LINE^1^79"
 .S ^SD(409.61,VALM,"FNL")="D EXIT^GMPLBLDC"
 .S ^SD(409.61,VALM,"HDR")="D HDR^GMPLBLDC"
 .S ^SD(409.61,VALM,"HLP")="D HELP^GMPLBLDC"
 .S ^SD(409.61,VALM,"INIT")="D INIT^GMPLBLDC"
 .S DA=VALM,DIK="^SD(409.61," D IX1^DIK K DA,DIK
 .W "Filed."
 ;
 W !,"'GMPL SELECTION LIST BUILD' List Template..."
 S DA=$O(^SD(409.61,"B","GMPL SELECTION LIST BUILD",0)),DIK="^SD(409.61," D ^DIK:DA
 K DO,DD S DIC(0)="L",DIC="^SD(409.61,",X="GMPL SELECTION LIST BUILD" D FILE^DICN S VALM=+Y
 I VALM>0 D
 .S ^SD(409.61,VALM,0)="GMPL SELECTION LIST BUILD^1^^80^5^14^1^1^Problem Group^GMPL MENU BUILD LIST^BUILD PROBLEM SELECTION LIST^1^^1"
 .S ^SD(409.61,VALM,1)="^VALM HIDDEN ACTIONS"
 .S ^SD(409.61,VALM,"ARRAY")=" ^TMP(""GMPLST"",$J)"
 .S ^SD(409.61,VALM,"COL",0)="^409.621^1^1"
 .S ^SD(409.61,VALM,"COL",1,0)="LINE^1^79"
 .S ^SD(409.61,VALM,"FNL")="D EXIT^GMPLBLD"
 .S ^SD(409.61,VALM,"HDR")="D HDR^GMPLBLD"
 .S ^SD(409.61,VALM,"HLP")="D HELP^GMPLBLD"
 .S ^SD(409.61,VALM,"INIT")="D INIT^GMPLBLD"
 .S DA=VALM,DIK="^SD(409.61," D IX1^DIK K DA,DIK
 .W "Filed."
 ;
 W !,"'GMPL USER PREFS' List Template..."
 S DA=$O(^SD(409.61,"B","GMPL USER PREFS",0)),DIK="^SD(409.61," D ^DIK:DA
 K DO,DD S DIC(0)="L",DIC="^SD(409.61,",X="GMPL USER PREFS" D FILE^DICN S VALM=+Y
 I VALM>0 D
 .S ^SD(409.61,VALM,0)="GMPL USER PREFS^1^^^5^14^1^1^Item^GMPL USER PREFS^PROBLEM LIST PREFERRED VIEW^1^^1"
 .S ^SD(409.61,VALM,1)="^GMPL HIDDEN MENU"
 .S ^SD(409.61,VALM,"ARRAY")=" ^TMP(""GMPLIST"",$J)"
 .S ^SD(409.61,VALM,"COL",0)="^409.621^3^3"
 .S ^SD(409.61,VALM,"COL",1,0)="NUMBER^1^3"
 .S ^SD(409.61,VALM,"COL",2,0)="SERVICE^5^35^Clinic"
 .S ^SD(409.61,VALM,"COL",3,0)="ACCEPT^45^20^Included in View"
 .S ^SD(409.61,VALM,"FNL")="D CLEAN^GMPLPREF"
 .S ^SD(409.61,VALM,"HDR")="D HDR^GMPLPREF"
 .S ^SD(409.61,VALM,"HLP")="D HELP^GMPLPREF"
 .S ^SD(409.61,VALM,"INIT")="D INIT^GMPLPREF"
 .S DA=VALM,DIK="^SD(409.61," D IX1^DIK K DA,DIK
 .W "Filed."
 ;
 K DIC,DIK,VALM,X,DA Q