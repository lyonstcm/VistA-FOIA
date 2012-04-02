BGPM5AAR ;IHS/MSC/MMT-CREATED BY ^ATXSTX ON JUL 26, 2011;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;**1**;JUN 27, 2011;Build 106
 ;;BGPMU ACUTE INPT ENC
 ;
 ; This routine loads Taxonomy BGPMU ACUTE INPT ENC
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
 ;;21,"99221 ")
 ;;1
 ;;21,"99222 ")
 ;;2
 ;;21,"99223 ")
 ;;3
 ;;21,"99231 ")
 ;;4
 ;;21,"99232 ")
 ;;5
 ;;21,"99233 ")
 ;;6
 ;;21,"99238 ")
 ;;7
 ;;21,"99239 ")
 ;;8
 ;;21,"99251 ")
 ;;9
 ;;21,"99252 ")
 ;;10
 ;;21,"99253 ")
 ;;11
 ;;21,"99254 ")
 ;;12
 ;;21,"99255 ")
 ;;13
 ;;21,"99291 ")
 ;;14
 ;;9002226,962,.01)
 ;;BGPMU ACUTE INPT ENC
 ;;9002226,962,.02)
 ;;Inpt CPTS
 ;;9002226,962,.04)
 ;;n
 ;;9002226,962,.06)
 ;;@
 ;;9002226,962,.08)
 ;;@
 ;;9002226,962,.09)
 ;;3110726
 ;;9002226,962,.11)
 ;;@
 ;;9002226,962,.12)
 ;;@
 ;;9002226,962,.13)
 ;;@
 ;;9002226,962,.14)
 ;;@
 ;;9002226,962,.15)
 ;;81
 ;;9002226,962,.16)
 ;;@
 ;;9002226,962,.17)
 ;;@
 ;;9002226,962,3101)
 ;;@
 ;;9002226.02101,"962,99221 ",.01)
 ;;99221
 ;;9002226.02101,"962,99221 ",.02)
 ;;99221
 ;;9002226.02101,"962,99222 ",.01)
 ;;99222
 ;;9002226.02101,"962,99222 ",.02)
 ;;99222
 ;;9002226.02101,"962,99223 ",.01)
 ;;99223
 ;;9002226.02101,"962,99223 ",.02)
 ;;99223
 ;;9002226.02101,"962,99231 ",.01)
 ;;99231
 ;;9002226.02101,"962,99231 ",.02)
 ;;99231
 ;;9002226.02101,"962,99232 ",.01)
 ;;99232
 ;;9002226.02101,"962,99232 ",.02)
 ;;99232
 ;;9002226.02101,"962,99233 ",.01)
 ;;99233
 ;;9002226.02101,"962,99233 ",.02)
 ;;99233
 ;;9002226.02101,"962,99238 ",.01)
 ;;99238
 ;;9002226.02101,"962,99238 ",.02)
 ;;99238
 ;;9002226.02101,"962,99239 ",.01)
 ;;99239
 ;;9002226.02101,"962,99239 ",.02)
 ;;99239
 ;;9002226.02101,"962,99251 ",.01)
 ;;99251
 ;;9002226.02101,"962,99251 ",.02)
 ;;99251
 ;;9002226.02101,"962,99252 ",.01)
 ;;99252
 ;;9002226.02101,"962,99252 ",.02)
 ;;99252
 ;;9002226.02101,"962,99253 ",.01)
 ;;99253
 ;;9002226.02101,"962,99253 ",.02)
 ;;99253
 ;;9002226.02101,"962,99254 ",.01)
 ;;99254
 ;;9002226.02101,"962,99254 ",.02)
 ;;99254
 ;;9002226.02101,"962,99255 ",.01)
 ;;99255
 ;;9002226.02101,"962,99255 ",.02)
 ;;99255
 ;;9002226.02101,"962,99291 ",.01)
 ;;99291
 ;;9002226.02101,"962,99291 ",.02)
 ;;99291
 ;
OTHER ; OTHER ROUTINES
 Q