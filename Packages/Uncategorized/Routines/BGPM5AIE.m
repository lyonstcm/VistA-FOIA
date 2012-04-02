BGPM5AIE ;IHS/MSC/MMT-CREATED BY ^ATXSTX ON JUL 15, 2011;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;**1**;JUN 27, 2011;Build 106
 ;;BGPMU HYPOTENSION DX
 ;
 ; This routine loads Taxonomy BGPMU HYPOTENSION DX
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
 ;;21,"458.0 ")
 ;;1
 ;;21,"458.1 ")
 ;;2
 ;;21,"458.21 ")
 ;;3
 ;;21,"458.29 ")
 ;;4
 ;;21,"458.8 ")
 ;;5
 ;;21,"458.9 ")
 ;;6
 ;;9002226,896,.01)
 ;;BGPMU HYPOTENSION DX
 ;;9002226,896,.02)
 ;;Hypotension ICD9s
 ;;9002226,896,.04)
 ;;n
 ;;9002226,896,.06)
 ;;@
 ;;9002226,896,.08)
 ;;@
 ;;9002226,896,.09)
 ;;3110714
 ;;9002226,896,.11)
 ;;@
 ;;9002226,896,.12)
 ;;@
 ;;9002226,896,.13)
 ;;@
 ;;9002226,896,.14)
 ;;@
 ;;9002226,896,.15)
 ;;80
 ;;9002226,896,.16)
 ;;1
 ;;9002226,896,.17)
 ;;@
 ;;9002226,896,3101)
 ;;@
 ;;9002226.02101,"896,458.0 ",.01)
 ;;458.0
 ;;9002226.02101,"896,458.0 ",.02)
 ;;458.0
 ;;9002226.02101,"896,458.1 ",.01)
 ;;458.1
 ;;9002226.02101,"896,458.1 ",.02)
 ;;458.1
 ;;9002226.02101,"896,458.21 ",.01)
 ;;458.21
 ;;9002226.02101,"896,458.21 ",.02)
 ;;458.21
 ;;9002226.02101,"896,458.29 ",.01)
 ;;458.29
 ;;9002226.02101,"896,458.29 ",.02)
 ;;458.29
 ;;9002226.02101,"896,458.8 ",.01)
 ;;458.8
 ;;9002226.02101,"896,458.8 ",.02)
 ;;458.8
 ;;9002226.02101,"896,458.9 ",.01)
 ;;458.9
 ;;9002226.02101,"896,458.9 ",.02)
 ;;458.9
 ;
OTHER ; OTHER ROUTINES
 Q