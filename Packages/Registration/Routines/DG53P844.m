DG53P844 ;ALB/MJB/RC - TREATING SPECIALTIES UPDATES ; 6/22/11 3:45pm
 ;;5.3;Registration;**844**;Aug 13, 1993;Build 3
 ;
 Q
 ;; This routine is used to add, edit and inactivate Specialties in the specialty file and
 ;; edit existing surgical specialties.
 ;;
EN ; Changes to the SPECIALITY file (#42.4)
 N DGI,DGERR,DGSPEC,DGIFN,DGQUES
 ;edit existing treating specialties, if needed
 D EDIT
 ;inactivate existing treating specialties, if needed
 D INACT
 ;edit existing surgical specialties, if needed
 ;D EDIT^DG53813R
 Q
INACT ;inactivate treating specialties
 N DA,DIE,DR,X,DGTSP,DIC,Y
 F DGTSP=43 D
 . S DIC="^DIC(42.4,"_DGTSP_",""E"","
 . S DA(1)=DGTSP
 . S DIC(0)="LX"
 . S DIC("P")=$P(^DD(42.4,10,0),"^",2)
 . S X=3111001
 . D ^DIC
 . S DA=+Y
 . I +Y=-1 D BMES^XPDUTL(">>>Inactive date not added to TS code "_DGTSP_" in the Specialty file.<<<") Q
 . D BMES^XPDUTL(">>>Inactive date added to TS code "_DGTSP_" in the Specialty file.<<<")
 . S DIE=DIC
 . S DR=".02///N"
 . D ^DIE
 . ;check for CODES in the Facility Treating Specialty File (45.7
 . ;add inactivation date of 10/1/2011
 . D BMES^XPDUTL("  ")
 . D MES^XPDUTL("     FACILITY TREATING SPECIALTY FILE being checked to see if any entries are")
 . D MES^XPDUTL("     pointing to "_DGTSP_".  If so, they will be inactivated.>>>")
 .N DAA F DAA=0:0 S DAA=$O(^DIC(45.7,"ASPEC",DGTSP,DAA)) Q:'DAA  D
 .. N DIE,DR,TS,X S TS=""
 ..S TS=$P($G(^DIC(45.7,DAA,0)),"^")
 ..S DIC="^DIC(45.7,"_DAA_",""E"","
 ..S DA(1)=DAA
 ..S DIC(0)="LX"
 ..S X=3111001
 ..D ^DIC
 ..S DA=+Y
 ..I +Y=-1 D BMES^XPDUTL("     Inactive date not added to "_TS_"in the Facility Treating Specialty file.") Q
 ..D BMES^XPDUTL("     Inactive date added to "_TS_" in the Facility Treating Specialty file.<<<")
 ..S DIE=DIC
 ..S DR=".02///N"
 ..D ^DIE
 Q
EDIT ;Edit treating specialties
 ;
 N DS,DIE,DR,DGI,DIC,Y
 S DIE="^DIC(42.4,"
 S DIC(0)="LX"
 F DGI=1:1 S DGSPEC=$P($T(ETRSP+DGI),";;",2) Q:DGSPEC="QUIT"  D
 . S DGERR=0
 . S DA=$P(DGSPEC,U)
 . S DR=".01///"_$P(DGSPEC,U,2)_";1///"_$P(DGSPEC,U,3)_";3///"_$P(DGSPEC,U,4)_";4///"_$P(DGSPEC,U,5)_";5///"_$P(DGSPEC,U,6)_";6///"_$P(DGSPEC,U,7)
 . D ^DIE
 . D BMES^XPDUTL("  ")
 . D BMES^XPDUTL("  ")
 . D BMES^XPDUTL(">>>"_$P(DGSPEC,U)_" code updated to "_$P(DGSPEC,U,2)_" in the Specialty file.>>>")
 N DS,DIE,DR,DGI,DGII,DGSP,CNT,DGSPEC,DGSPEC1
 S DIE="^DIC(45.7,"
 S DIC(0)="LX"
 F DGI=1:1 S DGSPEC=$P($T(ETRSP+DGI),";;",2) Q:DGSPEC="QUIT"  D
 . S DGERR=0
 . S DGSP=$P(DGSPEC,U)
 . S CNT=0,DGSPEC1=0 F DGII=0:0 S DGSPEC1=$O(^DIC(45.7,"ASPEC",DGSP,DGSPEC1)) Q:'DGSPEC1  S CNT=CNT+1 D
 .. I CNT=1 D
 ... I $$ACTIVE^DGACT(45.7,DGSPEC1)'=1 S CNT=0 Q
 ... S DA=DGSPEC1,DR=".01///"_$P(DGSPEC,U,2)_";99///@"
 ... D BMES^XPDUTL("     "_$P(^DIC(45.7,DGSPEC1,0),U)_" name has been changed to "_$P(DGSPEC,U,2)_" in the Facility Treating Specialty file.")
 ... D ^DIE
 .. E  D
 ... S TS=""
 ... S TS=$P($G(^DIC(45.7,DGSPEC1,0)),"^")
 ... D BMES^XPDUTL("     Please review Facility Treating Specialty "_TS_".  The entry name may need changing or entry may need inactivating since more than one entry points to "_$P(DGSPEC,U,2)_" in the Specialty file.<<<")
 Q
ETRSP ;PTF CODE^SPECIALTY^PRINT NAME^SERVICE^ASK PSYCH^BILLING BEDSECTION^CDR/MPCR
 ;;67^NH SHORT-STAY CONTINUING CARE^NH SS CONT CARE^NHCU^NO^NURSING HOME CARE^1430^^
 ;;68^NH SHORT-STAY MH RECOVERY^NH SS MH RECVRY^NHCU^NO^NURSING HOME CARE^1430^^
 ;;44^NH LONG-STAY CONTINUING CARE^NH LS CONT CARE^NHCU^NO^NURSING HOME CARE^1410^^
 ;;45^NH LONG-STAY MH RECOVERY^NH LS MH RECVRY^NHCU^NO^NURSING HOME CARE^1410^^
 ;;QUIT
PTFCHK ;Check Open PTF records for TS 43
 N DGPTFIEN,DGMVTIEN,DGTEXTLN,DGTEXT,DGSPCS
 S DGPTFIEN="",DGTEXTLN=10,DGSPCS="                              "
 ;Go through Open PTF records
 F  S DGPTFIEN=$O(^DGPT("AS",0,DGPTFIEN)) Q:'DGPTFIEN  D
 .;Find the newest movement
 .S DGMVTIEN=9999999
 .S DGMVTIEN=$O(^DGPT(DGPTFIEN,"M",DGMVTIEN),-1)
 .;If the treating specialty is 43 add to the mail message
 .I DGMVTIEN,$P($G(^DGPT(DGPTFIEN,"M",DGMVTIEN,0)),U,2)=43 D
 ..N DGPTNM,DGPTAD
 ..;retrieve the patient's name and admission date
 ..D GETS^DIQ(45,DGPTFIEN_",",".01;2","EI","DGPTINFO")
 ..S DGPTNM=$E(DGPTINFO(45,DGPTFIEN_",",".01","E")_DGSPCS,1,30)
 ..S DGPTAD=DGPTINFO(45,DGPTFIEN_",","2","E")
 ..S DGTEXTLN=DGTEXTLN+1
 ..;add a new line to the mail message in the format
 ..;ptf record #, patient's name, admission date
 ..S DGTEXT(DGTEXTLN)=$E(DGPTFIEN_DGSPCS,1,10)_" "_DGPTNM_" "_DGPTAD
 ..K DGPTINFO,DGPTNM,DGPTAD
 D GENMAIL(DGTEXTLN,.DGTEXT)
 Q
GENMAIL(DGTEXTLN,DGTEXT) ;Generate mail message with PTF information
 N XMDUZ,XMSUB,XMY,XMTEXT,DIFROM ;Mailman Variables
 S XMDUZ=".5" ;Message originates from postmaster
 S XMY(DUZ)="" ;Send message to patch installer
 S XMSUB="Treating Specialty Update DG*5.3*844"
 S XMTEXT="DGTEXT("
 S DGTEXT(1)="This message was generated by the installation of DG*5.3*844."
 I DGTEXTLN=10 D  Q
 .S DGTEXT(2)="There are no patients requiring treating specialty updates."
 .S DGTEXT(3)="No action is required."
 .D ^XMD
 S DGTEXT(2)="There are patients at your site that are still assigned to treating specialty: "
 S DGTEXT(3)="43 NH LONG STAY SKILLED NURING."
 S DGTEXT(4)="This code is inactive as of October 1, 2011."
 S DGTEXT(5)="Please forward this message to the appropriate MAS personnel for review."
 S DGTEXT(6)=""
 S DGTEXT(7)="Patients requiring treating specialty updates:"
 S DGTEXT(8)=""
 S DGTEXT(9)="PTF#       PATIENT                        ADMISSION DATE"
 S DGTEXT(10)="------------------------------------------------------------------"
 D ^XMD
 Q