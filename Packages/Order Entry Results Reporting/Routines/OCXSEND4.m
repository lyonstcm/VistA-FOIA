OCXSEND4	;SLC/RJS,CLA - BUILD RULE TRANSPORTER ROUTINES (Build Library Routine 0) ;2/01/01  09:56
	;;3.0;ORDER ENTRY/RESULTS REPORTING;**32,96,105,243**;Dec 17,1997;Build 242
	;;  ;;ORDER CHECK EXPERT version 1.01 released OCT 29,1998
	;
EN()	;
	;
	N R,LINE,TEXT,NOW,RUCI
	S NOW=$$NOW^OCXSEND3,RUCI=$$NETNAME^OCXSEND
	F LINE=1:1:999 S TEXT=$P($T(TEXT+LINE),";",2,999) Q:TEXT  S TEXT=$P(TEXT,";",2,999) S R(LINE,0)=$$CONV^OCXSEND3(TEXT)
	;
	M ^TMP("OCXSEND",$J,"RTN")=R
	;
	S DIE="^TMP(""OCXSEND"","_$J_",""RTN"",",XCN=0,X=$$RNAME^OCXSEND3(0,1)
	W !,X X ^%ZOSF("SAVE") K ^TMP("OCXSEND",$J,"RTN")
	;
	Q " "
	;
