BGPLXF ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON NOV 18, 2003 ;
 ;;7.0;IHS CLINICAL REPORTING;;JAN 24, 2007
 ;;BGP HGBA1C LOINC CODES
 ;
 ; This routine loads Taxonomy BGP HGBA1C LOINC CODES
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
 ;;21,"17855-8 ")
 ;;1
 ;;21,"17856-6 ")
 ;;2
 ;;21,"4547-6 ")
 ;;3
 ;;21,"4548-4 ")
 ;;4
 ;;21,"4549-2 ")
 ;;5
 ;;9002226,784,.01)
 ;;BGP HGBA1C LOINC CODES
 ;;9002226,784,.02)
 ;;@
 ;;9002226,784,.04)
 ;;@
 ;;9002226,784,.06)
 ;;@
 ;;9002226,784,.08)
 ;;@
 ;;9002226,784,.09)
 ;;@
 ;;9002226,784,.11)
 ;;@
 ;;9002226,784,.12)
 ;;@
 ;;9002226,784,.13)
 ;;1
 ;;9002226,784,.14)
 ;;FIHS
 ;;9002226,784,.15)
 ;;95.3
 ;;9002226,784,.16)
 ;;@
 ;;9002226,784,.17)
 ;;@
 ;;9002226,784,3101)
 ;;@
 ;;9002226.02101,"784,17855-8 ",.01)
 ;;17855-8
 ;;9002226.02101,"784,17855-8 ",.02)
 ;;17855-8
 ;;9002226.02101,"784,17856-6 ",.01)
 ;;17856-6
 ;;9002226.02101,"784,17856-6 ",.02)
 ;;17856-6
 ;;9002226.02101,"784,4547-6 ",.01)
 ;;4547-6
 ;;9002226.02101,"784,4547-6 ",.02)
 ;;4547-6
 ;;9002226.02101,"784,4548-4 ",.01)
 ;;4548-4
 ;;9002226.02101,"784,4548-4 ",.02)
 ;;4548-4
 ;;9002226.02101,"784,4549-2 ",.01)
 ;;4549-2
 ;;9002226.02101,"784,4549-2 ",.02)
 ;;4549-2
 ;
OTHER ; OTHER ROUTINES
 Q