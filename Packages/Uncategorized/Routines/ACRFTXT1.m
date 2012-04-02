ACRFTXT1 ;IHS/OIRM/DSD/THL,AEF - EDIT TRANSACTION TYPE USER ACCESS; [ 09/26/2005   9:44 AM ]
 ;;2.1;ADMIN RESOURCE MGT SYSTEM;**19**;NOV 05, 2001
 ;;ROUTINE TO EDIT TRANSACTION TYPE USER ACCESS
EN F  D EN1 Q:'$D(ACRDUZ)
EXIT K ACRX,ACRTXNAM,ACRTX,ACRTXPFX,ACRQUIT,ACRDOCDA,ACRTXDOC,ACRDATA,ACRDUZ,ACRJ,ACRI,ACRQK,ACRCNT,ACRLI,ACRUSER,ACR,ACRQK1,ACRZ,ACRMAX
 Q
EN1 W @IOF
 W !?22,"EDIT USER TRANSACTION ACCESS"
 W !?22,"============================"
 S DIC="^VA(200,"
 S DIC(0)="AEMQZ"
 S DIC("A")="EMPLOYEE............: "
 W !
 D DIC^ACRFDIC
 I $E(X)["U"!(+Y<1) S ACRQUIT="" K ACRDUZ Q
 S ACRDUZ=+Y
 ; S ACRUSER=Y(0,0)                                 ;ACR*2.1*19.02 IM16848
 ; S ACRUSER=$P(ACRUSER,",",2)_" "_$P(ACRUSER,",")  ;ACR*2.1*19.02  IM16848
 S ACRUSER=$$NAME3^ACRFUTL1(+Y)                     ;ACR*2.1*19.02 IM16848
 F  D DISPLAY Q:$D(ACRQUIT)!$D(ACROUT)
 K ACRQUIT
 Q
DISPLAY W @IOF
 W !,"Transaction access for: ",@ACRON,ACRUSER,@ACROF
 W !!,"NO."
 W ?5,"TYPE OF TRANSACTION"
 W ?40,"NO."
 W ?45,"TYPE OF TRANSACTION"
 W !,"---"
 W ?5,"-----------------------------"
 W ?40,"---"
 W ?45,"-----------------------------"
 S (ACRTXDO,ACRJ)=0
 F  S ACRTXDO=$O(^ACRTXTYP("DO",ACRTXDO)) Q:'ACRTXDO  D
 .S ACRY=0
 .F  S ACRY=$O(^ACRTXTYP("DO",ACRTXDO,ACRY)) Q:'ACRY  D
 ..S ACRJ=ACRJ+1
 ..S ACRX=$P(^ACRTXTYP(ACRY,0),U)
 ..S ACRDATA(ACRJ)=ACRY_U_ACRX
 S ACRMAX=ACRJ\2+(ACRJ#2)
 S ACRJ=0
 F  S ACRJ=$O(ACRDATA(ACRJ)) Q:'ACRJ!(ACRJ>(ACRMAX))  D
 .S ACRY=$P(ACRDATA(ACRJ),U)
 .S ACRX=$P(ACRDATA(ACRJ),U,2)
 .W !,$J(ACRJ,2)_")"
 .W ?$X+2,ACRX
 .W ?35
 .D ACRK
 .S ACRZ(ACRJ)=ACRY
 .D D1:$D(ACRDATA(ACRJ+ACRMAX))
 S ACRJ=$S('ACRJ:ACRMAX,$D(ACRDATA(ACRJ-1+ACRMAX)):ACRJ+ACRMAX,1:ACRJ+ACRMAX-1)
 W:ACRJ#2=1 !
 W:ACRJ#2=0 ?40
 W $J(ACRJ,2),")  All data types"
DISP1 W !!?10,"'<==' indicates user already has access to the transaction."
 S DIR(0)="SO^1:Add TRANSACTION TYPES 1 thru 10;2:Add OTHER TYPES;3:Delete TRANSACTION TYPE(S)^K:X'?1N!(X<1)!(X>3) X"
 D DIR^ACRFDIC
 Q:$D(ACRQUIT)!$D(ACROUT)
 K ACRDR
 I X=1 S ACRJ=11 D ALL Q
 I X=3 S ACRDR=".01///@"
 S DIR(0)="LO^1:"_(ACRJ)
 S DIR("A")="Select transaction type(s) ==> "
 W !
 D DIR^ACRFDIC
 Q:$D(ACRQUIT)!$D(ACROUT)
 S ACRQK=Y(0)
 S:$E(ACRQK,$L(ACRQK))="," ACRQK=$E(ACRQK,1,$L(ACRQK)-1)
 S ACRQK=$P(ACRQK,",20")
 I ACRQK["," D LOOP Q
 I ACRQK=ACRJ D ALL Q
 D SET2
 Q
D1 S ACRX=$P(ACRDATA(ACRJ+ACRMAX),U,2)
 S ACRY=$P(ACRDATA(ACRJ+ACRMAX),U)
 W ?40,$J(ACRJ+ACRMAX,2),")"
 W ?$X+2,ACRX
 W ?76
 D ACRK
 S ACRZ(ACRJ+ACRMAX)=ACRY
 Q
LOOP S:ACRQK[",20" ACRQK=$P(ACRQK,",20")
 S ACRCNT=$L(ACRQK,",")
 S ACRQK1=ACRQK
 W !
 D:$E($G(IOST),1,2)="C-" WAIT^DICD
 W !
 F ACRLI=1:1:ACRCNT S ACRQK=$P(ACRQK1,",",ACRLI) D SET2
 Q
SLT1 S ACRY=0
 F  S ACRY=$O(^ACRTXTYP("DO",ACR,ACRY)) Q:'ACRY  D
 .S ACRJ=ACRJ+1
 .S ACRX=$P(^ACRTXTYP(ACRY,0),U)
 .W:ACRJ#2=1 !
 .W:ACRJ#2=0 ?40
 .W $J(ACRJ,2)_")"
 .W ?$X+2,ACRX
 .W ?35
 .D ACRK
 .S ACRZ(ACRJ)=ACRY
 Q
SET2 S (ACRTXDA,DA(1))=ACRZ(ACRQK)
 S (X,DINUM)=ACRDUZ
 S DIC="^ACRTXTYP("_ACRTXDA_",""ACCESS"","
 S DIC(0)="L"
 I '$D(^ACRTXTYP(ACRTXDA,"ACCESS",0)) S ^(0)="^9002194.01P^^"
 I '$D(ACRDR) D FILE^ACRFDIC Q
 S DA=ACRDUZ
 S DIE="^ACRTXTYP("_ACRTXDA_",""ACCESS"","
 S DR=ACRDR
 D DIE^ACRFDIC
 Q
ALL F ACRQK=1:1:(ACRJ-1) D SET2
 Q
ACRK I $D(^ACRTXTYP(ACRY,"ACCESS","B",ACRDUZ)) W "<=="
 Q