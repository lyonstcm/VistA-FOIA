PRCHHI3 ;WISC/TGH-IFCAP SEGMENT CU ;6/18/92  1:07 PM
V ;;5.1;IFCAP;;Oct 20, 2000
 ;Per VHA Directive 10-93-142, this routine should not be modified.
CU(A,CNTR,NUM) ;CUSTOMER INFORMATION SEGMENT
 N STRNG,DEA,ZIP
 S PRCHSITE=+$P(A,U)
 S PRCHCUST=$G(^PRC(411,PRCHSITE,3))
 S PRCHTP(1,CNTR+1)="S X=""|CU"";512"
 S PRCHTP(1,CNTR+2)="S X=0;512.1"
 S PRCHTP(1,CNTR+3)="S X=$P(^PRC(411,PRCHSITE,0),U,10);512.2"
 S PRCHTP(1,CNTR+4)="S X=$P(PRCHCUST,U,1);512.3"
 S PRCHTP(1,CNTR+5)="S X=$P(PRCHCUST,U,2);512.4"
 S PRCHTP(1,CNTR+6)="S X=$P(PRCHCUST,U,3);512.7"
 S PRCHTP(1,CNTR+7)="S X=$P(PRCHCUST,U,4) S:X]"""" X=$P($G(^DIC(5,X,0)),U,2);512.8"
 S PRCHTP(1,CNTR+8)="S X=$P(PRCHCUST,U,5);512.9"
 S CNTR=CNTR+8
 S DEA="",ZIP=$P(PRCHCUST,U,5) I ZIP["-" S ZIP=$P(ZIP,"-",1)_$P(ZIP,"-",2)
 S NUM=NUM+1,^TMP($J,"STRING",NUM)="CU"_"^"_$P(PRCHCUST,U,1)_"^"_DEA_"^"_$P(PRCHCUST,U,1,2)_"^^^"_$P(PRCHCUST,U,3)_"^"_$P($G(^DIC(5,$P(PRCHCUST,U,4),0)),U,2)_"^"_ZIP_"^|"
 Q