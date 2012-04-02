ZIBRNSPC ; IHS/ADC/GTH - NAMESPACE PREVIOUSLY WRITTEN ROUTINES ; [ 10/29/2002   7:42 AM ]
 ;;3.0;IHS/VA UTILITIES;**9**;FEB 07, 1997
 ; XB*3*9 IHS/SET/GTH XB*3*9 10/29/2002 Cache' mods.
 ;
INIT ;
 KILL (%)
 D ^XBKVAR
 S DTIME=300
 KILL %,DISYS,%H,X,^UTILITY($J),^TMP("ZIBRNSPC",$J)
 S IOP=$I
 D ^%ZIS
START ;
 W "Routine Namespace Converter",!
 S ZIBRQUIT=0
 D SETUP
 G:ZIBRQUIT EXIT
 ;S ZIBRRTN="";IHS/SET/GTH XB*3*9 10/29/2002
 S ZIBRRTN=0 ;IHS/SET/GTH XB*3*9 10/29/2002
 F ZIBRQ=0:0 S ZIBRRTN=$O(^UTILITY($J,ZIBRRTN)) Q:ZIBRRTN=""  W !!,"-- ",ZIBRRTN," --",!! D RLOAD,RFIX,RSAVE,RNDX
EXIT ;
 W !!,"Done.",!
 KILL ^UTILITY($J),^TMP("ZIBRNSPC",$J),DUOUT,DTOUT,IOP
 KILL ZIBRANS,ZIBRCAND,ZIBRCH,ZIBRCMDT,ZIBRCPOS,ZIBRDEV,ZIBRFLI,ZIBRI,ZIBRJ,ZIBRL,ZIBRLINE,ZIBROBJ,ZIBROUTP,ZIBRPART,ZIBRPLEV,ZIBRPN,ZIBRPRFX,ZIBRQ,ZIBRQUIT,ZIBRRTN,ZIBRT,ZIBRV,ZIBRW,ZIBRXC
 Q
 ;
SETUP ; INITIALIZE UTILITY
 F ZIBRT="EXC","PEXC" F ZIBRI=0:1 S ZIBRL=$T(@ZIBRT+ZIBRI),ZIBRL=$P(ZIBRL,";;",2,255) Q:ZIBRL=""  F ZIBRJ=1:1 S ZIBRW=$P(ZIBRL,"^",ZIBRJ) Q:ZIBRW=""  S ^TMP("ZIBRNSPC",$J,ZIBRT,ZIBRW)=""
