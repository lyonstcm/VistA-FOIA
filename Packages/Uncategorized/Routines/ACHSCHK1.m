ACHSCHK1 ; IHS/ITSC/PMF - PRINT 638 CHECKS (2/2) ;   [ 10/16/2001   8:16 AM ]
 ;;3.1;CONTRACT HEALTH MGMT SYSTEM;;JUN 11, 2001
 ;
RETURN ;EP - From option.  Enter check return date.
 S ACHSADJ=""
R1 ;
 D ^ACHSUSC
 G K:'$D(ACHSDIEN)
 I '$$DOC^ACHS(2,3) W *7,!!,"NO CHECK HAS BEEN PRINTED FOR THIS DOCUMENT." G R1
 S ACHS=$P($G(^DD(9002080.01,51,0)),U),DA=ACHSDIEN,DA(1)=DUZ(2)
 W !?18-$L(ACHS),ACHS,": ",$$VAL^XBDIQ1(9002080.01,.DA,51)
 S ACHS=$P($G(^DD(9002080.01,52,0)),U)
 W !?18-$L(ACHS),ACHS,": ",$$VAL^XBDIQ1(9002080.01,.DA,52)
 S DA=ACHSDIEN,DIE="^ACHSF("_DUZ(2)_",""D"",",DR="53",DR(1)="100;",DR(1,9002080)="100;",DR(2,9002080.01)="53"
 D ^DIE
 W !
K ;
 K ACHSDIEN,DA,DIC,DIE,DR
 Q
 ;
AMT ;EP - Written amount. Expected input is output of COMMA^%DTC with X3=1.
 S ACHSX="",ACHSHUNS=$P(X,"."),ACHSTHOU=$S(X[",":$E(1000+$P(X,","),2,4),1:"000")
 I ACHSHUNS["," S ACHSHUNS=$P(ACHSHUNS,",",2)
 S ACHSHUNS=$E(1000+ACHSHUNS,2,4),ACHSCENT=$E(100+$P(X,".",2),2,3)
 G AMTH:'(+ACHSTHOU)
 I +$E(ACHSTHOU) S ACHSX=$P($P($T(@1),";;",2),U,+$E(ACHSTHOU))_" HUNDRED "
 I +$E(ACHSTHOU,2)>1 S ACHSX=ACHSX_$P($P($T(@11),";;",2),U,$E(ACHSTHOU,2))_"-"_$P($P($T(@1),";;",2),U,$E(ACHSTHOU,3))
 I +$E(ACHSTHOU,2)=1 S ACHSX=ACHSX_$P($P($T(@10),";;",2),U,+$E(ACHSTHOU,2,3)-9)
 I +$E(ACHSTHOU,2)=0 S ACHSX=ACHSX_$P($P($T(@1),";;",2),U,+$E(ACHSTHOU,3)) I +$E(ACHSTHOU,3)=0 S ACHSX=$E(ACHSX,1,$L(ACHSX)-1)
 I +ACHSTHOU>0 S ACHSX=ACHSX_" THOUSAND "
AMTH ;
 G ADJST:'(+ACHSHUNS)
 I +$E(ACHSHUNS) S ACHSX=ACHSX_$P($P($T(@1),";;",2),U,+$E(ACHSHUNS))_" HUNDRED "
 I +$E(ACHSHUNS,2)>1 S ACHSX=ACHSX_$P($P($T(@11),";;",2),U,$E(ACHSHUNS,2)) I $E(ACHSHUNS,3)>0 S ACHSX=ACHSX_"-"_$P($P($T(@1),";;",2),U,$E(ACHSHUNS,3))
 I +$E(ACHSHUNS,2)=1 S ACHSX=ACHSX_$P($P($T(@10),";;",2),U,+$E(ACHSHUNS,2,3)-9)
ADJST ;
 I +$E(ACHSHUNS,2)=0 S ACHSX=ACHSX_$P($P($T(@1),";;",2),U,+$E(ACHSHUNS,3)) I +$E(ACHSHUNS,3)=0 S ACHSX=$E(ACHSX,1,$L(ACHSX)-1)
AMTC ;
 I ACHSX="" S ACHSX="NO"
 S ACHSX=ACHSX_" DOLLARS AND "
 I +$E(ACHSCENT)>1 S ACHSX=ACHSX_$P($P($T(@11),";;",2),U,+$E(ACHSCENT)) I +$E(ACHSCENT,2)>0 S ACHSX=ACHSX_"-"_$P($P($T(@1),";;",2),U,+$E(ACHSCENT,2))
 I +$E(ACHSCENT)=1 S ACHSX=ACHSX_$P($P($T(@10),";;",2),U,+$E(ACHSCENT,1,2)-9)
 I +ACHSCENT<10 S ACHSX=ACHSX_$P($P($T(@1),";;",2),U,+$E(ACHSCENT,2))
 I +ACHSCENT=0 S ACHSX=ACHSX_"NO"
 S ACHSX=ACHSX_" CENTS"
 F  Q:ACHSX'["  "  S ACHSX=$P(ACHSX,"  ")_$E($P(ACHSX,"  ",2),2,99)
 S X=ACHSX
 K ACHSCENT,ACHSHUNS,ACHSTHOU,ACHSX
 Q
 ;
1 ;;ONE^TWO^THREE^FOUR^FIVE^SIX^SEVEN^EIGHT^NINE
10 ;;TEN^ELEVEN^TWELVE^THIRTEEN^FOURTEEN^FIFTEEN^SIXTEEN^SEVENTEEN^EIGHTEEN^NINETEEN
11 ;;^TWENTY^THIRTY^FORTY^FIFTY^SIXTY^SEVENTY^EIGHTY^NINETY^
 ;
TAMT ;
 F X=0.88,3,5.03,23,44.5,150,234.22,1122.22,2910,44332,345678.21,999999.99 S X3=1 D COMMA^%DTC W X,! D AMT W X,! H 1
 Q
 ;