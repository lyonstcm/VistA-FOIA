ABME8L13 ; IHS/ASDST/DMJ - Header 
 ;;2.6;IHS 3P BILLING SYSTEM;;NOV 12, 2009
 ;Header Segments
 ;
 ; IHS/SD/SDR - v2.5 p9 - IM19077
 ;    Pass date (not time) for DTP segments
 ;
START ;START HERE
 D ^ABME8CLM
 D WR^ABMUTL8("CLM")
 I $P(ABMB6,"^") D
 .D EP^ABME8DTP(435,"D8",$P(ABMB6,"^"))
 .D WR^ABMUTL8("DTP")
 I $P(ABMB6,"^",3) D
 .D EP^ABME8DTP("096","D8",$P(ABMB6,"^",3))
 .D WR^ABMUTL8("DTP")
 I $P(ABMB8,"^",2) D
 .D EP^ABME8DTP(439,"D8",$P(ABMB8,"^",2))
 .D WR^ABMUTL8("DTP")
 I $P(ABMB7,U)'=$P(ABMB7,"^",2) D
 .D EP^ABME8DTP(472,"RD8",$P(ABMB7,U),$P(ABMB7,"^",2))
 .D WR^ABMUTL8("DTP")
 I $P(ABMB7,U)=$P(ABMB7,"^",2) D
 .D EP^ABME8DTP(472,"D8",$P(ABMB7,U))
 .D WR^ABMUTL8("DTP")
 I $P(ABMB9,"^",9) D
 .D EP^ABME8AMT("F5")
 .D WR^ABMUTL8("AMT")
 I $D(^ABMDBILL(DUZ(2),ABMP("BDFN"),61)) D
 .D EP^ABME8NTE("ADD")
 .D WR^ABMUTL8("NTE")
 Q