BGPM5AQW ;IHS/MSC/SAT-CREATED BY ^ATXSTX ON AUG 16, 2011;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;**1**;JUN 27, 2011;Build 106
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"1005,24658024518 ",.01)
 ;;24658024518
 ;;9002226.02101,"1005,24658024518 ",.02)
 ;;24658024518
 ;;9002226.02101,"1005,24658024530 ",.01)
 ;;24658024530
 ;;9002226.02101,"1005,24658024530 ",.02)
 ;;24658024530
 ;;9002226.02101,"1005,24658024545 ",.01)
 ;;24658024545
 ;;9002226.02101,"1005,24658024545 ",.02)
 ;;24658024545
 ;;9002226.02101,"1005,24658024560 ",.01)
 ;;24658024560
 ;;9002226.02101,"1005,24658024560 ",.02)
 ;;24658024560
 ;;9002226.02101,"1005,24658024590 ",.01)
 ;;24658024590
 ;;9002226.02101,"1005,24658024590 ",.02)
 ;;24658024590
 ;;9002226.02101,"1005,26053008401 ",.01)
 ;;26053008401
 ;;9002226.02101,"1005,26053008401 ",.02)
 ;;26053008401
 ;;9002226.02101,"1005,26053013401 ",.01)
 ;;26053013401
 ;;9002226.02101,"1005,26053013401 ",.02)
 ;;26053013401
 ;;9002226.02101,"1005,26053015001 ",.01)
 ;;26053015001
 ;;9002226.02101,"1005,26053015001 ",.02)
 ;;26053015001
 ;;9002226.02101,"1005,26053017401 ",.01)
 ;;26053017401
 ;;9002226.02101,"1005,26053017401 ",.02)
 ;;26053017401
 ;;9002226.02101,"1005,26053017501 ",.01)
 ;;26053017501
 ;;9002226.02101,"1005,26053017501 ",.02)
 ;;26053017501
 ;;9002226.02101,"1005,26053017601 ",.01)
 ;;26053017601
 ;;9002226.02101,"1005,26053017601 ",.02)
 ;;26053017601
 ;;9002226.02101,"1005,26053020401 ",.01)
 ;;26053020401
 ;;9002226.02101,"1005,26053020401 ",.02)
 ;;26053020401
 ;;9002226.02101,"1005,26053020501 ",.01)
 ;;26053020501
 ;;9002226.02101,"1005,26053020501 ",.02)
 ;;26053020501
 ;;9002226.02101,"1005,26053023901 ",.01)
 ;;26053023901
 ;;9002226.02101,"1005,26053023901 ",.02)
 ;;26053023901
 ;;9002226.02101,"1005,26053025001 ",.01)
 ;;26053025001
 ;;9002226.02101,"1005,26053025001 ",.02)
 ;;26053025001
 ;;9002226.02101,"1005,26053028401 ",.01)
 ;;26053028401
 ;;9002226.02101,"1005,26053028401 ",.02)
 ;;26053028401
 ;;9002226.02101,"1005,26053028501 ",.01)
 ;;26053028501
 ;;9002226.02101,"1005,26053028501 ",.02)
 ;;26053028501
 ;;9002226.02101,"1005,26053028601 ",.01)
 ;;26053028601
 ;;9002226.02101,"1005,26053028601 ",.02)
 ;;26053028601
 ;;9002226.02101,"1005,26053028701 ",.01)
 ;;26053028701
 ;;9002226.02101,"1005,26053028701 ",.02)
 ;;26053028701
 ;;9002226.02101,"1005,26053028901 ",.01)
 ;;26053028901
 ;;9002226.02101,"1005,26053028901 ",.02)
 ;;26053028901
 ;;9002226.02101,"1005,26053029001 ",.01)
 ;;26053029001
 ;;9002226.02101,"1005,26053029001 ",.02)
 ;;26053029001
 ;;9002226.02101,"1005,26053034301 ",.01)
 ;;26053034301
 ;;9002226.02101,"1005,26053034301 ",.02)
 ;;26053034301
 ;;9002226.02101,"1005,26053034401 ",.01)
 ;;26053034401
 ;;9002226.02101,"1005,26053034401 ",.02)
 ;;26053034401
 ;;9002226.02101,"1005,26053034501 ",.01)
 ;;26053034501
 ;;9002226.02101,"1005,26053034501 ",.02)
 ;;26053034501
 ;;9002226.02101,"1005,26053034601 ",.01)
 ;;26053034601
 ;;9002226.02101,"1005,26053034601 ",.02)
 ;;26053034601
 ;;9002226.02101,"1005,26053043501 ",.01)
 ;;26053043501
 ;;9002226.02101,"1005,26053043501 ",.02)
 ;;26053043501
 ;;9002226.02101,"1005,26053043601 ",.01)
 ;;26053043601
 ;;9002226.02101,"1005,26053043601 ",.02)
 ;;26053043601
 ;;9002226.02101,"1005,27444004906 ",.01)
 ;;27444004906
 ;;9002226.02101,"1005,27444004906 ",.02)
 ;;27444004906
 ;;9002226.02101,"1005,27444004907 ",.01)
 ;;27444004907
 ;;9002226.02101,"1005,27444004907 ",.02)
 ;;27444004907
 ;;9002226.02101,"1005,27444004909 ",.01)
 ;;27444004909
 ;;9002226.02101,"1005,27444004909 ",.02)
 ;;27444004909
 ;;9002226.02101,"1005,27444005006 ",.01)
 ;;27444005006
 ;;9002226.02101,"1005,27444005006 ",.02)
 ;;27444005006
 ;;9002226.02101,"1005,27444005007 ",.01)
 ;;27444005007
 ;;9002226.02101,"1005,27444005007 ",.02)
 ;;27444005007
 ;;9002226.02101,"1005,27444005009 ",.01)
 ;;27444005009
 ;;9002226.02101,"1005,27444005009 ",.02)
 ;;27444005009
 ;;9002226.02101,"1005,27444005106 ",.01)
 ;;27444005106
 ;;9002226.02101,"1005,27444005106 ",.02)
 ;;27444005106
 ;;9002226.02101,"1005,27444005107 ",.01)
 ;;27444005107
 ;;9002226.02101,"1005,27444005107 ",.02)
 ;;27444005107
 ;;9002226.02101,"1005,27444005109 ",.01)
 ;;27444005109
 ;;9002226.02101,"1005,27444005109 ",.02)
 ;;27444005109
 ;;9002226.02101,"1005,27444005206 ",.01)
 ;;27444005206
 ;;9002226.02101,"1005,27444005206 ",.02)
 ;;27444005206
 ;;9002226.02101,"1005,27444005207 ",.01)
 ;;27444005207
 ;;9002226.02101,"1005,27444005207 ",.02)
 ;;27444005207
 ;;9002226.02101,"1005,27444005209 ",.01)
 ;;27444005209
 ;;9002226.02101,"1005,27444005209 ",.02)
 ;;27444005209
 ;;9002226.02101,"1005,27444020801 ",.01)
 ;;27444020801
 ;;9002226.02101,"1005,27444020801 ",.02)
 ;;27444020801
 ;;9002226.02101,"1005,27444020802 ",.01)
 ;;27444020802
 ;;9002226.02101,"1005,27444020802 ",.02)
 ;;27444020802
 ;;9002226.02101,"1005,27444020901 ",.01)
 ;;27444020901
 ;;9002226.02101,"1005,27444020901 ",.02)
 ;;27444020901
 ;;9002226.02101,"1005,27444020902 ",.01)
 ;;27444020902
 ;;9002226.02101,"1005,27444020902 ",.02)
 ;;27444020902
 ;;9002226.02101,"1005,31156504601 ",.01)
 ;;31156504601
 ;;9002226.02101,"1005,31156504601 ",.02)
 ;;31156504601
 ;;9002226.02101,"1005,31722020010 ",.01)
 ;;31722020010
 ;;9002226.02101,"1005,31722020010 ",.02)
 ;;31722020010
 ;;9002226.02101,"1005,31722020090 ",.01)
 ;;31722020090
 ;;9002226.02101,"1005,31722020090 ",.02)
 ;;31722020090
 ;;9002226.02101,"1005,31722020110 ",.01)
 ;;31722020110
 ;;9002226.02101,"1005,31722020110 ",.02)
 ;;31722020110
 ;;9002226.02101,"1005,31722020190 ",.01)
 ;;31722020190
 ;;9002226.02101,"1005,31722020190 ",.02)
 ;;31722020190
 ;;9002226.02101,"1005,31722020210 ",.01)
 ;;31722020210
 ;;9002226.02101,"1005,31722020210 ",.02)
 ;;31722020210
 ;;9002226.02101,"1005,31722020290 ",.01)
 ;;31722020290
 ;;9002226.02101,"1005,31722020290 ",.02)
 ;;31722020290
 ;;9002226.02101,"1005,33261041601 ",.01)
 ;;33261041601
 ;;9002226.02101,"1005,33261041601 ",.02)
 ;;33261041601
 ;;9002226.02101,"1005,33261041602 ",.01)
 ;;33261041602
 ;;9002226.02101,"1005,33261041602 ",.02)
 ;;33261041602
 ;;9002226.02101,"1005,33261041610 ",.01)
 ;;33261041610
 ;;9002226.02101,"1005,33261041610 ",.02)
 ;;33261041610
 ;;9002226.02101,"1005,33261041620 ",.01)
 ;;33261041620
 ;;9002226.02101,"1005,33261041620 ",.02)
 ;;33261041620
 ;;9002226.02101,"1005,33261041628 ",.01)
 ;;33261041628
 ;;9002226.02101,"1005,33261041628 ",.02)
 ;;33261041628
 ;;9002226.02101,"1005,33261041630 ",.01)
 ;;33261041630
 ;;9002226.02101,"1005,33261041630 ",.02)
 ;;33261041630
 ;;9002226.02101,"1005,33261041636 ",.01)
 ;;33261041636
 ;;9002226.02101,"1005,33261041636 ",.02)
 ;;33261041636
 ;;9002226.02101,"1005,33261041660 ",.01)
 ;;33261041660
 ;;9002226.02101,"1005,33261041660 ",.02)
 ;;33261041660
 ;;9002226.02101,"1005,33261041690 ",.01)
 ;;33261041690
 ;;9002226.02101,"1005,33261041690 ",.02)
 ;;33261041690
 ;;9002226.02101,"1005,33358012630 ",.01)
 ;;33358012630
 ;;9002226.02101,"1005,33358012630 ",.02)
 ;;33358012630
 ;;9002226.02101,"1005,33358012730 ",.01)
 ;;33358012730
 ;;9002226.02101,"1005,33358012730 ",.02)
 ;;33358012730
 ;;9002226.02101,"1005,33358012760 ",.01)
 ;;33358012760
 ;;9002226.02101,"1005,33358012760 ",.02)
 ;;33358012760
 ;;9002226.02101,"1005,33358012830 ",.01)
 ;;33358012830
 ;;9002226.02101,"1005,33358012830 ",.02)
 ;;33358012830
 ;;9002226.02101,"1005,33358012860 ",.01)
 ;;33358012860
 ;;9002226.02101,"1005,33358012860 ",.02)
 ;;33358012860
 ;;9002226.02101,"1005,33358021130 ",.01)
 ;;33358021130
 ;;9002226.02101,"1005,33358021130 ",.02)
 ;;33358021130
 ;;9002226.02101,"1005,33358021230 ",.01)
 ;;33358021230
 ;;9002226.02101,"1005,33358021230 ",.02)
 ;;33358021230
 ;;9002226.02101,"1005,33358021330 ",.01)
 ;;33358021330
 ;;9002226.02101,"1005,33358021330 ",.02)
 ;;33358021330
 ;;9002226.02101,"1005,33358021430 ",.01)
 ;;33358021430
 ;;9002226.02101,"1005,33358021430 ",.02)
 ;;33358021430
 ;;9002226.02101,"1005,33358021460 ",.01)
 ;;33358021460
 ;;9002226.02101,"1005,33358021460 ",.02)
 ;;33358021460
 ;;9002226.02101,"1005,35356006030 ",.01)
 ;;35356006030
 ;;9002226.02101,"1005,35356006030 ",.02)
 ;;35356006030
 ;;9002226.02101,"1005,35356010190 ",.01)
 ;;35356010190
 ;;9002226.02101,"1005,35356010190 ",.02)
 ;;35356010190
 ;;9002226.02101,"1005,35356013130 ",.01)
 ;;35356013130
 ;;9002226.02101,"1005,35356013130 ",.02)
 ;;35356013130
 ;;9002226.02101,"1005,35356021630 ",.01)
 ;;35356021630
 ;;9002226.02101,"1005,35356021630 ",.02)
 ;;35356021630
 ;;9002226.02101,"1005,35356021690 ",.01)
 ;;35356021690
 ;;9002226.02101,"1005,35356021690 ",.02)
 ;;35356021690
 ;;9002226.02101,"1005,35356025630 ",.01)
 ;;35356025630
 ;;9002226.02101,"1005,35356025630 ",.02)
 ;;35356025630
 ;;9002226.02101,"1005,35356025690 ",.01)
 ;;35356025690
 ;;9002226.02101,"1005,35356025690 ",.02)
 ;;35356025690
 ;;9002226.02101,"1005,35356025730 ",.01)
 ;;35356025730
 ;;9002226.02101,"1005,35356025730 ",.02)
 ;;35356025730
 ;;9002226.02101,"1005,35356025790 ",.01)
 ;;35356025790
 ;;9002226.02101,"1005,35356025790 ",.02)
 ;;35356025790
 ;;9002226.02101,"1005,35356025830 ",.01)
 ;;35356025830
 ;;9002226.02101,"1005,35356025830 ",.02)
 ;;35356025830
 ;;9002226.02101,"1005,35356025890 ",.01)
 ;;35356025890
 ;;9002226.02101,"1005,35356025890 ",.02)
 ;;35356025890
 ;;9002226.02101,"1005,35356028720 ",.01)
 ;;35356028720
 ;;9002226.02101,"1005,35356028720 ",.02)
 ;;35356028720
 ;;9002226.02101,"1005,35356028730 ",.01)
 ;;35356028730
 ;;9002226.02101,"1005,35356028730 ",.02)
 ;;35356028730
 ;;9002226.02101,"1005,35356028840 ",.01)
 ;;35356028840
 ;;9002226.02101,"1005,35356028840 ",.02)
 ;;35356028840
 ;;9002226.02101,"1005,35356028940 ",.01)
 ;;35356028940
 ;;9002226.02101,"1005,35356028940 ",.02)
 ;;35356028940
 ;;9002226.02101,"1005,35356029530 ",.01)
 ;;35356029530
 ;;9002226.02101,"1005,35356029530 ",.02)
 ;;35356029530
 ;;9002226.02101,"1005,35356029630 ",.01)
 ;;35356029630
 ;;9002226.02101,"1005,35356029630 ",.02)
 ;;35356029630
 ;;9002226.02101,"1005,35356029730 ",.01)
 ;;35356029730
 ;;9002226.02101,"1005,35356029730 ",.02)
 ;;35356029730
 ;;9002226.02101,"1005,35356029830 ",.01)
 ;;35356029830
 ;;9002226.02101,"1005,35356029830 ",.02)
 ;;35356029830
 ;;9002226.02101,"1005,35356029930 ",.01)
 ;;35356029930
 ;;9002226.02101,"1005,35356029930 ",.02)
 ;;35356029930
 ;;9002226.02101,"1005,35356030030 ",.01)
 ;;35356030030
 ;;9002226.02101,"1005,35356030030 ",.02)
 ;;35356030030
 ;;9002226.02101,"1005,35356037415 ",.01)
 ;;35356037415
 ;;9002226.02101,"1005,35356037415 ",.02)
 ;;35356037415
 ;;9002226.02101,"1005,35356037430 ",.01)
 ;;35356037430
 ;;9002226.02101,"1005,35356037430 ",.02)
 ;;35356037430
 ;;9002226.02101,"1005,35356040630 ",.01)
 ;;35356040630
 ;;9002226.02101,"1005,35356040630 ",.02)
 ;;35356040630
 ;;9002226.02101,"1005,35356040730 ",.01)
 ;;35356040730
 ;;9002226.02101,"1005,35356040730 ",.02)
 ;;35356040730
 ;;9002226.02101,"1005,35356042730 ",.01)
 ;;35356042730
 ;;9002226.02101,"1005,35356042730 ",.02)
 ;;35356042730
 ;;9002226.02101,"1005,35356042830 ",.01)
 ;;35356042830
 ;;9002226.02101,"1005,35356042830 ",.02)
 ;;35356042830
 ;;9002226.02101,"1005,35356054130 ",.01)
 ;;35356054130
 ;;9002226.02101,"1005,35356054130 ",.02)
 ;;35356054130
 ;;9002226.02101,"1005,35356087000 ",.01)
 ;;35356087000
 ;;9002226.02101,"1005,35356087000 ",.02)
 ;;35356087000
 ;;9002226.02101,"1005,35356087800 ",.01)
 ;;35356087800
 ;;9002226.02101,"1005,35356087800 ",.02)
 ;;35356087800
 ;;9002226.02101,"1005,35356088000 ",.01)
 ;;35356088000
 ;;9002226.02101,"1005,35356088000 ",.02)
 ;;35356088000
 ;;9002226.02101,"1005,37731504401 ",.01)
 ;;37731504401