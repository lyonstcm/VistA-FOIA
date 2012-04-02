BGPVXD ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON JUL 06, 2004 ;
 ;;7.0;IHS CLINICAL REPORTING;;JAN 24, 2007
 ;;BGP COLO CPTS
 ;
 ; This routine loads Taxonomy BGP COLO CPTS
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
 ;;21,"44388 ")
 ;;1
 ;;21,"45355 ")
 ;;2
 ;;21,"45378 ")
 ;;3
 ;;21,"45387 ")
 ;;4
 ;;21,"G0105 ")
 ;;5
 ;;21,"G0121 ")
 ;;6
 ;;9002226,818,.01)
 ;;BGP COLO CPTS
 ;;9002226,818,.02)
 ;;@
 ;;9002226,818,.04)
 ;;@
 ;;9002226,818,.06)
 ;;@
 ;;9002226,818,.08)
 ;;0
 ;;9002226,818,.09)
 ;;3040706
 ;;9002226,818,.11)
 ;;@
 ;;9002226,818,.12)
 ;;455
 ;;9002226,818,.13)
 ;;1
 ;;9002226,818,.14)
 ;;@
 ;;9002226,818,.15)
 ;;81
 ;;9002226,818,.16)
 ;;@
 ;;9002226,818,.17)
 ;;@
 ;;9002226,818,3101)
 ;;@
 ;;9002226.02101,"818,44388 ",.01)
 ;;44388 
 ;;9002226.02101,"818,44388 ",.02)
 ;;44397 
 ;;9002226.02101,"818,45355 ",.01)
 ;;45355 
 ;;9002226.02101,"818,45355 ",.02)
 ;;45355 
 ;;9002226.02101,"818,45378 ",.01)
 ;;45378 
 ;;9002226.02101,"818,45378 ",.02)
 ;;45385 
 ;;9002226.02101,"818,45387 ",.01)
 ;;45387 
 ;;9002226.02101,"818,45387 ",.02)
 ;;45387 
 ;;9002226.02101,"818,G0105 ",.01)
 ;;G0105 
 ;;9002226.02101,"818,G0105 ",.02)
 ;;G0105 
 ;;9002226.02101,"818,G0121 ",.01)
 ;;G0121 
 ;;9002226.02101,"818,G0121 ",.02)
 ;;G0121 
 ;
OTHER ; OTHER ROUTINES
 Q