TEXT	;
	;;|$$RNAME^OCXSEND3(0,1)| ;SLC/RJS,CLA - OCX PACKAGE RULE TRANSPORT ROUTINE |OCXPATCH| ;|NOW|
	;;|OCXLIN2|
	;;|OCXLIN3|
	;; ;
	;;S ;
	;; ;
	;; Q
	;; ;
	;;WARN(RTN,MSG,LINES) ;
	;; ;
	;; Q:$G(OCXAUTO)
	;; ;
	;; N DASH,LINE,NLINE,PLINE
	;; ;
	;; S DASH="",$P(DASH,"-",(55-$L(MSG)-2))="-"
	;; W !!,"--------------",MSG,DASH
	;; ;
	;; W !,RTN,?10,"[|RUCI|] -> [",$$NETNAME^OCXSEND,"] Line"
	;; ;
	;; I $O(LINES($O(LINES(0)))) W "s: "
	;; E  W ": "
	;; ;
	;; S LINE=0 F  S LINE=$O(LINES(LINE)) Q:'LINE  D
	;; .W:($X>60) !,?40
	;; .S NLINE=LINE F  S PLINE=NLINE,NLINE=$O(LINES(NLINE)) Q:(NLINE-PLINE-1)
	;; .I (PLINE=LINE) W " ",LINE
	;; .E  W " ",LINE,"-",PLINE S LINE=PLINE
	;; ;
	;; W ! Q
	;; ;
	;;TEXT(RTN,LINE) ;
	;; ;
	;; N TEXT X "S TEXT=$T(+"_(+LINE)_"^"_RTN_")" Q TEXT
	;; ;
	;;HEADER ;
	;; ;
	;; W !," Created: |NOW|  at  |RUCI|"
	;; W !," Current Date: ",$$NOW,"  at  ",$$NETNAME^OCXSEND,!!
	;; S LASTFILE=0 K ^TMP("OCXRULE",$J)
	;; S ^TMP("OCXRULE",$J)=($P($H,",",2)+($H*86400)+(1*60*60))_" <- ^TMP ENTRY EXPIRATION DATE FOR ^OCXOPURG"
	;; Q
	;; ;
	;;GETFILE(FILE,RECNAME,ARRAY) ;
	;; ;
	;; N CHECK,GLNEXT,GLREF,LINES,REC,DD,FLD
	;; S REC=$$LOOKUP(FILE,RECNAME)
	;; I 'REC W !!,$$FILENAME^OCXSENDD(FILE),": ",RECNAME Q 0
	;; I (REC=-1) W !!,$$FILENAME^OCXSENDD(FILE),": ",RECNAME,"  duplicate local entries.",! Q 0
	;; I (REC=-2) W !!,$$FILENAME^OCXSENDD(FILE)," (",FILE,") local file not found." W ! Q:$$PAUSE -10 Q REC
	;; I (REC<0) W !!,$$FILENAME^OCXSENDD(FILE),": ",RECNAME,"  unknown lookup error." W ! Q:$$PAUSE -10 Q REC
	;; I (REC>0) D
	;; .S CHECK=0,LINES=0
	;; .D GETREC($$FILE^OCXSENDD(FILE,"GLOBAL NAME"),"ARRAY(",REC,.ARRAY)
	;; .S GLREF="ARRAY" F  S GLREF=$Q(@GLREF) Q:'$L(GLREF)  Q:'($E(GLREF,1,6)="ARRAY(")  K:'$L(@GLREF) @GLREF
	;; ;
	;; Q REC
	;; ;
	;;LKUPARRY(DD,KEY,ARRAY) ;
	;; ;
	;; N D0 S D0=0 F  S D0=$O(ARRAY(DD,D0)) Q:'D0  Q:($G(ARRAY(DD,D0,.01,"E"))=KEY)
	;; Q D0
	;; ;
	;;LOOKUP(FILE,KEY) ;
	;; I $O(^TMP("OCXRULE",$J,"B",FILE,KEY,0)) Q 0
	;; N RECNAM,REC,D0,CNT,SHORT S (REC,CNT)=0
	;; S GL=$$FILE^OCXSENDD(FILE,"GLOBAL NAME") Q:'$L(GL) -2 S GL=$E(GL,1,$L(GL)-1)_")"
	;; S SHORT=$E(KEY,1,30),RECNAM=SHORT D  F  S RECNAM=$O(@GL@("B",RECNAM)) Q:'$L(RECNAM)  Q:'($E(RECNAM,1,$L(SHORT))=SHORT)  D
	;; .S D0=0 F  S D0=$O(@GL@("B",RECNAM,D0)) Q:'D0  I ($P($G(@GL@(D0,0)),U,1)=KEY) S CNT=CNT+1,REC=D0_U_RECNAME
	;; Q:(CNT>1) -1
	;; S:$L($P(REC,U,2)) ^TMP("OCXRULE",$J,"A",FILE,$P(REC,U,2))=""
	;; Q +REC
	;; ;
	;;GETREC(GL,PATH,D0,REM) ;
	;; ;
	;; Q:'($P($G(@(GL_"0)")),U,2))
	;; N S1,DATA,DD
	;; S DATA="" D DIQ(GL,D0,.DATA)
	;; S DD=$O(DATA(0)) Q:'DD
	;; ;
	;; I $L($$FILE^OCXSENDD(DD,"NAME")) S PATH=PATH_""""_DD_":"_D0_""""
	;; I '$L($$FILE^OCXSENDD(DD,"NAME")) S PATH=PATH_","""_DD_":"_D0_""""
	;; M @(PATH_")")=DATA(DD,D0)
	;; ;
	;; S S1="" F  S S1=$O(@(GL_D0_","_$$SUB(S1)_")")) Q:'$L(S1)  I ($D(@(GL_D0_","_$$SUB(S1)_")"))>3) D
	;; .N D1,GLREF S GLREF=GL_D0_","_$$SUB(S1)_","
	;; .S D1=0 F  S D1=$O(@(GLREF_D1_")")) Q:'D1  D GETREC(GLREF,PATH,D1,.REM)
	;; ;
	;; Q
	;; ;
	;;SUB(X) Q:'(X=+X) """"_X_"""" Q X
	;; ;
	;;DIQ(DIC,DA,OCXARY) ;
	;; N DR,DIQ S DR=".01:99999",DIQ="OCXARY(",DIQ(0)="EN" D EN^DIQ1
	;; Q
	;; ;
	;;PAUSE() W "  Press Enter " R X:DTIME W ! Q (X[U)
	;; ;
	;;NOW() N X,Y,%DT S X="N",%DT="T" D ^%DT S Y=$$DATE^OCXSENDD(Y) S:(Y["@") Y=$P(Y,"@",1)_" at "_$P(Y,"@",2) Q Y
	;; ;
	;;$
	;1;
	;
