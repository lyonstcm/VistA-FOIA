ECX89042 ; COMPILED XREF FOR FILE #728.904 ; 09/19/10
 ; 
 S DIKZK=1
 S DIKZ(0)=$G(^ECX(728.904,DA,0))
 S X=$P(DIKZ(0),U,1)
 I X'="" S ^ECX(728.904,"AINV",-X,DA)=""
 S X=$P(DIKZ(0),U,3)
 I X'="" S ^ECX(728.904,"A",$E(X,1,30),DA)=""
 S DIKZ(1)=$G(^ECX(728.904,DA,1))
 S X=$P(DIKZ(1),U,1)
 I X'="" S ^ECX(728.904,"AC",$E(X,1,30),DA)=""
END Q
