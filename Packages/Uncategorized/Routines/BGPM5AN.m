BGPM5AN ;IHS/MSC/MMT-CREATED BY ^ATXSTX ON AUG 04, 2011;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;**1**;JUN 27, 2011;Build 106
 ;;BGPMU PTCA PROCEDURE
 ;
 ; This routine loads Taxonomy BGPMU PTCA PROCEDURE
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
 ;;21,"00.66 ")
 ;;1
 ;;21,"36.06 ")
 ;;2
 ;;21,"36.07 ")
 ;;3
 ;;21,"36.09 ")
 ;;4
 ;;9002226,966,.01)
 ;;BGPMU PTCA PROCEDURE
 ;;9002226,966,.02)
 ;;PTCA Procedure ICD0 codes
 ;;9002226,966,.04)
 ;;@
 ;;9002226,966,.06)
 ;;@
 ;;9002226,966,.08)
 ;;@
 ;;9002226,966,.09)
 ;;@
 ;;9002226,966,.11)
 ;;@
 ;;9002226,966,.12)
 ;;@
 ;;9002226,966,.13)
 ;;@
 ;;9002226,966,.14)
 ;;@
 ;;9002226,966,.15)
 ;;80.1
 ;;9002226,966,.16)
 ;;@
 ;;9002226,966,.17)
 ;;@
 ;;9002226,966,3101)
 ;;@
 ;;9002226.02101,"966,00.66 ",.01)
 ;;00.66
 ;;9002226.02101,"966,00.66 ",.02)
 ;;00.66
 ;;9002226.02101,"966,36.06 ",.01)
 ;;36.06
 ;;9002226.02101,"966,36.06 ",.02)
 ;;36.06
 ;;9002226.02101,"966,36.07 ",.01)
 ;;36.07
 ;;9002226.02101,"966,36.07 ",.02)
 ;;36.07
 ;;9002226.02101,"966,36.09 ",.01)
 ;;36.09
 ;;9002226.02101,"966,36.09 ",.02)
 ;;36.09
 ;
OTHER ; OTHER ROUTINES
 Q