ABPVEEC1 ;ENTER/EDIT PVT INS CLAIMS - PART 2; [ 06/06/91  8:34 AM ]
 ;;2.0;FACILITY PVT-INS TRACKING;*0*;IHS-OKC/KJR;AUGUST 7, 1991
 Q  ;;NOT AN ENTRY POINT
WRITE F ABPVJ=3:1 Q:$P(ABPVTEXT,";",ABPVJ)=""  D
 .S @("P"_ABPVJ)=$P(ABPVTEXT,";",ABPVJ)
 W ! S DX=P5,DY=P6 S:IOST["QUME" DY=DY+1 X XY W P3,$J(P4,22)
 I $D(P7)=1 W " " W:$D(@P7)=1 @P7
 Q
 ;
REVON S DX=0,DY=18 W ! X XY D EOP^ABPVZMM
 W:$D(ABPVRON) @(ABPVRON)
 Q
 ;
SCREEN S ABPV("HD",1)=ABPVTLE,ABPV("HD",2)="Enter/Edit Claim"
 I $D(ABPVCDFN)=1 D
 .S ABPV("HD",2)=ABPV("HD",2)_" #"_$P(^ABPVFAC(ABPVCDFN,0),"^")
 D ^ABPVHD
 F ABPVI=1:1 S ABPVTEXT=$T(PROMPT+ABPVI) Q:ABPVTEXT=""  D WRITE
 W !,ABPVLL,!
 Q
 ;
EDIT I ABPVTXDT D  G XIT
 .D REVON W "Claim exported on "
 .S Y=ABPVTXDT X ^DD("DD") W Y,@ABPVROFF
 .D PAUSE^ABPVZMM
 D REVON W "Select FIELD NUMBER to edit (4 - 8)"
 W:$D(ABPVRON)=1 @(ABPVROFF)
 R !,"FIELD NUMBER: ",ABPVI:DTIME I $T=0!(ABPVI["^")!(ABPVI="") G XIT
 I ABPVI["?" D  G EDIT
 .W "  -- ENTER A NUMBER BETWEEN 4 AND 8" H 3
 I +ABPVI>0&(+ABPVI<4) D  G EDIT
 .W *7,"  --  SORRY, YOU ARE NOT ALLOWED TO CHANGE THIS FIELD" H 3
 I +ABPVI=0!(+ABPVI>8) D  G EDIT
 .W *7,"  -- INVAILID SELECTION" H 3
 S LBL="FLD"_+ABPVI K DIC,DIE,DA,DR,X,Y D @LBL
 G EDIT
 ;
FLD4 S DA=+ABPVCDFN,DIE="^ABPVFAC(",DR=2
 S DIE("NO^")="" D REVON W "Enter the DATE OF SERVICE being billed"
 W:$D(ABPVRON)=1 @(ABPVROFF)
 D ^DIE K DIC S DIC="^ABPVFAC(",DIC(0)="Z"
 W:$D(ABPVRON)=1 @(ABPVROFF)
 D ^DIC I +X>0 S ABPVDOS=$E(X,4,5)_"/"_$E(X,6,7)_"/"_$E(X,2,3)
 D:$Y>21 SCREEN S ABPVTEXT=$T(PROMPT+4) D WRITE
 Q
 ;
FLD5 S DA=+ABPVCDFN,DIE="^ABPVFAC(",DR=5
 S DIE("NO^")="" D REVON
 S ABPVMESS="VISIT TYPE - ""O"", ""I"", ""P"", or ""D""" W ABPVMESS
 W:$D(ABPVRON)=1 @(ABPVROFF)
 D ^DIE S ABPVTYPE=X
 I ABPVTYPE="O" D
 .S ABPVTYPE="OUTPATIENT",DR="6////1" D ^DIE S ABPVDV=1
 S:ABPVTYPE="I" ABPVTYPE="INPATIENT (HOSPITAL ONLY)"
 I ABPVTYPE="P" D
 .S ABPVTYPE="INPATIENT (PHYSICIAN ONLY)",DR="6////0" D ^DIE
 .S ABPVDV=0
 I ABPVTYPE="D" D
 .S ABPVTYPE="DENTAL",DR="6////1" D ^DIE S ABPVDV=1
 D:$Y>21 SCREEN S ABPVTEXT=$T(PROMPT+5) D WRITE
 I ABPVTYPE["HOSPITAL" G FLD6
 S ABPVTEXT=$T(PROMPT+6) D WRITE
 Q
 ;
FLD6 I ABPVTYPE["PHYSICIAN" D  Q
 .W *7," - Cannot edit in-patient physician workload  " H 3
 I ABPVTYPE["OUTPATIENT" D  Q
 .W *7," - Cannot edit out-patient workload  " H 3
 I ABPVTYPE["DENTAL" D  Q
 .W *7," - Cannot edit dental workload  " H 3
 S DA=+ABPVCDFN,DIE="^ABPVFAC(",DR=6
 S DIE("NO^")="" D REVON
 W "Number of outpatient VISITS or inpatient DAYS (0 - 50)"
 W:$D(ABPVRON) @(ABPVROFF)
 D ^DIE S ABPVDV=X
 I ((ABPVTYPE["INPATIENT")!(ABPVTYPE["DENTAL"))&(+ABPVDV'>0) D  G FLD6
 .W *7," - Workload must be greater than zero  " H 3
 D:$Y>21 SCREEN S ABPVTEXT=$T(PROMPT+6) D WRITE
 Q
 ;
FLD7 S DA=+ABPVCDFN,DIE="^ABPVFAC(",DR=7
 S DIE("NO^")="" D REVON
 W "Name of the INSURANCE COMPANY being billed"
 W:$D(ABPVRON)=1 @(ABPVROFF)
 D ^DIE S ABPVINS=X,ABPVINS=$P(^AUTNINS(+ABPVINS,0),"^")
 S DR=7.03 D ^DIE S ABPVPHNM=X,DR=7.05 D ^DIE S ABPVPNUM=X
 D:$Y>3 SCREEN S ABPVTEXT=$T(PROMPT+7) D WRITE
 Q
 ;
FLD8 S DA=+ABPVCDFN,DIE="^ABPVFAC(",DR=8
 S DIE("NO^")="" D REVON
 W "Enter the dollar AMOUNT being claimed (0 - 99999)"
 W:$D(ABPVRON)=1 @(ABPVROFF) D ^DIE S ABPVAMT="$"_$J(X,8,2)
 D:$Y>21 SCREEN S ABPVTEXT=$T(PROMPT+10) D WRITE
 Q
 ;
XIT G MAIN^ABPVEEC0
 ;
PROMPT ;;FLD #;TITLE;X-POSITION;Y-POSITION;VARIABLE NAME
 ;;(1)   ;Patient Name:;7;7;ABPVPNAM
 ;;(2)   ;Facility:;7;8;ABPVFAC
 ;;(3)   ;Health Record Number:;7;9;ABPVHRN
 ;;(4)   ;Date of Service:;7;10;ABPVDOS
 ;;(5)   ;Visit Type:;7;11;ABPVTYPE
 ;;(6)   ;Days or Visits:;7;12;ABPVDV
 ;;(7)   ;Insurance Company:;7;13;ABPVINS
 ;;   (a);Policy Holder Name:;7;14;ABPVPHNM
 ;;   (b);Policy Number:;7;15;ABPVPNUM
 ;;(8)   ;Claim Amount:;7;16;ABPVAMT