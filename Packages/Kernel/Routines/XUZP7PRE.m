XUZP7PRE ;IHS/OIRM/DSD/AEF - PATCH XU*8.0*1007 PRE-INSTALL ROUTINE [ 04/02/2003   8:29 AM ]
 ;;8.0;KERNEL;**1007**;APR 1, 2003
 ;
EN ;EP -- MAIN ENTRY POINT
 ;
 D ^XBKVAR
 D K89321
 Q
K89321 ;----- REMOVE PERSON CLASS DATA   
 ;THIS IS FROM PATCH XU*8.0*106 PREINSTALL ROUTINE PREXXX^XUINPCH2
 ;
 D BMES^XPDUTL("REMOVING FILE 8932.1 'PERSON CLASS' ENTRIES")
 ;
 S ^USC=""
 K ^USC(8932.1)
 Q