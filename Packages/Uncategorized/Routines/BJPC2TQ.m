BJPC2TQ ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON JUN 23, 2008 ;
 ;;2.0;IHS PCC SUITE;;MAY 14, 2009
 ;;DM AUDIT PROBLEM HTN DIAGNOSES
 ;
 ; This routine loads Taxonomy DM AUDIT PROBLEM HTN DIAGNOSES
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 D OTHER
 I $O(^TMP("ATX",$J,3.6,0)) D BULL^ATXSTX2
 I $O(^TMP("ATX",$J,9002226,0)) D TAX^ATXSTX2
 D KILL^ATXSTX2
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;21,"401.0 ")
 ;;1
 ;;9002226,87,.01)
 ;;DM AUDIT PROBLEM HTN DIAGNOSES
 ;;9002226,87,.02)
 ;;DM AUDIT PROBLEM HTN DXS
 ;;9002226,87,.04)
 ;;n
 ;;9002226,87,.06)
 ;;@
 ;;9002226,87,.08)
 ;;0
 ;;9002226,87,.09)
 ;;2930811
 ;;9002226,87,.11)
 ;;@
 ;;9002226,87,.12)
 ;;266
 ;;9002226,87,.13)
 ;;1
 ;;9002226,87,.14)
 ;;@
 ;;9002226,87,.15)
 ;;80
 ;;9002226,87,.16)
 ;;@
 ;;9002226,87,.17)
 ;;@
 ;;9002226,87,3101)
 ;;@
 ;;9002226.02101,"87,401.0 ",.01)
 ;;401.0
 ;;9002226.02101,"87,401.0 ",.02)
 ;;405.99
 ;
OTHER ; OTHER ROUTINES
 Q