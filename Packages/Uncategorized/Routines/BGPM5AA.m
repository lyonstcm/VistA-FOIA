BGPM5AA ;IHS/MSC/SAT-CREATED BY ^ATXSTX ON JUL 01, 2011;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;**1**;JUN 27, 2011;Build 106
 ;;BGPMU ESRD PX
 ;
 ; This routine loads Taxonomy BGPMU ESRD PX
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
 ;;21,"38.95 ")
 ;;1
 ;;21,"39.27 ")
 ;;2
 ;;21,"39.42 ")
 ;;4
 ;;21,"39.43 ")
 ;;5
 ;;21,"39.53 ")
 ;;6
 ;;21,"39.93 ")
 ;;7
 ;;21,"39.94 ")
 ;;8
 ;;21,"39.95 ")
 ;;9
 ;;21,"54.98 ")
 ;;10
 ;;21,"55.6 ")
 ;;11
 ;;21,"55.61 ")
 ;;12
 ;;21,"55.69 ")
 ;;13
 ;;9002226,873,.01)
 ;;BGPMU ESRD PX
 ;;9002226,873,.02)
 ;;ESRD ICD PROCEDURE CODES
 ;;9002226,873,.04)
 ;;@
 ;;9002226,873,.06)
 ;;@
 ;;9002226,873,.08)
 ;;@
 ;;9002226,873,.09)
 ;;3110615
 ;;9002226,873,.11)
 ;;@
 ;;9002226,873,.12)
 ;;@
 ;;9002226,873,.13)
 ;;@
 ;;9002226,873,.14)
 ;;@
 ;;9002226,873,.15)
 ;;80.1
 ;;9002226,873,.16)
 ;;1
 ;;9002226,873,.17)
 ;;@
 ;;9002226,873,3101)
 ;;@
 ;;9002226.02101,"873,38.95 ",.01)
 ;;38.95
 ;;9002226.02101,"873,38.95 ",.02)
 ;;38.95
 ;;9002226.02101,"873,39.27 ",.01)
 ;;39.27
 ;;9002226.02101,"873,39.27 ",.02)
 ;;39.27
 ;;9002226.02101,"873,39.42 ",.01)
 ;;39.42
 ;;9002226.02101,"873,39.42 ",.02)
 ;;39.42
 ;;9002226.02101,"873,39.43 ",.01)
 ;;39.43
 ;;9002226.02101,"873,39.43 ",.02)
 ;;39.43
 ;;9002226.02101,"873,39.53 ",.01)
 ;;39.53
 ;;9002226.02101,"873,39.53 ",.02)
 ;;39.53
 ;;9002226.02101,"873,39.93 ",.01)
 ;;39.93
 ;;9002226.02101,"873,39.93 ",.02)
 ;;39.93
 ;;9002226.02101,"873,39.94 ",.01)
 ;;39.94
 ;;9002226.02101,"873,39.94 ",.02)
 ;;39.94
 ;;9002226.02101,"873,39.95 ",.01)
 ;;39.95
 ;;9002226.02101,"873,39.95 ",.02)
 ;;39.95
 ;;9002226.02101,"873,54.98 ",.01)
 ;;54.98
 ;;9002226.02101,"873,54.98 ",.02)
 ;;54.98
 ;;9002226.02101,"873,55.6 ",.01)
 ;;55.6
 ;;9002226.02101,"873,55.6 ",.02)
 ;;55.6
 ;;9002226.02101,"873,55.61 ",.01)
 ;;55.61
 ;;9002226.02101,"873,55.61 ",.02)
 ;;55.61
 ;;9002226.02101,"873,55.69 ",.01)
 ;;55.69
 ;;9002226.02101,"873,55.69 ",.02)
 ;;55.69
 ;
OTHER ; OTHER ROUTINES
 Q