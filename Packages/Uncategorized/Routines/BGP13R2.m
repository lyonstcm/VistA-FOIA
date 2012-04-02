BGP13R2 ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON APR 14, 2011 ;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;;JUN 27, 2011;Build 33
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;21,"54868-3866-01 ")
 ;;460
 ;;21,"54868-4199-00 ")
 ;;69
 ;;21,"54868-4199-01 ")
 ;;70
 ;;21,"54868-4199-02 ")
 ;;71
 ;;21,"54868-4341-00 ")
 ;;461
 ;;21,"54868-4341-01 ")
 ;;462
 ;;21,"54868-4414-00 ")
 ;;72
 ;;21,"54868-4425-00 ")
 ;;344
 ;;21,"54868-4425-01 ")
 ;;345
 ;;21,"54868-4425-02 ")
 ;;346
 ;;21,"54868-4428-00 ")
 ;;347
 ;;21,"54868-4428-01 ")
 ;;348
 ;;21,"54868-4428-02 ")
 ;;349
 ;;21,"54868-4494-00 ")
 ;;37
 ;;21,"54868-4526-00 ")
 ;;38
 ;;21,"54868-4526-01 ")
 ;;39
 ;;21,"54868-4539-01 ")
 ;;534
 ;;21,"54868-4540-01 ")
 ;;553
 ;;21,"54868-4605-01 ")
 ;;535
 ;;21,"54868-4645-00 ")
 ;;269
 ;;21,"54868-4645-01 ")
 ;;270
 ;;21,"54868-4645-02 ")
 ;;271
 ;;21,"54868-4652-00 ")
 ;;272
 ;;21,"54868-4652-01 ")
 ;;273
 ;;21,"54868-4652-02 ")
 ;;274
 ;;21,"54868-4652-03 ")
 ;;275
 ;;21,"54868-4720-00 ")
 ;;559
 ;;21,"54868-4720-01 ")
 ;;560
 ;;21,"54868-4720-02 ")
 ;;561
 ;;21,"54868-4720-03 ")
 ;;562
 ;;21,"54868-4729-00 ")
 ;;23
 ;;21,"54868-4869-00 ")
 ;;24
 ;;21,"54868-4885-00 ")
 ;;125
 ;;21,"54868-4885-01 ")
 ;;126
 ;;21,"54868-4986-00 ")
 ;;127
 ;;21,"54868-4986-01 ")
 ;;128
 ;;21,"54868-4986-02 ")
 ;;129
 ;;21,"54868-5075-00 ")
 ;;152
 ;;21,"54868-5075-01 ")
 ;;153
 ;;21,"54868-5077-00 ")
 ;;204
 ;;21,"54868-5078-00 ")
 ;;154
 ;;21,"54868-5078-01 ")
 ;;155
 ;;21,"54868-5082-00 ")
 ;;276
 ;;21,"54868-5082-01 ")
 ;;277
 ;;21,"54868-5082-02 ")
 ;;278
 ;;21,"54868-5082-03 ")
 ;;279
 ;;21,"54868-5170-00 ")
 ;;156
 ;;21,"54868-5170-01 ")
 ;;157
 ;;21,"54868-5281-00 ")
 ;;573
 ;;21,"54868-5281-01 ")
 ;;574
 ;;21,"54868-5297-00 ")
 ;;554
 ;;21,"54868-5323-00 ")
 ;;350
 ;;21,"54868-5418-00 ")
 ;;555
 ;;21,"54868-5465-00 ")
 ;;40
 ;;21,"54868-5466-00 ")
 ;;563
 ;;21,"54868-5466-01 ")
 ;;564
 ;;21,"54868-5489-00 ")
 ;;14
 ;;21,"54868-5591-00 ")
 ;;15
 ;;21,"54868-5607-00 ")
 ;;351
 ;;21,"54868-5705-00 ")
 ;;463
 ;;21,"54868-5780-00 ")
 ;;352
 ;;21,"54868-5804-00 ")
 ;;372
 ;;21,"54868-5977-00 ")
 ;;280
 ;;21,"54868-5983-00 ")
 ;;373
 ;;21,"54868-5983-01 ")
 ;;374
 ;;21,"54868-5996-00 ")
 ;;375
 ;;21,"54868-5997-00 ")
 ;;376
 ;;21,"54868-6036-00 ")
 ;;93
 ;;21,"55045-3401-08 ")
 ;;205
 ;;21,"55045-3409-09 ")
 ;;281
 ;;21,"55289-0238-30 ")
 ;;206
 ;;21,"55289-0436-30 ")
 ;;130
 ;;21,"55289-0443-30 ")
 ;;158
 ;;21,"55289-0522-30 ")
 ;;464
 ;;21,"55289-0815-30 ")
 ;;353
 ;;21,"55289-0817-30 ")
 ;;282
 ;;21,"55289-0820-30 ")
 ;;354
 ;;21,"55289-0825-30 ")
 ;;283
 ;;21,"55289-0838-30 ")
 ;;355
 ;;21,"55289-0876-30 ")
 ;;284
 ;;21,"55887-0102-30 ")
 ;;73
 ;;21,"55887-0103-30 ")
 ;;74
 ;;21,"55887-0105-30 ")
 ;;75
 ;;21,"55887-0307-30 ")
 ;;285
 ;;21,"55887-0432-30 ")
 ;;207
 ;;21,"55887-0432-60 ")
 ;;208
 ;;21,"55887-0432-90 ")
 ;;209
 ;;21,"58016-0053-00 ")
 ;;131
 ;;21,"58016-0053-30 ")
 ;;132
 ;;21,"58016-0053-60 ")
 ;;133
 ;;21,"58016-0053-90 ")
 ;;134
 ;;21,"58016-0066-00 ")
 ;;135
 ;;21,"58016-0066-30 ")
 ;;136
 ;;21,"58016-0066-60 ")
 ;;137
 ;;21,"58016-0066-90 ")
 ;;138
 ;;21,"58016-4631-01 ")
 ;;556
 ;;21,"58864-0605-30 ")
 ;;286
 ;;21,"58864-0659-30 ")
 ;;465
 ;;21,"58864-0662-30 ")
 ;;210
 ;;21,"58864-0681-30 ")
 ;;287
 ;;21,"58864-0726-15 ")
 ;;76
 ;;21,"58864-0726-30 ")
 ;;77
 ;;21,"58864-0771-15 ")
 ;;78
 ;;21,"58864-0807-30 ")
 ;;211
 ;;21,"59762-0011-01 ")
 ;;421
 ;;21,"59762-0011-02 ")
 ;;422
 ;;21,"59762-0012-01 ")
 ;;423
 ;;21,"59762-0012-02 ")
 ;;424
 ;;21,"59762-0015-01 ")
 ;;425
 ;;21,"59762-0015-02 ")
 ;;426
 ;;21,"59762-0070-01 ")
 ;;514
 ;;21,"59762-0071-01 ")
 ;;515
 ;;21,"59762-0071-02 ")
 ;;516
 ;;21,"59762-0072-01 ")
 ;;517
 ;;21,"59762-0072-02 ")
 ;;518
 ;;21,"60598-0080-01 ")
 ;;575
 ;;21,"60598-0081-01 ")
 ;;576
 ;;21,"60598-0100-01 ")
 ;;565
 ;;21,"60598-0101-01 ")
 ;;566
 ;;21,"63629-1337-01 ")
 ;;212
 ;;21,"63629-2912-01 ")
 ;;213
 ;;21,"63629-3183-01 ")
 ;;466
 ;;21,"63874-0637-01 ")
 ;;214
 ;;21,"63874-0637-10 ")
 ;;215
 ;;21,"63874-0637-20 ")
 ;;216
 ;;21,"63874-0637-30 ")
 ;;217
 ;;21,"63874-0637-90 ")
 ;;218
 ;;21,"63874-0647-10 ")
 ;;79
 ;;21,"63874-0647-14 ")
 ;;80
 ;;21,"63874-0647-30 ")
 ;;81
 ;;21,"64455-0130-01 ")
 ;;567
 ;;21,"64455-0131-01 ")
 ;;568
 ;;21,"64455-0132-01 ")
 ;;577
 ;;21,"64455-0133-01 ")
 ;;578
 ;;21,"65597-0101-30 ")
 ;;139
 ;;21,"65597-0103-10 ")
 ;;140
 ;;21,"65597-0103-30 ")
 ;;141
 ;;21,"65597-0103-90 ")
 ;;142
 ;;21,"65597-0104-10 ")
 ;;143
 ;;21,"65597-0104-30 ")
 ;;144
 ;;21,"65597-0104-90 ")
 ;;145
 ;;21,"65597-0105-10 ")
 ;;159
 ;;21,"65597-0105-30 ")
 ;;160
 ;;21,"65597-0105-90 ")
 ;;161
 ;;21,"65597-0106-10 ")
 ;;162
 ;;21,"65597-0106-30 ")
 ;;163
 ;;21,"65597-0106-90 ")
 ;;164
 ;;21,"65597-0107-10 ")
 ;;165
 ;;21,"65597-0107-30 ")
 ;;166
 ;;21,"65597-0107-90 ")
 ;;167
 ;;21,"65597-0110-10 ")
 ;;94
 ;;21,"65597-0110-30 ")
 ;;95
 ;;21,"65597-0110-90 ")
 ;;96
 ;;21,"65597-0111-10 ")
 ;;97
 ;;21,"65597-0111-30 ")
 ;;98
 ;;21,"65597-0111-90 ")
 ;;99
 ;;21,"65597-0112-10 ")
 ;;100
 ;;21,"65597-0112-30 ")
 ;;101
 ;;21,"65597-0112-90 ")
 ;;102
 ;;21,"65597-0113-10 ")
 ;;103
 ;;21,"65597-0113-30 ")
 ;;104
 ;;21,"65597-0113-90 ")
 ;;105
 ;;21,"65597-0114-30 ")
 ;;579
 ;;21,"65597-0114-90 ")
 ;;580
 ;;21,"65597-0115-30 ")
 ;;581
 ;;21,"65597-0115-90 ")
 ;;582
 ;;21,"65597-0116-30 ")
 ;;583
 ;;21,"65597-0116-90 ")
 ;;584
 ;;21,"65597-0117-30 ")
 ;;585
 ;;21,"65597-0117-90 ")
 ;;586
 ;;21,"65597-0118-30 ")
 ;;587
 ;;21,"65597-0118-90 ")
 ;;588
 ;;21,"66105-0503-01 ")
 ;;82
 ;;21,"66105-0503-03 ")
 ;;83
 ;;21,"66105-0503-06 ")
 ;;84
 ;;21,"66105-0503-09 ")
 ;;85
 ;;21,"66105-0503-15 ")
 ;;86
 ;;21,"66105-0504-01 ")
 ;;87
 ;;21,"66105-0504-03 ")
 ;;88
 ;;21,"66105-0504-06 ")
 ;;89
 ;;21,"66105-0504-09 ")
 ;;90
 ;;21,"66105-0504-15 ")
 ;;91
 ;;21,"66105-0544-09 ")
 ;;356
 ;;21,"66105-0545-01 ")
 ;;357
 ;;21,"66105-0545-03 ")
 ;;358
 ;;21,"66105-0545-06 ")
 ;;359
 ;;21,"66105-0545-09 ")
 ;;360
 ;;21,"66105-0545-10 ")
 ;;361
 ;;21,"66105-0552-10 ")
 ;;219
 ;;21,"66105-0553-03 ")
 ;;220
 ;;21,"66105-0553-10 ")
 ;;221
 ;;21,"66105-0663-03 ")
 ;;467
 ;;21,"66105-0669-03 ")
 ;;468
 ;;21,"66105-0842-03 ")
 ;;536
 ;;21,"66105-0842-06 ")
 ;;537
 ;;21,"66105-0842-09 ")
 ;;538
 ;;21,"66105-0842-10 ")
 ;;539
 ;;21,"66105-0842-28 ")
 ;;540
 ;;21,"66336-0169-30 ")
 ;;288
 ;;21,"66336-0387-30 ")
 ;;289
 ;;21,"67544-0382-30 ")
 ;;222
 ;;21,"67544-0400-45 ")
 ;;92
 ;;21,"68071-0785-30 ")
 ;;362
 ;;21,"68071-0785-60 ")
 ;;363
 ;;21,"68071-0786-30 ")
 ;;364
 ;;21,"68071-0786-60 ")
 ;;365
 ;;21,"68115-0669-00 ")
 ;;366
 ;;21,"68115-0669-90 ")
 ;;367
 ;;21,"68115-0703-30 ")
 ;;25
 ;;21,"68115-0703-90 ")
 ;;26
 ;;21,"68115-0733-00 ")
 ;;223
 ;;21,"68115-0733-30 ")
 ;;224
 ;;21,"68115-0733-90 ")
 ;;225
 ;;21,"68115-0854-00 ")
 ;;290
 ;;21,"68115-0854-90 ")
 ;;291
 ;;21,"68115-0865-30 ")
 ;;469
 ;;21,"68180-0210-03 ")
 ;;519
 ;;21,"68180-0210-09 ")
 ;;520
 ;;21,"68180-0211-03 ")
 ;;521
 ;;21,"68180-0211-09 ")
 ;;522
 ;;21,"68180-0212-03 ")
 ;;523
 ;;21,"68180-0212-09 ")
 ;;524
 ;;21,"68180-0215-03 ")
 ;;427
 ;;21,"68180-0215-09 ")
 ;;428
 ;;21,"68180-0216-03 ")
 ;;429
 ;;21,"68180-0216-06 ")
 ;;430
 ;;21,"68180-0216-09 ")
 ;;431
 ;;21,"68180-0217-03 ")
 ;;432
 ;;21,"68180-0217-09 ")
 ;;433
 ;;9002226,996,.01)
 ;;BGP HEDIS ARB NDC
 ;;9002226,996,.02)
 ;;@
 ;;9002226,996,.04)
 ;;n
 ;;9002226,996,.06)
 ;;@
 ;;9002226,996,.08)
 ;;@
 ;;9002226,996,.09)
 ;;@
 ;;9002226,996,.11)
 ;;@
 ;;9002226,996,.12)
 ;;@
 ;;9002226,996,.13)
 ;;1
 ;;9002226,996,.14)
 ;;@
 ;;9002226,996,.15)
 ;;@
 ;;9002226,996,.16)
 ;;@
 ;;9002226,996,.17)
 ;;@
 ;;9002226,996,3101)
 ;;@
 ;;9002226.02101,"996,00006-0717-01 ",.01)
 ;;00006-0717-01
 ;;9002226.02101,"996,00006-0717-01 ",.02)
 ;;00006-0717-01
 ;;9002226.02101,"996,00006-0717-28 ",.01)
 ;;00006-0717-28
 ;;9002226.02101,"996,00006-0717-28 ",.02)
 ;;00006-0717-28
 ;;9002226.02101,"996,00006-0717-31 ",.01)
 ;;00006-0717-31
 ;;9002226.02101,"996,00006-0717-31 ",.02)
 ;;00006-0717-31
 ;;9002226.02101,"996,00006-0717-54 ",.01)
 ;;00006-0717-54
 ;;9002226.02101,"996,00006-0717-54 ",.02)
 ;;00006-0717-54
 ;;9002226.02101,"996,00006-0717-58 ",.01)
 ;;00006-0717-58
 ;;9002226.02101,"996,00006-0717-58 ",.02)
 ;;00006-0717-58
 ;;9002226.02101,"996,00006-0717-82 ",.01)
 ;;00006-0717-82
 ;;9002226.02101,"996,00006-0717-82 ",.02)
 ;;00006-0717-82
 ;;9002226.02101,"996,00006-0717-86 ",.01)
 ;;00006-0717-86
 ;;9002226.02101,"996,00006-0717-86 ",.02)
 ;;00006-0717-86
 ;;9002226.02101,"996,00006-0745-01 ",.01)
 ;;00006-0745-01
 ;;9002226.02101,"996,00006-0745-01 ",.02)
 ;;00006-0745-01
 ;;9002226.02101,"996,00006-0745-28 ",.01)
 ;;00006-0745-28
 ;;9002226.02101,"996,00006-0745-28 ",.02)
 ;;00006-0745-28
 ;;9002226.02101,"996,00006-0745-31 ",.01)
 ;;00006-0745-31
 ;;9002226.02101,"996,00006-0745-31 ",.02)
 ;;00006-0745-31
 ;;9002226.02101,"996,00006-0745-54 ",.01)
 ;;00006-0745-54
 ;;9002226.02101,"996,00006-0745-54 ",.02)
 ;;00006-0745-54
 ;;9002226.02101,"996,00006-0745-82 ",.01)
 ;;00006-0745-82
 ;;9002226.02101,"996,00006-0745-82 ",.02)
 ;;00006-0745-82
 ;;9002226.02101,"996,00006-0745-86 ",.01)
 ;;00006-0745-86
 ;;9002226.02101,"996,00006-0745-86 ",.02)
 ;;00006-0745-86
 ;;9002226.02101,"996,00006-0747-01 ",.01)
 ;;00006-0747-01
 ;;9002226.02101,"996,00006-0747-01 ",.02)
 ;;00006-0747-01
 ;;9002226.02101,"996,00006-0747-28 ",.01)
 ;;00006-0747-28
 ;;9002226.02101,"996,00006-0747-28 ",.02)
 ;;00006-0747-28
 ;;9002226.02101,"996,00006-0747-31 ",.01)
 ;;00006-0747-31
 ;;9002226.02101,"996,00006-0747-31 ",.02)
 ;;00006-0747-31
 ;;9002226.02101,"996,00006-0747-54 ",.01)
 ;;00006-0747-54
 ;;9002226.02101,"996,00006-0747-54 ",.02)
 ;;00006-0747-54
 ;;9002226.02101,"996,00006-0747-58 ",.01)
 ;;00006-0747-58
 ;;9002226.02101,"996,00006-0747-58 ",.02)
 ;;00006-0747-58
 ;;9002226.02101,"996,00006-0747-81 ",.01)
 ;;00006-0747-81
 ;;9002226.02101,"996,00006-0747-81 ",.02)
 ;;00006-0747-81
 ;;9002226.02101,"996,00006-0747-82 ",.01)
 ;;00006-0747-82
 ;;9002226.02101,"996,00006-0747-82 ",.02)
 ;;00006-0747-82
 ;;9002226.02101,"996,00006-0951-01 ",.01)
 ;;00006-0951-01
 ;;9002226.02101,"996,00006-0951-01 ",.02)
 ;;00006-0951-01
 ;;9002226.02101,"996,00006-0951-28 ",.01)
 ;;00006-0951-28
 ;;9002226.02101,"996,00006-0951-28 ",.02)
 ;;00006-0951-28
 ;;9002226.02101,"996,00006-0951-54 ",.01)
 ;;00006-0951-54
 ;;9002226.02101,"996,00006-0951-54 ",.02)
 ;;00006-0951-54
 ;;9002226.02101,"996,00006-0951-58 ",.01)
 ;;00006-0951-58
 ;;9002226.02101,"996,00006-0951-58 ",.02)
 ;;00006-0951-58
 ;;9002226.02101,"996,00006-0951-82 ",.01)
 ;;00006-0951-82
 ;;9002226.02101,"996,00006-0951-82 ",.02)
 ;;00006-0951-82
 ;;9002226.02101,"996,00006-0951-87 ",.01)
 ;;00006-0951-87
 ;;9002226.02101,"996,00006-0951-87 ",.02)
 ;;00006-0951-87
 ;;9002226.02101,"996,00006-0952-01 ",.01)
 ;;00006-0952-01
 ;;9002226.02101,"996,00006-0952-01 ",.02)
 ;;00006-0952-01
 ;;9002226.02101,"996,00006-0952-28 ",.01)
 ;;00006-0952-28
 ;;9002226.02101,"996,00006-0952-28 ",.02)
 ;;00006-0952-28
 ;;9002226.02101,"996,00006-0952-31 ",.01)
 ;;00006-0952-31
 ;;9002226.02101,"996,00006-0952-31 ",.02)
 ;;00006-0952-31
 ;;9002226.02101,"996,00006-0952-54 ",.01)
 ;;00006-0952-54
 ;;9002226.02101,"996,00006-0952-54 ",.02)
 ;;00006-0952-54
 ;;9002226.02101,"996,00006-0952-58 ",.01)
 ;;00006-0952-58
 ;;9002226.02101,"996,00006-0952-58 ",.02)
 ;;00006-0952-58
 ;;9002226.02101,"996,00006-0952-82 ",.01)
 ;;00006-0952-82
 ;;9002226.02101,"996,00006-0952-82 ",.02)
 ;;00006-0952-82
 ;;9002226.02101,"996,00006-0952-87 ",.01)
 ;;00006-0952-87
 ;;9002226.02101,"996,00006-0952-87 ",.02)
 ;;00006-0952-87
 ;;9002226.02101,"996,00006-0960-01 ",.01)
 ;;00006-0960-01
 ;;9002226.02101,"996,00006-0960-01 ",.02)
 ;;00006-0960-01
 ;;9002226.02101,"996,00006-0960-28 ",.01)
 ;;00006-0960-28
 ;;9002226.02101,"996,00006-0960-28 ",.02)
 ;;00006-0960-28
 ;;9002226.02101,"996,00006-0960-31 ",.01)
 ;;00006-0960-31
 ;;9002226.02101,"996,00006-0960-31 ",.02)
 ;;00006-0960-31
 ;;9002226.02101,"996,00006-0960-54 ",.01)
 ;;00006-0960-54