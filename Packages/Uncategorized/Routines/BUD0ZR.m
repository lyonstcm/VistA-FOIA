BUD0ZR ;IHS/CMI/LAB-CREATED BY ^ATXSTX ON DEC 13, 2010;
 ;;5.0;IHS/RPMS UNIFORM DATA SYSTEM;;JAN 18, 2011;Build 12
 ;;BUD MMR CONTRAINDICATIONS
 ;
 ; This routine loads Taxonomy BUD MMR CONTRAINDICATIONS
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 D OTHER
 I $O(^TMP("ATX",$J,3.6,0)) D BULL^ATXSTX2
 I $O(^TMP("ATX",$J,9002226,0)) D TAX^ATXSTX2
 D KILL^ATXSTX2
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;21,"042. ")
 ;;1
 ;;21,"079.53 ")
 ;;2
 ;;21,"200.00 ")
 ;;3
 ;;21,"203.0 ")
 ;;4
 ;;21,"204.0 ")
 ;;5
 ;;21,"279.00 ")
 ;;6
 ;;21,"V08. ")
 ;;7
 ;;9002226,951,.01)
 ;;BUD MMR CONTRAINDICATIONS
 ;;9002226,951,.02)
 ;;@
 ;;9002226,951,.04)
 ;;@
 ;;9002226,951,.06)
 ;;@
 ;;9002226,951,.08)
 ;;0
 ;;9002226,951,.09)
 ;;3101130
 ;;9002226,951,.11)
 ;;@
 ;;9002226,951,.12)
 ;;31
 ;;9002226,951,.13)
 ;;1
 ;;9002226,951,.14)
 ;;@
 ;;9002226,951,.15)
 ;;80
 ;;9002226,951,.16)
 ;;@
 ;;9002226,951,.17)
 ;;@
 ;;9002226,951,3101)
 ;;@
 ;;9002226.02101,"951,042. ",.01)
 ;;042. 
 ;;9002226.02101,"951,042. ",.02)
 ;;042.9 
 ;;9002226.02101,"951,079.53 ",.01)
 ;;079.53 
 ;;9002226.02101,"951,079.53 ",.02)
 ;;079.53 
 ;;9002226.02101,"951,200.00 ",.01)
 ;;200.00 
 ;;9002226.02101,"951,200.00 ",.02)
 ;;202.98 
 ;;9002226.02101,"951,203.0 ",.01)
 ;;203.0 
 ;;9002226.02101,"951,203.0 ",.02)
 ;;203.81 
 ;;9002226.02101,"951,204.0 ",.01)
 ;;204.0 
 ;;9002226.02101,"951,204.0 ",.02)
 ;;208.91 
 ;;9002226.02101,"951,279.00 ",.01)
 ;;279.00 
 ;;9002226.02101,"951,279.00 ",.02)
 ;;279.9 
 ;;9002226.02101,"951,V08. ",.01)
 ;;V08. 
 ;;9002226.02101,"951,V08. ",.02)
 ;;V08. 
 ;
OTHER ; OTHER ROUTINES
 Q