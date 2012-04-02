BGP13Z2 ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON APR 14, 2011 ;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;;JUN 27, 2011;Build 33
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;21,"43353-0349-53 ")
 ;;53
 ;;21,"43353-0349-60 ")
 ;;54
 ;;21,"43353-0349-80 ")
 ;;55
 ;;21,"43353-0477-30 ")
 ;;524
 ;;21,"43353-0477-53 ")
 ;;525
 ;;21,"43353-0477-60 ")
 ;;526
 ;;21,"43353-0477-70 ")
 ;;527
 ;;21,"43353-0477-80 ")
 ;;528
 ;;21,"43353-0477-92 ")
 ;;529
 ;;21,"43353-0477-94 ")
 ;;530
 ;;21,"43353-0477-96 ")
 ;;531
 ;;21,"43353-0514-30 ")
 ;;56
 ;;21,"43353-0514-45 ")
 ;;57
 ;;21,"43353-0514-53 ")
 ;;58
 ;;21,"43353-0514-60 ")
 ;;59
 ;;21,"43353-0514-73 ")
 ;;60
 ;;21,"43353-0514-80 ")
 ;;61
 ;;21,"43353-0514-86 ")
 ;;62
 ;;21,"43353-0520-60 ")
 ;;63
 ;;21,"43353-0520-80 ")
 ;;64
 ;;21,"43353-0530-60 ")
 ;;589
 ;;21,"43353-0530-80 ")
 ;;590
 ;;21,"43353-0585-94 ")
 ;;825
 ;;21,"43353-0589-30 ")
 ;;512
 ;;21,"43353-0589-53 ")
 ;;513
 ;;21,"43353-0589-60 ")
 ;;514
 ;;21,"43353-0589-70 ")
 ;;515
 ;;21,"43353-0589-75 ")
 ;;516
 ;;21,"43353-0589-80 ")
 ;;517
 ;;21,"43353-0589-92 ")
 ;;518
 ;;21,"43353-0589-94 ")
 ;;519
 ;;21,"43353-0589-96 ")
 ;;520
 ;;21,"43547-0248-10 ")
 ;;306
 ;;21,"43547-0248-50 ")
 ;;307
 ;;21,"43547-0249-10 ")
 ;;591
 ;;21,"43547-0249-50 ")
 ;;592
 ;;21,"43547-0250-10 ")
 ;;65
 ;;21,"43547-0250-50 ")
 ;;66
 ;;21,"43683-0131-30 ")
 ;;209
 ;;21,"43683-0131-60 ")
 ;;210
 ;;21,"43683-0132-30 ")
 ;;521
 ;;21,"43683-0132-60 ")
 ;;522
 ;;21,"49884-0736-01 ")
 ;;308
 ;;21,"49884-0736-05 ")
 ;;309
 ;;21,"49884-0737-01 ")
 ;;593
 ;;21,"49884-0737-05 ")
 ;;594
 ;;21,"49884-0738-01 ")
 ;;67
 ;;21,"49884-0738-05 ")
 ;;68
 ;;21,"49884-0739-01 ")
 ;;310
 ;;21,"49884-0739-05 ")
 ;;311
 ;;21,"49884-0740-01 ")
 ;;595
 ;;21,"49884-0740-05 ")
 ;;596
 ;;21,"49884-0741-01 ")
 ;;69
 ;;21,"49884-0741-05 ")
 ;;70
 ;;21,"49884-0921-01 ")
 ;;747
 ;;21,"49884-0921-05 ")
 ;;748
 ;;21,"49884-0967-01 ")
 ;;938
 ;;21,"49884-0967-05 ")
 ;;939
 ;;21,"49884-0968-01 ")
 ;;974
 ;;21,"49884-0968-05 ")
 ;;975
 ;;21,"49884-0969-01 ")
 ;;1042
 ;;21,"49884-0969-05 ")
 ;;1043
 ;;21,"49999-0106-00 ")
 ;;312
 ;;21,"49999-0106-01 ")
 ;;313
 ;;21,"49999-0106-28 ")
 ;;314
 ;;21,"49999-0106-30 ")
 ;;315
 ;;21,"49999-0106-60 ")
 ;;316
 ;;21,"49999-0106-90 ")
 ;;317
 ;;21,"49999-0116-00 ")
 ;;71
 ;;21,"49999-0116-30 ")
 ;;72
 ;;21,"49999-0116-60 ")
 ;;73
 ;;21,"49999-0401-30 ")
 ;;1044
 ;;21,"49999-0401-60 ")
 ;;1045
 ;;21,"49999-0495-30 ")
 ;;597
 ;;21,"49999-0495-60 ")
 ;;598
 ;;21,"49999-0660-30 ")
 ;;1046
 ;;21,"49999-0660-60 ")
 ;;1047
 ;;21,"49999-0820-60 ")
 ;;749
 ;;21,"50268-0531-15 ")
 ;;826
 ;;21,"51079-0626-01 ")
 ;;750
 ;;21,"51079-0626-20 ")
 ;;751
 ;;21,"51079-0627-01 ")
 ;;837
 ;;21,"51079-0627-20 ")
 ;;838
 ;;21,"51079-0972-01 ")
 ;;318
 ;;21,"51079-0972-17 ")
 ;;319
 ;;21,"51079-0972-19 ")
 ;;320
 ;;21,"51079-0972-20 ")
 ;;321
 ;;21,"51079-0972-30 ")
 ;;322
 ;;21,"51079-0972-56 ")
 ;;323
 ;;21,"51079-0972-57 ")
 ;;324
 ;;21,"51079-0973-01 ")
 ;;599
 ;;21,"51079-0973-20 ")
 ;;600
 ;;21,"51079-0995-01 ")
 ;;74
 ;;21,"51079-0995-20 ")
 ;;75
 ;;21,"52959-0207-00 ")
 ;;325
 ;;21,"52959-0207-28 ")
 ;;326
 ;;21,"52959-0207-30 ")
 ;;327
 ;;21,"52959-0207-60 ")
 ;;328
 ;;21,"52959-0860-02 ")
 ;;76
 ;;21,"52959-0860-30 ")
 ;;77
 ;;21,"52959-0860-60 ")
 ;;78
 ;;21,"52959-0860-90 ")
 ;;79
 ;;21,"52959-0896-01 ")
 ;;601
 ;;21,"52959-0896-60 ")
 ;;602
 ;;21,"53002-1251-00 ")
 ;;532
 ;;21,"53002-1251-03 ")
 ;;533
 ;;21,"53002-1251-06 ")
 ;;534
 ;;21,"53002-1422-00 ")
 ;;721
 ;;21,"53002-1422-03 ")
 ;;722
 ;;21,"53002-1422-06 ")
 ;;723
 ;;21,"53002-1445-00 ")
 ;;195
 ;;21,"53002-1445-03 ")
 ;;196
 ;;21,"53002-1445-06 ")
 ;;197
 ;;21,"53489-0467-01 ")
 ;;329
 ;;21,"53489-0467-05 ")
 ;;330
 ;;21,"53489-0467-10 ")
 ;;331
 ;;21,"53489-0468-01 ")
 ;;603
 ;;21,"53489-0468-05 ")
 ;;604
 ;;21,"53489-0468-10 ")
 ;;605
 ;;21,"53489-0469-01 ")
 ;;80
 ;;21,"53489-0469-05 ")
 ;;81
 ;;21,"53489-0469-10 ")
 ;;82
 ;;21,"53746-0178-01 ")
 ;;752
 ;;21,"53746-0178-05 ")
 ;;753
 ;;21,"53746-0178-90 ")
 ;;819
 ;;21,"53746-0179-01 ")
 ;;839
 ;;21,"53746-0179-05 ")
 ;;840
 ;;21,"54458-0974-06 ")
 ;;754
 ;;21,"54569-4202-00 ")
 ;;332
 ;;21,"54569-4202-01 ")
 ;;333
 ;;21,"54569-4202-02 ")
 ;;334
 ;;21,"54569-4202-03 ")
 ;;335
 ;;21,"54569-4740-00 ")
 ;;606
 ;;21,"54569-4740-01 ")
 ;;607
 ;;21,"54569-4786-00 ")
 ;;83
 ;;21,"54569-4786-01 ")
 ;;84
 ;;21,"54569-5210-00 ")
 ;;976
 ;;21,"54569-5210-01 ")
 ;;977
 ;;21,"54569-5211-00 ")
 ;;1048
 ;;21,"54569-5211-01 ")
 ;;1049
 ;;21,"54569-5252-00 ")
 ;;755
 ;;21,"54569-5252-01 ")
 ;;756
 ;;21,"54569-5252-02 ")
 ;;757
 ;;21,"54569-5353-00 ")
 ;;608
 ;;21,"54569-5353-02 ")
 ;;609
 ;;21,"54569-5353-03 ")
 ;;610
 ;;21,"54569-5353-04 ")
 ;;611
 ;;21,"54569-5360-00 ")
 ;;336
 ;;21,"54569-5360-03 ")
 ;;337
 ;;21,"54569-5373-00 ")
 ;;85
 ;;21,"54569-5373-02 ")
 ;;86
 ;;21,"54569-5546-00 ")
 ;;758
 ;;21,"54569-5546-01 ")
 ;;759
 ;;21,"54569-5603-00 ")
 ;;1099
 ;;21,"54569-5618-00 ")
 ;;978
 ;;21,"54569-5618-01 ")
 ;;979
 ;;21,"54569-5619-00 ")
 ;;1050
 ;;21,"54569-5619-01 ")
 ;;1051
 ;;21,"54569-5991-00 ")
 ;;888
 ;;21,"54569-5992-00 ")
 ;;898
 ;;21,"54569-5993-00 ")
 ;;912
 ;;21,"54569-5993-01 ")
 ;;913
 ;;21,"54738-0925-01 ")
 ;;338
 ;;21,"54738-0925-02 ")
 ;;339
 ;;21,"54738-0925-03 ")
 ;;340
 ;;21,"54738-0926-01 ")
 ;;612
 ;;21,"54738-0926-02 ")
 ;;613
 ;;21,"54738-0926-03 ")
 ;;614
 ;;21,"54738-0927-01 ")
 ;;87
 ;;21,"54738-0927-02 ")
 ;;88
 ;;21,"54738-0927-03 ")
 ;;89
 ;;21,"54868-0795-00 ")
 ;;889
 ;;21,"54868-0830-00 ")
 ;;856
 ;;21,"54868-0830-01 ")
 ;;857
 ;;21,"54868-1097-00 ")
 ;;872
 ;;21,"54868-1097-01 ")
 ;;873
 ;;21,"54868-2894-00 ")
 ;;860
 ;;21,"54868-3545-00 ")
 ;;341
 ;;21,"54868-3545-01 ")
 ;;342
 ;;21,"54868-3545-02 ")
 ;;343
 ;;21,"54868-3545-03 ")
 ;;344
 ;;21,"54868-3546-00 ")
 ;;615
 ;;21,"54868-3546-01 ")
 ;;616
 ;;21,"54868-4160-00 ")
 ;;90
 ;;21,"54868-4160-01 ")
 ;;91
 ;;21,"54868-4529-00 ")
 ;;1052
 ;;21,"54868-4529-01 ")
 ;;1053
 ;;21,"54868-4529-02 ")
 ;;1054
 ;;21,"54868-4529-03 ")
 ;;1055
 ;;21,"54868-4561-00 ")
 ;;617
 ;;21,"54868-4561-01 ")
 ;;618
 ;;21,"54868-4561-02 ")
 ;;619
 ;;21,"54868-4561-03 ")
 ;;620
 ;;21,"54868-4564-00 ")
 ;;345
 ;;21,"54868-4564-01 ")
 ;;346
 ;;21,"54868-4564-02 ")
 ;;347
 ;;21,"54868-4564-03 ")
 ;;348
 ;;21,"54868-4564-04 ")
 ;;349
 ;;21,"54868-4566-00 ")
 ;;92
 ;;21,"54868-4566-01 ")
 ;;93
 ;;21,"54868-4566-02 ")
 ;;94
 ;;21,"54868-4566-03 ")
 ;;95
 ;;21,"54868-4566-04 ")
 ;;96
 ;;21,"54868-4569-00 ")
 ;;760
 ;;21,"54868-4569-01 ")
 ;;761
 ;;21,"54868-4569-02 ")
 ;;762
 ;;21,"54868-4609-00 ")
 ;;980
 ;;21,"54868-4609-01 ")
 ;;981
 ;;21,"54868-4906-00 ")
 ;;940
 ;;21,"54868-4965-00 ")
 ;;1100
 ;;21,"54868-4965-01 ")
 ;;1101
 ;;21,"54868-4965-02 ")
 ;;1102
 ;;21,"54868-5148-00 ")
 ;;982
 ;;21,"54868-5148-01 ")
 ;;983
 ;;21,"54868-5148-02 ")
 ;;984
 ;;21,"54868-5148-03 ")
 ;;985
 ;;21,"54868-5157-00 ")
 ;;1111
 ;;21,"54868-5157-01 ")
 ;;1112
 ;;21,"54868-5185-00 ")
 ;;941
 ;;21,"54868-5185-01 ")
 ;;942
 ;;21,"54868-5185-02 ")
 ;;943
 ;;21,"54868-5185-03 ")
 ;;944
 ;;21,"54868-5188-00 ")
 ;;899
 ;;21,"54868-5188-01 ")
 ;;900
 ;;21,"54868-5188-02 ")
 ;;901
 ;;21,"54868-5217-00 ")
 ;;763
 ;;21,"54868-5217-01 ")
 ;;764
 ;;21,"54868-5217-02 ")
 ;;765
 ;;21,"54868-5217-03 ")
 ;;766
 ;;21,"54868-5217-04 ")
 ;;767
 ;;21,"54868-5217-05 ")
 ;;768
 ;;21,"54868-5243-00 ")
 ;;1056
 ;;21,"54868-5243-01 ")
 ;;1057
 ;;21,"54868-5243-02 ")
 ;;1058
 ;;21,"54868-5243-03 ")
 ;;1059
 ;;21,"54868-5243-04 ")
 ;;1060
 ;;21,"54868-5262-00 ")
 ;;1106
 ;;21,"54868-5262-01 ")
 ;;1107
 ;;21,"54868-5288-00 ")
 ;;914
 ;;21,"54868-5288-01 ")
 ;;915
 ;;21,"54868-5288-02 ")
 ;;916
 ;;21,"54868-5376-00 ")
 ;;1096
 ;;21,"54868-5379-00 ")
 ;;1094
 ;;21,"54868-5399-00 ")
 ;;902
 ;;21,"54868-5399-01 ")
 ;;903
 ;;21,"54868-5467-00 ")
 ;;917
 ;;21,"54868-5467-01 ")
 ;;918
 ;;21,"54868-5467-02 ")
 ;;919
 ;;21,"54868-5500-00 ")
 ;;1080
 ;;21,"54868-5500-01 ")
 ;;1081
 ;;21,"54868-5505-00 ")
 ;;841
 ;;21,"54868-5505-01 ")
 ;;842
 ;;21,"54868-5505-02 ")
 ;;843
 ;;21,"54868-5553-00 ")
 ;;1085
 ;;21,"54868-5553-01 ")
 ;;1086
 ;;21,"54868-5553-02 ")
 ;;1087
 ;;21,"54868-5558-00 ")
 ;;861
 ;;21,"54868-5558-01 ")
 ;;862
 ;;21,"54868-5973-00 ")
 ;;879
 ;;21,"55045-2504-01 ")
 ;;621
 ;;21,"55045-2904-00 ")
 ;;350
 ;;21,"55045-2904-02 ")
 ;;351
 ;;21,"55045-2904-06 ")
 ;;352
 ;;21,"55045-2905-00 ")
 ;;622
 ;;21,"55045-2905-08 ")
 ;;623
 ;;21,"55045-2906-00 ")
 ;;97
 ;;21,"55045-2906-01 ")
 ;;98
 ;;21,"55045-2906-02 ")
 ;;99
 ;;21,"55045-2906-06 ")
 ;;100
 ;;21,"55045-2906-08 ")
 ;;101
 ;;21,"55045-2906-09 ")
 ;;102
 ;;21,"55045-3045-01 ")
 ;;353
 ;;21,"55045-3045-06 ")
 ;;354
 ;;21,"55045-3045-08 ")
 ;;355
 ;;21,"55045-3761-08 ")
 ;;356
 ;;21,"55111-0695-01 ")
 ;;945
 ;;21,"55111-0696-01 ")
 ;;986
 ;;21,"55111-0696-10 ")
 ;;987
 ;;21,"55111-0697-01 ")
 ;;1061
 ;;21,"55111-0697-10 ")
 ;;1062
 ;;21,"55289-0211-60 ")
 ;;357
 ;;21,"55289-0281-30 ")
 ;;1063
 ;;21,"55289-0281-60 ")
 ;;1064
 ;;21,"55289-0281-86 ")
 ;;1065
 ;;21,"55289-0281-90 ")
 ;;1066
 ;;21,"55289-0384-30 ")
 ;;769
 ;;21,"55289-0384-60 ")
 ;;770
 ;;21,"55289-0384-86 ")
 ;;771
 ;;21,"55289-0384-90 ")
 ;;772
 ;;21,"55289-0384-93 ")
 ;;773
 ;;21,"55289-0384-94 ")
 ;;774
 ;;21,"55289-0615-14 ")
 ;;358
 ;;21,"55289-0615-30 ")
 ;;359
 ;;21,"55289-0615-60 ")
 ;;360
 ;;21,"55289-0615-86 ")
 ;;361
 ;;21,"55289-0615-90 ")
 ;;362
 ;;21,"55289-0615-93 ")
 ;;363
 ;;21,"55289-0615-94 ")
 ;;364
 ;;21,"55289-0615-98 ")
 ;;365
 ;;21,"55289-0919-30 ")
 ;;103
 ;;21,"55289-0919-60 ")
 ;;104
 ;;21,"55289-0919-90 ")
 ;;105
 ;;21,"55289-0919-93 ")
 ;;106
 ;;21,"55289-0919-94 ")
 ;;107
 ;;21,"55289-0919-98 ")
 ;;108
 ;;21,"55289-0934-30 ")
 ;;624
 ;;21,"55289-0934-60 ")
 ;;625
 ;;21,"55289-0934-93 ")
 ;;626
 ;;21,"55289-0934-94 ")
 ;;627
 ;;21,"55289-0934-98 ")
 ;;628
 ;;21,"55887-0368-30 ")
 ;;1067
 ;;21,"55887-0368-60 ")
 ;;1068
 ;;21,"55887-0368-90 ")
 ;;1069
 ;;21,"55887-0414-30 ")
 ;;775
 ;;21,"55887-0414-60 ")
 ;;776
 ;;21,"55887-0414-90 ")
 ;;777
 ;;21,"55887-0571-30 ")
 ;;109
 ;;21,"55887-0571-60 ")
 ;;110
 ;;21,"55887-0571-82 ")
 ;;111
 ;;21,"55887-0571-90 ")
 ;;112
 ;;21,"55887-0614-30 ")
 ;;629
 ;;21,"55887-0614-90 ")
 ;;630
 ;;21,"55887-0627-30 ")
 ;;366
 ;;21,"55887-0627-60 ")
 ;;367
 ;;21,"55887-0627-82 ")
 ;;368
 ;;21,"55887-0627-90 ")
 ;;369
 ;;21,"55887-0627-92 ")
 ;;370
 ;;21,"55887-0940-30 ")
 ;;844
 ;;21,"55887-0940-90 ")
 ;;845
 ;;21,"57664-0397-13 ")
 ;;371
 ;;21,"57664-0397-18 ")
 ;;372
 ;;21,"57664-0397-51 ")
 ;;373
 ;;21,"57664-0397-53 ")
 ;;374
 ;;21,"57664-0397-58 ")
 ;;375
 ;;21,"57664-0397-88 ")
 ;;376
 ;;21,"57664-0397-99 ")
 ;;377
 ;;21,"57664-0435-13 ")
 ;;631
 ;;21,"57664-0435-18 ")
 ;;632
 ;;21,"57664-0435-51 ")
 ;;633
 ;;21,"57664-0435-53 ")
 ;;634
 ;;21,"57664-0435-58 ")
 ;;635
 ;;21,"57664-0435-88 ")
 ;;636
 ;;21,"57664-0435-99 ")
 ;;637
 ;;21,"57664-0474-13 ")
 ;;113
 ;;21,"57664-0474-18 ")
 ;;114
 ;;21,"57664-0474-51 ")
 ;;115
 ;;21,"57664-0474-53 ")
 ;;116
 ;;21,"57664-0474-58 ")
 ;;117
 ;;21,"57664-0474-88 ")
 ;;118
 ;;21,"57664-0474-99 ")
 ;;119
 ;;21,"57664-0724-88 ")
 ;;920
 ;;21,"57664-0725-88 ")
 ;;904
 ;;21,"57664-0727-88 ")
 ;;890
 ;;21,"57866-0248-01 ")
 ;;378
 ;;21,"57866-7991-01 ")
 ;;1070
 ;;21,"57866-9054-01 ")
 ;;120
 ;;21,"57866-9054-02 ")
 ;;121
 ;;21,"57866-9054-03 ")
 ;;122
 ;;21,"57866-9054-04 ")
 ;;123
 ;;21,"57866-9054-05 ")
 ;;124
 ;;21,"57866-9055-01 ")
 ;;638
 ;;21,"57866-9055-02 ")
 ;;639
 ;;21,"57866-9055-03 ")
 ;;640
 ;;21,"57866-9055-04 ")
 ;;641
 ;;21,"57866-9055-05 ")
 ;;642
 ;;21,"57866-9056-01 ")
 ;;379
 ;;21,"57866-9056-02 ")
 ;;380
 ;;21,"57866-9056-03 ")
 ;;381
 ;;21,"57866-9056-04 ")
 ;;382