BGPM5AUY ;IHS/MSC/MMT-CREATED BY ^ATXSTX ON AUG 29, 2011;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;**1**;JUN 27, 2011;Build 106
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"1033,53002022914 ",.01)
 ;;53002022914
 ;;9002226.02101,"1033,53002022914 ",.02)
 ;;53002022914
 ;;9002226.02101,"1033,53002022916 ",.01)
 ;;53002022916
 ;;9002226.02101,"1033,53002022916 ",.02)
 ;;53002022916
 ;;9002226.02101,"1033,53002022920 ",.01)
 ;;53002022920
 ;;9002226.02101,"1033,53002022920 ",.02)
 ;;53002022920
 ;;9002226.02101,"1033,53002023107 ",.01)
 ;;53002023107
 ;;9002226.02101,"1033,53002023107 ",.02)
 ;;53002023107
 ;;9002226.02101,"1033,53002023120 ",.01)
 ;;53002023120
 ;;9002226.02101,"1033,53002023120 ",.02)
 ;;53002023120
 ;;9002226.02101,"1033,53002023124 ",.01)
 ;;53002023124
 ;;9002226.02101,"1033,53002023124 ",.02)
 ;;53002023124
 ;;9002226.02101,"1033,53002023128 ",.01)
 ;;53002023128
 ;;9002226.02101,"1033,53002023128 ",.02)
 ;;53002023128
 ;;9002226.02101,"1033,53002023140 ",.01)
 ;;53002023140
 ;;9002226.02101,"1033,53002023140 ",.02)
 ;;53002023140
 ;;9002226.02101,"1033,53002023212 ",.01)
 ;;53002023212
 ;;9002226.02101,"1033,53002023212 ",.02)
 ;;53002023212
 ;;9002226.02101,"1033,53002023214 ",.01)
 ;;53002023214
 ;;9002226.02101,"1033,53002023214 ",.02)
 ;;53002023214
 ;;9002226.02101,"1033,53002023220 ",.01)
 ;;53002023220
 ;;9002226.02101,"1033,53002023220 ",.02)
 ;;53002023220
 ;;9002226.02101,"1033,53002023228 ",.01)
 ;;53002023228
 ;;9002226.02101,"1033,53002023228 ",.02)
 ;;53002023228
 ;;9002226.02101,"1033,53002023230 ",.01)
 ;;53002023230
 ;;9002226.02101,"1033,53002023230 ",.02)
 ;;53002023230
 ;;9002226.02101,"1033,53002023240 ",.01)
 ;;53002023240
 ;;9002226.02101,"1033,53002023240 ",.02)
 ;;53002023240
 ;;9002226.02101,"1033,53002023256 ",.01)
 ;;53002023256
 ;;9002226.02101,"1033,53002023256 ",.02)
 ;;53002023256
 ;;9002226.02101,"1033,53002023260 ",.01)
 ;;53002023260
 ;;9002226.02101,"1033,53002023260 ",.02)
 ;;53002023260
 ;;9002226.02101,"1033,53002023280 ",.01)
 ;;53002023280
 ;;9002226.02101,"1033,53002023280 ",.02)
 ;;53002023280
 ;;9002226.02101,"1033,53002023299 ",.01)
 ;;53002023299
 ;;9002226.02101,"1033,53002023299 ",.02)
 ;;53002023299
 ;;9002226.02101,"1033,53002023386 ",.01)
 ;;53002023386
 ;;9002226.02101,"1033,53002023386 ",.02)
 ;;53002023386
 ;;9002226.02101,"1033,53002023393 ",.01)
 ;;53002023393
 ;;9002226.02101,"1033,53002023393 ",.02)
 ;;53002023393
 ;;9002226.02101,"1033,53002024415 ",.01)
 ;;53002024415
 ;;9002226.02101,"1033,53002024415 ",.02)
 ;;53002024415
 ;;9002226.02101,"1033,53002024421 ",.01)
 ;;53002024421
 ;;9002226.02101,"1033,53002024421 ",.02)
 ;;53002024421
 ;;9002226.02101,"1033,53002024430 ",.01)
 ;;53002024430
 ;;9002226.02101,"1033,53002024430 ",.02)
 ;;53002024430
 ;;9002226.02101,"1033,53002024820 ",.01)
 ;;53002024820
 ;;9002226.02101,"1033,53002024820 ",.02)
 ;;53002024820
 ;;9002226.02101,"1033,53002024828 ",.01)
 ;;53002024828
 ;;9002226.02101,"1033,53002024828 ",.02)
 ;;53002024828
 ;;9002226.02101,"1033,53002024840 ",.01)
 ;;53002024840
 ;;9002226.02101,"1033,53002024840 ",.02)
 ;;53002024840
 ;;9002226.02101,"1033,53002024848 ",.01)
 ;;53002024848
 ;;9002226.02101,"1033,53002024848 ",.02)
 ;;53002024848
 ;;9002226.02101,"1033,53002024910 ",.01)
 ;;53002024910
 ;;9002226.02101,"1033,53002024910 ",.02)
 ;;53002024910
 ;;9002226.02101,"1033,53002024914 ",.01)
 ;;53002024914
 ;;9002226.02101,"1033,53002024914 ",.02)
 ;;53002024914
 ;;9002226.02101,"1033,53002024920 ",.01)
 ;;53002024920
 ;;9002226.02101,"1033,53002024920 ",.02)
 ;;53002024920
 ;;9002226.02101,"1033,53002024921 ",.01)
 ;;53002024921
 ;;9002226.02101,"1033,53002024921 ",.02)
 ;;53002024921
 ;;9002226.02101,"1033,53002024928 ",.01)
 ;;53002024928
 ;;9002226.02101,"1033,53002024928 ",.02)
 ;;53002024928
 ;;9002226.02101,"1033,53002024930 ",.01)
 ;;53002024930
 ;;9002226.02101,"1033,53002024930 ",.02)
 ;;53002024930
 ;;9002226.02101,"1033,53002024940 ",.01)
 ;;53002024940
 ;;9002226.02101,"1033,53002024940 ",.02)
 ;;53002024940
 ;;9002226.02101,"1033,53002025491 ",.01)
 ;;53002025491
 ;;9002226.02101,"1033,53002025491 ",.02)
 ;;53002025491
 ;;9002226.02101,"1033,53002025494 ",.01)
 ;;53002025494
 ;;9002226.02101,"1033,53002025494 ",.02)
 ;;53002025494
 ;;9002226.02101,"1033,53002025591 ",.01)
 ;;53002025591
 ;;9002226.02101,"1033,53002025591 ",.02)
 ;;53002025591
 ;;9002226.02101,"1033,53002025594 ",.01)
 ;;53002025594
 ;;9002226.02101,"1033,53002025594 ",.02)
 ;;53002025594
 ;;9002226.02101,"1033,53002026020 ",.01)
 ;;53002026020
 ;;9002226.02101,"1033,53002026020 ",.02)
 ;;53002026020
 ;;9002226.02101,"1033,53002026040 ",.01)
 ;;53002026040
 ;;9002226.02101,"1033,53002026040 ",.02)
 ;;53002026040
 ;;9002226.02101,"1033,53002027107 ",.01)
 ;;53002027107
 ;;9002226.02101,"1033,53002027107 ",.02)
 ;;53002027107
 ;;9002226.02101,"1033,53002027110 ",.01)
 ;;53002027110
 ;;9002226.02101,"1033,53002027110 ",.02)
 ;;53002027110
 ;;9002226.02101,"1033,53002027111 ",.01)
 ;;53002027111
 ;;9002226.02101,"1033,53002027111 ",.02)
 ;;53002027111
 ;;9002226.02101,"1033,53002027114 ",.01)
 ;;53002027114
 ;;9002226.02101,"1033,53002027114 ",.02)
 ;;53002027114
 ;;9002226.02101,"1033,53002027120 ",.01)
 ;;53002027120
 ;;9002226.02101,"1033,53002027120 ",.02)
 ;;53002027120
 ;;9002226.02101,"1033,53002027122 ",.01)
 ;;53002027122
 ;;9002226.02101,"1033,53002027122 ",.02)
 ;;53002027122
 ;;9002226.02101,"1033,53002027128 ",.01)
 ;;53002027128
 ;;9002226.02101,"1033,53002027128 ",.02)
 ;;53002027128
 ;;9002226.02101,"1033,53002027130 ",.01)
 ;;53002027130
 ;;9002226.02101,"1033,53002027130 ",.02)
 ;;53002027130
 ;;9002226.02101,"1033,53002027142 ",.01)
 ;;53002027142
 ;;9002226.02101,"1033,53002027142 ",.02)
 ;;53002027142
 ;;9002226.02101,"1033,53002027420 ",.01)
 ;;53002027420
 ;;9002226.02101,"1033,53002027420 ",.02)
 ;;53002027420
 ;;9002226.02101,"1033,53002027430 ",.01)
 ;;53002027430
 ;;9002226.02101,"1033,53002027430 ",.02)
 ;;53002027430
 ;;9002226.02101,"1033,53002027440 ",.01)
 ;;53002027440
 ;;9002226.02101,"1033,53002027440 ",.02)
 ;;53002027440
 ;;9002226.02101,"1033,53002028010 ",.01)
 ;;53002028010
 ;;9002226.02101,"1033,53002028010 ",.02)
 ;;53002028010
 ;;9002226.02101,"1033,53002028014 ",.01)
 ;;53002028014
 ;;9002226.02101,"1033,53002028014 ",.02)
 ;;53002028014
 ;;9002226.02101,"1033,53002028020 ",.01)
 ;;53002028020
 ;;9002226.02101,"1033,53002028020 ",.02)
 ;;53002028020
 ;;9002226.02101,"1033,53002028182 ",.01)
 ;;53002028182
 ;;9002226.02101,"1033,53002028182 ",.02)
 ;;53002028182
 ;;9002226.02101,"1033,53002028191 ",.01)
 ;;53002028191
 ;;9002226.02101,"1033,53002028191 ",.02)
 ;;53002028191
 ;;9002226.02101,"1033,53002028282 ",.01)
 ;;53002028282
 ;;9002226.02101,"1033,53002028282 ",.02)
 ;;53002028282
 ;;9002226.02101,"1033,53002028291 ",.01)
 ;;53002028291
 ;;9002226.02101,"1033,53002028291 ",.02)
 ;;53002028291
 ;;9002226.02101,"1033,53002028315 ",.01)
 ;;53002028315
 ;;9002226.02101,"1033,53002028315 ",.02)
 ;;53002028315
 ;;9002226.02101,"1033,53002028321 ",.01)
 ;;53002028321
 ;;9002226.02101,"1033,53002028321 ",.02)
 ;;53002028321
 ;;9002226.02101,"1033,53002028330 ",.01)
 ;;53002028330
 ;;9002226.02101,"1033,53002028330 ",.02)
 ;;53002028330
 ;;9002226.02101,"1033,53002028810 ",.01)
 ;;53002028810
 ;;9002226.02101,"1033,53002028810 ",.02)
 ;;53002028810
 ;;9002226.02101,"1033,53002028820 ",.01)
 ;;53002028820
 ;;9002226.02101,"1033,53002028820 ",.02)
 ;;53002028820
 ;;9002226.02101,"1033,53002028860 ",.01)
 ;;53002028860
 ;;9002226.02101,"1033,53002028860 ",.02)
 ;;53002028860
 ;;9002226.02101,"1033,53002029105 ",.01)
 ;;53002029105
 ;;9002226.02101,"1033,53002029105 ",.02)
 ;;53002029105
 ;;9002226.02101,"1033,53002029110 ",.01)
 ;;53002029110
 ;;9002226.02101,"1033,53002029110 ",.02)
 ;;53002029110
 ;;9002226.02101,"1033,53002029120 ",.01)
 ;;53002029120
 ;;9002226.02101,"1033,53002029120 ",.02)
 ;;53002029120
 ;;9002226.02101,"1033,53002029820 ",.01)
 ;;53002029820
 ;;9002226.02101,"1033,53002029820 ",.02)
 ;;53002029820
 ;;9002226.02101,"1033,53002029828 ",.01)
 ;;53002029828
 ;;9002226.02101,"1033,53002029828 ",.02)
 ;;53002029828
 ;;9002226.02101,"1033,53002029840 ",.01)
 ;;53002029840
 ;;9002226.02101,"1033,53002029840 ",.02)
 ;;53002029840
 ;;9002226.02101,"1033,53002083781 ",.01)
 ;;53002083781
 ;;9002226.02101,"1033,53002083781 ",.02)
 ;;53002083781
 ;;9002226.02101,"1033,53401000420 ",.01)
 ;;53401000420
 ;;9002226.02101,"1033,53401000420 ",.02)
 ;;53401000420
 ;;9002226.02101,"1033,53401000520 ",.01)
 ;;53401000520
 ;;9002226.02101,"1033,53401000520 ",.02)
 ;;53401000520
 ;;9002226.02101,"1033,53401010099 ",.01)
 ;;53401010099
 ;;9002226.02101,"1033,53401010099 ",.02)
 ;;53401010099
 ;;9002226.02101,"1033,53403052725 ",.01)
 ;;53403052725
 ;;9002226.02101,"1033,53403052725 ",.02)
 ;;53403052725
 ;;9002226.02101,"1033,53403052750 ",.01)
 ;;53403052750
 ;;9002226.02101,"1033,53403052750 ",.02)
 ;;53403052750
 ;;9002226.02101,"1033,53403052780 ",.01)
 ;;53403052780
 ;;9002226.02101,"1033,53403052780 ",.02)
 ;;53403052780
 ;;9002226.02101,"1033,53403052825 ",.01)
 ;;53403052825
 ;;9002226.02101,"1033,53403052825 ",.02)
 ;;53403052825
 ;;9002226.02101,"1033,53403052880 ",.01)
 ;;53403052880
 ;;9002226.02101,"1033,53403052880 ",.02)
 ;;53403052880
 ;;9002226.02101,"1033,53489011802 ",.01)
 ;;53489011802
 ;;9002226.02101,"1033,53489011802 ",.02)
 ;;53489011802
 ;;9002226.02101,"1033,53489011805 ",.01)
 ;;53489011805
 ;;9002226.02101,"1033,53489011805 ",.02)
 ;;53489011805
 ;;9002226.02101,"1033,53489011902 ",.01)
 ;;53489011902
 ;;9002226.02101,"1033,53489011902 ",.02)
 ;;53489011902
 ;;9002226.02101,"1033,53489011905 ",.01)
 ;;53489011905
 ;;9002226.02101,"1033,53489011905 ",.02)
 ;;53489011905
 ;;9002226.02101,"1033,53489012002 ",.01)
 ;;53489012002
 ;;9002226.02101,"1033,53489012002 ",.02)
 ;;53489012002
 ;;9002226.02101,"1033,53489012005 ",.01)
 ;;53489012005
 ;;9002226.02101,"1033,53489012005 ",.02)
 ;;53489012005
 ;;9002226.02101,"1033,53489014501 ",.01)
 ;;53489014501
 ;;9002226.02101,"1033,53489014501 ",.02)
 ;;53489014501
 ;;9002226.02101,"1033,53489014505 ",.01)
 ;;53489014505
 ;;9002226.02101,"1033,53489014505 ",.02)
 ;;53489014505
 ;;9002226.02101,"1033,53489014601 ",.01)
 ;;53489014601
 ;;9002226.02101,"1033,53489014601 ",.02)
 ;;53489014601
 ;;9002226.02101,"1033,53489014605 ",.01)
 ;;53489014605
 ;;9002226.02101,"1033,53489014605 ",.02)
 ;;53489014605
 ;;9002226.02101,"1033,53489055005 ",.01)
 ;;53489055005
 ;;9002226.02101,"1033,53489055005 ",.02)
 ;;53489055005
 ;;9002226.02101,"1033,53489064701 ",.01)
 ;;53489064701
 ;;9002226.02101,"1033,53489064701 ",.02)
 ;;53489064701
 ;;9002226.02101,"1033,53489064703 ",.01)
 ;;53489064703
 ;;9002226.02101,"1033,53489064703 ",.02)
 ;;53489064703
 ;;9002226.02101,"1033,53489064705 ",.01)
 ;;53489064705
 ;;9002226.02101,"1033,53489064705 ",.02)
 ;;53489064705
 ;;9002226.02101,"1033,53489064706 ",.01)
 ;;53489064706
 ;;9002226.02101,"1033,53489064706 ",.02)
 ;;53489064706
 ;;9002226.02101,"1033,53489064707 ",.01)
 ;;53489064707
 ;;9002226.02101,"1033,53489064707 ",.02)
 ;;53489064707
 ;;9002226.02101,"1033,53489064710 ",.01)
 ;;53489064710
 ;;9002226.02101,"1033,53489064710 ",.02)
 ;;53489064710
 ;;9002226.02101,"1033,53489064790 ",.01)
 ;;53489064790
 ;;9002226.02101,"1033,53489064790 ",.02)
 ;;53489064790
 ;;9002226.02101,"1033,53746027101 ",.01)
 ;;53746027101
 ;;9002226.02101,"1033,53746027101 ",.02)
 ;;53746027101
 ;;9002226.02101,"1033,53746027105 ",.01)
 ;;53746027105
 ;;9002226.02101,"1033,53746027105 ",.02)
 ;;53746027105
 ;;9002226.02101,"1033,53746027110 ",.01)
 ;;53746027110