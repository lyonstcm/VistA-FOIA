BGP7LXED ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON AUG 28, 2006 ;
 ;;7.0;IHS CLINICAL REPORTING;;JAN 24, 2007
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"621,00904-1795-60 ",.01)
 ;;00904-1795-60
 ;;9002226.02101,"621,00904-1795-60 ",.02)
 ;;00904-1795-60
 ;;9002226.02101,"621,00904-1795-61 ",.01)
 ;;00904-1795-61
 ;;9002226.02101,"621,00904-1795-61 ",.02)
 ;;00904-1795-61
 ;;9002226.02101,"621,00904-1795-80 ",.01)
 ;;00904-1795-80
 ;;9002226.02101,"621,00904-1795-80 ",.02)
 ;;00904-1795-80
 ;;9002226.02101,"621,00904-1796-60 ",.01)
 ;;00904-1796-60
 ;;9002226.02101,"621,00904-1796-60 ",.02)
 ;;00904-1796-60
 ;;9002226.02101,"621,00904-1796-61 ",.01)
 ;;00904-1796-61
 ;;9002226.02101,"621,00904-1796-61 ",.02)
 ;;00904-1796-61
 ;;9002226.02101,"621,00904-1796-80 ",.01)
 ;;00904-1796-80
 ;;9002226.02101,"621,00904-1796-80 ",.02)
 ;;00904-1796-80
 ;;9002226.02101,"621,00904-1797-60 ",.01)
 ;;00904-1797-60
 ;;9002226.02101,"621,00904-1797-60 ",.02)
 ;;00904-1797-60
 ;;9002226.02101,"621,00904-1797-61 ",.01)
 ;;00904-1797-61
 ;;9002226.02101,"621,00904-1797-61 ",.02)
 ;;00904-1797-61
 ;;9002226.02101,"621,00904-1798-61 ",.01)
 ;;00904-1798-61
 ;;9002226.02101,"621,00904-1798-61 ",.02)
 ;;00904-1798-61
 ;;9002226.02101,"621,00904-1799-40 ",.01)
 ;;00904-1799-40
 ;;9002226.02101,"621,00904-1799-40 ",.02)
 ;;00904-1799-40
 ;;9002226.02101,"621,00904-1799-60 ",.01)
 ;;00904-1799-60
 ;;9002226.02101,"621,00904-1799-60 ",.02)
 ;;00904-1799-60
 ;;9002226.02101,"621,00904-1800-61 ",.01)
 ;;00904-1800-61
 ;;9002226.02101,"621,00904-1800-61 ",.02)
 ;;00904-1800-61
 ;;9002226.02101,"621,00904-1801-80 ",.01)
 ;;00904-1801-80
 ;;9002226.02101,"621,00904-1801-80 ",.02)
 ;;00904-1801-80
 ;;9002226.02101,"621,00904-1802-61 ",.01)
 ;;00904-1802-61
 ;;9002226.02101,"621,00904-1802-61 ",.02)
 ;;00904-1802-61
 ;;9002226.02101,"621,00904-1803-61 ",.01)
 ;;00904-1803-61
 ;;9002226.02101,"621,00904-1803-61 ",.02)
 ;;00904-1803-61
 ;;9002226.02101,"621,00904-1804-61 ",.01)
 ;;00904-1804-61
 ;;9002226.02101,"621,00904-1804-61 ",.02)
 ;;00904-1804-61
 ;;9002226.02101,"621,00904-1805-61 ",.01)
 ;;00904-1805-61
 ;;9002226.02101,"621,00904-1805-61 ",.02)
 ;;00904-1805-61
 ;;9002226.02101,"621,00904-1806-61 ",.01)
 ;;00904-1806-61
 ;;9002226.02101,"621,00904-1806-61 ",.02)
 ;;00904-1806-61
 ;;9002226.02101,"621,00904-1808-20 ",.01)
 ;;00904-1808-20
 ;;9002226.02101,"621,00904-1808-20 ",.02)
 ;;00904-1808-20
 ;;9002226.02101,"621,00904-1809-20 ",.01)
 ;;00904-1809-20
 ;;9002226.02101,"621,00904-1809-20 ",.02)
 ;;00904-1809-20
 ;;9002226.02101,"621,00904-5240-60 ",.01)
 ;;00904-5240-60
 ;;9002226.02101,"621,00904-5240-60 ",.02)
 ;;00904-5240-60
 ;;9002226.02101,"621,00904-5241-60 ",.01)
 ;;00904-5241-60
 ;;9002226.02101,"621,00904-5241-60 ",.02)
 ;;00904-5241-60
 ;;9002226.02101,"621,00904-5242-60 ",.01)
 ;;00904-5242-60
 ;;9002226.02101,"621,00904-5242-60 ",.02)
 ;;00904-5242-60
 ;;9002226.02101,"621,00904-7649-60 ",.01)
 ;;00904-7649-60
 ;;9002226.02101,"621,00904-7649-60 ",.02)
 ;;00904-7649-60
 ;;9002226.02101,"621,10877-0379-26 ",.01)
 ;;10877-0379-26
 ;;9002226.02101,"621,10877-0379-26 ",.02)
 ;;10877-0379-26
 ;;9002226.02101,"621,10939-0153-01 ",.01)
 ;;10939-0153-01
 ;;9002226.02101,"621,10939-0153-01 ",.02)
 ;;10939-0153-01
 ;;9002226.02101,"621,10939-0254-22 ",.01)
 ;;10939-0254-22
 ;;9002226.02101,"621,10939-0254-22 ",.02)
 ;;10939-0254-22
 ;;9002226.02101,"621,11540-0379-26 ",.01)
 ;;11540-0379-26
 ;;9002226.02101,"621,11540-0379-26 ",.02)
 ;;11540-0379-26
 ;;9002226.02101,"621,11845-0430-04 ",.01)
 ;;11845-0430-04
 ;;9002226.02101,"621,11845-0430-04 ",.02)
 ;;11845-0430-04
 ;;9002226.02101,"621,11845-0430-13 ",.01)
 ;;11845-0430-13
 ;;9002226.02101,"621,11845-0430-13 ",.02)
 ;;11845-0430-13
 ;;9002226.02101,"621,11845-0430-94 ",.01)
 ;;11845-0430-94
 ;;9002226.02101,"621,11845-0430-94 ",.02)
 ;;11845-0430-94
 ;;9002226.02101,"621,11845-0893-04 ",.01)
 ;;11845-0893-04
 ;;9002226.02101,"621,11845-0893-04 ",.02)
 ;;11845-0893-04
 ;;9002226.02101,"621,12333-9072-19 ",.01)
 ;;12333-9072-19
 ;;9002226.02101,"621,12333-9072-19 ",.02)
 ;;12333-9072-19
 ;;9002226.02101,"621,12333-9072-29 ",.01)
 ;;12333-9072-29
 ;;9002226.02101,"621,12333-9072-29 ",.02)
 ;;12333-9072-29
 ;;9002226.02101,"621,12810-0379-26 ",.01)
 ;;12810-0379-26
 ;;9002226.02101,"621,12810-0379-26 ",.02)
 ;;12810-0379-26
 ;;9002226.02101,"621,12810-0379-34 ",.01)
 ;;12810-0379-34
 ;;9002226.02101,"621,12810-0379-34 ",.02)
 ;;12810-0379-34
 ;;9002226.02101,"621,14615-8943-01 ",.01)
 ;;14615-8943-01
 ;;9002226.02101,"621,14615-8943-01 ",.02)
 ;;14615-8943-01
 ;;9002226.02101,"621,15127-0002-09 ",.01)
 ;;15127-0002-09
 ;;9002226.02101,"621,15127-0002-09 ",.02)
 ;;15127-0002-09
 ;;9002226.02101,"621,17022-2243-03 ",.01)
 ;;17022-2243-03
 ;;9002226.02101,"621,17022-2243-03 ",.02)
 ;;17022-2243-03
 ;;9002226.02101,"621,17022-2243-07 ",.01)
 ;;17022-2243-07
 ;;9002226.02101,"621,17022-2243-07 ",.02)
 ;;17022-2243-07
 ;;9002226.02101,"621,17022-2243-09 ",.01)
 ;;17022-2243-09
 ;;9002226.02101,"621,17022-2243-09 ",.02)
 ;;17022-2243-09
 ;;9002226.02101,"621,17022-2265-03 ",.01)
 ;;17022-2265-03
 ;;9002226.02101,"621,17022-2265-03 ",.02)
 ;;17022-2265-03
 ;;9002226.02101,"621,17022-2265-07 ",.01)
 ;;17022-2265-07
 ;;9002226.02101,"621,17022-2265-07 ",.02)
 ;;17022-2265-07
 ;;9002226.02101,"621,17022-2265-09 ",.01)
 ;;17022-2265-09
 ;;9002226.02101,"621,17022-2265-09 ",.02)
 ;;17022-2265-09
 ;;9002226.02101,"621,17022-4839-04 ",.01)
 ;;17022-4839-04
 ;;9002226.02101,"621,17022-4839-04 ",.02)
 ;;17022-4839-04
 ;;9002226.02101,"621,17022-4840-04 ",.01)
 ;;17022-4840-04
 ;;9002226.02101,"621,17022-4840-04 ",.02)
 ;;17022-4840-04
 ;;9002226.02101,"621,17236-0231-01 ",.01)
 ;;17236-0231-01
 ;;9002226.02101,"621,17236-0231-01 ",.02)
 ;;17236-0231-01
 ;;9002226.02101,"621,17236-0231-05 ",.01)
 ;;17236-0231-05
 ;;9002226.02101,"621,17236-0231-05 ",.02)
 ;;17236-0231-05
 ;;9002226.02101,"621,17236-0231-10 ",.01)
 ;;17236-0231-10
 ;;9002226.02101,"621,17236-0231-10 ",.02)
 ;;17236-0231-10
 ;;9002226.02101,"621,17236-0233-01 ",.01)
 ;;17236-0233-01
 ;;9002226.02101,"621,17236-0233-01 ",.02)
 ;;17236-0233-01
 ;;9002226.02101,"621,17236-0233-05 ",.01)
 ;;17236-0233-05
 ;;9002226.02101,"621,17236-0233-05 ",.02)
 ;;17236-0233-05
 ;;9002226.02101,"621,17236-0233-10 ",.01)
 ;;17236-0233-10
 ;;9002226.02101,"621,17236-0233-10 ",.02)
 ;;17236-0233-10
 ;;9002226.02101,"621,17236-0301-01 ",.01)
 ;;17236-0301-01
 ;;9002226.02101,"621,17236-0301-01 ",.02)
 ;;17236-0301-01
 ;;9002226.02101,"621,17236-0301-10 ",.01)
 ;;17236-0301-10
 ;;9002226.02101,"621,17236-0301-10 ",.02)
 ;;17236-0301-10
 ;;9002226.02101,"621,17236-0302-01 ",.01)
 ;;17236-0302-01
 ;;9002226.02101,"621,17236-0302-01 ",.02)
 ;;17236-0302-01
 ;;9002226.02101,"621,17236-0302-10 ",.01)
 ;;17236-0302-10
 ;;9002226.02101,"621,17236-0302-10 ",.02)
 ;;17236-0302-10
 ;;9002226.02101,"621,17236-0305-01 ",.01)
 ;;17236-0305-01
 ;;9002226.02101,"621,17236-0305-01 ",.02)
 ;;17236-0305-01
 ;;9002226.02101,"621,17236-0305-10 ",.01)
 ;;17236-0305-10
 ;;9002226.02101,"621,17236-0305-10 ",.02)
 ;;17236-0305-10
 ;;9002226.02101,"621,17236-0318-01 ",.01)
 ;;17236-0318-01
 ;;9002226.02101,"621,17236-0318-01 ",.02)
 ;;17236-0318-01
 ;;9002226.02101,"621,17236-0318-10 ",.01)
 ;;17236-0318-10
 ;;9002226.02101,"621,17236-0318-10 ",.02)
 ;;17236-0318-10
 ;;9002226.02101,"621,17236-0776-16 ",.01)
 ;;17236-0776-16
 ;;9002226.02101,"621,17236-0776-16 ",.02)
 ;;17236-0776-16
 ;;9002226.02101,"621,17236-0776-28 ",.01)
 ;;17236-0776-28
 ;;9002226.02101,"621,17236-0776-28 ",.02)
 ;;17236-0776-28
 ;;9002226.02101,"621,17236-0776-44 ",.01)
 ;;17236-0776-44
 ;;9002226.02101,"621,17236-0776-44 ",.02)
 ;;17236-0776-44
 ;;9002226.02101,"621,19458-3792-04 ",.01)
 ;;19458-3792-04
 ;;9002226.02101,"621,19458-3792-04 ",.02)
 ;;19458-3792-04
 ;;9002226.02101,"621,25077-5521-30 ",.01)
 ;;25077-5521-30
 ;;9002226.02101,"621,25077-5521-30 ",.02)
 ;;25077-5521-30
 ;;9002226.02101,"621,37097-0379-26 ",.01)
 ;;37097-0379-26
 ;;9002226.02101,"621,37097-0379-26 ",.02)
 ;;37097-0379-26
 ;;9002226.02101,"621,37097-0379-34 ",.01)
 ;;37097-0379-34
 ;;9002226.02101,"621,37097-0379-34 ",.02)
 ;;37097-0379-34
 ;;9002226.02101,"621,37205-0379-26 ",.01)
 ;;37205-0379-26
 ;;9002226.02101,"621,37205-0379-26 ",.02)
 ;;37205-0379-26
 ;;9002226.02101,"621,38245-0608-14 ",.01)
 ;;38245-0608-14
 ;;9002226.02101,"621,38245-0608-14 ",.02)
 ;;38245-0608-14
 ;;9002226.02101,"621,38726-0379-26 ",.01)
 ;;38726-0379-26
 ;;9002226.02101,"621,38726-0379-26 ",.02)
 ;;38726-0379-26
 ;;9002226.02101,"621,41240-0379-26 ",.01)
 ;;41240-0379-26
 ;;9002226.02101,"621,41240-0379-26 ",.02)
 ;;41240-0379-26
 ;;9002226.02101,"621,41280-0200-93 ",.01)
 ;;41280-0200-93
 ;;9002226.02101,"621,41280-0200-93 ",.02)
 ;;41280-0200-93
 ;;9002226.02101,"621,41280-0223-30 ",.01)
 ;;41280-0223-30
 ;;9002226.02101,"621,41280-0223-30 ",.02)
 ;;41280-0223-30
 ;;9002226.02101,"621,44514-0419-18 ",.01)
 ;;44514-0419-18
 ;;9002226.02101,"621,44514-0419-18 ",.02)
 ;;44514-0419-18
 ;;9002226.02101,"621,46703-0065-05 ",.01)
 ;;46703-0065-05
 ;;9002226.02101,"621,46703-0065-05 ",.02)
 ;;46703-0065-05
 ;;9002226.02101,"621,46703-0066-01 ",.01)
 ;;46703-0066-01
 ;;9002226.02101,"621,46703-0066-01 ",.02)
 ;;46703-0066-01
 ;;9002226.02101,"621,48135-0038-70 ",.01)
 ;;48135-0038-70
 ;;9002226.02101,"621,48135-0038-70 ",.02)
 ;;48135-0038-70
 ;;9002226.02101,"621,49137-0642-04 ",.01)
 ;;49137-0642-04
 ;;9002226.02101,"621,49137-0642-04 ",.02)
 ;;49137-0642-04
 ;;9002226.02101,"621,49884-0013-01 ",.01)
 ;;49884-0013-01
 ;;9002226.02101,"621,49884-0013-01 ",.02)
 ;;49884-0013-01
 ;;9002226.02101,"621,49884-0013-05 ",.01)
 ;;49884-0013-05
 ;;9002226.02101,"621,49884-0013-05 ",.02)
 ;;49884-0013-05
 ;;9002226.02101,"621,49884-0013-10 ",.01)
 ;;49884-0013-10
 ;;9002226.02101,"621,49884-0013-10 ",.02)
 ;;49884-0013-10
 ;;9002226.02101,"621,49884-0014-01 ",.01)
 ;;49884-0014-01
 ;;9002226.02101,"621,49884-0014-01 ",.02)
 ;;49884-0014-01
 ;;9002226.02101,"621,49884-0014-05 ",.01)
 ;;49884-0014-05
 ;;9002226.02101,"621,49884-0014-05 ",.02)
 ;;49884-0014-05
 ;;9002226.02101,"621,49884-0014-10 ",.01)
 ;;49884-0014-10
 ;;9002226.02101,"621,49884-0014-10 ",.02)
 ;;49884-0014-10
 ;;9002226.02101,"621,49999-0024-12 ",.01)
 ;;49999-0024-12
 ;;9002226.02101,"621,49999-0024-12 ",.02)
 ;;49999-0024-12
 ;;9002226.02101,"621,49999-0024-24 ",.01)
 ;;49999-0024-24
 ;;9002226.02101,"621,49999-0024-24 ",.02)
 ;;49999-0024-24
 ;;9002226.02101,"621,49999-0024-30 ",.01)
 ;;49999-0024-30
 ;;9002226.02101,"621,49999-0024-30 ",.02)
 ;;49999-0024-30
 ;;9002226.02101,"621,49999-0035-24 ",.01)
 ;;49999-0035-24
 ;;9002226.02101,"621,49999-0035-24 ",.02)
 ;;49999-0035-24
 ;;9002226.02101,"621,49999-0035-30 ",.01)
 ;;49999-0035-30
 ;;9002226.02101,"621,49999-0035-30 ",.02)
 ;;49999-0035-30
 ;;9002226.02101,"621,49999-0035-60 ",.01)
 ;;49999-0035-60
 ;;9002226.02101,"621,49999-0035-60 ",.02)
 ;;49999-0035-60
 ;;9002226.02101,"621,50313-0107-04 ",.01)
 ;;50313-0107-04
 ;;9002226.02101,"621,50313-0107-04 ",.02)
 ;;50313-0107-04
 ;;9002226.02101,"621,50752-0264-05 ",.01)
 ;;50752-0264-05
 ;;9002226.02101,"621,50752-0264-05 ",.02)
 ;;50752-0264-05
 ;;9002226.02101,"621,50752-0264-06 ",.01)
 ;;50752-0264-06
 ;;9002226.02101,"621,50752-0264-06 ",.02)
 ;;50752-0264-06
 ;;9002226.02101,"621,50752-0264-09 ",.01)
 ;;50752-0264-09
 ;;9002226.02101,"621,50752-0264-09 ",.02)
 ;;50752-0264-09
 ;;9002226.02101,"621,50752-0265-05 ",.01)
 ;;50752-0265-05
 ;;9002226.02101,"621,50752-0265-05 ",.02)
 ;;50752-0265-05
 ;;9002226.02101,"621,50752-0266-05 ",.01)
 ;;50752-0266-05
 ;;9002226.02101,"621,50752-0266-05 ",.02)
 ;;50752-0266-05
 ;;9002226.02101,"621,50752-0266-06 ",.01)
 ;;50752-0266-06
 ;;9002226.02101,"621,50752-0266-06 ",.02)
 ;;50752-0266-06
 ;;9002226.02101,"621,50752-0266-09 ",.01)
 ;;50752-0266-09
 ;;9002226.02101,"621,50752-0266-09 ",.02)
 ;;50752-0266-09
 ;;9002226.02101,"621,50752-0267-05 ",.01)
 ;;50752-0267-05
 ;;9002226.02101,"621,50752-0267-05 ",.02)
 ;;50752-0267-05
 ;;9002226.02101,"621,50752-0267-06 ",.01)
 ;;50752-0267-06
 ;;9002226.02101,"621,50752-0267-06 ",.02)
 ;;50752-0267-06
 ;;9002226.02101,"621,50752-0267-09 ",.01)
 ;;50752-0267-09
 ;;9002226.02101,"621,50752-0267-09 ",.02)
 ;;50752-0267-09
 ;;9002226.02101,"621,50752-0268-05 ",.01)
 ;;50752-0268-05
 ;;9002226.02101,"621,50752-0268-05 ",.02)
 ;;50752-0268-05
 ;;9002226.02101,"621,50752-0268-06 ",.01)
 ;;50752-0268-06
 ;;9002226.02101,"621,50752-0268-06 ",.02)
 ;;50752-0268-06
 ;;9002226.02101,"621,50752-0268-09 ",.01)
 ;;50752-0268-09
 ;;9002226.02101,"621,50752-0268-09 ",.02)
 ;;50752-0268-09
 ;;9002226.02101,"621,50752-0270-05 ",.01)
 ;;50752-0270-05
 ;;9002226.02101,"621,50752-0270-05 ",.02)
 ;;50752-0270-05
 ;;9002226.02101,"621,50752-0270-06 ",.01)
 ;;50752-0270-06
 ;;9002226.02101,"621,50752-0270-06 ",.02)
 ;;50752-0270-06
 ;;9002226.02101,"621,51079-0565-19 ",.01)
 ;;51079-0565-19
 ;;9002226.02101,"621,51079-0565-19 ",.02)
 ;;51079-0565-19
 ;;9002226.02101,"621,51079-0565-20 ",.01)
 ;;51079-0565-20
 ;;9002226.02101,"621,51079-0565-20 ",.02)
 ;;51079-0565-20
 ;;9002226.02101,"621,51079-0566-20 ",.01)
 ;;51079-0566-20
 ;;9002226.02101,"621,51079-0566-20 ",.02)
 ;;51079-0566-20
 ;;9002226.02101,"621,51079-0567-20 ",.01)
 ;;51079-0567-20
 ;;9002226.02101,"621,51079-0567-20 ",.02)
 ;;51079-0567-20
 ;;9002226.02101,"621,51079-0580-20 ",.01)
 ;;51079-0580-20
 ;;9002226.02101,"621,51079-0580-20 ",.02)
 ;;51079-0580-20