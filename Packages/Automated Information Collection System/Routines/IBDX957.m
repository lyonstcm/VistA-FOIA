IBDX957 ; COMPILED XREF FOR FILE #357.95 ; 09/19/10
 ; 
 S DIKZK=1
 S DIKZ(0)=$G(^IBD(357.95,DA,0))
 S X=$P(DIKZ(0),U,1)
 I X'="" S ^IBD(357.95,"B",$E(X,1,30),DA)=""
 S X=$P(DIKZ(0),U,2)
 I X'="" S ^IBD(357.95,"ADEL",$E(X,1,30),DA)=""
 S X=$P(DIKZ(0),U,3)
 I X'="" S ^IBD(357.95,"C",$E(X,1,30),DA)=""
 S DIKZ(12)=$G(^IBD(357.95,DA,12))
 S X=$P(DIKZ(12),U,2)
 I X'="" S ^IBD(357.95,"D",$E(X,1,30),DA)=""
END G ^IBDX958
