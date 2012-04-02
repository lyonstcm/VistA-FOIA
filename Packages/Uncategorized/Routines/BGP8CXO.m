BGP8CXO ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON SEP 28, 2007 ;
 ;;8.0;IHS CLINICAL REPORTING;;MAR 12, 2008
 ;;;BGP6;;SEP 28, 2007
 ;;BGP CMS LEUKEMIA DXS
 ;
 ; This routine loads Taxonomy BGP CMS LEUKEMIA DXS
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
 ;;21,"204.0 ")
 ;;1
 ;;9002226,644,.01)
 ;;BGP CMS LEUKEMIA DXS
 ;;9002226,644,.02)
 ;;@
 ;;9002226,644,.04)
 ;;@
 ;;9002226,644,.06)
 ;;@
 ;;9002226,644,.08)
 ;;0
 ;;9002226,644,.09)
 ;;3070601
 ;;9002226,644,.11)
 ;;@
 ;;9002226,644,.12)
 ;;31
 ;;9002226,644,.13)
 ;;1
 ;;9002226,644,.14)
 ;;@
 ;;9002226,644,.15)
 ;;80
 ;;9002226,644,.16)
 ;;@
 ;;9002226,644,.17)
 ;;@
 ;;9002226,644,3101)
 ;;@
 ;;9002226.02101,"644,204.0 ",.01)
 ;;204.0 
 ;;9002226.02101,"644,204.0 ",.02)
 ;;208.91 
 ;
OTHER ; OTHER ROUTINES
 Q