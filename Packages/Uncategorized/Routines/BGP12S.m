BGP12S ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON APR 14, 2011 ;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;;JUN 27, 2011;Build 33
 ;;BGP ANNUAL WELLNESS CPTS
 ;
 ; This routine loads Taxonomy BGP ANNUAL WELLNESS CPTS
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
 ;;21,"G0402 ")
 ;;2
 ;;21,"G0438 ")
 ;;1
 ;;21,"G0439 ")
 ;;3
 ;;9002226,1098,.01)
 ;;BGP ANNUAL WELLNESS CPTS
 ;;9002226,1098,.02)
 ;;@
 ;;9002226,1098,.04)
 ;;@
 ;;9002226,1098,.06)
 ;;@
 ;;9002226,1098,.08)
 ;;0
 ;;9002226,1098,.09)
 ;;3110414
 ;;9002226,1098,.11)
 ;;@
 ;;9002226,1098,.12)
 ;;455
 ;;9002226,1098,.13)
 ;;1
 ;;9002226,1098,.14)
 ;;@
 ;;9002226,1098,.15)
 ;;81
 ;;9002226,1098,.16)
 ;;@
 ;;9002226,1098,.17)
 ;;@
 ;;9002226,1098,3101)
 ;;@
 ;;9002226.02101,"1098,G0402 ",.01)
 ;;G0402 
 ;;9002226.02101,"1098,G0402 ",.02)
 ;;G0402 
 ;;9002226.02101,"1098,G0438 ",.01)
 ;;G0438 
 ;;9002226.02101,"1098,G0438 ",.02)
 ;;G0438 
 ;;9002226.02101,"1098,G0439 ",.01)
 ;;G0439 
 ;;9002226.02101,"1098,G0439 ",.02)
 ;;G0439 
 ;
OTHER ; OTHER ROUTINES
 Q