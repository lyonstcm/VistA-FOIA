AMHRP71 ; IHS/CMI/LAB - PROCESS REPORT ;
 ;;4.0;IHS BEHAVIORAL HEALTH;;MAY 14, 2010
 ;
 D M
END ;
 Q
 Q
 ;
M ;
 S DFN=0 F  S DFN=$O(^AMHPDAT(DFN)) Q:DFN'=+DFN  S AMHX=$S(AMHPROG="M":$P(^AMHPDAT(DFN,0),U,2),1:$P(^AMHPDAT(DFN,0),U,3)) I AMHX]"" D PROC
 Q
PROC ;
 I AMHPRV,AMHPRV'=AMHX Q
 S ^XTMP("AMHRP7",AMHJOB,AMHBTH,AMHPRV,DFN)=""
 Q
PRINT ;