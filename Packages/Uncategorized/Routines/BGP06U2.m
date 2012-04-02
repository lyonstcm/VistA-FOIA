BGP06U2 ;IHS/CMI/LAB-CREATED BY ^ATXSTX ON MAY 23, 2010;
 ;;10.0;IHS CLINICAL REPORTING;;JUN 18, 2010
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;21,"61392-0169-51 ")
 ;;394
 ;;21,"61392-0169-54 ")
 ;;395
 ;;21,"61392-0169-60 ")
 ;;396
 ;;21,"61392-0169-90 ")
 ;;397
 ;;21,"61392-0169-91 ")
 ;;398
 ;;21,"62584-0808-01 ")
 ;;399
 ;;21,"62584-0808-11 ")
 ;;400
 ;;21,"63304-0518-01 ")
 ;;401
 ;;21,"63629-1459-01 ")
 ;;402
 ;;21,"63629-1459-02 ")
 ;;403
 ;;21,"63629-1459-03 ")
 ;;404
 ;;21,"63629-1748-01 ")
 ;;405
 ;;21,"63629-1748-02 ")
 ;;406
 ;;21,"63629-2713-01 ")
 ;;407
 ;;21,"63629-2713-02 ")
 ;;408
 ;;21,"64727-3298-01 ")
 ;;409
 ;;21,"64727-3298-02 ")
 ;;410
 ;;21,"64727-3299-01 ")
 ;;411
 ;;21,"64727-3299-02 ")
 ;;412
 ;;21,"64727-3300-01 ")
 ;;413
 ;;21,"64727-3300-02 ")
 ;;414
 ;;21,"64727-3308-01 ")
 ;;415
 ;;21,"64727-3308-02 ")
 ;;416
 ;;21,"64727-3312-01 ")
 ;;417
 ;;21,"64727-3312-02 ")
 ;;418
 ;;21,"64727-7070-01 ")
 ;;419
 ;;21,"64727-7070-02 ")
 ;;420
 ;;21,"64727-7073-01 ")
 ;;421
 ;;21,"64727-7073-02 ")
 ;;422
 ;;21,"64727-7075-08 ")
 ;;423
 ;;21,"64727-7080-01 ")
 ;;424
 ;;21,"64727-7080-02 ")
 ;;425
 ;;21,"64727-7087-01 ")
 ;;426
 ;;21,"64727-7087-02 ")
 ;;427
 ;;21,"66105-0450-10 ")
 ;;428
 ;;21,"66336-0008-14 ")
 ;;429
 ;;21,"66336-0008-28 ")
 ;;430
 ;;21,"66336-0289-14 ")
 ;;431
 ;;21,"66336-0289-20 ")
 ;;432
 ;;21,"66336-0590-14 ")
 ;;433
 ;;21,"66336-0590-20 ")
 ;;434
 ;;21,"66336-0952-60 ")
 ;;435
 ;;21,"68115-0220-06 ")
 ;;436
 ;;21,"68115-0220-14 ")
 ;;437
 ;;21,"68115-0220-20 ")
 ;;438
 ;;21,"68115-0258-28 ")
 ;;439
 ;;21,"68115-0259-28 ")
 ;;440
 ;;21,"68115-0666-00 ")
 ;;441
 ;;9002226,718,.01)
 ;;BGP HEDIS OTHER NDC AVOID ELD
 ;;9002226,718,.02)
 ;;@
 ;;9002226,718,.04)
 ;;n
 ;;9002226,718,.06)
 ;;@
 ;;9002226,718,.08)
 ;;@
 ;;9002226,718,.09)
 ;;@
 ;;9002226,718,.11)
 ;;@
 ;;9002226,718,.12)
 ;;@
 ;;9002226,718,.13)
 ;;1
 ;;9002226,718,.14)
 ;;@
 ;;9002226,718,.15)
 ;;@
 ;;9002226,718,.16)
 ;;@
 ;;9002226,718,.17)
 ;;@
 ;;9002226,718,3101)
 ;;@
 ;;9002226.02101,"718,00076-0301-03 ",.01)
 ;;00076-0301-03
 ;;9002226.02101,"718,00076-0301-03 ",.02)
 ;;00076-0301-03
 ;;9002226.02101,"718,00076-0301-04 ",.01)
 ;;00076-0301-04
 ;;9002226.02101,"718,00076-0301-04 ",.02)
 ;;00076-0301-04
 ;;9002226.02101,"718,00093-2130-01 ",.01)
 ;;00093-2130-01
 ;;9002226.02101,"718,00093-2130-01 ",.02)
 ;;00093-2130-01
 ;;9002226.02101,"718,00093-2130-10 ",.01)
 ;;00093-2130-10
 ;;9002226.02101,"718,00093-2130-10 ",.02)
 ;;00093-2130-10
 ;;9002226.02101,"718,00093-2130-19 ",.01)
 ;;00093-2130-19
 ;;9002226.02101,"718,00093-2130-19 ",.02)
 ;;00093-2130-19
 ;;9002226.02101,"718,00093-2130-93 ",.01)
 ;;00093-2130-93
 ;;9002226.02101,"718,00093-2130-93 ",.02)
 ;;00093-2130-93
 ;;9002226.02101,"718,00093-2131-01 ",.01)
 ;;00093-2131-01
 ;;9002226.02101,"718,00093-2131-01 ",.02)
 ;;00093-2131-01
 ;;9002226.02101,"718,00093-2131-10 ",.01)
 ;;00093-2131-10
 ;;9002226.02101,"718,00093-2131-10 ",.02)
 ;;00093-2131-10
 ;;9002226.02101,"718,00093-2131-19 ",.01)
 ;;00093-2131-19
 ;;9002226.02101,"718,00093-2131-19 ",.02)
 ;;00093-2131-19
 ;;9002226.02101,"718,00093-2131-93 ",.01)
 ;;00093-2131-93
 ;;9002226.02101,"718,00093-2131-93 ",.02)
 ;;00093-2131-93
 ;;9002226.02101,"718,00115-3984-01 ",.01)
 ;;00115-3984-01
 ;;9002226.02101,"718,00115-3984-01 ",.02)
 ;;00115-3984-01
 ;;9002226.02101,"718,00115-4824-01 ",.01)
 ;;00115-4824-01
 ;;9002226.02101,"718,00115-4824-01 ",.02)
 ;;00115-4824-01
 ;;9002226.02101,"718,00115-4824-03 ",.01)
 ;;00115-4824-03
 ;;9002226.02101,"718,00115-4824-03 ",.02)
 ;;00115-4824-03
 ;;9002226.02101,"718,00115-4826-01 ",.01)
 ;;00115-4826-01
 ;;9002226.02101,"718,00115-4826-01 ",.02)
 ;;00115-4826-01
 ;;9002226.02101,"718,00115-4826-03 ",.01)
 ;;00115-4826-03
 ;;9002226.02101,"718,00115-4826-03 ",.02)
 ;;00115-4826-03
 ;;9002226.02101,"718,00115-7037-01 ",.01)
 ;;00115-7037-01
 ;;9002226.02101,"718,00115-7037-01 ",.02)
 ;;00115-7037-01
 ;;9002226.02101,"718,00149-0007-05 ",.01)
 ;;00149-0007-05
 ;;9002226.02101,"718,00149-0007-05 ",.02)
 ;;00149-0007-05
 ;;9002226.02101,"718,00149-0008-05 ",.01)
 ;;00149-0008-05
 ;;9002226.02101,"718,00149-0008-05 ",.02)
 ;;00149-0008-05
 ;;9002226.02101,"718,00149-0008-66 ",.01)
 ;;00149-0008-66
 ;;9002226.02101,"718,00149-0008-66 ",.02)
 ;;00149-0008-66
 ;;9002226.02101,"718,00149-0008-67 ",.01)
 ;;00149-0008-67
 ;;9002226.02101,"718,00149-0008-67 ",.02)
 ;;00149-0008-67
 ;;9002226.02101,"718,00149-0008-77 ",.01)
 ;;00149-0008-77
 ;;9002226.02101,"718,00149-0008-77 ",.02)
 ;;00149-0008-77
 ;;9002226.02101,"718,00149-0009-05 ",.01)
 ;;00149-0009-05
 ;;9002226.02101,"718,00149-0009-05 ",.02)
 ;;00149-0009-05
 ;;9002226.02101,"718,00149-0009-66 ",.01)
 ;;00149-0009-66
 ;;9002226.02101,"718,00149-0009-66 ",.02)
 ;;00149-0009-66
 ;;9002226.02101,"718,00149-0009-67 ",.01)
 ;;00149-0009-67
 ;;9002226.02101,"718,00149-0009-67 ",.02)
 ;;00149-0009-67
 ;;9002226.02101,"718,00149-0009-77 ",.01)
 ;;00149-0009-77
 ;;9002226.02101,"718,00149-0009-77 ",.02)
 ;;00149-0009-77
 ;;9002226.02101,"718,00149-0710-01 ",.01)
 ;;00149-0710-01
 ;;9002226.02101,"718,00149-0710-01 ",.02)
 ;;00149-0710-01
 ;;9002226.02101,"718,00172-2130-60 ",.01)
 ;;00172-2130-60
 ;;9002226.02101,"718,00172-2130-60 ",.02)
 ;;00172-2130-60
 ;;9002226.02101,"718,00172-2130-80 ",.01)
 ;;00172-2130-80
 ;;9002226.02101,"718,00172-2130-80 ",.02)
 ;;00172-2130-80
 ;;9002226.02101,"718,00172-2131-60 ",.01)
 ;;00172-2131-60
 ;;9002226.02101,"718,00172-2131-60 ",.02)
 ;;00172-2131-60
 ;;9002226.02101,"718,00172-2131-70 ",.01)
 ;;00172-2131-70
 ;;9002226.02101,"718,00172-2131-70 ",.02)
 ;;00172-2131-70
 ;;9002226.02101,"718,00182-0493-10 ",.01)
 ;;00182-0493-10
 ;;9002226.02101,"718,00182-0493-10 ",.02)
 ;;00182-0493-10
 ;;9002226.02101,"718,00182-0494-10 ",.01)
 ;;00182-0494-10
 ;;9002226.02101,"718,00182-0494-10 ",.02)
 ;;00182-0494-10
 ;;9002226.02101,"718,00182-1944-00 ",.01)
 ;;00182-1944-00
 ;;9002226.02101,"718,00182-1944-00 ",.02)
 ;;00182-1944-00
 ;;9002226.02101,"718,00182-1944-89 ",.01)
 ;;00182-1944-89
 ;;9002226.02101,"718,00182-1944-89 ",.02)
 ;;00182-1944-89
 ;;9002226.02101,"718,00182-1945-00 ",.01)
 ;;00182-1945-00
 ;;9002226.02101,"718,00182-1945-00 ",.02)
 ;;00182-1945-00
 ;;9002226.02101,"718,00182-1945-89 ",.01)
 ;;00182-1945-89
 ;;9002226.02101,"718,00182-1945-89 ",.02)
 ;;00182-1945-89
 ;;9002226.02101,"718,00185-0122-01 ",.01)
 ;;00185-0122-01
 ;;9002226.02101,"718,00185-0122-01 ",.02)
 ;;00185-0122-01
 ;;9002226.02101,"718,00185-0122-10 ",.01)
 ;;00185-0122-10
 ;;9002226.02101,"718,00185-0122-10 ",.02)
 ;;00185-0122-10
 ;;9002226.02101,"718,00187-0311-01 ",.01)
 ;;00187-0311-01
 ;;9002226.02101,"718,00187-0311-01 ",.02)
 ;;00187-0311-01
 ;;9002226.02101,"718,00187-0311-06 ",.01)
 ;;00187-0311-06
 ;;9002226.02101,"718,00187-0311-06 ",.02)
 ;;00187-0311-06
 ;;9002226.02101,"718,00187-0499-06 ",.01)
 ;;00187-0499-06
 ;;9002226.02101,"718,00187-0499-06 ",.02)
 ;;00187-0499-06
 ;;9002226.02101,"718,00187-0901-01 ",.01)
 ;;00187-0901-01
 ;;9002226.02101,"718,00187-0901-01 ",.02)
 ;;00187-0901-01
 ;;9002226.02101,"718,00187-0902-01 ",.01)
 ;;00187-0902-01
 ;;9002226.02101,"718,00187-0902-01 ",.02)
 ;;00187-0902-01
 ;;9002226.02101,"718,00223-2072-01 ",.01)
 ;;00223-2072-01
 ;;9002226.02101,"718,00223-2072-01 ",.02)
 ;;00223-2072-01
 ;;9002226.02101,"718,00223-2072-02 ",.01)
 ;;00223-2072-02
 ;;9002226.02101,"718,00223-2072-02 ",.02)
 ;;00223-2072-02
 ;;9002226.02101,"718,00223-2074-01 ",.01)
 ;;00223-2074-01
 ;;9002226.02101,"718,00223-2074-01 ",.02)
 ;;00223-2074-01
 ;;9002226.02101,"718,00223-2074-02 ",.01)
 ;;00223-2074-02
 ;;9002226.02101,"718,00223-2074-02 ",.02)
 ;;00223-2074-02
 ;;9002226.02101,"718,00223-2076-01 ",.01)
 ;;00223-2076-01
 ;;9002226.02101,"718,00223-2076-01 ",.02)
 ;;00223-2076-01
 ;;9002226.02101,"718,00223-2076-02 ",.01)
 ;;00223-2076-02
 ;;9002226.02101,"718,00223-2076-02 ",.02)
 ;;00223-2076-02
 ;;9002226.02101,"718,00247-0137-02 ",.01)
 ;;00247-0137-02
 ;;9002226.02101,"718,00247-0137-02 ",.02)
 ;;00247-0137-02
 ;;9002226.02101,"718,00247-0137-04 ",.01)
 ;;00247-0137-04
 ;;9002226.02101,"718,00247-0137-04 ",.02)
 ;;00247-0137-04
 ;;9002226.02101,"718,00247-0137-08 ",.01)
 ;;00247-0137-08
 ;;9002226.02101,"718,00247-0137-08 ",.02)
 ;;00247-0137-08
 ;;9002226.02101,"718,00247-0137-10 ",.01)
 ;;00247-0137-10
 ;;9002226.02101,"718,00247-0137-10 ",.02)
 ;;00247-0137-10
 ;;9002226.02101,"718,00247-0137-12 ",.01)
 ;;00247-0137-12
 ;;9002226.02101,"718,00247-0137-12 ",.02)
 ;;00247-0137-12
 ;;9002226.02101,"718,00247-0137-14 ",.01)
 ;;00247-0137-14
 ;;9002226.02101,"718,00247-0137-14 ",.02)
 ;;00247-0137-14
 ;;9002226.02101,"718,00247-0137-20 ",.01)
 ;;00247-0137-20
 ;;9002226.02101,"718,00247-0137-20 ",.02)
 ;;00247-0137-20
 ;;9002226.02101,"718,00247-0137-21 ",.01)
 ;;00247-0137-21
 ;;9002226.02101,"718,00247-0137-21 ",.02)
 ;;00247-0137-21
 ;;9002226.02101,"718,00247-0137-28 ",.01)
 ;;00247-0137-28
 ;;9002226.02101,"718,00247-0137-28 ",.02)
 ;;00247-0137-28
 ;;9002226.02101,"718,00247-0137-30 ",.01)
 ;;00247-0137-30
 ;;9002226.02101,"718,00247-0137-30 ",.02)
 ;;00247-0137-30
 ;;9002226.02101,"718,00247-0137-40 ",.01)
 ;;00247-0137-40
 ;;9002226.02101,"718,00247-0137-40 ",.02)
 ;;00247-0137-40
 ;;9002226.02101,"718,00247-0159-10 ",.01)
 ;;00247-0159-10
 ;;9002226.02101,"718,00247-0159-10 ",.02)
 ;;00247-0159-10
 ;;9002226.02101,"718,00247-0159-14 ",.01)
 ;;00247-0159-14
 ;;9002226.02101,"718,00247-0159-14 ",.02)
 ;;00247-0159-14
 ;;9002226.02101,"718,00247-0159-20 ",.01)
 ;;00247-0159-20
 ;;9002226.02101,"718,00247-0159-20 ",.02)
 ;;00247-0159-20
 ;;9002226.02101,"718,00247-0159-21 ",.01)
 ;;00247-0159-21
 ;;9002226.02101,"718,00247-0159-21 ",.02)
 ;;00247-0159-21
 ;;9002226.02101,"718,00247-0159-28 ",.01)
 ;;00247-0159-28
 ;;9002226.02101,"718,00247-0159-28 ",.02)
 ;;00247-0159-28
 ;;9002226.02101,"718,00247-0159-30 ",.01)
 ;;00247-0159-30
 ;;9002226.02101,"718,00247-0159-30 ",.02)
 ;;00247-0159-30
 ;;9002226.02101,"718,00247-0159-40 ",.01)
 ;;00247-0159-40
 ;;9002226.02101,"718,00247-0159-40 ",.02)
 ;;00247-0159-40
 ;;9002226.02101,"718,00247-0164-02 ",.01)
 ;;00247-0164-02
 ;;9002226.02101,"718,00247-0164-02 ",.02)
 ;;00247-0164-02
 ;;9002226.02101,"718,00247-0164-03 ",.01)
 ;;00247-0164-03
 ;;9002226.02101,"718,00247-0164-03 ",.02)
 ;;00247-0164-03
 ;;9002226.02101,"718,00247-0164-06 ",.01)
 ;;00247-0164-06
 ;;9002226.02101,"718,00247-0164-06 ",.02)
 ;;00247-0164-06
 ;;9002226.02101,"718,00247-0164-10 ",.01)
 ;;00247-0164-10
 ;;9002226.02101,"718,00247-0164-10 ",.02)
 ;;00247-0164-10
 ;;9002226.02101,"718,00247-0164-14 ",.01)
 ;;00247-0164-14
 ;;9002226.02101,"718,00247-0164-14 ",.02)
 ;;00247-0164-14
 ;;9002226.02101,"718,00247-0164-20 ",.01)
 ;;00247-0164-20
 ;;9002226.02101,"718,00247-0164-20 ",.02)
 ;;00247-0164-20
 ;;9002226.02101,"718,00247-0164-21 ",.01)
 ;;00247-0164-21
 ;;9002226.02101,"718,00247-0164-21 ",.02)
 ;;00247-0164-21
 ;;9002226.02101,"718,00247-0164-90 ",.01)
 ;;00247-0164-90
 ;;9002226.02101,"718,00247-0164-90 ",.02)
 ;;00247-0164-90
 ;;9002226.02101,"718,00247-0258-00 ",.01)
 ;;00247-0258-00
 ;;9002226.02101,"718,00247-0258-00 ",.02)
 ;;00247-0258-00
 ;;9002226.02101,"718,00247-0258-04 ",.01)
 ;;00247-0258-04
 ;;9002226.02101,"718,00247-0258-04 ",.02)
 ;;00247-0258-04
 ;;9002226.02101,"718,00247-0258-06 ",.01)
 ;;00247-0258-06
 ;;9002226.02101,"718,00247-0258-06 ",.02)
 ;;00247-0258-06
 ;;9002226.02101,"718,00247-0258-10 ",.01)
 ;;00247-0258-10
 ;;9002226.02101,"718,00247-0258-10 ",.02)
 ;;00247-0258-10
 ;;9002226.02101,"718,00247-0258-14 ",.01)
 ;;00247-0258-14
 ;;9002226.02101,"718,00247-0258-14 ",.02)
 ;;00247-0258-14
 ;;9002226.02101,"718,00247-0258-20 ",.01)
 ;;00247-0258-20
 ;;9002226.02101,"718,00247-0258-20 ",.02)
 ;;00247-0258-20
 ;;9002226.02101,"718,00247-0258-28 ",.01)
 ;;00247-0258-28
 ;;9002226.02101,"718,00247-0258-28 ",.02)
 ;;00247-0258-28
 ;;9002226.02101,"718,00247-0258-30 ",.01)
 ;;00247-0258-30
 ;;9002226.02101,"718,00247-0258-30 ",.02)
 ;;00247-0258-30
 ;;9002226.02101,"718,00247-0258-40 ",.01)
 ;;00247-0258-40
 ;;9002226.02101,"718,00247-0258-40 ",.02)
 ;;00247-0258-40
 ;;9002226.02101,"718,00247-0258-47 ",.01)
 ;;00247-0258-47
 ;;9002226.02101,"718,00247-0258-47 ",.02)
 ;;00247-0258-47
 ;;9002226.02101,"718,00247-0258-90 ",.01)
 ;;00247-0258-90
 ;;9002226.02101,"718,00247-0258-90 ",.02)
 ;;00247-0258-90
 ;;9002226.02101,"718,00247-0696-10 ",.01)
 ;;00247-0696-10
 ;;9002226.02101,"718,00247-0696-10 ",.02)
 ;;00247-0696-10
 ;;9002226.02101,"718,00247-0696-14 ",.01)
 ;;00247-0696-14
 ;;9002226.02101,"718,00247-0696-14 ",.02)
 ;;00247-0696-14
 ;;9002226.02101,"718,00247-0696-20 ",.01)
 ;;00247-0696-20
 ;;9002226.02101,"718,00247-0696-20 ",.02)
 ;;00247-0696-20
 ;;9002226.02101,"718,00247-0696-28 ",.01)
 ;;00247-0696-28
 ;;9002226.02101,"718,00247-0696-28 ",.02)
 ;;00247-0696-28
 ;;9002226.02101,"718,00247-0696-30 ",.01)
 ;;00247-0696-30
 ;;9002226.02101,"718,00247-0696-30 ",.02)
 ;;00247-0696-30
 ;;9002226.02101,"718,00247-1872-00 ",.01)
 ;;00247-1872-00
 ;;9002226.02101,"718,00247-1872-00 ",.02)
 ;;00247-1872-00
 ;;9002226.02101,"718,00247-2071-00 ",.01)
 ;;00247-2071-00
 ;;9002226.02101,"718,00247-2071-00 ",.02)
 ;;00247-2071-00
 ;;9002226.02101,"718,00247-2071-02 ",.01)
 ;;00247-2071-02
 ;;9002226.02101,"718,00247-2071-02 ",.02)
 ;;00247-2071-02