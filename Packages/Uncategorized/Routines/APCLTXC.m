APCLTXC ; IHS/OHPRD/TMJ -CREATED BY ^ATXSTX ON JAN 09, 1997 ;
 ;;3.0;IHS PCC REPORTS;;FEB 05, 1997
 ;;APCL INJ AIR TRANSPORT
 ;
 ; This routine loads Taxonomy APCL INJ AIR TRANSPORT
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
 ;;21,"E840.0 ")
 ;;1
 ;;21,"E988.5 ")
 ;;2
 ;;9002226,144,.01)
 ;;APCL INJ AIR TRANSPORT
 ;;9002226,144,.02)
 ;;AIR TRANSPORT E-CODES
 ;;9002226,144,.04)
 ;;@
 ;;9002226,144,.06)
 ;;@
 ;;9002226,144,.08)
 ;;1
 ;;9002226,144,.09)
 ;;2961021.134704
 ;;9002226,144,.11)
 ;;@
 ;;9002226,144,.12)
 ;;157
 ;;9002226,144,.13)
 ;;1
 ;;9002226,144,.14)
 ;;BA
 ;;9002226,144,.15)
 ;;80
 ;;9002226,144,.16)
 ;;1
 ;;9002226,144,.17)
 ;;@
 ;;9002226,144,3101)
 ;;@
 ;;9002226.02101,"144,E840.0 ",.01)
 ;;E840.0
 ;;9002226.02101,"144,E840.0 ",.02)
 ;;E845.9
 ;;9002226.02101,"144,E988.5 ",.01)
 ;;E988.5
 ;;9002226.02101,"144,E988.5 ",.02)
 ;;E988.5
 ;
OTHER ; OTHER ROUTINES
 Q