BGP9UXZ ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON MAR 25, 2009 ;
 ;;9.0;IHS CLINICAL REPORTING;;JUL 1, 2009
 ;;BGP DV DXS
 ;
 ; This routine loads Taxonomy BGP DV DXS
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
 ;;21,"995.80 ")
 ;;1
 ;;21,"995.85 ")
 ;;2
 ;;21,"V15.41 ")
 ;;3
 ;;9002226,322,.01)
 ;;BGP DV DXS
 ;;9002226,322,.02)
 ;;@
 ;;9002226,322,.04)
 ;;n
 ;;9002226,322,.06)
 ;;@
 ;;9002226,322,.08)
 ;;0
 ;;9002226,322,.09)
 ;;3050420
 ;;9002226,322,.11)
 ;;@
 ;;9002226,322,.12)
 ;;31
 ;;9002226,322,.13)
 ;;1
 ;;9002226,322,.14)
 ;;@
 ;;9002226,322,.15)
 ;;80
 ;;9002226,322,.16)
 ;;@
 ;;9002226,322,.17)
 ;;@
 ;;9002226,322,3101)
 ;;@
 ;;9002226.02101,"322,995.80 ",.01)
 ;;995.80 
 ;;9002226.02101,"322,995.80 ",.02)
 ;;995.83 
 ;;9002226.02101,"322,995.85 ",.01)
 ;;995.85 
 ;;9002226.02101,"322,995.85 ",.02)
 ;;995.85 
 ;;9002226.02101,"322,V15.41 ",.01)
 ;;V15.41 
 ;;9002226.02101,"322,V15.41 ",.02)
 ;;V15.49 
 ;
OTHER ; OTHER ROUTINES
 Q