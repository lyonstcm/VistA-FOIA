BGPM5AWI ;IHS/MSC/MMT-CREATED BY ^ATXSTX ON AUG 29, 2011;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;**1**;JUN 27, 2011;Build 106
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"1033,63304051250 ",.02)
 ;;63304051250
 ;;9002226.02101,"1033,63304051280 ",.01)
 ;;63304051280
 ;;9002226.02101,"1033,63304051280 ",.02)
 ;;63304051280
 ;;9002226.02101,"1033,63304051401 ",.01)
 ;;63304051401
 ;;9002226.02101,"1033,63304051401 ",.02)
 ;;63304051401
 ;;9002226.02101,"1033,63304051405 ",.01)
 ;;63304051405
 ;;9002226.02101,"1033,63304051405 ",.02)
 ;;63304051405
 ;;9002226.02101,"1033,63304051501 ",.01)
 ;;63304051501
 ;;9002226.02101,"1033,63304051501 ",.02)
 ;;63304051501
 ;;9002226.02101,"1033,63304051503 ",.01)
 ;;63304051503
 ;;9002226.02101,"1033,63304051503 ",.02)
 ;;63304051503
 ;;9002226.02101,"1033,63304051504 ",.01)
 ;;63304051504
 ;;9002226.02101,"1033,63304051504 ",.02)
 ;;63304051504
 ;;9002226.02101,"1033,63304051530 ",.01)
 ;;63304051530
 ;;9002226.02101,"1033,63304051530 ",.02)
 ;;63304051530
 ;;9002226.02101,"1033,63304052001 ",.01)
 ;;63304052001
 ;;9002226.02101,"1033,63304052001 ",.02)
 ;;63304052001
 ;;9002226.02101,"1033,63304052020 ",.01)
 ;;63304052020
 ;;9002226.02101,"1033,63304052020 ",.02)
 ;;63304052020
 ;;9002226.02101,"1033,63304052101 ",.01)
 ;;63304052101
 ;;9002226.02101,"1033,63304052101 ",.02)
 ;;63304052101
 ;;9002226.02101,"1033,63304052120 ",.01)
 ;;63304052120
 ;;9002226.02101,"1033,63304052120 ",.02)
 ;;63304052120
 ;;9002226.02101,"1033,63304058201 ",.01)
 ;;63304058201
 ;;9002226.02101,"1033,63304058201 ",.02)
 ;;63304058201
 ;;9002226.02101,"1033,63304058250 ",.01)
 ;;63304058250
 ;;9002226.02101,"1033,63304058250 ",.02)
 ;;63304058250
 ;;9002226.02101,"1033,63304061401 ",.01)
 ;;63304061401
 ;;9002226.02101,"1033,63304061401 ",.02)
 ;;63304061401
 ;;9002226.02101,"1033,63304061405 ",.01)
 ;;63304061405
 ;;9002226.02101,"1033,63304061405 ",.02)
 ;;63304061405
 ;;9002226.02101,"1033,63304061413 ",.01)
 ;;63304061413
 ;;9002226.02101,"1033,63304061413 ",.02)
 ;;63304061413
 ;;9002226.02101,"1033,63304061420 ",.01)
 ;;63304061420
 ;;9002226.02101,"1033,63304061420 ",.02)
 ;;63304061420
 ;;9002226.02101,"1033,63304061501 ",.01)
 ;;63304061501
 ;;9002226.02101,"1033,63304061501 ",.02)
 ;;63304061501
 ;;9002226.02101,"1033,63304061505 ",.01)
 ;;63304061505
 ;;9002226.02101,"1033,63304061505 ",.02)
 ;;63304061505
 ;;9002226.02101,"1033,63304061511 ",.01)
 ;;63304061511
 ;;9002226.02101,"1033,63304061511 ",.02)
 ;;63304061511
 ;;9002226.02101,"1033,63304061601 ",.01)
 ;;63304061601
 ;;9002226.02101,"1033,63304061601 ",.02)
 ;;63304061601
 ;;9002226.02101,"1033,63304061605 ",.01)
 ;;63304061605
 ;;9002226.02101,"1033,63304061605 ",.02)
 ;;63304061605
 ;;9002226.02101,"1033,63304061613 ",.01)
 ;;63304061613
 ;;9002226.02101,"1033,63304061613 ",.02)
 ;;63304061613
 ;;9002226.02101,"1033,63304061620 ",.01)
 ;;63304061620
 ;;9002226.02101,"1033,63304061620 ",.02)
 ;;63304061620
 ;;9002226.02101,"1033,63304064805 ",.01)
 ;;63304064805
 ;;9002226.02101,"1033,63304064805 ",.02)
 ;;63304064805
 ;;9002226.02101,"1033,63304065401 ",.01)
 ;;63304065401
 ;;9002226.02101,"1033,63304065401 ",.02)
 ;;63304065401
 ;;9002226.02101,"1033,63304065405 ",.01)
 ;;63304065405
 ;;9002226.02101,"1033,63304065405 ",.02)
 ;;63304065405
 ;;9002226.02101,"1033,63304065411 ",.01)
 ;;63304065411
 ;;9002226.02101,"1033,63304065411 ",.02)
 ;;63304065411
 ;;9002226.02101,"1033,63304065420 ",.01)
 ;;63304065420
 ;;9002226.02101,"1033,63304065420 ",.02)
 ;;63304065420
 ;;9002226.02101,"1033,63304065430 ",.01)
 ;;63304065430
 ;;9002226.02101,"1033,63304065430 ",.02)
 ;;63304065430
 ;;9002226.02101,"1033,63304065477 ",.01)
 ;;63304065477
 ;;9002226.02101,"1033,63304065477 ",.02)
 ;;63304065477
 ;;9002226.02101,"1033,63304065501 ",.01)
 ;;63304065501
 ;;9002226.02101,"1033,63304065501 ",.02)
 ;;63304065501
 ;;9002226.02101,"1033,63304065505 ",.01)
 ;;63304065505
 ;;9002226.02101,"1033,63304065505 ",.02)
 ;;63304065505
 ;;9002226.02101,"1033,63304065511 ",.01)
 ;;63304065511
 ;;9002226.02101,"1033,63304065511 ",.02)
 ;;63304065511
 ;;9002226.02101,"1033,63304065520 ",.01)
 ;;63304065520
 ;;9002226.02101,"1033,63304065520 ",.02)
 ;;63304065520
 ;;9002226.02101,"1033,63304065530 ",.01)
 ;;63304065530
 ;;9002226.02101,"1033,63304065530 ",.02)
 ;;63304065530
 ;;9002226.02101,"1033,63304065540 ",.01)
 ;;63304065540
 ;;9002226.02101,"1033,63304065540 ",.02)
 ;;63304065540
 ;;9002226.02101,"1033,63304065550 ",.01)
 ;;63304065550
 ;;9002226.02101,"1033,63304065550 ",.02)
 ;;63304065550
 ;;9002226.02101,"1033,63304065577 ",.01)
 ;;63304065577
 ;;9002226.02101,"1033,63304065577 ",.02)
 ;;63304065577
 ;;9002226.02101,"1033,63304065601 ",.01)
 ;;63304065601
 ;;9002226.02101,"1033,63304065601 ",.02)
 ;;63304065601
 ;;9002226.02101,"1033,63304065605 ",.01)
 ;;63304065605
 ;;9002226.02101,"1033,63304065605 ",.02)
 ;;63304065605
 ;;9002226.02101,"1033,63304065627 ",.01)
 ;;63304065627
 ;;9002226.02101,"1033,63304065627 ",.02)
 ;;63304065627
 ;;9002226.02101,"1033,63304065701 ",.01)
 ;;63304065701
 ;;9002226.02101,"1033,63304065701 ",.02)
 ;;63304065701
 ;;9002226.02101,"1033,63304065705 ",.01)
 ;;63304065705
 ;;9002226.02101,"1033,63304065705 ",.02)
 ;;63304065705
 ;;9002226.02101,"1033,63304065727 ",.01)
 ;;63304065727
 ;;9002226.02101,"1033,63304065727 ",.02)
 ;;63304065727
 ;;9002226.02101,"1033,63304065801 ",.01)
 ;;63304065801
 ;;9002226.02101,"1033,63304065801 ",.02)
 ;;63304065801
 ;;9002226.02101,"1033,63304065830 ",.01)
 ;;63304065830
 ;;9002226.02101,"1033,63304065830 ",.02)
 ;;63304065830
 ;;9002226.02101,"1033,63304065901 ",.01)
 ;;63304065901
 ;;9002226.02101,"1033,63304065901 ",.02)
 ;;63304065901
 ;;9002226.02101,"1033,63304065930 ",.01)
 ;;63304065930
 ;;9002226.02101,"1033,63304065930 ",.02)
 ;;63304065930
 ;;9002226.02101,"1033,63304067501 ",.01)
 ;;63304067501
 ;;9002226.02101,"1033,63304067501 ",.02)
 ;;63304067501
 ;;9002226.02101,"1033,63304067505 ",.01)
 ;;63304067505
 ;;9002226.02101,"1033,63304067505 ",.02)
 ;;63304067505
 ;;9002226.02101,"1033,63304067601 ",.01)
 ;;63304067601
 ;;9002226.02101,"1033,63304067601 ",.02)
 ;;63304067601
 ;;9002226.02101,"1033,63304067605 ",.01)
 ;;63304067605
 ;;9002226.02101,"1033,63304067605 ",.02)
 ;;63304067605
 ;;9002226.02101,"1033,63304068801 ",.01)
 ;;63304068801
 ;;9002226.02101,"1033,63304068801 ",.02)
 ;;63304068801
 ;;9002226.02101,"1033,63304068904 ",.01)
 ;;63304068904
 ;;9002226.02101,"1033,63304068904 ",.02)
 ;;63304068904
 ;;9002226.02101,"1033,63304068950 ",.01)
 ;;63304068950
 ;;9002226.02101,"1033,63304068950 ",.02)
 ;;63304068950
 ;;9002226.02101,"1033,63304069201 ",.01)
 ;;63304069201
 ;;9002226.02101,"1033,63304069201 ",.02)
 ;;63304069201
 ;;9002226.02101,"1033,63304069205 ",.01)
 ;;63304069205
 ;;9002226.02101,"1033,63304069205 ",.02)
 ;;63304069205
 ;;9002226.02101,"1033,63304069277 ",.01)
 ;;63304069277
 ;;9002226.02101,"1033,63304069277 ",.02)
 ;;63304069277
 ;;9002226.02101,"1033,63304069301 ",.01)
 ;;63304069301
 ;;9002226.02101,"1033,63304069301 ",.02)
 ;;63304069301
 ;;9002226.02101,"1033,63304069316 ",.01)
 ;;63304069316
 ;;9002226.02101,"1033,63304069316 ",.02)
 ;;63304069316
 ;;9002226.02101,"1033,63304069377 ",.01)
 ;;63304069377
 ;;9002226.02101,"1033,63304069377 ",.02)
 ;;63304069377
 ;;9002226.02101,"1033,63304069401 ",.01)
 ;;63304069401
 ;;9002226.02101,"1033,63304069401 ",.02)
 ;;63304069401
 ;;9002226.02101,"1033,63304069405 ",.01)
 ;;63304069405
 ;;9002226.02101,"1033,63304069405 ",.02)
 ;;63304069405
 ;;9002226.02101,"1033,63304069501 ",.01)
 ;;63304069501
 ;;9002226.02101,"1033,63304069501 ",.02)
 ;;63304069501
 ;;9002226.02101,"1033,63304069505 ",.01)
 ;;63304069505
 ;;9002226.02101,"1033,63304069505 ",.02)
 ;;63304069505
 ;;9002226.02101,"1033,63304069605 ",.01)
 ;;63304069605
 ;;9002226.02101,"1033,63304069605 ",.02)
 ;;63304069605
 ;;9002226.02101,"1033,63304069650 ",.01)
 ;;63304069650
 ;;9002226.02101,"1033,63304069650 ",.02)
 ;;63304069650
 ;;9002226.02101,"1033,63304069701 ",.01)
 ;;63304069701
 ;;9002226.02101,"1033,63304069701 ",.02)
 ;;63304069701
 ;;9002226.02101,"1033,63304069705 ",.01)
 ;;63304069705
 ;;9002226.02101,"1033,63304069705 ",.02)
 ;;63304069705
 ;;9002226.02101,"1033,63304069801 ",.01)
 ;;63304069801
 ;;9002226.02101,"1033,63304069801 ",.02)
 ;;63304069801
 ;;9002226.02101,"1033,63304069805 ",.01)
 ;;63304069805
 ;;9002226.02101,"1033,63304069805 ",.02)
 ;;63304069805
 ;;9002226.02101,"1033,63304069905 ",.01)
 ;;63304069905
 ;;9002226.02101,"1033,63304069905 ",.02)
 ;;63304069905
 ;;9002226.02101,"1033,63304069950 ",.01)
 ;;63304069950
 ;;9002226.02101,"1033,63304069950 ",.02)
 ;;63304069950
 ;;9002226.02101,"1033,63304070901 ",.01)
 ;;63304070901
 ;;9002226.02101,"1033,63304070901 ",.02)
 ;;63304070901
 ;;9002226.02101,"1033,63304070905 ",.01)
 ;;63304070905
 ;;9002226.02101,"1033,63304070905 ",.02)
 ;;63304070905
 ;;9002226.02101,"1033,63304070913 ",.01)
 ;;63304070913
 ;;9002226.02101,"1033,63304070913 ",.02)
 ;;63304070913
 ;;9002226.02101,"1033,63304070914 ",.01)
 ;;63304070914
 ;;9002226.02101,"1033,63304070914 ",.02)
 ;;63304070914
 ;;9002226.02101,"1033,63304070980 ",.01)
 ;;63304070980
 ;;9002226.02101,"1033,63304070980 ",.02)
 ;;63304070980
 ;;9002226.02101,"1033,63304071001 ",.01)
 ;;63304071001
 ;;9002226.02101,"1033,63304071001 ",.02)
 ;;63304071001
 ;;9002226.02101,"1033,63304071005 ",.01)
 ;;63304071005
 ;;9002226.02101,"1033,63304071005 ",.02)
 ;;63304071005
 ;;9002226.02101,"1033,63304071013 ",.01)
 ;;63304071013
 ;;9002226.02101,"1033,63304071013 ",.02)
 ;;63304071013
 ;;9002226.02101,"1033,63304071014 ",.01)
 ;;63304071014
 ;;9002226.02101,"1033,63304071014 ",.02)
 ;;63304071014
 ;;9002226.02101,"1033,63304071080 ",.01)
 ;;63304071080
 ;;9002226.02101,"1033,63304071080 ",.02)
 ;;63304071080
 ;;9002226.02101,"1033,63304071101 ",.01)
 ;;63304071101
 ;;9002226.02101,"1033,63304071101 ",.02)
 ;;63304071101
 ;;9002226.02101,"1033,63304071105 ",.01)
 ;;63304071105
 ;;9002226.02101,"1033,63304071105 ",.02)
 ;;63304071105
 ;;9002226.02101,"1033,63304071113 ",.01)
 ;;63304071113
 ;;9002226.02101,"1033,63304071113 ",.02)
 ;;63304071113
 ;;9002226.02101,"1033,63304071114 ",.01)
 ;;63304071114
 ;;9002226.02101,"1033,63304071114 ",.02)
 ;;63304071114
 ;;9002226.02101,"1033,63304071150 ",.01)
 ;;63304071150
 ;;9002226.02101,"1033,63304071150 ",.02)
 ;;63304071150
 ;;9002226.02101,"1033,63304071180 ",.01)
 ;;63304071180
 ;;9002226.02101,"1033,63304071180 ",.02)
 ;;63304071180
 ;;9002226.02101,"1033,63304071320 ",.01)
 ;;63304071320
 ;;9002226.02101,"1033,63304071320 ",.02)
 ;;63304071320
 ;;9002226.02101,"1033,63304071505 ",.01)
 ;;63304071505
 ;;9002226.02101,"1033,63304071505 ",.02)
 ;;63304071505
 ;;9002226.02101,"1033,63304071514 ",.01)
 ;;63304071514
 ;;9002226.02101,"1033,63304071514 ",.02)
 ;;63304071514
 ;;9002226.02101,"1033,63304071550 ",.01)
 ;;63304071550
 ;;9002226.02101,"1033,63304071550 ",.02)
 ;;63304071550
 ;;9002226.02101,"1033,63304071605 ",.01)
 ;;63304071605
 ;;9002226.02101,"1033,63304071605 ",.02)
 ;;63304071605
 ;;9002226.02101,"1033,63304071614 ",.01)
 ;;63304071614
 ;;9002226.02101,"1033,63304071614 ",.02)
 ;;63304071614
 ;;9002226.02101,"1033,63304071650 ",.01)
 ;;63304071650
 ;;9002226.02101,"1033,63304071650 ",.02)
 ;;63304071650
 ;;9002226.02101,"1033,63304071701 ",.01)
 ;;63304071701
 ;;9002226.02101,"1033,63304071701 ",.02)
 ;;63304071701
 ;;9002226.02101,"1033,63304071705 ",.01)
 ;;63304071705
 ;;9002226.02101,"1033,63304071705 ",.02)
 ;;63304071705
 ;;9002226.02101,"1033,63304071714 ",.01)
 ;;63304071714
 ;;9002226.02101,"1033,63304071714 ",.02)
 ;;63304071714