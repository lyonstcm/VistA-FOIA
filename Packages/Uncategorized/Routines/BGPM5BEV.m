BGPM5BEV ;IHS/MSC/MMT-CREATED BY ^ATXSTX ON SEP 12, 2011;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;**1**;JUN 27, 2011;Build 106
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"1084,00615359631 ",.01)
 ;;00615359631
 ;;9002226.02101,"1084,00615359631 ",.02)
 ;;00615359631
 ;;9002226.02101,"1084,00615359639 ",.01)
 ;;00615359639
 ;;9002226.02101,"1084,00615359639 ",.02)
 ;;00615359639
 ;;9002226.02101,"1084,00615450939 ",.01)
 ;;00615450939
 ;;9002226.02101,"1084,00615450939 ",.02)
 ;;00615450939
 ;;9002226.02101,"1084,00615458031 ",.01)
 ;;00615458031
 ;;9002226.02101,"1084,00615458031 ",.02)
 ;;00615458031
 ;;9002226.02101,"1084,00615458039 ",.01)
 ;;00615458039
 ;;9002226.02101,"1084,00615458039 ",.02)
 ;;00615458039
 ;;9002226.02101,"1084,00615550531 ",.01)
 ;;00615550531
 ;;9002226.02101,"1084,00615550531 ",.02)
 ;;00615550531
 ;;9002226.02101,"1084,00615550539 ",.01)
 ;;00615550539
 ;;9002226.02101,"1084,00615550539 ",.02)
 ;;00615550539
 ;;9002226.02101,"1084,00615558331 ",.01)
 ;;00615558331
 ;;9002226.02101,"1084,00615558331 ",.02)
 ;;00615558331
 ;;9002226.02101,"1084,00615558339 ",.01)
 ;;00615558339
 ;;9002226.02101,"1084,00615558339 ",.02)
 ;;00615558339
 ;;9002226.02101,"1084,00615558431 ",.01)
 ;;00615558431
 ;;9002226.02101,"1084,00615558431 ",.02)
 ;;00615558431
 ;;9002226.02101,"1084,00615558439 ",.01)
 ;;00615558439
 ;;9002226.02101,"1084,00615558439 ",.02)
 ;;00615558439
 ;;9002226.02101,"1084,00615558531 ",.01)
 ;;00615558531
 ;;9002226.02101,"1084,00615558531 ",.02)
 ;;00615558531
 ;;9002226.02101,"1084,00615558539 ",.01)
 ;;00615558539
 ;;9002226.02101,"1084,00615558539 ",.02)
 ;;00615558539
 ;;9002226.02101,"1084,00615559031 ",.01)
 ;;00615559031
 ;;9002226.02101,"1084,00615559031 ",.02)
 ;;00615559031
 ;;9002226.02101,"1084,00615559039 ",.01)
 ;;00615559039
 ;;9002226.02101,"1084,00615559039 ",.02)
 ;;00615559039
 ;;9002226.02101,"1084,00615657539 ",.01)
 ;;00615657539
 ;;9002226.02101,"1084,00615657539 ",.02)
 ;;00615657539
 ;;9002226.02101,"1084,00615657639 ",.01)
 ;;00615657639
 ;;9002226.02101,"1084,00615657639 ",.02)
 ;;00615657639
 ;;9002226.02101,"1084,00615659639 ",.01)
 ;;00615659639
 ;;9002226.02101,"1084,00615659639 ",.02)
 ;;00615659639
 ;;9002226.02101,"1084,00615752339 ",.01)
 ;;00615752339
 ;;9002226.02101,"1084,00615752339 ",.02)
 ;;00615752339
 ;;9002226.02101,"1084,00615758539 ",.01)
 ;;00615758539
 ;;9002226.02101,"1084,00615758539 ",.02)
 ;;00615758539
 ;;9002226.02101,"1084,00615758639 ",.01)
 ;;00615758639
 ;;9002226.02101,"1084,00615758639 ",.02)
 ;;00615758639
 ;;9002226.02101,"1084,00615762631 ",.01)
 ;;00615762631
 ;;9002226.02101,"1084,00615762631 ",.02)
 ;;00615762631
 ;;9002226.02101,"1084,00615762639 ",.01)
 ;;00615762639
 ;;9002226.02101,"1084,00615762639 ",.02)
 ;;00615762639
 ;;9002226.02101,"1084,00677154401 ",.01)
 ;;00677154401
 ;;9002226.02101,"1084,00677154401 ",.02)
 ;;00677154401
 ;;9002226.02101,"1084,00677154405 ",.01)
 ;;00677154405
 ;;9002226.02101,"1084,00677154405 ",.02)
 ;;00677154405
 ;;9002226.02101,"1084,00677154501 ",.01)
 ;;00677154501
 ;;9002226.02101,"1084,00677154501 ",.02)
 ;;00677154501
 ;;9002226.02101,"1084,00677154505 ",.01)
 ;;00677154505
 ;;9002226.02101,"1084,00677154505 ",.02)
 ;;00677154505
 ;;9002226.02101,"1084,00781113801 ",.01)
 ;;00781113801
 ;;9002226.02101,"1084,00781113801 ",.02)
 ;;00781113801
 ;;9002226.02101,"1084,00781113810 ",.01)
 ;;00781113810
 ;;9002226.02101,"1084,00781113810 ",.02)
 ;;00781113810
 ;;9002226.02101,"1084,00781114601 ",.01)
 ;;00781114601
 ;;9002226.02101,"1084,00781114601 ",.02)
 ;;00781114601
 ;;9002226.02101,"1084,00781114610 ",.01)
 ;;00781114610
 ;;9002226.02101,"1084,00781114610 ",.02)
 ;;00781114610
 ;;9002226.02101,"1084,00781119101 ",.01)
 ;;00781119101
 ;;9002226.02101,"1084,00781119101 ",.02)
 ;;00781119101
 ;;9002226.02101,"1084,00781119110 ",.01)
 ;;00781119110
 ;;9002226.02101,"1084,00781119110 ",.02)
 ;;00781119110
 ;;9002226.02101,"1084,00781119111 ",.01)
 ;;00781119111
 ;;9002226.02101,"1084,00781119111 ",.02)
 ;;00781119111
 ;;9002226.02101,"1084,00781145201 ",.01)
 ;;00781145201
 ;;9002226.02101,"1084,00781145201 ",.02)
 ;;00781145201
 ;;9002226.02101,"1084,00781145210 ",.01)
 ;;00781145210
 ;;9002226.02101,"1084,00781145210 ",.02)
 ;;00781145210
 ;;9002226.02101,"1084,00781145213 ",.01)
 ;;00781145213
 ;;9002226.02101,"1084,00781145213 ",.02)
 ;;00781145213
 ;;9002226.02101,"1084,00781145301 ",.01)
 ;;00781145301
 ;;9002226.02101,"1084,00781145301 ",.02)
 ;;00781145301
 ;;9002226.02101,"1084,00781145310 ",.01)
 ;;00781145310
 ;;9002226.02101,"1084,00781145310 ",.02)
 ;;00781145310
 ;;9002226.02101,"1084,00781145313 ",.01)
 ;;00781145313
 ;;9002226.02101,"1084,00781145313 ",.02)
 ;;00781145313
 ;;9002226.02101,"1084,00781504501 ",.01)
 ;;00781504501
 ;;9002226.02101,"1084,00781504501 ",.02)
 ;;00781504501
 ;;9002226.02101,"1084,00781504510 ",.01)
 ;;00781504510
 ;;9002226.02101,"1084,00781504510 ",.02)
 ;;00781504510
 ;;9002226.02101,"1084,00781504601 ",.01)
 ;;00781504601
 ;;9002226.02101,"1084,00781504601 ",.02)
 ;;00781504601
 ;;9002226.02101,"1084,00781504610 ",.01)
 ;;00781504610
 ;;9002226.02101,"1084,00781504610 ",.02)
 ;;00781504610
 ;;9002226.02101,"1084,00781504701 ",.01)
 ;;00781504701
 ;;9002226.02101,"1084,00781504701 ",.02)
 ;;00781504701
 ;;9002226.02101,"1084,00781504710 ",.01)
 ;;00781504710
 ;;9002226.02101,"1084,00781504710 ",.02)
 ;;00781504710
 ;;9002226.02101,"1084,00781505001 ",.01)
 ;;00781505001
 ;;9002226.02101,"1084,00781505001 ",.02)
 ;;00781505001
 ;;9002226.02101,"1084,00781505005 ",.01)
 ;;00781505005
 ;;9002226.02101,"1084,00781505005 ",.02)
 ;;00781505005
 ;;9002226.02101,"1084,00781505010 ",.01)
 ;;00781505010
 ;;9002226.02101,"1084,00781505010 ",.02)
 ;;00781505010
 ;;9002226.02101,"1084,00781505061 ",.01)
 ;;00781505061
 ;;9002226.02101,"1084,00781505061 ",.02)
 ;;00781505061
 ;;9002226.02101,"1084,00781505101 ",.01)
 ;;00781505101
 ;;9002226.02101,"1084,00781505101 ",.02)
 ;;00781505101
 ;;9002226.02101,"1084,00781505105 ",.01)
 ;;00781505105
 ;;9002226.02101,"1084,00781505105 ",.02)
 ;;00781505105
 ;;9002226.02101,"1084,00781505161 ",.01)
 ;;00781505161
 ;;9002226.02101,"1084,00781505161 ",.02)
 ;;00781505161
 ;;9002226.02101,"1084,00781505201 ",.01)
 ;;00781505201
 ;;9002226.02101,"1084,00781505201 ",.02)
 ;;00781505201
 ;;9002226.02101,"1084,00781505205 ",.01)
 ;;00781505205
 ;;9002226.02101,"1084,00781505205 ",.02)
 ;;00781505205
 ;;9002226.02101,"1084,00781505261 ",.01)
 ;;00781505261
 ;;9002226.02101,"1084,00781505261 ",.02)
 ;;00781505261
 ;;9002226.02101,"1084,00781517001 ",.01)
 ;;00781517001
 ;;9002226.02101,"1084,00781517001 ",.02)
 ;;00781517001
 ;;9002226.02101,"1084,00781517005 ",.01)
 ;;00781517005
 ;;9002226.02101,"1084,00781517005 ",.02)
 ;;00781517005
 ;;9002226.02101,"1084,00781517010 ",.01)
 ;;00781517010
 ;;9002226.02101,"1084,00781517010 ",.02)
 ;;00781517010
 ;;9002226.02101,"1084,00781517101 ",.01)
 ;;00781517101
 ;;9002226.02101,"1084,00781517101 ",.02)
 ;;00781517101
 ;;9002226.02101,"1084,00781517105 ",.01)
 ;;00781517105
 ;;9002226.02101,"1084,00781517105 ",.02)
 ;;00781517105
 ;;9002226.02101,"1084,00781517110 ",.01)
 ;;00781517110
 ;;9002226.02101,"1084,00781517110 ",.02)
 ;;00781517110
 ;;9002226.02101,"1084,00781517201 ",.01)
 ;;00781517201
 ;;9002226.02101,"1084,00781517201 ",.02)
 ;;00781517201
 ;;9002226.02101,"1084,00781517205 ",.01)
 ;;00781517205
 ;;9002226.02101,"1084,00781517205 ",.02)
 ;;00781517205
 ;;9002226.02101,"1084,00781517210 ",.01)
 ;;00781517210
 ;;9002226.02101,"1084,00781517210 ",.02)
 ;;00781517210
 ;;9002226.02101,"1084,00781530401 ",.01)
 ;;00781530401
 ;;9002226.02101,"1084,00781530401 ",.02)
 ;;00781530401
 ;;9002226.02101,"1084,00781530405 ",.01)
 ;;00781530405
 ;;9002226.02101,"1084,00781530405 ",.02)
 ;;00781530405
 ;;9002226.02101,"1084,00781530410 ",.01)
 ;;00781530410
 ;;9002226.02101,"1084,00781530410 ",.02)
 ;;00781530410
 ;;9002226.02101,"1084,00781530501 ",.01)
 ;;00781530501
 ;;9002226.02101,"1084,00781530501 ",.02)
 ;;00781530501
 ;;9002226.02101,"1084,00781530505 ",.01)
 ;;00781530505
 ;;9002226.02101,"1084,00781530505 ",.02)
 ;;00781530505
 ;;9002226.02101,"1084,00781530510 ",.01)
 ;;00781530510
 ;;9002226.02101,"1084,00781530510 ",.02)
 ;;00781530510
 ;;9002226.02101,"1084,00781530601 ",.01)
 ;;00781530601
 ;;9002226.02101,"1084,00781530601 ",.02)
 ;;00781530601
 ;;9002226.02101,"1084,00781530605 ",.01)
 ;;00781530605
 ;;9002226.02101,"1084,00781530605 ",.02)
 ;;00781530605
 ;;9002226.02101,"1084,00781530610 ",.01)
 ;;00781530610
 ;;9002226.02101,"1084,00781530610 ",.02)
 ;;00781530610
 ;;9002226.02101,"1084,00855202950 ",.01)
 ;;00855202950
 ;;9002226.02101,"1084,00855202950 ",.02)
 ;;00855202950
 ;;9002226.02101,"1084,00855203550 ",.01)
 ;;00855203550
 ;;9002226.02101,"1084,00855203550 ",.02)
 ;;00855203550
 ;;9002226.02101,"1084,00855203650 ",.01)
 ;;00855203650
 ;;9002226.02101,"1084,00855203650 ",.02)
 ;;00855203650
 ;;9002226.02101,"1084,00904022360 ",.01)
 ;;00904022360
 ;;9002226.02101,"1084,00904022360 ",.02)
 ;;00904022360
 ;;9002226.02101,"1084,00904022380 ",.01)
 ;;00904022380
 ;;9002226.02101,"1084,00904022380 ",.02)
 ;;00904022380
 ;;9002226.02101,"1084,00904022540 ",.01)
 ;;00904022540
 ;;9002226.02101,"1084,00904022540 ",.02)
 ;;00904022540
 ;;9002226.02101,"1084,00904022560 ",.01)
 ;;00904022560
 ;;9002226.02101,"1084,00904022560 ",.02)
 ;;00904022560
 ;;9002226.02101,"1084,00904022660 ",.01)
 ;;00904022660
 ;;9002226.02101,"1084,00904022660 ",.02)
 ;;00904022660
 ;;9002226.02101,"1084,00904022680 ",.01)
 ;;00904022680
 ;;9002226.02101,"1084,00904022680 ",.02)
 ;;00904022680
 ;;9002226.02101,"1084,00904023460 ",.01)
 ;;00904023460
 ;;9002226.02101,"1084,00904023460 ",.02)
 ;;00904023460
 ;;9002226.02101,"1084,00904023660 ",.01)
 ;;00904023660
 ;;9002226.02101,"1084,00904023660 ",.02)
 ;;00904023660
 ;;9002226.02101,"1084,00904507560 ",.01)
 ;;00904507560
 ;;9002226.02101,"1084,00904507560 ",.02)
 ;;00904507560
 ;;9002226.02101,"1084,00904507660 ",.01)
 ;;00904507660
 ;;9002226.02101,"1084,00904507660 ",.02)
 ;;00904507660
 ;;9002226.02101,"1084,00904507740 ",.01)
 ;;00904507740
 ;;9002226.02101,"1084,00904507740 ",.02)
 ;;00904507740
 ;;9002226.02101,"1084,00904507760 ",.01)
 ;;00904507760
 ;;9002226.02101,"1084,00904507760 ",.02)
 ;;00904507760
 ;;9002226.02101,"1084,00904507780 ",.01)
 ;;00904507780
 ;;9002226.02101,"1084,00904507780 ",.02)
 ;;00904507780
 ;;9002226.02101,"1084,00904560118 ",.01)
 ;;00904560118
 ;;9002226.02101,"1084,00904560118 ",.02)
 ;;00904560118
 ;;9002226.02101,"1084,00904560152 ",.01)
 ;;00904560152
 ;;9002226.02101,"1084,00904560152 ",.02)
 ;;00904560152
 ;;9002226.02101,"1084,00904560154 ",.01)
 ;;00904560154
 ;;9002226.02101,"1084,00904560154 ",.02)
 ;;00904560154
 ;;9002226.02101,"1084,00904560161 ",.01)
 ;;00904560161
 ;;9002226.02101,"1084,00904560161 ",.02)
 ;;00904560161
 ;;9002226.02101,"1084,00904560180 ",.01)
 ;;00904560180
 ;;9002226.02101,"1084,00904560180 ",.02)
 ;;00904560180
 ;;9002226.02101,"1084,00904560189 ",.01)
 ;;00904560189
 ;;9002226.02101,"1084,00904560189 ",.02)
 ;;00904560189
 ;;9002226.02101,"1084,00904560193 ",.01)
 ;;00904560193
 ;;9002226.02101,"1084,00904560193 ",.02)
 ;;00904560193
 ;;9002226.02101,"1084,00904560240 ",.01)
 ;;00904560240
 ;;9002226.02101,"1084,00904560240 ",.02)
 ;;00904560240
 ;;9002226.02101,"1084,00904560253 ",.01)
 ;;00904560253
 ;;9002226.02101,"1084,00904560253 ",.02)
 ;;00904560253
 ;;9002226.02101,"1084,00904560261 ",.01)
 ;;00904560261
 ;;9002226.02101,"1084,00904560261 ",.02)
 ;;00904560261
 ;;9002226.02101,"1084,00904560289 ",.01)
 ;;00904560289