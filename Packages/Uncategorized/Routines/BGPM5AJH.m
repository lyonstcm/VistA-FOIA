BGPM5AJH ;IHS/MSC/MMT-CREATED BY ^ATXSTX ON JUL 15, 2011;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;**1**;JUN 27, 2011;Build 106
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"889,23155011301 ",.01)
 ;;23155011301
 ;;9002226.02101,"889,23155011301 ",.02)
 ;;23155011301
 ;;9002226.02101,"889,23155011303 ",.01)
 ;;23155011303
 ;;9002226.02101,"889,23155011303 ",.02)
 ;;23155011303
 ;;9002226.02101,"889,23155011305 ",.01)
 ;;23155011305
 ;;9002226.02101,"889,23155011305 ",.02)
 ;;23155011305
 ;;9002226.02101,"889,23155011306 ",.01)
 ;;23155011306
 ;;9002226.02101,"889,23155011306 ",.02)
 ;;23155011306
 ;;9002226.02101,"889,23155011310 ",.01)
 ;;23155011310
 ;;9002226.02101,"889,23155011310 ",.02)
 ;;23155011310
 ;;9002226.02101,"889,23155011401 ",.01)
 ;;23155011401
 ;;9002226.02101,"889,23155011401 ",.02)
 ;;23155011401
 ;;9002226.02101,"889,23155011403 ",.01)
 ;;23155011403
 ;;9002226.02101,"889,23155011403 ",.02)
 ;;23155011403
 ;;9002226.02101,"889,23155011405 ",.01)
 ;;23155011405
 ;;9002226.02101,"889,23155011405 ",.02)
 ;;23155011405
 ;;9002226.02101,"889,23155011406 ",.01)
 ;;23155011406
 ;;9002226.02101,"889,23155011406 ",.02)
 ;;23155011406
 ;;9002226.02101,"889,23155011410 ",.01)
 ;;23155011410
 ;;9002226.02101,"889,23155011410 ",.02)
 ;;23155011410
 ;;9002226.02101,"889,23490013900 ",.01)
 ;;23490013900
 ;;9002226.02101,"889,23490013900 ",.02)
 ;;23490013900
 ;;9002226.02101,"889,23490013902 ",.01)
 ;;23490013902
 ;;9002226.02101,"889,23490013902 ",.02)
 ;;23490013902
 ;;9002226.02101,"889,23490013903 ",.01)
 ;;23490013903
 ;;9002226.02101,"889,23490013903 ",.02)
 ;;23490013903
 ;;9002226.02101,"889,23490013905 ",.01)
 ;;23490013905
 ;;9002226.02101,"889,23490013905 ",.02)
 ;;23490013905
 ;;9002226.02101,"889,23490013906 ",.01)
 ;;23490013906
 ;;9002226.02101,"889,23490013906 ",.02)
 ;;23490013906
 ;;9002226.02101,"889,23490013909 ",.01)
 ;;23490013909
 ;;9002226.02101,"889,23490013909 ",.02)
 ;;23490013909
 ;;9002226.02101,"889,23490014103 ",.01)
 ;;23490014103
 ;;9002226.02101,"889,23490014103 ",.02)
 ;;23490014103
 ;;9002226.02101,"889,23490014106 ",.01)
 ;;23490014106
 ;;9002226.02101,"889,23490014106 ",.02)
 ;;23490014106
 ;;9002226.02101,"889,23490014109 ",.01)
 ;;23490014109
 ;;9002226.02101,"889,23490014109 ",.02)
 ;;23490014109
 ;;9002226.02101,"889,23490021203 ",.01)
 ;;23490021203
 ;;9002226.02101,"889,23490021203 ",.02)
 ;;23490021203
 ;;9002226.02101,"889,23490021206 ",.01)
 ;;23490021206
 ;;9002226.02101,"889,23490021206 ",.02)
 ;;23490021206
 ;;9002226.02101,"889,23490021209 ",.01)
 ;;23490021209
 ;;9002226.02101,"889,23490021209 ",.02)
 ;;23490021209
 ;;9002226.02101,"889,23490046300 ",.01)
 ;;23490046300
 ;;9002226.02101,"889,23490046300 ",.02)
 ;;23490046300
 ;;9002226.02101,"889,23490046803 ",.01)
 ;;23490046803
 ;;9002226.02101,"889,23490046803 ",.02)
 ;;23490046803
 ;;9002226.02101,"889,23490046901 ",.01)
 ;;23490046901
 ;;9002226.02101,"889,23490046901 ",.02)
 ;;23490046901
 ;;9002226.02101,"889,23490053101 ",.01)
 ;;23490053101
 ;;9002226.02101,"889,23490053101 ",.02)
 ;;23490053101
 ;;9002226.02101,"889,23490091503 ",.01)
 ;;23490091503
 ;;9002226.02101,"889,23490091503 ",.02)
 ;;23490091503
 ;;9002226.02101,"889,23490091505 ",.01)
 ;;23490091505
 ;;9002226.02101,"889,23490091505 ",.02)
 ;;23490091505
 ;;9002226.02101,"889,23490091506 ",.01)
 ;;23490091506
 ;;9002226.02101,"889,23490091506 ",.02)
 ;;23490091506
 ;;9002226.02101,"889,23490091509 ",.01)
 ;;23490091509
 ;;9002226.02101,"889,23490091509 ",.02)
 ;;23490091509
 ;;9002226.02101,"889,23490091600 ",.01)
 ;;23490091600
 ;;9002226.02101,"889,23490091600 ",.02)
 ;;23490091600
 ;;9002226.02101,"889,23490091602 ",.01)
 ;;23490091602
 ;;9002226.02101,"889,23490091602 ",.02)
 ;;23490091602
 ;;9002226.02101,"889,23490091603 ",.01)
 ;;23490091603
 ;;9002226.02101,"889,23490091603 ",.02)
 ;;23490091603
 ;;9002226.02101,"889,23490091605 ",.01)
 ;;23490091605
 ;;9002226.02101,"889,23490091605 ",.02)
 ;;23490091605
 ;;9002226.02101,"889,23490091606 ",.01)
 ;;23490091606
 ;;9002226.02101,"889,23490091606 ",.02)
 ;;23490091606
 ;;9002226.02101,"889,23490091609 ",.01)
 ;;23490091609
 ;;9002226.02101,"889,23490091609 ",.02)
 ;;23490091609
 ;;9002226.02101,"889,23490104504 ",.01)
 ;;23490104504
 ;;9002226.02101,"889,23490104504 ",.02)
 ;;23490104504
 ;;9002226.02101,"889,23490104605 ",.01)
 ;;23490104605
 ;;9002226.02101,"889,23490104605 ",.02)
 ;;23490104605
 ;;9002226.02101,"889,23490104706 ",.01)
 ;;23490104706
 ;;9002226.02101,"889,23490104706 ",.02)
 ;;23490104706
 ;;9002226.02101,"889,23490104807 ",.01)
 ;;23490104807
 ;;9002226.02101,"889,23490104807 ",.02)
 ;;23490104807
 ;;9002226.02101,"889,23490106605 ",.01)
 ;;23490106605
 ;;9002226.02101,"889,23490106605 ",.02)
 ;;23490106605
 ;;9002226.02101,"889,23490106706 ",.01)
 ;;23490106706
 ;;9002226.02101,"889,23490106706 ",.02)
 ;;23490106706
 ;;9002226.02101,"889,23490116303 ",.01)
 ;;23490116303
 ;;9002226.02101,"889,23490116303 ",.02)
 ;;23490116303
 ;;9002226.02101,"889,23490116305 ",.01)
 ;;23490116305
 ;;9002226.02101,"889,23490116305 ",.02)
 ;;23490116305
 ;;9002226.02101,"889,23490116306 ",.01)
 ;;23490116306
 ;;9002226.02101,"889,23490116306 ",.02)
 ;;23490116306
 ;;9002226.02101,"889,23490116309 ",.01)
 ;;23490116309
 ;;9002226.02101,"889,23490116309 ",.02)
 ;;23490116309
 ;;9002226.02101,"889,23490509601 ",.01)
 ;;23490509601
 ;;9002226.02101,"889,23490509601 ",.02)
 ;;23490509601
 ;;9002226.02101,"889,23490509602 ",.01)
 ;;23490509602
 ;;9002226.02101,"889,23490509602 ",.02)
 ;;23490509602
 ;;9002226.02101,"889,23490509603 ",.01)
 ;;23490509603
 ;;9002226.02101,"889,23490509603 ",.02)
 ;;23490509603
 ;;9002226.02101,"889,23490509701 ",.01)
 ;;23490509701
 ;;9002226.02101,"889,23490509701 ",.02)
 ;;23490509701
 ;;9002226.02101,"889,23490509702 ",.01)
 ;;23490509702
 ;;9002226.02101,"889,23490509702 ",.02)
 ;;23490509702
 ;;9002226.02101,"889,23490509703 ",.01)
 ;;23490509703
 ;;9002226.02101,"889,23490509703 ",.02)
 ;;23490509703
 ;;9002226.02101,"889,23490509801 ",.01)
 ;;23490509801
 ;;9002226.02101,"889,23490509801 ",.02)
 ;;23490509801
 ;;9002226.02101,"889,23490509802 ",.01)
 ;;23490509802
 ;;9002226.02101,"889,23490509802 ",.02)
 ;;23490509802
 ;;9002226.02101,"889,23490592000 ",.01)
 ;;23490592000
 ;;9002226.02101,"889,23490592000 ",.02)
 ;;23490592000
 ;;9002226.02101,"889,23490592001 ",.01)
 ;;23490592001
 ;;9002226.02101,"889,23490592001 ",.02)
 ;;23490592001
 ;;9002226.02101,"889,23490592101 ",.01)
 ;;23490592101
 ;;9002226.02101,"889,23490592101 ",.02)
 ;;23490592101
 ;;9002226.02101,"889,23490592102 ",.01)
 ;;23490592102
 ;;9002226.02101,"889,23490592102 ",.02)
 ;;23490592102
 ;;9002226.02101,"889,23490620303 ",.01)
 ;;23490620303
 ;;9002226.02101,"889,23490620303 ",.02)
 ;;23490620303
 ;;9002226.02101,"889,23490620306 ",.01)
 ;;23490620306
 ;;9002226.02101,"889,23490620306 ",.02)
 ;;23490620306
 ;;9002226.02101,"889,23490620309 ",.01)
 ;;23490620309
 ;;9002226.02101,"889,23490620309 ",.02)
 ;;23490620309
 ;;9002226.02101,"889,23490650303 ",.01)
 ;;23490650303
 ;;9002226.02101,"889,23490650303 ",.02)
 ;;23490650303
 ;;9002226.02101,"889,23490650403 ",.01)
 ;;23490650403
 ;;9002226.02101,"889,23490650403 ",.02)
 ;;23490650403
 ;;9002226.02101,"889,23490650406 ",.01)
 ;;23490650406
 ;;9002226.02101,"889,23490650406 ",.02)
 ;;23490650406
 ;;9002226.02101,"889,23490650409 ",.01)
 ;;23490650409
 ;;9002226.02101,"889,23490650409 ",.02)
 ;;23490650409
 ;;9002226.02101,"889,23490786103 ",.01)
 ;;23490786103
 ;;9002226.02101,"889,23490786103 ",.02)
 ;;23490786103
 ;;9002226.02101,"889,24090047088 ",.01)
 ;;24090047088
 ;;9002226.02101,"889,24090047088 ",.02)
 ;;24090047088
 ;;9002226.02101,"889,24090047188 ",.01)
 ;;24090047188
 ;;9002226.02101,"889,24090047188 ",.02)
 ;;24090047188
 ;;9002226.02101,"889,24090047388 ",.01)
 ;;24090047388
 ;;9002226.02101,"889,24090047388 ",.02)
 ;;24090047388
 ;;9002226.02101,"889,24090047988 ",.01)
 ;;24090047988
 ;;9002226.02101,"889,24090047988 ",.02)
 ;;24090047988
 ;;9002226.02101,"889,24196054901 ",.01)
 ;;24196054901
 ;;9002226.02101,"889,24196054901 ",.02)
 ;;24196054901
 ;;9002226.02101,"889,24196054905 ",.01)
 ;;24196054905
 ;;9002226.02101,"889,24196054905 ",.02)
 ;;24196054905
 ;;9002226.02101,"889,24196055001 ",.01)
 ;;24196055001
 ;;9002226.02101,"889,24196055001 ",.02)
 ;;24196055001
 ;;9002226.02101,"889,24196055005 ",.01)
 ;;24196055005
 ;;9002226.02101,"889,24196055005 ",.02)
 ;;24196055005
 ;;9002226.02101,"889,24196055101 ",.01)
 ;;24196055101
 ;;9002226.02101,"889,24196055101 ",.02)
 ;;24196055101
 ;;9002226.02101,"889,24196056801 ",.01)
 ;;24196056801
 ;;9002226.02101,"889,24196056801 ",.02)
 ;;24196056801
 ;;9002226.02101,"889,24196056810 ",.01)
 ;;24196056810
 ;;9002226.02101,"889,24196056810 ",.02)
 ;;24196056810
 ;;9002226.02101,"889,24196058001 ",.01)
 ;;24196058001
 ;;9002226.02101,"889,24196058001 ",.02)
 ;;24196058001
 ;;9002226.02101,"889,24196058010 ",.01)
 ;;24196058010
 ;;9002226.02101,"889,24196058010 ",.02)
 ;;24196058010
 ;;9002226.02101,"889,24196058101 ",.01)
 ;;24196058101
 ;;9002226.02101,"889,24196058101 ",.02)
 ;;24196058101
 ;;9002226.02101,"889,24196058110 ",.01)
 ;;24196058110
 ;;9002226.02101,"889,24196058110 ",.02)
 ;;24196058110
 ;;9002226.02101,"889,24196074430 ",.01)
 ;;24196074430
 ;;9002226.02101,"889,24196074430 ",.02)
 ;;24196074430
 ;;9002226.02101,"889,24200074051 ",.01)
 ;;24200074051
 ;;9002226.02101,"889,24200074051 ",.02)
 ;;24200074051
 ;;9002226.02101,"889,24236001402 ",.01)
 ;;24236001402
 ;;9002226.02101,"889,24236001402 ",.02)
 ;;24236001402
 ;;9002226.02101,"889,24236009002 ",.01)
 ;;24236009002
 ;;9002226.02101,"889,24236009002 ",.02)
 ;;24236009002
 ;;9002226.02101,"889,24236011202 ",.01)
 ;;24236011202
 ;;9002226.02101,"889,24236011202 ",.02)
 ;;24236011202
 ;;9002226.02101,"889,24236016202 ",.01)
 ;;24236016202
 ;;9002226.02101,"889,24236016202 ",.02)
 ;;24236016202
 ;;9002226.02101,"889,24236017602 ",.01)
 ;;24236017602
 ;;9002226.02101,"889,24236017602 ",.02)
 ;;24236017602
 ;;9002226.02101,"889,24236017902 ",.01)
 ;;24236017902
 ;;9002226.02101,"889,24236017902 ",.02)
 ;;24236017902
 ;;9002226.02101,"889,24236018502 ",.01)
 ;;24236018502
 ;;9002226.02101,"889,24236018502 ",.02)
 ;;24236018502
 ;;9002226.02101,"889,24236019502 ",.01)
 ;;24236019502
 ;;9002226.02101,"889,24236019502 ",.02)
 ;;24236019502
 ;;9002226.02101,"889,24236022002 ",.01)
 ;;24236022002
 ;;9002226.02101,"889,24236022002 ",.02)
 ;;24236022002
 ;;9002226.02101,"889,24236024302 ",.01)
 ;;24236024302
 ;;9002226.02101,"889,24236024302 ",.02)
 ;;24236024302
 ;;9002226.02101,"889,24236031802 ",.01)
 ;;24236031802
 ;;9002226.02101,"889,24236031802 ",.02)
 ;;24236031802
 ;;9002226.02101,"889,24236037002 ",.01)
 ;;24236037002
 ;;9002226.02101,"889,24236037002 ",.02)
 ;;24236037002
 ;;9002226.02101,"889,24236037402 ",.01)
 ;;24236037402
 ;;9002226.02101,"889,24236037402 ",.02)
 ;;24236037402
 ;;9002226.02101,"889,24236040302 ",.01)
 ;;24236040302
 ;;9002226.02101,"889,24236040302 ",.02)
 ;;24236040302
 ;;9002226.02101,"889,24236042802 ",.01)
 ;;24236042802
 ;;9002226.02101,"889,24236042802 ",.02)
 ;;24236042802
 ;;9002226.02101,"889,24236044302 ",.01)
 ;;24236044302
 ;;9002226.02101,"889,24236044302 ",.02)
 ;;24236044302
 ;;9002226.02101,"889,24236055302 ",.01)
 ;;24236055302
 ;;9002226.02101,"889,24236055302 ",.02)
 ;;24236055302
 ;;9002226.02101,"889,24236068802 ",.01)
 ;;24236068802
 ;;9002226.02101,"889,24236068802 ",.02)
 ;;24236068802
 ;;9002226.02101,"889,24236069802 ",.01)
 ;;24236069802
 ;;9002226.02101,"889,24236069802 ",.02)
 ;;24236069802