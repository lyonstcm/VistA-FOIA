BQI202PR ;VNGT/HS/ALA-Version 2.0 Patch 2 Pre-Install ; 02 Feb 2009  1:11 PM
 ;;2.1;ICARE MANAGEMENT SYSTEM;;Feb 07, 2011
 ;
EN ; Entry point
 NEW DA,DIK
 S DA=0,DIK="^BQI(90506,"
 F  S DA=$O(^BQI(90506,DA)) Q:'DA  D ^DIK
 S DA=0,DIK="^BQI(90506.3,"
 F  S DA=$O(^BQI(90506.3,DA)) Q:'DA  D ^DIK
 S DA=0,DIK="^BQI(90506.4,"
 F  S DA=$O(^BQI(90506.4,DA)) Q:'DA  D ^DIK
 S DA=0,DIK="^BQI(90505.2,"
 F  S DA=$O(^BQI(90505.2,DA)) Q:'DA  D ^DIK
 S DA=0,DIK="^BQI(90506.5,"
 F  S DA=$O(^BQI(90506.5,DA)) Q:'DA  D ^DIK
 S DA=0,DIK="^BQI(90507,"
 F  S DA=$O(^BQI(90507,DA)) Q:'DA  D ^DIK
 S DA=0,DIK="^BQI(90507.8,"
 F  S DA=$O(^BQI(90507.8,DA)) Q:'DA  D ^DIK
 S DA=0,DIK="^BQI(90508.5,"
 F  S DA=$O(^BQI(90508.5,DA)) Q:'DA  D ^DIK
 ;
 ; Remove old fields before installing new fields
 I $$VFIELD^DILFD(90505.01,4.01) D
 . NEW DIK,DA
 . S DIK="^DD(90505.01,",DA(1)=90505.01
 . F DA=4.01,4.02,4.03,4.04 D ^DIK
 I $$VFIELD^DILFD(90505.03,4.01) D
 . NEW DIK,DA
 . S DIK="^DD(90505.03,",DA(1)=90505.03
 . F DA=4.01,4.02,4.03,4.04 D ^DIK
 Q