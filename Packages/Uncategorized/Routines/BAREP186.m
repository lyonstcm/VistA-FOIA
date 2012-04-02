BAREP186 ; IHS/SD/LSL - POST-INSTALL V1.8 PATCH 6; 07/30/2008
 ;;1.8;IHS ACCOUNTS RECEIVABLE;**6**;APR 27,2007
 ;;NEW ROUTINE -- CONTINUATION OF BAREV186
 ;
POST186 ;EP; PATCH 6 POST-INSTALL
 D REINDEX  ;add "G" cross reference to A/F UFMS Cashier Session Log file
 D TASK186  ;task job to populate booking date with 9/30/08
 ;
 N BARZ
 F BARZ="3080901.21","3080930.21" D
 .D TASK1862(BARZ) ;task jobs to kill NS X-REF  ;MRS; BAR*1.8*6 SCR-124
 Q
 ;
REINDEX ;index new cross reference on A/R UFMS Cashier Log
 W !,"Adding ""G"" cross reference to A/R UFMS Cashier Session Log....",!
 S BARHOLD=DUZ(2)
 S DUZ(2)=0
 F  S DUZ(2)=$O(^BARSESS(DUZ(2))) Q:+DUZ(2)=0  D
 .S BARA=0
 .F  S BARA=$O(^BARSESS(DUZ(2),BARA)) Q:+BARA=0  D
 ..S BARB=0
 ..F  S BARB=$O(^BARSESS(DUZ(2),BARA,11,BARB)) Q:+BARB=0  D
 ...S DA(2)=BARA
 ...S DA(1)=BARB
 ...S DIK="^BARSESS(DUZ(2),"_DA(2)_",11,"_DA(1)_",2,"
 ...S DIK(1)=".01^G"
 ...D ENALL^DIK
 S DUZ(2)=BARHOLD
 Q
TASK186 ;EP
 S ZTRTN="BOOKDT^BAREP186"
 S ZTDESC="A/R UFMS BOOKING DT POPULATION"
 S ZTIO=""
 S ZTPRI=5
 S ZTDTH="3080930.23"  ;09/30/08 at 11:00pm
 K ZTSK
 D ^%ZTLOAD
 W:$G(ZTSK) !,"Task # ",ZTSK," queued to populate UFMS booking date at 09/30/2008@23:00",!
 Q
BOOKDT ;EP
 S DUZ2=1
 F  S DUZ2=$O(^BAR(90052.06,DUZ2)) Q:'DUZ2  D
 .S DA(1)=DUZ2
 .S DA=0
 .F  S DA=$O(^BAR(90052.06,DUZ2,DA)) Q:'DA  D
 ..Q:'$$IHS^BARUFUT(DA)
 ..S DIE="^BAR(90052.06,"_DA(1)_","
 ..S DR="1505////3081001"
 ..D ^DIE
 Q
 ;
TASK1862(BARZ) ;EP;; KILL NOT SENT (NS) X-REF ;MRS;BAR*1.8*6 SCR-124
 ;TASK TWO JOBS, ONE FOR 9/1/08 @2100 AND ONE FOR 9/30/08 @2100
 S ZTRTN="NS^BAREP186"
 S ZTDTH=BARZ
 S ZTDESC="A/R UFMS REMOVE NOT SENT AT "_ZTDTH
 S ZTIO=""
 S ZTPRI=5
 K ZTSK
 D ^%ZTLOAD
 S BARZ=$S(BARZ[3080901:"09/01/2008@21:00",BARZ[3080930:"09/30/2008@21:00",1:"")
 W:$G(ZTSK) !,"Task # ",ZTSK," queued to remove UFMS Not Sent cross-references at "_BARZ,!
 Q
NS ;EP; KILL A/R UFMS CASHIER SESSION LOG NOT SENT CROSS-REFERENCES ;MRS;BAR*1.8*6 SCR-124 
 N DUZ2
 S DUZ2=0
 F  S DUZ2=$O(^BARSESS(DUZ2)) Q:'DUZ2  D
 .K ^BARSESS(DUZ2,"NS")
 Q