LBRYCK0 ;ISC2/DJM-LIBRARY SERIALS CHECK-IN ;[ 07/09/97  6:37 PM ]
 ;;2.5;Library;**2,13**;Mar 11, 1996
CHECK ;
FORWARD S E=0 G:$L(X)>1 FWD S:$D(A(E1+1)) (E0,E1)=E1+1 G FWD1
FWD S X1=+$E(X,2,99) Q:X1'>0!'($D(A(X1)))  Q:$E(X,1)="B"&(X1'<E0)  Q:$E(X,1)="F"&(X1'>E0)  S E0=$S($D(A(X1)):X1,$D(A(E1+1)):E1+1,1:E0) S:X1>0&($D(A(X1))) E1=X1
FWD1 F I=1:1:4 Q:'$D(A(E1+1))  S E1=E1+1
 Q
BACKUP S E=0 G:$L(X)>1 FWD I $D(A(E0-5)) S (E0,E1)=E0-5 G FWD1
BACKUP1 F I=1:1:5 Q:'$D(A(E0-1))  S E0=E0-1
 S E1=E0 G FWD1
EDIT S E=0 G:$L(X)>1 EDITCK W !!,"Choose ",*34,"ID NUM",*34," to edit: "
 S DTOUT=0 R XX:DTIME E  W $C(7) S DTOUT=1 G DISPLAY^LBRYCK
 I XX=" " S:$D(^TMP("LBRY",DUZ,2)) XX=^(2)
 I XX="^" G ^LBRYCK
 I XX="" G DISPLAY^LBRYCK
 I $D(A(XX)) D UTIL G EDIT1
EDIT0 W !!,"Enter a number under heading ",*34,"ID NUM",*34,"." G EDIT
EDITCK S XX=+$E(X,2,99) S:'$D(A(XX)) X=0 K:'$D(A(XX)) XX G:'$D(XX) EDIT0 G:'$D(A(XX)) EDIT0 D UTIL G EDIT1
EDIT1 W ! S LBRYDA=DA,DA=+A(XX),(LBRYE,LBDA)=DA,(DIC,DIE)="^LBRY(682,"
 S DR="[LBRY JOURNAL DATE EDIT]" D LOCK^LBRYEDR G:LBRYL=0 EDIT2
 D ^DIE L  I $D(Y)!($D(DTOUT)) G DISPLAY^LBRYCK
 D:$P(^LBRY(682,DA,1),U,1)="" RMV S DA=LBRYDA K LBRYDA
ROUT ;CHECK TO SEE IF ANY ROUTING SLIPS NEED PRINTING
 I $G(LBRYPTR)="" D ^LBRYASK I $G(LBRYPTR)="" G EDIT2
 S NUM=0 F  S NUM=$O(^LBRY(682,LBRYE,4,NUM)) Q:NUM'>0  D
 . S LBXX=^LBRY(682,LBRYE,4,NUM,0)
 . Q:$P(LBXX,U,6)'=""
 . Q:"12"'[$P(LBXX,U,2)
 . W !,"c",$P(LBXX,U)," RECEIVED."
 . S ^LBRY(682,"A2",LBRYE,NUM)="" D QUE
EDIT2 D MORE^LBRYCK S E=II G DISPLAY^LBRYCK
ENEDT S CO682="" L ^LBRY(682,0) S LBRYNUM=$P(^LBRY(682,0),U,3)
 F  S LBRYNUM=LBRYNUM+1 Q:'$D(^LBRY(682,LBRYNUM,0))
 S LBRYIF=$S('$D(A(1)):"P",1:"I"),X=LBRYNUM,DIC="^LBRY(682,"
 S DIC(0)="LNZ",DLAYGO=682 K DO D FILE^DICN L  K DLAYGO
 S DIE=DIC,(DA,LBDA)=+Y,DR="[LBRY INSERT]" D LOCK^LBRYEDR G:LBRYL=0 ENEDT1 D ^DIE L
 I $D(Y)!($D(DTOUT)) D KILL G ENEDT0
 S DA=LBDA I '$D(^LBRY(682,DA,1))#2 D KILL G ENEDT0
 I $P(^LBRY(682,DA,1),U,1)="" D KILL G ENEDT0
 I CO682="" D KILL,KTXT
ENEDT0 D MORE^LBRYCK F E=1:1 G:'$D(A(E)) DISPLAY^LBRYCK G:A(E)=DA ENEDT1
ENEDT1 S KL1=1 G INIT^LBRYCK
 G CONT1^LBRYCK
KILL S DA=LBDA,DIK="^LBRY(682," D ^DIK Q
KTXT W !!,"This issue is not being inserted because no copies are available for check-in."
 W !,"To insert this Journal Date first go to CSE and set up copies to check-in."
 S XZ="Continue// " D PAUSE
 Q
UTIL K ^TMP("LBRY",DUZ,2) S ^(2)=XX Q
RMV S DIK=DIE D ^DIK Q
ALL K ALL S CNT=+$P($G(^LBRY(680,LBRYLOC,7)),U),(QTY,IT)=0
 F  S IT=$O(^LBRY(681,"AC",LBRYLOC,IT)) Q:IT=""  S QTY=QTY+1
 I QTY<CNT S ALL=1
 I CNT=0 S ALL=1
 Q
PAUSE W !,XZ S DTOUT=0 R X:DTIME E  W $C(7) S DTOUT=1 Q
 Q:X=""  Q:X="^"  W !,"Enter carriage return to ",XZ G PAUSE
EXIT K A,%,%DT,%X,%Y,LA0,LA1,LA2,LA3,LA4,LA5,LA6,LA7,A,I,II,IA,I1,J,AA,AA1
 K AA2,AA3,AA4,AA5,AA6,AA7,AA8,AB,AB1,AB2,CA,CA1,DIC,DIC(0),DIW,DIWF
 K DIWI,DIWL,DIWR,DIWT,DIWTC,DIWX,XT1,XT2,XT3,XT4,CLR,LL(2),LL(1),LL,DN
 K DR,DX,DY,N,O,X1,X2,XX,Z,LB,LB1,LB2,MM
 Q
QUE S LTST=$O(^LBRY(682,"A2",0)) Q:LTST=""
 S QUEUE=^LBRY(680.6,LBRYPTR,0),TERM=$P(QUEUE,U,3),QUEUE=$P(QUEUE,U,5)
 I QUEUE="Y",TERM]"" S ZTIO=TERM,ZTDTH=$H G QUEUE1
 S %ZIS="MQ",%IS("B")=$S(TERM]"":TERM,1:"") K IO("Q")
 D ^%ZIS Q:POP  I '$D(IO("Q")) U IO D ^LBRYCK2 D ^%ZISC Q
QUEUE1 S ZTRTN="^LBRYCK2",ZTSAVE("LBRYPTR")="",ZTDESC="LBRY CHECK-IN REPORT"
 D ^%ZTLOAD D ^%ZISC K ZTSK
 Q