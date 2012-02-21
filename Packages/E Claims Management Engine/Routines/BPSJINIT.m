BPSJINIT ;BHAM ISC/LJF - HL7 Application Registration ;21-NOV-2003
 ;;1.0;E CLAIMS MGMT ENGINE;**1,3,2,5**;JUN 2004;Build 45
 ;;Per VHA Directive 2004-038, this routine should not be modified.
 ;
 N DA,DIC,DIE,DINUM,DIR,DIRUT,DIROUT,DLAYGO,DR,DTOUT,DUOUT,X,Y
 N BPVALFN,BPSJAPPR,BPSJVALR,PHIX
 ;
 ;  This program will allow user to enter site data.
 ;
 ; Programmer Note: D BPSJVAL^BPSJAREG(X) will validate with following.
 ;   where X is: 0 = HL7 trigger, no validation display
 ;               1 = HL7 trigger, display validation
 ;               2 = no HL7 trigger, display validation
 ;               3 = no validation display, no HL7 trigger
 ;
 W !!!,"ENTER/VERIFY SITE REGISTRATION DATA.",!!
 ;
 S BPVALFN=9002313.99
 ;
 ; Create/update BPS Setup record
 ; Returns record number in DA
 D VERSION(BPVALFN)
 ;
 W !!,"PRIMARY SITE CONTACT DATA."
 K DIC,DIE,DINUM,DIR,DIRUT,DIROUT,DLAYGO,DR,DTOUT,DUOUT,X,Y
 S DIE=$$ROOT^DILFD(BPVALFN)
 S DR="[BPSJ CONTACT ENTER/EDIT]" D ^DIE
 ;
 W !!,"ALTERNATE SITE CONTACT DATA."
 K DIC,DIE,DINUM,DIR,DIRUT,DIROUT,DLAYGO,DR,DTOUT,DUOUT,X,Y
 S DIE=$$ROOT^DILFD(BPVALFN)
 S DR="[BPSJ ALT CONTACT ENTER/EDIT]" D ^DIE
 ;
 W !!!,"-- APPLICATION REGISTRATION VALIDATION RESULTS. --",!!
 S BPSJVALR=-1
 D BPSJVAL^BPSJAREG(2)
 S BPSJAPPR=BPSJVALR
 ;
 I 'BPSJAPPR W !!,"-- APPLICATION REGISTRATION DATA VALID. --",!
 E  D
 . W !!,"** APPLICATION REGISTRATION DATA INVALID!!!  **"
 . W !,"**  APPLICATION REGISTRATION AND PHARMACY    **"
 . W !,"**    REGISTRATIONS WILL NOT BE SENT!        **",!
 ;
 K DA,DIC,DIE,DINUM,DIR,DIRUT,DIROUT,DLAYGO,DR,DTOUT,DUOUT,X,Y
 S DIR(0)="EO" D ^DIR I X=U Q
 ;
 D PHARM
 I BPSJAPPR D  Q
 . W !!,"REGISTRATION ABORTED DUE TO INVALID SITE REGISTRATION DATA.",!!
 ;
 W !!!,"APPLICATION REGISTRATION DATA IS VALID."
 W !!,"PHARMACY REGISTRATION DATA IS:"
 S PHIX=$O(^BPS(9002313.56,0))
 F  Q:'PHIX  D  S PHIX=$O(^BPS(9002313.56,PHIX))
 . S BPSJVALR=-1 D REG^BPSJPREG(PHIX,3)
 . I BPSJVALR>0 S DIR=" *INVALID",DIE=" and will NOT be transmitted."
 . E  S DIR="    VALID",DIE=" and will be transmitted."
 . W !,DIR_" for "_$P($G(^BPS(9002313.56,PHIX,0)),U)_DIE
 W !
 K DA,DIC,DIE,DINUM,DIR,DIRUT,DIROUT,DLAYGO,DR,DTOUT,DUOUT,X,Y
 S DIR(0)="YEO",DIR("A")="SEND APPLICATION REGISTRATION: Y/N " D ^DIR
 I $TR($E(X),"y","Y")'="Y" Q
 ;
 K DA,DIC,DIE,DINUM,DIR,DIRUT,DIROUT,DLAYGO,DR,DTOUT,DUOUT,X,Y
 D BPSJVAL^BPSJAREG(0)
 W !!,"APPLICATION REGISTRATION SUBMITTED."
 Q
 ;
PHARM ;CYCLE THROUGH PHARMACIES
 ;
 N DA,DIC,DIE,DINUM,DIR,DIRUT,DIROUT,DLAYGO,DR,DTOUT,DUOUT,X,Y
 N BPVALFN,BPSJVALR,BPSJPHPR
 ;
 ;
 ; Check DropDeadDate
 N BPSJDDD
 S BPSJDDD=$$NPIREQ^BPSNPI(DT) ; DDD=3080524
 ;
 S BPVALFN=9002313.56,PHIX=0
 ;
 F  D  Q:PHIX=""
 . W !!!,"ENTER/VERIFY PHARMACY REGISTRATION DATA."
 . W !!,"PHARMACY SPECIFIC DATA."
 . K DA,DIC,DIE,DINUM,DIR,DIRUT,DIROUT,DLAYGO,DR,DTOUT,DUOUT,X,Y
 . ;check for drop dead date
 . S DIC(0)="QAELM" I $G(BPSJDDD)>0 S DIC(0)="QAEM"
 . S DIC=BPVALFN,DLAYGO=DIC D ^DIC
 . ;
 . I X'=U,0<+Y S PHIX=+Y
 . E  S PHIX="" Q
 . D MOD I 'PHIX Q
 . W !!!,"-- PHARMACY REGISTRATION VALIDATION RESULTS. --",!
 . ;
 . S BPSJVALR=-1
 . D REG^BPSJPREG(PHIX,2)
 . S BPSJPHPR=BPSJVALR
 . ;
 . I 'BPSJPHPR W !!,"-- PHARMACY REGISTRATION DATA VALID. --",!
 . E  D
 .. W !!,"**     PHARMACY REGISTRATION DATA INVALID!!!      **"
 .. W !,"** THIS PHARMACY'S REGISTRATION WILL NOT BE SENT! **",!
 . ;
 . K DA,DIC,DIE,DINUM,DIR,DIRUT,DIROUT,DLAYGO,DR,DTOUT,DUOUT,X,Y
 . S DIR(0)="EO",DIR("A")="Enter RETURN to continue" D ^DIR
 ;
 Q
 ;
