DGMTXX21 ; COMPILED XREF FOR FILE #408.22 ; 09/19/10
 ; 
 S DIKZK=2
 S DIKZ(0)=$G(^DGMT(408.22,DA,0))
 S X=$P(DIKZ(0),U,2)
 I X'="" K ^DGMT(408.22,"AIND",$E(X,1,30),DA)
 S X=$P(DIKZ(0),U,2)
 I X'="" K ^DGMT(408.22,"AMT",+$P($G(^DGMT(408.22,DA,"MT")),U),+$P(^DGMT(408.22,DA,0),U),X,DA)
 S X=$P(DIKZ(0),U,5)
 I X'="" D
 .N DIK,DIV,DIU,DIN
 .K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(0)=X X ^DD(408.22,.05,1,1,79.2) S X=X="" I X S X=DIV S Y(1)=$S($D(^DGMT(408.22,D0,0)):^(0),1:"") S X=$P(Y(1),U,6),X=X S DIU=X K Y S X="" X ^DD(408.22,.05,1,1,2.4)
 S X=$P(DIKZ(0),U,5)
 I X'="" I $D(^DGMT(408.22,DA,0)),$P(^(0),U,5)="" D FUN^DGMTDD2:'$P(^(0),U,8),SP^DGMTDD2
 S X=$P(DIKZ(0),U,5)
 I X'="" D E40822^DGRTRIG(DA)
 S DIKZ(0)=$G(^DGMT(408.22,DA,0))
 S X=$P(DIKZ(0),U,6)
 I X'="" D
 .N DIK,DIV,DIU,DIN
 .K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(0)=X X ^DD(408.22,.06,1,1,79.2) S X=X="" I X S X=DIV S Y(1)=$S($D(^DGMT(408.22,D0,0)):^(0),1:"") S X=$P(Y(1),U,7),X=X S DIU=X K Y S X="" X ^DD(408.22,.06,1,1,2.4)
 S X=$P(DIKZ(0),U,6)
 I X'="" D
 .N DIK,DIV,DIU,DIN
 .K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(0)=X X ^DD(408.22,.06,1,2,79.2) S X=X="" I X S X=DIV S Y(1)=$S($D(^DGMT(408.22,D0,0)):^(0),1:"") S X=$P(Y(1),U,10),X=X S DIU=X K Y S X="" X ^DD(408.22,.06,1,2,2.4)
 S X=$P(DIKZ(0),U,6)
 I X'="" D E40822^DGRTRIG(DA)
 S DIKZ(0)=$G(^DGMT(408.22,DA,0))
 S X=$P(DIKZ(0),U,7)
 I X'="" I $D(^DGMT(408.22,DA,0)),'$P(^(0),U,6),$P(^(0),U,7)="" D SP^DGMTDD2
 S X=$P(DIKZ(0),U,7)
 I X'="" D E40822^DGRTRIG(DA)
 S X=$P(DIKZ(0),U,8)
 I X'="" I $D(^DGMT(408.22,DA,0)),$P(^(0),U,8)="",'$P(^(0),U,5) D FUN^DGMTDD2
 S X=$P(DIKZ(0),U,8)
 I X'="" D E40822^DGRTRIG(DA)
 S X=$P(DIKZ(0),U,9)
 I X'="" D E40822^DGRTRIG(DA)
 S X=$P(DIKZ(0),U,10)
 I X'="" D E40822^DGRTRIG(DA)
 S X=$P(DIKZ(0),U,11)
 I X'="" D
 .N DIK,DIV,DIU,DIN
 .X ^DD(408.22,.11,1,1,2.3) I X S X=DIV S Y(1)=$S($D(^DGMT(408.22,D0,0)):^(0),1:"") S X=$P(Y(1),U,12),X=X S DIU=X K Y S X="" S DIH=$G(^DGMT(408.22,DIV(0),0)),DIV=X S $P(^(0),U,12)=DIV,DIH=408.22,DIG=.12 D ^DICR
 S X=$P(DIKZ(0),U,11)
 I X'="" I $D(^DGMT(408.22,DA,0)),$P(^(0),U,11)="" D INC^DGMTDD2
 S X=$P(DIKZ(0),U,11)
 I X'="" D E40822^DGRTRIG(DA)
 S DIKZ(0)=$G(^DGMT(408.22,DA,0))
 S X=$P(DIKZ(0),U,12)
 I X'="" I $D(^DGMT(408.22,DA,0)),$P(^(0),U,12)="",$P(^(0),U,11) D INC^DGMTDD2
 S X=$P(DIKZ(0),U,12)
 I X'="" D E40822^DGRTRIG(DA)
 S X=$P(DIKZ(0),U,13)
 I X'="" D E40822^DGRTRIG(DA)
 S X=$P(DIKZ(0),U,14)
 I X'="" D
 .N DIK,DIV,DIU,DIN
 .X ^DD(408.22,.14,1,1,2.3) I X S X=DIV S Y(1)=$S($D(^DGMT(408.22,D0,0)):^(0),1:"") S X=$P(Y(1),U,15),X=X S DIU=X K Y S X="" S DIH=$G(^DGMT(408.22,DIV(0),0)),DIV=X S $P(^(0),U,15)=DIV,DIH=408.22,DIG=.15 D ^DICR
 S X=$P(DIKZ(0),U,14)
 I X'="" D
 .N DIK,DIV,DIU,DIN
 .X ^DD(408.22,.14,1,2,2.3) I X S X=DIV S Y(1)=$S($D(^DGMT(408.22,D0,0)):^(0),1:"") S X=$P(Y(1),U,16),X=X S DIU=X K Y S X="" S DIH=$G(^DGMT(408.22,DIV(0),0)),DIV=X S $P(^(0),U,16)=DIV,DIH=408.22,DIG=.16 D ^DICR
 S X=$P(DIKZ(0),U,14)
 I X'="" D
 .N DIK,DIV,DIU,DIN
 .X ^DD(408.22,.14,1,3,2.3) I X S X=DIV S Y(1)=$S($D(^DGMT(408.22,D0,0)):^(0),1:"") S X=$P(Y(1),U,17),X=X S DIU=X K Y S X="" S DIH=$G(^DGMT(408.22,DIV(0),0)),DIV=X S $P(^(0),U,17)=DIV,DIH=408.22,DIG=.17 D ^DICR
 S DIKZ(0)=$G(^DGMT(408.22,DA,0))
 S X=$P(DIKZ(0),U,16)
 I X'="" D
 .N DIK,DIV,DIU,DIN
 .X ^DD(408.22,.16,1,1,2.3) I X S X=DIV S Y(1)=$S($D(^DGMT(408.22,D0,0)):^(0),1:"") S X=$P(Y(1),U,15),X=X S DIU=X K Y S X="" S DIH=$G(^DGMT(408.22,DIV(0),0)),DIV=X S $P(^(0),U,15)=DIV,DIH=408.22,DIG=.15 D ^DICR
 S DIKZ(0)=$G(^DGMT(408.22,DA,0))
 S X=$P(DIKZ(0),U,17)
 I X'="" D
 .N DIK,DIV,DIU,DIN
 .X ^DD(408.22,.17,1,1,2.3) I X S X=DIV S Y(1)=$S($D(^DGMT(408.22,D0,0)):^(0),1:"") S X=$P(Y(1),U,16),X=X S DIU=X K Y S X="" S DIH=$G(^DGMT(408.22,DIV(0),0)),DIV=X S $P(^(0),U,16)=DIV,DIH=408.22,DIG=.16 D ^DICR
 S DIKZ(0)=$G(^DGMT(408.22,DA,0))
 S X=$P(DIKZ(0),U,18)
 I X'="" D E40822^DGRTRIG(DA)
 S DIKZ("MT")=$G(^DGMT(408.22,DA,"MT"))
 S X=$P(DIKZ("MT"),U,1)
 I X'="" K ^DGMT(408.22,"AMT",X,+$P(^DGMT(408.22,DA,0),U),+$P($G(^DGMT(408.22,DA,0)),U,2),DA)
 S X=$P(DIKZ(0),U,1)
 I X'="" K ^DGMT(408.22,"B",$E(X,1,30),DA)
 S X=$P(DIKZ(0),U,1)
 I X'="" K ^DGMT(408.22,"AMT",+$P($G(^DGMT(408.22,DA,"MT")),U),X,+$P(^DGMT(408.22,DA,0),U,2),DA)
END Q
