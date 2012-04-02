AURXREF2 ; INITIALIZATION ROUTINES FOR DRIVER [ 10/27/87  8:34 AM ]
 ; EDE/10-12-87
 ;
 W !!,"Invalid entry point!",! S AURXREF("QFLG")=99
 Q
 ;
INIT ; INITIALIZATION
 S U="^"
 W !!,"RE-INDEX selected cross-references.",!
 S AURXREF("QFLG")=0
 K ^UTILITY("AURXREF",$J)
 Q
 ;
GETFILE ; GET FILE TO BE RE-XREFED
 S DIC="^DIC(",DIC(0)="AEMQ" D ^DIC K DIC
 I Y<0 S AURXREF("QFLG")=1 Q
 S AURXREF("FILE")=+Y
 S AURXREF("GBL")=^DIC(AURXREF("FILE"),0,"GL")
 Q
 ;
BLDXRT ; BUILD XREF TABLE
 F AURXREF("L")=0:0 D GETFIELD Q:AURXREF("FIELD")=""
 S:'$O(^UTILITY("AURXREF",$J,"")) AURXREF("QFLG")=1
 Q
 ;
GETFIELD ; GET FIELD TO XREF
 W !
 S AURXREF("FIELD")=""
 S DIC="^DD("_AURXREF("FILE")_",",DIC(0)="AEMQ" D ^DIC K DIC
 Q:Y<0
 S AURXREF("FIELD")=+Y
 S X=$P(^DD(AURXREF("FILE"),AURXREF("FIELD"),0),U,4)
 S AURXREF("NODE")=$P(X,";",1)
 S AURXREF("PIECE")=$P(X,";",2)
 I AURXREF("PIECE")=0 D GFRCR Q
 I AURXREF("NODE")=" " W !!,"Computed fields do not have xrefs." Q
 I $D(^DD(AURXREF("FILE"),AURXREF("FIELD"),1)),$O(^(1,0)) D XREFS Q
 W !!,"This field has no xrefs!"
 Q
 ;
GFRCR ; GET FIELD RECURSION
 S AURXREF("SAVE FILE")=AURXREF("FILE"),AURXREF("SAVE FIELD")=AURXREF("FIELD")
 F Y="AURXREF" S %RCR(Y)=""
 S AURXREF("FILE")=+$P(^DD(AURXREF("FILE"),AURXREF("FIELD"),0),U,2)
 S %RCR="RECURSE^AURXREF2" D STORLIST^%RCR
 S AURXREF("FILE")=AURXREF("SAVE FILE"),AURXREF("FIELD")=AURXREF("SAVE FIELD")
 ;ZW AURXREF
 Q
 ;
RECURSE ;
 F AURXREF("L")=0:0 D GETFIELD Q:AURXREF("FIELD")=""
 Q
 ;
XREFS ; DISPLAY XREFS FOR FIELD
 W !,"This field has the following xrefs.  Select by number:"
 S AURXREF("XREF")=0 F AURXREF("L")=0:0 S AURXREF("XREF")=$O(^DD(AURXREF("FILE"),AURXREF("FIELD"),1,AURXREF("XREF"))) Q:AURXREF("XREF")=""  D XREFS2
 F AURXREF("L")=0:0 D GETXREF Q:AURXREF("XREF")=""
 Q
 ;
XREFS2 ; DISPLAY XREFS
 S X=$P(^DD(AURXREF("FILE"),AURXREF("FIELD"),1,AURXREF("XREF"),0),U,2)
 S Y=""
 S:X="" Y="TRIGGER"
 I Y="",'$F(^DD(AURXREF("FILE"),AURXREF("FIELD"),1,AURXREF("XREF"),1),"("""_X_"""") S Y="SUB-FILE LEVEL"
 W !,AURXREF("XREF"),?10,X,?20,Y
 Q
 ;
GETXREF ; GET XREFS FROM FIELD
 W !
 S AURXREF("XREF")=""
 S DIC="^DD("_AURXREF("FILE")_","_AURXREF("FIELD")_",1,",DIC(0)="AEMQ" D ^DIC
 Q:Y<0
 S AURXREF("XREF")=+Y
 D INFOSAVE
 Q
 ;
INFOSAVE ; GET XREF/NODE/PIECE INFO AND SAVE
 S X=$P(^DD(AURXREF("FILE"),AURXREF("FIELD"),1,AURXREF("XREF"),0),U,2)
 I X="" W !!,*7,"Sorry, I don't do TRIGGERS!" Q
 I '$F(^DD(AURXREF("FILE"),AURXREF("FIELD"),1,AURXREF("XREF"),1),"("""_X_"""")  W !!,*7,"Sorry, I only do xrefs at the file level!" Q
 S ^UTILITY("AURXREF",$J,AURXREF("FILE"),AURXREF("FIELD"),AURXREF("XREF"))=X
 Q
 ;
CONFIRM ; GET USER CONFIRMATION
 W !!,"The ",$P(^DIC(AURXREF("FILE"),0),U,1)," file contains ",$P(@(AURXREF("GBL")_"0)"),U,4)," entries.  The following xrefs will be",!,"killed and reset by the specified file or sub-file, and field:",!
 S AURXREF("FILE")="" F AURXREF("L")=0:0 S AURXREF("FILE")=$O(^UTILITY("AURXREF",$J,AURXREF("FILE"))) Q:AURXREF("FILE")=""  D CONFIRM2
 R !!,"Do you want to continue (Y/N) Y//",X
 S:"Yy"'[$E(X) AURXREF("QFLG")=1
 Q
CONFIRM2 ;
 S AURXREF("FIELD")="" F AURXREF("L")=0:0 S AURXREF("FIELD")=$O(^UTILITY("AURXREF",$J,AURXREF("FILE"),AURXREF("FIELD"))) Q:AURXREF("FIELD")=""  D CONFIRM3
 Q
 ;
CONFIRM3 ;
 S AURXREF("XREF")="" F AURXREF("L")=0:0 S AURXREF("XREF")=$O(^UTILITY("AURXREF",$J,AURXREF("FILE"),AURXREF("FIELD"),AURXREF("XREF"))) Q:AURXREF("XREF")=""  D CONFIRM4
 Q
 ;
CONFIRM4 ;
 W !,AURXREF("FILE"),?15,AURXREF("FIELD"),?25,^(AURXREF("XREF"))
 Q