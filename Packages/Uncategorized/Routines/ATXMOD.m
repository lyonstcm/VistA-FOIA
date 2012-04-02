ATXMOD ; IHS/OHPRD/TMJ -  ICD9 TAXONOMY FIELD ; 
 ;;2.0;IHS PCC SUITE;;MAY 14, 2009
 ;
ZTM ;ENTRY POINT FOR TASKMAN
 D INIT
 D DFNS
 D NEWTOLD
 D OLDTONEW
 I $D(ZTQUEUED) S ZTREQ="@"
 D EOJ
 Q
 ;
INIT ;
 I '$D(^ATXPAT(ATXX,0))#2!('$P(^ATXAX(ATXX,0),U,6)) S ATXPRO="" ;PT TAXONOMY FILE NOT UPDATED
 K ^TMP("ATXNEW",ATXX)
 Q
 ;
DFNS ;GET LO AND HIGH DFNS FOR THIS TAXONOMY
 S ATXSS=0 F ATXL=0:0 S ATXSS=$O(^ATXAX(ATXX,21,ATXSS)) Q:ATXSS'=+ATXSS  S ATXLOV=$P(^(ATXSS,0),U)_" ",ATXHIV=$P(^(0),U,2)_" " D GETVAL
 Q
 ;
GETVAL ;GET RANGE OF DFNS
 S ^TMP("ATXNEW",ATXX,$O(^ICD9("BA",ATXLOV,"")))=""
 Q:'ATXHIV!(ATXHIV=ATXLOV)
 F  S ATXLOV=$O(^ICD9("BA",ATXLOV)) Q:ATXLOV](ATXHIV)!(ATXLOV="")  S ATXDFN=$O(^ICD9("BA",ATXLOV,"")) S ^TMP("ATXNEW",ATXX,ATXDFN)=""
 Q
 ;
NEWTOLD ;SEE WHAT CODES ADDED TO TAXONOMY
 S ATXD=0 F L=0:0 S ATXD=$O(^TMP("ATXNEW",ATXX,ATXD)) Q:ATXD'=+ATXD  I '$D(^TMP("ATXEMP",ATXX,ATXD)) D DIEADD
 Q
 ;
OLDTONEW ;SEE WHAT CODES DELETED FROM TAXONOMY
 S ATXD=0 F L=0:0 S ATXD=$O(^TMP("ATXEMP",ATXX,ATXD)) Q:ATXD'=+ATXD  I '$D(^TMP("ATXNEW",ATXX,ATXD)) D DIEDELT
 Q
 ;
DIEADD ;CALL TO DIE TO ENTER TAXONOMY TO NEWLY ENTERED CODES INTO TAXONOMY FILE
 S DIE="^ICD9(",DR="9999999.41///"_"`"_ATXX,DA=ATXD D ^DIE K DIE
 Q
 ;
DIEDELT ;CALL TO DIE TO DELETE TAXONOMY FROM DELETED CODES OUT OF TAXONOMY FILE
 S DIE="^ICD9(",DR="9999999.41///"_"`"_ATXX,DR(2,80.999999941)=".01///@",DA=ATXD D ^DIE K DIE
 Q
 ;
EOJ ;
 K ^TMP("ATXNEW",ATXX),^TMP("ATXEMP",ATXX),^TMP("ATXTAX",ATXX)
 K ATXLOV,ATXHIVO,ATXHI,ATXDFN,ATXD,ATXWT,ATXDEL,ATXPRO,ATXX,ATXX,ATXSS
 Q
 ;