PLOOP ;
 R "Package prefix (1-5 characters): ",ZIBRPRFX:DTIME
 S:'$T ZIBRPRFX="^"
 I "^"'[ZIBRPRFX I $L(ZIBRPRFX)>5!(ZIBRPRFX'?1.5U) W *7," -- Invalid prefix",! G PLOOP
 W !
 I "^"[ZIBRPRFX S ZIBRQUIT=1 Q
 W !,"Enter any variables to be treated as external references --",!,"not to be namespaced -- in the form  NAME1,NAME2,...",!
 F ZIBRQ=0:0 R " Externals: ",ZIBRL:DTIME,! S:'$T ZIBRL="^" Q:"^"[ZIBRL  D:ZIBRL["?" SHEXT I ZIBRL]"" F ZIBRI=1:1 S ZIBRW=$P(ZIBRL,",",ZIBRI) Q:ZIBRW=""  S ^TMP("ZIBRNSPC",$J,"EXC",ZIBRW)="" W "  ",ZIBRW,!
 I ZIBRL["^" S ZIBRQUIT=1 Q
 X ^%ZOSF("RSEL")
 I $O(^UTILITY($J,""))="" S ZIBRQUIT=1
 Q
 ;
SHEXT ;
 W !?2,"Currently defined externals:",!
 S ZIBRW=""
 F ZIBRQ=0:0 S W=$O(^TMP("ZIBRNSPC",$J,"EXC",ZIBRW)) Q:ZIBRW=""  W ?3,ZIBRW,!
 W !
 S ZIBRL=""
 Q
 ;
EXC ;;X^Y^DIE^DIC^DT^U^DUZ^DTIME^ZTSK^ZTDESC^ZTSAVE^ZTLOAD^ZTRTN^ZTIO^ZTDTH
 ;;
PEXC ;;IO^D^XB^Z
 ;;
 ;
RLOAD ; LOAD ROUTINE INTO GLOBAL
 W "Beginning routine load ... "
 KILL ^TMP("ZIBRNSPC",$J,"T"),^("K")
 S ZIBRXC=$E($T(RLOADX),10,255)
 X ZIBRXC
 W " completed.",!
 Q
 ;
RLOADX ;;S ^TMP("ZIBRNSPC",$J,"T",0)=ZIBRRTN ZL @ZIBRRTN F ZIBRI=1:1 S ZIBRL=$T(+ZIBRI) Q:ZIBRL=""  S ^(ZIBRI)=ZIBRL
 ;
RSAVE ; SAVE GLOBAL TEXT AS ROUTINE
 W "Beginning routine save ... "
 S ZIBRXC=$P($T(RSAVEX),"RSAVEX ",2)
 X ZIBRXC
 W " completed.",!
 Q
 ;
 ; S ZIBRRTN=^TMP("ZIBRNSPC",$J,"T",0) X "ZR  X ""F ZIBRI=1:1 Q:'$D(^(ZIBRI))  ZI ^(ZIBRI)"" ZS @ZIBRRTN"  ; IHS/SET/GTH XB*3*9 10/29/2002
RSAVEX S ZIBRRTN=^TMP("ZIBRNSPC",$J,"T",0) ZR  X "F ZIBRI=1:1 Q:'$D(^(ZIBRI))  ZI ^(ZIBRI)" ZS @ZIBRRTN
 ;
RNDX ; PRINT INDEX OF ROUTINE CONVERSION
 KILL %ZIS,IOP
 S %ZIS("A")="Enter device for auxiliary listing of variable changes",%ZIS("B")=""
 D ^%ZIS
 S ZIBRDEV=$S($D(DTOUT)!$D(DUOUT):"^",IO=IO(0):0,1:IO)
 Q:ZIBRDEV["^"
 D RNDXP
 I ZIBRDEV U ZIBRDEV D RNDXP D ^%ZISC
 Q
 ;
RNDXP ;
 S ZIBRV=" "
 F ZIBRI=0:1 S:ZIBRI=4 ZIBRI=0 W:ZIBRI=0 ! S ZIBRV=$O(^TMP("ZIBRNSPC",$J,"V",ZIBRV)) Q:ZIBRV=""  W ?(19*ZIBRI),$J(ZIBRV,8),">",^(ZIBRV)
 W !
 Q
 ;
RFIX ; FIX ROUTINE LINES STORED IN GLOBAL
 F ZIBRFLI=1:1 Q:'$D(^TMP("ZIBRNSPC",$J,"T",ZIBRFLI))  S ZIBRLINE=^(ZIBRFLI) D LSCAN S ^TMP("ZIBRNSPC",$J,"T",ZIBRFLI)=ZIBROUTP
 W "Line modification completed.",!
 Q
 ;
LSCAN ; SCAN LINE AND REPLACE VARIABLES
 S ZIBRCPOS=$F(ZIBRLINE," ")-1,ZIBRCH=" ",ZIBROUTP=$E(ZIBRLINE,1,ZIBRCPOS-1)
 F ZIBRQ=0:0 Q:ZIBRCH=""  D COPY1,CMD
 Q
 ;
CMD ;
 I ZIBRCH=";" S ZIBROUTP=ZIBROUTP_$E(ZIBRLINE,ZIBRCPOS,255),ZIBRCPOS=$L(ZIBRLINE)+1,ZIBRCH="" Q
 S ZIBRCMDT=ZIBRCH
 F ZIBRQ=0:0 Q:": "[ZIBRCH  D COPY1
 D:ZIBRCH=":" EXPR
 Q:ZIBRCH=""
 D COPY1
 I ZIBRCH'=" " D ARGS
 Q
 ;
COPY1 ;
 S ZIBROUTP=ZIBROUTP_ZIBRCH
 D ADVPOS
 Q
 ;
ADDOBJ ;
 S ZIBROBJ=ZIBROBJ_ZIBRCH
 D ADVPOS
 Q
 ;
ADVPOS ;
 S ZIBRCPOS=ZIBRCPOS+1,ZIBRCH=$E(ZIBRLINE,ZIBRCPOS)
 Q
 ;
EXPR ;
 F ZIBRQ=0:0 Q:" "[ZIBRCH  D COPYOBJ
 Q
 ;
COPYOBJ ; COPY AN OBJECT, CHECKING FOR VARIABLES
 I ZIBRCH="""" D QSTR Q
 I ZIBRCH'?1AN,"%^$"'[ZIBRCH D COPY1 Q
 S ZIBROBJ=""
 F ZIBRQ=0:0 D ADDOBJ Q:ZIBRCH'?1AN
 D:$E(ZIBROBJ)?1A TSTOBJ
 S ZIBROUTP=ZIBROUTP_ZIBROBJ
 Q
 ;
QSTR ; COPY QUOTED STRING (INCLUDED DOUBLED QUOTES)
 F ZIBRQ=0:0 D COPY1 Q:""""[ZIBRCH
 D COPY1
 G:ZIBRCH="""" QSTR
 Q
 ;
ARGS ; COPY ARGUMENTS -- 'DO' AND 'GO' SPECIAL CASES
 I "GD"'[ZIBRCMDT D EXPR Q
 F ZIBRQ=0:0 Q:" "[ZIBRCH  D DGARG D:ZIBRCH=":" CPYTCOM
 Q
 ;
DGARG ; PROCESS DO/GO ARGUMENTS
 I ZIBRCH="@" D CPYTCOM Q
 F ZIBRQ=0:0 Q:",: "[ZIBRCH  D COPY1
 D:ZIBRCH="," COPY1
 Q
 ;
CPYTCOM ; COPIES OBJECTS THRU ZERO-LEVEL COMMA
 S ZIBRPLEV=0
 F ZIBRQ=0:0 D CPYTKN Q:" "[ZIBRCH  Q:ZIBRCH=","&(ZIBRPLEV=0)
 D:ZIBRCH="," COPY1
 Q
 ;
CPYTKN ; COPIES A TOKEN, MODIFYING PARENTHESIS LEVEL
 I ZIBRCH="(" S ZIBRPLEV=ZIBRPLEV+1 D COPY1 Q
 I ZIBRCH=")" S ZIBRPLEV=ZIBRPLEV-1 D COPY1 Q
 D COPYOBJ
 Q
 ;
TSTOBJ ; CONDITIONALLY REPLACES A VARIABLE NAME
 Q:$E(ZIBROBJ,1,$L(ZIBRPRFX))=ZIBRPRFX
 Q:$D(^TMP("ZIBRNSPC",$J,"EXC",ZIBROBJ))
 I $D(^TMP("ZIBRNSPC",$J,"V",ZIBROBJ)) S ZIBROBJ=^(ZIBROBJ) Q
 D CHKPART
 I ZIBRPART D VERPART Q:'ZIBRPART
 S ZIBRCAND=ZIBRPRFX_ZIBROBJ
 D VERCAND
 S:ZIBRCAND="^" ZIBRCAND=ZIBROBJ
 S ^TMP("ZIBRNSPC",$J,"V",ZIBROBJ)=ZIBRCAND
 S ^TMP("ZIBRNSPC",$J,"NV",ZIBRCAND)=ZIBROBJ
 S ZIBROBJ=ZIBRCAND
 Q
 ;
CHKPART ; VERIFY MATCH WITH EXCLUSION PARTIAL NAME LIST
 S ZIBRPART=0,ZIBRPN=""
 F ZIBRQ=0:0 S ZIBRPN=$O(^TMP("ZIBRNSPC",$J,"PEXC",ZIBRPN)) Q:ZIBRPN=""  I $E(ZIBROBJ,1,$L(ZIBRPN))=ZIBRPN S ZIBRPART=1 Q
 Q
 ;
VERPART ; MANAGE PARTIAL MATCH
 W "'",ZIBROBJ,"' begins with '",ZIBRPN,"'",!
 R "Do you wish to treat it as an external reference? YES// ",ZIBRANS:DTIME,!
 S:'$T ZIBRANS="Y"
 S ZIBRANS=$E(ZIBRANS_"Y")
 I ZIBRANS="?" W " Usage: ",ZIBRLINE,! G VERPART
 S:ZIBRANS?1L ZIBRANS=$C($A(ZIBRANS)-32)
 S:ZIBRANS="Y" ZIBRPART=0,^TMP("ZIBRNSPC",$J,"EXC",ZIBROBJ)=""
 Q
 ;
VERCAND ; MANAGE AUTO CANDIDATE SELECTION
 I $L(ZIBRCAND)>8 W "'",ZIBRCAND,"' cannot be used for '",ZIBROBJ,"' due to its length.",! D GETALT G VERCAND
 I $D(^TMP("ZIBRNSPC",$J,"NV",ZIBRCAND)),^(ZIBRCAND)'=ZIBROBJ W "'",ZIBRCAND,"' cannot be used for '",ZIBROBJ,"'; used for '",^(ZIBRCAND),"'",! D GETALT G VERCAND
 Q
 ;
GETALT ; GET ALTERNATE FOR PROPOSED CANDIDATE REPLACEMENT NAME
 R "Please supply an alternative: ",ZIBRCAND:DTIME
 S:'$T ZIBRCAND="^"
 Q:ZIBRCAND="^"
 I ZIBRCAND="?" W " Usage: ",ZIBRLINE,! G GETALT
 I $E(ZIBRCAND,1,$L(ZIBRPRFX))=ZIBRPRFX W ! Q
 W *7," -- does not begin with '",ZIBRPRFX,"'",!
 R "Are you sure you want a non-namespaced variable? N// ",ZIBRANS:DTIME,!
 S:'$T ZIBRANS="N"
 S ZIBRANS=$E(ZIBRANS_"N")
 I ZIBRANS?1L S ZIBRANS=$C($A(ZIBRANS)-32)
 I ZIBRANS="Y" W ! Q
 G GETALT
 ;