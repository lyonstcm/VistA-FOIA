IBXX21 ; COMPILED XREF FOR FILE #399.042 ; 09/19/10
 ; 
 S DA=0
A1 ;
 I $D(DISET) K DIKLM S:DIKM1=1 DIKLM=1 G @DIKM1
0 ;
A S DA=$O(^DGCR(399,DA(1),"RC",DA)) I DA'>0 S DA=0 G END
1 ;
 S DIKZ(0)=$G(^DGCR(399,DA(1),"RC",DA,0))
 S X=$P(DIKZ(0),U,1)
 I X'="" S ^DGCR(399,DA(1),"RC","B",$E(X,1,30),DA)=""
 S X=$P(DIKZ(0),U,1)
 I X'="" I $P(^DGCR(399,DA(1),"RC",DA,0),U,5) S ^DGCR(399,DA(1),"RC","ABS",$P(^DGCR(399,DA(1),"RC",DA,0),U,5),$E(X,1,30),DA)=""
 S X=$P(DIKZ(0),U,2)
 I X'="" D 21^IBCU2
 S X=$P(DIKZ(0),U,3)
 I X'="" D 31^IBCU2
 S X=$P(DIKZ(0),U,4)
 I X'="" S DGXRF=1 D TC^IBCU2 K DGXRF
 S X=$P(DIKZ(0),U,5)
 I X'="" S ^DGCR(399,DA(1),"RC","ABS",$E(X,1,30),+^DGCR(399,DA(1),"RC",DA,0),DA)=""
 S X=$P(DIKZ(0),U,6)
 I X'="" I $$RC^IBEFUNC1(DA(1),DA) S ^DGCR(399,"ASC1",$E(X,1,30),DA(1),DA)=""
 S X=$P(DIKZ(0),U,6)
 I X'="" I $$RC^IBEFUNC1(DA(1),DA) S ^DGCR(399,"ASC2",DA(1),$E(X,1,30),DA)=""
 S X=$P(DIKZ(0),U,7)
 I X'="" I $$RC^IBEFUNC1(DA(1),DA) S ^DGCR(399,"ASC1",$P(^DGCR(399,DA(1),"RC",DA,0),U,6),DA(1),DA)=""
 S X=$P(DIKZ(0),U,7)
 I X'="" I $$RC^IBEFUNC1(DA(1),DA) S ^DGCR(399,"ASC2",DA(1),$P(^DGCR(399,DA(1),"RC",DA,0),U,6),DA)=""
 S X=$P(DIKZ(0),U,15)
 I X'="" S ^DGCR(399,DA(1),"RC","ACP",$E(X,1,30),DA)=""
 G:'$D(DIKLM) A Q:$D(DISET)
END G ^IBXX22