MOD ;
 N DA,DIC,DIE,DINUM,DIR,DIRUT,DIROUT,DLAYGO,DR,DTOUT,DUOUT,X,Y
 ;
 ; Set hours to default if not set.
 S DA=$$OPHOURS^BPSJZRP(PHIX),DR=$G(^BPS(9002313.56,PHIX,"HOURS"))
 I $P(DR,U,2,5)'=DA S ^BPS(9002313.56,PHIX,"HOURS")="24"_U_DA
 ;
 ; Set STATUS default to ACTIVE if not set
 I $$GET1^DIQ(9002313.56,PHIX,.1,"I")="" D
 . K DI,DIDEL
 . S DR=".1///ACTIVE",DIE=9002313.56,DA=PHIX
 . D ^DIE
 ;
 W !!,"SITE DATA."
 K DA,DIC,DIE,DINUM,DIR,DIRUT,DIROUT,DLAYGO,DR,DTOUT,DUOUT,X,Y
 S DA=PHIX,DIE=$$ROOT^DILFD(BPVALFN)
 S DR="[BPSJ PHARMACY SITE ENTER/EDIT]" D ^DIE
 ;
 I '$G(DA) S PHIX=0 Q   ; Pharmacy killed by user
 ;
 ; Pharmacy open hours
 I '$D(Y) D EN^BPSJINI1(PHIX)
 ;
 K DA,DIC,DIE,DINUM,DIR,DIRUT,DIROUT,DLAYGO,DR,DTOUT,DUOUT,X,Y
 S DIR(0)="EO" D ^DIR
 ;
 I X=U Q
 ;
 W !!,"PRIMARY CONTACT DATA."
 K DA,DIC,DIE,DINUM,DIR,DIRUT,DIROUT,DLAYGO,DR,DTOUT,DUOUT,X,Y
 S DA=PHIX,DIE=$$ROOT^DILFD(BPVALFN)
 S DR="[BPSJ PHARM CONTACT ENTER/EDIT]" D ^DIE
 ;
 K DA,DIC,DIE,DINUM,DIR,DIRUT,DIROUT,DLAYGO,DR,DTOUT,DUOUT,X,Y
 S DIR(0)="EO" D ^DIR
 ;
 I X=U Q
 ;
 W !!,"ALTERNATE CONTACT DATA."
 K DA,DIC,DIE,DINUM,DIR,DIRUT,DIROUT,DLAYGO,DR,DTOUT,DUOUT,X,Y
 S DA=PHIX,DIE=$$ROOT^DILFD(BPVALFN)
 S DR="[BPSJ PHARM ALT CONT ENTER/EDIT]" D ^DIE
 ;
 K DA,DIC,DIE,DINUM,DIR,DIRUT,DIROUT,DLAYGO,DR,DTOUT,DUOUT,X,Y
 S DIR(0)="EO" D ^DIR
 ;
 I X=U Q
 ;
 W !!,"PHARMACIST DATA."  ; VA LEAD PHARMACIST
 K DA,DIC,DIE,DINUM,DIR,DIRUT,DIROUT,DLAYGO,DR,DTOUT,DUOUT,X,Y
 S DA=PHIX,DIE=$$ROOT^DILFD(BPVALFN)
 S DR="[BPSJ PHARMACIST ENTER/EDIT]" D ^DIE
 ;
 I $D(Y) Q
 ;
 ; VA LEAD PHARMACIST LICENSE
 K DA,DIC,DIE,DINUM,DIR,DIRUT,DIROUT,DLAYGO,DR,DTOUT,DUOUT,X,Y
 S DA=PHIX,DIE=$$ROOT^DILFD(BPVALFN)
 S DR="1900.04//" D ^DIE
 ;
 Q
 ;
 ; Create record if it is missing
 ; Set version number to 3
 ; Return record number
VERSION(BPVAL) ;      
 I '$G(BPVAL) Q
 S DA=$O(^BPS(BPVAL,0))
 I 'DA D
 . N DIC,DLAYGO,DR,X,Y,DTOUT,DUOUT
 . S (DIC,DLAYGO)=BPVAL,DIC(0)="L",X="MAIN SETUP ENTRY" D ^DIC
 . S DA=+Y
 I DA=-1 Q
 N DIE,DR,DTOUT
 S DIE=BPVAL,DR="6003////3" D ^DIE
 Q
 ;
VALIDATE ;  this will only validate the Application Registration and
 ;          the Pharmacy registrations
 Q
 N AREG
 ;
 D BPSJVAL^BPSJAREG(2)
 ;
 S DIR(0)="EO"
 D ^DIR
 I X=U Q
 ;
 S AREG="" F  S AREG=$O(^BPS(9002313.56,AREG)) Q:'AREG  D  I X=U Q
 . D REG^BPSJPREG(AREG,2)
 . S DIR(0)="EO"
 . D ^DIR
 ;
 Q
