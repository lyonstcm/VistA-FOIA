DGPTX79 ; ;02/13/06
 ;;
1 N X,X1,X2 S DIXR=442 D X1(U) K X2 M X2=X D X1("F") K X1 M X1=X
 I $G(X(1))]"",$G(X(2))]"",$G(X(3))]"",$G(X(4))]"" D
 . D KDGPT9D^DGPTDDCR(.X,.DA,"D SD9")
 K X M X=X2 I $G(X(1))]"",$G(X(2))]"",$G(X(3))]"",$G(X(4))]"" D
 . D SDGPT9D^DGPTDDCR(.X,.DA,"D SD9")
 Q
X1(DION) K X
 S X(1)=$G(@DIEZTMP@("V",45,DIIENS,.01,DION),$P($G(^DGPT(DA,0)),U,1))
 S X(2)=$G(@DIEZTMP@("V",45,DIIENS,2,DION),$P($G(^DGPT(DA,0)),U,2))
 S X(3)=$G(@DIEZTMP@("V",45,DIIENS,11,DION),$P($G(^DGPT(DA,0)),U,11))
 S X(4)=$G(@DIEZTMP@("V",45,DIIENS,79.24,DION),$P($G(^DGPT(DA,70)),U,24))
 S X(5)=$G(@DIEZTMP@("V",45,DIIENS,70,DION),$P($G(^DGPT(DA,70)),U,1))
 S X=$G(X(1))
 Q
2 N X,X1,X2 S DIXR=443 D X2(U) K X2 M X2=X D X2("F") K X1 M X1=X
 I $G(X(1))]"",$G(X(2))]"",$G(X(3))]"",$G(X(4))]"" D
 . D KDGPT9D^DGPTDDCR(.X,.DA,"D SD10")
 K X M X=X2 I $G(X(1))]"",$G(X(2))]"",$G(X(3))]"",$G(X(4))]"" D
 . D SDGPT9D^DGPTDDCR(.X,.DA,"D SD10")
 Q
X2(DION) K X
 S X(1)=$G(@DIEZTMP@("V",45,DIIENS,.01,DION),$P($G(^DGPT(DA,0)),U,1))
 S X(2)=$G(@DIEZTMP@("V",45,DIIENS,2,DION),$P($G(^DGPT(DA,0)),U,2))
 S X(3)=$G(@DIEZTMP@("V",45,DIIENS,11,DION),$P($G(^DGPT(DA,0)),U,11))
 S X(4)=$G(@DIEZTMP@("V",45,DIIENS,79.241,DION),$P($G(^DGPT(DA,71)),U,1))
 S X(5)=$G(@DIEZTMP@("V",45,DIIENS,70,DION),$P($G(^DGPT(DA,70)),U,1))
 S X=$G(X(1))
 Q
3 N X,X1,X2 S DIXR=444 D X3(U) K X2 M X2=X D X3("F") K X1 M X1=X
 I $G(X(1))]"",$G(X(2))]"",$G(X(3))]"",$G(X(4))]"" D
 . D KDGPT9D^DGPTDDCR(.X,.DA,"D SD11")
 K X M X=X2 I $G(X(1))]"",$G(X(2))]"",$G(X(3))]"",$G(X(4))]"" D
 . D SDGPT9D^DGPTDDCR(.X,.DA,"D SD11")
 Q
X3(DION) K X
 S X(1)=$G(@DIEZTMP@("V",45,DIIENS,.01,DION),$P($G(^DGPT(DA,0)),U,1))
 S X(2)=$G(@DIEZTMP@("V",45,DIIENS,2,DION),$P($G(^DGPT(DA,0)),U,2))
 S X(3)=$G(@DIEZTMP@("V",45,DIIENS,11,DION),$P($G(^DGPT(DA,0)),U,11))
 S X(4)=$G(@DIEZTMP@("V",45,DIIENS,79.242,DION),$P($G(^DGPT(DA,71)),U,2))
 S X(5)=$G(@DIEZTMP@("V",45,DIIENS,70,DION),$P($G(^DGPT(DA,70)),U,1))
 S X=$G(X(1))
 Q
4 N X,X1,X2 S DIXR=445 D X4(U) K X2 M X2=X D X4("F") K X1 M X1=X
 I $G(X(1))]"",$G(X(2))]"",$G(X(3))]"",$G(X(4))]"" D
 . D KDGPT9D^DGPTDDCR(.X,.DA,"D SD12")
 K X M X=X2 I $G(X(1))]"",$G(X(2))]"",$G(X(3))]"",$G(X(4))]"" D
 . D SDGPT9D^DGPTDDCR(.X,.DA,"D SD12")
 Q
X4(DION) K X
 S X(1)=$G(@DIEZTMP@("V",45,DIIENS,.01,DION),$P($G(^DGPT(DA,0)),U,1))
 S X(2)=$G(@DIEZTMP@("V",45,DIIENS,2,DION),$P($G(^DGPT(DA,0)),U,2))
 S X(3)=$G(@DIEZTMP@("V",45,DIIENS,11,DION),$P($G(^DGPT(DA,0)),U,11))
 S X(4)=$G(@DIEZTMP@("V",45,DIIENS,79.243,DION),$P($G(^DGPT(DA,71)),U,3))
 S X(5)=$G(@DIEZTMP@("V",45,DIIENS,70,DION),$P($G(^DGPT(DA,70)),U,1))
 S X=$G(X(1))
 Q
