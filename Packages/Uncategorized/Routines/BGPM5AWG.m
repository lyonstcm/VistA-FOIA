BGPM5AWG ;IHS/MSC/MMT-CREATED BY ^ATXSTX ON AUG 29, 2011;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;**1**;JUN 27, 2011;Build 106
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"1033,61392078360 ",.02)
 ;;61392078360
 ;;9002226.02101,"1033,61392078390 ",.01)
 ;;61392078390
 ;;9002226.02101,"1033,61392078390 ",.02)
 ;;61392078390
 ;;9002226.02101,"1033,61392078391 ",.01)
 ;;61392078391
 ;;9002226.02101,"1033,61392078391 ",.02)
 ;;61392078391
 ;;9002226.02101,"1033,61392079325 ",.01)
 ;;61392079325
 ;;9002226.02101,"1033,61392079325 ",.02)
 ;;61392079325
 ;;9002226.02101,"1033,61392079330 ",.01)
 ;;61392079330
 ;;9002226.02101,"1033,61392079330 ",.02)
 ;;61392079330
 ;;9002226.02101,"1033,61392079331 ",.01)
 ;;61392079331
 ;;9002226.02101,"1033,61392079331 ",.02)
 ;;61392079331
 ;;9002226.02101,"1033,61392079339 ",.01)
 ;;61392079339
 ;;9002226.02101,"1033,61392079339 ",.02)
 ;;61392079339
 ;;9002226.02101,"1033,61392094725 ",.01)
 ;;61392094725
 ;;9002226.02101,"1033,61392094725 ",.02)
 ;;61392094725
 ;;9002226.02101,"1033,61392094730 ",.01)
 ;;61392094730
 ;;9002226.02101,"1033,61392094730 ",.02)
 ;;61392094730
 ;;9002226.02101,"1033,61392094731 ",.01)
 ;;61392094731
 ;;9002226.02101,"1033,61392094731 ",.02)
 ;;61392094731
 ;;9002226.02101,"1033,61392094739 ",.01)
 ;;61392094739
 ;;9002226.02101,"1033,61392094739 ",.02)
 ;;61392094739
 ;;9002226.02101,"1033,61392099131 ",.01)
 ;;61392099131
 ;;9002226.02101,"1033,61392099131 ",.02)
 ;;61392099131
 ;;9002226.02101,"1033,61392099139 ",.01)
 ;;61392099139
 ;;9002226.02101,"1033,61392099139 ",.02)
 ;;61392099139
 ;;9002226.02101,"1033,61442016101 ",.01)
 ;;61442016101
 ;;9002226.02101,"1033,61442016101 ",.02)
 ;;61442016101
 ;;9002226.02101,"1033,61442016105 ",.01)
 ;;61442016105
 ;;9002226.02101,"1033,61442016105 ",.02)
 ;;61442016105
 ;;9002226.02101,"1033,61442016201 ",.01)
 ;;61442016201
 ;;9002226.02101,"1033,61442016201 ",.02)
 ;;61442016201
 ;;9002226.02101,"1033,61442016205 ",.01)
 ;;61442016205
 ;;9002226.02101,"1033,61442016205 ",.02)
 ;;61442016205
 ;;9002226.02101,"1033,61442017101 ",.01)
 ;;61442017101
 ;;9002226.02101,"1033,61442017101 ",.02)
 ;;61442017101
 ;;9002226.02101,"1033,61442017105 ",.01)
 ;;61442017105
 ;;9002226.02101,"1033,61442017105 ",.02)
 ;;61442017105
 ;;9002226.02101,"1033,61442017130 ",.01)
 ;;61442017130
 ;;9002226.02101,"1033,61442017130 ",.02)
 ;;61442017130
 ;;9002226.02101,"1033,61442017201 ",.01)
 ;;61442017201
 ;;9002226.02101,"1033,61442017201 ",.02)
 ;;61442017201
 ;;9002226.02101,"1033,61442017205 ",.01)
 ;;61442017205
 ;;9002226.02101,"1033,61442017205 ",.02)
 ;;61442017205
 ;;9002226.02101,"1033,61442017230 ",.01)
 ;;61442017230
 ;;9002226.02101,"1033,61442017230 ",.02)
 ;;61442017230
 ;;9002226.02101,"1033,61442020101 ",.01)
 ;;61442020101
 ;;9002226.02101,"1033,61442020101 ",.02)
 ;;61442020101
 ;;9002226.02101,"1033,61442020102 ",.01)
 ;;61442020102
 ;;9002226.02101,"1033,61442020102 ",.02)
 ;;61442020102
 ;;9002226.02101,"1033,61442020201 ",.01)
 ;;61442020201
 ;;9002226.02101,"1033,61442020201 ",.02)
 ;;61442020201
 ;;9002226.02101,"1033,61442020202 ",.01)
 ;;61442020202
 ;;9002226.02101,"1033,61442020202 ",.02)
 ;;61442020202
 ;;9002226.02101,"1033,61442022201 ",.01)
 ;;61442022201
 ;;9002226.02101,"1033,61442022201 ",.02)
 ;;61442022201
 ;;9002226.02101,"1033,61442022210 ",.01)
 ;;61442022210
 ;;9002226.02101,"1033,61442022210 ",.02)
 ;;61442022210
 ;;9002226.02101,"1033,61442022301 ",.01)
 ;;61442022301
 ;;9002226.02101,"1033,61442022301 ",.02)
 ;;61442022301
 ;;9002226.02101,"1033,61442022305 ",.01)
 ;;61442022305
 ;;9002226.02101,"1033,61442022305 ",.02)
 ;;61442022305
 ;;9002226.02101,"1033,61442022401 ",.01)
 ;;61442022401
 ;;9002226.02101,"1033,61442022401 ",.02)
 ;;61442022401
 ;;9002226.02101,"1033,61442022404 ",.01)
 ;;61442022404
 ;;9002226.02101,"1033,61442022404 ",.02)
 ;;61442022404
 ;;9002226.02101,"1033,61442022450 ",.01)
 ;;61442022450
 ;;9002226.02101,"1033,61442022450 ",.02)
 ;;61442022450
 ;;9002226.02101,"1033,61553001272 ",.01)
 ;;61553001272
 ;;9002226.02101,"1033,61553001272 ",.02)
 ;;61553001272
 ;;9002226.02101,"1033,61553001473 ",.01)
 ;;61553001473
 ;;9002226.02101,"1033,61553001473 ",.02)
 ;;61553001473
 ;;9002226.02101,"1033,61553021148 ",.01)
 ;;61553021148
 ;;9002226.02101,"1033,61553021148 ",.02)
 ;;61553021148
 ;;9002226.02101,"1033,61570008510 ",.01)
 ;;61570008510
 ;;9002226.02101,"1033,61570008510 ",.02)
 ;;61570008510
 ;;9002226.02101,"1033,61570008610 ",.01)
 ;;61570008610
 ;;9002226.02101,"1033,61570008610 ",.02)
 ;;61570008610
 ;;9002226.02101,"1033,61607049401 ",.01)
 ;;61607049401
 ;;9002226.02101,"1033,61607049401 ",.02)
 ;;61607049401
 ;;9002226.02101,"1033,61714021601 ",.01)
 ;;61714021601
 ;;9002226.02101,"1033,61714021601 ",.02)
 ;;61714021601
 ;;9002226.02101,"1033,61714021602 ",.01)
 ;;61714021602
 ;;9002226.02101,"1033,61714021602 ",.02)
 ;;61714021602
 ;;9002226.02101,"1033,61714021603 ",.01)
 ;;61714021603
 ;;9002226.02101,"1033,61714021603 ",.02)
 ;;61714021603
 ;;9002226.02101,"1033,61748011114 ",.01)
 ;;61748011114
 ;;9002226.02101,"1033,61748011114 ",.02)
 ;;61748011114
 ;;9002226.02101,"1033,61748020160 ",.01)
 ;;61748020160
 ;;9002226.02101,"1033,61748020160 ",.02)
 ;;61748020160
 ;;9002226.02101,"1033,61807000228 ",.01)
 ;;61807000228
 ;;9002226.02101,"1033,61807000228 ",.02)
 ;;61807000228
 ;;9002226.02101,"1033,61807000230 ",.01)
 ;;61807000230
 ;;9002226.02101,"1033,61807000230 ",.02)
 ;;61807000230
 ;;9002226.02101,"1033,61807000328 ",.01)
 ;;61807000328
 ;;9002226.02101,"1033,61807000328 ",.02)
 ;;61807000328
 ;;9002226.02101,"1033,61807000428 ",.01)
 ;;61807000428
 ;;9002226.02101,"1033,61807000428 ",.02)
 ;;61807000428
 ;;9002226.02101,"1033,61807000430 ",.01)
 ;;61807000430
 ;;9002226.02101,"1033,61807000430 ",.02)
 ;;61807000430
 ;;9002226.02101,"1033,61807000440 ",.01)
 ;;61807000440
 ;;9002226.02101,"1033,61807000440 ",.02)
 ;;61807000440
 ;;9002226.02101,"1033,61807000520 ",.01)
 ;;61807000520
 ;;9002226.02101,"1033,61807000520 ",.02)
 ;;61807000520
 ;;9002226.02101,"1033,61807000528 ",.01)
 ;;61807000528
 ;;9002226.02101,"1033,61807000528 ",.02)
 ;;61807000528
 ;;9002226.02101,"1033,61807000620 ",.01)
 ;;61807000620
 ;;9002226.02101,"1033,61807000620 ",.02)
 ;;61807000620
 ;;9002226.02101,"1033,61807000621 ",.01)
 ;;61807000621
 ;;9002226.02101,"1033,61807000621 ",.02)
 ;;61807000621
 ;;9002226.02101,"1033,61807000628 ",.01)
 ;;61807000628
 ;;9002226.02101,"1033,61807000628 ",.02)
 ;;61807000628
 ;;9002226.02101,"1033,61807000630 ",.01)
 ;;61807000630
 ;;9002226.02101,"1033,61807000630 ",.02)
 ;;61807000630
 ;;9002226.02101,"1033,61807000640 ",.01)
 ;;61807000640
 ;;9002226.02101,"1033,61807000640 ",.02)
 ;;61807000640
 ;;9002226.02101,"1033,61807001328 ",.01)
 ;;61807001328
 ;;9002226.02101,"1033,61807001328 ",.02)
 ;;61807001328
 ;;9002226.02101,"1033,61807001528 ",.01)
 ;;61807001528
 ;;9002226.02101,"1033,61807001528 ",.02)
 ;;61807001528
 ;;9002226.02101,"1033,61807003828 ",.01)
 ;;61807003828
 ;;9002226.02101,"1033,61807003828 ",.02)
 ;;61807003828
 ;;9002226.02101,"1033,61807004828 ",.01)
 ;;61807004828
 ;;9002226.02101,"1033,61807004828 ",.02)
 ;;61807004828
 ;;9002226.02101,"1033,61808010005 ",.01)
 ;;61808010005
 ;;9002226.02101,"1033,61808010005 ",.02)
 ;;61808010005
 ;;9002226.02101,"1033,61808010050 ",.01)
 ;;61808010050
 ;;9002226.02101,"1033,61808010050 ",.02)
 ;;61808010050
 ;;9002226.02101,"1033,61808015050 ",.01)
 ;;61808015050
 ;;9002226.02101,"1033,61808015050 ",.02)
 ;;61808015050
 ;;9002226.02101,"1033,61808021005 ",.01)
 ;;61808021005
 ;;9002226.02101,"1033,61808021005 ",.02)
 ;;61808021005
 ;;9002226.02101,"1033,61808021050 ",.01)
 ;;61808021050
 ;;9002226.02101,"1033,61808021050 ",.02)
 ;;61808021050
 ;;9002226.02101,"1033,61808320005 ",.01)
 ;;61808320005
 ;;9002226.02101,"1033,61808320005 ",.02)
 ;;61808320005
 ;;9002226.02101,"1033,61947648003 ",.01)
 ;;61947648003
 ;;9002226.02101,"1033,61947648003 ",.02)
 ;;61947648003
 ;;9002226.02101,"1033,61970011500 ",.01)
 ;;61970011500
 ;;9002226.02101,"1033,61970011500 ",.02)
 ;;61970011500
 ;;9002226.02101,"1033,61970011501 ",.01)
 ;;61970011501
 ;;9002226.02101,"1033,61970011501 ",.02)
 ;;61970011501
 ;;9002226.02101,"1033,61970011505 ",.01)
 ;;61970011505
 ;;9002226.02101,"1033,61970011505 ",.02)
 ;;61970011505
 ;;9002226.02101,"1033,61970012000 ",.01)
 ;;61970012000
 ;;9002226.02101,"1033,61970012000 ",.02)
 ;;61970012000
 ;;9002226.02101,"1033,61970012001 ",.01)
 ;;61970012001
 ;;9002226.02101,"1033,61970012001 ",.02)
 ;;61970012001
 ;;9002226.02101,"1033,61970012005 ",.01)
 ;;61970012005
 ;;9002226.02101,"1033,61970012005 ",.02)
 ;;61970012005
 ;;9002226.02101,"1033,61971011501 ",.01)
 ;;61971011501
 ;;9002226.02101,"1033,61971011501 ",.02)
 ;;61971011501
 ;;9002226.02101,"1033,61971011505 ",.01)
 ;;61971011505
 ;;9002226.02101,"1033,61971011505 ",.02)
 ;;61971011505
 ;;9002226.02101,"1033,61971012001 ",.01)
 ;;61971012001
 ;;9002226.02101,"1033,61971012001 ",.02)
 ;;61971012001
 ;;9002226.02101,"1033,61971012005 ",.01)
 ;;61971012005
 ;;9002226.02101,"1033,61971012005 ",.02)
 ;;61971012005
 ;;9002226.02101,"1033,62037077705 ",.01)
 ;;62037077705
 ;;9002226.02101,"1033,62037077705 ",.02)
 ;;62037077705
 ;;9002226.02101,"1033,62037077710 ",.01)
 ;;62037077710
 ;;9002226.02101,"1033,62037077710 ",.02)
 ;;62037077710
 ;;9002226.02101,"1033,62037077714 ",.01)
 ;;62037077714
 ;;9002226.02101,"1033,62037077714 ",.02)
 ;;62037077714
 ;;9002226.02101,"1033,62037077760 ",.01)
 ;;62037077760
 ;;9002226.02101,"1033,62037077760 ",.02)
 ;;62037077760
 ;;9002226.02101,"1033,62125021515 ",.01)
 ;;62125021515
 ;;9002226.02101,"1033,62125021515 ",.02)
 ;;62125021515
 ;;9002226.02101,"1033,62125031709 ",.01)
 ;;62125031709
 ;;9002226.02101,"1033,62125031709 ",.02)
 ;;62125031709
 ;;9002226.02101,"1033,62125031809 ",.01)
 ;;62125031809
 ;;9002226.02101,"1033,62125031809 ",.02)
 ;;62125031809
 ;;9002226.02101,"1033,62125031813 ",.01)
 ;;62125031813
 ;;9002226.02101,"1033,62125031813 ",.02)
 ;;62125031813
 ;;9002226.02101,"1033,62125031909 ",.01)
 ;;62125031909
 ;;9002226.02101,"1033,62125031909 ",.02)
 ;;62125031909
 ;;9002226.02101,"1033,62125032009 ",.01)
 ;;62125032009
 ;;9002226.02101,"1033,62125032009 ",.02)
 ;;62125032009
 ;;9002226.02101,"1033,62125032013 ",.01)
 ;;62125032013
 ;;9002226.02101,"1033,62125032013 ",.02)
 ;;62125032013
 ;;9002226.02101,"1033,62125041515 ",.01)
 ;;62125041515
 ;;9002226.02101,"1033,62125041515 ",.02)
 ;;62125041515
 ;;9002226.02101,"1033,62138008401 ",.01)
 ;;62138008401
 ;;9002226.02101,"1033,62138008401 ",.02)
 ;;62138008401
 ;;9002226.02101,"1033,62138011401 ",.01)
 ;;62138011401
 ;;9002226.02101,"1033,62138011401 ",.02)
 ;;62138011401
 ;;9002226.02101,"1033,62138060101 ",.01)
 ;;62138060101
 ;;9002226.02101,"1033,62138060101 ",.02)
 ;;62138060101
 ;;9002226.02101,"1033,62138103301 ",.01)
 ;;62138103301
 ;;9002226.02101,"1033,62138103301 ",.02)
 ;;62138103301
 ;;9002226.02101,"1033,62138600501 ",.01)
 ;;62138600501
 ;;9002226.02101,"1033,62138600501 ",.02)
 ;;62138600501
 ;;9002226.02101,"1033,62138738301 ",.01)
 ;;62138738301
 ;;9002226.02101,"1033,62138738301 ",.02)
 ;;62138738301
 ;;9002226.02101,"1033,62147500601 ",.01)
 ;;62147500601
 ;;9002226.02101,"1033,62147500601 ",.02)
 ;;62147500601
 ;;9002226.02101,"1033,62147500602 ",.01)
 ;;62147500602
 ;;9002226.02101,"1033,62147500602 ",.02)
 ;;62147500602
 ;;9002226.02101,"1033,62147500701 ",.01)
 ;;62147500701
 ;;9002226.02101,"1033,62147500701 ",.02)
 ;;62147500701
 ;;9002226.02101,"1033,62147500702 ",.01)
 ;;62147500702
 ;;9002226.02101,"1033,62147500702 ",.02)
 ;;62147500702