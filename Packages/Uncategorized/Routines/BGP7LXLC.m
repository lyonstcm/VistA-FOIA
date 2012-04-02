BGP7LXLC ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON AUG 29, 2006 ;
 ;;7.0;IHS CLINICAL REPORTING;;JAN 24, 2007
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;21,"52959-0410-90 ")
 ;;1029
 ;;21,"52959-0454-02 ")
 ;;1196
 ;;21,"52959-0454-14 ")
 ;;1197
 ;;21,"52959-0454-60 ")
 ;;1198
 ;;21,"52959-0527-10 ")
 ;;963
 ;;21,"52959-0527-14 ")
 ;;964
 ;;21,"52959-0527-15 ")
 ;;965
 ;;21,"52959-0527-20 ")
 ;;966
 ;;21,"52959-0527-30 ")
 ;;967
 ;;21,"52959-0673-60 ")
 ;;1323
 ;;21,"52959-0709-00 ")
 ;;1077
 ;;21,"52959-0709-14 ")
 ;;1078
 ;;21,"52959-0709-15 ")
 ;;1079
 ;;21,"52959-0709-18 ")
 ;;1080
 ;;21,"52959-0709-20 ")
 ;;1081
 ;;21,"52959-0709-28 ")
 ;;1082
 ;;21,"52959-0709-30 ")
 ;;1083
 ;;21,"52959-0709-40 ")
 ;;1084
 ;;21,"52959-0709-42 ")
 ;;1085
 ;;21,"52959-0709-45 ")
 ;;1086
 ;;21,"52959-0709-50 ")
 ;;1087
 ;;21,"52959-0709-60 ")
 ;;1088
 ;;21,"52959-0709-90 ")
 ;;1089
 ;;21,"53265-0264-10 ")
 ;;827
 ;;21,"53265-0264-50 ")
 ;;828
 ;;21,"53265-0265-10 ")
 ;;684
 ;;21,"53265-0265-50 ")
 ;;685
 ;;21,"53265-0266-10 ")
 ;;316
 ;;21,"53265-0266-11 ")
 ;;317
 ;;21,"53265-0266-50 ")
 ;;318
 ;;21,"53445-1079-01 ")
 ;;1454
 ;;21,"53445-1821-01 ")
 ;;1455
 ;;21,"53489-0110-01 ")
 ;;319
 ;;21,"53489-0110-05 ")
 ;;320
 ;;21,"53489-0110-10 ")
 ;;321
 ;;21,"54274-0027-10 ")
 ;;1456
 ;;21,"54274-0027-30 ")
 ;;1457
 ;;21,"54274-0028-10 ")
 ;;1458
 ;;21,"54274-0028-30 ")
 ;;1459
 ;;21,"54274-0329-10 ")
 ;;1460
 ;;21,"54274-0329-30 ")
 ;;1461
 ;;21,"54274-0369-10 ")
 ;;1590
 ;;21,"54274-0461-50 ")
 ;;1375
 ;;21,"54274-0463-50 ")
 ;;1336
 ;;21,"54274-0467-50 ")
 ;;1749
 ;;21,"54274-0763-62 ")
 ;;1376
 ;;21,"54274-0820-50 ")
 ;;1750
 ;;21,"54274-0821-50 ")
 ;;1377
 ;;21,"54274-0822-50 ")
 ;;1558
 ;;21,"54274-0823-50 ")
 ;;1337
 ;;21,"54348-0108-09 ")
 ;;1804
 ;;21,"54348-0108-10 ")
 ;;1805
 ;;21,"54348-0109-20 ")
 ;;1806
 ;;21,"54348-0931-10 ")
 ;;1807
 ;;21,"54569-0834-05 ")
 ;;322
 ;;21,"54569-0835-00 ")
 ;;114
 ;;21,"54569-0835-02 ")
 ;;115
 ;;21,"54569-0835-08 ")
 ;;116
 ;;21,"54569-0838-00 ")
 ;;1233
 ;;21,"54569-0838-01 ")
 ;;968
 ;;21,"54569-0838-02 ")
 ;;969
 ;;21,"54569-0838-03 ")
 ;;970
 ;;21,"54569-0839-00 ")
 ;;971
 ;;21,"54569-0839-01 ")
 ;;972
 ;;21,"54569-0839-02 ")
 ;;973
 ;;21,"54569-0839-03 ")
 ;;974
 ;;21,"54569-0840-00 ")
 ;;1199
 ;;21,"54569-0840-01 ")
 ;;1200
 ;;21,"54569-0840-02 ")
 ;;1201
 ;;21,"54569-0843-00 ")
 ;;829
 ;;21,"54569-0843-01 ")
 ;;830
 ;;21,"54569-0843-02 ")
 ;;831
 ;;21,"54569-0843-03 ")
 ;;832
 ;;21,"54569-0843-06 ")
 ;;833
 ;;21,"54569-0843-07 ")
 ;;834
 ;;21,"54569-0852-00 ")
 ;;686
 ;;21,"54569-0852-01 ")
 ;;687
 ;;21,"54569-0852-04 ")
 ;;688
 ;;21,"54569-0852-05 ")
 ;;689
 ;;21,"54569-0852-06 ")
 ;;690
 ;;21,"54569-0852-07 ")
 ;;691
 ;;21,"54569-0852-09 ")
 ;;692
 ;;21,"54569-0854-04 ")
 ;;1202
 ;;21,"54569-0855-00 ")
 ;;1030
 ;;21,"54569-0855-01 ")
 ;;1031
 ;;21,"54569-0855-02 ")
 ;;1032
 ;;21,"54569-0855-04 ")
 ;;1033
 ;;21,"54569-0855-05 ")
 ;;1034
 ;;21,"54569-0855-06 ")
 ;;1035
 ;;21,"54569-0855-07 ")
 ;;1036
 ;;21,"54569-0855-08 ")
 ;;1037
 ;;21,"54569-0855-09 ")
 ;;1038
 ;;21,"54569-0917-01 ")
 ;;1751
 ;;21,"54569-1506-00 ")
 ;;1462
 ;;21,"54569-1506-03 ")
 ;;528
 ;;21,"54569-1709-00 ")
 ;;323
 ;;21,"54569-1709-01 ")
 ;;324
 ;;21,"54569-1709-02 ")
 ;;325
 ;;21,"54569-1709-03 ")
 ;;326
 ;;21,"54569-1709-04 ")
 ;;327
 ;;21,"54569-1709-05 ")
 ;;328
 ;;21,"54569-1709-07 ")
 ;;329
 ;;21,"54569-1709-08 ")
 ;;330
 ;;21,"54569-1709-09 ")
 ;;1463
 ;;21,"54569-1894-01 ")
 ;;928
 ;;21,"54569-1970-00 ")
 ;;529
 ;;21,"54569-1970-01 ")
 ;;530
 ;;21,"54569-1970-02 ")
 ;;531
 ;;21,"54569-1970-04 ")
 ;;532
 ;;21,"54569-1970-05 ")
 ;;533
 ;;21,"54569-1970-06 ")
 ;;534
 ;;21,"54569-1970-07 ")
 ;;1464
 ;;21,"54569-1970-09 ")
 ;;535
 ;;21,"54569-2072-00 ")
 ;;615
 ;;21,"54569-2562-02 ")
 ;;1203
 ;;21,"54569-2562-03 ")
 ;;1204
 ;;21,"54569-2573-00 ")
 ;;117
 ;;21,"54569-2573-01 ")
 ;;118
 ;;21,"54569-2573-02 ")
 ;;119
 ;;21,"54569-2573-03 ")
 ;;120
 ;;21,"54569-2573-04 ")
 ;;121
 ;;21,"54569-2573-06 ")
 ;;122
 ;;21,"54569-2573-07 ")
 ;;123
 ;;21,"54569-2573-08 ")
 ;;124
 ;;21,"54569-2573-09 ")
 ;;125
 ;;21,"54569-2893-02 ")
 ;;1205
 ;;21,"54569-2893-03 ")
 ;;1206
 ;;21,"54569-3101-00 ")
 ;;1752
 ;;21,"54569-3193-00 ")
 ;;126
 ;;21,"54569-3193-01 ")
 ;;127
 ;;21,"54569-3193-02 ")
 ;;1591
 ;;21,"54569-3193-05 ")
 ;;128
 ;;21,"54569-3193-07 ")
 ;;129
 ;;21,"54569-3193-08 ")
 ;;130
 ;;21,"54569-3193-09 ")
 ;;131
 ;;21,"54569-3311-00 ")
 ;;1324
 ;;21,"54569-3403-00 ")
 ;;331
 ;;21,"54569-3403-01 ")
 ;;332
 ;;21,"54569-3403-04 ")
 ;;333
 ;;21,"54569-3403-05 ")
 ;;334
 ;;21,"54569-3403-06 ")
 ;;335
 ;;21,"54569-3403-07 ")
 ;;336
 ;;21,"54569-4008-00 ")
 ;;132
 ;;21,"54569-4008-01 ")
 ;;133
 ;;21,"54569-4614-00 ")
 ;;693
 ;;21,"54569-4986-00 ")
 ;;1039
 ;;21,"54569-4986-02 ")
 ;;1234
 ;;21,"54569-5184-00 ")
 ;;1592
 ;;21,"54569-5477-00 ")
 ;;1378
 ;;21,"54569-5477-01 ")
 ;;1379
 ;;21,"54569-5477-02 ")
 ;;1380
 ;;21,"54569-5477-03 ")
 ;;1381
 ;;21,"54569-5477-05 ")
 ;;1382
 ;;21,"54569-5477-06 ")
 ;;1383
 ;;21,"54569-5538-00 ")
 ;;1384
 ;;21,"54569-5623-00 ")
 ;;1559
 ;;21,"54569-5636-00 ")
 ;;1385
 ;;21,"54569-5636-01 ")
 ;;1386
 ;;21,"54732-0005-10 ")
 ;;1387
 ;;21,"54868-0020-00 ")
 ;;337
 ;;21,"54868-0041-00 ")
 ;;1753
 ;;21,"54868-0083-00 ")
 ;;1338
 ;;21,"54868-0084-00 ")
 ;;1388
 ;;21,"54868-0084-01 ")
 ;;1389
 ;;21,"54868-0084-02 ")
 ;;1390
 ;;21,"54868-0318-00 ")
 ;;1593
 ;;21,"54868-0318-01 ")
 ;;1594
 ;;21,"54868-0318-02 ")
 ;;1595
 ;;21,"54868-0318-03 ")
 ;;1596
 ;;21,"54868-0318-04 ")
 ;;1597
 ;;21,"54868-0426-00 ")
 ;;1527
 ;;21,"54868-0586-01 ")
 ;;694
 ;;21,"54868-0586-02 ")
 ;;695
 ;;21,"54868-0586-03 ")
 ;;696
 ;;21,"54868-0586-04 ")
 ;;697
 ;;21,"54868-0586-05 ")
 ;;698
 ;;21,"54868-0586-06 ")
 ;;699
 ;;21,"54868-0733-00 ")
 ;;1568
 ;;21,"54868-0733-01 ")
 ;;1569
 ;;21,"54868-0733-02 ")
 ;;1570
 ;;21,"54868-0733-03 ")
 ;;1571
 ;;21,"54868-0733-04 ")
 ;;1572
 ;;21,"54868-0733-05 ")
 ;;1573
 ;;21,"54868-0735-00 ")
 ;;536
 ;;21,"54868-0735-01 ")
 ;;537
 ;;21,"54868-0735-02 ")
 ;;538
 ;;21,"54868-0735-03 ")
 ;;539
 ;;21,"54868-0735-04 ")
 ;;540
 ;;21,"54868-0735-05 ")
 ;;541
 ;;21,"54868-0735-07 ")
 ;;542
 ;;21,"54868-0735-08 ")
 ;;543
 ;;21,"54868-0735-09 ")
 ;;544
 ;;21,"54868-0794-00 ")
 ;;1754
 ;;21,"54868-0794-01 ")
 ;;1755
 ;;21,"54868-0816-01 ")
 ;;338
 ;;21,"54868-0816-02 ")
 ;;339
 ;;21,"54868-0816-03 ")
 ;;340
 ;;21,"54868-0816-04 ")
 ;;341
 ;;21,"54868-0816-05 ")
 ;;342
 ;;21,"54868-0816-06 ")
 ;;343
 ;;21,"54868-0816-07 ")
 ;;344
 ;;21,"54868-0816-08 ")
 ;;1465
 ;;21,"54868-0844-00 ")
 ;;1391
 ;;21,"54868-1017-00 ")
 ;;1466
 ;;21,"54868-1056-00 ")
 ;;975
 ;;21,"54868-1056-01 ")
 ;;976
 ;;21,"54868-1056-03 ")
 ;;977
 ;;21,"54868-1056-04 ")
 ;;978
 ;;21,"54868-1056-05 ")
 ;;979
 ;;21,"54868-1101-00 ")
 ;;1325
 ;;21,"54868-1101-02 ")
 ;;1207
 ;;21,"54868-1101-03 ")
 ;;1208
 ;;21,"54868-1101-04 ")
 ;;1209
 ;;21,"54868-1103-00 ")
 ;;835
 ;;21,"54868-1103-03 ")
 ;;836
 ;;21,"54868-1103-05 ")
 ;;837
 ;;21,"54868-1103-06 ")
 ;;838
 ;;21,"54868-1103-07 ")
 ;;839
 ;;21,"54868-1103-08 ")
 ;;840
 ;;21,"54868-1103-09 ")
 ;;841
 ;;21,"54868-1110-00 ")
 ;;1598
 ;;21,"54868-1110-01 ")
 ;;1599
 ;;21,"54868-1110-03 ")
 ;;1600
 ;;21,"54868-1110-04 ")
 ;;1601
 ;;21,"54868-1110-05 ")
 ;;1602
 ;;21,"54868-1110-07 ")
 ;;1603
 ;;21,"54868-1110-08 ")
 ;;1604
 ;;21,"54868-1110-09 ")
 ;;1605
 ;;21,"54868-1253-01 ")
 ;;1392
 ;;21,"54868-1253-02 ")
 ;;1393
 ;;21,"54868-1534-00 ")
 ;;1528
 ;;21,"54868-1746-00 ")
 ;;1756
 ;;21,"54868-1826-01 ")
 ;;1210
 ;;21,"54868-2206-00 ")
 ;;1529
 ;;21,"54868-2956-00 ")
 ;;1235
 ;;21,"54868-2956-01 ")
 ;;1236
 ;;21,"54868-2956-03 ")
 ;;1040
 ;;21,"54868-2956-04 ")
 ;;1041
 ;;21,"54868-2956-05 ")
 ;;1042
 ;;21,"54868-4102-00 ")
 ;;980
 ;;21,"54868-4102-01 ")
 ;;1237
 ;;21,"54868-4102-02 ")
 ;;1238
 ;;21,"54868-4102-03 ")
 ;;1239
 ;;21,"54868-4102-04 ")
 ;;1240
 ;;21,"54868-4733-00 ")
 ;;1394
 ;;21,"54868-4733-01 ")
 ;;1395
 ;;21,"54868-4733-02 ")
 ;;1396
 ;;21,"54868-4733-03 ")
 ;;1397
 ;;21,"54868-4733-04 ")
 ;;1398
 ;;21,"54868-4733-05 ")
 ;;1399
 ;;21,"54868-4733-06 ")
 ;;1400
 ;;21,"54868-4979-00 ")
 ;;1757
 ;;21,"54868-4979-01 ")
 ;;1758
 ;;21,"54868-4982-01 ")
 ;;1759
 ;;21,"54868-5073-00 ")
 ;;1574
 ;;21,"54868-5073-01 ")
 ;;1575
 ;;21,"54868-5073-02 ")
 ;;1576
 ;;21,"54868-5073-03 ")
 ;;1577
 ;;21,"54868-5159-00 ")
 ;;1760
 ;;21,"55045-1325-05 ")
 ;;1241
 ;;21,"55045-1325-07 ")
 ;;1242
 ;;21,"55045-1325-08 ")
 ;;1243
 ;;21,"55045-1386-00 ")
 ;;842
 ;;21,"55045-1386-02 ")
 ;;843
 ;;21,"55045-1386-04 ")
 ;;844
 ;;21,"55045-1386-07 ")
 ;;845
 ;;21,"55045-1386-08 ")
 ;;846
 ;;21,"55045-1386-09 ")
 ;;847
 ;;21,"55045-1433-01 ")
 ;;1467
 ;;21,"55045-1433-02 ")
 ;;1808
 ;;21,"55045-1433-03 ")
 ;;1468
 ;;21,"55045-1433-05 ")
 ;;1469
 ;;21,"55045-1493-08 ")
 ;;1470
 ;;21,"55045-1531-01 ")
 ;;700
 ;;21,"55045-1531-03 ")
 ;;701
 ;;21,"55045-1531-08 ")
 ;;702
 ;;21,"55045-1531-09 ")
 ;;703
 ;;21,"55045-1566-00 ")
 ;;1606
 ;;21,"55045-1566-01 ")
 ;;1607
 ;;21,"55045-1566-02 ")
 ;;1608
 ;;21,"55045-1566-03 ")
 ;;1609
 ;;21,"55045-1566-06 ")
 ;;1610
 ;;21,"55045-1566-09 ")
 ;;1611
 ;;21,"55045-1586-08 ")
 ;;1326
 ;;21,"55045-1594-03 ")
 ;;1471
 ;;21,"55045-1594-04 ")
 ;;1472
 ;;21,"55045-1594-06 ")
 ;;1473
 ;;21,"55045-1594-07 ")
 ;;1474
 ;;21,"55045-1594-08 ")
 ;;1475
 ;;21,"55045-1594-09 ")
 ;;1476
 ;;21,"55045-1598-00 ")
 ;;1244
 ;;21,"55045-1598-03 ")
 ;;1245
 ;;21,"55045-1598-05 ")
 ;;1246
 ;;21,"55045-1598-06 ")
 ;;1247
 ;;21,"55045-1598-07 ")
 ;;1248
 ;;21,"55045-1598-08 ")
 ;;1249
 ;;21,"55045-1598-09 ")
 ;;1250
 ;;21,"55045-1620-09 ")
 ;;1560
 ;;21,"55045-1637-05 ")
 ;;1251
 ;;21,"55045-1690-04 ")
 ;;1561
 ;;21,"55045-2777-06 ")
 ;;1327
 ;;21,"55045-2777-08 ")
 ;;1328
 ;;21,"55045-2972-05 ")
 ;;1401
 ;;21,"55045-2972-06 ")
 ;;1402
 ;;21,"55045-2972-07 ")
 ;;1403
 ;;21,"55045-2972-08 ")
 ;;1404
 ;;21,"55175-0587-00 ")
 ;;1612
 ;;21,"55175-0587-01 ")
 ;;1613
 ;;21,"55175-0587-02 ")
 ;;1614
 ;;21,"55175-0587-03 ")
 ;;1615
 ;;21,"55175-0587-04 ")
 ;;1616
 ;;21,"55175-0587-05 ")
 ;;1617
 ;;21,"55175-0587-06 ")
 ;;1618
 ;;21,"55175-0587-07 ")
 ;;1619
 ;;21,"55175-0587-08 ")
 ;;1620
 ;;21,"55175-0587-09 ")
 ;;1621
 ;;21,"55175-0588-02 ")
 ;;1622
 ;;21,"55175-1313-08 ")
 ;;1698
 ;;21,"55175-1931-00 ")
 ;;1580
 ;;21,"55175-1931-01 ")
 ;;1581
 ;;21,"55175-1931-02 ")
 ;;1582
 ;;21,"55175-1931-03 ")
 ;;1583
 ;;21,"55175-1931-04 ")
 ;;1584
 ;;21,"55175-1931-05 ")
 ;;1718
 ;;21,"55175-1931-06 ")
 ;;1719
 ;;21,"55175-1931-07 ")
 ;;1720
 ;;21,"55175-1931-08 ")
 ;;1721
 ;;21,"55175-1931-09 ")
 ;;1722
 ;;21,"55175-2739-02 ")
 ;;1252
 ;;21,"55175-2739-04 ")
 ;;1253
 ;;21,"55175-2740-00 ")
 ;;1254
 ;;21,"55175-2740-01 ")
 ;;1255
 ;;21,"55175-2740-02 ")
 ;;1256
 ;;21,"55175-2740-03 ")
 ;;1257
 ;;21,"55175-2740-04 ")
 ;;1258
 ;;21,"55175-2740-08 ")
 ;;1259
 ;;21,"55175-2780-00 ")
 ;;1260
 ;;21,"55175-2780-01 ")
 ;;1261
 ;;21,"55175-2780-02 ")
 ;;1262
 ;;21,"55175-2780-03 ")
 ;;1263
 ;;21,"55175-2780-04 ")
 ;;1264
 ;;21,"55175-2780-05 ")
 ;;1265
 ;;21,"55175-2780-06 ")
 ;;1266
 ;;21,"55175-2780-07 ")
 ;;1267
 ;;21,"55175-4087-01 ")
 ;;1477
 ;;21,"55175-4087-02 ")
 ;;1478
 ;;21,"55175-4087-03 ")
 ;;1479
 ;;21,"55175-4087-04 ")
 ;;1480
 ;;21,"55175-4087-05 ")
 ;;1481
 ;;21,"55175-4087-06 ")
 ;;1482
 ;;21,"55175-4087-07 ")
 ;;1483
 ;;21,"55175-4087-08 ")
 ;;1484
 ;;21,"55175-4087-09 ")
 ;;1485
 ;;21,"55175-4088-02 ")
 ;;1486
 ;;21,"55175-4088-03 ")
 ;;1487
 ;;21,"55175-4088-04 ")
 ;;1488
 ;;21,"55175-4088-05 ")
 ;;1489
 ;;21,"55175-5180-03 ")
 ;;1490
 ;;21,"55289-0017-20 ")
 ;;848
 ;;21,"55289-0017-40 ")
 ;;849
 ;;21,"55289-0049-01 ")
 ;;345
 ;;21,"55289-0049-10 ")
 ;;346
 ;;21,"55289-0049-14 ")
 ;;347
 ;;21,"55289-0049-15 ")
 ;;348
 ;;21,"55289-0049-20 ")
 ;;349
 ;;21,"55289-0049-21 ")
 ;;350
 ;;21,"55289-0049-24 ")
 ;;351
 ;;21,"55289-0049-30 ")
 ;;352
 ;;21,"55289-0049-40 ")
 ;;353
 ;;21,"55289-0049-60 ")
 ;;354
 ;;21,"55289-0049-90 ")
 ;;355
 ;;21,"55289-0115-15 ")
 ;;134
 ;;21,"55289-0115-21 ")
 ;;135
 ;;21,"55289-0115-30 ")
 ;;136
 ;;21,"55289-0128-01 ")
 ;;137
 ;;21,"55289-0128-30 ")
 ;;138
 ;;21,"55289-0164-01 ")
 ;;850
 ;;21,"55289-0164-10 ")
 ;;851
 ;;21,"55289-0164-15 ")
 ;;852
 ;;21,"55289-0164-20 ")
 ;;853
 ;;21,"55289-0164-24 ")
 ;;854
 ;;21,"55289-0164-28 ")
 ;;855
 ;;21,"55289-0164-30 ")
 ;;856
 ;;21,"55289-0164-40 ")
 ;;857
 ;;21,"55289-0164-60 ")
 ;;858
 ;;21,"55289-0316-20 ")
 ;;1043
 ;;21,"55289-0316-25 ")
 ;;1044
 ;;21,"55289-0316-30 ")
 ;;1045
 ;;21,"55289-0316-40 ")
 ;;1046
 ;;21,"55289-0316-56 ")
 ;;1268